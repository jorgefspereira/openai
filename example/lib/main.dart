import 'package:dart_openai/dart_openai.dart';

import 'env/env.dart';

import 'package:http/http.dart' as http;

Future<void> main() async {
  // Set the OpenAI API key from the .env file.
  OpenAI.apiKey = Env.apiKey;
  OpenAI.httpClient = http.Client();

  // Start using!
  final completion = await OpenAI.instance.completion.create(
    model: "text-davinci-003",
    prompt: "Dart is",
  );

  // Printing the output to the console
  print(completion.choices[0].text);

  // Generate an image from a prompt.
  final image = await OpenAI.instance.image.create(
    prompt: "dog",
    n: 1,
  );

  // Printing the output to the console.
  print(image.data.first.url);

  // create a moderation
  final moderation = await OpenAI.instance.moderation.create(
    input: "I will cut your head off",
  );

  // Printing moderation
  print(moderation.results.first.categories.violence);
}
