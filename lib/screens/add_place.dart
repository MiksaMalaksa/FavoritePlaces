import 'package:favorite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:favorite_places/providers/user_places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _onSubmitted() {
    final text = _controller.text;
    if (text.isEmpty || text.trim().isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Place cannot have an empty title"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.white));
      setState(() {
        _controller.clear();
      });
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a place"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: "Place title"),
            maxLength: 50,
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          const ImageInput(),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton.icon(
            onPressed: _onSubmitted,
            icon: const Icon(Icons.add),
            label: const Text("Submit"),
          ),
        ]),
      ),
    );
  }
}
