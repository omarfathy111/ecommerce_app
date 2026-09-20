# E-commerce App

A simple Flutter e-commerce app built as a technical assignment.

The app gets products from a public REST API and includes Firebase authentication, search, filtering, and responsive UI.

## Features

* Sign Up with Email and Password
* Login and Logout
* Get products from REST API
* Search products by name
* Filter products by category
* Search and filter products together
* Show product image, name, price, and category
* Loading and error handling
* Responsive design

## Technologies

* Flutter
* Dart
* Flutter BLoC (Cubit)
* Dio
* Firebase Authentication
* DummyJSON API
* Device Preview

## API

I used the DummyJSON Products API:

`https://dummyjson.com/products`

I used Dio to get the data and then converted the response into `Product` objects.

## Project Structure

```text
lib/
├── models/
│   └── product.dart
├── services/
│   ├── product_service.dart
│   └── auth_service.dart
├── controllers/
│   ├── product_cubit.dart
│   ├── product_state.dart
│   ├── auth_cubit.dart
│   └── auth_state.dart
├── views/
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── register_screen.dart
│   └── product_view.dart
├── widgets/
│   ├── custom_text_field.dart
│   └── product_card.dart
├── firebase_options.dart
└── main.dart
```

## Implementation

I used Cubit to manage the application state.

For products:

```text
ProductView → ProductCubit → ProductService → API
```

For authentication:

```text
Login/Register → AuthCubit → AuthService → Firebase
```

Search and category filtering are handled inside `ProductCubit`. The original products are stored in `allProducts`, while the current search query and selected category are used to apply both filters together.

I also used `LayoutBuilder` to make the product grid responsive for different screen sizes.

## Getting Started

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/ecommerce_app.git
```

Go to the project folder:

```bash
cd ecommerce_app
```

Install the packages:

```bash
flutter pub get
```

Make sure Firebase is configured for the project and Email/Password Authentication is enabled.

Then run:

```bash
flutter run
```

## Firebase

The app uses Firebase Authentication with Email/Password.

Firebase was configured using FlutterFire CLI.
