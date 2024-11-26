FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Ollama (assuming it is available via a CLI or package)
# Replace the following with actual installation commands for Ollama
RUN curl -fsSL https://ollama.com/install.sh | bash

WORKDIR usr/app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
