import 'package:flutter/material.dart';
import 'package:flutter_pratical_challenge/11_pdf_printing/pdf_printing.dart';
import 'package:flutter_pratical_challenge/11_pdf_printing/pdfexport/pdf_preview_page.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.invoice}) : super(key: key);
  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PdfPreviewPage(invoice: invoice),
            ),
          );
          // rootBundle.
        },
        child: const Icon(Icons.picture_as_pdf),
      ),
      appBar: AppBar(
        title: Text(invoice.name),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Customer',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      invoice.customer,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              child: Column(
                children: [
                  Text(
                    'Invoice Items',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ...invoice.items.map(
                    (e) => ListTile(
                      title: Text(e.description),
                      trailing: Text(
                        e.cost.toStringAsFixed(2),
                      ),
                    ),
                  ),
                  DefaultTextStyle.merge(
                    style: Theme.of(context).textTheme.headlineMedium,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("Total"),
                        Text(
                          invoice.totalCost().toStringAsFixed(2),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
