import 'package:flutter/material.dart';

import '../data/Folio.dart';

// Create a Form Widget
class FolioForm extends StatefulWidget {
  final Folio folio;

  FolioForm(this.folio);

  @override
  FolioFormState createState() {
    return FolioFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class FolioFormState extends State<FolioForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  Folio folio = new Folio(0, '', '');
  final appTitle = 'Folio';
  String name = '';
  String desc = '';
  FolioRepoImpl ss = new FolioRepoImpl();
  Widget getScafold(Widget wid) => MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
          ),
          body: wid,
        ),
      );

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above

    return getScafold(getForm());
  }

  Widget getForm() => SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Folio'),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Name *',
                  labelText: 'Name',
                ),
                maxLength: 100,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Folio Name';
                  }
                },
                onSaved: (value) {
                  name = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Description',
                  labelText: 'Description',
                ),
                keyboardType: TextInputType.multiline,
                maxLength: 200,
                onSaved: (value) {
                  desc = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.

                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      folio = new Folio(null, name, desc);
                      print('Say $folio $name $desc');
                      ss.addFolioById(folio).then((value) => {
                            ss.getFolio().then(print)
                            // If the form is valid, we want to show a Snackbar
//                            Scaffold.of(context).showSnackBar(SnackBar(
//                              content: Text('Processing $value'),
//                            ))
                          });
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      );
}
