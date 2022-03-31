FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN iot_backend create-db
RUN iot_backend populate-db
RUN iot_backend add-user -u admin -p admin
EXPOSE 5000
CMD ["iot_backend", "run"]
