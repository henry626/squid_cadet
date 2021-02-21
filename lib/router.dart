import 'package:flutter/material.dart';
import 'package:squid_cadet/semaphore/semaphoreSignals.dart';
import 'mainSkillMenu.dart';
import 'routeNames.dart';
import 'morse/morseHome.dart';
import 'morse/morseTranslation.dart';
import 'morse/morseLessons.dart';
import 'morse/morseGames.dart';
import 'semaphore/semaphoreHome.dart';
import 'semaphore/semaphoreTranslation.dart';
import 'semaphore/semaphoreLessons.dart';
import 'semaphore/semaphoreGames.dart';
import 'semaphore/semaphoreSignals.dart';
import 'knots/knotsHome.dart';
import 'knots/knotsLessons.dart';
import 'knots/knotsGames.dart';
import 'cryptology/cryptoHome.dart';
import 'cryptology/cryptoTranslation.dart';
import 'cryptology/cryptoLessons.dart';
import 'cryptology/cryptoGames.dart';

Route<dynamic> generateRoute(RouteSettings settings) {

  switch (settings.name) {
    case MAINSKILLMENU:
      return MaterialPageRoute(builder: (_) => MainSkillMenu());

    case MORSEHOME:
      return MaterialPageRoute(builder: (_) => MorseHome());
    case MORSELESSONS:
      return MaterialPageRoute(builder: (_) => MorseLessons());
    case MORSEGAMES:
      return MaterialPageRoute(builder: (_) => MorseGames());
    case MORSETRANSLATION:
      return MaterialPageRoute(builder: (_) => MorseTranslation());

    case SEMAPHOREHOME:
      return MaterialPageRoute(builder: (_) => SemaphoreHome());
     case SEMAPHORELESSONS:
       return MaterialPageRoute(builder: (_) => SemaphoreLessons());
    case SEMAPHOREGAMES:
      return MaterialPageRoute(builder: (_) => SemaphoreGames());
    case SEMAPHORETRANSLATION:
      return MaterialPageRoute(builder: (_) => SemaphoreTranslation());
    case SEMAPHORESIGNALS:
      return MaterialPageRoute(builder: (_) => SemaphoreSignals());

    case KNOTSHOME:
      return MaterialPageRoute(builder: (_) => KnotsHome());
    case KNOTSLESSONS:
      return MaterialPageRoute(builder: (_) => KnotsLessons());
    case KNOTSGAMES:
      return MaterialPageRoute(builder: (_) => KnotsGames());
    // case KNOTSTRANSLATION: //Remove
    //   return MaterialPageRoute(builder: (_) => KnotsTranslation());

    case CRYPTHOME:
      return MaterialPageRoute(builder: (_) => CryptoHome());
    case CRYPTLESSONS:
      return MaterialPageRoute(builder: (_) => CryptoLessons());
    case CRYPTGAMES:
      return MaterialPageRoute(builder: (_) => CryptoGames());
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