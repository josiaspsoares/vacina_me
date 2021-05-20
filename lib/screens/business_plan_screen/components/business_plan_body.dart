import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class BusinessPlanBody extends StatefulWidget {
  @override
  _BusinessPlanBodyState createState() => _BusinessPlanBodyState();
}

class _BusinessPlanBodyState extends State<BusinessPlanBody> {
  late final PdfController _pdfController;

  @override
  void initState() {
    _pdfController = PdfController(
    document: PdfDocument.openAsset('assets/pdf/business_plan.pdf'),
  );
    super.initState();
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  
  Widget pdfView() => PdfView(
        controller: _pdfController,
        scrollDirection: Axis.vertical,
        pageLoader: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                alignment: Alignment.topCenter,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return pdfView();
  }
}
