CodeMirror.defineMode("xquery", function(config, parserConfig) {

  var keywords = function(){
    function kw(type) {return {type: type, style: "keyword"};}
    var A = kw("keyword a"), B = kw("keyword b"), C = kw("keyword c");
    var operator = kw("operator"), atom = {type: "atom", style: "atom"};
    var kwObj = {
      'if': A, 'switch': A, 'while': A, 'for': A,
      'else': B, 'then': B, 'try': B, 'finally': B, 'catch': B,
      'element': C, 'attribute': C, 'let': C, 'implements': C, 'import': C, 'module': C, 'namespace': C, 
      'return': C, 'super': C, 'this': C, 'throws': C, 'where': C, 'private': C,
      'eq': operator, 'ne': operator, 'lt': operator, 'le': operator, 'gt': operator, 'ge': operator, ':=': operator,
      'null': atom, 'fn:false()': atom, 'fn:true()': atom
    };
    var basic = ['after','ancestor','ancestor-or-self','and','as','ascending','assert','attribute','before',
    'by','case','cast','child','comment','declare','default','define','descendant','descendant-or-self',
    'descending','document-node','element','else','eq','every','except','external','following',
    'following-sibling','follows','for','function','if','import','in','instance','intersect','item',
    'let','module','namespace','node','node','of','only','or','order','parent','precedes','preceding',
    'preceding-sibling','processing-instruction','ref','return','returns','satisfies','schema','schema-element',
    'self','some','sortby','stable','text','then','to','treat','typeswitch','union','variable','version','where',
    'xquery'];
    for(var i=0, l=basic.length; i < l; i++) { kwObj[basic[i]] = kw(basic[i])};
    
    var types = ['xs:string', 'xs:float', 'xs:decimal', 'xs:double', 'xs:integer', 'xs:boolean', 'xs:date', 'xs:dateTime', 
    'xs:time', 'xs:duration', 'xs:dayTimeDuration', 'xs:time', 'xs:yearMonthDuration', 'numeric', 'xs:hexBinary', 
    'xs:base64Binary', 'xs:anyURI', 'xs:QName', 'xs:byte','xs:boolean','xs:anyURI','xf:yearMonthDuration'];
    for(var i=0, l=types.length; i < l; i++) { kwObj[types[i]] = atom;};
    
    return kwObj;
  }();

  // Used as scratch variables to communicate multiple values without
  // consing up tons of objects.
  var type, content;
  function ret(tp, style, cont) {
    type = tp; content = cont;
    return style;
  }
  
  function chain(stream, state, f) {
    state.tokenize = f;
    return f(stream, state);
  }
  
  function tokenBase(stream, state) {
    var ch = stream.next();
    
    if (ch == "<") {
      var isclose = stream.eat("/");;
      stream.eatSpace();
      tagName = "";
      var c;
      while ((c = stream.eat(/[^\s\u00a0=<>\"\'\/?]/))) tagName += c;
      return chain(stream, state, tokenTag(tagName, isclose));
      // state.tokenize = inTag;
      // return "tag";
    }
    else if(ch == "{") {
      state.stack.push({ type: "codeblock"});
      return ret("bracket", "bracket");
    }
    else if(ch == "}") {
      state.stack.pop();
      return ret("bracket", "bracket");
    }
    // if we're in an XML block
    else if(isInXmlBlock(state)) {
      if(ch == ">")
        return ret("tag", "tag");
      else  
        return ret("word", "word");
    }
    else if (ch == "(") {
      if (stream.eat(":")) {
        return chain(stream, state, tokenComment);
      }
    }
    else if (ch == '"' || ch == "'")
      return chain(stream, state, tokenString(ch));
    
    else if(ch == "$") {
      return chain(stream, state, tokenVariable);
    }
    else if(ch ==":" && stream.eat("=")) {
      return ret("operator", "keyword");
    }
    else {
      stream.eatWhile(/[\w\$_:]/);
      var word = stream.current(), known = keywords.propertyIsEnumerable(word) && keywords[word];
      console.log(word, known);
      return known ? ret(known.type, known.style, word) :
                     ret("word", "word", word);
    }
  }

  // handle comments, including nested 
  function tokenComment(stream, state) {
    var maybeEnd = false, maybeNested = false, nestedCount = 0, ch;
    while (ch = stream.next()) {
      if (ch == ")" && maybeEnd) {
        if(nestedCount > 0)
          nestedCount--;
        else {
          state.tokenize = tokenBase;
          break;
        }
      }
      else if(ch == ":" && maybeNested) {
        nestedCount++;
      }
      maybeEnd = (ch == ":");
      maybeNested = (ch == "(");
    }
    return ret("comment", "comment");
  }

  // handle string literals
  function tokenString(quote) {
    return function(stream, state) {
      var escaped = false, ch;
      while (ch = stream.next()) {
        if (ch ==  quote && !escaped) {
          state.tokenize = tokenBase;
          break;
        }
        escaped = (ch == "\\");
      }
      return ret("string", "string");
    };
  }
  
  function tokenVariable(stream, state) {
    var isVariableChar = /[\w\$_-]/;
    stream.eatWhile(isVariableChar);
    state.tokenize = tokenBase;
    return ret("variable", "variable");
  }
  
  function tokenTag(name, isclose) {
    return function(stream, state) {
      stream.eatSpace();
      if(isclose && stream.eat(">")) {
        state.stack.pop();
        state.tokenize = tokenBase;
        return ret("tag", "tag");
      }
      state.stack.push({ type: "tag", name: name });
      if(!stream.eat(">")) {
        state.tokenize = tokenAttribute;
        return ret("tag", "tag");
      }
      else {
        state.tokenize = tokenBase;        
      }
      return ret("tag", "tag");
    }
  }

  function tokenAttribute(stream, state) {
    stream.eat(/[a-zA-Z_:]/);
    stream.eatWhile(/[-a-zA-Z0-9_:.]/);
    stream.eatSpace();
    if(stream.peek(">"))
      state.tokenize = tokenBase;
    return ret("attribute", "attribute");
  }
  
  function isInXmlBlock(state) {
    return (state.stack.length && state.stack[state.stack.length - 1].type == "tag");
  }
  
  function isInCodeBlock(state) {
    return (state.stack.length && state.stack[state.stack.length - 1].type == "codeblock");
  }

  // the interface for the mode API
  return {
    startState: function(basecolumn) {
      return {
        tokenize: tokenBase,
        cc: [],
        stack: []
      };
    },

    token: function(stream, state) {
      if (stream.eatSpace()) return null;
      var style = state.tokenize(stream, state);
      //if (type == "comment") return style;
      return style;
    }
  };

});

CodeMirror.defineMIME("application/xquery", "xquery");
