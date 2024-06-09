# graphql_flutter_frontend_query_with_provider
Consuming GraphQL APIs With Flutter Provider Package


1. Download backend code..
git clone [https://github.com/kinparmar/ghar24](https://github.com/kinparmar/ghar24.git)

2. Download frontend code..
https://github.com/kinparmar/graphql_flutter_frontend_query_with_provider.git

3. Download and setup MySQL databases.
  Start the mysql.
  
  create the database name: 
  hello_world_db
4. Change the database details in the backend code 
  edit the config/config.json
  "development": {
    "username": "root",
    "password": "root",
    "database": "hello_world_db",
    "host": "127.0.0.1",
    "dialect": "mysql"

5. run the backend end code
   node .\src\index.js  
   Server is running on localhost:4000
6. Open the browser, add the user details through browser in the database and verify as well.
     mutation CreateUser {
      createUser(name: "Kiran", email: "kiran@gmail.com", 
      password: "password") {
        name
        email
      }
    }
![image](https://github.com/kinparmar/graphql_flutter_frontend_query_with_provider/assets/119789351/41fb94a6-6b21-4df3-9813-521f325b611d)

7. verify the user details through browser from the database.
   query allUser {
      allUser {
        name
        email
      }
    }
8. now got to front end code and run the front end code.
   1. cd frontend_provider
   2. fultter run -d chrome


  This page should be update..
