### Introduction

* This is a startup template for a web application based on Hanami 2.0 which can be cloned and adopted for personal use.

* At the time of writing this the application has CRUD (Create-Read-Update-Delete) operations implemented for a business entity `Doctor`. 

* For interacting with the database layer of the application the application utilizes the [ROM Repository](https://rom-rb.org/learn/repository/5.2/) as the primary interface and to work with the persisted data, instead of directly working with relation tuples, [Entity](https://rom-rb.org/learn/core/5.2/structs/#auto-struct-with-custom-classes) concept is used.

* For implementing the business logic [dry-transaction](https://dry-rb.org/gems/dry-transaction/0.13/) gem is utilized. 

* The application utilizes very simple, straightforward and no suprises approach for using CSS and JS assets. By default it uses [simplecss](https://simplecss.org/) as basic library for styling pages and [jQuery](https://api.jquery.com/) as basic library for working with Javascript.

* **Note**: The application internally uses [hanami view](https://github.com/hanami/view) and [hanami helpers](https://github.com/hanami/helpers). Officially their 2.0-compatible versions have not been released so the application directly uses the `main` branch
  codebase from their github repositories. For more details please refer `Gemfile` of
  this application.

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
    app_root$ HANAMI_ENV=production bundle exec rake assets_custom_manager:minify_assets
  ```

    That should generate files `application.<fingerprint>.css` and `application.<fingerprint>.js` under `public/css` and `public/js` folders, respectively.

    ***Note: If you modified your assets on your development environment and want to deploy those changes to production env then you must run the above rake task on production environment.***


### Development Environment setup

* Clone the application.

* Run following commands to create a gemset and install the gems:

  ```
   <app_root>$ cd ../<app_root>
   <app_root>$ bundle
  ```

* Under `<app_root>` create `.env` and `.env.test` files

* In `.env` file set following env variables: SESSION_SECRET, DATABASE_URL. Example content:

  ```
    SESSION_SECRET=e70cd214a6015b3bf9538bec7ad27564
    DATABASE_URL=postgres://postgres:root@localhost:5432/hanami_startup_template_dev
  ```

* In `.env.test` file set following env variables: DATABASE_URL. Example content:

  ```
    DATABASE_URL=postgres://postgres:root@localhost:5432/hanami_startup_template_test
  ```
  
 ### Running application
 
 1. Open a terminal and change directory to `<app_root>` and run following command:
 
    ```
	app_root$ hanami server
	```
	
	That should start the server by default for **development** environment.

 2. Open a browser and add following URL to the address bar http://localhost:2300/ and hit Enter and you see a home page stating following:

	```
     Welcome to Startup Template for Hanami 2.0 application
	```
	
### Running Tests

Note: At the time of writing this there are no tests added.
