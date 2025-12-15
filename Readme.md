# eMap - Django Web Application

A Django-based web application with MariaDB backend. This project is designed for easy deployment using **Docker Compose** and **Portainer** (via GitHub repository stack).

## Features

- Django backend
- MariaDB database
- Gunicorn + Nginx production-ready setup
- Automatic database initialization (runs only once)
- Static and media file serving
- Configurable external port (to avoid conflicts)
- Persistent database volume

## Repository Structure

```
emap/
├── emapp/                  # Main Django project directory (settings, wsgi, etc.)
├── manage.py               # Django management script
├── requirements.txt        # Python dependencies
├── sql/
│   └── init.sql            # Initial database schema/data (runs only on first deployment)
├── nginx/
│   └── nginx.conf          # Nginx configuration
├── Dockerfile              # Builds the Django/Gunicorn container
├── docker-compose.yml      # Orchestrates db, app, and nginx services
├── .env.example            # Template for environment variables
└── README.md               # This file
```

## Quick Deployment with Portainer

1. In Portainer, create a new **Stack**.
2. Select **Git repository**.
3. Repository URL: `https://github.com/ub-lucami/emap`
4. Path to Compose file: `docker-compose.yml`
5. (Optional) Set environment variables in the Portainer UI (or import the .env file from local repo - because of secrets .env is in .gitignore):
   - `WEB_PORT=8080` (or any free port, e.g., 8000, 8888 if 80 is in use)
   - `DJANGO_SECRET_KEY=your_very_long_random_key`
   - `DB_ROOT_PASSWORD=strong_root_password`
   - `DB_PASSWORD=strong_app_password`
   - `DJANGO_ALLOWED_HOSTS=your-domain.com,localhost` (or `*` for testing)
   - `DJANGO_DEBUG=False`
6. Deploy the stack.

Access your app at: `http://your-server-ip:WEB_PORT`

> The database will be initialized automatically on **first deployment only** using `sql/init.sql`. Caution: init.sql MUST begin with 
  
-- Ensure we are in the right database for all statements
CREATE DATABASE IF NOT EXISTS `emapp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `emapp`;



## Local Development / Testing

1. Clone the repository:
   ```bash
   git clone https://github.com/ub-lucami/emap.git
   cd emap
   ```

2. Copy the environment template:
   ```bash
   cp .env.example .env
   ```
   Edit `.env` with your preferred values (especially secrets and `WEB_PORT`).

3. Build and start:
   ```bash
   docker compose up --build
   ```

4. Access the app at `http://localhost:${WEB_PORT}` (default: http://localhost:80)

5. To run Django commands:
   ```bash
   docker compose exec app python manage.py createsuperuser
   docker compose exec app python manage.py migrate
   ```

    In Portainer use its Built-in Console

    Go to Stacks in Portainer and click on your stack name (e.g., emap or whatever you named it).
    In the stack details, go to the Services tab or click on the app service (the container name is emap-app).
    Click on the running container name emap-app → Console (or Exec Console).
    In the console:
    Select /bin/sh as the shell (or /bin/bash if available).
    Click Connect.

    Now you are inside the running app container. Run your Django commands:Bashpython manage.py createsuperuserorBashpython manage.py migrateor any other command like python manage.py collectstatic --noinput
    Press Enter and follow the prompts (e.g., for superuser: username, email, password).

## Important Notes

- **`sql/init.sql` runs only once** during initial database creation (thanks to MariaDB's entrypoint behavior and persistent volume).
- If you need to reset the database: delete the stack **and** remove the `db-data` volume in Portainer.
- Migrations and static collection run automatically on every app container start.
- For production: always override secrets in Portainer (do not commit real `.env` with passwords).
- The external web port is fully configurable via `WEB_PORT` to avoid conflicts with other containers.

## Customization

- Change Django project name? Update the Gunicorn command in `Dockerfile` (currently `landing_page.wsgi:application`).
- Add more environment variables in `docker-compose.yml` and use them in `emapp/settings.py`.
- Adjust `nginx.conf` for custom domains, SSL (recommend external reverse proxy like Traefik or Caddy for HTTPS), or larger uploads.

## Contributing

Feel free to open issues or pull requests for improvements!

---

**Enjoy your eMap deployment!** 🚀
