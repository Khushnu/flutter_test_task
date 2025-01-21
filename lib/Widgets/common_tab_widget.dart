// Expanded(
//                                 child: GestureDetector(
//                                 onTap: (){
//                                   setState(() {
//                                     currentSelected =e;
//                                   });
//                                 },
//                                 child: Container(
//                                   height: 50,
//                                   // padding: EdgeInsets.symmetric(horizontal: 9),
//                                   decoration: BoxDecoration(
//                                     color: isSelected ? colorSelected : Colors.white,
//                                     border: Border(left: BorderSide(color: e.text == "Arbeitnehmer" ? Colors.transparent : Colors.grey)), 
//                                     borderRadius: BorderRadius.only(
//                                       topRight: e.text == "Temporärbüro" ? Radius.circular(10) : Radius.circular(0),
//                                       bottomRight:e.text == "Temporärbüro" ? Radius.circular(10) : Radius.circular(0), 
//                                       topLeft: e.text == "Arbeitnehmer" ? Radius.circular(10) : Radius.circular(0), bottomLeft: e.text == "Arbeitnehmer" ? Radius.circular(10) : Radius.circular(0))
//                                   ),
//                                   child: Center(child: CustomTextWidget(text: e.text, textColor: isSelected ? Colors.white : btnColor2,)),
//                                 ),
//                                 ),
//                               );