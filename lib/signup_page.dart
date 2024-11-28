import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/constants/style.dart';
import 'package:intl/intl.dart';
import 'package:todo/providers/theme_provider.dart';
class SignUpPage extends StatefulWidget {
  
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController dateController = TextEditingController();
  @override
  void initSate() {
    super.initState();
    dateController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    List images = ["google.png", "twitter.png", "fb.png"];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    var theme = context.watch<ThemeProvider>();

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
              colors: [
                // Color.fromARGB(255, 211, 100, 35),
                Colors.deepPurple, Color.fromARGB(255, 169, 149, 202)
              ]),
        ),
        child: const Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
                color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: 200,
              height: 150,
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
                    "Sign Up",
                    style: text.copyWith(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "It’s quick and easy.",
                    style: text.copyWith(
                      color: Colors.grey[500],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
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
                  prefixIcon: Icon(Icons.text_fields_outlined),
                  hintText: 'Name',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
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
              child: TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  icon: Icon(Icons.calendar_month_rounded),
                  hintText: "Birthday",
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickerDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(200),
                    lastDate: DateTime(2101),
                  );
                  if (pickerDate != null) {
                    String formatteDate =
                        DateFormat("yyyy-MM-dd").format(pickerDate);
                    setState(() {});
                    dateController.text = formatteDate.toString();
                  } else {
                    print("Not select");
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
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
              margin: const EdgeInsets.only(left: 20, right: 20),
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
              height: 10,
            ),
            const SizedBox(
              height: 25,
            ),
            colorButton(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Already have account ?",
                style: text.copyWith(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                text: "Sign up one of the following methods",
                style: text.copyWith(
                    color: Colors.deepPurple,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Wrap(
              children: List<Widget>.generate(3, (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.deepPurple[200],
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/" + images[index]),
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
