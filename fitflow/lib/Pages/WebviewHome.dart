import 'dart:io';
import 'package:fitflow/modelo/api/rotas.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:file_picker/file_picker.dart';

class Webviewhome extends StatefulWidget {
  const Webviewhome({super.key});

  @override
  State<Webviewhome> createState() => _WebviewhomeState();
}

class _WebviewhomeState extends State<Webviewhome> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();

    if (Platform.isAndroid) {
      final androidController =
          _controller.platform as AndroidWebViewController;

      androidController.setOnShowFileSelector((
        FileSelectorParams params,
      ) async {
        try {
          final result = await FilePicker.platform.pickFiles(
            type: FileType.any,
            allowMultiple: params.mode == FileSelectorMode.openMultiple,
          );

          if (result != null && result.files.isNotEmpty) {
            final caminhos = result.files
                .where((file) => file.path != null)
                .map((file) => Uri.file(file.path!).toString())
                .toList();

            return caminhos;
          } else {
            print("Usuário cancelou a seleção.");
          }
        } catch (e) {
          print("Erro no FilePicker: $e");
        }

        return [];
      });
    }

    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Erro ao carregar: ${error.description}')),
            );
          },
        ),
      )
      ..loadRequest(Uri.parse('${Rotas.rota}home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF130D26),
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () => _controller.reload(),
          ),
        ],
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF6E5CFF)),
            ),
        ],
      ),
    );
  }
}
