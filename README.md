====================
JOBHUNTERS
---------------------

## Usage

This elemental WebService consumes the gem jobhunters to obtain information of some job offers in CA.

## Handles:

>GET /api/v1/
>returns JSON of job offers info: category (category), job_offers(Array of joboffers)

##CLI
GET with categories:
[http://jobhunters.herokuapp.com/api/v1/job_openings/marketing-ventas.json](http://jobhunters.herokuapp.com/api/v1/job_openings/marketing-ventas.json)

This returns:
	{"type of job":"marketing-ventas","kind":"openings","jobs":[{"id":"Asesor de Ventas Retail 		ESET","date":"2014-12-01","city":"Guatemala"},{"id":"Ejecutivo de Cuentas Claves 				Guatemala","date":"2014-12-01","city":"Guatemala"},{"id":"Ejecutivo de Cuentas Claves El Salvador","date":"2014-12-01","city":"El Salvador"},{"id":"Demo Vendedor El Salvador","date":"2014-12-01","city":"El Salvador"},{"id":"Asesor Comercial","date":"2014-12-01","city":"El Salvador"},{"id":"Asesores de Ventas y Auxiliares de Bodega","date":"2014-12-01","city":"El Salvador"},{"id":"ASESOR AGRICOLA","date":"2014-11-30","city":"El Salvador"},{"id":"VENDEDOR VETERINARIO","date":"2014-11-30","city":"El Salvador"},{"id":"Ejecutivo de Ventas de Sistemas y Proyectos ","date":"2014-11-12","city":"Guatemala"},{"id":"Vendedor Senior ","date":"2014-11-14","city":"Guatemala"},{"id":"Vendedor Senior ","date":"2014-11-14","city":"Guatemala"},{"id":"Ejecutivo de Ventas Consumo Masivo ","date":"2014-11-28","city":"Guatemala"},{"id":"Supervisor de Ventas ","date":"2014-11-20","city":"Guatemala"},{"id":"Ejecutivo de Ventas Senior ","date":"2014-11-30","city":"Costa Rica"},{"id":"PREVENDEDOR","date":"2014-11-08","city":"Nicaragua"}]}

GET with categories and cities:

GET with cities:

>POST /api/v1/

##CLI
	curl -v -H "Accept: application/json" -H "Content-type: application/json" \
     	-X POST -d "{\"categories\":[\"marketing-ventas\"]}" \

## Team Members

>Mauricio Jaime - mjboyarov@gmail.com / Nicaragua (毛里求 - 尼加拉瓜)
>
>Roger Gomez - rojotic26@gmail.com / Nicaragua (羅傑 - 尼加拉瓜)
>
>Edwin Mejia - eddwin@live.com / El Salvador (埃德温 - 薩爾瓦多) 
