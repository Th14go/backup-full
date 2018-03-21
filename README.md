![bashmini](https://user-images.githubusercontent.com/12428027/37692278-5515c1cc-2c96-11e8-9542-b4502ff6a310.png)

<p align="center># Backup - FULL --Th14go--</p>

Rotina de backup Full, enviando  para local remoto.<br>

<b>#Dependencias#</b>

apt - get install cifs - utils --- para suporte ao cifs

<b>Verificar suporte montagem cifs >  cat /proc/filesystems | grep cifs</b><br>
$ nodev	cifs  #Resultado se conter suporte<br>

<b>#Criar Diretório#</b><br>
mkdir /mnt/backup

<b>#Editar FSTAB#</b><br>
nano /etc/fstab

<b>#Forma insegura#</b><br>
//10.9.1.100.backup /mnt/backup cifs username=user,password=senha,user,dir_mode=0777,file_mode=0777 0 0

Desta forma fica visivel no fstab sua senha do computador da rede de destino do backup;

<b>#Forma Segura#</b><br>
Criar arquivo em / nano .pwdrsync.txt
chmod 600 .pwdrsync.txt 
username=usuario
password=suasenha

//10.9.1.100/backup /mnt/backup cifs credentials=/.pwdrsync.txt,user,dir_mode=0777,file_mode=0777 0 0

Para confirmar se deu tudo certo !

Montar as unidades.

<b>mount -a </b> -- montar todas unidades..
Devera aparecer a unidade montada com o destino remoto



SRCDIR="/mnt/Dados/ARQUIVOS/" #diretórios que serão feito backup
DSTDIR=/mnt/backup/FULL
