docker-compose down
docker volume rm test10_db1_data
docker volume rm test10_wp1_data
docker volume rm test10_wp1_log
docker-compose up -d
docker ps -a
