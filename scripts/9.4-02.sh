# Compresser sans abimer les couleurs (gltf-transform)
npx @gltf-transform/cli optimize maison-brut.glb maison.glb \
  --compress quantize --texture-compress false --palette false \
  --simplify false --join false --instance false --flatten false
