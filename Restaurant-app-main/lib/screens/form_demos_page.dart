import 'package:flutter/material.dart';
import 'username_form_page.dart';
import 'login_form_page.dart';
import 'mixed_inputs_form_page.dart';
import 'registration_form_page.dart';
import 'role_dropdown_form_page.dart';
import 'datetime_picker_form_page.dart';
import 'controller_demo_page.dart';
import 'save_local_list_form_page.dart';

class FormDemosPage extends StatelessWidget {
  const FormDemosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final demos = <_DemoItem>[
      _DemoItem('Username', Icons.person_outline, const UsernameFormPage()),
      _DemoItem('Login + Validation', Icons.login, const LoginFormPage()),
      _DemoItem('Mixed Inputs', Icons.tune, const MixedInputsFormPage()),
      _DemoItem('Registration', Icons.person_add_alt_1, const RegistrationFormPage()),
      _DemoItem('Role Dropdown', Icons.admin_panel_settings_outlined, const RoleDropdownFormPage()),
      _DemoItem('Date & Time', Icons.event, const DateTimePickerFormPage()),
      _DemoItem('Controller Demo', Icons.text_fields, const ControllerDemoPage()),
      _DemoItem('Save to List', Icons.list_alt, const SaveLocalListFormPage()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Form Demos')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
        ),
        itemCount: demos.length,
        itemBuilder: (_, i) {
          final d = demos[i];
          return InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => d.page)),
            borderRadius: BorderRadius.circular(16),
            child: Ink(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(d.icon, color: Theme.of(context).colorScheme.primary),
                    ),
                    const Spacer(),
                    Text(d.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                    const SizedBox(height: 2),
                    const Text('Open example'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DemoItem {
  final String title;
  final IconData icon;
  final Widget page;
  const _DemoItem(this.title, this.icon, this.page);
}


