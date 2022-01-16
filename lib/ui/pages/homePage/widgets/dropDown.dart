
import 'package:covid_19_tracker/models/apimodel.dart';
import 'package:flutter/material.dart';


class MayureshDropDown extends StatefulWidget {
  final List<ApiModel> stateList;
  MayureshDropDown({this.stateList});

  @override
  _MayureshDropDownState createState() => _MayureshDropDownState();
}

class _MayureshDropDownState extends State<MayureshDropDown> {
  @override
  Widget build(BuildContext context) {
    
  String selectedState;
  
    return  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_pin,
                            color: Color(0xFF5856D6)),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: DropdownButton(
                            isExpanded: true,
                            underline: SizedBox(),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: Color(0xFFE5E5E5),
                            ),
                            value: selectedState,
                            items: widget.stateList.map((state) {
                              return DropdownMenuItem(
                                child: Text(state.locationName),
                                value: state.locationName,
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                selectedState = newVal;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  );
  }
}