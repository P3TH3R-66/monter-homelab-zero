# Fuite d'eau : fermer la vanne, verifier,
# puis alerter (exemple fictif)
    alias: Fuite - vanne et alerte
    mode: single                      # une seule execution a la fois
    triggers:
      - trigger: state
        entity_id: binary_sensor.fuite_cuisine
        to: "on"
        for: "00:00:05"               # 5 s : ignore un faux contact
    actions:
      - action: valve.close_valve       # d'abord couper l'eau
        # si la vanne ne repond pas, on alerte quand meme
        continue_on_error: true
        target: { entity_id: valve.entree_eau }
      - wait_template: "{{ is_state('valve.entree_eau', 'closed') }}"
        timeout: "00:00:30"
        continue_on_timeout: true
      - action: notify.mobile_app_cell
        continue_on_error: true
        data:
          title: "Fuite d'eau : cuisine"
          message: >-
            {{ "Vanne fermée."
               if is_state('valve.entree_eau', 'closed')
               else "VANNE NON FERMÉE : ferme l'entrée d'eau "
                    ~ "à la main." }}
      # 2e voie d'alerte, locale (si tu as une sirene)
      - action: siren.turn_on
        continue_on_error: true
        target: { entity_id: siren.maison }
