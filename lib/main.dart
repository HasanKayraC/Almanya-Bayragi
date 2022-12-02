// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String islem = "Herhangi bir tuşa basılmadı";
int renkNo = 0;
List<Color> renk = [
Colors.black,
Colors.red,
Colors.yellow

];

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extra Projects',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //---------------------------------------------------------------------------
  //  SnackBar her tıklama işleminde ayrı ayrı yazmak yerine bir fonksiyon(void)
  //  içerisinde oluşturduk. Bu fonksiyona bir parametre göndermemiz gerekiyor.
  //  Fonksiyonu çağırdığımız zaman yani örneğin onTap olayında snackbar görünmesini
  //  istediğimizde fonksiyona verdiğimiz ismi yazıyoruz yani -> showSnack("resme tıklandı")
  //  parametre string türünde olmalı! parametre göndermezsek hata verir çalışmaz!
  //---------------------------------------------------------------------------
  void showSnack(String GelenYazi) {
    SnackBar bilgiCubugu = SnackBar(
      content: Text(GelenYazi),
      duration: Duration(milliseconds: 250),
    );
    //SnackBar nesnesi oluşturduk. adını bilgiCubugu koyduk. Gösterilecek yazıyı GelenYazi, süresini de çeyrek saniye yaptık.
    ScaffoldMessenger.of(context).showSnackBar(bilgiCubugu);
    //ScaffoldMessenger ile yukarıda oluşturduğumuz bilgiCubugu adlı değişkeni show yaptık
  }
  //---------------------------------------------------------------------------
  //---------------------------------------------------------------------------
  //---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extra Project - 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //---------------------------------------------------------------------------
            Text(
              "Almanya'ya özel hazırlanan projeye hoşgeldiniz",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //---------------------------------------------------------------------------
            Text(
              "Bayrağa tıklamak yasak gerisinde özgürsün",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w200, fontStyle: FontStyle.italic),
            ),
            //---------------------------------------------------------------------------
            SizedBox(
              height: 30,
            ),
            //---------------------------------------------------------------------------
            // GestureDetector 'un onTap ve onDoubleTap işlemlerinde farklı işlemler yaptırabilirsiniz.
            // FlutterLogo derslerde kullanılan basit bir widget'tir.(sadece flutter logosu koyar.)
            //---------------------------------------------------------------------------
             Container(
              height: 100,
              width: 300,
              color: renk[0],
            ),

           Container(
              height: 100,
              width: 300,
              color: renk[1],
            ),

            Container(
              height: 100,
              width: 300,
              color: renk[2],
            ),
     SizedBox(height: 30,),
GestureDetector(
              onTap: (() {
                setState(() {
                  islem = "Hitler 1 defa tıklandı";
                  if (renkNo == 5) {
                    renkNo = 0;
                  } else {
                    renkNo++;
                  }
                });
                showSnack("Hitler 1 defa tıklandı");
              }),
              onDoubleTap: (() {
                setState(() {
                  islem = "Naziye 2 defa tıklandı";
                });
                showSnack("Naziye 2 defa tıklandı");
              }),
              child: Image.network(
                'https://thumbs.gfycat.com/DetailedSomberEkaltadeta-size_restricted.gif',
                height: 100,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //---------------------------------------------------------------------------
            //---------------------------------------------------------------------------
            //-----------Aşağıdaki kodlar yapılan işlemin bilgisini verme amaçlıdır------
            //---------------------------------------------------------------------------
            //---------------------------------------------------------------------------
            //---------------------------------------------------------------------------
            //---------------------------------------------------------------------------
            //---------------------------------------------------------------------------
            Spacer(),
            //---------------------------------------------------------------------------
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: renk[renkNo],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                islem,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            //---------------------------------------------------------------------------
            SizedBox(
              height: 50,
            ),

            //---------------------------------------------------------------------------
          ],
        ),
      ),
    );
  }
}
