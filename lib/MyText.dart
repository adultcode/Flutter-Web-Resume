import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/prefer_sdk/html.dart' as html;

class MyText extends StatefulWidget {
  var text, style,style_hover;

  MyText(this.text, this.style, this.style_hover);

  @override
  _MyTextState createState() => _MyTextState(this.text, this.style, this.style_hover);
}

class _MyTextState extends State<MyText> {
  static final appContainer = html.window.document.getElementById('app-container');

  var text, style,style_hover;

  var temp_style;
  @override
  void initState() {
    temp_style = style;
  }

  _MyTextState(this.text, this.style, this.style_hover);

  @override
  Widget build(BuildContext context) {
     return MouseRegion(
      onEnter: (e){
        appContainer.style.cursor='pointer';
        setState(() {
          temp_style = style_hover;
        });
        print('hoveeer');

      },
      onExit: (e){
        appContainer.style.cursor='default';
        setState(() {
          temp_style = style;

        });
     },
      child: Text(text,style: temp_style,),
    );
  }
}
