import 'package:flutter/material.dart';
import 'detail_gallery.dart';

class GaleryPage extends StatefulWidget {
  const GaleryPage({Key? key}) : super(key: key);

  @override
  State<GaleryPage> createState() => _GaleryPageState();
}

class _GaleryPageState extends State<GaleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6750A4),
        title: const Text('Image Gallery'),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: <Widget>[
                        Image.network(
                            'https://www.littledayout.com/wp-content/uploads/05-studio-ghibi-free-image.jpg',
                            width: 200,
                            height: 200),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return const BottomPage();
                                      },
                                    ),
                                  );
                                },
                                child: const Text('Yes')),
                            const SizedBox(
                              width: 70,
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: const Text('No'))
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                  'https://asset-2.tstatic.net/jogja/foto/bank/images/Meilin-Lee-atau-Mei-Tokoh-Utama-Film-Turning-Red.jpg'),
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: <Widget>[
                        Image.network(
                            'https://asset-2.tstatic.net/jogja/foto/bank/images/Meilin-Lee-atau-Mei-Tokoh-Utama-Film-Turning-Red.jpg',
                            width: 200,
                            height: 200),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return const BottomPage();
                                      },
                                    ),
                                  );
                                },
                                child: const Text('Yes')),
                            const SizedBox(
                              width: 70,
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: const Text('No'))
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image.network(
                  'https://2.bp.blogspot.com/-LGjRkGI_j6w/YUvzj81JQZI/AAAAAAAASLE/5W4hM5a8MFgbhcLWZTUHOlKE18DUmTcVQCLcBGAsYHQ/s640/Luca%2B%25282021%2529.png'),
            ),
          )
        ],
      ),
    );
  }
}
