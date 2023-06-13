import 'package:flutter/material.dart';

import 'algorithms/aes_algorithm.dart';

class EncryptionHome extends StatefulWidget {
  const EncryptionHome({super.key});

  @override
  _EncryptionHomeState createState() => _EncryptionHomeState();
}

class _EncryptionHomeState extends State<EncryptionHome> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        title: const Text("Encrypt and Decrypt Data",
            style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        elevation: 2,
        child: Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Text',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "EncryptText : ${EncryptData.encrypted != null ? EncryptData.encrypted?.base64 : ''}",
                maxLines: 2,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Text("DecryptText : ${EncryptData.decrypted ?? ''}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black, fontSize: 16)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        EncryptData.encryptAES(_controller.text);
                      });
                    },
                    child: const Text('Encryption'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        EncryptData.decryptAES(_controller.text);
                      });
                    },
                    child: const Text('Decryption'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
