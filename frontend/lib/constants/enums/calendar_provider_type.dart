enum CalendarProviderType {
  timedex(label: 'timedex'),
   icalendar(label: 'icalendar'),
  google(label: 'google'),
  outlook(label: 'outlook');

  const CalendarProviderType({required this.label});
  final String label;

  bool get isIcal => this == CalendarProviderType.icalendar;
}
