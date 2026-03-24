FROM pytorch/pytorch:2.11.0-cuda12.8-cudnn9-devel

RUN pip install --no-cache-dir \
    sentencepiece \
    zstandard \
    datasets \
    huggingface-hub \
    tqdm \
    transformers \
    accelerate \
    safetensors \
    && apt-get update -qq \
    && apt-get install -y -qq openssh-server git \
    && mkdir -p /run/sshd \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
EXPOSE 22 8888

CMD ["bash", "-c", "/usr/sbin/sshd && bash"]
