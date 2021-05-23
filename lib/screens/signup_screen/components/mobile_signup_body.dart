import 'package:flutter/material.dart';
import 'package:vacina_me/core/app_colors.dart';
import 'package:vacina_me/screens/common_components/custom_fitted_button.dart';
import 'package:vacina_me/screens/signup_screen/components/signup_form.dart';
import 'package:vacina_me/screens/signup_screen/components/signup_texts.dart';

class MobileSignupBody extends StatefulWidget {
  const MobileSignupBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _MobileSignupBodyState createState() => _MobileSignupBodyState();
}

class _MobileSignupBodyState extends State<MobileSignupBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                child: Image.asset(
                    'assets/images/signup_screen/signup_background.png'),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(80.0)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: widget.size.width / 10),
                child: Column(
                  children: [
                    Text(
                      signupTitle.toUpperCase(),
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: widget.size.width >= 500 ? 40 : 25,
                          ),
                    ),
                    CustomFittedButton(
                      text: 'CONSULTE',
                      color: AppColors.accentColor,
                      onTap: () {
                        Navigator.of(context).pushNamed('/vacinacao/consulta');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: widget.size.width / 14, vertical: 30),
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    SignupForm(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
