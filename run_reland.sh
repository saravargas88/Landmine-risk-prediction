timestamp=${1:-$(date +"%m_%d_%Y_%H_%M_%S")}
mkdir -p ./experiments/$timestamp

# Set PYTHONPATH to include the local pytorch_tabnet_irm directory
export PYTHONPATH=./pytorch_tabnet_irm:.


CUDA_VISIBLE_DEVICES=0,1 python main.py \
   --timestamp $timestamp  \
   --municipio puerto --subset full --model TabCmpt --n_step 2 \
   --objective irm 2>&1 | tee -a ./experiments/$timestamp/log.txt
