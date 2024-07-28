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
    - **Presentation:** This section has state management solutions and UI  (Pages, Components).
      

- **State Management:** Utilizes Cubit with `Future.wait` to load all 8 categories of news simultaneously. And Provider for follow/Unfollow mechanism

- **API Security:** API keys and sensitive information are managed using the `.env` file and the `envied` package for enhanced security.

## Installation

1. **Clone the repository:**

   ```bash
   https://github.com/mr-jagdish-pu/veda-intern


2. **Have your API Key of https://newsapi.org/: (Must)**

   ```bash
   https://newsapi.org/


3. **Add your API Key of https://newsapi.org/ in project: (Must)**
   Add your api key in .env file like:
   NEWS_API=your_api_key
   

   ```bash
   NEWS_API=your_api_key
   dart run build_runner build
4. **Hit flutter pub get && flutter run**
   ```bash
   flutter pub get && flutter run


# Some API responses are not consitent. I tried to be myself and tried to resolve that, Hope you will like that.




Default API : da8ed2d39448467a866b806159bfa6c7

![Screenshot_20240727-180204_Khabar_Nepal](https://github.com/user-attachments/assets/f495105e-7e95-4813-a972-11b23d4d22c3)
![Screenshot_20240727-180240_Khabar_Nepal (1)](https://github.com/user-attachments/assets/f567be3d-ae46-47f3-9057-0041822944c6)
![Screenshot_20240727-180153](https://github.com/user-attachments/assets/16c754ed-6c84-47c0-b67f-1900b9f03861)![Screenshot_20240727-180227_Android_System](https://github.com/user-attachments/assets/c9e66586-da8a-453f-94aa-8baab1cc473e)
![Screenshot_20240727-180217_Khabar_Nepal](https://github.com/user-attachments/assets/1c07c937-67a1-4ba7-bd87-366a3b441405)




