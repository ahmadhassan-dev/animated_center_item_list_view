# animated_center_list

## Description

`animated_center_list` is a Flutter package designed to enhance the visual appeal of list views. It
focuses on providing a smooth, animated experience where the central item of the list is highlighted
as users scroll through. This package is perfect for use cases where the central item needs to stand
out, such as in a carousel or a selection wheel.

## Features

- **Center-Focused Animation**: Dynamically animate list items as they move towards or away from the
  center.
- **Customizable Animations**: Choose from a range of animations and customize duration and curve to
  suit your app’s style.
- **Easy to Use**: Designed to be dropped into any existing Flutter project with minimal setup.
- **Responsive and Versatile**: Works great on both mobile and web platforms, adapting to various
  screen sizes.

## Getting Started

### Installation

To use `animated_center_list` in your Flutter app, add it to your dependencies:

```yaml
dependencies:
  animated_center_list: ^1.0.0
```

### Basic Usage

Here's how you can integrate animated_center_list into your app:

```dart
import 'package:flutter/material.dart';
import 'package:animated_center_list/animated_center_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Center List Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Center List'),
      ),
      body: AnimatedCenterList(
        itemCount: 10,
        itemBuilder: (context, index, isCentered) {
          // isCentered is an extra parameter which will tell us that the widget is centered or not
          return Container(color: isCentered ? Colors.grey : Colors.transparent,
              child: Text('Item $index')
          );
        },
      ),
    );
  }
}
```