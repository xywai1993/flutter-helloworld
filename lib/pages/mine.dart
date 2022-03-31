import 'package:flutter/material.dart';
import '../nav.dart';

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class MinePage extends StatefulWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottom_nav(context, 2),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        width: getScreenWidth(context),
        child: Column(
          children: [
            // DecoratedBox(decoration: ,),
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.network(
                'https://image.douba.cn/words/assets/avatar.da8cada9.jpeg',
                width: 80.0,
                height: 80.0,
              ),
            ),

            Text('露露')
          ],
        ),
      ),
    );
  }
}
