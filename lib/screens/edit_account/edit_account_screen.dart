import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sos_services/stores/edit_account_store.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EditAccountScreen extends StatelessWidget {
  EditAccountScreen();

  final EditAccountStore store = EditAccountStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Conta'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LayoutBuilder(
                    builder: (_, constraints) {
                      return ToggleSwitch(
                        minWidth: constraints.biggest.width / 2.01,
                        labels: ['Particular', 'Profissional'],
                        cornerRadius: 20,
                        activeBgColor: Colors.green,
                        inactiveBgColor: Colors.grey,
                        activeFgColor: Colors.white,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: 0,
                        onToggle: store.setUserType,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Observer(builder: (_) {
                    return TextFormField(
                      decoration: InputDecoration(
                        errorText: store.nameError,
                        border: OutlineInputBorder(),
                        isDense: true,
                        labelText: 'Nome*',
                      ),
                      onChanged: store.setName,
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(
                    builder: (_) {
                      return TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          errorText: store.phoneError,
                          isDense: true,
                          labelText: 'Telefone*',
                        ),
                        onChanged: store.setPhone,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      labelText: 'Nova Senha',
                    ),
                    obscureText: true,
                    onChanged: store.setPass1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Observer(
                    builder: (_) {
                      return TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          labelText: 'Confirmar Nova Senha',
                          errorText: store.passError,
                        ),
                        onChanged: store.setPass2,
                        obscureText: true,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Observer(builder: (_) {
                    return SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              return Colors.blue[800];
                            },
                          ),
                          // backgroundColor: MaterialStateProperty.all<Color>(
                          //     Colors.blue[800]),
                          elevation: MaterialStateProperty.all(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              // side: BorderSide(color: Colors.red)
                            ),
                          ),
                        ),
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: store.isFormValid ? () {} : null,
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            return Colors.red;
                          },
                        ),
                        // backgroundColor: MaterialStateProperty.all<Color>(
                        //     Colors.blue[800]),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            // side: BorderSide(color: Colors.red)
                          ),
                        ),
                      ),
                      child: Text(
                        'Sair',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
