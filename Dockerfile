FROM evilbeaver/onescript:2.1.0

# git нужен для checkout репозитория GitLab Runner'ом внутри контейнера
# и для команд changelog/pipeline в actions.os.
# zip/unzip и aws-cli нужны для сборки дистрибутивов и заливки в S3.
RUN apt-get update \
 && apt-get install -y --no-install-recommends git ca-certificates curl zip unzip \
 && set -eux; \
    ARCH="$(dpkg --print-architecture)"; \
    case "$ARCH" in \
      amd64) AWSCLI_ARCH=x86_64 ;; \
      arm64) AWSCLI_ARCH=aarch64 ;; \
      *) echo "Unsupported architecture: $ARCH" >&2; exit 1 ;; \
    esac; \
    curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-${AWSCLI_ARCH}.zip" -o /tmp/awscliv2.zip; \
    unzip -q /tmp/awscliv2.zip -d /tmp; \
    /tmp/aws/install; \
    rm -rf /tmp/awscliv2.zip /tmp/aws \
 && rm -rf /var/lib/apt/lists/*

# Пакеты OneScript ставим и глобально (видно в /var/oscript/lib),
# и локально в oscript_modules ниже через "opm install -l".
RUN opm install asserts tempfiles json fs logos cli ftp v8storage v8runner v8find v8unpack 1connector coloratos ParserFileV8i allurehelper

WORKDIR /opt/actions

COPY packagedef ./
COPY src ./src

RUN opm install -l
