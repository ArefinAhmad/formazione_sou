# Cleanup
# Run as root, of course.
 
cd /var/log #qui si sposa all'interno della cartella log
cat /dev/null > messages #null non contiene nulla, ma a prescindere > svuota il file destinazione quindi il file messages viene svuotato 
cat /dev/null > wtmp #stesso per wtmp , che contiene informazioni sugli accesso ma viene svuotato
echo "Log files cleaned up."  #semplice messaggio che descrive l'azione effettuata