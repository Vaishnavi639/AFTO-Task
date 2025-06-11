
# STAGE 1 — Build Environment

FROM python:3.12-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --user --no-cache-dir -r requirements.txt


# STAGE 2 — Final Image

FROM python:3.12-slim

ENV PATH="/root/.local/bin:$PATH"

WORKDIR /app

COPY --from=builder /root/.local /root/.local

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
