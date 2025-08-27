FROM python:3.11-slim AS builder
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential cmake git python3-dev pkg-config libssl-dev && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY . /build
RUN mkdir -p cpp/fastlane/build && cd cpp/fastlane/build && cmake .. && cmake --build . --config Release

FROM python:3.11-slim
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /build/src /app/src
COPY --from=builder /build/cpp/fastlane/build/fastlane.* /app/src/fastlane/
COPY requirements.txt /app/
RUN python -m pip install -r requirements.txt
CMD ["python", "-m", "src.main"]
