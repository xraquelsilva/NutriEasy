// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables



import 'package:flutter/material.dart';
import 'dart:math';




class Refeicaodetalhes extends StatefulWidget{
  
  final String titulo;
  final String data;
  final int index;

  Refeicaodetalhes({required this.titulo, required this.data, required this.index, Key? key}) : super(key: key);

  @override
  State<Refeicaodetalhes> createState() => Refeicao();
}

class Refeicao extends State<Refeicaodetalhes>{

   late List<List<String>> refeicoes;
  late List<String> alimentos;
  late List<List> calorias;
  late List caloria;
  late int totalcalorias;
  late int index;
  late String alimentosalvo1= '';
  late String alimentosalvo2= '';
  late String alimentosalvo3= '';
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  @override
  void initState() {
    super.initState();
    
    refeicoes = [
      ['Ovo cozido', 'Cuscuz', 'Tapioca'], 
      ['Banana', 'Omelete','Vitamina de abacate'],
      ['Arroz', 'Feijão preto', 'Frango grelhado'], 
      // ... outras refeições
    ];




    index = widget.index;

    
    _Updatefoods();
    
    
  }


void _Updatefoods() {
  
  alimentos = refeicoes[index];
  
  
}






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
                SizedBox(height: 25,),

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
                        Text(isChecked1? alimentosalvo1: alimentos[0] ),
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(74, 74, 74, 1),
                            thickness: 1.0,
                            indent: 15,
                            endIndent: 0,
                          ),
                        ),
                        SizedBox(width: 10),
                        Checkbox(
                          value: isChecked1,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked1 = value ?? false;
                              alimentosalvo1 = alimentos[0];
                            });
                          },
                          shape: CircleBorder(),
                          activeColor: Color(0xFF528540)
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                       Row(
                      children: [
                        Text(isChecked2? alimentosalvo2: alimentos[1] ),
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(74, 74, 74, 1),
                            thickness: 1.0,
                            indent: 15,
                            endIndent: 0,
                          ),
                        ),
                        SizedBox(width: 10),
                        Checkbox(
                          value: isChecked2,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked2 = value ?? false;
                              alimentosalvo2 = alimentos[1];
                            });
                          },
                          shape: CircleBorder(),
                          activeColor: Color(0xFF528540)
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        Text(isChecked3? alimentosalvo3: alimentos[2] ),
                        Expanded(
                          child: Divider(
                            color: Color.fromRGBO(74, 74, 74, 1),
                            thickness: 1.0,
                            indent: 15,
                            endIndent: 0,
                          ),
                        ),
                        SizedBox(width: 10),
                        Checkbox(
                          value: isChecked3,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked3 = value ?? false;
                              alimentosalvo3 = alimentos[2];
                            });
                          },
                          shape: CircleBorder(),
                          activeColor: Color(0xFF528540)
                        ),
                      ],
                    ),
                    SizedBox(height: 75,),

                    Text('Atualizar refeições',
                    style:TextStyle(
                      color: Color.fromARGB(176, 0, 0, 0),
                      fontSize: 15,
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,)),

                    SizedBox(height: 5,),

                    Divider(thickness: 2,color: Color(0xFF528540),
                    indent: 20,endIndent: 20,),

                    SizedBox(height: 20,),

                    Container(
                      height: 50,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFFCDDE47),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            index= Random().nextInt(3);
                          });
                          _Updatefoods();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFCDDE47),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Atualizar ',
                          style: TextStyle(
                            color: Color(0xFF528540),
                            fontSize: 20,
                            fontFamily: 'Public Sans',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    )










                    
                    ],
                  ),
                )

              ],
             )  )),

          





    );

}
}
