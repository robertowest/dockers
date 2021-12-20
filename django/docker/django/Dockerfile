FROM python:3.10

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# actualizamos pip
RUN python -m pip install --upgrade pip

# directorio de trabajo
RUN mkdir /code
WORKDIR /code

# copiamos archivo desde al host a WORKDIR
COPY requirements.txt .
# instalamos requerimientos
RUN pip install -r requirements.txt --no-warn-script-location

# creamos un usuario 1000 para no tener problemas con el usuario host
RUN useradd -ms /bin/bash usuario
RUN chown -R usuario:usuario /code
# USER usuario

# COPY --chown=usuario content/ /code/content
# COPY --chown=usuario environment/ /code/config/environment
