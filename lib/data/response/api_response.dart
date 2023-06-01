import 'package:mvvm/data/response/status.dart';


// The code you provided defines a generic class called ApiResponse.
// It is used to represent the response from an API call, which typically
// consists of a status, data, and a message.


class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed() : status = Status.COMPLETED;

  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status  : $status \n : Message : $message \n : data : $data";
  }
}

// The ApiResponse class is a generic class that represents the response from an API call.
// It has three properties: status, data, and message, which can hold different types of values.
// It provides three constructors: loading(), completed(), and error(), which initialize the status
// property with corresponding values. The toString() method returns a formatted string representation
// of the ApiResponse object, displaying the values of status, message, and data.




