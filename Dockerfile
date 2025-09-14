FROM python:3.11-slim

WORKDIR /app

# Avoid .pyc files and enable pip cache control
ENV PYTHONDONTWRITEBYTECODE=1
ENV PIP_NO_CACHE_DIR=1

# Copy requirements and install
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy app code
COPY . .

# Expose port (Flask default)
EXPOSE 5000

# Run with gunicorn for production (replace app:app with your WSGI entry)
# CMD ["gunicorn", "5_MCP/client.py", "--bind", "0.0.0.0:5000", "--workers", "3"]
CMD ["python", "5_MCP/hello_world.py"]
# CMD ["python", "5_MCP/client.py"]