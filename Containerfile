FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN dms_epicor create-db
RUN dms_epicor populate-db
RUN dms_epicor add-user -u admin -p admin
EXPOSE 5000
CMD ["dms_epicor", "run"]
