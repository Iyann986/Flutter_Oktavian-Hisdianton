// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:project/ui/data/models/about_data.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        centerTitle: true,
        backgroundColor: const Color(0xff473DD5),
      ),
      drawer: Drawer(
        child: ListView(
          // padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/ic_avatar.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
              child: Text(''),
            ),
            ListTile(
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 20),
              child: const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Hallo',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Montserrat-Regular",
                        letterSpacing: 1.5,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Selamat Datang, Dilayanan Jasa Kami!",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Montserrat-Regular",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 190,
                      child: Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        color: Color(0xFFFFAF00),
                        width: 1,
                      ),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          width: 60,
                          image: AssetImage(items[index].image!),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          items[index].title!,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${items[index].projects!} project selesai',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFFFFAF00),
                          ),
                        )
                      ],
                    )),
                  );
                },
                itemCount: items.length,
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
