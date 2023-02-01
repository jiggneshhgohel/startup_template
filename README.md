### Introduction

* This is a startup template for a web application based on Hanami 2.0 which can be cloned and adopted for personal use.

* At the time of writing this the application has CRUD (Create-Read-Update-Delete) operations implemented for a model (or business-entity) `Doctor`. 

* For interacting with the database layer of the application the application utilizes the [ROM Repository](https://rom-rb.org/learn/repository/5.2/) as the primary interface and to work with the persisted data, instead of directly working with relation tuples, [Entity](https://rom-rb.org/learn/core/5.2/structs/#auto-struct-with-custom-classes) concept is used.

* For implementing the business logic [dry-transaction](https://dry-rb.org/gems/dry-transaction/0.13/) gem is utilized. 

* The application utilizes very simple, straightforward and *no suprises* approach for using CSS and JS assets. By default it uses [simplecss](https://simplecss.org/) as basic library for styling pages and [jQuery](https://api.jquery.com/) as basic library for working with Javascript.

* The application internally uses [hanami view](https://github.com/hanami/view) and [hanami helpers](https://github.com/hanami/helpers). **Note: Officially 2.0-compatible versions of those gems have not been released so the application directly uses the `main` branch codebase from their github repositories. For more details please refer `Gemfile` of this application.**

* The application uses [HAML](https://haml.info/) for templating front-end views.

* The application logs are configured to be written by default to `<app_root>/log/<env_name>.log` file. For more details refer `<app_root>/config/app.rb`.

* There is file named `IMPLEMENTATION_NOTES.md` in `<app_root>` folder which has extensive notes regarding the problems faced while implementing the CRUD operations and the approaches/solutions used to solve them. The notes would also prove helpful in understanding the workflow of various components involved in Hanami gems giving a better insight into utilizing them in intended manner.

### Environment Variables

* `DATABASE_URL`

  * A URL acceptable by `rom-rb`. For more details refer https://rom-rb.org/5.0/learn/sql/#connecting-to-a-database.

  * Example URL for connecting to a PostgreSQL database: `postgres://postgres:root@localhost:5432/hanami_startup_template_dev`

  * For `development` env you should set this variable in `.env` file under `<app_root>` folder. That is the file which is read for development env by `dotenv` gem which is used by this application. Note: Following is recommended in [Hanami 2.0 Guide](https://guides.hanamirb.org/v2.0/app/settings/#using-dotenv-to-manage-environment-variables)

    >We do not recommend using dotenv in production environments.

* `SESSION_SECRET`

  * A unique value set for Http Session. For e.g. you can generate such value using following code from Ruby's `irb` console:

    ```
      require 'securerandom'

      SecureRandom.hex
    ```

  * For `development` env you should set this variable in `.env` file under `<app_root>` folder. That is the file which is read for development env by `dotenv` gem which is used by this application. Note: Following is recommended in [Hanami 2.0 Guide](https://guides.hanamirb.org/v2.0/app/settings/#using-dotenv-to-manage-environment-variables)

    >We do not recommend using dotenv in production environments.

* Following are supported only if `HANAMI_ENV` is set to `production`

  * `USE_AS_LOG_LEVEL`

    * Acceptable values: `debug`, `info`, `warn`, `error`, `fatal`

  * `PRODUCTION_ASSET_CACHE_TIME_LIMIT_IN_SECONDS`

    * Acceptable value any integer greater than 0.

    * If not set default value used is `31536000` corresponding to number of seconds in 1 year.

### Assets

**Note: No fancy stuff here like JS bundlers, precompilers etc. Simple and straightfoward workflow is followed here to avoid any puzzling or wierd behaviour like assets not found**

* Add your CSS file to `<app_root>/app/assets/css` folder and then add the entry to it in `manifest.txt` file under that folder.

* Add your JS file to `<app_root>/app/assets/js` folder and then add the entry to it in `manifest.txt` file under that folder.

* By default the assets are served using `Rack::Static` middleware. See `<app_root>/config.ru` for details.

* For `production` environment the assets should be served from `<app_root>/public` folder. So you should first generate the assets in that folder using the rake task `assets_custom_manager:minify_assets` defined for that purpose. Please refer the details under `Rake Tasks` section ahead.

* For `development` environment the assets should be served from `<app_root>/app/assets` folder.

### Rake Tasks

* **Supported for Production environment only**

  1. To generate single minified version one for each of the following asset types: CSS, JS run following command:

  ```
    <app_root>$ HANAMI_ENV=production bundle exec rake assets_custom_manager:minify_assets
  ```

    That should generate files `application.<fingerprint>.css` and `application.<fingerprint>.js` under `public/css` and `public/js` folders, respectively.

    ***Note: If you modified your assets on your development environment and want to deploy those changes to production env then you must run the above rake task on production environment.***


### Development Environment Setup

* Pre-requisites:

  1. Ruby 3.1.2 must be installed. The Ruby version is specified in the file `.ruby-version` that should be available under `<app_root>` folder when cloning the application.
  
  2. You should have a ruby version manager installed which supports creating gemsets. For e.g. the author of these instructions used [RVM](https://rvm.io/). The gemset name is specified in the file `.ruby-gemset` that should be available under `<app_root>` folder when cloning the application.

* Clone the application by running following commands:

  ```
  	<app_root>$ git clone https://github.com/jiggneshhgohel/startup_template.git .
  ```

* Create a RVM gemset by running following command:

  ```
   <app_root>$ cd ../<app_root>
  ```
  
  That should generate output similar to following
  
  ```
   ruby-3.1.2 - #gemset created /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0
   ruby-3.1.2 - #generating startup-template-hanami-2-0 wrappers.............
  ```
  
*  Install the gems by running following command:
  
  ```
   <app_root>$ bundle
  ```
  
* Create the databases for `development` and `test` environments. PostgreSQL is recommended as a DBMS. For e.g. for `development` env create a DB name `hanami_startup_template_dev` and for `test` env create a DB name `hanami_startup_template_test`.

  *Note: The name used should be specified in the `DATABASE_URL` environment variable set. Refer **Environment Variables** section for more details regarding that environment variable.*

* Under `<app_root>` create `.env` and `.env.test` files. These are expected by [dotenv](https://github.com/bkeepers/dotenv) gem which the application uses for managing environment variables.

* In `.env` file set following env variables: `SESSION_SECRET`, `DATABASE_URL`. Example content:

  ```
    SESSION_SECRET=686332347898a9728847b2d5f3881038
    DATABASE_URL=postgres://postgres:root@localhost:5432/hanami_startup_template_dev
  ```
  
  *Note: For more details regarding the values for the env variables please refer the **Environment Variables** section above.*

* In `.env.test` file set following env variables: `DATABASE_URL`. Example content:

  ```
    DATABASE_URL=postgres://postgres:root@localhost:5432/hanami_startup_template_test
  ```
  
* Create the relation tables in databases for `development` and `test` environments by running following commands:

  ```
  	<app_root>$ bundle exec rake db:migrate
	<app_root>$ HANAMI_ENV=test bundle exec rake db:migrate
  ```
  
 ### Running application
 
 1. Open a terminal and change directory to `<app_root>` and run following command:
 
    ```
	app_root$ hanami server
	```
	
	That should start the server by default for **development** environment.

 2. Open a browser and add URL http://localhost:2300/ to the address bar and hit Enter and you see a home page stating following:

	```
     Welcome to Startup Template for Hanami 2.0 application
	```
	
### Running Tests

Note: At the time of writing this there are no tests added.

### General Guidelines For Development

* All persistence relation classes should be defined under to `lib/startup_template/persistence/relations`

* All repository classes should be defined under `lib/startup_template/repositories`

* All models (or business-entities) should be defined under `lib/startup_template/entities`

* All business-logic (or service-layer-logic) should be defined under `lib/startup_template/business_transactions`

* Any custom [dry-types](https://dry-rb.org/gems/dry-types/1.2/custom-types/) should be to `lib/startup_template/types.rb` and those should be registered in `lib/startup_template/type_container.rb`. For more details on Custom Types Registration please refer https://dry-rb.org/gems/dry-schema/1.10/advanced/custom-types/. 

* All action classes should be defined under `app/actions/<resource_name>`. For e.g. refer `app/actions/doctors/index.rb`.

* All view classes should be defined under `app/views/<resource_name>`. For e.g. refer `app/views/doctors/index.rb`.

* Every view class should extend from `View::Base` (`app/view/base.rb`). `View::Base` is the base class which gives access to `request`, `session`, `flash`, `params` (request params). **Note: This base class should not be bloated with helpers meant for use in view templates. For that purpose Scope classes for views should be used.**

* A scope class should be defined for each view class and it should be configured in the view class using `config.scope` option. For e.g. refer `app/views/doctors/scopes/index.rb` and `app/views/doctors/index.rb`.

* Every scope class should extend from `View::Scope` (`app/view/scope.rb`). `View::Scope` is the base class which includes common helpers (including [hanami helpers](https://github.com/hanami/helpers)) for use in view classes and/or view templates.

* The view templates should be defined under `app/templates/<resource_name>`. For e.g. refer `app/templates/doctors/index.html.haml`.

* All the helper code meant to be utilized by the view template should be defined in the scope class configured for the view class which renders the view template. For e.g. refer scope class `app/views/doctors/scopes/index.rb` configured for view class `app/views/doctors/index.rb`. That scope class contains all helper methods used in the view template `app/templates/doctors/index.html.haml` rendered by view class `app/views/doctors/index.rb`.

* CSS and JS assets should be added to respective folders under `app/assets`. After adding them DO NOT FORGET to add their entries to the respective manifest file `manifest.txt` available under asset-type (CSS/JS) folder under `app/assets`.

