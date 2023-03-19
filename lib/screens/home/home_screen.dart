import 'package:flutter/material.dart';
import 'package:gdg_peshawar/screens/add_participant/add_participant_screen.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) => ModalProgressHUD(
            inAsyncCall: model.isloading,
            child: Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 30, right: 10),
                child: FloatingActionButton(
                  onPressed: () async {
                    await Get.to(() => AddParticipantScreen());
                    model.init();
                  },
                  child: const Icon(Icons.add),
                ),
              ),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: const Text(
                  'GDG Peshawar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              body: ListView.builder(
                  itemCount: model.participants.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.participants[index].name ?? 'name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                model.participants[index].email ?? 'email',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Text(
                                model.participants[index].bio ?? 'bio',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),

                              // delete button
                              _deleteButton(model, index),
                            ],
                          ),
                        ),
                      ),
                    );
                    // card that displays all participants of the event of GDG Peshawar name, email, and bio
                  }),
            ),
          ),
        ));
  }

  Row _deleteButton(HomeViewModel model, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              model.deleteParticipant(model.participants[index].sId!);
            },
            icon: Icon(
              Icons.delete,
              color: Color.fromARGB(255, 204, 109, 102),
            )),
      ],
    );
  }
}
