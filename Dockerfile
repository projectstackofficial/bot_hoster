FROM python:3.11-slim

# Node/npm needed because Bot Hoster runs user-uploaded Node bots too
RUN apt-get update && apt-get install -y --no-install-recommends \
        nodejs npm git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Render sets $PORT at runtime; app already reads it via env_int("PORT", 8080)
CMD ["python", "app.py"]
