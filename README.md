# PetCareApp

A Flutter mobile application that displays a list of media items in carousels based on an API call. Users can view details of a media item and play videos in a simulated player screen.

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Dependencies](#dependencies)

## Features

- Search for media items using The Movie Database (TMDB) API.
- Display media items in carousels sorted by media type.
- Navigate to detail screen to view more information about a media item.
- Play videos in a simulated player screen.
- Responsive design for mobile and tablet devices.
- Shimmer effect for image loading placeholders.

## Architecture

This project follows the MVC (Model-View-Controller) architecture with GetX for state management and dependency injection. It is divided into three main components:

1. **Model**: Contains data classes and business logic (e.g., API calls).
2. **View**: Defines the UI of the application.
3. **Controller**: Manages the state of the application and acts as a bridge between the model and the view.

## Project Structure


## Installation

1. **Clone the repository**:
   ```sh
   git clone https://github.com/shahzebnaqvi/petcare-coding-challenge.git
   cd petcareapp
2. **Install dependencies**:
   ```sh
   flutter pub get

## Usage
1. **Obtain a TMDB API key**:
Sign up at The Movie Database (TMDB) and obtain an API key.

2. **Update API key**:
Replace the placeholder API key in lib/models/api_service.dart with your actual API key:
  ```sh
  final String apiKey = 'YOUR_API_KEY';
  ```
2. **Run the app:**
   ```sh
   flutter run
   ```

## Dependencies

- Flutter
- GetX
- http
- cached_network_image
- intl
- shimmer
- cupertino_icons
- lottie
- mockito
- build_runner
- flutter_lints

   




