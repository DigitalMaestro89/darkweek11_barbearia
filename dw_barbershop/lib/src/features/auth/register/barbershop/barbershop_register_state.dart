enum BarbershopRegisterStateStatus { initial, success, error }

class BarbershopRegisterState {
  final BarbershopRegisterStateStatus status;
  final List<String> openingDays;
  final List<int> openingHours;

  BarbershopRegisterState.initial()
      : this(
          status: BarbershopRegisterStateStatus.initial,
          openingDays: <String>[],
          openingHours: <int>[],
        );

  BarbershopRegisterState({
    required this.status,
    required this.openingDays,
    required this.openingHours,
  });

  BarbershopRegisterState copyWith({
    BarbershopRegisterStateStatus? status,
    List<String>? openingDays,
    List<int>? openingHours,
  }) {
    return BarbershopRegisterState(
        status: status ?? this.status,
        openingDays: openingDays ?? this.openingDays,
        openingHours: openingHours ?? this.openingHours);
  }
}
