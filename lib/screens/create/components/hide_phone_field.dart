import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sos_services/stores/create_store.dart';

class HidePhoneField extends StatelessWidget {
  HidePhoneField(this.createStore);
  final CreateStore createStore;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Observer(builder: (_) {
            return Checkbox(
                value: createStore.hidePhone,
                onChanged: createStore.setHidePhone);
          }),
          Expanded(
            child: Text('Ocutar o meu telefone neste anúncio.'),
          )
        ],
      ),
    );
  }
}
