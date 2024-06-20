# Nest - Backend
<p align="justify">
Nest - Backend is the backend component of Nest, mainly focused on APIs used to integrate with the Machine Learning model and the end user.
<p/>

## Documentation

## Backend and Cloud Architecture

## Tech Stack

<ul>
  <li>Java Script</li>
  <li>HAPI Framework</li>
  <li>Firebase</li>
  <li>Google Cloud Platform Services</li>
  <ul>
    <li>App Engine</li>
    <li>Cloud Storage</li>
    <li>Cloud Run</li>
    <li>Cloud SQL</li>
  </ul>
</ul>

## Dependencies

<ul>
  <li>@hapi/hapi: 21.3.9</li>
  <li>axios: 1.7.2</li>
  <li>dotenv: 16.4.5</li>
  <li>firebase: 10.12.2</li>
  <li>firebase-admin: 12.1.1</li>
  <li>mysql2: 3.9.8</li>
  <li>nodemon: 3.1.1</li>
  <li>sequelize: 6.37.3</li>
</ul>

## Code Configurations

### Environment Configuration
To run this project, you will need to add the following environment variables to your  ``` .env ``` file:
```
DB_NAME=
DB_USER=
DB_PASSWORD=
DB_HOST=
DB_PORT=
```

### Firebase Database Configuration
To obtain the required configuration, create a Firebase project and retrieve the following details and put them in your ``` .env ``` file :
``` 
FIREBASE_API_KEY=
FIREBASE_AUTH_DOMAIN=
FIREBASE_PROJECT_ID=
FIREBASE_STORAGE_BUCKET=
FIREBASE_MESSAGING_SENDER_ID=
FIREBASE_APP_ID=
```

## Local Development
To run this application locally, please carefully follow these steps :
1. Clone the project and navigate to the project directory.
   ```
   git clone https://github.com/Nest-NextStep/nest-backend.git
   cd nest-backend
   ```
3. Install the dependencies.
   ```
   npm install
   ```
4. Run XAMPP MySQL server
5. Migrate SQL codes to MySQL Server by copying the file in database_creation folder
6. Run the server
   ```
   npm run start:dev
   ```

##
