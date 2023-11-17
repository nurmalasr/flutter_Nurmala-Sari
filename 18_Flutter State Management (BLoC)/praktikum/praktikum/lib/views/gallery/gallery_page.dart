import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum/bloc/gallery/gallery_bloc.dart';

class GalleryPage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://static01.nyt.com/images/2011/12/16/arts/16GHIBLI/16GHIBLI-articleLarge.jpg?quality=75&auto=webp&disable=upscale',
    'https://images.unsplash.com/photo-1601425276965-bdb69f1f3977?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bm8lMjBjb3B5cmlnaHR8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
    'https://api.duniagames.co.id/api/content/upload/file/3963967791664451415.jpg',
    'https://lumiere-a.akamaihd.net/v1/images/pp_baymax_herobanner_mobile_22586_56a97a34.jpeg?region=0%2C0%2C640%2C480',
    'https://asset-2.tstatic.net/jogja/foto/bank/images/Meilin-Lee-atau-Mei-Tokoh-Utama-Film-Turning-Red.jpg',
    'https://2.bp.blogspot.com/-LGjRkGI_j6w/YUvzj81JQZI/AAAAAAAASLE/5W4hM5a8MFgbhcLWZTUHOlKE18DUmTcVQCLcBGAsYHQ/s640/Luca%2B%25282021%2529.png',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Galeri Screen'),
        ),
        body: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                BlocProvider.of<GalleryBloc>(context)
                    .add(GalleryImageTapEvent(imageUrl: imageUrls[index]));
              },
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showImageInBottomSheet(BuildContext context, String imageUrl) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: Column(
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                height: 200,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _showConfirmationDialog(context, imageUrl);
                    },
                    child: Text('Ya'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Tidak'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showConfirmationDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Lanjut ke Halaman Baru?'),
          content: Text('Apakah Anda ingin melanjutkan ke halaman baru?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tidak'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(
                  context,
                  '/detail', // ke halaman detail
                  arguments: imageUrl, // kirim URL gambar sebagai argumen
                );
              },
              child: Text('Ya'),
            ),
          ],
        );
      },
    );
  }
}
