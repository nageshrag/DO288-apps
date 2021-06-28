
<?php
 
 $result="";

 foreach ($_POST as $key => $value) {
   if($value=='error') {
     throw new Exception("Error occured");
   }
   $result.=$value. "\n";
 }
  file_put_contents('data.txt',$result);
?>
