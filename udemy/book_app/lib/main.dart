import 'package:flutter/material.dart';

void main() {
  runApp(const BookApp());
}
//https://www.youtube.com/watch?v=-b6aSjdBDd8
class BookApp extends StatelessWidget {
  const BookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Readable',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          subtitle1: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            fontWeight: FontWeight.w300,
            letterSpacing: 1,
          ),
          subtitle2: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w300,
            letterSpacing: 1,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 28),
        fontFamily: 'OpenSansCondensed',
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: backgroundGradient(),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNav(),
          ),
          Column(
            children: [
              CustomBanner(),
              const BookListView(title: 'YOUR TITLES', books: [
                'american.jpg',
                'harry.jpg',
                'harry1.png',
                'harry2.jpeg',
                'kiterunner.jpg',
                'notw.jpg',
                'ready.jpg',
                'trevor.jpeg',
              ]),
              const BookListView(title: 'CLASSICS', books: [
                'catch22.jpg',
                'grapes.jpeg',
                'greatgatsby.jpeg',
                'huckle.jpeg',
                'lotr.jpg',
                'mockingbird.jpg',
                'oldmanandthesea.jpg',
              ]),
            ],
          )
        ],
      ),
    ));
  }

  BoxDecoration backgroundGradient() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            tileMode: TileMode.mirror,
            stops: const [
          0.0,
          0.4,
          0.6,
          1
        ],
            colors: [
          Colors.blueGrey[800]!,
          Colors.blueGrey[700]!,
          Colors.blueGrey[700]!,
          Colors.blueGrey[800]!,
        ]));
  }
}

class BookListView extends StatelessWidget {
  final List books;
  final String title;

  const BookListView({Key? key, required this.books, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            height: 190,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return BookCard(file: books[index]);
                }),
          )
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String pathDirectory = 'assets/images/';
  final String file;

  const BookCard({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.red,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            spreadRadius: 1,
            offset: Offset(4, 5),
            blurRadius: 5,
          )
        ],
      ),
      child: Image.asset('$pathDirectory$file'),
    );
  }
}

class CustomBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      child: Container(
        height: 90,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  "READABLE",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(Icons.search),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomBottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.refresh),
          Icon(Icons.person_outline),
          Icon(Icons.info_outline),
        ],
      ),
    );
  }
}
