(:*******************************************************:)
(: Test: K2-DefaultNamespaceProlog-12                    :)
(: Written by: Frans Englich                             :)
(: Date: 2007-11-22T11:31:21+01:00                       :)
(: Purpose: Ensure that default namespaces override each other properly. :)
(:*******************************************************:)
<a xmlns="http://www.w3.org/2001/XMLSchema">
    {1 cast as byte}
    <b xmlns="http://www.w3.org/1999/XSL/Transform">
        {count(1), 2 cast as byte}
    </b>
    {2 cast as byte}
</a>