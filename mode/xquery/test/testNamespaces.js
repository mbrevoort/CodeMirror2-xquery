$(document).ready(function(){
  module("test namespaces");
  test("testEQName variable", function() {
    expect(1);

    var input = 'declare variable $"http://www.example.com/ns/my":var := 12;\
<out>{$"http://www.example.com/ns/my":var}</out>';

    var expected = '<span class="cm-keyword">declare</span> <span class="cm-keyword">variable</span> <span class="cm-variable">$"http://www.example.com/ns/my":var</span> <span class="cm-keyword">:=</span> <span class="cm-atom">12</span><span class="cm-word">;</span><span class="cm-tag">&lt;out&gt;</span>{<span class="cm-variable">$"http://www.example.com/ns/my":var</span>}<span class="cm-tag">&lt;/out&gt;</span>';

    $("#sandbox").html('<textarea id="editor">' + input + '</textarea>');
    var editor = CodeMirror.fromTextArea($("#editor")[0]);
    var result = $(".CodeMirror-lines div div pre")[0].innerHTML;

     equals(expected, result);
     $("#editor").html("");
  });

  test("test namespaced variable", function() {
    expect(1);

    var input = 'declare namespace e = "http://example.com/ANamespace";\
declare variable $e:exampleComThisVarIsNotRecognized as element(*) external;';

    var expected = '<span class="cm-keyword">declare</span> <span class="cm-keyword">namespace</span> <span class="cm-variable xquery-function">e</span> <span class="cm-keyword">=</span> <span class="cm-string">"http://example.com/ANamespace"</span><span class="cm-variable xquery-function">;declare</span> <span class="cm-keyword">variable</span> <span class="cm-variable">$e:exampleComThisVarIsNotRecognized</span> <span class="cm-keyword">as</span> <span class="cm-keyword">element</span>(<span class="cm-keyword">*</span>) <span class="cm-word">external;</span>';

    $("#sandbox").html('<textarea id="editor">' + input + '</textarea>');
    var editor = CodeMirror.fromTextArea($("#editor")[0]);
    var result = $(".CodeMirror-lines div div pre")[0].innerHTML;
    console.log(result);

     equals(expected, result);
     $("#editor").html("");
  });


});


