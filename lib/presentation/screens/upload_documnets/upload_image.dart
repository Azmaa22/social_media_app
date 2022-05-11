import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:social_media_app/presentation/components/components.dart';

class UploadIMage extends StatelessWidget {
  UploadIMage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            FormBuilderFilePicker(
              name: "attachments",
              decoration: const InputDecoration(
                labelText: "Attachments",
              ),
              maxFiles: null,
              previewImages: true,
              onChanged: (val) => print('on changing $val'),
              selector: Row(
                children: const [
                  Icon(Icons.file_upload),
                  Text('Upload'),
                ],
              ),
              onFileLoading: (val) {
                print('file uploading $val');
              },
            ),
            const SizedBox(height: 15),
            Button(
                title: 'Upload Now',
                width: 150,
                onPress: () {
                  debugPrint('pressed');
                  if (_formKey.currentState!.saveAndValidate()) {
                    print(_formKey.currentState!.value);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
