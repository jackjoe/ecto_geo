# EctoGeo

[![Build Status](https://travis-ci.org/jackjoe/ecto_geo.svg?branch=main)](https://travis-ci.org/jackjoe/ecto_geo)

Small use case to expose bug when saving geometry data with ecto/myxql on MySQL 8.0.22.

**TODO: Add description**

## Testing

Testing can be done with Docker to get a specific MySQL version up and running quickly. First run the Docker image and adjust the tag, then run the tests. Remember to stop your local mysql server if you have any running. The hostname of the dockerized mysql is '0.0.0.0'.

```bash
docker run -it --name=mysqld -d -e MYSQL_RANDOM_ROOT_PASSWORD=yes -e MYSQL_USER=ecto_geo -e MYSQL_PASSWORD=ecto_geo -e MYSQL_DATABASE=ecto_geo -p 3306:3306 mysql:8.0.22
# fill up your coffee now, mysql needs a bit to start up...
mix test
```
