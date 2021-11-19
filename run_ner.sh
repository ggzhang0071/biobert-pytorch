timestamp=`date +%Y%m%d%H%M%S`

rm Logs/*.log
# Pre-process NER datasets
cd named-entity-recognition
#./preprocess.sh  



# Choose dataset and run
export DATA_DIR=../datasets/NER
export ENTITY=NCBI-disease
python -m  pdb  run_ner.py \
    --data_dir ${DATA_DIR}/${ENTITY} \
    --labels ${DATA_DIR}/${ENTITY}/labels.txt \
    --model_name_or_path dmis-lab/biobert-base-cased-v1.1 \
    --output_dir output/${ENTITY} \
    --max_seq_length 128 \
    --num_train_epochs 3 \
    --per_device_train_batch_size 128 \
    --save_steps 1000 \
    --seed 1 \
    --do_train \
    --do_eval \
    --do_predict \
    --overwrite_output_dir 2>&1 |tee  ../Logs/$timestamp.log

