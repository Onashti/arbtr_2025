# Arbitrage Bot
## Overview
Bot for crypto arbitrage across Binance, Bybit, OKX (pairs: BTC/USDT, ETH/USDT, SOL/USDT, BNB/USDT, XRP/USDT).
Python: API fetching, orchestration. C++: Arbitrage calc, trade execution.

## Installation
1. Clone: `git clone https://github.com/Onashti/arbtr_2025.git`
2. Python deps: `pip install -r requirements.txt` (ccxt, pybind11, etc.)
3. C++ deps: On Linux: `sudo apt install g++ cmake libboost-all-dev libcurl4-openssl-dev pybind11-dev`; Windows: Ask C++-dev for setup.
4. Build C++: `cd src/cpp; mkdir build; cd build; cmake ..; make`
5. Copy .so: `cp build/arbitrage_module.so src/python/` (Linux) or equivalent for Windows.
6. Config: Copy `config/example.env` to `.env`, fill API keys.

## Running
- Local: `python src/python/main.py`
- Docker: `docker build -t arbitrage-bot .; docker run -d --env-file .env arbitrage-bot`

## Testnet Setup
Use testnet keys from Binance (testnet.binance.vision), Bybit (testnet.bybit.com), OKX to avoid real funds.

## Config (.env)