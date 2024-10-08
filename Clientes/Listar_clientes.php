<?php
$servername = "localhost";
$username = "root"; // Altere para o seu usuário MySQL
$password = ""; // Altere para a sua senha MySQL
$dbname = "petshop"; // Altere para o nome do seu banco de dados

// Cria conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// Checa a conexão
if ($conn->connect_error) {
    die("Falha na conexão: " . $conn->connect_error);
}

// Consulta SQL para selecionar todos os registros
$sql = "SELECT id, nome, telefone, endereco FROM clientes";
$result = $conn->query($sql);

// Exibe a tabela HTML
echo "<!DOCTYPE html>
<html lang='pt-BR'>
<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Lista de Produtos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
<a href=\"/Petshop\">Voltar </a>
<a href=\"Cadastrar_clientes.html\">Cadastrar </a>
    <h2>Lista de pessoas</h2>";

if ($result->num_rows > 0) {
    echo "<table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Telefone</th>
                    <th>Endereço</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>";

    // Saída dos dados de cada linha
    while($row = $result->fetch_assoc()) {
        echo "<tr>
                <td>" . htmlspecialchars($row["id"]) . "</td>
                <td>" . htmlspecialchars($row["nome"]) . "</td>
                <td>" . htmlspecialchars($row["telefone"]) . "</td>
                <td>" . htmlspecialchars($row["endereco"]) . "</td>
                <td><a href=\"excluir_clientes.php?id=".$row["id"]."\">Excluir</a></td>
              </tr>";
    }

    echo "  </tbody>
        </table>";
} else {
    echo "0 resultados";
}

echo "</body>
</html>";

// Fecha a conexão
$conn->close();
?>