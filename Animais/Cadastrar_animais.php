<?php
// Configurações do banco de dados
$host = 'localhost';
$dbname = 'petshop';
$username = "root";
$password = "";

try {
    // Conectar ao banco de dados
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Consultar a tabela clientes
    $stmt = $pdo->query('SELECT id, nome FROM clientes');
    $clientes = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo 'Conexão falhou: ' . $e->getMessage();
}
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Selecionar Cliente</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
            font-weight: bold;
            color: #555;
        }
        select, input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-top: 5px;
            width: 100%;
            box-sizing: border-box;
        }
        select {
            cursor: pointer;
        }
        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 15px;
            font-size: 16px;
            color: #ffffff;
            background-color: #4CAF50;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        input[type="hidden"] {
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Animais</h1>
        <form action="Salvar_animais.php" method="POST">
            <label for="cliente">Cliente:</label>
            <select id="cliente" name="cliente">
                <option value="">Selecione um cliente</option>
                <?php foreach ($clientes as $cliente): ?>
                    <option value="<?php echo htmlspecialchars($cliente['id']); ?>">
                        <?php echo htmlspecialchars($cliente['nome']); ?>
                    </option>

                <?php endforeach; ?>
            </select>
            
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" value="" required>
            
            <label for="especie">Espécie:</label>
            <input type="text" id="especie" name="especie" value="" required>
            
            <label for="raca">Raca:</label>
            <input type="text" id="raca" name="raca" value="" require>
            
            <input type="hidden" name="id" value="">
            
            <input type="submit" value="Salvar">
        </form>
    </div>
</body>
</html>
