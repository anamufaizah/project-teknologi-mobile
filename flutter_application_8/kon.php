<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, PUT"); // Include PUT method
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "hotel3";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $kueri = "SELECT * FROM kamar";
    $hasil = $conn->query($kueri);
    $kamar = [];
    while ($row = $hasil->fetch_assoc()) {
        $kamar[] = $row;
    }
    echo json_encode($kamar);
} elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['action']) && $_POST['action'] === 'delete') {
        $nomor = $_POST['nomor'];
        $sql = "DELETE FROM kamar WHERE nomor='$nomor'";
        if ($conn->query($sql) === TRUE) {
            echo json_encode(["message" => "Record deleted successfully"]);
        } else {
            echo json_encode(["message" => "Error: " . $sql . "<br>" . $conn->error]);
        }
    } else {
        $nomor = $_POST['nomor'];
        $nama = $_POST['nama'];
        $tipe = $_POST['tipe'];
        $harga = $_POST['harga'];
        $keterangan = $_POST['keterangan']; // New field
    
        $sql = "INSERT INTO kamar (nomor, nama, tipe, harga, keterangan) VALUES ('$nomor', '$nama', '$tipe', '$harga', '$keterangan')";
    
        if ($conn->query($sql) === TRUE) {
            echo json_encode(["message" => "Record added successfully"]);
        } else {
            echo json_encode(["message" => "Error: " . $sql . "<br>" . $conn->error]);
        }
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    parse_str(file_get_contents("php://input"), $_PUT);
    $nomor = $_PUT['nomor'];
    $nama = $_PUT['nama'];
    $tipe = $_PUT['tipe'];
    $harga = $_PUT['harga'];
    $keterangan = $_PUT['keterangan']; // New field

    $sql = "UPDATE kamar SET nama='$nama', tipe='$tipe', harga='$harga', keterangan='$keterangan' WHERE nomor='$nomor'";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(["message" => "Record updated successfully"]);
    } else {
        echo json_encode(["message" => "Error: " . $sql . "<br>" . $conn->error]);
    }
}

$conn->close();
?>
