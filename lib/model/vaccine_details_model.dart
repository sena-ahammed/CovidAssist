class VaccineModel {
  VaccineModel(this._vaccinationCenter, this._vaccine, this._lastUpdated,
      this._availableSlots, this._price);
  final _vaccinationCenter;
  final _vaccine;
  final _lastUpdated;
  final _availableSlots;
  final _price;
  String get vaccinationCenter => _vaccinationCenter;
  String get vaccine => _vaccine;
  String get lastUpdatedStatus => _lastUpdated;
  int get availableSlots => _availableSlots;
  int get price => _price;
}
