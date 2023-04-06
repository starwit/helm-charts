#!/bin/sh
: "${ENV_FILE:=${HOME}/.pod_environment}"
if [ -f "${ENV_FILE}" ]; then
    echo "Sourcing ${ENV_FILE}"
    . "${ENV_FILE}"
fi

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - post_init - $1"
}

log "Creating user database in TimescaleDB"
psql -d "$URL" <<__SQL__
    CREATE ROLE hackathon;
    CREATE DATABASE hackathon OWNER hackathon;
    ALTER USER hackathon WITH PASSWORD 'hackathon';
__SQL__

# We exit 0 this script, otherwise the database initialization fails.
exit 0
