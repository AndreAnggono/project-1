# Project 1 - Toldya.
## Introduction
This is the second project at General Assembly.

We were asked to create a web application that checks the project requirements below.

The project requirements consists of the following:
- CRUD (Create Read Update Delete) System with at least 3 models
- Data Validation on forms and authentication
- User login
- Hosting on Heroku

Tech Stack:
- Javascript
- Ruby on Rails
- Boostrap
- Postgresql

APIs:
- [Geocoder API](http://www.rubygeocoder.com/ "Geocoder API")
- [Mapbox](https://www.mapbox.com/ "Mapbox API")
- [Leaflet](https://leafletjs.com/ "Leaflet JS")

## About
Toldya. is a community driven destination review site. The idea behind the name came from the phrase "I told ya.. It's good / It's bad..".

The website currently contains some seed data to display how it was designed to behave. I have filtered the search result from Geocoder to only display results from Australia. However, the result is pretty limited. To test this you can search for "Atlassian" or "Commbank". For search results that are not part of the seed data, it will get added to the database upon a user clicking on it. Currently I've placed some placeholder values for Overview, Contact and Website as this information wasn't available on the API.

Seed Data:
- General Assembly Sydney
- Sydney Opera House
- Gami Chicken & Beer

Link to the project hosted on Heroku => [Toldya.](https://dry-journey-45421.herokuapp.com/ "Toldya. Website")

## Validations
I ensured that a user can only perform actions on their own profile and reviews. This is done on the model controller that compares incoming actions, logged in user Id, and the corresponding model.

## Future Features
- OAuth 2.0 - Google, Twitter, Facebook.
- Like feature
- Ability to upload your own user profile photo