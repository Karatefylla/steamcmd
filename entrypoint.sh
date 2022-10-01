#!/usr/bin/env bash
set -e

if [ -z "$DEBUG" ]; then
    set -x
fi

if [ -z "$STEAM_APP_DIR" ]; then
    echo "STEAM_APP_DIR not set"
    exit 1
fi
if [ -z "$STEAM_APP_ID" ]; then
    echo "STEAM_APP_ID not set"
    exit 1
fi
if [ -z "$STEAM_APP_NAME" ]; then
    echo "STEAM_APP_NAME not set"
    exit 1
fi


if [ ! -z "$STEAM_BETA_BRANCH" ]; then

    PW=""
    if [ ! -z "$STEAM_BETA_PASSWORD" ]; then
        PW="-betapassword \"${STEAM_BETA_PASSWORD}\""
    fi

    echo "Loading Steam Beta Branch"
    bash "${STEAMCMD_DIR}/steamcmd.sh" +force_install_dir "${STEAM_APP_DIR}" \
                    +login anonymous \
                    +app_update "${STEAM_APP_ID}" \
                    -beta "${STEAM_BETA_BRANCH}" $PW \
                    validate \
                    +quit
else
    echo "Loading Steam Release Branch"
    bash "${STEAMCMD_DIR}/steamcmd.sh" +force_install_dir "${STEAM_APP_DIR}" \
                    +login anonymous \
                    +app_update "${STEAM_APP_ID}" \
                    validate \
                    +quit
fi

exec "$@"
