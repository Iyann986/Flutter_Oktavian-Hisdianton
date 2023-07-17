import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  // static String route = "gallery_page";
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final List<String> _images = [
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
        return SizedBox(
          height: 300,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(imageUrl),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/fullScreenImage',
                        arguments: {'imageUrl': imageUrl});
                    _showDialog(imageUrl);
                  },
                  child: const Text('View Full Size'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDialog(String imageUrl) async {
    bool result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('View Full Size'),
            content: Image.network(imageUrl),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('No')),
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Yes')),
            ],
          );
        });

    if (result == true) {
      Navigator.pushNamed(context, '/gallery', arguments: imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Gallery'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
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
