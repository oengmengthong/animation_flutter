import 'package:flutter/material.dart';
import 'package:relaxy_animation/innovation.dart';
import 'package:relaxy_animation/relaxy.dart';
import 'adapter_view.dart';
import 'everything_view.dart';
import 'info_view.dart';
import 'playground_view.dart';
import 'visual_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Animate Demo',
      debugShowCheckedModeBanner: false,
      home: FlutterAnimateExample(),
    );
  }
}

// this is a very quick and dirty example.
class FlutterAnimateExample extends StatefulWidget {
  const FlutterAnimateExample({Key? key}) : super(key: key);

  static final List<TabInfo> tabs = [
    TabInfo(Icons.local_activity, (_) => RelaxyView(key: UniqueKey()), 'Relaxy',
        'Animation of Relaxy Logo.'),
    TabInfo(Icons.golf_course, (_) => InnovationView(key: UniqueKey()),
        'Innovation', 'Some Idea of animation.'),
    TabInfo(Icons.info_outline, (_) => InfoView(key: UniqueKey()), 'Info',
        'Simple example of Widget & List animations.'),
    TabInfo(Icons.palette_outlined, (_) => VisualView(key: UniqueKey()),
        'Visual', 'Visual effects like saturation, tint, & blur.'),
    TabInfo(Icons.format_list_bulleted, (_) => const AdapterView(), 'Adapters',
        'Animations driven by scrolling & user input.'),
    TabInfo(Icons.grid_on_outlined, (_) => const EverythingView(),
        'Kitchen Sink', 'Grid view of effects with default settings.'),
    TabInfo(Icons.science_outlined, (_) => PlaygroundView(key: UniqueKey()),
        'Playground', 'A blank canvas for experimenting.'),
  ];

  @override
  State<FlutterAnimateExample> createState() => _FlutterAnimateExampleState();
}

class _FlutterAnimateExampleState extends State<FlutterAnimateExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relaxy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: FlutterAnimateExample.tabs
                .map((e) => ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScreenView(
                                    title: e.label,
                                    child: e.builder(context),
                                  ))),
                      leading: Icon(e.icon),
                      title: Text(e.label),
                      subtitle: Text(e.description),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class TabInfo {
  const TabInfo(this.icon, this.builder, this.label, this.description);

  final IconData icon;
  final WidgetBuilder builder;
  final String label;
  final String description;
}

class ScreenView extends StatelessWidget {
  const ScreenView({super.key, required this.child, required this.title});

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(title),
      ),
      body: child,
    );
  }
}
