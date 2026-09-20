# E-commerce App

Flutter e-commerce app built as a technical assignment.

## Features

* Login and Sign Up with Firebase
* Get products from REST API
* Search products
* Filter products by category
* Search and filter together
* Responsive UI

## Technologies

* Flutter
* Dart
* Flutter BLoC (Cubit)
* Dio
* Firebase Authentication
* DummyJSON API

## API

The app uses the DummyJSON Products API:

`https://dummyjson.com/products`

## Project Structure

```text
lib/
├── models/
├── services/
├── controllers/
├── views/
├── widgets/
├── firebase_options.dart
└── main.dart
```

## How to Run

```bash
flutter pub get
flutter run
```

Firebase Authentication with Email/Password should be enabled for the project.

## Implementation

Products are fetched using Dio and managed using Cubit.

Authentication is handled using Firebase Authentication.

Search and category filtering are handled together in the ProductCubit.

`LayoutBuilder` is used to make the product grid responsive on different screen sizes.
