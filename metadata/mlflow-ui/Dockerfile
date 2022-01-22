FROM python:3.8.6-slim
COPY . .
RUN pip install -r requirements.txt
EXPOSE 5000
CMD mlflow ui --backend-store-uri "postgresql+psycopg2://postgres:passw0rd@database:5432/postgres" --host 0.0.0.0