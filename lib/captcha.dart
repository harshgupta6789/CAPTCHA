import 'dart:math';

import 'package:captcha/home.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Captcha extends StatefulWidget {
  @override
  _CaptchaState createState() => _CaptchaState();
}

class _CaptchaState extends State<Captcha> {
  String a1, a2, a3, b1, b2, b3, c1, c2, c3;
  int direction, solution, solutionPosition;
  bool show = false;
  Map map = {};
  Random r = Random();

  generateGame() {
    a1 = null;
    a2 = null;
    a3 = null;
    b1 = null;
    b2 = null;
    b3 = null;
    c1 = null;
    c2 = null;
    c3 = null;

    map["a1"] = false;
    map["a2"] = false;
    map["a3"] = false;
    map["b1"] = false;
    map["b2"] = false;
    map["b3"] = false;
    map["c1"] = false;
    map["c2"] = false;
    map["c3"] = false;

    direction = r.nextInt(8) + 1;
    solutionPosition = r.nextInt(3) + 1;
    if (direction <= 3) {
      if (direction == 1) {
        map["a1"] = true;
        map["a2"] = true;
        map["a3"] = true;
      } else if (direction == 2) {
        map["b1"] = true;
        map["b2"] = true;
        map["b3"] = true;
      } else {
        map["c1"] = true;
        map["c2"] = true;
        map["c3"] = true;
      }

      if (solutionPosition == 1)
        solution = ((direction - 1) * 3) + 1;
      else if (solutionPosition == 2)
        solution = ((direction - 1) * 3) + 2;
      else
        solution = ((direction - 1) * 3) + 3;
    } else if (direction > 3 && direction <= 6) {
      if (direction == 4) {
        map["a1"] = true;
        map["b1"] = true;
        map["c1"] = true;
      } else if (direction == 5) {
        map["a2"] = true;
        map["b2"] = true;
        map["c2"] = true;
      } else {
        map["a3"] = true;
        map["b3"] = true;
        map["c3"] = true;
      }

      if (solutionPosition == 1)
        solution = direction - 3;
      else if (solutionPosition == 2)
        solution = direction - 3 + 3;
      else
        solution = direction - 3 + 6;
    } else {
      map["b2"] = true;
      if (direction == 7) {
        map["a1"] = true;
        map["c3"] = true;

        if (solutionPosition == 1)
          solution = 1;
        else if (solutionPosition == 2)
          solution = 5;
        else
          solution = 9;
      } else {
        map["a3"] = true;
        map["c1"] = true;

        if (solutionPosition == 1)
          solution = 3;
        else if (solutionPosition == 2)
          solution = 5;
        else
          solution = 7;
      }
    }

    if (!map["a1"])
      a1 = r.nextInt(2) == 0 ? null : "X";
    else
      a1 = solution == 1 ? null : "O";
    if (!map["a2"])
      a2 = r.nextInt(2) == 0 ? null : "X";
    else
      a2 = solution == 2 ? null : "O";
    if (!map["a3"])
      a3 = r.nextInt(2) == 0 ? null : "X";
    else
      a3 = solution == 3 ? null : "O";
    if (!map["b1"])
      b1 = r.nextInt(2) == 0 ? null : "X";
    else
      b1 = solution == 4 ? null : "O";
    if (!map["b2"])
      b2 = r.nextInt(2) == 0 ? null : "X";
    else
      b2 = solution == 5 ? null : "O";
    if (!map["b3"])
      b3 = r.nextInt(2) == 0 ? null : "X";
    else
      b3 = solution == 6 ? null : "O";
    if (!map["c1"])
      c1 = r.nextInt(2) == 0 ? null : "X";
    else
      c1 = solution == 7 ? null : "O";
    if (!map["c2"])
      c2 = r.nextInt(2) == 0 ? null : "X";
    else
      c2 = solution == 8 ? null : "O";
    if (!map["c3"])
      c3 = r.nextInt(2) == 0 ? null : "X";
    else
      c3 = solution == 9 ? null : "O";

    setState(() {
      show = false;
    });

    print("direction : " + direction.toString());
    print("output : " + solution.toString());
    print("output position : " + solutionPosition.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Captcha"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "You are 'O' and it's your turn\nTap on the right place to win",
            ),
            SizedBox(
              height: 150,
            ),
            IgnorePointer(
              ignoring: show,
              child: Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Text(a1 ?? ""),
                      onPressed: () {
                        if (a1 == null) {
                          setState(() {
                            a1 = "O";
                            show = true;
                            if (solution == 1) {
                              Toast.show("Verified Successfully", context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                          });
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text(a2 ?? ""),
                      onPressed: () {
                        if (a2 == null) {
                          setState(() {
                            a2 = "O";
                            show = true;
                            if (solution == 2) {
                              Toast.show("Verified Successfully", context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                          });
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text(a3 ?? ""),
                      onPressed: () {
                        if (a3 == null) {
                          setState(() {
                            a3 = "O";
                            show = true;
                            if (solution == 3) {
                              Toast.show("Verified Successfully", context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            IgnorePointer(
              ignoring: show,
              child: Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Text(b1 ?? ""),
                      onPressed: () {
                        if (b1 == null) {
                          setState(() {
                            b1 = "O";
                            show = true;
                            if (solution == 4) {
                              Toast.show("Verified Successfully", context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                          });
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text(b2 ?? ""),
                      onPressed: () {
                        if (b2 == null) {
                          setState(() {
                            b2 = "O";
                            show = true;
                            if (solution == 5) {
                              Toast.show("Verified Successfully", context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                          });
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text(b3 ?? ""),
                      onPressed: () {
                        if (b3 == null) {
                          setState(() {
                            b3 = "O";
                            show = true;
                            if (solution == 6) {
                              Toast.show("Verified Successfully", context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            IgnorePointer(
              ignoring: show,
              child: Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      child: Text(c1 ?? ""),
                      onPressed: () {
                        if (c1 == null) {
                          setState(() {
                            c1 = "O";
                            show = true;
                            if (solution == 7) {
                              Toast.show("Verified Successfully", context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                          });
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text(c2 ?? ""),
                      onPressed: () {
                        if (c2 == null) {
                          setState(() {
                            c2 = "O";
                            show = true;
                            if (solution == 8) {
                              Toast.show("Verified Successfully", context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                          });
                        }
                      },
                    ),
                    RaisedButton(
                      child: Text(c3 ?? ""),
                      onPressed: () {
                        if (c3 == null) {
                          setState(() {
                            c3 = "O";
                            show = true;
                            if (solution == 9) {
                              Toast.show("Verified Successfully", context);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            !show
                ? Center(
                    child: FlatButton.icon(
                      label: Text("Refresh"),
                      icon: Icon(Icons.rotate_left),
                      onPressed: () {
                        generateGame();
                      },
                    ),
                  )
                : Container(),
            show
                ? Center(
                    child: FlatButton.icon(
                      label: Text("Wrong Answer, Retry"),
                      icon: Icon(Icons.rotate_left),
                      onPressed: () {
                        generateGame();
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
