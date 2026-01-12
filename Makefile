
compile:
    npx swagger-cli bundle -t yaml -w 300 web-api/main.yml > output/webApiCompiled.yml

lint:
	npx swagger-cli validate web-api/main.yml
	npx openapi-generator validate -i output/webApiCompiled.yml
	npx swagger-cli bundle -t yaml -w 300 web-api/main.yml > output/webApiCompiled.yml

ts: 
	npx openapi-generator generate -i output/webApiCompiled.yml -g typescript-fetch -o output/typescript/webApi