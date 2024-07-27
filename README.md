# News App

## Overview

This Flutter application is designed to showcase skills in Flutter development for an internship evaluation. It features a headline page with multiple tabs for different news categories and a detailed news view for each article.

## Features

- **Headline Page:** Displays news headlines organized into 8 tabs:
    - General
    - Sports
    - Politics
    - Business
    - Health
    - Entertainment
    - Science
    - Technology

- **Detailed News Screen:** Clicking on a news tile navigates to a detailed view including:
    - News provider logo
    - News provider name
    - Follow/Unfollow button
    - News thumbnail
    - News topic
    - News title
    - News content
    - Button to navigate to the original article in Chrome

## Architecture

- **MVC Architecture:** The app follows the Model-View-Controller architecture, ensuring a clear separation of concerns:
    - **Model:** Data source and repository
    - **View:** UI components and screens
    - **Controller:** State management and business logic

- **State Management:** Utilizes Cubit with `Future.wait` to load all 8 categories of news simultaneously. And Provider for follow/Unfollow mechanism

- **API Security:** API keys and sensitive information are managed using the `.env` file and the `envied` package for enhanced security.

## Installation

1. **Clone the repository:**

   ```bash
   https://github.com/mr-jagdish-pu/veda-intern


2. **Add your API Key of https://newsapi.org/: (Must)**

   ```bash
   https://newsapi.org/

Default API : da8ed2d39448467a866b806159bfa6c7