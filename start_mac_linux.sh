#!/bin/zsh

echo "Überprüfe, ob uv installiert ist..."
if ! command -v uv &> /dev/null; then
    echo "uv nicht gefunden. Installiere uv..."
    # Versuche verschiedene pip-Varianten
    if command -v pip3 &> /dev/null; then
        pip3 install uv
    elif command -v python3 -m pip &> /dev/null; then
        python3 -m pip install uv
    else
        echo "Fehler: Kein pip gefunden. Bitte installiere Python3 mit pip."
        exit 1
    fi
fi

echo "Virtual Environment wird erstellt..."
uv venv

echo "Environment wird aktiviert..."
source .venv/bin/activate

echo "requirements.in wird kompiliert..."
uv pip compile requirements.in  -o requirements.txt

echo "Abhängigkeiten werden installiert..."
uv pip install -r requirements.txt

echo "Jupyter wird installiert..."
uv pip install jupyter

echo "Jupyter Notebook wird gestartet..."
jupyter notebook "mp3_transcribtion.ipynb"
