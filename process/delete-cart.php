<?php 
session_start();
$id_barang = $_GET["id_barang"];

$jumlahx = 0;

foreach ($_SESSION["keranjang"] as $id_barang => $jumlah) 
{
	$jumlahx++;
}

if($jumlahx == 1)
{
    unset($_SESSION['keranjang']);
    unset($_SESSION['nomor']); 
}
else
{
    unset($_SESSION["keranjang"][$id_barang]);
}

header('location:../cart.php');
?>