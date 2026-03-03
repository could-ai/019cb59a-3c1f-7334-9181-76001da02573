import 'package:flutter/material.dart';
import '../widgets/section_header.dart';

class PabFormScreen extends StatefulWidget {
  const PabFormScreen({super.key});

  @override
  State<PabFormScreen> createState() => _PabFormScreenState();
}

class _PabFormScreenState extends State<PabFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Kontrolery
  final _funkcjaController = TextEditingController();
  final _formaController = TextEditingController();
  final _dostepnoscController = TextEditingController();
  
  // Parametry
  final _powUzytkowaController = TextEditingController();
  final _powCalkowitaController = TextEditingController();
  final _kubaturaController = TextEditingController();
  final _wysokoscController = TextEditingController();
  final _liczbaKondygnacjiController = TextEditingController();
  
  // Konstrukcja i materiały
  final _konstrukcjaController = TextEditingController();
  final _wykonczenieZewController = TextEditingController();
  final _wykonczenieWewController = TextEditingController();
  
  // Instalacje i energia
  final _ogrzewanieController = TextEditingController();
  final _wentylacjaController = TextEditingController();
  final _charakterystykaEnergetycznaController = TextEditingController();

  @override
  void dispose() {
    _funkcjaController.dispose();
    _formaController.dispose();
    _dostepnoscController.dispose();
    _powUzytkowaController.dispose();
    _powCalkowitaController.dispose();
    _kubaturaController.dispose();
    _wysokoscController.dispose();
    _liczbaKondygnacjiController.dispose();
    _konstrukcjaController.dispose();
    _wykonczenieZewController.dispose();
    _wykonczenieWewController.dispose();
    _ogrzewanieController.dispose();
    _wentylacjaController.dispose();
    _charakterystykaEnergetycznaController.dispose();
    super.dispose();
  }

  void _generateDescription() {
    if (_formKey.currentState!.validate()) {
      final sb = StringBuffer();
      
      sb.writeln('OPIS TECHNICZNY DO PROJEKTU ARCHITEKTONICZNO-BUDOWLANEGO');
      sb.writeln('========================================================');
      sb.writeln('');
      
      sb.writeln('1. PRZEZNACZENIE I PROGRAM UŻYTKOWY');
      sb.writeln(_funkcjaController.text);
      sb.writeln('');
      
      sb.writeln('2. FORMA ARCHITEKTONICZNA');
      sb.writeln(_formaController.text);
      sb.writeln('');

      sb.writeln('3. DOSTĘPNOŚĆ DLA OSÓB NIEPEŁNOSPRAWNYCH');
      sb.writeln(_dostepnoscController.text);
      sb.writeln('');
      
      sb.writeln('4. CHARAKTERYSTYCZNE PARAMETRY TECHNICZNE');
      sb.writeln('- Powierzchnia użytkowa: ${_powUzytkowaController.text} m2');
      sb.writeln('- Powierzchnia całkowita: ${_powCalkowitaController.text} m2');
      sb.writeln('- Kubatura: ${_kubaturaController.text} m3');
      sb.writeln('- Wysokość budynku: ${_wysokoscController.text} m');
      sb.writeln('- Liczba kondygnacji: ${_liczbaKondygnacjiController.text}');
      sb.writeln('');
      
      sb.writeln('5. ROZWIĄZANIA KONSTRUKCYJNO-MATERIAŁOWE');
      sb.writeln('Konstrukcja: ${_konstrukcjaController.text}');
      sb.writeln('Wykończenie zewnętrzne: ${_wykonczenieZewController.text}');
      sb.writeln('Wykończenie wewnętrzne: ${_wykonczenieWewController.text}');
      sb.writeln('');
      
      sb.writeln('6. ROZWIĄZANIA INSTALACYJNE I ENERGETYCZNE');
      sb.writeln('Źródło ciepła: ${_ogrzewanieController.text}');
      sb.writeln('Wentylacja: ${_wentylacjaController.text}');
      sb.writeln('Charakterystyka energetyczna: ${_charakterystykaEnergetycznaController.text}');

      Navigator.pushNamed(
        context, 
        '/result', 
        arguments: sb.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PAB - Formularz')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SectionHeader(title: '1. Funkcja i forma'),
            TextFormField(
              controller: _funkcjaController,
              decoration: const InputDecoration(
                labelText: 'Przeznaczenie i program użytkowy',
                hintText: 'Opis funkcji budynku, pomieszczeń...',
              ),
              maxLines: 3,
              validator: (value) => value!.isEmpty ? 'Pole wymagane' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _formaController,
              decoration: const InputDecoration(
                labelText: 'Forma architektoniczna',
                hintText: 'Bryła, dach, elewacje...',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _dostepnoscController,
              decoration: const InputDecoration(
                labelText: 'Dostępność dla niepełnosprawnych',
                hintText: 'Wejścia bezprogowe, winda, toaleta...',
              ),
              maxLines: 2,
            ),

            const SectionHeader(title: '2. Parametry techniczne'),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _powUzytkowaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Pow. użytkowa [m2]'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _powCalkowitaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Pow. całkowita [m2]'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _kubaturaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Kubatura [m3]'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _wysokoscController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Wysokość [m]'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _liczbaKondygnacjiController,
              decoration: const InputDecoration(labelText: 'Liczba kondygnacji (nadziemne/podziemne)'),
            ),

            const SectionHeader(title: '3. Konstrukcja i materiały'),
            TextFormField(
              controller: _konstrukcjaController,
              decoration: const InputDecoration(
                labelText: 'Układ konstrukcyjny',
                hintText: 'Fundamenty, ściany, stropy, dach...',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _wykonczenieZewController,
              decoration: const InputDecoration(
                labelText: 'Wykończenie zewnętrzne',
                hintText: 'Tynki, okładziny, stolarka...',
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _wykonczenieWewController,
              decoration: const InputDecoration(
                labelText: 'Wykończenie wewnętrzne',
                hintText: 'Posadzki, tynki...',
              ),
              maxLines: 2,
            ),

            const SectionHeader(title: '4. Instalacje i energia'),
            TextFormField(
              controller: _ogrzewanieController,
              decoration: const InputDecoration(
                labelText: 'Źródło ciepła',
                hintText: 'Kocioł gazowy, pompa ciepła...',
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _wentylacjaController,
              decoration: const InputDecoration(
                labelText: 'Wentylacja',
                hintText: 'Grawitacyjna, mechaniczna z odzyskiem...',
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _charakterystykaEnergetycznaController,
              decoration: const InputDecoration(
                labelText: 'Charakterystyka energetyczna',
                hintText: 'EP, izolacyjność przegród...',
              ),
              maxLines: 2,
            ),

            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _generateDescription,
              child: const Text('GENERUJ OPIS PAB'),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
