docker-compose down
docker volume rm test6_db_data
docker volume rm test6_wp_data
docker volume rm test6_db1_data
docker volume rm test6_wp1_data
docker volume rm test6_db2_data
docker volume rm test6_wp2_data
docker volume rm test6_db3_data
docker volume rm test6_wp3_data
docker-compose up -d
docker ps -a
