#!/bin/bash
 
# Call this script with at least 10 parameters, for example
# ./scriptname 1 2 3 4 5 6 7 8 9 10
MINPARAMS=10
#inizializza una variabile come numero minimo di parametri da passare
echo
 
echo "The name of this script is \"$0\"." #stampa la stringa con il percorso completo dello script
# Adds ./ for current directory
echo "The name of this script is \"`basename $0`\"." #con basename stampa solo il nome dello script senza il percorso completo
# Strips out path name info (see 'basename')
 
echo #riga vuota
 
if [ -n "$1" ]              # Tested variable is quoted.
then
 echo "Parameter #1 is $1"  # Need quotes to escape #
fi
 #condizione che il parametro non sia vuoto , se non è vuoto allora stampa il testo
if [ -n "$2" ]
then
 echo "Parameter #2 is $2"
fi
 #situazione analoga per l'if precedente ma anche nel caso successivo 
if [ -n "$3" ]
then
 echo "Parameter #3 is $3"
fi
 
# ...
 
 
if [ -n "${10}" ]  # Parameters > $9 must be enclosed in {brackets}.
then
 echo "Parameter #10 is ${10}"
fi
#if per il decimo parametro che passa in graffe per non creare disambiguità con 1 e 0
 
echo "-----------------------------------"
echo "All the command-line parameters are: "$*""
#stampa tutti i parametri che sono passati alla riga di comandi 
 
if [ $# -lt "$MINPARAMS" ]
then
  echo
  echo "This script needs at least $MINPARAMS command-line arguments!"
fi 
 #se il numero di parametri passati è minore della variabile MINPARAMS allora stampa il messaggio che avvisa l'utente che sono necessari almeno 10 parametri
echo
 
exit 0