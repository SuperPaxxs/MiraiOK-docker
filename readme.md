# Docker image for MiraiOK

```bash
docker pull paxxs/miraiok
```

# Usage

1. 创建 `config.txt`, `setting.yml`, `device.json` 三个文件

```bash
if [ ! -f "config.txt" ]; then
  cp config.txt.example config.txt
fi
if [ ! -f "setting.yml" ]; then
  cp setting.yml.example setting.yml
fi
if [ ! -f "device.json" ]; then
  cp device.json.example device.json
fi
```

## 第一次运行

```bash
docker run --rm -it --name miraiok \
-v $(pwd)/config.txt:/mirai/config.txt \
-v $(pwd)/setting.yml:/mirai/setting.yml \
-v $(pwd)/device.json:/mirai/device.json \
paxxs/miraiok
```

fish shell:

```fish
docker run --rm -it --name miraiok \
-v (pwd)/config.txt:/mirai/config.txt \
-v (pwd)/setting.yml:/mirai/setting.yml \
-v (pwd)/device.json:/mirai/device.json \
paxxs/miraiok
```

## 第一次之后

### docker

```bash
docker run -t -d --name miraiok \
-v $(pwd)/config.txt:/mirai/config.txt \
-v $(pwd)/setting.yml:/mirai/setting.yml \
-v $(pwd)/device.json:/mirai/device.json \
-v $(pwd)/log:/mirai/log \
paxxs/miraiok

# fish shell:
docker run -t -d --name miraiok \
-v (pwd)/config.txt:/mirai/config.txt \
-v (pwd)/setting.yml:/mirai/setting.yml \
-v (pwd)/device.json:/mirai/device.json \
-v (pwd)/log:/mirai/log \
paxxs/miraiok
```

### docker-compose

```bash
# 启动
docker-compose up -d

# 还活着吗？？
docker ps -a | grep miraiok

# 日志
docker logs --tail 100 -f 名称
```