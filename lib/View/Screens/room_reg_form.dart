import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_tour/View/Screens/room_images_picker.dart';
import '../../Widgets/app_large_text.dart';
import '../../Widgets/default_button.dart';

class RoomRegForm extends StatefulWidget {
  const RoomRegForm({Key? key}) : super(key: key);

  @override
  State<RoomRegForm> createState() => _RoomRegFormState();
}

class _RoomRegFormState extends State<RoomRegForm> {
  List dropDownListData = [
    {"title": "Hunza", "value": "1"},
    {"title": "Skardu", "value": "2"},
    {"title": "Shigar", "value": "3"},
    {"title": "Tolti", "value": "4"},
  ];

  String defaultValue = "";
  String secondDropDown = "";

  final allChecked = CheckBoxModel(title: "All Checked");
  final checkBoxList = [
    CheckBoxModel(title: "CheckBox 1"),
    CheckBoxModel(title: "CheckBox 2"),
    CheckBoxModel(title: "CheckBox 3"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left: 40),
          child: AppLargeText(
            text: 'Room Registration Form',
            size: 20,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: AppLargeText(text: "Room Name", size: 20, )),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Enter Room Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              SizedBox(height: 20,),
              Align(
                  alignment: Alignment.topLeft,
                  child: AppLargeText(text: "Room Number", size: 20, )),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Enter Room Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              SizedBox(height: 20,),
              Align(
                  alignment: Alignment.topLeft,
                  child: AppLargeText(text: "Description", size: 20, )),
              SizedBox(
                height: 8,
              ),
              TextField(
                minLines: 5,
                maxLines: 8,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Enter Description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              SizedBox(height: 20,),
              Align(
                  alignment: Alignment.topLeft,
                  child: AppLargeText(text: "Place", size: 20, )),
              SizedBox(height: 8,),
              InputDecorator(
                decoration: InputDecoration(
                  border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  contentPadding: const EdgeInsets.all(20),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      isDense: true,
                      value: defaultValue,
                      isExpanded: true,
                      menuMaxHeight: 350,
                      items: [
                        const DropdownMenuItem(
                            child: Text(
                              "Select Place",
                            ),
                            value: ""),
                        ...dropDownListData.map<DropdownMenuItem<String>>((data) {
                          return DropdownMenuItem(
                              child: Text(data['title']), value: data['value']);
                        }).toList(),
                      ],
                      onChanged: (value) {
                        print("selected Value $value");
                        setState(() {
                          defaultValue = value!;
                        });
                      }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: AppLargeText(text: "Hotel Location", size: 20, )),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Enter Location",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: AppLargeText(text: "Room Price/Day", size: 20, )),
              SizedBox(
                height: 8,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Enter Room Price",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: AppLargeText(text: "Room Services", size: 20, )),
              SizedBox(
                height: 8,
              ),
              ListTile(
                onTap: () => onAllClicked(allChecked),
                leading: Checkbox(
                  value: allChecked.value,
                  onChanged: (value) => onAllClicked(allChecked),
                ),
                title: AppLargeText(text: allChecked.title, size: 20,),
              ),
              Divider(),
              ...checkBoxList.map((item)=>
                  ListTile(
                    onTap: () => onItemClicked(item),
                    leading: Checkbox(
                      value: item.value,
                      onChanged: (value) => onItemClicked(item),
                    ),
                    title: AppLargeText(text: item.title, size: 18),
                  ),
              ).toList(),
              DefaultButton(buttonText: "Next", press: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RoomImagesPicker()));
              },),
            ],
          ),
        ),
      ),
    );
  }
  onAllClicked(CheckBoxModel ckbItem){
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      checkBoxList.forEach((element) {
        element.value = newValue;
      });
    });
  }
  onItemClicked(CheckBoxModel ckbItem){
    final newValue = !ckbItem.value;
    setState(() {
      ckbItem.value = newValue;
      if(!newValue){
        allChecked.value = false;
      }
      else{
        final allListChecked = checkBoxList.every((element) => element.value);
        allChecked.value = allListChecked;
      }
    });
  }
}


class CheckBoxModel{
  String title;
  bool value;

  CheckBoxModel({required this.title, this.value = false});
}