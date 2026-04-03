# TEMPO Low Dimensional Experiments for Benchmarking Algorithms

## Virtual environment

First, create a virtual environment using Conda:

```sh
conda create -n jobs python=3.11 -y
conda activate jobs

# Install conda-pack + core deps via conda-forge (avoid pip clobbering conda files)
conda install -y -c conda-forge conda-pack \
  "numpy<2.4" "scipy<1.14" \
  pandas pyarrow pyyaml \
  scikit-learn matplotlib \
  packaging pip setuptools wheel

# Now use pip ONLY for your project / git packages
pip install --no-cache-dir --upgrade pyebm pysaebm

# IMPORTANT: use the exact awkde URL form that kde-ebm expects (note the .git)
pip install --no-cache-dir --upgrade \
  git+https://github.com/noxtoby/awkde.git

# Install kde-ebm repo WITHOUT deps to avoid pip trying to re-resolve awkde via a different VCS URL
pip install --no-cache-dir --upgrade --no-deps \
  git+https://github.com/hongtaoh/ucl_kde_ebm

# pySuStaIn normally fine with deps
pip install --no-cache-dir --upgrade \
  git+https://github.com/hongtaoh/pySuStaIn

# Verify
python -c "from kde_ebm import mixture_model; from pySuStaIn.MixtureSustain import MixtureSustain; import pysaebm, pyebm, yaml; import numpy, scipy; print('numpy', numpy.__version__, 'scipy', scipy.__version__); print('✅ Dependencies OK')"

```

## Experiment

Generate data by running `bash gen.sh`. You need to modify `gen.sh` to make sure the paths work for you. 

Then, run `gen_combo.py` to generate `all_combinations.txt`. 

Next, run `bash run.sh`. Results will be stored in `algo_results`. Logs are in `logs`.

To get `all_results.csv`, run `python3 save_csv.py`. 

Please note that experiments were completed on [CHTC](https://chtc.cs.wisc.edu/), a HPC platform developed by UW-Madison. You can run locally on your CPU by modifying and executing `run_mlhc.py`, but it's not part of this repository. 