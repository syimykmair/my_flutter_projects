import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  final VoidCallback onToggleLanguage;

  CalendarPage({super.key, required this.onToggleLanguage});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  final Map<DateTime, List<String>> _events = {};
  

  List<String> _getEvenstForDay(DateTime day) {
    final key = DateTime(day.year, day.month, day.day);
    return _events[key] ?? [];
  }

  void _addEvent() {
    final isRu = Localizations.localeOf(context).languageCode == 'ru';
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(isRu ? 'Новое событие' : 'New Event'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: isRu ? 'Название события' : 'Event name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(isRu ? 'Отмена' : 'Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                final key = DateTime(
                  _selectedDay.year,
                  _selectedDay.month,
                  _selectedDay.day,
                );
                setState(() {
                  _events.putIfAbsent(key, () => []);
                  _events[key]!.add(controller.text);
                });
              }
              Navigator.pop(context);
            },
            child: Text(isRu ? 'Добавить' : 'Add'),
          ),
        ],
      ),
    );
  }

  void _deleteEvent(int index) {
    final key = DateTime(
      _selectedDay.year,
      _selectedDay.month,
      _selectedDay.day,
    );

    setState(() {
      _events[key]!.removeAt(index);

      if (_events[key]!.isEmpty) {
        _events.remove(key);
      }
    });
  }

  void _editEvent(int index) {
    final isRu = Localizations.localeOf(context).languageCode == 'ru';
    final key = DateTime(
      _selectedDay.year,
      _selectedDay.month,
      _selectedDay.day,
    );

    final controller = TextEditingController(text: _events[key]![index]);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(isRu ? 'Редактировать событие' : 'Edit event'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: isRu ? 'Новое название' : 'New name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(isRu ? 'Отмена' : 'Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  _events[key]![index] = controller.text;
                });
              }
              Navigator.pop(context);
            },
            child: Text(isRu ? 'Сохранить' : 'Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isRu = Localizations.localeOf(context).languageCode == 'ru';
    final events = _getEvenstForDay(_selectedDay);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 139, 77, 246),
        title: Text(isRu ? 'Календарь' : 'Calendar'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: widget.onToggleLanguage,
            icon: Icon(Icons.language),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          TableCalendar(
            locale: Localizations.localeOf(context).languageCode,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020),
            lastDay: DateTime.utc(2030),
            selectedDayPredicate: (day) {
              return isSameDay(day, _selectedDay);
            },
            onDaySelected: (selectedDay, focedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focedDay;
              });
            },
            eventLoader: _getEvenstForDay,
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.amberAccent,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(height: 16),

          Text(
            Localizations.localeOf(context).languageCode == 'ru'
                ? 'Выбрано ${_selectedDay.day}.${_selectedDay.month}.${_selectedDay.year}'
                : 'Selected: ${_selectedDay.day}.${_selectedDay.month}.${_selectedDay.year}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 16),

          Expanded(
            child: events.isEmpty
                ? Center(
                    child: Text(
                      Localizations.localeOf(context).languageCode == 'ru'
                          ? 'Событий нет'
                          : 'No Events',
                    ),
                  )
                : ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (_, index) => Card(
                      child: ListTile(
                        leading: Icon(Icons.event),
                        title: Text(events[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _editEvent(index),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: Text(
                                      isRu
                                          ? 'Удалить событие "${events[index]}"?'
                                          : 'Delete event "${events[index]}"?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(isRu ? 'Нет' : 'No'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          _deleteEvent(index);
                                          Navigator.pop(context);
                                        },
                                        child: Text(isRu ? 'Да' : 'Yes'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
