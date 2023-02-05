import 'package:flutter/material.dart';
import 'package:flutter_pratical_challenge/11_pdf_printing/detail_page.dart';

class PdfPrinting extends StatelessWidget {
  const PdfPrinting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invoices = [
      Invoice(
          customer: 'David Thomas',
          address: '123 Fake St\r\nBermuda Triangle',
          items: [
            LineItem(
              'Technical Engagement',
              120,
            ),
            LineItem('Deployment Assistance', 200),
            LineItem('Develop Software Solution', 3020.45),
            LineItem('Produce Documentation', 840.50),
          ],
          name: 'Create and deploy software package'),
      Invoice(
        customer: 'Michael Ambiguous',
        address: '82 Unsure St\r\nBaggle Palace',
        items: [
          LineItem('Professional Advice', 100),
          LineItem('Lunch Bill', 43.55),
          LineItem('Remote Assistance', 50),
        ],
        name: 'Provide remote support after lunch',
      ),
      Invoice(
        customer: 'Marty McDanceFace',
        address: '55 Dancing Parade\r\nDance Place',
        items: [
          LineItem('Program the robots', 400.50),
          LineItem('Find tasteful dance moves for the robots', 80.55),
          LineItem('General quality assurance', 80),
        ],
        name: 'Create software to teach robots how to dance',
      )
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            text: 'My name is ',
            style: const TextStyle(color: Colors.black),
            children: <InlineSpan>[
              WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 100),
                  child: const TextField(),
                ),
              ),
              const TextSpan(
                text: '.',
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          ...invoices.map(
            (e) => ListTile(
              title: Text(e.name),
              subtitle: Text(e.customer),
              trailing: Text('\$${e.totalCost().toStringAsFixed(2)}'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => DetailPage(invoice: e),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// Data model for the invoice
class Invoice {
  final String customer;
  final String address;
  final String name;
  final List<LineItem>? items;
  Invoice({
    required this.customer,
    required this.address,
    required this.items,
    required this.name,
  });
  double totalCost() {
    return items!
        .fold(0, (previousValue, element) => previousValue + element.cost);
  }
}

class LineItem {
  final String description;
  final double cost;

  LineItem(this.description, this.cost);
}

// invoice hard coded
