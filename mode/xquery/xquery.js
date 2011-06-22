CodeMirror.defineMode("xquery", function(config, parserConfig) {

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
    else {
      stream.eatWhile(/[\w\$_]/);
      return "word";
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
      return "word";
    }
  };

});

CodeMirror.defineMIME("application/xquery", "xquery");
