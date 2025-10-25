#!/usr/bin/env bash

VENV_DIR="./venv"
[ ! -d "$VENV_DIR" ] && python3 -m venv "$VENV_DIR"
. "$VENV_DIR/bin/activate"

pip install --upgrade pip "huggingface_hub[hf_xet]"


hf download bartowski/Llama-3.2-1B-Instruct-GGUF --include "Llama-3.2-1B-Instruct-Q4_K_M.gguf" --local-dir ./models/

