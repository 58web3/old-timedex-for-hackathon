// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../calendar_event_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimedexCalendar {
  String get id => throw _privateConstructorUsedError;
  String get walletAddress => throw _privateConstructorUsedError;
  List<CalendarEventDetail> get events => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimedexCalendarCopyWith<TimedexCalendar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimedexCalendarCopyWith<$Res> {
  factory $TimedexCalendarCopyWith(
          TimedexCalendar value, $Res Function(TimedexCalendar) then) =
      _$TimedexCalendarCopyWithImpl<$Res, TimedexCalendar>;
  @useResult
  $Res call(
      {String id, String walletAddress, List<CalendarEventDetail> events});
}

/// @nodoc
class _$TimedexCalendarCopyWithImpl<$Res, $Val extends TimedexCalendar>
    implements $TimedexCalendarCopyWith<$Res> {
  _$TimedexCalendarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? walletAddress = null,
    Object? events = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimedexCalendarCopyWith<$Res>
    implements $TimedexCalendarCopyWith<$Res> {
  factory _$$_TimedexCalendarCopyWith(
          _$_TimedexCalendar value, $Res Function(_$_TimedexCalendar) then) =
      __$$_TimedexCalendarCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String walletAddress, List<CalendarEventDetail> events});
}

/// @nodoc
class __$$_TimedexCalendarCopyWithImpl<$Res>
    extends _$TimedexCalendarCopyWithImpl<$Res, _$_TimedexCalendar>
    implements _$$_TimedexCalendarCopyWith<$Res> {
  __$$_TimedexCalendarCopyWithImpl(
      _$_TimedexCalendar _value, $Res Function(_$_TimedexCalendar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? walletAddress = null,
    Object? events = null,
  }) {
    return _then(_$_TimedexCalendar(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      walletAddress: null == walletAddress
          ? _value.walletAddress
          : walletAddress // ignore: cast_nullable_to_non_nullable
              as String,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<CalendarEventDetail>,
    ));
  }
}

/// @nodoc

class _$_TimedexCalendar implements _TimedexCalendar {
  const _$_TimedexCalendar(
      {this.id = '',
      this.walletAddress = '',
      final List<CalendarEventDetail> events = const []})
      : _events = events;

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String walletAddress;
  final List<CalendarEventDetail> _events;
  @override
  @JsonKey()
  List<CalendarEventDetail> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'TimedexCalendar(id: $id, walletAddress: $walletAddress, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimedexCalendar &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.walletAddress, walletAddress) ||
                other.walletAddress == walletAddress) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, walletAddress,
      const DeepCollectionEquality().hash(_events));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimedexCalendarCopyWith<_$_TimedexCalendar> get copyWith =>
      __$$_TimedexCalendarCopyWithImpl<_$_TimedexCalendar>(this, _$identity);
}

abstract class _TimedexCalendar implements TimedexCalendar {
  const factory _TimedexCalendar(
      {final String id,
      final String walletAddress,
      final List<CalendarEventDetail> events}) = _$_TimedexCalendar;

  @override
  String get id;
  @override
  String get walletAddress;
  @override
  List<CalendarEventDetail> get events;
  @override
  @JsonKey(ignore: true)
  _$$_TimedexCalendarCopyWith<_$_TimedexCalendar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalendarEventDetail {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get start => throw _privateConstructorUsedError;
  DateTime? get end => throw _privateConstructorUsedError;
  List<String> get walletAddresses => throw _privateConstructorUsedError;
  EventFilterType get priority => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarEventDetailCopyWith<CalendarEventDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventDetailCopyWith<$Res> {
  factory $CalendarEventDetailCopyWith(
          CalendarEventDetail value, $Res Function(CalendarEventDetail) then) =
      _$CalendarEventDetailCopyWithImpl<$Res, CalendarEventDetail>;
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime? start,
      DateTime? end,
      List<String> walletAddresses,
      EventFilterType priority,
      String description});
}

/// @nodoc
class _$CalendarEventDetailCopyWithImpl<$Res, $Val extends CalendarEventDetail>
    implements $CalendarEventDetailCopyWith<$Res> {
  _$CalendarEventDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? start = freezed,
    Object? end = freezed,
    Object? walletAddresses = null,
    Object? priority = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      walletAddresses: null == walletAddresses
          ? _value.walletAddresses
          : walletAddresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as EventFilterType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarEventDetailCopyWith<$Res>
    implements $CalendarEventDetailCopyWith<$Res> {
  factory _$$_CalendarEventDetailCopyWith(_$_CalendarEventDetail value,
          $Res Function(_$_CalendarEventDetail) then) =
      __$$_CalendarEventDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      DateTime? start,
      DateTime? end,
      List<String> walletAddresses,
      EventFilterType priority,
      String description});
}

