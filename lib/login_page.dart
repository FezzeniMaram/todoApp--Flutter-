import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants/style.dart';
import 'package:todo/providers/theme_provider.dart';
import 'package:todo/signup_page.dart';
import 'package:todo/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var theme = context.watch<ThemeProvider>();
    return Scaffold(
      // backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            width: 200,
            child: const Icon(
              Icons.person_pin,
              size: 190,
              color: Colors.deepPurple,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello",
                  style: text.copyWith(
                      // color: Colors.black,
                      fontSize: 55,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign into your  account",
                  style: text.copyWith(
                    color: Colors.grey[500],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: theme.isDarkMode
                          ? const Color.fromARGB(255, 39, 39, 39)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.black.withOpacity(.7),
                        )
                      ]),
                  child: const TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: theme.isDarkMode
                          ? const Color.fromARGB(255, 39, 39, 39)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.black.withOpacity(.7),
                        )
                      ]),
                  child: const TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Icon(Icons.lock_sharp),
                      hintText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Text(
                      "Forgot your Password?",
                      style: text.copyWith(
                        color: Colors.grey[500],
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 30,
          // ),
          Container(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Home_Screen()));
              },
              child: colorButton(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You don't have account ?",
                  style: text.copyWith(color: Colors.grey[500]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: Text(
                      "SignUp",
                      style: text.copyWith(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: w * 0.2,
          ),
        ]),
      ),
    );
  }

  Widget colorButton() {
    return Container(
      width: MediaQuery.of(context).size.width - 90,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: const Offset(2, 2),
            color: Colors.black.withOpacity(.5),
          ),
        ],
        gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.deepPurple, Color.fromARGB(255, 169, 149, 202)]),
      ),
      child: const Center(
        child: Text(
          "Log In",
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
