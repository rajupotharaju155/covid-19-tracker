import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

class Iframe extends StatefulWidget {
  @override
  _IframeState createState() => _IframeState();
}

class _IframeState extends State<Iframe> {
  @override
  Widget build(BuildContext context) {
    const kHtml = """

<iframe   style="margin-top: 200px; border: 1px solid black"    src="https://maps.mapmyindia.com/corona"></iframe>

""";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1C1228),
        title: Text("Map View",
        style: GoogleFonts.robotoMono(
        ),
        ),
      ),
      body: Container(
            // margin: EdgeInsets.only(top: 30),
            height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 10,
            child: HtmlWidget(
             kHtml,
              webView: true,
              webViewJs: true,
              enableCaching: true,
            ),
          ),
    );
  }
}
