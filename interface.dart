import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Responsível',
      debugShowCheckedModeBanner: false,
      home: const ResponsiveLayout(),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Responsível'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return const ColumnLayout();
          } else if (constraints.maxWidth < 900) {
            return const GridLayout();
          } else {
            return const RowLayout();
          }
        },
      ),
    );
  }
}

class ColumnLayout extends StatelessWidget {
  const ColumnLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        PlaceholderWidget(title: 'Item 1'),
        PlaceholderWidget(title: 'Item 2'),
        PlaceholderWidget(title: 'Item 3'),
      ],
    );
  }
}

class GridLayout extends StatelessWidget {
  const GridLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3, // Deixa os botões mais largos
      ),
      padding: const EdgeInsets.all(16),
      itemCount: 4,
      itemBuilder: (context, index) {
        return PlaceholderWidget(title: 'Item ${index + 1}');
      },
    );
  }
}

class RowLayout extends StatelessWidget {
  const RowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        PlaceholderWidget(title: 'Item 1'),
        PlaceholderWidget(title: 'Item 2'),
        PlaceholderWidget(title: 'Item 3'),
        PlaceholderWidget(title: 'Item 4'),
      ],
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String title;

  const PlaceholderWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title clicado!')),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
