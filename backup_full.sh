#!/bin/bash
#Adaptado por: Th14go
#Créditos: Desconhecido

echo "Backup full"


echo " "

dadosfull() {

SRCDIR="/mnt/Dados/ARQUIVOS/" #diretórios que serão feito backup
DSTDIR=/mnt/backup/FULL #diretório de destino do backup
DATA=`date +%x-%k%M%S` #pega data atual
TIME_BKCP=+10 #número de dias em que será deletado o arquivo de backup

#criar o arquivo full-backup.tar no diretório de destino
#ARQ=$DSTDIR/full-$DATA.tar.gz
ARQ=$DSTDIR/full-$DATA.zip
#data de inicio backup
DATAIN=`date +%c`
echo "Data de inicio: $DATAIN"

}

backupfull(){
sync
tar -cvf $ARQ $SRCDIR
if [ $? -eq 0 ] ; then
   echo "----------------------------------------"
        echo "Backup Full concluído com Sucesso"
   DATAFIN=`date +%c`
   echo "Data de termino: $DATAFIN"
   echo "Backup realizado com sucesso" >> /var/log/backup_full.log
   echo "Criado pelo usuário: $USER" >> /var/log/backup_full.log
   echo "INICIO: $DATAIN" >> /var/log/backup_full.log
   echo "FIM: $DATAFIN" >> /var/log/backup_full.log
   echo "-----------------------------------------" >> /var/log/backup_full.log
   echo " "
   echo "Log gerado em /var/log/backup_full.log"

else
   echo "ERRO! Backup do dia $DATAIN" >> /var/log/backup_full.log
fi  
}
cp -r /var/log/backup_full.log /mnt/backup/LOG/
procuraedestroifull(){

#apagando arquivos mais antigos (a mais de 10 dias que existe)
find $DSTDIR -name "f*" -ctime $TIME_BKCP -exec rm -f {} ";"
   if [ $? -eq 0 ] ; then
      echo "Arquivo de backup mais antigo eliminado com sucesso!"
   else
      echo "Erro durante a busca e destruição do backup antigo!"
   fi
}

dadosfull
backupfull
procuraedestroifull

exit 0
