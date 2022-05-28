#!/usr/bin/env bash
set -e

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
	echo "Loading Steam Beta Branch"
	bash "${STEAMCMD_DIR}/steamcmd.sh" +force_install_dir "${STEAM_APP_DIR}" \
					+login anonymous \
					+app_update "${STEAM_BETA_APP}" \
					-beta "${STEAM_BETA_BRANCH}" \
					-betapassword "${STEAM_BETA_PASSWORD}" \
					+quit
else
	echo "Loading Steam Release Branch"
	bash "${STEAMCMD_DIR}/steamcmd.sh" +force_install_dir "${STEAM_APP_DIR}" \
					+login anonymous \
					+app_update "${STEAM_APP_ID}" \
					+quit
fi

exec "$@"
