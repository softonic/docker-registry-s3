# softonic/registry-s3

[![](https://images.microbadger.com/badges/image/softonic/registry-s3.svg)](https://microbadger.com/images/softonic/registry-s3 "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/softonic/registry-s3.svg)](https://microbadger.com/images/softonic/registry-s3 "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/softonic/registry-s3.svg)](https://microbadger.com/images/softonic/registry-s3 "Get your own commit badge on microbadger.com")

Extension of the official image that provides a way to configure S3 as a backend in runtime.

## Usage

```
docker run \
  -e AWS_BUCKET=acme-docker \
  -e AWS_KEY=YOUR-KEY-HERE \
  -e AWS_SECRET=YOUR-SECRET-HERE \
  -e AWS_REGION="eu-west-1" \
  -e STORAGE_PATH=/registry \
  -p 5000:5000 \
  softonic/registry-s3
```

### Example usage in Swarm Mode
 
```
docker service create --name registry-s3 \
  -e AWS_BUCKET=acme-docker \
  -e AWS_REGION="eu-west-1" \
  -e AWS_KEY=YOUR-KEY-HERE \
  -e AWS_SECRET=YOUR-SECRET-HERE \
  -e STORAGE_PATH=/registry \
  -p 5000:5000 \
  softonic/registry-s3
```