/// @nodoc
class __$$_CalendarEventDetailCopyWithImpl<$Res>
    extends _$CalendarEventDetailCopyWithImpl<$Res, _$_CalendarEventDetail>
    implements _$$_CalendarEventDetailCopyWith<$Res> {
  __$$_CalendarEventDetailCopyWithImpl(_$_CalendarEventDetail _value,
      $Res Function(_$_CalendarEventDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? start = freezed,
    Object? end = freezed,
    Object? walletAddresses = null,
    Object? priority = null,
    Object? description = null,
  }) {
    return _then(_$_CalendarEventDetail(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      walletAddresses: null == walletAddresses
          ? _value._walletAddresses
          : walletAddresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as EventFilterType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CalendarEventDetail extends _CalendarEventDetail {
  const _$_CalendarEventDetail(
      {this.id = '',
      this.title = '',
      this.start = null,
      this.end = null,
      final List<String> walletAddresses = const [],
      this.priority = EventFilterType.priority_2,
      this.description = ''})
      : _walletAddresses = walletAddresses,
        super._();

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final DateTime? start;
  @override
  @JsonKey()
  final DateTime? end;
  final List<String> _walletAddresses;
  @override
  @JsonKey()
  List<String> get walletAddresses {
    if (_walletAddresses is EqualUnmodifiableListView) return _walletAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_walletAddresses);
  }

  @override
  @JsonKey()
  final EventFilterType priority;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'CalendarEventDetail(id: $id, title: $title, start: $start, end: $end, walletAddresses: $walletAddresses, priority: $priority, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarEventDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality()
                .equals(other._walletAddresses, _walletAddresses) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      start,
      end,
      const DeepCollectionEquality().hash(_walletAddresses),
      priority,
      description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarEventDetailCopyWith<_$_CalendarEventDetail> get copyWith =>
      __$$_CalendarEventDetailCopyWithImpl<_$_CalendarEventDetail>(
          this, _$identity);
}

abstract class _CalendarEventDetail extends CalendarEventDetail {
  const factory _CalendarEventDetail(
      {final String id,
      final String title,
      final DateTime? start,
      final DateTime? end,
      final List<String> walletAddresses,
      final EventFilterType priority,
      final String description}) = _$_CalendarEventDetail;
  const _CalendarEventDetail._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  DateTime? get start;
  @override
  DateTime? get end;
  @override
  List<String> get walletAddresses;
  @override
  EventFilterType get priority;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarEventDetailCopyWith<_$_CalendarEventDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalendarEvent {
  CalendarEventDetail get detail => throw _privateConstructorUsedError;
  Color get background => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarEventCopyWith<CalendarEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventCopyWith<$Res> {
  factory $CalendarEventCopyWith(
          CalendarEvent value, $Res Function(CalendarEvent) then) =
      _$CalendarEventCopyWithImpl<$Res, CalendarEvent>;
  @useResult
  $Res call({CalendarEventDetail detail, Color background});

  $CalendarEventDetailCopyWith<$Res> get detail;
}

/// @nodoc
class _$CalendarEventCopyWithImpl<$Res, $Val extends CalendarEvent>
    implements $CalendarEventCopyWith<$Res> {
  _$CalendarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
    Object? background = null,
  }) {
    return _then(_value.copyWith(
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as CalendarEventDetail,
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CalendarEventDetailCopyWith<$Res> get detail {
    return $CalendarEventDetailCopyWith<$Res>(_value.detail, (value) {
      return _then(_value.copyWith(detail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CalendarEventCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$$_CalendarEventCopyWith(
          _$_CalendarEvent value, $Res Function(_$_CalendarEvent) then) =
      __$$_CalendarEventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CalendarEventDetail detail, Color background});

  @override
  $CalendarEventDetailCopyWith<$Res> get detail;
}

/// @nodoc
class __$$_CalendarEventCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$_CalendarEvent>
    implements _$$_CalendarEventCopyWith<$Res> {
  __$$_CalendarEventCopyWithImpl(
      _$_CalendarEvent _value, $Res Function(_$_CalendarEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
    Object? background = null,
  }) {
    return _then(_$_CalendarEvent(
      detail: null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as CalendarEventDetail,
      background: null == background
          ? _value.background
          : background // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_CalendarEvent implements _CalendarEvent {
  const _$_CalendarEvent(
      {this.detail = const CalendarEventDetail(),
      this.background = const Color.fromRGBO(0, 0, 0, 0)});

  @override
  @JsonKey()
  final CalendarEventDetail detail;
  @override
  @JsonKey()
  final Color background;

  @override
  String toString() {
    return 'CalendarEvent(detail: $detail, background: $background)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarEvent &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.background, background) ||
                other.background == background));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detail, background);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarEventCopyWith<_$_CalendarEvent> get copyWith =>
      __$$_CalendarEventCopyWithImpl<_$_CalendarEvent>(this, _$identity);
}

abstract class _CalendarEvent implements CalendarEvent {
  const factory _CalendarEvent(
      {final CalendarEventDetail detail,
      final Color background}) = _$_CalendarEvent;

  @override
  CalendarEventDetail get detail;
  @override
  Color get background;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarEventCopyWith<_$_CalendarEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
