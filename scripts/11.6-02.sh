# Modelfile : le modele de la maison
FROM gemma4:12b
# les coeurs rapides seulement (a mesurer chez toi)
PARAMETER num_thread 6
# assez pour l'etat de la maison et l'historique
PARAMETER num_ctx 32768
PARAMETER num_predict 256       # reponses courtes, comme a l'oral
