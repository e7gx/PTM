import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Widget buildTextField(
    TextEditingController controller, String label, String hint,
    {int maxLines1 = 1}) {
  return TextField(
    cursorColor: Colors.cyan,
    controller: controller,
    maxLines: maxLines1,
    decoration: InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey[200],
      labelText: label,
      hintText: hint,
      labelStyle: TextStyle(color: Colors.cyan[400]),
      hintStyle: TextStyle(color: Colors.grey[400]),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.cyan[400]!, width: 3.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.cyan[400]!, width: 2.0),
      ),
    ),
  );
}

class Style extends StatefulWidget {
  const Style({super.key});

  @override
  StyleState createState() => StyleState();
}

class StyleState extends State<Style> {
  @override
  Widget build(BuildContext context) {
    String selectedClient = '0';

    return Column(
      children: [
        StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('User_Reports').snapshots(),
          builder: (context, snapshot) {
            List<DropdownMenuItem> clientItem = [];
            if (!snapshot.hasData) {
              const CircularProgressIndicator(color: Colors.cyan);
            } else {
              final clients = snapshot.data?.docs.reversed.toList();
              clientItem.add(
                const DropdownMenuItem(
                  value: '0',
                  child: Text('Select Client'),
                ),
              );
              for (var client in clients!) {
                clientItem.add(
                  DropdownMenuItem(
                    value: client.id,
                    child: Text(
                      client['loction'],
                    ),
                  ),
                );
              }
            }
            return DropdownButton(
              items: clientItem,
              onChanged: (clientValue) {
                setState(() {
                  selectedClient = clientValue;
                });
              },
              value: selectedClient,
              isExpanded: false,
            );
          },
        )
      ],
    );
  }
}
