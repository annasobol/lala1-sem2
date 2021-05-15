<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h1>Статистику работы в сети выбранного клиента</h1>
	<form method="POST" action="results_1.php">
<?php
$db_driver="mysql";
$host = "localhost";
$database = "L1";
$dsn = "$db_driver:host=$host; dbname=$database";
$username = "root";
$password = "";

$dbh = new PDO ($dsn, $username, $password,
	[PDO::ATTR_PERSISTENT => true,
	PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8']
);
$sql = "SELECT * FROM client";
echo "<select name=\"id\">";
foreach ($dbh->query($sql) as $row) {
echo "<option value=\"{$row['id_client']}\">
{$row['id_client']}, {$row['name']}</option>
";
}
echo "</select><br>";
?>
	<input type="submit">
	</form>

	<h1>Статистику работы в сети за указанный промежуток времени</h1>
	<form method="POST" action="results_2.php">
		<input type="date" name="date_start">-
		<input type="date" name="date_end"><br>
		<input type="submit">
	</form>

	<h1>Вывести список клиентов с отрицательным балансом счета</h1>
	<form method="POST" action="results_3.php">
		<input type="submit">
	</form>
</body>
</html>