from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Deployment on Vercel successful!"}

@app.get("/status")
def status():
    return {"status": "App is running on Vercel!"}
