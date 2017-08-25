# Adminer

## What is Adminer?

Adminer (formerly phpMinAdmin) is a full-featured database management tool written in PHP. Conversely to phpMyAdmin, it consist of a single file ready to deploy to the target server. Adminer is available for MySQL, PostgreSQL, SQLite, MS SQL, Oracle, Firebird, SimpleDB, Elasticsearch and MongoDB.

> [adminer.org](https://www.adminer.org)

## How to use this image

### Standalone

	$ docker run --link some_database:db -p 8080:8080 geographica/adminer

Then you can hit `http://localhost:8080` or `http://host-ip:8080` in your browser.

### Loading plugins

This image bundles all official adminer plugins. You can find the list of plugins on GitHub: https://github.com/vrana/adminer/tree/master/plugins.

To load plugins you can pass a list of filenames in `ADMINER_PLUGINS`:

	$ docker run --link some_database:db -p 8080:8080 -e ADMINER_PLUGINS='tables-filter tinymce' adminer

If a plugin *requires* parameters to work correctly you will need to add a custom file to the container:

	$ docker run --link some_database:db -p 8080:8080 -e ADMINER_PLUGINS='login-servers' adminer
	Unable to load plugin file "login-servers", because it has required parameters: servers
	Create a file "/var/www/html/plugins-enabled/login-servers.php" with the following contents to load the plugin:

	<?php
	require_once('plugins/login-servers.php');

	/** Set supported servers
		* @param array array($domain) or array($domain => $description) or array($category => array())
		* @param string
		*/
	return new AdminerLoginServers(
		$servers = ???,
		$driver = 'server'
	);

To load a custom plugin you can add PHP scripts that return the instance of the plugin object to `/var/www/html/plugins-enabled/`.

### Choosing a design

The image bundles all the designs that are available in the source package of adminer. You can find the list of designs on GitHub: https://github.com/vrana/adminer/tree/master/designs.

To use a bundled design you can pass its name in `ADMINER_DESIGN`:

	$ docker run --link some_database:db -p 8080:8080 -e ADMINER_DESIGN='nette' adminer

To use a custom design you can add a file called `/var/www/html/adminer.css`.


### Carto driver (EXPERIMENTAL)

This feature allows to connect to Carto PostgreSQL throught SQL API v2.

You must select "Carto" driver and set:
* Username = your-carto-username
* Password = your-carto-api-key


