FROM liuchong/rustup:stable

LABEL name="rust-musl-stable"
LABEL version="1.0.0"

LABEL com.github.actions.name="Rust MUSL Builder Slim"
LABEL com.github.actions.description="Provides a Rust MUSL environment"
LABEL com.github.actions.icon="settings"
LABEL com.github.actions.color="orange"

ENV BUILD_DIR=/build \
    OUTPUT_DIR=/output \
    RUST_BACKTRACE=1 \
    OPENSSL_LIB_DIR=/usr/local/ssl/lib \
    OPENSSL_INCLUDE_DIR=/usr/local/ssl/include \
    OPENSSL_STATIC=1 \
    PKG_CONFIG_ALLOW_CROSS=1

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    musl-tools

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
