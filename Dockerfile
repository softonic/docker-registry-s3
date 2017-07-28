FROM registry:2.6.2

ARG "version=0.1.0-dev"
ARG "build_date=unknown"
ARG "commit_hash=unknown"
ARG "vcs_url=unknown"
ARG "vcs_branch=unknown"

LABEL org.label-schema.vendor="Softonic" \
    org.label-schema.name="registry-s3" \
    org.label-schema.description="Registry image with S3 storage configured" \
    org.label-schema.usage="/src/README.md" \
    org.label-schema.url="https://github.com/softonic/docker-registry-s3/blob/master/README.md" \
    org.label-schema.vcs-url=$vcs_url \
    org.label-schema.vcs-branch=$vcs_branch \
    org.label-schema.vcs-ref=$commit_hash \
    org.label-schema.version=$version \
    org.label-schema.schema-version="1.0" \
    org.label-schema.docker.cmd.devel="" \
    org.label-schema.docker.params="AWS_BUCKET=S3 bucket name,\
AWS_REGION=AWS Region to use,\
AWS_KEY=Your account key,\
AWS_SECRET=Your account secret,\
STORAGE_PATH=S3 bucket directory to use" \
    org.label-schema.build-date=$build_date

ENV STORAGE_PATH="/"

COPY rootfs /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/etc/docker/registry/config.yml"]
