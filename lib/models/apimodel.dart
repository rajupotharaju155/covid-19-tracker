class ApiModel{
  final String locationName;
  final int totalDeaths; 
  final int totalRecoveries;
  final int totalCases; 
  final int totalActive;

  final int todayNewConfirmed;
  final int todayNewRecovered;
  final int todayNewDeaths;
  final int todayNewActive;

  final double fatalityRate; 
  final double recoveryRate;

  final String updatedAt;
ApiModel({ 
  this.todayNewActive,
  this.totalActive,
  this.locationName,
  this.totalDeaths,
  this.totalRecoveries,
  this.totalCases,
  this.todayNewConfirmed, 
  this.todayNewRecovered, 
  this.todayNewDeaths, 
  this.fatalityRate,
  this.recoveryRate,
  this.updatedAt
});
}

class MasterModel{
  final ApiModel countryData;
  final List<ApiModel> stateList;
  MasterModel({
    this.countryData,
    this.stateList
  });
}

class StateMasterModel{
  final ApiModel stateData;
  final List<ApiModel> cityList;
  StateMasterModel({
    this.stateData,
    this.cityList
  });
}

