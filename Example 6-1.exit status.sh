#!/bin/bash
 
echo hello
echo $?    # Exit status 0 returned because command executed successfully.
 
lskdf      # Unrecognized command.
echo $?    # Non-zero exit status returned -- command failed to execute.
 
echo
 
exit 113   # Will return 113 to shell.
           # To verify this, type "echo $?" after script terminates.
 
#  By convention, an 'exit 0' indicates success,
#+ while a non-zero exit value means an error or anomalous condition.
#  See the "Exit Codes With Special Meanings" appendix.

#Uno script che spiega l'uso di exit , in cui lo 0 indica che lo script ha avuto successo
#mentre un numero diverso da 0 indica che c'è stato un errore
#ma volendo possiamo anche definire un numero di errore scelto da noi 