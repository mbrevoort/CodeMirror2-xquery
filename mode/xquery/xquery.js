CodeMirror.defineMode("xquery", function(config, parserConfig) {

  var keywords = function(){
    function kw(type) {return {type: type, style: "keyword"};}
    var A = kw("keyword a"), B = kw("keyword b"), C = kw("keyword c");
    var operator = kw("operator"), atom = {type: "atom", style: "atom"};
    var kwObj = {
      'if': A, 'switch': A, 'while': A, 'for': A,
      'else': B, 'then': B, 'try': B, 'finally': B,
      'element': C, 'attribute': C, 'let': C, 'implements': C, 'import': C, 'module': C, 'namespace': C, 'return': C, 'super': C, 'this': C, 'throws': C, 'where': C,
      'eq': operator, 'ne': operator, 'lt': operator, 'le': operator, 'gt': operator, 'ge': operator,
      'null': atom, 'fn:false()': atom, 'fn:true()': atom,      
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
    
    if (ch == "(") {
      if (stream.eat(":")) {
        return chain(stream, state, tokenComment);
      }
    }
    else if(ch == "$") {
      return chain(stream, state, tokenVariable);
    }
    else {
      stream.eatWhile(/[\w\$_]/);
      var word = stream.current(), known = keywords.propertyIsEnumerable(word) && keywords[word];
      return known ? ret(known.type, known.style, word) :
                     ret("word", "word", word);
    }
  }

  // handle the remainder of a comment until it's closed
  function tokenComment(stream, state) {
    var maybeEnd = false, ch;
    while (ch = stream.next()) {
      if (ch == ")" && maybeEnd) {
        state.tokenize = tokenBase;
        break;
      }
      maybeEnd = (ch == ":");
    }
    return ret("comment", "comment");
  }
  
  function tokenVariable(stream, state) {
    var isVariableChar = /[\w\$_-]/;
    stream.eatWhile(isVariableChar);
    state.tokenize = tokenBase;
    return ret("variable", "variable");
  }


  // the interface for the mode API
  return {
    startState: function(basecolumn) {
      return {
        tokenize: tokenBase
      };
    },

    token: function(stream, state) {
      if (stream.eatSpace()) return null;
      var style = state.tokenize(stream, state);
      if (type == "comment") return style;
      return style;
    }
  };

});

CodeMirror.defineMIME("application/xquery", "xquery");
