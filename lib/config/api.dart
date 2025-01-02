part of "config.dart";

String get kBaseDomain {

  if(kEnvironment == Environment.dev) {
    return "dev_domain";
  } else if(kEnvironment == Environment.qa) {
    return "qa_domain";
  } else {
    return "prod_domain";
  }

}

String get kSchema {

  if(kEnvironment == Environment.dev) {
    return "http://";
  } else if(kEnvironment == Environment.qa) {
    return "https://property.softcube.co.in"; /// +One internet
    // return "http://192.168.43.199:8888";
  } else {
    return "https://property.softcube.co.in"; /// One internet
    return "http://192.168.43.199:8888";
  }

}

String kBaseURL = '$kSchema/api/v1';

