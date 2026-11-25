# Baisser les lumieres a 22h (editeur YAML de Home Assistant)
alias: Lumieres tamisees le soir
triggers:
  - trigger: time
    at: "22:00:00"
actions:
  - action: light.turn_on
    target:
      entity_id: light.salon
    data:
      brightness_pct: 30
