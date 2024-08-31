<?php

// Recebe os parâmetros do formulário HTML
$id = $_POST['id'];
$nome = $_POST['nome'];
$telefone = $_POST['telefone'];
$endereco = $_POST['endereco'];

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
$stmt = $conn->prepare("INSERT INTO clientes (id, nome, telefone, endereco) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $id, $nome, $telefone, $endereco);
$stmt->execute();


echo "Novo registro inserido com sucesso";
echo '<a href="Listar_clientes
.php">Ir para Listar Cadastros Pessoa</a>';

// Fecha a conexão
$stmt->close();
$conn->close();
?>