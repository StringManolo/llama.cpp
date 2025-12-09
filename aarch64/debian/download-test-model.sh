#!/usr/bin/env bash

MODEL_URL="https://huggingface.co/bartowski/Llama-3.2-1B-Instruct-GGUF/resolve/main/Llama-3.2-1B-Instruct-Q4_K_M.gguf"

mkdir -p ./models/

curl -L "$MODEL_URL" -o ./models/Llama-3.2-1B-Instruct-Q4_K_M.gguf

