import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_task/Helper/colors.dart';
import 'package:flutter_test_task/Models/tabbarmodel.dart';
import 'package:flutter_test_task/Screens/home_screen.dart';
import 'package:flutter_test_task/Widgets/common_button_widget.dart';
import 'package:flutter_test_task/Widgets/common_corner_widget.dart';
import 'package:flutter_test_task/Widgets/curved_container.dart';
import 'package:flutter_test_task/Widgets/custom_text-widget.dart';
import 'package:flutter_test_task/Widgets/mouse_region_widget.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  bool _isHovering = false;
  bool _isHoveringTab = false;
  var currentSelected = listTabBar[0];
  Map<String, bool> _hoveringStates = {};

  @override
  void initState() {
    super.initState();
    // Initialize the hovering states for each tab
    for (var tab in listTabBar) {
      _hoveringStates[tab.text] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Stack(
          children: [
            Container(
              height: 15,
              width: screenWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [btnColor2, btnColor1])),
            ),
            Center(
              child: SizedBox(
                height: screenHeight * 0.8 + 10,
                width: screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    children: [
                      CurvedContainer(
                          isTopCurved: false,
                          height: screenHeight * 0.9,
                          child: SafeArea(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const CustomTextWidget(
                                  text: 'Deine Job\nwebsite',
                                  textColor: Colors.black,
                                  textAlign: TextAlign.center,
                                  fontSize: 40,
                                ),
                                SizedBox(
                                    height: screenHeight * 0.6,
                                    width: screenWidth,
                                    child: Image.asset(
                                      "assets/bg.png",
                                      fit: BoxFit.fitWidth,
                                    ))

                                //  CommonButtonWidget(child: CustomTextWidget(text: "Kostenlos Registrieren"))
                              ],
                            ),
                          )),
                      Center(
                        child: Container(
                          height: 50,
                          width: screenWidth * 0.7 + 20,
                          decoration: BoxDecoration(
                              border: Border.all(color:  Colors.grey.withValues(alpha: 0.3)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: listTabBar.map((e) {
                              bool isSelected = currentSelected == e;
                              bool isHovering = _hoveringStates[e.text] ?? false;
                              return Expanded(
                                child: MouseRegionWidget(
                                  onEnter: (_) => setState(() {
                                    _hoveringStates[e.text] = true;
                                  }),
                                  onExit: (_) => setState(() {
                                    _hoveringStates[e.text] = false;
                                  }),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentSelected = e;
                                      });
                                    },
                                    child: Container(
                                      height: 50,
                                      // padding: EdgeInsets.symmetric(horizontal: 9),
                                      decoration: BoxDecoration(
                                          color: isSelected 
                                              ? colorSelected
                                              : isHovering ? Color.fromARGB(255, 221, 243, 238) : Colors.white ,
                                          border: Border(
                                              left: BorderSide(
                                                  color:
                                                      e.text == "Arbeitnehmer"
                                                          ? Colors.transparent
                                                          :  Colors.grey.withValues(alpha: 0.3))),
                                          borderRadius: BorderRadius.only(
                                              topRight: e.text == "Temporärbüro"
                                                  ? Radius.circular(10)
                                                  : Radius.circular(0),
                                              bottomRight:
                                                  e.text == "Temporärbüro"
                                                      ? Radius.circular(10)
                                                      : Radius.circular(0),
                                              topLeft: e.text == "Arbeitnehmer"
                                                  ? Radius.circular(10)
                                                  : Radius.circular(0),
                                              bottomLeft:
                                                  e.text == "Arbeitnehmer"
                                                      ? Radius.circular(10)
                                                      : Radius.circular(0))),
                                      child: Center(
                                          child: CustomTextWidget(
                                        text: e.text,
                                        fontSize: 16,
                                        textColor: isSelected 
                                            ? Colors.white
                                            : btnColor2,
                                      )),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.5,
                        width: screenWidth,
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.topCenter,
                                child: CustomTextWidget(
                                  text:
                                      "Drei einfache Schritte zur\nVermittlung neuer Mitarbeiter",
                                  fontSize: 30,
                                  textAlign: TextAlign.center,
                                  textColor: Colors.black,
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 20),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Image.asset(
                                    "assets/one.png",
                                    scale: 2.5,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 90),
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                    height: screenHeight * 0.3 - 40,
                                    width: screenWidth,
                                    child: Image.asset(
                                      "assets/bgillu.png",
                                      fit: BoxFit.contain,
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30),
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: CustomTextWidget(
                                    text: "Erstellen dein\nUnternehmensprofil",
                                    fontSize: 20,
                                    textColor: Colors.grey,
                                    textAlign: TextAlign.left,
                                  )),
                            )
                          ],
                        ),
                      ),
                      CurvedContainer(
                        height: screenHeight * 0.8,
                        // isTopCurved: false, // Optional based on your needs
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 44, vertical: 185),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Row(
                                  spacing: 30,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      "assets/two.png",
                                      scale: 2.5,
                                    ),
                                    CustomTextWidget(text: "Erhalte Vermittlungs-\nangebot von Arbeitgeber", textColor: Colors.grey,)
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 190, horizontal: 140),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                    height: screenHeight * 0.3 - 80,
                                    width: screenWidth,
                                    child: SvgPicture.asset(
                                        "assets/job_offers.svg")),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(-50, -270),
                        child: SizedBox(
                            height: screenHeight * 0.8,
                            width: screenWidth,
                            child: Image.asset(
                              "assets/btm.png",
                              fit: BoxFit.fitWidth,
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CommonCornerWidget(
                alignment: Alignment.topCenter,
                // boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                screenHeight: screenHeight * 0.1 - 20,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: MouseRegionWidget(
                    isHovering: _isHovering,
                    onEnter: (_) => setState(() => _isHovering = true),
                    onExit: (_) => setState(() => _isHovering = false),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextWidget(
                          text: "Login",
                          textAlign: TextAlign.right,
                          textColor: btnColor2,
                        ),
                        if (_isHovering)
                          Container(
                            height: 3,
                            width: 50,
                            decoration: BoxDecoration(color: btnColor2),
                          )
                      ],
                    )),
              ),
            ),
            CommonCornerWidget(
              alignment: Alignment.bottomCenter,
              screenHeight: screenHeight * 0.1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: CommonButtonWidget(
                  child: CustomTextWidget(text: "Kostenlos Registrieren")),
            )
          ],
        ),
      ),
    );
  }
}
