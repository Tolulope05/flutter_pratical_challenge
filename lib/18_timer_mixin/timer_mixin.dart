import 'dart:async';

/// A mixin for adding timer to state or screens
///e.g when there's a reset password otp timer
///
/// Add it to your immutable state class like so:
///   class PasswordState extends AuthState with TimerMixin {
///   ...
///
///   @override
///   timerDuration => 30; //in seconds
///   }
///
mixin TimerMixin {
  late final StreamController<Duration> _timerSub =
      StreamController<Duration>();

  ///in seconds
  int get timerDuration;

  StreamController<Duration> get timerStreamSub {
    timer;
    return _timerSub;
  }

  bool _timerCompleted = false;

  bool get timerCompleted => _timerCompleted;

  set timerCompleted(bool timerCompleted) {
    if (_timerCompleted ^ timerCompleted) {
      _timerCompleted = timerCompleted;
    }
  }

  Timer get _newTimer => Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          timerCompleted = false;
          _timerSub.add(Duration(seconds: timerDuration - timer.tick));
          if (timer.tick == timerDuration) {
            timerCompleted = true;
            timer.cancel();
          }
        },
      );

  late Timer timer = _newTimer;

  void resetTimerIfInactive() {
    if (!timer.isActive && timer.tick >= timerDuration) {
      timer = _newTimer;
    }
  }
}
