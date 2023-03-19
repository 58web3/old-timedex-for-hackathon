import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:time_dex/constants/enums.dart';
import 'package:time_dex/global/models.dart';

final demoStateProvider = StateProvider<int>((ref) => 0);

const bobAccount = AccountState(
  profileUrl:
      'https://i.seadn.io/gae/pKUJxPbiNCfrBVb3A1J9Yk-ZjouE66s0ckypwda5LZ-a1vbcpdoYJ3BazZui3IqsncK9-LNfBHU-cI5r5183muwHhTuZ-30r4Ch4HzY?auto=format&w=1000',
  accountName: 'Bob',
  email: 'bob@gmail.com',
  walletAddress: '0x12Fc56c6Fab3674eCCBF5698b4a349129bbB3FF1',
  background: Color(0xff12Fc56),
);

const bobTeamIds = [
  'dcsdvsdfv-adgjwdfbbmn-8ibrewjaberrui',
];

const bobAddTeam = 'aadfbadfb-adgjwasbmn-459ijabrui';

const bobTeamMembers = {
  'aadfbadfb-adgjwasbmn-459ijabrui': [
    AccountState(
      profileUrl:
          'https://i.seadn.io/gcs/files/71e4b77a94c8e1b5f22e172fd43548b8.gif?auto=format&w=1000',
      accountName: 'Alice',
      email: 'alice@gmail.com',
      walletAddress: '0xb3676c6Fa4e34912698b4a129bbCCBF5Fc5B3FF1',
      background: Color.fromARGB(255, 249, 106, 96),
    ),
    AccountState(
      profileUrl:
          'https://i.seadn.io/gae/DbZc2NqjtDz7hVAl3XoWlKdAD8JR0JEmnnV6faKtTJ7S33y3iX9CFQMGA4dCZY9IpfjV8UeIUS9nvuJWZ3Ll_tvx5595INHdvdye8g?auto=format&w=1000',
      accountName: 'Carol',
      email: 'euleca@gmail.com',
      walletAddress: '0xed2ab4948bA6A909a7751DEc4F34f303eB8c7236',
      background: Color(0xffed2ab4),
    ),
    AccountState(
      profileUrl:
          'https://i.seadn.io/gcs/files/fae40fd7d0d2d620605c8a39e100e47d.jpg?auto=format&w=1000',
      accountName: 'fujito',
      email: 'fujito.kenji@gmail.com',
      walletAddress: '0x5210F490F082795289aEC133d954cB6FA600c4E3',
      background: Color(0xff5210F4),
    ),
    AccountState(
      profileUrl:
          'https://i.seadn.io/gcs/files/30df97e91b0bd59f16186401e9af239a.jpg?auto=format&w=1000',
      accountName: 'govern',
      email: 'govern.fail@gmail.com',
      walletAddress: '0x0eEFfea78e89A75F6BAF1d345F16B185EE75a815',
      background: Color(0xff0eEFfe),
    ),
  ],
  'dcsdvsdfv-adgjwdfbbmn-8ibrewjaberrui': [
    AccountState(
      profileUrl:
          'https://i.seadn.io/gcs/files/fae40fd7d0d2d620605c8a39e100e47d.jpg?auto=format&w=1000',
      accountName: 'fujito',
      email: 'fujito.kenji@gmail.com',
      walletAddress: '0x5210F490F082795289aEC133d954cB6FA600c4E3',
      background: Color(0xff5210F4),
    ),
    AccountState(
      profileUrl:
          'https://i.seadn.io/gae/DbZc2NqjtDz7hVAl3XoWlKdAD8JR0JEmnnV6faKtTJ7S33y3iX9CFQMGA4dCZY9IpfjV8UeIUS9nvuJWZ3Ll_tvx5595INHdvdye8g?auto=format&w=1000',
      accountName: 'Euleca',
      email: 'euleca@gmail.com',
      walletAddress: '0xed2ab4948bA6A909a7751DEc4F34f303eB8c7236',
      background: Color(0xffed2ab4),
    ),
  ]
};

