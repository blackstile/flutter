class ValidationResult {

  final List<String> _errors = [];
  ValidationResult();

  ValidationResult addValidation(bool condition, [String errorsMessage="Campo invalido"]){
    if (condition){
      _errors.add(errorsMessage);
    }
    return this;
  }

  bool isValid(){
    return _errors.isEmpty;
  }

  String getListMessagesAsString([String separator="\n"]) {
    return (_errors.isEmpty) ? "" : _errors.join(separator);
  }

  int countErrors(){
    return _errors.length;
  }

}