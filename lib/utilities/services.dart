import 'dart:convert';
import 'package:http/http.dart';

class Services {

Future<Map> getCountry() async {
	try{
			Response response = await get('http://krazycovidindia.azurewebsites.net/api/all');
			Map data =  jsonDecode(response.body);
			Map countryData = data['all'];
			return countryData;
	}
	catch(e) {
		print(e);
		return null;
	}
 }

Future<Map> getStatesIndia() async {
	Map statesData = new Map();
	try{
			Response response = await get('http://krazycovidindia.azurewebsites.net/api/all');
			Map data =  jsonDecode(response.body);
			Map states = data['states'];
			states.forEach((k,v) { 
					if(k!=''){
					statesData['$k'] = v['all_total'];
					}
			} 
			);  
			return statesData; 
	}
	catch(e) {
		print(e);
		return null;
	} 
}

Future<Map> getStateDetail(String stateName) async{
		 Response response = await get('http://krazycovidindia.azurewebsites.net/api/all');
			Map data =  jsonDecode(response.body);
			Map stateDetails = data['states'][stateName];
			return stateDetails;
}



} //end of class