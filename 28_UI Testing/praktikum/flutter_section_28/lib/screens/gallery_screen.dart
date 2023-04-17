// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_section_28/screens/gallery_bottom_sheet.dart';
import 'package:flutter_section_28/screens/show_photos_modal.dart';

class ImageItem {
  final String image;
  final String description;

  ImageItem(this.image, this.description);
}

class GalleryScreen extends StatelessWidget {
  List<ImageItem> imageList = [
    ImageItem("assets/images/ryujin1.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin2.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin3.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin4.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin5.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin6.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin7.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin8.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin9.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin10.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin11.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin12.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin13.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin14.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
    ImageItem("assets/images/ryujin15.jpg",
        "Ryujin merupakan member dari salah satu grup KPOP terkenal bernama ITZY"),
  ];

  GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Ryujin Album',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica'),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: 3,
          ),
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ShowPhotosModal(
                      image: imageList[index].image,
                      // description: imageList[index].description,
                    );
                  },
                );
              },
              onTap: () {
                showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  )),
                  context: context,
                  builder: (context) {
                    return GalleryBottomSheet(
                      image: imageList[index].image,
                      description: imageList[index].description,
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(imageList[index].image),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
