FROM python:3.11-slim

# Install poetry
RUN pip install poetry

# Set working directory
WORKDIR /api

# Copy poetry files
COPY pyproject.toml poetry.lock* ./

# Configure poetry to not create virtual env (we're in Docker)
RUN poetry config virtualenvs.create false

# Install dependencies
RUN poetry install --no-interaction --no-ansi --no-root

# Copy app code
COPY . .

# Expose port (Railway will override this)
EXPOSE 8000

# Start the app
CMD ["python", "index.py"]