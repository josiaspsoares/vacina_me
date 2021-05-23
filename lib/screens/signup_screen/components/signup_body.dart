import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vacina_me/models/database_model/database_model.dart';
import 'package:vacina_me/screens/signup_screen/components/signup_form.dart';

class SignupBody extends StatefulWidget {
  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<DatabaseModel>(
      builder: (context, database, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: size.width / 3, child: SignupForm()),
            SizedBox(height: 20.0),
            // StreamBuilder<Results>(
            //     stream: database.read().asStream(),
            //     builder: (context, snapshot) {
            //       return Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           if (snapshot.connectionState == ConnectionState.done)
            //             if (snapshot.data != null)
            //               for (var row in snapshot.data!)
            //                 VaccinationDataCard(name: row[0], age: row[2])
            //         ],
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}
