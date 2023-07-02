import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PtMedHis extends StatefulWidget {
  @override
  _PtMedHisState createState() => _PtMedHisState();
}

class _PtMedHisState extends State<PtMedHis> {
  @override
  void initState() {
    super.initState();
    _loadFromSharedPreferences();
  }

  Map<String, dynamic> _conditions = {
    'High Blood Pressure': false,
    'Heart Problems': false,
    'Stroke': false,
    'Diabetes': false,
    'Kidney Disease': false,
    'Liver Disease': false,
    'High Cholesterol': false,
    'Cancer': {
      'selected': false,
      'type': '',
    },
    'Anemia': false,
    'Heart Attack': false,
    'Other Medical Issues': '',
  };

  void _onConditionSelected(String condition, dynamic selected) {
    setState(() {
      _conditions[condition] = selected;
    });

    // _saveToSharedPreferences;
    //  _loadFromSharedPreferences;
  }

  void _saveConditions() async {
    // TODO: save selected conditions somewhere
    print(_conditions);

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // User not logged in, cannot save data
      return;
    }

    final conditionsData = {
      'High Blood Pressure': _conditions['High Blood Pressure'],
      'Heart Problems': _conditions['Heart Problems'],
      'Stroke': _conditions['Stroke'],
      'Diabetes': _conditions['Diabetes'],
      'Kidney Disease': _conditions['Kidney Disease'],
      'Liver Disease': _conditions['Liver Disease'],
      'High Cholesterol': _conditions['High Cholesterol'],
      'Cancer': _conditions['Cancer']['selected']
          ? {
              'selected': true,
              'type': _conditions['Cancer']['type'],
            }
          : {'selected': false},
      'Anemia': _conditions['Anemia'],
      'Heart Attack': _conditions['Heart Attack'],
      'Other Medical Issues': _conditions['Other Medical Issues'],
    };

    try {
      await FirebaseFirestore.instance
          .collection('healthConditions')
          .doc(user.email)
          .set(conditionsData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Health conditions data saved successfully!'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save health conditions data.'),
        ),
      );
    }
    _saveToSharedPreferences;
  }

  void _saveToSharedPreferences() async {
    _saveConditions();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('High Blood Pressure', _conditions['High Blood Pressure']);
    prefs.setBool('Heart Problems', _conditions['Heart Problems']);
    prefs.setBool('Stroke', _conditions['Stroke']);
    prefs.setBool('Diabetes', _conditions['Diabetes']);
    prefs.setBool('Kidney Disease', _conditions['Kidney Disease']);
    prefs.setBool('Liver Disease', _conditions['Liver Disease']);
    prefs.setBool('High Cholesterol', _conditions['High Cholesterol']);
    prefs.setBool('Cancer', _conditions['Cancer']['selected']);
    prefs.setString('Cancer Type', _conditions['Cancer']['type']);
    prefs.setBool('Anemia', _conditions['Anemia']);
    prefs.setBool('Heart Attack', _conditions['Heart Attack']);
    prefs.setString(
        'Other Medical Issues', _conditions['Other Medical Issues']);
  }

  void _loadFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _conditions['High Blood Pressure'] =
          prefs.getBool('High Blood Pressure') ?? false;
      _conditions['Heart Problems'] = prefs.getBool('Heart Problems') ?? false;
      _conditions['Stroke'] = prefs.getBool('Stroke') ?? false;
      _conditions['Diabetes'] = prefs.getBool('Diabetes') ?? false;
      _conditions['Kidney Disease'] = prefs.getBool('Kidney Disease') ?? false;
      _conditions['Liver Disease'] = prefs.getBool('Liver Disease') ?? false;
      _conditions['High Cholesterol'] =
          prefs.getBool('High Cholesterol') ?? false;
      _conditions['Cancer']['selected'] = prefs.getBool('Cancer') ?? false;
      _conditions['Cancer']['type'] = prefs.getString('Cancer Type') ?? '';
      _conditions['Anemia'] = prefs.getBool('Anemia') ?? false;
      _conditions['Heart Attack'] = prefs.getBool('Heart Attack') ?? false;
      _conditions['Other Medical Issues'] =
          prefs.getString('Other Medical Issues') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left,color: Color.fromRGBO(83, 113, 136,1),size: 30,),
        ),
        titleSpacing: 0,
        backgroundColor:   Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
            color: Color.fromRGBO(83, 113, 136,1)
        ),
        title:
        Text(
          'Medical History',
          style: GoogleFonts.lato(fontSize: 20,fontWeight: FontWeight.bold, color: Color.fromRGBO(83, 113, 136,1),),
        ),

      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: _conditions.keys.map((String condition) {
          if (condition == 'Cancer') {
            return Column(
              children: [
                CheckboxListTile(
                  title: Text(condition),
                  value: _conditions[condition]['selected'],
                  onChanged: (bool? selected) {
                    _onConditionSelected(condition, {
                      'selected': selected,
                      'type': _conditions[condition]['type'],
                    });
                  },
                ),
                _conditions[condition]['selected']
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Type of cancer',
                          ),
                          onChanged: (String type) {
                            _onConditionSelected(condition, {
                              'selected': true,
                              'type': type,
                            });
                          },
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            );
          } else if (condition == 'Other Medical Issues') {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: condition,
                ),
                onChanged: (String value) {
                  _onConditionSelected(condition, value);
                },
              ),
            );
          } else {
            return CheckboxListTile(
              title: Text(condition),
              value: _conditions[condition],
              onChanged: (bool? selected) {
                _onConditionSelected(condition, selected);
              },
            );
          }
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Color.fromRGBO(83, 113, 136,1),
        onPressed: _saveToSharedPreferences,
        child: Icon(Icons.save),
      ),
    );
  }
}
