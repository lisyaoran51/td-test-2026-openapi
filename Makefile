
compile:
    npx swagger-cli bundle -t yaml -w 300 web-api/main.yml > output/webApiCompiled.yml

lint:
	npx swagger-cli validate user-base/main.yml  
	npx openapi-generator validate -i output/userBaseCompiled.yml 
	npx swagger-cli bundle -t yaml -w 300 management-base/main.yml > output/managementBaseCompiled.yml

ts: 
	npx openapi-generator generate -i output/userBaseCompiled.yml -g typescript-fetch -o output/typescript/userBase
	npx openapi-generator generate -i output/notifyBaseCompiled.yml -g typescript-fetch -o output/typescript/notifyBase
	npx openapi-generator generate -i output/cardBaseCompiled.yml -g typescript-fetch -o output/typescript/cardBase
	npx openapi-generator generate -i output/orderBaseCompiled.yml -g typescript-fetch -o output/typescript/orderBase
	npx openapi-generator generate -i output/agencyBaseCompiled.yml -g typescript-fetch -o output/typescript/agencyBase
	npx openapi-generator generate -i output/managementBaseCompiled.yml -g typescript-fetch -o output/typescript/managementBase