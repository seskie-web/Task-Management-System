<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

To setup the project simply follow steps below:
- Clone or download the backend branch
- Rename .env.example to .env
- Update the database connection string on the renamed .env file to point to your local db
- e.g 
    - DB_CONNECTION=mysql
    - DB_HOST=127.0.0.1
    - DB_PORT=3306
    - DB_DATABASE=tasks
    - DB_USERNAME=seskie  
    - DB_PASSWORD=seskiev
- Run command: composer update to download the needed packages by the framework
- Set permissions on the project to 755 or 777 since its a local project, for detailed instruction please refer to: https://www.hostinger.com/tutorials/how-to-install-laravel-on-ubuntu
- Run command: php artisan migrate to run the database migration, the migration command will create a table named tasks on your database, the database migration file can be found on app/database/migration/2024_03_09_111734_create_tasks_table.php 
- Run command: php artisan serve to start the backend api server, which will run on http://127.0.0.1:8000
- e.g
- ![Screenshot from 2024-03-12 17-49-40](https://github.com/seskie-web/taskmanager/assets/62250862/d13dc648-f88f-4c99-9baa-29cf0f1dfa9a)
  




