import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sos_services/stores/filter_store.dart';
import 'package:sos_services/stores/home_store.dart';

import 'components/orderby_field.dart';
import 'components/price_range_field.dart';
import 'components/vendor_type_field.dart';

class FilterScreen extends StatelessWidget {
  final FilterStore filter = GetIt.I<HomeStore>().clonedFilter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar Busca'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  OrderByField(filter),
                  PriceRangeField(filter),
                  VendorTypeField(filter),
                  Observer(
                    builder: (_) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled))
                                  return Colors.blue[800].withAlpha(120);
                                else
                                  return Colors.blue[800];
                              },
                            ),
                            // backgroundColor: MaterialStateProperty.all<Color>(
                            //     Colors.blue[800]),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                                // side: BorderSide(color: Colors.red)
                              ),
                            ),
                          ),
                          child: Text(
                            'FILTRAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: filter.isFormValid
                              ? () {
                                  filter.save();
                                  Navigator.of(context).pop();
                                }
                              : null,
                        ),
                      );
                    },
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
