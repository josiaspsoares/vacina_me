import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacina_me/models/database_model/database_model.dart';
import 'package:vacina_me/screens/vaccination_screen/components/vaccination_register_form.dart';

class VaccinationBody extends StatefulWidget {
  @override
  _VaccinationBodyState createState() => _VaccinationBodyState();
}

class _VaccinationBodyState extends State<VaccinationBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<DatabaseModel>(
      builder: (context, database, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: size.width / 3, child: VaccinationRegisterForm()),
            // SizedBox(height: 20.0),
            // StreamBuilder<Results>(
            //     stream: database.read().asStream(),
            //     builder: (context, snapshot) {
            //       return Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           if (snapshot.connectionState == ConnectionState.done)
            //             if (snapshot.data != null)
            //               for (var row in snapshot.data!)
            //                 Container(
            //                   child: SelectableText(
            //                     "Nome: ${row[0]}, CPF: ${row[1]}, Idade: ${row[2]}",
            //                     style: TextStyle(
            //                       fontSize: 18,
            //                       color: kTextColor.withOpacity(0.8),
            //                     ),
            //                   ),
            //                 ),
            //         ],
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}
