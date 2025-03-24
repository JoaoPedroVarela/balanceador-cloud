###################################################

# Define o nome do pacote do Apache (httpd)
webserver='httpd'

# Verifica se o Apache já está instalado
if rpm -q "$webserver" &>/dev/null; then
    # Se o Apache estiver instalado, remove o pacote
    yum -y remove "$webserver"
fi

# Instala o Apache (httpd)
yum -y install "$webserver"

# Define o nome do pacote do PHP
language='php'

# Verifica se o PHP já está instalado
if rpm -q "$language" &>/dev/null; then
    # Se o PHP estiver instalado, remove o pacote
    yum -y remove "$language"
fi

# Instala o PHP
yum -y install "$language"

################################################

# Obtém o hostname da máquina (nome do servidor)
hostname=$(hostname)

# Define o diretório onde o site será hospedado
site_dir="/var/www/html/$hostname.com"

# Cria o diretório do site, se ele não existir
mkdir -p "$site_dir"

# Copia todos os arquivos do diretório /etc/content/ para o diretório do site
cp -r /etc/content/* "$site_dir/"

# Define as permissões corretas para o diretório do site
# O usuário e grupo "apache" terão permissão de leitura e execução
chown -R apache:apache "$site_dir"
chmod -R 755 /var/www

##########################################

# Define o caminho do arquivo de configuração do Virtual Host
vhost_file="/etc/httpd/conf.d/$hostname.com.conf"

# Cria o arquivo de configuração do Virtual Host
cat <<EOF > "$vhost_file"
<VirtualHost *:80>
    # Define o nome do servidor (domínio)
    ServerName www.$hostname.com

    # Define o diretório raiz do site
    DocumentRoot $site_dir

    # Define os arquivos de índice (página inicial)
    DirectoryIndex index.php index.html
</VirtualHost>
EOF

##########################################

# Verifica se a porta 80 já está configurada no firewall
if ! firewall-cmd --list-ports | grep -q "80/tcp"; then
    # Adiciona a porta 80 (HTTP) ao firewall de forma permanente
    firewall-cmd --permanent --add-port=80/tcp
    firewall-cmd --reload
else
    echo "A porta 80 já está configurada no firewall."
fi

##########################################

# Obtém o endereço IP da máquina
ip=$(hostname -I | awk '{print $1}')

# Adiciona uma entrada no arquivo /etc/hosts para mapear o domínio ao IP
echo "$ip www.$hostname.com" >> /etc/hosts

##########################################

# Habilita o Apache para iniciar automaticamente com o sistema
systemctl enable httpd

# Reinicia o Apache para aplicar as configurações do Virtual Host
systemctl restart httpd

# Exibe uma mensagem de conclusão
echo "Configuração concluída! Acesse o site em http://www.$hostname.com"