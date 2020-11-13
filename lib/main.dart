import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Align Example';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              buildBackground(),
              Positioned(
                right: 8,
                top: 4,
                child: buildBookmark(),
              ),
              Center(
                child: buildTitle(),
              ),
              Align(
                alignment: Alignment(0.0, 0.8),
                child: buildActions(),
              ),
              Positioned(
                left: -32,
                top: 20,
                child: buildBadge(),
              ),
            ],
          ),
        ),
      );

  Widget buildTitle() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'LIMITLESS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 42),
            child: Text(
              'A science fiction thriller film directed by Neil Burger',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  Widget buildBadge() => RotationTransition(
        turns: AlwaysStoppedAnimation(-45 / 360),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 32),
          color: Colors.white,
          child: Text(
            'POPULAR',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );

  Widget buildActions() => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, color: Colors.red),
            const SizedBox(width: 8),
            Text(
              '27 K',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 32),
            Icon(Icons.share, color: Colors.blue),
            const SizedBox(width: 8),
            Text(
              '3.2 K',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  Widget buildBookmark() => IconButton(
        icon: Icon(
          Icons.bookmark_border,
          color: Colors.white,
          size: 40,
        ),
        onPressed: () {},
      );

  Widget buildBackground() => ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          color: Colors.black,
          child: Opacity(
            opacity: 0.8,
            child: Image.network(
              'https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      );
}
