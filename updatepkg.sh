# # # Remove old tarball (clean start)
# rm -rf /staging/hhao/env.tar.gz  # Remove old tarball (clean start)

rm -f /staging/hhao9/env.tar.gz

# conda deactivate
# conda remove -n jobs --all -y
# conda create -n jobs python=3.11 -y
# conda activate jobs

# # Install conda-pack + core deps via conda-forge (avoid pip clobbering conda files)
# conda install -y -c conda-forge conda-pack \
#   "numpy<2.4" "scipy<1.14" \
#   pandas pyarrow pyyaml \
#   scikit-learn matplotlib \
#   packaging pip setuptools wheel

# # Now use pip ONLY for your project / git packages
# pip install --no-cache-dir --upgrade \
#   bebms pyebm pysaebm

# # IMPORTANT: use the exact awkde URL form that kde-ebm expects (note the .git)
# pip install --no-cache-dir --upgrade \
#   git+https://github.com/noxtoby/awkde.git

# # Install kde-ebm repo WITHOUT deps to avoid pip trying to re-resolve awkde via a different VCS URL
# pip install --no-cache-dir --upgrade --no-deps \
#   git+https://github.com/hongtaoh/ucl_kde_ebm

# # pySuStaIn normally fine with deps
# pip install --no-cache-dir --upgrade \
#   git+https://github.com/hongtaoh/pySuStaIn

pip install --upgrade --no-cache-dir  pysaebm

# Verify
python -c "from kde_ebm import mixture_model; from pySuStaIn.MixtureSustain import MixtureSustain; import bebms, pysaebm, pyebm, yaml; import numpy, scipy; print('numpy', numpy.__version__, 'scipy', scipy.__version__); print('✅ Dependencies OK')"

# Pack directly to staging path (avoid mv issues)
conda-pack -n jobs --output /staging/hhao9/env.tar.gz
