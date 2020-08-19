import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keralacovid19/constraints.dart';

class TextWithUnderline extends StatelessWidget {
  const TextWithUnderline({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: kDefaultPadding, left: kDefaultPadding),
        child: Stack(
          children: <Widget>[
            Text(text,
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: kTextColor, fontWeight: FontWeight.w500)),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 7,
                color: kPrimaryColor.withOpacity(0.3),
              ),
            )
          ],
        ));
  }
}
