#output da shell di un conflitto merge 
arefinahmad@MBP-di-Arefin git_ex % echo  hello world  > testo.txt
arefinahmad@MBP-di-Arefin git_ex % git add .
arefinahmad@MBP-di-Arefin git_ex % git commit -m  primo commit 
[main (root-commit) 1845572]  primo commit
 1 file changed, 1 insertion(+)
 create mode 100644 git_ex/testo.txt
arefinahmad@MBP-di-Arefin git_ex % git checkout -b branch1
Switched to a new branch 'branch1'
arefinahmad@MBP-di-Arefin git_ex % echo ciao mondo > testo.txt
arefinahmad@MBP-di-Arefin git_ex % git commit -am da branch1
[branch1 4321276] da branch1
 1 file changed, 1 insertion(+), 1 deletion(-)
arefinahmad@MBP-di-Arefin git_ex % git checkout main
Switched to branch 'main'
arefinahmad@MBP-di-Arefin git_ex % git checkout -b branch2
Switched to a new branch 'branch2'
arefinahmad@MBP-di-Arefin git_ex % echo hola mundo > testo.txt 
arefinahmad@MBP-di-Arefin git_ex % git commit -am da branch2
[branch2 89d314f] da branch2
 1 file changed, 1 insertion(+), 1 deletion(-)
arefinahmad@MBP-di-Arefin git_ex % git checkout branch1
Switched to branch 'branch1'
arefinahmad@MBP-di-Arefin git_ex % git merge branch1
Already up to date.
arefinahmad@MBP-di-Arefin git_ex % git merge branch2
Auto-merging git_ex/testo.txt
CONFLICT (content): Merge conflict in git_ex/testo.txt
Automatic merge failed; fix conflicts and then commit the result. #il conflitto generato 
arefinahmad@MBP-di-Arefin git_ex % 

#risoluzione


#Il conflitto nasce dal contenuto della medesima riga , e la soluzione più semplice consiste nello scegliere una delle due righe 
#salvare e committare così da confermare le modifiche 
