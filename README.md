# Docker Development Environment

This repository contains a Docker development environment setup with Nginx, PHP-FPM, MySQL, Redis, and PostgreSQL.

## Quick Start

Build and start containers:

```bash
sh build.sh
```

## Project Structure

```
.
├── code/
│   └── html/        # Source code directory
├── mysql/           # MySQL configuration
├── nginx/           # Nginx configuration
├── php/             # PHP configuration
└── docker-compose.yml
```

## Services

The environment includes:

- **Nginx**
  - Port: 81:80
  - Config: nginx/nginx.conf

- **PHP 8.2-FPM**
  - Extensions: mysqli, pdo, pcntl, intl, zip, redis, gd, xdebug, etc.

- **MySQL 8.0**
  - Port: 3309:3306
  - Root password: Ka3%u6Ae
  - Default user: foo/hA*+BEAe
  - Database: sample

- **Redis**
  - Port: 6379:6379
  - No authentication required

- **PostgreSQL 15**
  - Port: 5432:5432
  - Credentials: myuser/mypassword
  - Database: mydb

## Network Configuration

Using bridge network (subnet: 10.203.0.0/16):
- Nginx: 10.203.0.2
- PHP: 10.203.0.3
- MySQL: 10.203.0.4
- Redis: 10.203.0.5
- PostgreSQL: 10.203.0.6

## Important Note for Windows Users

When using Docker on Windows 10, avoid mounting from the Windows file system. Instead of:

```bash
docker run -v /mnt/c/users:/users
```

Use:

```bash
docker run -v ~/my-project:/sources <my-image>
```

## Optional: MSSQL Server Setup

To install Microsoft SQL Server:

```bash
docker pull mcr.microsoft.com/mssql/server
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Password_123#" -p 1433:1433 --name sqlserver -d mcr.microsoft.com/mssql/server
```

## Volumes

- mysql-data: Persistent MySQL data
- postgres-data: Persistent PostgreSQL data
- vendor: PHP vendor packages
- post-call-survey: Project specific volume

## Health Checks

All services are configured with health checks to ensure system stability.

## Additional Resources

- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)