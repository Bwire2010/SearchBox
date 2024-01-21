# README

** Searchbox Application **

Welcome to the Searchbox application! This application utilizes Ruby on Rails for the backend (Ruby version 3.3.0, Rails version 7.0.8) and Vanilla JavaScript for the frontend.

## Table of Contents

- [Frontend Deployment](#frontend-deployment)
- [Backend Deployment](#backend-deployment)
- [Ruby Version](#ruby-version)
- [System Dependencies](#system-dependencies)
- [Configuration](#configuration)
- [Database](#database)
  - [Creation](#database-creation)
  - [Initialization](#database-initialization)
- [Deployment Instructions](#deployment-instructions)

## Frontend Deployment

The frontend of this application is deployed at [https://bwire2010.github.io/Searchbox-Frontend/](https://bwire2010.github.io/Searchbox-Frontend/). You can access and interact with the live application through this link.

## Backend Deployment

The backend of the application is deployed at [https://searchbox-005p.onrender.com/searches](https://searchbox-005p.onrender.com/searches). This is where the backend API endpoints are hosted.

## Ruby Version

This project is developed using Ruby version 3.3.0. Ensure that you have the correct Ruby version installed on your system.

## System Dependencies

The system dependencies for this project are managed using Rails, version 7.0.8. Ensure that Rails is installed on your machine before proceeding.


gem install rails -v 7.0.8

## Follow these steps to get the application up and running:

1. Clone the repository:

   ```bash
   git clone https://github.com/Bwire2010/SearchBox
   cd Searchbox
   bundle install
   rails db:create
   rails db:migrate
   rails server

Your backend will be accessible at http://localhost:3000.

Open the frontend application by visiting https://bwire2010.github.io/Searchbox-Frontend/ in your browser.
Now you have the Searchbox application up and running locally. Feel free to explore and customize it according to your needs.
