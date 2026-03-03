@echo off
echo Überprüfe, ob uv installiert ist...
where uv >nul 2>nul
if %ERRORLEVEL% neq 0 (
    pip install uv
)

echo Virtual Environment wird erstellt...
uv venv

echo Environment wird aktiviert...
call .venv\Scripts\activate

echo requirements.in wird kompiliert...
uv pip compile requirements.in -o requirements.txt

echo Abhängigkeiten werden installiert...
uv pip install -r requirements.txt

echo Jupyter wird installiert...
uv pip install jupyter

echo Jupyter Notebook wird gestartet...
jupyter notebook "mp3_transcribtion.ipynb"