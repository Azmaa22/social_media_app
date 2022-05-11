import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:social_media_app/presentation/components/components.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Form'),
      ),
      body: FormBuilder(
        key: _formKey,
        autoFocusOnValidationFailure: true,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Input(
                  label: 'age',
                  placeholder: 'please enter age',
                  icon: 'assets/svgs/lock-svgrepo-com.svg',
                  name: 'age',
                  onChange: (value) {
                    debugPrint('age value $value');
                  },
                  onValidate: (value) {
                    FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'you should write value',
                      ),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.max(70),
                    ]);
                  }),
              Row(
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      color: Theme.of(context).colorScheme.secondary,
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        print(_formKey.currentState);
                        _formKey.currentState?.save();
                        if (_formKey.currentState!.validate()) {
                          print(
                              'value of state ${_formKey.currentState!.value}');
                        } else {
                          print("validation failed");
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: MaterialButton(
                      color: Theme.of(context).colorScheme.secondary,
                      child: const Text(
                        "Reset",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
