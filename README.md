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

frontend github: 

## 6. Usage Example

The search engine is designed to capture complete searches and filter out incomplete ones. Here's an example:

1. **User Searches (because it’s instant, it records it all):**

   - (1st (random) user searches for)
     - What is
     - What is a
     - What is a good car

   - (2nd (random) user searches for:)
     - How is
     - How is emil hajric
     - How is emil hajric doing

2. **Your search engine only records:**
   - What is a good car
   - How is emil hajric doing

And removes the rest because it was an incomplete search.

## Tests

This project includes a suite of RSpec tests to ensure the proper functionality of the `SearchesController`. To run the tests, execute the following command in your terminal:

```bash
bundle exec rspec

The tests cover the following scenarios:

1. **Creating a new search and removing similar queries:**
   - *Description:* Tests whether a new search is created and similar queries are removed when the query is new and more complete.
   - *Command:* `bundle exec rspec spec/controllers/searches_controller_spec.rb:9`

2. **Not creating a new search for incomplete queries:**
   - *Description:* Verifies that incomplete queries do not result in a new search being created.
   - *Command:* `bundle exec rspec spec/controllers/searches_controller_spec.rb:21`

3. **Fetching recent searches for the current user:**
   - *Description:* Ensures that recent searches for the current user are fetched correctly.
   - *Command:* `bundle exec rspec spec/controllers/searches_controller_spec.rb:31`

4. **Not recording incomplete searches:**
   - *Description:* Confirms that incomplete searches are not recorded.
   - *Command:* `bundle exec rspec spec/controllers/searches_controller_spec.rb:41`

Run the tests regularly to ensure continued functionality as the project evolves.

## Contributing

Provide guidelines for contributors if applicable.


Your backend will be accessible at http://127.0.0.1:3000/.

Now you have the Searchbox application up and running locally. Feel free to explore and customize it according to your needs.

## License
patrobas2012@gmail.com 