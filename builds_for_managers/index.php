
<?php
 
 $result="";

 foreach ($_POST as $key => $value) {
   $result.=$value. "\n";
 }
  file_put_contents('data.txt',$result);
?>
