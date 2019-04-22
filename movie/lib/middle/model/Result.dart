
class Result {
  dynamic data;
  List<Error> errors;
  int code;

  Result({this.data, this.errors});

  factory Result.fromJson(Map<String, dynamic> value) {
    /// Get locations
    List<dynamic> dyErrors= value['errors'];
    List<Error> errors = [];
    if(dyErrors != null){
      errors = dyErrors.map<Error>((item) {
        return Error.fromJson(item);
      }).toList();
    }
    return Result(
      data: value['data'],
      errors: errors
    );
  }
}

class Error {
  String message;
  List<Location> locations;
  List<String> path;
  Extensions extensions;

  Error({this.message, this.locations, this.path, this.extensions});

  factory Error.fromJson(Map<String, dynamic> value) {
    /// Get locations
    List<dynamic> dyLocations = value['locations'];
    List<Location> locations = [];
    if (dyLocations != null) {
      locations = dyLocations.map<Location>((item) {
        return Location.fromJson(item);
      }).toList();
    }

    /// Get path
    List<dynamic> dyPath = value['path'];
    List<String> path = [];
    if (dyPath != null) {
      path = dyPath.map<String>((item) {
        return item.toString();
      }).toList();
    }

    /// Get extensions
    final dyExtensions = value['extensions'];
    Extensions extensions;
    if (dyExtensions != null) {
      extensions = Extensions.fromJson(dyExtensions);
    }

    return Error(
      message: value['message'],
      locations: locations,
      path: path,
      extensions: extensions,
    );
  }
}

class Location {
  int line;
  int column;

  Location({this.line, this.column});

  factory Location.fromJson(Map<String, dynamic> value) {
    return Location(
      line: value['line'],
      column: value['column'],
    );
  }
}

class Extensions {
  String code;
  Exception exception;

  Extensions({this.code, this.exception});

  factory Extensions.fromJson(Map<String, dynamic> value) {
    return Extensions(
        code: value['code'],
        exception: value['exception'] != null
            ? Exception.fromJson(value['exception'])
            : null);
  }
}

class Exception {
  List<String> stacktrace;

  Exception({this.stacktrace});

  factory Exception.fromJson(Map<String, dynamic> value) {
    List<dynamic> data = value['stacktrace'];

    if (data == null) {
      return null;
    }
    List<String> result = data.map<String>((item) {
      return item.toString();
    }).toList();
    return Exception(stacktrace: result);
  }
}
