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
  "directories_filename_pattern": "[model_name].[model_hash]",
  "quicksettings": "sd_model_checkpoint,sd_vae,CLIP_stop_at_last_layers",
  "add_model_hash_to_info": true
}' > config/config.json
