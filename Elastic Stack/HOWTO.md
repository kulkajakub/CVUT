# Návod ke zprovoznění 2. části semestrální práce

Spuštění ELK stack.
.../2 - Elastic Stack >

	docker compose up -d

V prohlížeči spustit Kibana:

	http://127.0.0.1:5601

V Kibana:

	Managment -> Index Patterns -> Create Index Pattern

	Step 1 of 2: Define index pattern:

	permits*

	Step 2 of 2: Configure settings

	I don't want to use the Time Filter

Zopakovat steps 1 of 2, 2 of 2 pro:

	details*
	projects*
	contractors*
	locations*
	applicants*

Nahrání vizualizaci a dashbord:

	Managment -> Saved Objects -> Import

	.../2 - Elastic Stack/results/export.json

	Yes, overwrite all objects

Indexy vyplňuji podle jmen objectu:

	Projects Values -> projects*
	Contractors Trades -> contractors*
	...