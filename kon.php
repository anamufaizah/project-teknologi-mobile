<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, PUT, DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cuci_sepatu";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $kueri = "SELECT * FROM pesanan";
    $hasil = $conn->query($kueri);
    $pesanan = [];
    while ($row = $hasil->fetch_assoc()) {
        $pesanan[] = $row;
    }
    echo json_encode($pesanan);
} elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $jenis_sepatu = $_POST['jenis_sepatu'];
    $nama = $_POST['nama'];
    $alamat = $_POST['alamat'];
    $no_telefon = $_POST['no_telefon'];
    $email = $_POST['email'];

    $sql = "INSERT INTO pesanan (jenis_sepatu, nama, alamat, no_telefon, email) VALUES ('$jenis_sepatu', '$nama', '$alamat', '$no_telefon', '$email')";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["message" => "Record added successfully"]);
    } else {
        echo json_encode(["message" => "Error: " . $sql . "<br>" . $conn->error]);
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    parse_str(file_get_contents("php://input"), $_PUT);
    $id = $_PUT['id'];
    $jenis_sepatu = $_PUT['jenis_sepatu'];
    $nama = $_PUT['nama'];
    $alamat = $_PUT['alamat'];
    $no_telefon = $_PUT['no_telefon'];
    $email = $_PUT['email'];

    $sql = "UPDATE pesanan SET jenis_sepatu='$jenis_sepatu', nama='$nama', alamat='$alamat', no_telefon='$no_telefon', email='$email' WHERE id='$id'";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["message" => "Record updated successfully"]);
    } else {
        echo json_encode(["message" => "Error: " . $sql . "<br>" . $conn->error]);
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);
    $jenis_sepatu = $_DELETE['jenis_sepatu'];

    $sql = "DELETE FROM pesanan WHERE jenis_sepatu='$jenis_sepatu'";
    if ($conn->query($sql) === TRUE) {
        echo json_encode(["message" => "Record deleted successfully"]);
    } else {
        echo json_encode(["message" => "Error: " . $sql . "<br>" . $conn->error]);
    }
}

$conn->close();
?>
