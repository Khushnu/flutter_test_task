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

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  bool _isHovering = false;
  var currentSelected = listTabBar[0];

  final ScrollController _scrollController = ScrollController();
  bool _showFloatingButton = false;
  Map<String, bool> _hoveringStates = {};

  @override
  void initState() {
    super.initState();
    // Initialize the hovering states for each tab
    for (var tab in listTabBar) {
      _hoveringStates[tab.text] = false;
    }
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    // Calculate the scroll position where the button should appear in the corner
    final threshold = screenHeight * 0.4 - 40; // Adjust based on your layout
    if (_scrollController.offset > threshold && !_showFloatingButton) {
      setState(() {
        _showFloatingButton = true;
      });
    } else if (_scrollController.offset <= threshold && _showFloatingButton) {
      setState(() {
        _showFloatingButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.sizeOf(context).height;
    screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
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
                  height: screenHeight * 0.9,
                  width: screenWidth,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      spacing: 10,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: CurvedContainer(
                            isTopCurved: false,
                            height: screenHeight * 0.6,
                            child: Stack(
                              children: [
                                // Main text and button
                                Positioned(
                                  top: screenHeight * 0.2,
                                  left: screenWidth * 0.15,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomTextWidget(
                                        text: "Deine Job\nWebsite",
                                        fontSize: 40,
                                        textColor: Colors.black,
                                      ),
                                      const SizedBox(height: 20),
                                      CommonButtonWidget(
                                        screenWidth: screenWidth * 0.3,
                                        child: const CustomTextWidget(
                                          text: "Kostenlos Registrieren",
                                          fontSize: 18,
                                          textColor: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 100),
                                    child: Image.asset(
                                      "assets/bgcont.png",
                                      scale: 2.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            height: 50,
                            width: screenWidth * 0.4 + 20,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: listTabBar.map((e) {
                                bool isSelected = currentSelected == e;
                                bool isHovering =
                                    _hoveringStates[e.text] ?? false;
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
                                                : isHovering
                                                    ? Color.fromARGB(
                                                        255, 221, 243, 238)
                                                    : Colors.white,
                                            border: Border(
                                                left: BorderSide(
                                                    color:
                                                        e.text == "Arbeitnehmer"
                                                            ? Colors.transparent
                                                            : Colors.grey.withValues(alpha: 0.3))),
                                            borderRadius: BorderRadius.only(
                                                topRight:
                                                    e.text == "Temporärbüro"
                                                        ? Radius.circular(10)
                                                        : Radius.circular(0),
                                                bottomRight:
                                                    e.text == "Temporärbüro"
                                                        ? Radius.circular(10)
                                                        : Radius.circular(0),
                                                topLeft:
                                                    e.text == "Arbeitnehmer"
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
                      height: 25,
                    ),
                       SizedBox(
                        height: screenHeight * 0.5,
                        width: screenWidth * 0.8,
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
                                  horizontal: 34, vertical: 30),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: screenHeight * 0.2 + 50,
                                    width: screenWidth * 0.2 + 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle, 
                                      color: Color(0xffF7FAFC)
                                    ),
                                    child: Image.asset(
                                      "assets/one.png",
                                      scale: 2.5,
                                    ),
                                  )),
                            ),
                            Positioned(
                              top: screenHeight * 0.4,
                                  left: screenWidth * 0.15,

                              child: SvgPicture.asset("assets/Gruppe1.svg", height: 230,)),
                            // Transform.translate(
                            //   offset: Offset(290, 340),
                            //   child: SvgPicture.asset("assets/Gruppe1.svg", height: 230,)),
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
                   CurvedContainer(height: screenHeight * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SizedBox(
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.2,
                        child: SvgPicture.asset("assets/blog_4.svg"),
                      ),
                    ), 
                    Row(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset("assets/two.png", scale: 2.6,),
                    CustomTextWidget(text: "Erstellen dein Lebenslauf", textColor: Colors.grey,)

                      ],
                    ), 
                   ],)), 
 Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 84, vertical: 30),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: SizedBox(
                                    height: screenHeight * 0.5,
                                    width:  screenWidth * 0.9,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 60),
                                          child: Container(
                                            height: screenHeight * 0.3 ,
                                            width: screenWidth * 0.3 ,
                                            alignment: Alignment.topCenter,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle, 
                                              color: Color(0xffF7FAFC)
                                            ),
                                            child: Image.asset(
                                              "assets/three.png",
                                              scale: 1.3,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: screenWidth * 0.21,
                                          top: screenHeight * 0.12,
                                          child: CustomTextWidget(text: "Mit nur einem Klick\nbewerben", textColor: Colors.grey.withValues(alpha: 0.9),)),
                                          Positioned(
                                          left: screenWidth * 0.34,
                                          top: screenHeight * 0.04,
                                          child: SvgPicture.asset("assets/file.svg", height: screenHeight * 0.4 - 20,)), 

                                      ],
                                    ),
                                  )),
                            ),

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
                  child: Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (_showFloatingButton)
                        Row(
                          spacing: 10,
                          children: [
                            CustomTextWidget(text: "Jetzt Klicken", textColor: Colors.grey,)
                            ,
                            Container(
                              height: 45,
                              width: screenWidth * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: btnColor2.withValues(alpha: 0.5))),
                                      child: Center(child: CustomTextWidget(text: "Kostenlos Registrieren", fontSize: 14, textColor: btnColor2,)),
                            ),
                          ],
                        ),
                      MouseRegionWidget(
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
