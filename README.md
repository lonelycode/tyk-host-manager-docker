Tyk Host Manager & NginX Container (Official)
=============================================

This container makes it easy to set up a Tyk-managed NGinX instance, this dockerfile is based off the official NginX docker so as to remain as stable as possible.

This container will provide an NGinX instance and a running host maanger that will dynamically generate server entries for your Tyk instance, generating the appropriate subdomains for your APIs and th tyk dashboard portal.

For this to work in testing you will need to have something like `dnsmasq` installed to manage wild-card domain names to point at your docker instance, this can also be done with `/etc/hosts` but it can be a pain to test becasue of the dynamic nature of host names that Tyk generates.

Quickstart
----------

1. Set up Mongo, Redis , tyk Gateway and Tyk Dashboard containers

2. Start this container and link it all up:

	`docker run -d --name tyk_nginx -p 8888:80 --link tyk_gateway:tyk_gateway --link tyk_dashboard:tyk_dashboard --link tyk_mongo:tyk_mongo --link tyk_redis:tyk_redis -e DOMAINALIAS=tyk.docker tykio/tyk-host-manager`

3. Go to your portal: `http://{org-slug}.tyk.docker:8888/portal/`

4. Your APIs will be availabel at: `http://{api-slug}.{org-slug}.tyk.docker:8888/portal/`

To change the local domain to expand to, change the -e DOMAINALIAS variable to be whatever root domain you are using.

To change the actual nginx templates used, take a look at the github repo for the Dockerfile, the templates are stored in the `templates/` directory (this is also an exposed volume you can mount should you wish to change them locally under `/opt/tyk-dashboard`).