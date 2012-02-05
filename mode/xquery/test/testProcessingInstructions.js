$(document).ready(function(){
  module("testProcessingInstructions");
  test("testProcessingInstructions", function() {
    expect(1);

    var input = 'data(<?target content?>) instance of xs:string';
    var expected = '<span class="cm-variable xquery-function">data</span>(<span class="cm-comment xquery-pi">&lt;?target content?&gt;</span>) <span class="cm-keyword">instance</span> <span class="cm-keyword">of</span> <span class="cm-atom">xs:string</span>';

    $("#sandbox").html('<textarea id="editor">' + input + '</textarea>');
    var editor = CodeMirror.fromTextArea($("#editor")[0]);
    var result = $(".CodeMirror-lines div div pre")[0].innerHTML;

     equals(result, expected);
     $("#editor").html("");
  });
});
