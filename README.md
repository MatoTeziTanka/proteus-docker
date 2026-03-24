# PROTEUS Docker Image

GPU compute image for [Light Speed Up](https://lightspeedup.com) projects.

## What's inside

- **PyTorch 2.11.0** + CUDA 12.8 + cuDNN 9 (official base)
- sentencepiece, zstandard, datasets, huggingface-hub, tqdm
- SSH server + git
- Nothing else

## Usage

```bash
docker pull matotezitanka/proteus:latest
```

### RunPod Template

Deploy on RunPod: `matotezitanka/proteus:latest`

### Local

```bash
docker run --gpus all -it matotezitanka/proteus:latest bash
```

## Build

Automated via GitHub Actions on push to main.

Manual:
```bash
docker build -t matotezitanka/proteus:latest .
docker push matotezitanka/proteus:latest
```

## License

MIT
