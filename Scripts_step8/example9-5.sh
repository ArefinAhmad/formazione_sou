#!/bin/bash
# am-i-root.sh:   Am I root or not?
 
ROOT_UID=0   # Root has $UID 0.
 
if [ "$UID" -eq "$ROOT_UID" ]  # Will the real "root" please stand up?
then
  echo "You are root."
else
  echo "You are just an ordinary user (but mom loves you just the same)."
fi
 
exit 0
#si tratta di uno script che verifica se l'utente "equivale" all'utente root.
#perciò si fa il confronto con l'if con la condizione tra parentesi quadre (test) 
#se l'output della condizione è 0 (true) allora si stampa il messaggio "You are root"
#altrimenti si stampa il messaggio "You are just an ordinary user.... e si chiude la condizione con fi
#exit 0 per indicare il valore di ritorno 
 
# ============================================================= #
# Code below will not execute, because the script already exited.
 
# An alternate method of getting to the root of matters:
 
ROOTUSER_NAME=root #qui si definisce come variabile il nome dell'utente root  
 
username=`id -nu`              # Or...   username=`whoami`
if [ "$username" = "$ROOTUSER_NAME" ] #condizione che verifica se l'utente corrente è root
then
  echo "Rooty, toot, toot. You are root." #se 0 allora si stampa il messaggio
else #altrimenti si stampa il messaggio seguente
  echo "You are just a regular fella."
fi
#chiude lo script con fi
#non c'è exit , ma abbiamo un'output per ogni condizione dell'if perciò non genera errori