echo #===========================================#
echo # Alexander Wendts Machine Learning Toolbox #
echo #===========================================#

rem define config file to use
set config_file="config/debug_timedata_omxs30_inference.ini"

echo setup environment
call conda activate env_ml

echo #===========================================#
echo # Generate Dataset #
echo #===========================================#
python ..\step21_generate_features.py --config_path=%config_file% -debug
python ..\step22_adapt_dimensions.py --config_path=%config_file%

echo #===========================================#
echo # Data Analysis and Preprocessing #
echo #===========================================#
python ..\step30_clean_raw_data.py --config_path=%config_file% --no_images --on_inference_data
python ..\step31_adapt_features.py --config_path=%config_file%

echo #=================================================#
echo # Model Training#
echo #=================================================#


echo #=================================================#
echo # Model Evaluation for Temporal Datasets #
echo #=================================================#


echo #=================================================#
echo # Prediction #
echo #=================================================#
python ..\step70_predict_temporal_data.py --config_path=%config_file%