FROM ghcr.io/karatefylla/steamcmd-base:latest

RUN	"./${STEAMCMD_DIR}/steamcmd.sh" +quit

ADD entrypoint.sh /entrypoint.sh

WORKDIR ${STEAMCMD_DIR}

ENTRYPOINT ["/entrypoint.sh"]
