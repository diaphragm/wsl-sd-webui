# read -p  "Select optimize
#   o) --medvram
#   n) none (*)
# > " ans
# case "$ans" in
#   o) opt_arg="--medvram";h=3840;w=2176;c=1;;
#   n) opt_arg="";h=512;w=512;c=20;;
#   *) opt_arg="";h=512;w=512;c=20;;
# esac
# echo
# echo "Optimization: $opt_arg"

# echo '
# {
#   "txt2img/Height/value": '$h',
#   "txt2img/Width/value": '$w',
#   "txt2img/Width/maximum": 4096,
#   "txt2img/Height/maximum": 4096,
#   "txt2img/Batch count/value": '$c',
#   "txt2img/Batch count/maximum": 200,
#   "txt2img/Batch size/maximum": 25
# }
# ' > config/ui-config.json

cd stable-diffusion-webui

echo "export COMMANDLINE_ARGS='$opt_arg \
  --ckpt-dir ../models/ckpt \
  --vae-dir ../models/vae \
  --lora-dir ../models/lora \
  --embeddings-dir ../embedding \
  --ui-settings-file ../config/config.json \
  --ui-config-file ../config/ui-config.json \
  --allow-code \
'" > webui-user.sh

bash webui.sh
