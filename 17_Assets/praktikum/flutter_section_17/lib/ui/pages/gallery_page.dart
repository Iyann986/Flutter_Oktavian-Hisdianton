import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  // static String route = "gallery_page";
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<String> _images = [
    'https://picsum.photos/200',
    'https://picsum.photos/201',
    'https://picsum.photos/202',
    'https://picsum.photos/203',
    'https://picsum.photos/204',
    'https://picsum.photos/205',
    'https://picsum.photos/206',
    'https://picsum.photos/207',
    'https://picsum.photos/208',
    'https://picsum.photos/209',
  ];

  void _showBottomSheet(String imageUrl) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 300,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network(imageUrl),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/fullScreenImage',
                          arguments: {'imageUrl': imageUrl});
                      _showDialog(imageUrl);
                    },
                    child: Text('View Full Size'),
                  )
                ],
              ),
            ),
          );
        });
  }

  // void _showBottomSheet(String imageUrl) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Container(
  //           height: 300,
  //           child: Center(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Image.network(imageUrl),
  //                 SizedBox(height: 16),
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                     Navigator.pushNamed(context, '/fullScreenImage',
  //                         arguments: {'imageUrl': imageUrl});
  //                   },
  //                   child: Text('View Full Size'),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  void _showDialog(String imageUrl) async {
    bool result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('View Full Size'),
            content: Image.network(imageUrl),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text('No')),
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('Yes')),
            ],
          );
        });

    if (result == true) {
      Navigator.pushNamed(context, '/gallery', arguments: imageUrl);
    }
  }

  // void _showDialog(String imageUrl) async {
  //   bool result = await showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('View Full Size'),
  //           content: Image.network(imageUrl),
  //           actions: [
  //             TextButton(
  //                 onPressed: () => Navigator.pop(context, false),
  //                 child: Text('No')),
  //             TextButton(
  //                 onPressed: () => Navigator.pop(context, true),
  //                 child: Text('Yes')),
  //           ],
  //         );
  //       });

  //   if (result == true) {
  //     Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //             builder: (BuildContext context) => FullScreenImage()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Gallery'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: _images.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _showBottomSheet(_images[index]),
            child: Image.network(
              _images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
