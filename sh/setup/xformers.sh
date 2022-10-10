eval "$(conda shell.bash hook)"
conda activate automatic

cd stable-diffusion-webui

git clone https://github.com/facebookresearch/xformers.git repositories/xformers
cd repositories/xformers
git submodule update --init --recursive
pip install -r requirements.txt
pip install -e .
