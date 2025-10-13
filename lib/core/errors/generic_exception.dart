import './app_exception.dart'; 

class GenericException extends AppException {
  GenericException({required super.code, required super.message});
}
