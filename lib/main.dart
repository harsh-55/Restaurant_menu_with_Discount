import 'dart:io';
import 'dart:ui';

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:neon/neon.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Menu(),
  ));
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String gender = "Male";
  int discount = 10;
  bool status1 = false;
  bool status2 = false;
  bool status3 = false;
  bool status4 = false;
  bool status5 = false;
  bool status6 = false;
  bool status7 = false;
  bool status8 = false;
  List x = ["1", "2", "3", "4", "5"];
  int qty1 = 0;
  int qty2 = 0;
  int qty3 = 0;
  int qty4 = 0;
  int qty5 = 0;
  int qty6 = 0;
  int qty7 = 0;
  int qty8 = 0;
  int total = 1;
  int fqty = 1;
  int val = 0;
  double discounttt = 0;
  double gst = 0;
  double famount = 0;
  String folderpath = "";
  TextEditingController name = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    total = 0;
    discounttt = 0;
    gst = 0;
    famount = 0;
  }

  void disc(int d) {
    discount = d;
  }

  void Tamount(bool statusssx, int price, int qt) {
    setState(() {
      if (statusssx == true) {
        total += price;
      } else {
        total -= price;
      }

      gst = total * 18 / 100;

      if (discount == 10) {
        discounttt = (((total + gst) * discount) / 100);
      }
      if (discount == 5) {
        discounttt = (((total + gst) * discount) / 100);
      }

      famount = (total + gst) - discounttt;
    });
  }

  void qtycount(bool st, int qty) {
    if (st == true) {} else {}
  }

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      key: _endSideMenuKey,
      inverse: true,
      closeIcon: Icon(Icons.cancel_outlined, color: Colors.white, size: 35),
      // end side menu
      background: Colors.grey.withOpacity(0.3),
      type: SideMenuType.slideNRotate,
      menu: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: buildMenu(),
      ),
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: SideMenu(
        key: _sideMenuKey,
        closeIcon: Icon(Icons.cancel_outlined, color: Colors.white, size: 35),
        menu: buildMenu(),
        type: SideMenuType.slideNRotate,
        onChange: (_isOpened) {
          setState(() => isOpened = _isOpened);
        },
        child: IgnorePointer(
            ignoring: isOpened,
            child: WillPopScope(
              onWillPop: () {
                return showExitPopup(context);
              },
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.black.withOpacity(0.7),
                  title: Text('Order Menu'),
                  leading: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => toggleMenu(),
                  ),
                ),
                body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.8),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                              decoration: InputDecoration(
                                hintText: "Enter Your Name",
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                ),
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(bottom: 1),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white.withOpacity(0.8),
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Male",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Radio(
                                value: gender,
                                groupValue: "Male",
                                onChanged: (value) {
                                  setState(() {
                                    gender = "Male";
                                    discount = 10;
                                    Tamount(true, 0, 0);
                                  });
                                },
                              ),
                              SizedBox(width: 50),
                              Text(
                                "Female",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Radio(
                                value: gender,
                                groupValue: "Female",
                                onChanged: (value) {
                                  setState(() {
                                    gender = "Female";
                                    discount = 5;
                                    Tamount(true, 0, 0);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, left: 13, right: 5),
                                    child: Container(
                                      height: 210,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFCC07E)
                                              .withOpacity(0.85),
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Container(
                                        margin: EdgeInsets.only(top: 70),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Burger",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12, left: 0),
                                              child: Text(
                                                "Rs.100",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10, left: 15),
                                                  child: Checkbox(
                                                    value: status1,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        status1 = value!;
                                                        if (status1 == true) {
                                                          qty1 = 1;
                                                          Tamount(status1, 100,
                                                              qty1);
                                                        } else {
                                                          Tamount(
                                                              false,
                                                              (100 * qty1),
                                                              qty1);
                                                          qty1 = 0;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (qty1 != 1 &&
                                                              status1 == true) {
                                                            qty1--;

                                                            Tamount(false, 100,
                                                                qty1);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.remove)),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    '$qty1',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (status1 == true) {
                                                            qty1++;
                                                            Tamount(status1,
                                                                100, qty1);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.add)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 45),
                                    child: Container(
                                      height: 130,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "Image/burger.png"),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, left: 13, right: 5),
                                    child: Container(
                                      height: 210,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFCC07E)
                                              .withOpacity(0.85),
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Container(
                                        margin: EdgeInsets.only(top: 70),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Sandwich",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12, left: 0),
                                              child: Text(
                                                "Rs.70",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10, left: 15),
                                                  child: Checkbox(
                                                    value: status2,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        status2 = value!;
                                                        if (status2 == true) {
                                                          qty2 = 1;
                                                          Tamount(
                                                              true, 70, qty2);
                                                        } else {
                                                          Tamount(
                                                              false,
                                                              (70 * qty2),
                                                              qty2);
                                                          qty2 = 0;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (qty2 != 1 &&
                                                              status2 == true) {
                                                            qty2--;

                                                            Tamount(false, 70,
                                                                qty2);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.remove)),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    '$qty2',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (status2 == true) {
                                                            qty2++;
                                                            Tamount(status2, 70,
                                                                qty2);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.add)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 45),
                                    child: Container(
                                      height: 130,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                            AssetImage("Image/sandwitch.png"),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, left: 13, right: 5),
                                    child: Container(
                                      height: 210,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFCC07E)
                                              .withOpacity(0.85),
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Container(
                                        margin: EdgeInsets.only(top: 70),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Vadapav",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12, left: 0),
                                              child: Text(
                                                "Rs.40",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10, left: 15),
                                                  child: Checkbox(
                                                    value: status3,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        status3 = value!;
                                                        if (status3 == true) {
                                                          qty3 = 1;
                                                          Tamount(
                                                              true, 40, qty3);
                                                        } else {
                                                          Tamount(
                                                              false,
                                                              (40 * qty3),
                                                              qty3);
                                                          qty3 = 0;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (qty3 != 1 &&
                                                              status3 == true) {
                                                            qty3--;

                                                            Tamount(false, 40,
                                                                qty3);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.remove)),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    '$qty3',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (status3 == true) {
                                                            qty3++;
                                                            Tamount(status3, 40,
                                                                qty3);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.add)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Container(
                                      height: 140,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "Image/vadapav.png"),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, left: 13, right: 5),
                                    child: Container(
                                      height: 210,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFCC07E)
                                              .withOpacity(0.85),
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Container(
                                        margin: EdgeInsets.only(top: 70),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Burger Combo",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12, left: 0),
                                              child: Text(
                                                "Rs.199",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10, left: 15),
                                                  child: Checkbox(
                                                    value: status4,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        status4 = value!;
                                                        if (status4 == true) {
                                                          qty4 = 1;
                                                          Tamount(status4, 199,
                                                              qty4);
                                                        } else {
                                                          Tamount(
                                                              false,
                                                              (199 * qty4),
                                                              qty4);
                                                          qty4 = 0;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (qty4 != 1 &&
                                                              status4 == true) {
                                                            qty4--;

                                                            Tamount(false, 199,
                                                                qty4);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.remove)),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    '$qty4',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (status4 == true) {
                                                            qty4++;
                                                            Tamount(status4,
                                                                199, qty4);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.add)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 45),
                                    child: Container(
                                      height: 130,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("Image/4.png"),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, left: 13, right: 5),
                                    child: Container(
                                      height: 210,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFCC07E)
                                              .withOpacity(0.85),
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Container(
                                        margin: EdgeInsets.only(top: 70),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Hotdog",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12, left: 0),
                                              child: Text(
                                                "Rs.50",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10, left: 15),
                                                  child: Checkbox(
                                                    value: status5,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        status5 = value!;
                                                        if (status5 == true) {
                                                          qty5 = 1;
                                                          Tamount(status5, 50,
                                                              qty5);
                                                        } else {
                                                          Tamount(
                                                              false,
                                                              (50 * qty5),
                                                              qty5);
                                                          qty5 = 0;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (qty5 != 1 &&
                                                              status5 == true) {
                                                            qty5--;

                                                            Tamount(false, 50,
                                                                qty5);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.remove)),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    '$qty5',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (status5 == true) {
                                                            qty5++;
                                                            Tamount(status5, 50,
                                                                qty5);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.add)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 45),
                                    child: Container(
                                      height: 130,
                                      width: 120,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("Image/5.png"),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, left: 13, right: 5),
                                    child: Container(
                                      height: 210,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFCC07E)
                                              .withOpacity(0.85),
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Container(
                                        margin: EdgeInsets.only(top: 70),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Combo",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12, left: 0),
                                              child: Text(
                                                "Rs.299",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10, left: 15),
                                                  child: Checkbox(
                                                    value: status6,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        status6 = value!;
                                                        if (status6 == true) {
                                                          qty6 = 1;
                                                          Tamount(status6, 299,
                                                              qty6);
                                                        } else {
                                                          Tamount(
                                                              false,
                                                              (299 * qty6),
                                                              qty6);

                                                          qty6 = 0;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (qty6 != 1 &&
                                                              status6 == true) {
                                                            qty6--;

                                                            Tamount(false, 299,
                                                                qty6);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.remove)),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    '$qty6',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (status6 == true) {
                                                            qty6++;
                                                            Tamount(status6,
                                                                299, qty6);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.add)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Container(
                                      height: 140,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("Image/6.png"),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, left: 13, right: 5),
                                    child: Container(
                                      height: 210,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFCC07E)
                                              .withOpacity(0.85),
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Container(
                                        margin: EdgeInsets.only(top: 70),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Combo",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12, left: 0),
                                              child: Text(
                                                "Rs.150",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10, left: 15),
                                                  child: Checkbox(
                                                    value: status7,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        status7 = value!;
                                                        if (status7 == true) {
                                                          qty7 = 1;
                                                          Tamount(status7, 150,
                                                              qty7);
                                                        } else {
                                                          Tamount(
                                                              false,
                                                              (150 * qty7),
                                                              qty7);
                                                          qty7 = 0;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (qty7 != 1 &&
                                                              status7 == true) {
                                                            qty7--;

                                                            Tamount(false, 150,
                                                                qty7);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.remove)),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    '$qty7',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (status7 == true) {
                                                            qty7++;
                                                            Tamount(status7,
                                                                150, qty7);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.add)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Container(
                                      height: 130,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("Image/7.png"),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 50, left: 13, right: 5),
                                    child: Container(
                                      height: 210,
                                      width: 170,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFCC07E)
                                              .withOpacity(0.85),
                                          borderRadius:
                                          BorderRadius.circular(20)),
                                      child: Container(
                                        margin: EdgeInsets.only(top: 70),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.only(top: 5),
                                              child: Text(
                                                "Cheeze Burger",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 25),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12, left: 0),
                                              child: Text(
                                                "Rs.100",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10, left: 15),
                                                  child: Checkbox(
                                                    value: status8,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        status8 = value!;
                                                        if (status8 == true) {
                                                          qty8 = 1;
                                                          Tamount(status8, 100,
                                                              qty8);
                                                        } else {
                                                          Tamount(
                                                              false,
                                                              (100 * qty8),
                                                              qty8);

                                                          qty8 = 0;
                                                        }
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (qty8 != 1 &&
                                                              status8 == true) {
                                                            qty8--;

                                                            Tamount(false, 100,
                                                                qty8);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.remove)),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: Text(
                                                    '$qty8',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (status8 == true) {
                                                            qty8++;
                                                            Tamount(status8,
                                                                100, qty8);
                                                          }
                                                        });
                                                      },
                                                      icon: Icon(Icons.add)),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Container(
                                      height: 120,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("Image/8.png"),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 217,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Neon(
                                text: "Total Order Amount",
                                color: Colors.red,
                                font: NeonFont.Beon,
                                fontSize: 25,
                                flickeringText: true,
                                flickeringLetters: [
                                  0,
                                  1,
                                  2,
                                  3,
                                  4,
                                  6,
                                  7,
                                  8,
                                  9,
                                  10,
                                  12,
                                  13,
                                  14,
                                  15,
                                  16,
                                  17
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 180,
                                width: 320,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Total Amount",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                          Text(
                                            "GST 18%",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                          Text(
                                            "Discount $discount %",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                          Text(
                                            "Total Pay Amount",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 180,
                                      width: 120,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "${total.toStringAsPrecision(5)}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                          Text(
                                            "${gst.toStringAsPrecision(5)}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                          Text(
                                            "${discounttt.toStringAsPrecision(
                                                5)}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                          Text(
                                            "${famount.toStringAsPrecision(5)}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        AnimatedButton(
                          height: 45,
                          width: 130,
                          color: Colors.green,
                          child: Text(
                            'Order Now',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: () {
                            MotionToast.success(
                              description:
                              Text("Your order successfully done "),
                            ).show(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.95),
          content: Container(
            height: 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 95,
                    width: 110,
                    child: Lottie.asset(
                        "Animation/27993-brown-hands-waving.json",
                        fit: BoxFit.fitHeight),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "Do you want to leave?",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1.5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          print('Yes selected');
                          exit(0);
                        },
                        child: Text("Yes"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade800),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('Yes selected');

                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'No',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(primary: Colors
                              .green),
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  bool isOpened = false;

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Order Menu",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
                SizedBox(height: 25.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Menu();
              },));
            },
            leading: const Icon(Icons.home, size: 30.0, color: Colors.white),
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 20),
            ),
            textColor: Colors.white,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
