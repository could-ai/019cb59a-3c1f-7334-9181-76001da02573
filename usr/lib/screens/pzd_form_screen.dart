import 'package:flutter/material.dart';
import '../widgets/section_header.dart';

class PzdFormScreen extends StatefulWidget {
  const PzdFormScreen({super.key});

  @override
  State<PzdFormScreen> createState() => _PzdFormScreenState();
}

class _PzdFormScreenState extends State<PzdFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Kontrolery pól tekstowych
  final _inwestycjaController = TextEditingController();
  final _lokalizacjaController = TextEditingController();
  final _stanIstniejacyController = TextEditingController();
  final _ukladKomunikacyjnyController = TextEditingController();
  final _ukszaltowanieTerenuController = TextEditingController();
  final _zielenController = TextEditingController();
  final _obszarOddzialywaniaController = TextEditingController();
  
  // Bilans terenu
  final _powDzialkiController = TextEditingController();
  final _powZabudowyController = TextEditingController();
  final _powUtwardzonaController = TextEditingController();
  final _powBiologicznieCzynnaController = TextEditingController();

  @override
  void dispose() {
    _inwestycjaController.dispose();
    _lokalizacjaController.dispose();
    _stanIstniejacyController.dispose();
    _ukladKomunikacyjnyController.dispose();
    _ukszaltowanieTerenuController.dispose();
    _zielenController.dispose();
    _obszarOddzialywaniaController.dispose();
    _powDzialkiController.dispose();
    _powZabudowyController.dispose();
    _powUtwardzonaController.dispose();
    _powBiologicznieCzynnaController.dispose();
    super.dispose();
  }

  void _generateDescription() {
    if (_formKey.currentState!.validate()) {
      final sb = StringBuffer();
      
      sb.writeln('OPIS TECHNICZNY DO PROJEKTU ZAGOSPODAROWANIA DZIAŁKI');
      sb.writeln('===================================================');
      sb.writeln('');
      
      sb.writeln('1. PRZEDMIOT I RODZAJ INWESTYCJI');
      sb.writeln('Przedmiotem inwestycji jest ${_inwestycjaController.text}.');
      sb.writeln('Lokalizacja: ${_lokalizacjaController.text}.');
      sb.writeln('');
      
      sb.writeln('2. STAN ISTNIEJĄCY ZAGOSPODAROWANIA TERENU');
      sb.writeln(_stanIstniejacyController.text);
      sb.writeln('');
      
      sb.writeln('3. PROJEKTOWANE ZAGOSPODAROWANIE TERENU');
      sb.writeln('3.1. Układ komunikacyjny');
      sb.writeln(_ukladKomunikacyjnyController.text);
      sb.writeln('');
      sb.writeln('3.2. Ukształtowanie terenu i układ zieleni');
      sb.writeln(_ukszaltowanieTerenuController.text);
      sb.writeln(_zielenController.text.isNotEmpty ? 'Zieleń: ${_zielenController.text}' : '');
      sb.writeln('');
      
      sb.writeln('4. ZESTAWIENIE POWIERZCHNI (BILANS TERENU)');
      sb.writeln('- Powierzchnia działki: ${_powDzialkiController.text} m2');
      sb.writeln('- Powierzchnia zabudowy: ${_powZabudowyController.text} m2');
      sb.writeln('- Powierzchnia utwardzona: ${_powUtwardzonaController.text} m2');
      sb.writeln('- Powierzchnia biologicznie czynna: ${_powBiologicznieCzynnaController.text} m2');
      sb.writeln('');
      
      sb.writeln('5. OBSZAR ODDZIAŁYWANIA OBIEKTU');
      sb.writeln(_obszarOddzialywaniaController.text);

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
      appBar: AppBar(title: const Text('PZD - Formularz')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SectionHeader(title: '1. Dane ogólne'),
            TextFormField(
              controller: _inwestycjaController,
              decoration: const InputDecoration(
                labelText: 'Przedmiot inwestycji',
                hintText: 'np. Budowa budynku mieszkalnego jednorodzinnego',
              ),
              validator: (value) => value!.isEmpty ? 'Pole wymagane' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _lokalizacjaController,
              decoration: const InputDecoration(
                labelText: 'Lokalizacja (adres, nr działki)',
                hintText: 'np. Warszawa, ul. Polna, dz. nr 123/4',
              ),
            ),
            
            const SectionHeader(title: '2. Stan istniejący'),
            TextFormField(
              controller: _stanIstniejacyController,
              decoration: const InputDecoration(
                labelText: 'Opis stanu istniejącego',
                hintText: 'Opisz co znajduje się obecnie na działce...',
              ),
              maxLines: 4,
            ),

            const SectionHeader(title: '3. Projektowane zagospodarowanie'),
            TextFormField(
              controller: _ukladKomunikacyjnyController,
              decoration: const InputDecoration(
                labelText: 'Układ komunikacyjny',
                hintText: 'Dojścia, dojazdy, miejsca postojowe...',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _ukszaltowanieTerenuController,
              decoration: const InputDecoration(
                labelText: 'Ukształtowanie terenu',
                hintText: 'Niwelacja terenu, rzędne...',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _zielenController,
              decoration: const InputDecoration(
                labelText: 'Zieleń',
                hintText: 'Zieleń wysoka, niska, trawniki...',
              ),
              maxLines: 2,
            ),

            const SectionHeader(title: '4. Bilans terenu [m2]'),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _powDzialkiController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Pow. działki'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _powZabudowyController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Pow. zabudowy'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _powUtwardzonaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Pow. utwardzona'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _powBiologicznieCzynnaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Pow. biol. czynna'),
                  ),
                ),
              ],
            ),

            const SectionHeader(title: '5. Obszar oddziaływania'),
            TextFormField(
              controller: _obszarOddzialywaniaController,
              decoration: const InputDecoration(
                labelText: 'Opis obszaru oddziaływania',
                hintText: 'Zgodnie z art. 3 pkt 20 Prawa budowlanego...',
              ),
              maxLines: 4,
            ),

            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _generateDescription,
              child: const Text('GENERUJ OPIS PZD'),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
