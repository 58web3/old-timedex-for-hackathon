import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../states.dart';

// Delegate先の管理
final addDelegatorWalletAddressProvider = StateProvider<Set<String>>(
  (_) => {},
);

final delegatedToMemberProvider = StateProvider<List<DelegationInfo>>(
  (_) => [
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gcs/files/0eec0daab47069621e77e8a1a52581aa.png?auto=format&w=1000',
      name: 'TEST USEER',
      email: 'test@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gae/ma-TGI6Hq-re8npSzXYyQotUPLFO0Dfuu4Rh-s8AHHcUr0YyEf-LPGIHhsNi3r7JAIRnrnVVbSv6R95pHVxBbclAR1X9dokX6blTrgQ?auto=format&w=1000',
      name: 'BAYC USER',
      email: 'yodai.hirano@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gae/MVaQqeMVZC6qEGXirksr3NGDphvRKeveDn0ewaMGLIfa3zYp14UqjAgVHUEpxbHPvryO7OA5ZhInRF2BYe4YzrDfnzly0cl0YL3h?auto=format&w=1000',
      name: 'BAYC USER2',
      email: 'bayc@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gae/ixv8aJJYTIIzsd6JE4vhkR841MIflDXaNShXNmYXiZd0wEUzUd9kIwymYrondeQgfFPBIugMjbIS28WTge3uGWMo9E4IiHVie-kf?auto=format&w=1000',
      name: 'BAYC USER3',
      email: 'sasasasasasas@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gcs/files/0eec0daab47069621e77e8a1a52581aa.png?auto=format&w=1000',
      name: 'TEST USEER',
      email: 'test@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gae/ma-TGI6Hq-re8npSzXYyQotUPLFO0Dfuu4Rh-s8AHHcUr0YyEf-LPGIHhsNi3r7JAIRnrnVVbSv6R95pHVxBbclAR1X9dokX6blTrgQ?auto=format&w=1000',
      name: 'BAYC USER',
      email: 'yodai.hirano@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gae/MVaQqeMVZC6qEGXirksr3NGDphvRKeveDn0ewaMGLIfa3zYp14UqjAgVHUEpxbHPvryO7OA5ZhInRF2BYe4YzrDfnzly0cl0YL3h?auto=format&w=1000',
      name: 'BAYC USER2',
      email: 'bayc@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gae/ixv8aJJYTIIzsd6JE4vhkR841MIflDXaNShXNmYXiZd0wEUzUd9kIwymYrondeQgfFPBIugMjbIS28WTge3uGWMo9E4IiHVie-kf?auto=format&w=1000',
      name: 'BAYC USER3',
      email: 'sasasasasasas@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gcs/files/0eec0daab47069621e77e8a1a52581aa.png?auto=format&w=1000',
      name: 'TEST USEER',
      email: 'test@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gae/ma-TGI6Hq-re8npSzXYyQotUPLFO0Dfuu4Rh-s8AHHcUr0YyEf-LPGIHhsNi3r7JAIRnrnVVbSv6R95pHVxBbclAR1X9dokX6blTrgQ?auto=format&w=1000',
      name: 'BAYC USER',
      email: 'yodai.hirano@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gae/MVaQqeMVZC6qEGXirksr3NGDphvRKeveDn0ewaMGLIfa3zYp14UqjAgVHUEpxbHPvryO7OA5ZhInRF2BYe4YzrDfnzly0cl0YL3h?auto=format&w=1000',
      name: 'BAYC USER2',
      email: 'bayc@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gae/ixv8aJJYTIIzsd6JE4vhkR841MIflDXaNShXNmYXiZd0wEUzUd9kIwymYrondeQgfFPBIugMjbIS28WTge3uGWMo9E4IiHVie-kf?auto=format&w=1000',
      name: 'BAYC USER3',
      email: 'sasasasasasas@gmail.com',
    ),
  ],
);

final delegatedFromMemberProvider = StateProvider<List<DelegationInfo>>(
  (_) => [
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gcs/files/0eec0daab47069621e77e8a1a52581aa.png?auto=format&w=1000',
      name: 'TEST USEER',
      email: 'test@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gae/ma-TGI6Hq-re8npSzXYyQotUPLFO0Dfuu4Rh-s8AHHcUr0YyEf-LPGIHhsNi3r7JAIRnrnVVbSv6R95pHVxBbclAR1X9dokX6blTrgQ?auto=format&w=1000',
      name: 'BAYC USER',
      email: 'yodai.hirano@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gae/MVaQqeMVZC6qEGXirksr3NGDphvRKeveDn0ewaMGLIfa3zYp14UqjAgVHUEpxbHPvryO7OA5ZhInRF2BYe4YzrDfnzly0cl0YL3h?auto=format&w=1000',
      name: 'BAYC USER2',
      email: 'bayc@gmail.com',
    ),
    DelegationInfo(
      profileUrl:
          'https://i.seadn.io/gae/ixv8aJJYTIIzsd6JE4vhkR841MIflDXaNShXNmYXiZd0wEUzUd9kIwymYrondeQgfFPBIugMjbIS28WTge3uGWMo9E4IiHVie-kf?auto=format&w=1000',
      name: 'BAYC USER3',
      email: 'sasasasasasas@gmail.com',
    ),
  ],
);

final addDelegatorProvider = StateProvider<List<String>>(
  (_) => [],
);
