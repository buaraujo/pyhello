FROM python:3.9.0-alpine

# -=-=-=-=-=-=-=-=-=-=-=-=-=
#        PREPARATION
# -=-=-=-=-=-=-=-=-=-=-=-=-=
RUN \
    pip install pip==20.2.4 \
    && apk update \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/* 
# -=-=-=-=-=-=-=-=-=-=-=-=-=
#         WORKDIR
# -=-=-=-=-=-=-=-=-=-=-=-=-=
ENV ROOT /opt/application
RUN mkdir -p $ROOT
WORKDIR $ROOT
# -=-=-=-=-=-=-=-=-=-=-=-=-=
#         REQUIREMENTS
# -=-=-=-=-=-=-=-=-=-=-=-=-=
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
# -=-=-=-=-=-=-=-=-=-=-=-=-=
#         APPLICATION
# -=-=-=-=-=-=-=-=-=-=-=-=-=
ENV PYTHONPATH $ROOT
COPY application.py application.py

# -=-=-=-=-=-=-=-=-=-=-=-=-=
#         COMMAND
# -=-=-=-=-=-=-=-=-=-=-=-=-=
CMD ["python3", "/opt/application/application.py"]