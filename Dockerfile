FROM python:3.9-alpine

WORKDIR /app
RUN pip install pipenv
COPY Pipfile .
COPY Pipfile.lock .
RUN pipenv install
COPY templates ./templates
COPY app.py .
ENV FLASK_APP=app.py
EXPOSE 5000
CMD ["pipenv", "run", "python", "app.py"]