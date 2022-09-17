token=$(cat token)

wget -P ckpt \
  https://user:$token@huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt \
  https://thisanimedoesnotexist.ai/downloads/wd-v1-2-full-ema.ckpt \
  https://huggingface.co/naclbit/trinart_stable_diffusion_v2/resolve/main/trinart2_step115000.ckpt
