// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/home/models/job.dart';
import 'package:time_tracker_flutter_course/services/database.dart';

class AddJobPage extends StatefulWidget {
  const AddJobPage({@required this.database, Key key}) : super(key: key);
  final Database database;

  static Future<void> show(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddJobPage(database: database,),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _AddJobPageState createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  int _ratePerHour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Job'),
        elevation: 2.0,
        actions: <Widget>[
          FlatButton(onPressed: _submit,
              child: Text('Save',
              style: TextStyle(
                  fontSize: 18,
              color: Colors.white),
          )
          ),
        ],
      ),
      body: _buildContent(),
      backgroundColor: Colors.blueGrey,
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: SingleChildScrollView(
          child:
              Padding(padding: const EdgeInsets.all(16.0), child: _buildForm()),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildChildren(),
      ),
    );
  }

  List<Widget> _buildChildren() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Job name'),
        validator: (value) => value.isNotEmpty ? null : 'Name can\'t be empty',
        onSaved: (value) => _name = value,
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Rate per hour'),

        onSaved: (value) => _ratePerHour = int.parse(value) ?? 0,
        keyboardType:
            TextInputType.numberWithOptions(signed: false, decimal: false),
      ),

    ];
  }

  Future<void> _submit() async {
   // TODO: validate and save form
    if(_validateAndSaveForm()){
     final job = Job(name: _name, ratePerHour: _ratePerHour);
     await widget.database.createJob(job);
    }
  }

  bool _validateAndSaveForm(){
    final form = _formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
      return false;
  }
}
