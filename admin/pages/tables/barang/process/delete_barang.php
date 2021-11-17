<?php
    // include DB connection file
    include '../../../../../helper/connection.php';

    // mendapatkan nilai dari form
    $id_barang = $_GET['id_barang'];

    $query = "UPDATE barang SET deleted = 1 WHERE id_barang = '$id_barang'";

    // menjalankan query isi data
    if (mysqli_query($con, $query))
    {
        header("Location:../table_barang.php");
    }
    else
    {
        $error = urldecode("Data tidak berhasil dihapus");
        header("Location:../table_barang.php?error=$error");
    }

    mysqli_close($con);
?>