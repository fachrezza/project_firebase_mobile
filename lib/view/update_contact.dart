import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pamlfirebase/controller/contact_controller.dart';
import 'package:pamlfirebase/model/contac_model.dart';
import 'package:pamlfirebase/view/contact.dart';

class UpdateContact extends StatefulWidget {
  const UpdateContact(
      {super.key,
      this.id,
      this.beforenama,
      this.beforephone,
      this.beforeemail,
      this.beforeaddress});

  final String? id;
  final String? beforenama;
  final String? beforephone;
  final String? beforeemail;
  final String? beforeaddress;

  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
  var contatcController = ContactController();
  final formkey = GlobalKey<FormState>();

  String? name;
  String? phone;
  String? email;
  String? address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Name'),
                  onSaved: (value) {
                    name = value;
                  },
                  initialValue: widget.beforenama,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Phone'),
                  onSaved: (value) {
                    phone = value;
                  },
                  initialValue: widget.beforephone,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Email'),
                  onSaved: (value) {
                    email = value;
                  },
                  initialValue: widget.beforeemail,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Address'),
                  onSaved: (value) {
                    address = value;
                  },
                  initialValue: widget.beforeaddress,
                ),
                ElevatedButton(
                    child: const Text('Update Contact'),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        ContactModel cm = ContactModel(
                            id: widget.id!,
                            name: name!,
                            phone: phone!,
                            email: email!,
                            address: address!);
                        contatcController.updateContact(cm);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Contact Updated')));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Contact()));
                      }
                    })
              ],
            )),
      ),
    );
  }
}
