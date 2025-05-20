import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const name = 'uicontrols-screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _UiControlsView()
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bus, train, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Activar modo desarrollador'),
          value: isDeveloper, 
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: const Text('Transportation'),
          subtitle: Text('Viajar en $selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By car'),
              subtitle: const Text('Viajar en coche'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('By boat'),
              subtitle: const Text('Viajar en barco'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('By train'),
              subtitle: const Text('Viajar en tren'),
              value: Transportation.train,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.train;
              }),
            ),
            RadioListTile(
              title: const Text('By plane'),
              subtitle: const Text('Viajar en avión'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),

          ],
        ),
        CheckboxListTile(
          value: wantsBreakfast,
          title: const Text('Breakfast'),
          subtitle: const Text('¿Quieres desayuno?'),
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          value: wantsLunch,
          title: const Text('Lunch'),
          subtitle: const Text('¿Quieres almuerzo?'),
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          value: wantsDinner,
          title: const Text('Dinner'),
          subtitle: const Text('¿Quieres cena?'),
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
        
      ],
    );
  }
}