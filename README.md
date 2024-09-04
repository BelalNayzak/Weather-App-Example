# Weather App

Welcome to the Weather App Sample! Even the focus here was **NOT for UI/UX** This app is a simple yet powerful. Developed using Flutter with some advanced code skills.

## Features

- **State Management**
- **Api Integration**
- **Dependency Ininjection**
- **Clean Code**
- **Clean Architicture**
- **Error Handling**


## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/BelalNayzak/Weather-App-Example.git
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the app:**

    ```bash
    flutter run
    ```

### Testing

**Run unit tests to ensure everything is working correctly:**

```bash
flutter test
```



### Project Structure

```
lib
├── core
│   ├── constants
│   │   └── app_constants.dart        # App constants
│   ├── di
│   │   └── injection.dart            # Dependency injection setup
│   ├── extensions
│   │   └── navigation_extension.dart # Navigation extension
│   ├── network
│   │   ├── api_client.dart           # API client implementation with interceptors
│   │   ├── api_client_impl.dart      # Concrete implementation of the API client
│   │   └── api_interceptor.dart      # Interceptor to add headers and handle requests
│   ├── services
│   │   └── navigation_service.dart   # Navigation service
│   ├── style
│   │   └── app_colors.dart           # App color styles
│   ├── utils
│   │   └── ui_utils.dart             # Utility functions for UI components
│   └── widgets
│       └── custom_widget.dart        # Custom widgets for the app
├── feats
│   └── weather
│       ├── ctrl
│       │   └── weather_controller.dart # Controller to manage state and business logic
│       ├── datasource
│       │   └── weather_remote_data_source.dart # Data source implementation for fetching weather data
│       ├── model
│       │   └── weather.dart           # Model class for weather data
│       └── ui
│           ├── weather_page.dart      # Main UI page to display weather information
│           └── weather_widget.dart    # Custom widget to display weather details
├── main.dart                         # Entry point of the application

```


### Key Technologies

1. **Clone the repository:**

    ```bash
    git clone https://github.com/BelalNayzak/Todo-App-Sample.git
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the app:**

    ```bash
    flutter run
    ```



### Developer Notes

- **The focus here is not for the app ui/ux. It's just a basic ui just to focus on functinality and code quality.**


----------------------------------------------------------------------


Author: [Belal Ashraf]

Contact: [belal.nayzak@gmail.com]

LinkedIn: [https://www.linkedin.com/in/belal-ashraf-406a1a10a/]

GitHub: [/BelalNayzak]
