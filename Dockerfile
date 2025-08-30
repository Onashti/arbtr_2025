FROM ubuntu:22.04
ENV PYTHONDONTWRITEBYTECODE=1
RUN apt-get update && apt-get install -y python3.10 python3-pip g++ cmake libboost-all-dev libcurl4-openssl-dev pybind11-dev
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
RUN mkdir build && cd build && cmake .. && make
COPY build/arbitrage_module.so src/python/
CMD ["python3", "src/python/main.py"]