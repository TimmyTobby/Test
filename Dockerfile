FROM python:3.11-slim

# Install poetry
RUN pip install poetry

# Configure poetry to not create virtual env (we're in Docker)
RUN poetry config virtualenvs.create false

# Set working directory
WORKDIR /code

# Copy poetry files
COPY ./pyproject.toml ./README.md ./poetry.lock* ./

# Install dependencies
RUN poetry install --no-interaction --no-ansi --no-root

# Copy app code
COPY  ./api ./api

RUN poetry install --no-interaction --no-ansi --no-root

# Expose port (Railway will override this)
EXPOSE 8000

# Start the app
CMD exec uvicorn api.index:app --host 0.0.0.0 --port 8000