<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meu Site</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div class="terminal">
        <header>
            <div class="terminal-header">
                <span class="terminal-button close"></span>
                <span class="terminal-button minimize"></span>
                <span class="terminal-button maximize"></span>
                <span class="terminal-title">user@localhost: ~</span>
            </div>
        </header>
        <div class="cabecalho">
            <div class="terminal-body">
                <p class="terminal-text">$ Bem-vindo ao meu terminal!</p>
                <p class="terminal-text">$ Esse é o resultado do meu script rodando!</p>
            </div>
            <div class="imagem">
                <img src="assets/p.png" alt="penguim Linux"/>
            </div>
        </div>
        <div class="ballom">
           <?php
              $nome = $_SERVER['SERVER_NAME'];
              $ip = $_SERVER['SERVER_ADDR'];
              echo "<b>O Servidor ".$ip." está prestando este atendimento! </b>";
           ?>
       </div>
    </div>
</body>
</html>
