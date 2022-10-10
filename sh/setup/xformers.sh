cd stable-diffusion-webui
source ./venv/bin/activate

git clone https://github.com/facebookresearch/xformers.git repositories/xformers
cd repositories/xformers
git submodule update --init --recursive
# to resolve cuda issue
pip install setuptools==49.6.0

pip install -r requirements.txt
pip install -e .
