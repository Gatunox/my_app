import 'package:flutter/widgets.dart';
import 'package:my_app/model/letter_model.dart';
import 'package:my_app/styles/colors.dart';

class LetterItem extends StatelessWidget {
  const LetterItem({
    Key key,
    @required this.letter,
    @required this.currentIndex,
    @required this.activeItem,
    @required this.selectedItem,
    @required this.onTapTap,
    @required this.isFirstItem,
    @required this.isLastItem, 
  }) : super(key: key);

  final Letter letter;
  final int currentIndex;
  final int activeItem;
  final int selectedItem;
  final bool isFirstItem;
  final bool isLastItem;
  final Function onTapTap;

  @override
  Widget build(BuildContext context) {
    double leftMargin = 0;
    double rightMargin = 0;
    Color backgroundColor = foregroungColor12;
    Color borderColor = foregroungColor12;
    TextStyle textStyle = disabledListItemStyle;

    leftMargin = isFirstItem ? 20.0 : 2.0;
    rightMargin = isLastItem ? 20.0 : 2.0;

    if (letter.enabled) {
      backgroundColor =
          currentIndex == activeItem ? darkerPurpleColor : foregroungColor45;
      borderColor =
          currentIndex == selectedItem ? darkerPurpleColor : foregroungColor12;
      textStyle = currentIndex == activeItem
          ? selectedListItemStyle
          : unselectedListItemStyle;
    }

    return GestureDetector(
      onTap: () {
        //print("GestureDetector onTap");
        if (letter.enabled) {
          onTapTap();
        }
      },
      child: Container(
        margin: EdgeInsets.only(
            left: leftMargin, top: 2.0, right: rightMargin, bottom: 2.0),
        child: ClipRRect(
          //borderRadius: new BorderRadius.only(
          //    bottomLeft: const Radius.circular(15.0),
          //    bottomRight: const Radius.circular(15.0),
          //    topLeft: const Radius.circular(15.0),
          //    topRight: const Radius.circular(15.0)),
          child: Container(
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 2.0),
              color: backgroundColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(12.0) //         <--- border radius here
                  ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: RichText(
                  text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: letter.value,
                    style: textStyle,
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}