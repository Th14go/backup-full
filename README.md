![bashmini](https://user-images.githubusercontent.com/12428027/37692278-5515c1cc-2c96-11e8-9542-b4502ff6a310.png)

<b><p align="center">Backup FULL - com LOG e rsync LOG</p><br>
Este backup é executado em pasta remota, existem duas formas de editar o FSTAB de forma segura ou insegura.


<b>#Dependencias#</b>

apt - get install cifs - utils --- para suporte ao cifs

<b>Verificar suporte montagem cifs >  cat /proc/filesystems | grep cifs</b><br>
$ nodev	cifs  #Resultado se conter suporte<br>

<b>#Criar Diretório#</b><br>
mkdir /mnt/backup<br>

<b>#Editar FSTAB#</b><br>
nano /etc/fstab<br>

<b>#Forma insegura#</b><br>
//10.9.1.100.backup /mnt/backup cifs username=user,password=senha,user,dir_mode=0777,file_mode=0777 0 0<br>

Desta forma fica visivel no fstab sua senha do computador da rede de destino do backup;<br>

<b>#Forma Segura#</b><br>
Criar arquivo em / nano .pwdrsync.txt<br>
chmod 600 .pwdrsync.txt <br>
username=usuario<br>
password=suasenha<br>

//10.9.1.100/backup /mnt/backup cifs credentials=/.pwdrsync.txt,user,dir_mode=0777,file_mode=0777 0 0<br>

Para confirmar se deu tudo certo !<br>

Montar as unidades.<br>

<b>mount -a </b> -- montar todas unidades..<br>
Devera aparecer a unidade montada com o destino remoto<br>

<b>Alterar Váriaveis</br>
<b>SRCDIR</b><br>
<b>DSTDIR </b><br>

# git clone https://github.com/Th14go/script-bck-full
