from fastapi import FastAPI
from pydantic import BaseModel
import subprocess

app = FastAPI()

class QueryRequest(BaseModel):
    prompt: str

@app.get("/")
async def root():
    return {"message": "Ollama container is running"}

@app.post("/generate/")
async def generate(request: QueryRequest):
    try:
        # Replace 'ollama_path' with the actual command if running Ollama CLI
        response = subprocess.check_output(
            ["ollama", "run", request.prompt],
            text=True,
        )
        return {"response": response.strip()}
    except Exception as e:
        return {"error": str(e)}
