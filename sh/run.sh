read -p  "Select optimize
  o) medvram, split attention
  n) none (*)
> " ans
case "$ans" in
  o) opt_arg="--medvram --opt-split-attention";h=1600;w=2560;c=1;;
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
