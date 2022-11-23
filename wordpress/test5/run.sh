docker-compose down
docker volume rm test5_db_data
docker volume rm test5_wp_data
docker volume rm test5_db1_data
docker volume rm test5_wp1_data
docker volume rm test5_db2_data
docker volume rm test5_wp2_data
docker volume rm test5_db3_data
docker volume rm test5_wp3_data
docker-compose up -d
docker ps -a
