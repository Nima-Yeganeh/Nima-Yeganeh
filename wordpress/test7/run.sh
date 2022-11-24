docker-compose down
docker volume rm test7_db_data
docker volume rm test7_wp_data
docker volume rm test7_db1_data
docker volume rm test7_wp1_data
docker volume rm test7_db2_data
docker volume rm test7_wp2_data
docker volume rm test7_db3_data
docker volume rm test7_wp3_data
docker-compose up -d
docker ps -a