final bobPersonalCalendar = [
  CalendarEventDetail(
    id: 'alicexxx1',
    title: 'MTG',
    start: DateTime(2023, 3, 19, 9, 30),
    end: DateTime(2023, 3, 19, 10, 30),
    walletAddresses: [],
    priority: EventFilterType.priority_1,
    description: 'description',
  ),
  CalendarEventDetail(
    id: 'alicexxx2',
    title: 'Lunch',
    start: DateTime(2023, 3, 19, 11, 30),
    end: DateTime(2023, 3, 13),
    walletAddresses: [],
    priority: EventFilterType.priority_4,
    description: 'description third',
  ),
  CalendarEventDetail(
    id: 'alicexxx3',
    title: 'MTG',
    start: DateTime(2023, 3, 19, 12),
    end: DateTime(2023, 3, 19, 13, 30),
    walletAddresses: [],
    priority: EventFilterType.priority_1,
    description: 'description second',
  ),
  CalendarEventDetail(
    id: 'alicexxx4',
    title: 'Moving',
    start: DateTime(2023, 3, 19, 13, 30),
    end: DateTime(2023, 3, 19, 14, 30),
    walletAddresses: [],
    priority: EventFilterType.priority_2,
    description: 'description third',
  ),
  CalendarEventDetail(
    id: 'alicexxx5',
    title: 'Walking',
    start: DateTime(2023, 3, 19, 18, 15),
    end: DateTime(2023, 3, 20, 15),
    walletAddresses: [],
    priority: EventFilterType.priority_4,
    description: 'description second',
  ),
  CalendarEventDetail(
    id: 'alicexxx6',
    title: 'MTG',
    start: DateTime(2023, 3, 19, 14, 30),
    end: DateTime(2023, 3, 19, 16),
    walletAddresses: [],
    priority: EventFilterType.priority_4,
    description: 'description third',
  ),
  CalendarEventDetail(
    id: 'alicexxx7',
    title: 'Dinner',
    start: DateTime(2023, 3, 19, 19, 30),
    end: DateTime(2023, 3, 19, 21, 30),
    walletAddresses: [],
    priority: EventFilterType.priority_4,
    description: 'description third',
  ),
  CalendarEventDetail(
    id: 'alicexxx8',
    title: 'Work@Office',
    start: DateTime(2023, 3, 20, 7),
    end: DateTime(2023, 3, 20, 18),
    walletAddresses: [],
    priority: EventFilterType.priority_1,
    description: 'description',
  ),
  CalendarEventDetail(
    id: 'alicexxx9',
    title: 'Work@Office',
    start: DateTime(2023, 3, 21, 9),
    end: DateTime(2023, 3, 21, 20),
    walletAddresses: [],
    priority: EventFilterType.priority_1,
    description: 'description',
  ),
  CalendarEventDetail(
    id: 'alicexxx10',
    title: 'Work@Office',
    start: DateTime(2023, 3, 22, 9),
    end: DateTime(2023, 3, 22, 20),
    walletAddresses: [],
    priority: EventFilterType.priority_1,
    description: 'description',
  ),
  CalendarEventDetail(
    id: 'alicexxx11',
    title: 'Work@Office',
    start: DateTime(2023, 3, 23, 9),
    end: DateTime(2023, 3, 23, 20),
    walletAddresses: [],
    priority: EventFilterType.priority_1,
    description: 'description',
  ),
  CalendarEventDetail(
    id: 'alicexxx12',
    title: 'Work@Office',
    start: DateTime(2023, 3, 24, 9),
    end: DateTime(2023, 3, 24, 20),
    walletAddresses: [],
    priority: EventFilterType.priority_1,
    description: 'description',
  ),
  CalendarEventDetail(
    id: 'alicexxx13',
    title: 'Lunch',
    start: DateTime(2023, 3, 25, 12),
    end: DateTime(2023, 3, 25, 15),
    walletAddresses: [],
    priority: EventFilterType.priority_3,
    description: 'description',
  ),
  CalendarEventDetail(
    id: 'alicexxx14',
    title: 'Theater',
    start: DateTime(2023, 3, 25, 14, 30),
    end: DateTime(2023, 3, 25, 17),
    walletAddresses: [],
    priority: EventFilterType.priority_3,
    description: 'description',
  ),
  CalendarEventDetail(
    id: 'alicexxx15',
    title: 'Mint Event',
    start: DateTime(2023, 3, 25, 16, 30),
    end: DateTime(2023, 3, 25, 22),
    walletAddresses: [],
    priority: EventFilterType.priority_5,
    description: 'description',
  ),
];

final bobJoiningTeams = [
  TeamDetail(
    teamId: 'aadfbadfb-adgjwasbmn-459ijabrui',
    teamName: 'ASTAR developers',
    teamDescription: 'ASTAR developers',
    teamMembers: bobTeamMembers['aadfbadfb-adgjwasbmn-459ijabrui']!
        .map(
          (account) => TeamMember(
            walletAddress: account.walletAddress,
            email: account.email,
            status: 'approved',
          ),
        )
        .toList(),
  ),
  TeamDetail(
    teamId: 'dcsdvsdfv-adgjwdfbbmn-8ibrewjaberrui',
    teamName: '58 DAO party',
    teamDescription: '',
    teamMembers: bobTeamMembers['dcsdvsdfv-adgjwdfbbmn-8ibrewjaberrui']!
        .map(
          (account) => TeamMember(
            walletAddress: account.walletAddress,
            email: account.email,
            status: 'approved',
          ),
        )
        .toList(),
  ),
].where((element) => bobTeamIds.contains(element.teamId)).toList();
