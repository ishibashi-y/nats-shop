<?php 
session_start(); //セッション変数を使うための宣言
require '../header.php';  
require_once 'connect.php'; 

$sql=$pdo->prepare('insert into product values(null, ?, ?)');

if ( $_POST['token'] != $_SESSION['token']) {
	//サーバーに保存したトークンと送信されたトークンが一致しない
	echo '不正な処理です｡'; 	//CSRF対策

} elseif (empty($_REQUEST['name'])) {
	echo '商品名を入力してください。';

} elseif (!preg_match('/[0-9]+/', $_REQUEST['price'])) {
	echo '商品価格を整数で入力してください。';

} elseif ($sql->execute(
	[htmlspecialchars($_REQUEST['name']), $_REQUEST['price']]
)) {
	echo '追加に成功しました。';
} else {
	echo '追加に失敗しました。';
}

//セッションはブラウザが閉じられるまで消えないので､消しておく
$_SESSION['token'] = null;

?>
<?php require '../footer.php'; ?>