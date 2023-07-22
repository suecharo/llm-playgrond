FROM python:3.10.12-slim-bullseye

WORKDIR /app

RUN apt update && \
    apt install -y --no-install-recommends \
    curl \
    jq \
    tini && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --no-cache-dir --progress-bar off -U pip setuptools wheel && \
    python3 -m pip install --no-cache-dir --progress-bar off transformers[torch]

# RUN python3 -m pip install --no-cache-dir --progress-bar off -U pip setuptools wheel && \
#     python3 -m pip install --no-cache-dir --progress-bar off transformers[torch] transformers[tf-cpu] transformers[flax]

# ignore warnings
ENV TF_CPP_MIN_LOG_LEVEL=3
ENV TRANSFORMERS_VERBOSITY=error

# for caching
ENV HUGGINGFACE_HUB_CACHE=/app/huggingface_cache

# for offline use
# ENV HF_DATASETS_OFFLINE=1
# ENV TRANSFORMERS_OFFLINE=1

ENTRYPOINT ["tini", "--"]
CMD ["sleep", "infinity"]
