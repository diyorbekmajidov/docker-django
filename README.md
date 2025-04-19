# docker-django
# we will start first: choose images postgers, python
# write t2o file Dockerfile and docker-compose.yml 
# comomand:
# 1. docker compose up --build (this command build images we can see docker desktop owner container)
# 2. docker compose down (this command stop container)
# 3. If we have small change django app utilize this command --> docker compase restart django
# 4. docker compose up --d(stop all container)


## 5. How to makemigrations django-app --> we utilize this comand(docker compose exec django python3 manage.py makemigrations) same as migrate only change makemigrations to migrate 