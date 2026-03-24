FROM pytorch/pytorch:2.11.0-cuda12.8-cudnn9-devel

RUN pip install --no-cache-dir --break-system-packages \
    sentencepiece \
    zstandard \
    datasets \
    huggingface-hub \
    tqdm \
    transformers \
    accelerate \
    safetensors \
    jupyterlab \
    && apt-get update -qq \
    && apt-get install -y -qq openssh-server git curl wget \
    && mkdir -p /run/sshd /root/.ssh \
    && ssh-keygen -A \
    && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config \
    && echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config \
    && echo "root:proteus" | chpasswd \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace
EXPOSE 22 8888

CMD ["bash", "-c", "if [ -n \"$PUBLIC_KEY\" ]; then echo $PUBLIC_KEY > /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys; fi && /usr/sbin/sshd && jupyter lab --allow-root --no-browser --port=8888 --ip=0.0.0.0 --ServerApp.token=proteus --ServerApp.allow_origin=* --ServerApp.preferred_dir=/workspace"]
