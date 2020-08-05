<?php
  session_start(); //セッション変数を使うための宣言
  require '../header.php'; 
  $_SESSION['token'] = token();
?>
<p>商品を追加します。</p>
<form action="insert-output2.php" method="post">
商品名<input type="text" name="name">
価格<input type="text" name="price">
<input type="submit" value="追加">

<!--CSRF対策-->
<input type="hidden" name="token" value="<?=$_SESSION['token']?>">

</form>
<?php require '../footer.php'; ?>
