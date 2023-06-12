function fn() {
	var env = karate.env; // get system property 'karate.env'
	karate.log('karate.env system property was:', env);
	if (!env) {
		env = 'qa';
	}
	var config = {
		env: env,
		myVarName: 'someValue',
		baseUrl: 'https://reqres.in/api/users'
	}
	if (env == 'dev') {
		config.titleName = 'Kiran'
		config.job = 'QA Engineer'
		// customize

		// e.g. config.foo = 'bar';
	}

	if (env == 'qa') {
		config.titleName = 'Jitendra'
		config.job = 'Senior QA Engineer'


	}

	else if (env == 'e2e') {
		// customize
	}
	return config;
}