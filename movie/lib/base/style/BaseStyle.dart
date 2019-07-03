import 'package:flutter/material.dart';

/// Dimension begin

double zeroSize = 0.0;

double smallestMargin = 5.0;
double smallerMargin = 10.0;
double smallMargin = 15.0;
double normalMargin = 20.0;
double largeMargin = 25.0;
double largerMargin = 30.0;
double largestMargin = 35.0;
double superLargestMargin = 40.0;

double smallestPadding = 5.0;
double smallerPadding = 10.0;
double smallPadding = 15.0;
double normalPadding = 20.0;
double largePadding = 25.0;
double largerPadding = 30.0;
double largestPadding = 35.0;
double superLargestPadding = 40.0;

double smallestRadius = 5.0;
double smallerRadius = 10.0;
double smallRadius = 15.0;
double normalRadius = 20.0;
double largeRadius = 25.0;
double largerRadius = 30.0;
double largestRadius = 35.0;

double smallestIcon = 20.0;
double smallerIcon = 30.0;
double smallIcon = 40.0;
double normalIcon = 50.0;
double largeIcon = 60.0;
double largerIcon = 70.0;
double largestIcon = 80.0;

double smallestFont = 10.0;
double smallerFont = 12.0;
double smallFont = 13.0;
double normalFont = 14.0;
double largeFont = 15.0;
double largerFont = 16.0;
double largestFont = 17.0;

double blackFont = 20.0;

double superLargestFont = 30.0;

double dialogHeightButton = 30.0;

double divider = 1.0;
double appBarHeight = 50.0;

double normalEditHeight = 40.0;

double largeButtonHeight = 48.0;
double normalButtonHeight = 42.0;
double normalButtonWidth = 200.0;

double smallButtonHeight = 35.0;
double smallButtonWidth = 150.0;

double line = 1.0;

double paddingDate = 40.0;

double borderWidth = 1.0;

double marginTitle = 60.0;

double widthTicketSmaller = 20.0;
double heightTicketSmaller = 10.0;

double iconSize = 20.0;

/// Dimension end

/// Default color

Color primaryColor = Color.fromARGB(255, 14, 194, 178);

var seatColor = Color.fromARGB(255, 91, 24, 22);

/// Color button

Color defaultStartColor = Color.fromARGB(255, 14, 194, 178);
Color defaultEndColor = Color.fromARGB(255, 4, 237, 167);

Color highlightStartColor = Color.fromARGB(255, 54, 252, 193);
Color highlightEndColor = Color.fromARGB(255, 129, 253, 216);

Color highlightStyleColor = Color.fromARGB(255, 242, 242, 242);

Color highlightStartColorSyncButton = Color.fromARGB(255, 255, 255, 255);
Color highlightEndColorSyncButton = Color.fromARGB(255, 217, 254, 251);

Color disableStartColor = Color.fromARGB(255, 166, 166, 166);
Color disableEndColor = Color.fromARGB(255, 226, 226, 226);
Color disableStyleColor = Color.fromARGB(255, 230, 230, 230);

Color grayColor = Color.fromARGB(255, 187, 194, 202);
Color lightGrayColor = Color.fromARGB(255, 242, 242, 242);

Color redColor = Color.fromARGB(255, 208, 2, 27);

Color darkRedColor = Color.fromARGB(255, 237, 4, 74);

Color greyColor = Color.fromARGB(255, 228, 228, 228);

Color grayColorIcon = Color.fromARGB(255, 140, 140, 144);

Color borderColor = Color.fromARGB(255, 4, 237, 167);

Color greenColor = Color.fromARGB(255, 46, 147, 135);

Color blackColor = Color.fromARGB(255, 0, 0, 0);

Color yellowColor = Color.fromARGB(255, 253, 194, 12);

Color lightYellowColor = Color.fromARGB(255, 232, 200, 97);

Color mColor = Color.fromARGB(255, 219, 215, 197);
Color myColor = Color.fromARGB(255, 173, 170, 156);

/// Round corner default

RoundedRectangleBorder roundCorner = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(0.0),
);

TextStyle blackStyle = TextStyle(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: normalFont);

TextStyle noEventStyle = TextStyle(
    color: grayColor, fontWeight: FontWeight.normal, fontSize: largerFont);

TextStyle darkRedStyle = TextStyle(
    color: darkRedColor, fontWeight: FontWeight.normal, fontSize: largerFont);

TextStyle whiteNormalBoldStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

TextStyle checkInStyle = TextStyle(
    color: Colors.white, fontWeight: FontWeight.bold, fontSize: largestFont);

TextStyle whiteStyle = TextStyle(
    color: Colors.white, fontWeight: FontWeight.normal, fontSize: largerFont);

TextStyle blackStyleBold = TextStyle(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: largerFont);

TextStyle blackCommonFont = TextStyle(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: blackFont);

