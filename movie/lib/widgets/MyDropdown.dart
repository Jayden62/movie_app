import 'package:flutter/material.dart';
import 'package:movie/base/style/BaseStyle.dart';

class MyDropdown extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DropdownState();
}

class DropdownState extends State<MyDropdown> {
  List<String> types = ['IMAX 3D', 'SWEET BOX', 'GOLD CLASS'];
  String selected = 'Please, choose type of seat';

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromARGB(255, 52, 64, 78),
      ),
      child: Container(
          margin: EdgeInsets.only(top: normalMargin),
          color: Color.fromARGB(255, 52, 64, 78),
          child: DropdownButtonHideUnderline(
              child: Container(
            margin: EdgeInsets.only(left: normalMargin, right: normalMargin),
            child: DropdownButton(
                isExpanded: true,
                items: types.map((String val) {
                  return DropdownMenuItem<String>(
                      value: val,
                      child: Text(
                        val,
                        style: TextStyle(
                            color: yellowColor, fontWeight: FontWeight.bold),
                      ));
                }).toList(),
                hint: Text(selected, style: TextStyle(color: yellowColor)),
                onChanged: (String newVal) {
                  setState(() {
                    selected = newVal;
                  });
                }),
          ))),
    );
  }
}
