import 'package:flutter/material.dart';

enum MemberInviteStatus {
  accepted(label: 'accepted', color: Colors.greenAccent),
  pending(label: 'pending', color: Color.fromARGB(255, 251, 192, 45)),
  denied(label: 'denied', color: Colors.grey),
  expired(label: 'expired', color: Colors.redAccent),
  unknown(label: '', color: Colors.grey);

  const MemberInviteStatus({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;
}

extension MemberInviteStatusExt on List<MemberInviteStatus> {
  // 文字列からFlavorのインスタンスを作成
  MemberInviteStatus from(String value) => firstWhere(
        (e) => e.label == value,
        orElse: () => throw AssertionError('$value is not Flavor'),
      );
}
