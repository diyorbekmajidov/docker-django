# docker-django
## we will start first: choose images postgers, python
## write t2o file Dockerfile and docker-compose.yml 
### Build and Start Docker Containers
```
docker compose up --build -d
```
### Access Django's Shell
```
docker exec -it django_app sh
```

## Django
### Make Migrations
```
python manage.py makemigrations
```
### Apply Migrations
```
python manage.py migrate
```
### Create superuser (if not done already)
```
python manage.py createsuperuser
```
### Restart Django Container
```
docker-compose restart django 
```
### Extract SQL from database
```
python manage.py inspectdb > models.py
```
### Extract SQL code from migration
```
python manage.py sqlmigrate inventory 0001

```
### intery postgres container
docker compose exec postgres sh

