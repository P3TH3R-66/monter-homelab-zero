# Sur ton ordinateur : chiffrer (cle PUBLIQUE age1...)
AGE_PUBLIC_KEY=age1TA_CLE_PUBLIQUE sh secrets.sh chiffrer
# Sur la machine qui deploie (elle a keys.txt)
sh secrets.sh deployer
# 0 = tout a marche ; autre chose = rien n'a change
echo $?