TextStyle grayStyle = TextStyle(
    fontSize: normalFont, color: grayColor, fontWeight: FontWeight.normal);

TextStyle greenStyle = TextStyle(
    fontSize: largerFont,
    color: defaultStartColor,
    fontWeight: FontWeight.normal);

TextStyle blackStyleSearch = TextStyle(
    color: Colors.black, fontWeight: FontWeight.normal, fontSize: largestFont);

TextStyle whiteStylePersonal = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: superLargestFont);

TextStyle highlightBlackStyle = TextStyle(
    color: grayColor, fontWeight: FontWeight.bold, fontSize: normalFont);

TextStyle highlightTextStyle = TextStyle(
    color: primaryColor, fontWeight: FontWeight.bold, fontSize: largerFont);

TextStyle redStyle = TextStyle(
    color: redColor, fontWeight: FontWeight.normal, fontSize: normalFont);

BoxShadow buttonBoxShadow = BoxShadow(
  color: Color.fromARGB(255, 217, 217, 217),
  offset: Offset(0.0, 1.5),
  blurRadius: 1.5,
);

/// Default background of button
BoxDecoration defaultDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(normalRadius)),
    gradient: LinearGradient(
      begin: FractionalOffset.centerLeft,
      end: FractionalOffset.centerRight,
      colors: <Color>[defaultStartColor, defaultEndColor],
    ),
    boxShadow: [buttonBoxShadow]);

TextStyle defaultStyle = TextStyle(
    color: Colors.white, fontWeight: FontWeight.bold, fontSize: largerFont);

/// Highlight background of button
BoxDecoration highlightDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(normalRadius)),
    gradient: LinearGradient(
      begin: FractionalOffset.centerLeft,
      end: FractionalOffset.centerRight,
      colors: <Color>[highlightStartColor, highlightEndColor],
    ),
    boxShadow: [buttonBoxShadow]);

/// Highlight background of sync buttonInfo
BoxDecoration highlightSyncInfoDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(largestRadius)),
    gradient: LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      colors: <Color>[greenColor, greenColor],
    ),
    boxShadow: [buttonBoxShadow]);

TextStyle highlightStyle = TextStyle(
    color: highlightStyleColor,
    fontWeight: FontWeight.bold,
    fontSize: largerFont);

/// Highlight text

/// Disable background of button
BoxDecoration disableDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(smallerRadius)),
    gradient: LinearGradient(
      begin: FractionalOffset.centerLeft,
      end: FractionalOffset.centerRight,
      colors: <Color>[disableStartColor, disableEndColor],
    ),
    boxShadow: [buttonBoxShadow]);

/// Background header
BoxDecoration backgroundHeaderDecoration = BoxDecoration(
    gradient: LinearGradient(
  begin: FractionalOffset.centerLeft,
  end: FractionalOffset.centerRight,
  colors: <Color>[defaultStartColor, defaultEndColor],
));

/// Background check in header
BoxDecoration backgroundLongHeaderDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/photo/photo_long_header.png'),
    fit: BoxFit.cover,
  ),
);

/// Background event in header
BoxDecoration backgroundEventHeaderDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/photo/photo_event_header.png'),
    fit: BoxFit.cover,
  ),
);

TextStyle disableStyle = TextStyle(
    color: disableStyleColor,
    fontWeight: FontWeight.bold,
    fontSize: largerFont);

Color darkColor = Color.fromARGB(255, 23, 36, 48);
double radius = 20.0;
BoxDecoration userNameBoxDecoration = BoxDecoration(
    shape: BoxShape.rectangle,
    color: darkColor,
    borderRadius: BorderRadius.all(Radius.circular(radius)));

/// Under line of text field.

UnderlineInputBorder focusedUnderlineInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: borderColor, width: line));

UnderlineInputBorder enabledUnderlineInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: lightGrayColor, width: line));

UnderlineInputBorder underlineInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: line));

/// Rectangle of text field

OutlineInputBorder focusedOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(zeroSize)),
    borderSide: BorderSide(color: Colors.blueAccent, width: line));

OutlineInputBorder enabledOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(zeroSize)),
    borderSide: BorderSide(color: lightGrayColor, width: line));

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(zeroSize)),
    borderSide: BorderSide(color: Colors.black, width: line));

/// Default background of button
BoxDecoration defaultSwitchDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    color: Color.fromARGB(255, 173, 168, 117));

BoxDecoration defaultActiveSwitchItemDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    gradient: LinearGradient(
      begin: FractionalOffset.topCenter,
      end: FractionalOffset.bottomCenter,
      colors: <Color>[Colors.white, Color.fromARGB(255, 217, 254, 251)],
    ));

BoxDecoration defaultInactiveSwitchItemDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    color: Color.fromARGB(255, 173, 168, 117));

TextStyle defaultActiveSwitchItemStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

TextStyle defaultInactiveSwitchItemStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

EdgeInsets switchItemMargin = EdgeInsets.all(4.0);
