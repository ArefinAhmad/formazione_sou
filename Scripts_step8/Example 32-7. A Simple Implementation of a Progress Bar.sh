#! /bin/bash
# progress-bar2.sh
# Author: Graham Ewart (with reformatting by ABS Guide author).
# Used in ABS Guide with permission (thanks!).
 
# Invoke this script with bash. It doesn't work with sh.
 
interval=1
long_interval=10
 
{
     trap "exit" SIGUSR1 
     sleep $interval; sleep $interval
     while true
     do
       echo -n '.'     # Use dots.
       sleep $interval
     done; } &         # Start a progress bar as a background process.
 
pid=$!
trap "echo !; kill -USR1 $pid; wait $pid"  EXIT        # To handle ^C.
 
echo -n 'Long-running process '
sleep $long_interval
echo ' Finished!'
 
kill -USR1 $pid
wait $pid              # Stop the progress bar.
trap EXIT
 
exit $?
#inizia inizializzando due variabili che indicano :il primo l'intervallo di tempo 
#e il secondo l'intervallo del processo per intero 

#all'interno delle graffe viene posta la condizione trap che permette di uscire dallo script
#in caso di segnale SIGUSR1 che da via ad exit, poi si ussano due sleep perciò 1 sec + 1 sec come intervallo 
# prima di iniziare il processo while e poi uno sleep di 1 sec fra un'iterazione e un'altra ovvero dei dots.
#il simbolo & alla fine indica che il processo deve essere eseguito in background
#Si usa il pid per memorizzare l'id del processo in esecuzione

#a livello di sequenza il processo si avvia runnando il ciclo while ma stampa prima la stringa:
# "Long-running process " poichè c'è lo sleep di 2 secondi prima di iniziare il ciclo , il processo 
#avviene in 10 secondi(long_interval) e alla fine stampa "Finished!" , nel mentre il ciclo while
#si avvia in background e stampa i punti ogni secondo. Una volta terminato il long_interval, si usa 
#$pid per terminare il processo con kill -USR1 $pid e infine EXIT.
