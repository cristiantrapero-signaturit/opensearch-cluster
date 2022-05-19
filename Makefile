all: up

up:
	docker-compose up -d

down:
	docker-compose down

rm:
	docker-compose down -v

count:
	curl -XGET http://localhost:9200/test/_count -u 'admin:admin' --insecure

nodes:
	curl -XGET http://localhost:9200/_cat/nodes\?v -u 'admin:admin' --insecure

queries:
	while true; do curl -XPOST -u 'admin:admin' "http://localhost:9200/test/_doc" --insecure -H 'Content-Type: application/json' -d '{"description":"hola"}'; done

perf:
	./opensearch-perf-top-linux --logfile perftop.log --dashboard ClusterOverview --endpoint http://localhost:9600

run:
	docker-compose -f nodo$(node).yml up

run-dashboard:
	docker-compose -f dashboard.yml up