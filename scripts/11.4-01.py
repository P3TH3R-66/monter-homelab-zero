# banc.py : chaque question, la reponse, et
# les vitesses donnees par Ollama
import json, time, urllib.request
MODELE = "gemma4:12b"
# [{"q": "...", "attendu": "..."}] ; exemple :
# 11.4-02-questions.json du depot, copie en questions.json
for q in json.load(open("questions.json", encoding="utf-8")):
    corps = {"model": MODELE, "prompt": q["q"], "stream": False,
             "options": {"temperature": 0.2, "seed": 1,
                         "num_ctx": 8192}}
    t0 = time.time()
    r = json.load(urllib.request.urlopen(urllib.request.Request(
        "http://127.0.0.1:11434/api/generate",
        json.dumps(corps).encode(),
        {"Content-Type": "application/json"}), timeout=600))
    # champ absent ou nul (cache) : pas de division
    def vitesse(n, d):
        return round(n / (d / 1e9), 1) if n and d else None
    lecture = vitesse(r.get("prompt_eval_count"),
                      r.get("prompt_eval_duration"))
    ecriture = vitesse(r.get("eval_count"), r.get("eval_duration"))
    print(json.dumps({"q": q["q"], "attendu": q["attendu"],
                      "reponse": r["response"],
                      "secondes": round(time.time() - t0, 1),
                      "lecture_jetons_s": lecture,
                      "ecriture_jetons_s": ecriture},
                     ensure_ascii=False))
