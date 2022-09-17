read -p "Select model
  s) stable diffusion
  w) waifu diffusion (*)
  t) TrinArt
  p) potato
> " ans
case "$ans" in
  s) ckpt="sd-v1-4.ckpt";;
  w) ckpt="wd-v1-2-full-ema.ckpt";;
  t) ckpt="trinart2_step115000.ckpt";;
  p) ckpt="Lewd-diffusion-pruned.ckpt";;
  *) ckpt="wd-v1-2-full-ema.ckpt";;
esac
echo

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

mkdir -p config
echo '
{
  "outdir_txt2img_samples": "../outputs/'"$ckpt"'/txt2img-images",
  "outdir_img2img_samples": "../outputs/'"$ckpt"'/img2img-images",
  "outdir_extras_samples": "../outputs/'"$ckpt"'/extras-images",
  "outdir_txt2img_grids": "../outputs/'"$ckpt"'/txt2img-grids",
  "outdir_img2img_grids": "../outputs/'"$ckpt"'/img2img-grids"
}
' > config/config.json
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

echo "Model: $ckpt"
echo "Optimization: $opt_arg"

eval "$(conda shell.bash hook)"
conda activate automatic

cd stable-diffusion-webui
python webui.py --ckpt "../ckpt/$ckpt" $opt_arg \
  --ui-settings-file ../config/config.json \
  --ui-config-file ../config/ui-config.json \
  --hide-ui-dir-config
