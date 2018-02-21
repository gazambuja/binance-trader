FROM python:3

RUN mkdir -p /img
RUN mkdir -p /db
RUN mkdir -p /app

COPY ./db/* /db/
COPY ./img/* /img/
COPY ./app/* /app/
COPY ./app/config.py /
COPY ./app/BinanceAPI.py /
COPY ./trader.py /

RUN pip install requests
RUN pip install python-binance

CMD [ "python", "./trader.py" ]
