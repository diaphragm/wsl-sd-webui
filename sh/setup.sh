dir="$(dirname $0)/setup"

bash "$dir/cuda.sh"
bash "$dir/python.sh"
bash "$dir/webui.sh"
bash "$dir/config.sh"
