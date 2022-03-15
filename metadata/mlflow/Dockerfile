FROM python:3.8.6-slim
RUN pip install psycopg2-binary mlflow azure-storage-blob
CMD mlflow server \
    --host 0.0.0.0 \
    --backend-store-uri "postgresql+psycopg2://$POSTGRES_USER:$POSTGRES_PASSWORD@mlflow-db-svc:$PGPORT/$POSTGRES_DB" \
    --default-artifact-root "wasbs://$CONTAINER_NAME@$STORAGE_ACCOUNT.blob.core.windows.net/mlflow"