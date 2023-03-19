//

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'add_participantview_model.dart';

class AddParticipantScreen extends StatelessWidget {
  const AddParticipantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddParticipantViewModel(),
      child: Consumer<AddParticipantViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.isloading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Add Participant',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
                child: Form(
              key: model.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 20.0),
                child: Column(
                  children: [
                    // ttiel Add Participant
                    SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        model.participantBody.name = value?.trim();
                      },
                    ),
                    SizedBox(height: 16.0),

                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: (value) {
                        // email validation
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        } else if (!value.contains('@')) {
                          return 'Please enter valid email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        model.participantBody.email = value?.trim();
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      minLines: 3,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: 'Bio',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter bio';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        model.participantBody.bio = value?.trim();
                      },
                    ),
                    SizedBox(height: 30.0),

                    ElevatedButton(
                      onPressed: () {
                        if (model.formKey.currentState!.validate()) {
                          model.formKey.currentState!.save();
                          model.addParticipant();
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text('Add Participant',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
