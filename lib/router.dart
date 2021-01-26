import 'package:flutter/material.dart';
import 'package:squid_cadet/semaphore/semaphoreSignals.dart';
import 'mainSkillMenu.dart';
import 'routeNames.dart';
import 'morse/morseHome.dart';
import 'morse/morseTranslation.dart';
import 'morse/morseLessons.dart';
import 'morse/morseChallenges.dart';
import 'semaphore/semaphoreHome.dart';
import 'semaphore/semaphoreTranslation.dart';
import 'semaphore/semaphoreLessons.dart';
import 'semaphore/semaphoreChallenges.dart';
import 'semaphore/semaphoreSignals.dart';
import 'knots/knotsHome.dart';
import 'knots/knotsTranslation.dart';
import 'knots/knotsLessons.dart';
import 'knots/knotsChallenges.dart';
import 'cryptology/cryptoHome.dart';
import 'cryptology/cryptoTranslation.dart';
import 'cryptology/cryptoLessons.dart';
import 'cryptology/cryptoChallenges.dart';

Route<dynamic> generateRoute(RouteSettings settings) {

  switch (settings.name) {
    case MAINSKILLMENU:
      return MaterialPageRoute(builder: (_) => MainSkillMenu());

    case MORSEHOME:
      return MaterialPageRoute(builder: (_) => MorseHome());
    case MORSELESSONS:
      return MaterialPageRoute(builder: (_) => MorseLessons());
    case MORSECHALLENGES:
      return MaterialPageRoute(builder: (_) => MorseChallenges());
    case MORSETRANSLATION:
      return MaterialPageRoute(builder: (_) => MorseTranslation());

    case SEMAPHOREHOME:
      return MaterialPageRoute(builder: (_) => SemaphoreHome());
     case SEMAPHORELESSONS:
       return MaterialPageRoute(builder: (_) => SemaphoreLessons());
    case SEMAPHORECHALLENGES:
      return MaterialPageRoute(builder: (_) => SemaphoreChallenges());
    case SEMAPHORETRANSLATION:
      return MaterialPageRoute(builder: (_) => SemaphoreTranslation());
    case SEMAPHORESIGNALS:
      return MaterialPageRoute(builder: (_) => SemaphoreSignals());

    case KNOTSHOME:
      return MaterialPageRoute(builder: (_) => KnotsHome());
    case KNOTSLESSONS:
      return MaterialPageRoute(builder: (_) => KnotsLessons());
    case KNOTSCHALLENGES:
      return MaterialPageRoute(builder: (_) => KnotsChallenges());
    case KNOTSTRANSLATION:
      return MaterialPageRoute(builder: (_) => KnotsTranslation());

    case CRYPTHOME:
      return MaterialPageRoute(builder: (_) => CryptoHome());
    case CRYPTLESSONS:
      return MaterialPageRoute(builder: (_) => CryptoLessons());
    case CRYPTCHALLENGES:
      return MaterialPageRoute(builder: (_) => CryptoChallenges());
    case CRYPTTRANSLATION:
      return MaterialPageRoute(builder: (_) => CryptoTranslation());

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
                child: Text('No route defined for ${settings.name}')),
          ));
  }

}