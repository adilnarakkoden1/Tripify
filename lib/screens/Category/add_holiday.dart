import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tripify/color_fonts/color.dart';
import 'package:tripify/db_functioin/trips_db.dart';
import 'package:tripify/global_functions.dart/scaffold_messenger.dart';
import 'package:tripify/global_functions.dart/text_field.dart';
import 'package:tripify/models/home_model.dart';

class HomeHoliday extends StatefulWidget {
  const HomeHoliday({super.key});

  @override
  State<HomeHoliday> createState() => _HomeHolidayState();
}

class _HomeHolidayState extends State<HomeHoliday> {
  DateTime? startDate;
  DateTime? endDate;
  late DateTime time;
  TimeOfDay _timeOfDay = TimeOfDay.now();
  final _sourceController = TextEditingController();
  final _destinatonController = TextEditingController();
  final _typeController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _passengerController = TextEditingController();
  final _timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  List<String> transportModes = [
    'Car',
    'Train',
    'Plane',
    'Ship',
    'Bus',
    'other'
  ];
  String? selectedTransportMode;

  int selected = 0;
  List<String> text = ['Business', ' Holiday '];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: pimaryBrown,
        title: const Text(
          'Trips Planner',
          style: TextStyle(color: Colors.white),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Wrap(
                  spacing: 20.0,
                  children: [
                    ...List.generate(
                      2,
                      (index) => ConstrainedBox(
                        constraints:
                            const BoxConstraints(maxWidth: 100, minWidth: 100),
                        child: ChoiceChip(
                          selectedColor:
                              index == 0 ? Colors.orange : Colors.green,
                          showCheckmark: false,
                          label: Text(text[index]),
                          selected: selected == index,
                          onSelected: (value) {
                            setState(() {
                              if (value) {
                                selected = index;
                              } else {
                                selected = index;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Input(
                  controller: _sourceController,
                  labelText: 'Source',
                  suffixIcon: const Icon(Icons.location_on),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Source';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                //==============================================================================
                Input(
                  controller: _destinatonController,
                  labelText: 'Destination',
                  suffixIcon: const Icon(Icons.location_on),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a Destination';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                //===================================================================================

                Input(
                  controller: _passengerController,
                  labelText: 'Passengers',
                  suffixIcon: const Icon(Icons.group),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter passenger count';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                //===============================================================================
                Wrap(
                  spacing: 20,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Input(
                        controller: _startDateController,
                        labelText: 'Start Date',
                        suffixIcon: IconButton(
                            onPressed: () async {
                              startDate = await _selectedDate(true);
                            },
                            icon: const Icon(Icons.calendar_month)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide date';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: Input(
                        controller: _endDateController,
                        labelText: 'End date',
                        suffixIcon: IconButton(
                            onPressed: () async {
                              endDate = await _selectedDate(false);
                            },
                            icon: const Icon(Icons.calendar_month)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),
                //================================================================================
                // Input(
                //   controller: _typeController,
                //   labelText: 'Mode of transport',
                //   suffixIcon: const Icon(Icons.commute),
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please enter a mode of transport';
                //     }
                //     return null;
                //   },
                // ),

                DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(20),
                  value: selectedTransportMode,
                  onChanged: (newValue) {
                    setState(() {
                      selectedTransportMode = newValue;
                    });
                  },
                  items: transportModes.map((mode) {
                    return DropdownMenuItem<String>(
                      value: mode,
                      child: Text(mode),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: 'Mode of transport',
                    suffixIcon: Icon(Icons.commute),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a mode of transport';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                //===============================================================
                Input(
                    keyboardType: TextInputType.datetime,
                    controller: _timeController,
                    labelText: 'Time',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please provide time';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                        onPressed: () {
                          _selectedTime();
                        },
                        icon: const Icon(Icons.alarm_add))),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await addTrip(
                        HomeModel(
                          source: _sourceController.text.trim(),
                          destination: _destinatonController.text.trim(),
                          type: selectedTransportMode!,
                          startdate: startDate!,
                          enddate: endDate!,
                          passenger: _passengerController.text.trim(),
                          time: DateTime.now(),
                          category: selected == 0 ? 'Business' : 'Holiday',
                          favourite: false,
                        ),
                      );
                      successMessage(
                          context: context, successMessage: 'Trip Planned');
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('SUBMIT'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _selectedDate(bool startdate) async {
    DateTime? _picked = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime(2050));
    if (_picked != null) {
      setState(() {
        if (startdate) {
          _startDateController.text = _picked.toString().split(" ")[0];
        } else {
          _endDateController.text = _picked.toString().split(" ")[0];
        }
      });
      return _picked;
    }
  }

  Future<void> _selectedTime() async {
    TimeOfDay? _picked =
        await showTimePicker(context: context, initialTime: _timeOfDay);
    if (_picked != null) {
      setState(() {
        _timeOfDay = _picked;
        String hour = _timeOfDay.hour.toString();
        String miniute = _timeOfDay.minute.toString();
        _timeController.text = '$hour:$miniute';
      });
    }
  }
}








// _viewMode == 0 ? HomeHoliday() : HomeBusiness()),