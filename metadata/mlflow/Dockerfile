FROM python:3.8.6-slim
RUN pip install psycopg2-binary mlflow
CMD mlflow server --backend-store-uri "postgresql+psycopg2://postgres:passw0rd@database:5432/postgres" --host 0.0.0.0 --default-artifact-root metadata/artifacts