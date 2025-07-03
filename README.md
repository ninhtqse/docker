# Build & Up Docker

```bash
    sh build.sh
```

# Quick tip
The Docker team recommends that you avoid mounting from the Windows 10 file system (even on a WSL distro). For example, avoid 
```
docker run -v /mnt/c/users:/users 
```
and use 
```
docker run -v ~/my-project:/sources <my-image> instead.
```

# Install mssql
docker pull mcr.microsoft.com/mssql/server
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Password_123#" -p 1433:1433 --name sqlserver -d mcr.microsoft.com/mssql/server