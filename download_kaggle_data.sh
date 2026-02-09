#!/usr/bin/env bash
set -e

COMPETITION="ieee-fraud-detection"
DATA_DIR="data"

mkdir -p "${DATA_DIR}"

# Check if kaggle CLI exists
if ! command -v kaggle &> /dev/null; then
    echo "[ERROR] kaggle CLI not found."
    echo "Install it with: pip install kaggle"
    exit 1
fi

# Check if kaggle.json exists
if [ ! -f "$HOME/.kaggle/kaggle.json" ]; then
    echo "[ERROR] Kaggle API token not found at ~/.kaggle/kaggle.json"
    echo "Go to Kaggle -> Account -> Settings -> Create Legacy API Key" and copy the kaggle.json to ~/.kaggle directory.
    exit 1
fi

echo "[INFO] Downloading dataset from Kaggle (${COMPETITION})..."
kaggle competitions download -c "${COMPETITION}" -p "${DATA_DIR}"

ZIP_FILE="${DATA_DIR}/${COMPETITION}.zip"

echo "[INFO] Unzipping dataset..."
unzip -o "${ZIP_FILE}" -d "${DATA_DIR}"

echo "[INFO] Cleaning up zip file..."
rm "${ZIP_FILE}"

echo "[SUCCESS] Data downloaded to ./${DATA_DIR}"
