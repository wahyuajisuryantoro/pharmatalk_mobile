import 'package:get/get.dart';

class MateriArController extends GetxController {
  // List of available models with their explanations in English
  final List<Map<String, String>> models = [
    {
      'name': 'test_tube',
      'label': 'Test Tube',
      'asset': 'assets/models/test_tube.glb',
      'explanation':
          'Test Tube: Used to hold, mix, or heat small quantities of substances.'
    },
    {
      'name': 'graduated_cylinder',
      'label': 'Graduated Cylinder',
      'asset': 'assets/models/graduated_cylinder.glb',
      'explanation':
          'Graduated Cylinder: Used to measure the volume of liquids with moderate accuracy.'
    },
    {
      'name': 'erlenmeyer_flask',
      'label': 'Erlenmeyer Flask',
      'asset': 'assets/models/erlenmeyer_flask.glb',
      'explanation':
          'Erlenmeyer Flask: Used for mixing solutions with minimal risk of spillage.'
    },
    {
      'name': 'thermometer',
      'label': 'Thermometer',
      'asset': 'assets/models/thermometer.glb',
      'explanation':
          'Thermometer: Used to measure the temperature of substances or reactions.'
    },
    {
      'name': 'petri_dish',
      'label': 'Petri Dish',
      'asset': 'assets/models/petri_dish.glb',
      'explanation':
          'Petri Dish: Used to culture microorganisms or cells.'
    },
    {
      'name': 'microscope',
      'label': 'Microscope',
      'asset': 'assets/models/microscope.glb',
      'explanation':
          'Microscope: Used to view objects too small to be seen by the naked eye.'
    },
    {
      'name': 'syringe',
      'label': 'Syringe',
      'asset': 'assets/models/syringe.glb',
      'explanation':
          'Syringe: Used to inject or withdraw precise amounts of fluids.'
    },
    {
      'name': 'mortar_and_pestle',
      'label': 'Mortar & Pestle',
      'asset': 'assets/models/mortar_and_pestle.glb',
      'explanation':
          'Mortar & Pestle: Used to grind and mix substances.'
    },
  ];

  // Reactive variable to store the selected model
  final selectedModel = ''.obs;

  // Function to change the selected model
  void selectModel(String modelName) {
    selectedModel.value = modelName;
  }
}
