# **📌 balanceador-cloud**  
**Automacao de Servidor Web (Apache + PHP) + Frontend. Projeto desenvolvido para aprender conceitos de cloud e Linux.**  

---

## **📋 Descricao**  
Este projeto automatiza a instalacao e configuracao de um servidor web Apache com suporte a PHP e um frontend personalizado. O objetivo e facilitar a implantacao rapida de um ambiente web funcional.  

O servico estara disponivel em:  
```
http://www.jp.com
```

---

## **⚙️ Pre-requisitos**  
- Sistema operacional baseado em Red Hat (CentOS, Fedora, RHEL).  
- Acesso root ou permissoes `sudo`.  
- Conexao com a internet para instalacao de pacotes.  

---

## **🔍 Configuracao do Arquivo `hosts`**  
Para acessar o servico pelo DNS `www.jp.com`, edite o arquivo `hosts` no seu computador e adicione a seguinte linha:  

### **Windows**  
1. Abrir o Bloco de Notas como Administrador.  
2. Editar o arquivo:  
   ```
   C:\Windows\System32\drivers\etc\hosts
   ```
3. Adicionar a linha:  
   ```
   IP(Coloque o DNAT)   www.jp.com
   ```
4. Salvar o arquivo e fechar.  

### **Linux/Mac**  
1. Abrir o terminal e editar o arquivo `hosts`:  
   ```bash
   sudo nano /etc/hosts
   ```
2. Adicionar a linha:  
   ```
   192.168.1.100   www.jp.com
   ```
3. Salvar o arquivo (`Ctrl + X`, `Y`, `Enter`).  

Agora, ao acessar `http://www.jp.com` no navegador, voce sera redirecionado para o servidor configurado.  

---

