from fastapi import FastAPI
import uvicorn 

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Deployment on Vercel successful! This is Version 2, Testing the V2 now!!!"}

@app.get("/status")
def status():
    return {"status": "App is running on Vercel!"}

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)