


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

<!-- REFLECTIONS -->
## Reflections
Looking back on this project after some time has passed, I was really proud of what I accomplished here. The circumstances around the initial assignment was a little chaotic. Before this project, our cohort had been building projects in regular Ruby on Rails apps. As we were being assigned this project, we were essentially told to research the Rails API framework and "figure it out" which in hindsight was what stirred the fire in my belly. Over the next day, I managed to get comfortable with the framework and build the initial structure in a matter of hours. 

A major highlight was experimenting with Exception Handling. I had always wanted to implement a system that could raise and handle exceptions that I created and this environment seemed like the perfect opportunity! Investigating how Rails manages and structures exceptions was fascinating and I wanted to throw them everywhere I could. I learned very quickly, that line of thinking is definitely dangerous and should only be used when critically needed. 

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


<details open>
<summary>ReST Endpoints</summary>
<br>
  
### Get All Merchants

```
GET /api/v1/merchants
```
### Get All Items
```
GET /api/v1/items
```
### Get One Merchant
```
GET /api/v1/merchants/:id
```
### Get A Merchants Items
```
GET /api/v1/merchants/:id/items
```
### Get One Item
```
GET /api/v1/items/:id
```
### Create One Item
```
POST /api/v1/items
```
### Delete One Item
```
DELETE /api/v1/items/:id
```
> Will return 404 if specified item does not exist
### Update One Item
```
PUT /api/v1/items/:id
```
> Example request body, provides a 404 if supplied a bad merchant id
```
{
  "name": "new item name",
  "description": "new item description",
  "unit_price": <float>,
  "merchant_id": <valid id integer>
}
```

### Get One Item's Merchant
```
GET /api/v1/items/:id/merchant
```
### 
</details>

<details open>
<summary>Un-ReSTful</summary>
<br>
  
### Find One Merchant by Name
>Required parameters `name` 
```
GET /api/v1/merchants/find?name=x
```
### Find All Items by Name
>Required parameters `name` 
```
GET /api/v1/items/find_all?name=x
```
### List Merchants by Items Sold
>Required parameters `quantity`. Non negative
```
GET /api/v1/merchants/most_items?quantity=X
```
### List Merchants by Revenue
>Required parameters `quantity`. Non negative
```
GET /api/v1/revenue/merchants?quantity=x
```
### Find Revenue of a Single Merchant
>Required parameters `id`
```
GET /api/v1/revenue/merchants/:id
```
### Weekly Revenue Report 
```
GET /api/v1/revenue/weekly
```

</details>

