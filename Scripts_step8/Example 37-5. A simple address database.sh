#!/bin/bash4
# fetch_address.sh
 
declare -A address
#       -A option declares associative array.
 
address[Charles]="414 W. 10th Ave., Baltimore, MD 21236"
address[John]="202 E. 3rd St., New York, NY 10009"
address[Wilma]="1854 Vermont Ave, Los Angeles, CA 90023"
 
 
echo "Charles's address is ${address[Charles]}."
# Charles's address is 414 W. 10th Ave., Baltimore, MD 21236.
echo "Wilma's address is ${address[Wilma]}."
# Wilma's address is 1854 Vermont Ave, Los Angeles, CA 90023.
echo "John's address is ${address[John]}."
# John's address is 202 E. 3rd St., New York, NY 10009.
 
echo
 
echo "${!address[*]}"   # The array indices ...
# Charles John Wilma

#in questa script si dichiara un array associativo vuoto, che poi viene usato per memorizzare 
#indirizzi di persone, che vengono poi stampati , ad ogni persona viene associato un indirizzo diverso
#poi gli indirizzi vengono richiamati grazie ad address nelle stringhe successive che vengono stampate 
#infine si stampano i nomi delle persone associate agli indirizzi con *
