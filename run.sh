# condor_rm hhao9

python3 gen_combo.py

rm -rf error_logs/*
rm -rf logs/*

for dir in debm debm_gmm ucl_gmm ucl_kde conjugate_priors; do 
    find "algo_results/$dir" -mindepth 2 -type f -delete
done

condor_submit /home/hhao9/chil_lowdim/run_mlhc.sub