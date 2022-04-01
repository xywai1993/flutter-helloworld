
import 'package:flutter/material.dart';
import '../css-func/index.dart';
import '../nav.dart';
import 'package:http/http.dart' as http;

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}



class MinePage extends StatefulWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}


 Future doRequest(){
  // http.get()
  return http.get(Uri.parse('https://fanep.cn/jp-h5/word-type'));
}

class _MinePageState extends State<MinePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    doRequest().then((response){
      print(response.hashCode);
      print(response.body.runtimeType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottom_nav(context, 2),
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.all(20),
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
            Container(margin: marginTop(20),child: Text('匿名用户'),),
            Container(margin: marginTop(20), child: ListTile(title: Text('分类管理'),leading: Icon(Icons.abc),trailing: Icon(Icons.arrow_forward_ios,color: Color.fromRGBO(0, 0, 0, 1),size: 14.0,),),decoration: BoxDecoration( border: Border(bottom: BorderSide(color:Color(
                0xFFD2C0C0)))),),
            Container( child: ListTile(title: Text('历史记录'),leading: Icon(Icons.abc),),decoration: BoxDecoration( border: Border(bottom: BorderSide(color:Color(
                0xFFD2C0C0)))),),

          ],
        ),
      ),
    );
  }
}
