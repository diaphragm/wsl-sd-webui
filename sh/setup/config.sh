# generate initial config
mkdir -p config

echo '{
  "outdir_txt2img_samples": "../outputs/txt2img-images",
  "outdir_img2img_samples": "../outputs/img2img-images",
  "outdir_extras_samples": "../outputs/extras-images",
  "outdir_txt2img_grids": "../outputs/txt2img-grids",
  "outdir_img2img_grids": "../outputs/img2img-grids",
  "save_to_dirs": true,
  "grid_save_to_dirs": true,
  "directories_filename_pattern": "[model_hash]"
}' > config/config.json
