import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';



void main() {
  runApp(MyApp());
}
//class Myapp
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}


//class home
class Home extends StatefulWidget{
  _HomeState createState() => _HomeState();
}
class Menu {
  const Menu({this.title, this.icon});
  final String title;
  final String icon;

}
const List<Menu> menus = const[
  const Menu (title: "Batik", icon: "assets/batik.jpg"),
  const Menu (title: "Kebaya", icon: "assets/kebaya.jpg"),
  const Menu (title: "Dress", icon: "assets/dress.jpg"),
  const Menu (title: "Hijab", icon: "assets/hijab.jpg"),
  const Menu (title: "Tas", icon: "assets/tas.jpg"),
  const Menu (title: "Kemeja", icon: "assets/kemeja.jpg"),
  const Menu (title: "Kaos", icon: "assets/kaos.jpg"),
  const Menu (title: "Accesories", icon: "assets/jam.jpg"),
];

//class MenuCard
class MenuCard extends StatelessWidget{
  const MenuCard({Key key, this.menu}) : super(key:key);
  final Menu menu;
  Widget build(BuildContext context){
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: (){
          _showDialog(context, menu);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(5),),
            Expanded(
                child:Image.asset(menu.icon, height: 80.0, width: 80.0,fit: BoxFit.contain,)
            ),
            Text(menu.title, style: TextStyle(fontSize: 12.0)),
            Padding(padding: EdgeInsets.all(5)),
          ],
        ),
      ),
    );
  }
}



void  _showDialog(BuildContext context, Menu menu){
  showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title:  new Text("Keterangan"),
        content: new Text ("Ini menu" + menu.title),
        actions: <Widget>[
          new FlatButton(
            child: new Text("close"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
        ],
      );
    }
  );
}

//class home
class _HomeState extends State<Home>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("BUTIX"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.mail, color: Colors.white,),
          ),
        ],
      ),





      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(menus.length, (index) {
          return Center(

              child: MenuCard(menu: menus[index])
          );
        }),
      ),





      //botton navbar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black,),
           
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black,),
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black,),
            

          ),
        ],
      ),
    );
  }
}