
<?php
 
 $result="";
 $error=false;
 foreach ($_POST as $key => $value) {
   if($value=='error') {
     $error=true;
   }
   $result.=$value. "\n";
 }
 file_put_contents('data.txt',$result);
 if($error) {
   header("HTTP/1.1 404 Not Found");
 }
?>
