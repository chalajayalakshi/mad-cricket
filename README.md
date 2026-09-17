# Flutter Lab: Scaffold & AppBar Basics

In this lab, you will learn how to structure a basic Flutter screen using the `Scaffold` widget, which provides the foundation for standard app elements like headers, body content, and floating buttons.

## Prerequisites
1. Clone this repository to your local machine.
2. Run `flutter pub get` in your terminal.
3. Launch an emulator or connect a physical device, and run the app. You should see a blank white screen to start.

## Instructions
Open `lib/main.dart` and locate the `TODO` comments. You need to build the UI by replacing the `null` placeholders with the correct widgets:

1. **AppBar**: Add an `AppBar` to the top of the screen. Give it a text title of "Hello World" and make sure the title is centered.
2. **Body**: Add the main content area. Use a `Center` widget so the content floats in the middle of the screen, and add a `Text` widget inside it.
3. **FloatingActionButton**: Add a circular action button to the bottom right of the screen. Give it an `onPressed` function and a text label.

## Expected Output
When completed, your blank screen will transform to show a top navigation bar reading "Hello World", text directly in the center of the screen, and a floating button in the bottom right corner labeled "Click".
