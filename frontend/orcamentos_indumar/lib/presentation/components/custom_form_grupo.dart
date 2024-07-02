import 'package:flutter/material.dart';


class CustomFormGrupo extends StatefulWidget {
 final GlobalKey<FormState> formKey;
 final TextEditingController descricaoEditingController;

  const CustomFormGrupo({super.key, required this.formKey,  required this.descricaoEditingController});

  @override
  State<CustomFormGrupo> createState() => _CustomFormGrupoState();
}

class _CustomFormGrupoState extends State<CustomFormGrupo> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: widget.descricaoEditingController,
              validator: (value) => ((value == null) || (value.isEmpty)) ? 'Informe uma descrição!' : null,      
              autovalidateMode: AutovalidateMode.onUserInteraction,                     
              decoration: const InputDecoration(
                hintText: 'Informe aqui a descrição...',
                labelText: 'Descrição'
                ),
            )
          ],
        ));
  }
}
