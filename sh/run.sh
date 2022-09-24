read -p  "Select optimize
  o) --medvram
  n) none (*)
> " ans
case "$ans" in
  o) opt_arg="--medvram";h=3840;w=2176;c=1;;
  n) opt_arg="";h=512;w=512;c=4;;
  *) opt_arg="";h=512;w=512;c=4;;
esac
echo

echo '
{
  "txt2img/Height/value": '$h',
  "txt2img/Width/value": '$w',
  "txt2img/Width/maximum": 4096,
  "txt2img/Height/maximum": 4096,
  "txt2img/Batch size/value": '$c',
  "txt2img/Batch count/maximum": 200
}
' > config/ui-config.json

echo "Optimization: $opt_arg"

eval "$(conda shell.bash hook)"
conda activate automatic

cd stable-diffusion-webui
python webui.py $opt_arg \
  --ckpt-dir ../ckpt \
  --ui-settings-file ../config/config.json \
  --ui-config-file ../config/ui-config.json \
  --embeddings-dir ../embedding \
  --allow-code
