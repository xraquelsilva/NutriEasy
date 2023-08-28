// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables



import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
//import 'navbar.dart';




class Refeicaodetalhes extends StatefulWidget{
  
  final String titulo;
  final String data;

  Refeicaodetalhes({required this.titulo, required this.data, Key? key}) : super(key: key);

  @override
  State<Refeicaodetalhes> createState() => Refeicao();
}

class Refeicao extends State<Refeicaodetalhes>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: 
      PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          toolbarHeight: 70,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 20),
            child:Text(widget.titulo,
          style:TextStyle(
            color: Color.fromARGB(176, 0, 0, 0),
            fontSize: 18,
            fontFamily: 'Public Sans',
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
            
          ) ,
          ), ),
          
          elevation: 0,
          
          leading: IconButton(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            icon: Icon(Icons.arrow_back),
            color: const Color.fromARGB(171, 0, 0, 0),
            onPressed: () { 
              Navigator.pop(context);
            },
          ),

          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFFCDDE47),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ), ),),  ), ),


        body:
        Padding(
          padding: EdgeInsets.symmetric(horizontal:20),
          child:Align(
            alignment: Alignment.topCenter,
              
             child: Column(
              children: [
                SizedBox(height: 15,),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF528540)
                  ),
                  child: Center(
                    child: Text(widget.data,
                    style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  height: 500,
                  width: 300,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 1.2,
                        blurRadius: 2,
                        offset: Offset(0, 3), // Define a posição da sombra
                      )
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    
                    children: [
                      Row(
                      children: [
                        Text('Alimento 1'),
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(74, 74, 74, 1),
                            thickness: 1.0,
                            indent: 10, 
                            endIndent: 10, 
                          ),),
                        Text('19 kcal'),
                        SizedBox(width: 10,),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: GestureDetector(
                            onTap: () {
                              // Sua lógica de onPressed aqui
                            },
                            
                          ),
                        )

                        ],
                    ),
                    SizedBox(height: 25,),
                    Row(
                      children: [
                        Text('Alimento 2'),
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(74, 74, 74, 1),
                            thickness: 1.0,
                            indent: 10, 
                            endIndent: 10, 
                          ),),
                        Text('19 kcal'),
                        SizedBox(width: 10,),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: GestureDetector(
                            onTap: () {
                              // Sua lógica de onPressed aqui
                            },
                            
                          ),
                        )],
                    ),
                    SizedBox(height: 25,),
                    Row(
                      children: [
                        Text('Alimento 3'),
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(74, 74, 74, 1),
                            thickness: 1.0,
                            indent: 10, 
                            endIndent: 10, 
                          ),),
                        Text('19 kcal'),
                        SizedBox(width: 10,),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: GestureDetector(
                            onTap: () {
                              // Sua lógica de onPressed aqui
                            },
                            
                          ),
                        )],
                    ),
                    ],
                  ),
                )



              ],
             )  )),

          





    );

}
}
