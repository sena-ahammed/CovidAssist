class BedsModel {
  BedsModel(this._name, this._lastUpdated, this._total, this._vacant);
  final _name;
  final _lastUpdated;
  final _total;
  final _vacant;
  String get name => _name;
  String get lastUpdatedStatus => _lastUpdated;
  int get total => _total;
  int get vacant => _vacant;
}
