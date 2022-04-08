import 'package:ask_while_you_can/widgets/custom_alert.dart';
import 'package:ask_while_you_can/widgets/mytoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'dart:async';
import '../const/alltext.dart';
import '../const/colors.dart';

import 'dart:convert';
// import 'package:ask_while_you_can/widgets/snakbars.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List? data;
  Future<String?> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/json/questions.json');

    setState(() {
      data = json.decode(jsonText);
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    this.loadJsonData();
    print(data);
  }

  int _questionIndex = 0;

  nextquestion() {
    if (_questionIndex >= 4) {
      // showsnakbar(context);
      endToast();
    } else {
      setState(() {
        _questionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 10,
                  ),

                  // Header Section.......................................................................Start//
                  child: Row(
                    children: [
                      Image.asset("assets/logo/logo.png"),
                      Spacer(),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          Alltext.recordanswer,
                          style: TextStyle(
                            color: Color(0xff4F7C87),
                            fontSize: 15,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          side:
                              BorderSide(width: 3.0, color: Color(0xff4F7C87)),
                        ),
                      ),
                    ],
                  ),
                ),
                // Header Section.......................................................................End//
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 40,
                    right: 40,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                              right: 30,
                            ),
                            // Header Text.......................................................................Start//
                            child: Text(
                              Alltext.header_text,
                              style: TextStyle(
                                // color: Color(0xff81A2A9),
                                color: AppColor.headerText,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.only(),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
//                       height: 250,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            data == null
                                ? ""
                                : data![_questionIndex]['question'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4F7C87),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                TextButton.icon(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                      text:
                          data == null ? "" : data![_questionIndex]['question'],
                    ));

                    // mycopydone(context);
                    copyToast();

                    showDialogBox(context);
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: const Icon(
                      Icons.copy,
                      color: Colors.white,
                    ),
                  ),
                  label: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      Alltext.copy_text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Color(0xff4B788A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0))),
                ),
                SizedBox(
                  height: 8,
                ),
                OutlinedButton.icon(
                  onPressed: () {
                    nextquestion();
                  },
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: const Icon(
                      Icons.swap_horiz_outlined,
                      color: Color(0xff4F7C87),
                    ),
                  ),
                  label: Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      Alltext.tryAnother,
                      style: TextStyle(
                          color: Color(0xff4F7C87),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  style: TextButton.styleFrom(
                      side: BorderSide(width: 2, color: Color(0xff4F7C87)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
