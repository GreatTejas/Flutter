import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formkey = GlobalKey<FormState>();
  String _email="";
  String _password="";
  bool account=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email_id";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter your email_id",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    )
                  )
                ),
                onSaved: (value){
                  _email=value!;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "password field cannot be blank";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter your password",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2.0,
                    )
                  )
                ),
                onSaved: (value){
                  _password=value!;
                },
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: (){
                  if (_formkey.currentState!.validate()){
                    // add database connection logic here
                    // currently it shows a snack bar
                    _formkey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content:Text("Processing Data ;; Email='$_email' /n password='$_password'"))
                    );
                  }
                }, 
                child: Text(account?"Login":"SignUp")
                ),
                TextButton(onPressed: (){
                  setState(() {
                    account=!account;
                  });
                }, child: Text(account?"New here? SignUp":"Already have an account? log in"))
            ],
          ),
        ),
      ),
    );
  }
}
