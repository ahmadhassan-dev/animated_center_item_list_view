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

### Customization

- **Animation Type:** You can choose from various animation types like fade, scale, or slide.
- **Duration and Curve:** Customize the duration and the curve of the animation for each list item.

```dart
AnimatedCenterList(
  itemCount: 100,
  itemBuilder: (context, index, isCentered) {
    final opacity = isCentered ? 1.0 : 0.5;
    return Opacity(
      opacity: opacity,
      child: Container(
        color: isCentered ? Colors.grey : Colors.transparent,
        child: ListTile(
          title: Text('Item $index'),
        ),
      ),
    );
  },
)
```

Another Example:

```dart
AnimatedCenterList(
  itemCount: 100,
  itemBuilder: (context, index, isCentered) {
   final scale = isCentered ? 1.2 : 1.0; // Scale up when centered
   return Transform.scale(
      scale: scale,
      child: Container(
          color: isCentered ? Colors.blue : Colors.transparent,
          child: ListTile(
            title: Text('Item $index'),
          ),
        ),
      );
  },
)
```

### Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are greatly appreciated.

1. Fork the Project
2. Create your Feature Branch (git checkout -b feature/AmazingFeature)
3. Commit your Changes (git commit -m 'Add some AmazingFeature')
4. Push to the Branch (git push origin feature/AmazingFeature)
5. Open a Pull Request


### Contact

Ahmad Hassan - ahmadhassan136@gmail.com

