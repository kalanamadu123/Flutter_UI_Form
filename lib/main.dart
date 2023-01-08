import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String myname;
  late String myemail;
  late String myphonenumber;


  final formKey = GlobalKey<FormState>(); //key for form
  String name="";

  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return  Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFffffff),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Form(
              key: formKey, //key for form
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:height*0.04),
                  const Text("Here to Get", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                  const Text("Welcomed !", style: TextStyle(fontSize: 30, color:Color(0xFF363f93)),),
                  SizedBox(height: height*0.05),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Enter Your Name"),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                        return "Enter Valid Name";
                      }else{
                        return null;
                      }


                    },
                    onSaved: (value){
                      myname = value!;
                    },
                  ),

                  SizedBox(height: height*0.05),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Enter Your Phone number"),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r'^(?:[+0]9)?[0-9]{10,12}$').hasMatch(value!)){
                        return "Enter Valid Phone number";
                      }else{
                        return null;
                      }

                    },
                    onSaved: (value){
                      myphonenumber = value!;
                    },
                  ),

                  SizedBox(height: height*0.05),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Enter Your Email"),
                    validator: (value){
                      if(value!.isEmpty || !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value!)){
                        return "Enter Valid Email";
                      }else{
                        return null;
                      }

                    },
                    onSaved: (value){
                      myemail = value!;
                    },
                  ),
                  const SizedBox(height: 20.0,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Sign Up"),
                      ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor:const Color(0xFF363f93),padding: EdgeInsets.all(12.0)),
                          onPressed: (){
                        if(formKey.currentState!.validate()){
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data'))
                          );
                        }

                        formKey.currentState!.save();

                        print(myname);
                        print(myemail);
                        print(myphonenumber);


                      }, child: const Text("LOG IN",style: TextStyle(letterSpacing: 3.0),))
                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }


}