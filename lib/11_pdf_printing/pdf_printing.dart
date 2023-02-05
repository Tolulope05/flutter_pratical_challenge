import 'package:flutter/material.dart';

class PdfPrinting extends StatelessWidget {
  const PdfPrinting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  )),
              const TextSpan(
                text: '.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
