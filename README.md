<p align="center"><img width=50% src="https://raw.githubusercontent.com/sivayogasubramanian/just-to-do-it/main/assets/logo.png"/></p>

<h1 align="center">Just To-Do It</h1>

<div align="center">

[![Netlify Status](https://api.netlify.com/api/v1/badges/9514b006-1e01-472a-9101-7141f12a9f1e/deploy-status)](https://app.netlify.com/sites/just-to-do-it-website/deploys)

</div>

<h3 align="center">A todo manager built for CVWO</h3>
<h3 align="center"><a href="https://just-to-do-it-website.netlify.app/">Get Started here!</a></h3>
<h4 align="center">RUPPA NAGARAJAN SIVAYOGA SUBRAMANIAN | A0217979U</h4>
<br/>

## Project Dependencies

Install these dependencies before starting:

- Git
- Ruby (version 2.7.2)
- Rails (version 6.1.0)
- Postgresql

## Cloning this repository

```git
git clone git@github.com:sivayogasubramanian/just-to-do-it-api.git
```

## Environment Variables

This project makes use of `.env` file to store environment variables. To get started create a .env file and type these lines into your file. Be sure to replace with your postgres credentials.

```
POSTGRES_USER=<YOUR-USERNAME>
POSTGRES_PASSWORD=<YOUR-PASSWORD>
```

Copy these lines. There is no need to replace anything.

```
POSTGRES_HOST='localhost'
POSTGRES_DEVELOPMENT_DB='just_to_do_it_api_development'
POSTGRES_TEST_DB='just_to_do_it_api_test'
POSTGRES_DB='just_to_do_it_api_production'
```

## Running the API

After installing the dependencies and setting up the .env file, you can start installing the gems needed by this project by running

`bundle install`

Then you can create and migrate by running

`rails db:create && rails db:migrate`

Then you can start the server by running

`rails s -p 4000`

Now you can visit the site at [http://localhost:4000/](http://localhost:4000/)
