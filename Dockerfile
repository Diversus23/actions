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
RUN opm install asserts tempfiles json fs logos cli ftp v8storage v8runner v8find v8unpack 1connector coloratos ParserFileV8i allurehelper oscript-md

# Пакет oscript-md 0.1.0 приходит из хаба без lib.config, поэтому директива
# "#Использовать oscript-md" его не находит. Генерируем описание пакета из состава
# каталогов src/Классы и src/Модули (вложенные каталоги библиотека подключает сама).
RUN set -eux; \
    LIB_DIR="$(dirname "$(find / -type d -name 'oscript-md' -path '*/lib/*' -print -quit)")/oscript-md"; \
    cd "$LIB_DIR"; \
    { \
      echo '<?xml version="1.0" encoding="utf-8"?>'; \
      echo '<package-def xmlns="http://oscript.io/schemas/lib-config/1.0">'; \
      for f in src/Классы/*.os; do [ -f "$f" ] || continue; echo "    <class name=\"$(basename "$f" .os)\" file=\"$f\"/>"; done; \
      for f in src/Модули/*.os; do [ -f "$f" ] || continue; echo "    <module name=\"$(basename "$f" .os)\" file=\"$f\"/>"; done; \
      echo '</package-def>'; \
    } > lib.config; \
    cat lib.config

WORKDIR /opt/actions

COPY packagedef ./
COPY src ./src

RUN opm install -l
