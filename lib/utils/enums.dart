enum LeadInqFilterType{ALL,TODAY,YESTERDAY,LASTWEEK,LASTMONTH,LASTYESR}


enum LeadApiAndPointTypeDataType {
  city(value: "City",apiValue: "city_list"),
  state(value: "state",apiValue: "state_list"),
  country(value: "country",apiValue: "country_list");

  const LeadApiAndPointTypeDataType({required this.value,required this.apiValue});

  final String value;
  final String apiValue;
}



