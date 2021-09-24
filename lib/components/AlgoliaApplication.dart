import 'package:algolia/algolia.dart';

class AlgoliaApplication {
  static final Algolia algolia = Algolia.init(
    applicationId: '3S6309MTOQ', //ApplicationID
    apiKey:
        '8b8267116c4fcf04b1471fe4816a3c2b', //search-only api key in flutter code
  );
}
