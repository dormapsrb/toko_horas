<?php
    // include DB connection file
    include '../../../../../helper/connection.php';

    // mendapatkan nilai dari form

    $id_barang        = $_POST['id_barang'];
    $nama_barang     = $_POST['nama_barang'];
    $id_kategori    = $_POST['id_kategori'];
    $stok           = $_POST['stok'];
    $berat          = $_POST['berat'];
    $harga          = $_POST['harga'];
    $deskripsi      = $_POST['deskripsi'];

    $nama_folder    = "images";
    $nama_file      = $_FILES["gambar"]["name"];
    $tmp            = $_FILES["gambar"]["tmp_name"];
    $path           = "../../../../../$nama_folder/$nama_file";
    $tipe_file      = array("image/jpeg","image/png","image/jpg");

    $query = "INSERT INTO barang VALUES ('$id_barang','$nama_barang','$id_kategori','$stok','$berat','$harga','$deskripsi','$nama_file',0)";

    if(!in_array($_FILES["gambar"]["type"],$tipe_file) && $nama_file != "")
    {
        $error = urldecode("Cek kembali ekstensi file anda (*.jpg,*.gif,*.png)");
        header("Location:../table_barang.php?error=$error");
    }
    else if(in_array($_FILES["gambar"]["type"],$tipe_file) && $nama_file != "")
    {
        if (mysqli_query($con, $query))
        {
            move_uploaded_file($tmp,$path);
            header("Location:../table_barang.php");
        }
        else
        {
            $error = urldecode("Data tidak berhasil ditambahkan");
            header("Location:../table_barang.php?error=$error");
        }
    mysqli_close($con);
    }
    
    // menjalankan query isi data
    // if (mysqli_query($con, $query))
    // {
    //     header("Location:../table_barang.php");
    // }
    // else
    // {
    //     $error = urldecode("Data tidak berhasil ditambahkan");
    //     header("Location:../table_barang.php?error=$error");
    // }

    // mysqli_close($con);

?>