dir="$(dirname $0)/setup"

bash "$dir/cuda.sh"
bash "$dir/conda.sh"
bash "$dir/webui.sh"
bash "$dir/config.sh"
