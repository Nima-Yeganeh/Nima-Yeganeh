docker-compose down
docker volume rm test9_db1_data
docker volume rm test9_wp1_data
docker volume rm test9_wp1_log
docker-compose up -d
docker ps -a
