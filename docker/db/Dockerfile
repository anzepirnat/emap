FROM mariadb:10.6

# Copy repository SQL init scripts into the image so they are available
# to the official MariaDB entrypoint on first startup. Using build context
# = project root (set in compose: build.context: .) so ./sql is available.
COPY ./sql/ /docker-entrypoint-initdb.d/

# Ensure files are readable
RUN chmod -R a+r /docker-entrypoint-initdb.d || true

# Keep default entrypoint/cmd from base image
