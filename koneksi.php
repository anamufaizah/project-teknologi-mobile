<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$conn = mysqli_connect('localhost', 'root', '', 'akademik');

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $kueri = "SELECT nim, nama, prodi FROM mahasiswa";
    $hasil = mysqli_query($conn, $kueri);
    $mhs = [];
    while ($row = mysqli_fetch_assoc($hasil)) {
        $mhs[] = $row;
    }
    echo json_encode($mhs);
} elseif ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nim = $_POST['xnim'];
    $nama = $_POST['xnama'];
    $prodi = $_POST['xprodi'];

    $kueri = "INSERT INTO mahasiswa (nim, nama, prodi) VALUES ('$nim', '$nama', '$prodi')";
    
    if (mysqli_query($conn, $kueri)) {
        echo json_encode(array("message" => "Simpan Berhasil!"));
    } else {
        echo json_encode(array("message" => "Simpan Gagal!", "error" => mysqli_error($conn)));
    }
}

mysqli_close($conn);
