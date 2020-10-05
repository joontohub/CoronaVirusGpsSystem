import 'package:flutter/material.dart';

class StoreSignIn extends StatefulWidget {
  @override
  _StoreSignInState createState() => _StoreSignInState();
}

class _StoreSignInState extends State<StoreSignIn> {
  TextEditingController nameFieldController = TextEditingController();
  TextEditingController sexFieldController = TextEditingController();
  TextEditingController ageFieldController = TextEditingController();
  TextEditingController phoneFieldController = TextEditingController();

  //Needing to reduce Resource , should add dispose method

  //Need to Add DataUploading process from inputfields.
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 50)),
            Center(
              child: Image(
                image: AssetImage('images/dizzy.gif'),
                width: 170.0,
                height: 190.0,
              ),
            ),
            Form(
                //global key
                key: _formKey,
                child: Theme(
                    data: ThemeData(
                        primaryColor: Colors.teal,
                        inputDecorationTheme: InputDecorationTheme(
                            labelStyle:
                                TextStyle(color: Colors.teal, fontSize: 15.0))),
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: nameFieldController,
                            decoration: InputDecoration(labelText: "Name"),
                            keyboardType: TextInputType.name,
                          ),
                          TextField(
                            controller: sexFieldController,
                            decoration: InputDecoration(labelText: "Sex"),
                            keyboardType: TextInputType.name,
                            //Should fix Sex field
                          ),
                          TextField(
                            controller: ageFieldController,
                            decoration: InputDecoration(labelText: "Age"),
                            keyboardType: TextInputType.datetime,
                          ),
                          TextField(
                            controller: phoneFieldController,
                            decoration: InputDecoration(labelText: "Phone"),
                            keyboardType: TextInputType.phone,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: RaisedButton(
                                  color: Colors.orangeAccent,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 35.0,
                                  ),
                                  onPressed: () {})),
                        ],
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
