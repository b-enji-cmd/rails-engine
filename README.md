<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->


<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
      </ul>
    </li>
    <li><a href="#rest-endpoints">ReST Endpoints</a></li>

  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

You are working for a company developing an E-Commerce Application. Your team is working in a service-oriented architecture, meaning the front and back ends of this application are separate and communicate via APIs. Your job is to expose the data that powers the site through an API that the front end will consume.

Areas of exploration and learning on this project included:

* Expose an API ⭐ ⭐ ⭐
* Use serializers to format JSON responses ⭐ ⭐ ⭐
* Test API exposure ⭐ ⭐ ⭐
* Compose advanced ActiveRecord queries to analyze information stored in SQL databases ⭐ ⭐
* Write basic SQL statements without the assistance of an ORM ⭐


### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [Postman](https://www.postman.com/)

<!-- GETTING STARTED -->
## Getting Started

1. Clone this repo
2. Install gem packages: `bundle install`
3. Seed. A pgdump can be found in `./db/data` 
    ```
    rails db:{drop,create,migrate,seed}
    ```
4. Run the RSpec test suite: 
```
bundle exec rspec
```
6. Start your local server:
```
rails s
```

### Prerequisites

* Ruby 2.5.3
* Rails 5.2.5

<!-- USAGE EXAMPLES -->
## ReST Endpoints

### Get All Merchants

  ```
  GET /api/v1/merchants
  ```

