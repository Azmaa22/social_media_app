import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:social_media_app/presentation/components/button.dart';

class UploadDocuments extends StatefulWidget {
  UploadDocuments({Key? key}) : super(key: key);

  @override
  State<UploadDocuments> createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
  final _formKey = GlobalKey<FormBuilderState>();

  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Upload Documents',
        ),
      ),
      body: SingleChildScrollView(
        child: Button(
          title: 'Upload Documents Now',
          onPress: () {
            _isShow = true;
            setState(() {});
          },
        ),
      ),
      bottomSheet: _isShow
          ? BottomSheet(onClosing: () {
              _isShow = false;
              setState(() {});
            }, builder: (
              context,
            ) {
              return Container(
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Button(
                        width: 100,
                        title: 'images',
                        onPress: () {
                          debugPrint('images');
                          setState(() {
                            _isShow = false;
                          });
                        }),
                    Button(width: 100, title: 'Files', onPress: () {}),
                    Button(width: 100, title: 'Video', onPress: () {}),
                  ],
                ),
              );
            })
          : null,
    );
  }
}
