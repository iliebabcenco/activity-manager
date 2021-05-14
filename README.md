# Activities Manager

## Description

I did this project for learning purposes as a capstone project from Microverse after completing the Ruby on Rails curriculum.
It is a web app for daily activities and is intended for mobile phones.

I implemented next features in this project:

1. User's page with link for navigation;
2. Personal activities page where a user can create, see and sort all personal activities;
3. Group activities page where are displayed only public activities created by user or where user is a participant;
4. All participations page which includes all activities created by user and also where user is a participant;
5. All groups page where users can create new groups or select from existing to show their ideas of activities or to find some interesting activities from other users;
6. Feed page which displays all users' activities ordered by created time.

## Built With

- Ruby on Rails
- Bootstrap

## Set up this projecect locally

- Install the following:

1. Ruby
2. Ruby on Rails
3. PostgreSQL
4. Yarn
5. Node.js

- Open the terminal in the directory where you want to install the app;
- Run command `git clone git@github.com:iliebabcenco/contributions.git` which will clone the project;
- Switch to the main directory of project using cd;
- Run `bundle install` in your computer terminal to install required gems;
- Run `rails db:create` for creating the database on your local machine and also `rails db:migrate` for migration;
  (P.S. If you have any authentification errors with your database on running previous commands, you should got to the config/database.yml file and introduce in development section and also in test section two lines of code ex:
  `username: "postgres"`
  `password: 123456`
  where username is your local postgres user(usually it is postgres and your password))
- Run `rails server` to start the server;
- Open in your browser the URL http://localhost:3000/;
- Use it.

## How it looks

| View on mobile version       | View on mobile version       | View on mobile version       |
| ---------------------------- | ---------------------------- | ---------------------------- |
| ![](app/assets/images/1.png) | ![](app/assets/images/2.png) | ![](app/assets/images/3.png) |
| ![](app/assets/images/4.png) | ![](app/assets/images/5.png) |

### Run tests

1. Open terminal and switch to project directory
2. Write next lines:

```
    rails db:migrate RAILS_ENV=test
```

```
    rspec --format documentation
```

### Deployment

This application is deployed on [Heroku](https://www.heroku.com/) [there](https://activity-mg.herokuapp.com/).

## Authors

👤 **Ilie Babcenco**

[![](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/iliebabcenco) [![](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ilie-babcenco-72459a1b1/) [![](https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/BabcencoIlie)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

If you want to contribute, you can clone this project or fork it.

If you found an issue, feel free to check the [issues page](https://github.com/iliebabcenco/my-telegram-bot/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://www.microverse.org/)
