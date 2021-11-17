<?php
include 'helper/connection.php';
session_start();

$id_barang = $_GET['id_barang'];
$_SESSION['nomor']+=1;

//sudah ada
if(isset($_SESSION['keranjang'][$id_barang]))
{
    $_SESSION['keranjang'][$id_barang]+=1;
    
}
//belum ada
else
{
    $_SESSION['keranjang'][$id_barang] = 1;
}

header("location:../cart.php");

?>