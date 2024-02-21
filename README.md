# Para quem fez instalação com o Setup Orion (Portainer + Traefik) e quer instalar o Perfex CRM em Docker:
![image](https://github.com/ilMateusli/Perfex-docker/assets/88564848/930b2327-1a92-418c-bc7b-74bd440eafa3)
<p align="center">
  <img src="https://github.com/ilMateusli/Perfex-docker/assets/88564848/aa78048b-efe7-473a-b4c3-12c40e40d441" width="512">
</p>


### Configurar e colocar os arquivos Dockerfile e docker-compose.yml na pasta /root/Perfex-CRM

### instalar o gdown:
```
pip install gdown
```
### Baixar o arquivo do perfex: 
```
gdown 17Ecsoi9tpK0skdqHT1b4S38U8fK6lMyc
```
### Descompactar: 
```
unzip perfex-crm.zip
```
### Construir a imagem Docker:
```
docker build -t perfexcrm .
```

### Dar as permissões às pastas:
```
cd /root/Perfex-CRM
chmod -R 777 uploads
chmod 777 application/config
chmod 777 application/config/config.php
chmod 777 application/config/app-config-sample.php
chmod 777 temp
```
### Implantar o container:
```
docker stack deploy -c docker-compose.yml perfex
```
### Na página do perfex.seusite.com.br:
Hostname: db
Database Name: perfex
Username: SEU_USUARIO
Password: SUA_SENHA

### Caso precise Reconstruir a imagem:
```
cd /root/Perfex-CRM
docker build -t perfexcrm .
```
### Reimplantar o contêiner
```
cd /root/Perfex-CRM
docker stack rm perfex
docker stack deploy -c docker-compose.yml perfex
```

### Criar o cadastro e apagar a pasta "install" usando: 
### Listar os ID:
```
docker ps
docker exec -it {id_container} bash
rm -r /var/www/html/install
```
# Alterar a linha do arquivo application/config/app-config.php para $config['base_url'] = 'https://perfex.SEUSITE.com.br/';
