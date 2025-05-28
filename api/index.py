from fastapi import FastAPI
import uvicorn
import os

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Deployment on Railway successful! This is Version 4, Testing the V4 now!!!, running on Railway!"}

@app.get("/status")
def status():
    return {"status": "App is running on Railway!"}

if __name__ == "__main__":
    # Railway provides the PORT environment variable
    port = int(os.environ.get("PORT", 8000))
    uvicorn.run(app, host="0.0.0.0", port=port)