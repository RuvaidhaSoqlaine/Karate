function fn() {
	var config = {
		baseURL : "https://reqres.in/api/",
		Name : "Ruvaidha"
	}
	
	var env = karate.env
	karate.log("The Environment Is :",env)
	
	if(env == 'dev'){
		config.baseURL = 'https://reqres.in/api/dev'
	}
	
	else if(env == 'qa'){
		config.baseURL = 'https://reqres.in/api/qa'
	}
	
	else {
		config.baseURL = 'https://reqres.in/api/'
	}
	
	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);
	
	return config;
}