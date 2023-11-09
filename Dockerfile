FROM python:3.9-alpine3.13
LABEL maintainer="runabird36"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt C:/linux/tmp/requirements.txt
COPY ./app C:/linux/app
WORKDIR C:/linux/app
EXPOSE 8000

RUN python -m venv /py && \
    C:/Python39/Scripts/pip.exe install --upgrade pip && \
    C:/Python39/Scripts/pip.exe install -r C:/linux/tmp/requirements.txt && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

# ENV PATH="/py/bin:$PATH"

USER django-user