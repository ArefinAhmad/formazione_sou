#!/bin/bash
# Naked variables
 
echo
 
# When is a variable "naked", i.e., lacking the '$' in front?
# When it is being assigned, rather than referenced.
 
# Assignment
a=879
echo "The value of \"a\" is $a."
 
# Assignment using 'let'
let a=16+5
echo "The value of \"a\" is now $a."
 #vengono assenate due variabili , il secondo con let perchè è un'operazione aritmetica mentre il primo è un'assegnazione semplice
echo
 
# In a 'for' loop (really, a type of disguised assignment):
echo -n "Values of \"a\" in the loop are: "
for a in 7 8 9 11
do
  echo -n "$a "
done
 #è un ciclo for che assegna i valori 7 8 9 11 alla variabile a e li stampa uno alla volta
echo
echo
 
# In a 'read' statement (also a type of assignment):
echo -n "Enter \"a\" "
read a
echo "The value of \"a\" is now $a."
#con il comando read , stampa nella stringa succecciva il valore che l'utente inserisce nella variabile a
echo
 
exit 0