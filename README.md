# EctoGeo

[![Build Status](https://travis-ci.org/jackjoe/ecto_geo.svg?branch=master)](https://travis-ci.org/jackjoe/ecto_geo)

Small use case to expose bug when saving geometry data with ecto/myxql on MySQL 8.0.22.

## Bug description

In our client project we have a table storing geospatial data from our Elixir/Phoenix app. We contributed to the `myxql` package to add support for geometry in MySQL. Everything worked fine until last week. We had upgraded our local mysql server from 8.0.20 to 8.0.22 and all the sudden our tests failed with the rather ambiguous error:

```elixir
** (MyXQL.Error) (1210) (ER_WRONG_ARGUMENTS) Incorrect arguments to mysqld_stmt_execute
```

After a debugging session we were able to narrow it down the the type of queries that were creating the problem. Our `POI` schema was the culprit. We debugged some more and tried to feed the data received from the web form to the same set of methods it went through in our custom Ecto type and then use that to feed it directly to `myxql`. Strangely, that worked. We suspect that somewhere along casting the data something goes wrong.

This small project does pretty much exactly what our client project does as far as creating a POI entry goes.

To be clear: the error does not occur on MySQL 8.0.20 nor 8.0.21. So as far as we are concered this is a MySQL bug related to _something_ in Ecto. But in order to file a proper report there, they will ask for a specific use case. Then our Elixir/Ecto code won't do.

## Note about the custom Ecto schema

Users select a point on a map client side, and then on the client (javascript) that point is being translated to a valid WKT string. That string is then posted to the server, where it follows the regular `changeset > cast > Repo.insert()` flow. That is the reason why we think something is going on in Ecto, since the error can not be reproduced using `myxql` only.

## Testing

Testing can be done with Docker to get a specific MySQL version up and running quickly. First run the Docker image and adjust the tag, then run the tests. Remember to stop your local mysql server if you have any running. The hostname of the dockerized mysql is '0.0.0.0'.

You can also just inspect the Travis output.

```bash
docker run -it --name=mysqld -d -e MYSQL_RANDOM_ROOT_PASSWORD=yes -e MYSQL_USER=ecto_geo -e MYSQL_PASSWORD=ecto_geo -e MYSQL_DATABASE=ecto_geo -p 3306:3306 mysql:8.0.22
# fill up your coffee now, mysql needs a bit to start up...
mix test
```
