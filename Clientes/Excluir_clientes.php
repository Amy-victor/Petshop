<?php

// Recebe os parâmetros do formulário HTML
$id = $_GET['id'];

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "petshop"; 

// Cria conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Checa a conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Prepara e vincula
$stmt = $conn->prepare("DELETE FROM clientes WHERE id='".$id."'");
$stmt->execute();


echo "Registro excluído com sucesso";
echo '<a href="Listar_clientes
.php">Ir para Listar Cadastros Pessoa</a>';

// Fecha a conexão
$stmt->close();
$conn->close();
?>