import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ne_proj/const.dart';
import 'package:ne_proj/screens/category_cscreen.dart';
import 'package:ne_proj/widgets/app_logo.dart';
import 'package:ne_proj/widgets/next_button.dart';
import 'package:ne_proj/widgets/spacing.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            2 * size.width * 0.0555, 100, 2 * size.width * 0.0555, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //app logo
              AppLogo(),
              WidgetSpacing(
                top: 40,
              ),
              //email textfield
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  style: primary.copyWith(fontSize: 16),
                  decoration: InputDecoration(
                      fillColor: Colors.red,
                      labelText: 'Enter Email',
                      labelStyle: primary.copyWith(fontSize: 14),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      icon: Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: SvgPicture.asset(
                          'icons/@.svg',
                          height: 14,
                          width: 14,
                        ),
                      )),
                ),
              ),
              Container(
                height: 2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
              ),
              WidgetSpacing(
                top: 100,
              ),
              //checkbox field
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.white)),
                      child: Center(
                        child: isSelected
                            ? Icon(
                                Icons.check,
                                size: 18.0,
                                color: Colors.white,
                              )
                            : Text(''),
                      ),
                    ),
                  ),
                  WidgetSpacing(
                    right: 25,
                  ),
                  Container(
                    width: 220,
                    child: Text(
                      "Select this if you want us to send articles/stories about breast cancer",
                      style: primary.copyWith(fontSize: 14),
                    ),
                  )
                ],
              ),
              WidgetSpacing(top: 40),
              //Next Button
              NextButton(onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryScreen(),
                    ));
              })
            ],
          ),
        ),
      ),
    );
  }
}
