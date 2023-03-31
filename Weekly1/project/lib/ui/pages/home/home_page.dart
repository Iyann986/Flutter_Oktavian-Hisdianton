import 'package:flutter/material.dart';
import 'package:project/ui/constants/r.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
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
              onTap: () {},
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            const LogoWidget(),
            Column(
              children: [
                Container(
                  height: 300,
                  color: Colors.transparent,
                ),
                Container(
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      children: const <Widget>[
                        Text(
                          'CONTACT US',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "poppins",
                            letterSpacing: 1.5,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0,
                            vertical: 10.0,
                          ),
                          child: Text(
                            'Need to get touch we us? Either fill out the from with your inquiry or find the departement email you d like to contact bellow.',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: "poppins",
                              // letterSpacing: 1.8,
                              color: Colors.black,
                            ),
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
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            maxLength: 60,
                            controller: firstNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'First Name',
                              fillColor: Colors.black,
                              filled: false,
                              focusColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: "Montserrat-Regular",
                                letterSpacing: 1.3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                            maxLength: 60,
                            controller: lastNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Last Name',
                              fillColor: Colors.black,
                              filled: false,
                              focusColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: "Montserrat-Regular",
                                letterSpacing: 1.3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 40),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 685,
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          maxLength: 60,
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email Address',
                            fillColor: Colors.black,
                            filled: false,
                            focusColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: "Montserrat-Regular",
                              letterSpacing: 1.3,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 685,
                        height: 100,
                        child: TextFormField(
                          maxLines: 5,
                          expands: false,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          controller: messageController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Message',
                            fillColor: Color.fromARGB(10, 255, 255, 255),
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            focusColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: "Montserrat-Regular",
                              letterSpacing: 1.3,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 100),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Center(
                                child: Text(
                              "Konfirmasi Masalah Anda!",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text("Full Name: " +
                                    firstNameController.text +
                                    " " +
                                    lastNameController.text),
                                Text("Email: " + emailController.text),
                                Text("Message: " + messageController.text),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Center(child: Text("Submit")),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff473DD5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Montserrat-Regular",
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF210002),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
        child: Image.asset(
          R.assets.imgContact,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
