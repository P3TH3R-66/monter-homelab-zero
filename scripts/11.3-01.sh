# Les commandes de base
ollama pull gemma4:12b        # telecharger un modele
ollama list                   # modeles installes
# modeles en memoire, et pour combien de temps
ollama ps
ollama show gemma4:12b        # details et parametres
ollama rm ancien-modele       # liberer le disque

# Un modele "maison" : un Modelfile, puis
# ollama create maison -f Modelfile
FROM gemma4:12b
PARAMETER num_ctx 32768
PARAMETER num_thread 6
SYSTEM "Tu reponds en francais, en phrases courtes."
