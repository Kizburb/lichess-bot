FROM debian:10.10-slim
MAINTAINER OIVAS7572
RUN echo OIVAS7572
CMD echo OIVAS7572
COPY . .

#ADD /engine/ .
#RUN rm -r engine

# If you are using docker and you want to run any other commands use "RUN" before.

RUN apt-get update && apt-get install -y wget python3 python3-pip p7zip-full

RUN wget --no-check-certificate "https://gitlab.com/OIVAS7572/Goi5.1.bin/-/raw/master/Goi5.1.bin.7z" -O Goi5.1.bin.7z
RUN 7z e Goi5.1.bin.7z
RUN rm Goi5.1.bin.7z

RUN wget --no-check-certificate "https://github.com/ianfab/Fairy-Stockfish/releases/download/fairy_sf_13_1/fairy-stockfish_x86-64-bmi2" -O stockfishmodern
#RUN wget --no-check-certificate "https://tests.stockfishchess.org/api/nn/nn-9e3c6298299a.nnue" -O nn-9e3c6298299a.nnue
RUN mv stockfishmodern stockfishmodern

COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN chmod +x stockfishmodern
# Engine name is here ^^^^^^

CMD python3 run.py