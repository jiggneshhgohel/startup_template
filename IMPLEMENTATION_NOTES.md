View: HAML as template engine.

hanami-view gem - its main branch from github is used because Hanami 2.0 compatible version of the gem is not yet released.
hanami-helpers gem - its main branch from github is used because Hanami 2.0 compatible version of the gem is not yet released.

### Gemfile

* `gem 'hanami-view', github: "hanami/view", branch: 'main'`

  Using the github repository's main branch because Hanami 2.0 compatible version of the gem is not yet released..

* `gem 'hanami-helpers', github: "hanami/helpers", branch: 'main'`

  Using the github repository's main branch because Hanami 2.0 compatible version of the gem is not yet released..


* `gem 'hamlit', '~> 3.0', '>= 3.0.3'`

  For using HAML as view template engine.

  Initially used `gem 'haml', '~> 6.0', '>= 6.0.10'`. But with that I encountered following error:

  ```
    Puma caught this error: cannot load such file -- hamlit

    hanami-view requires hamlit (3.0 or greater) for full compatibility when rendering .haml templates (e.g. implicitly capturing block content when yielding)

    To ignore this and use another engine for .haml templates, dereigster this adapter before calling your views:

    Hanami::View::Tilt.deregister_adatper(:haml)
     (LoadError)
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/zeitwerk-2.6.6/lib/zeitwerk/kernel.rb:38:in `require'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/zeitwerk-2.6.6/lib/zeitwerk/kernel.rb:38:in `require'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/tilt.rb:46:in `each'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/tilt.rb:46:in `block in activate_adapter'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/concurrent-ruby-1.1.10/lib/concurrent-ruby/concurrent/map.rb:203:in `block in fetch_or_store'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/concurrent-ruby-1.1.10/lib/concurrent-ruby/concurrent/map.rb:182:in `fetch'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/concurrent-ruby-1.1.10/lib/concurrent-ruby/concurrent/map.rb:202:in `fetch_or_store'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-core-1.0.0/lib/dry/core/cache.rb:52:in `fetch_or_store'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/tilt.rb:39:in `activate_adapter'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/tilt.rb:15:in `[]'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/renderer.rb:74:in `block in tilt'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/concurrent-ruby-1.1.10/lib/concurrent-ruby/concurrent/map.rb:203:in `block in fetch_or_store'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/concurrent-ruby-1.1.10/lib/concurrent-ruby/concurrent/map.rb:182:in `fetch'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/concurrent-ruby-1.1.10/lib/concurrent-ruby/concurrent/map.rb:202:in `fetch_or_store'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-core-1.0.0/lib/dry/core/cache.rb:52:in `fetch_or_store'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-core-1.0.0/lib/dry/core/cache.rb:64:in `fetch_or_store'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/renderer.rb:73:in `tilt'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/renderer.rb:49:in `render'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/renderer.rb:32:in `template'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/render_environment.rb:44:in `template'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view.rb:568:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action/response.rb:88:in `render'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.0/lib/hanami/extensions/action.rb:92:in `finish'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action/cookies.rb:23:in `finish'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action.rb:332:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.0/lib/hanami/slice/routing/resolver.rb:78:in `block in resolve_slice_action'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-router-2.0.0/lib/hanami/router.rb:108:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/rack/middleware.rb:36:in `block in call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/clock.rb:15:in `measure'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/rack/middleware.rb:36:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-router-2.0.0/lib/hanami/middleware/app.rb:40:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.0/lib/hanami/slice.rb:758:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/configuration.rb:268:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/request.rb:89:in `block in handle_request'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/thread_pool.rb:343:in `with_force_shutdown'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/request.rb:88:in `handle_request'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/server.rb:430:in `process_client'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/server.rb:233:in `block in run'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/thread_pool.rb:150:in `block in spawn_thread'
  ```

  That was strange because despite the fact that I had following in my Gemfile and ran `bundle`

  ```
    gem 'haml', '~> 6.0', '>= 6.0.10'
  ```

  The searching for that error found one PR related to it https://github.com/hanami/view/pull/212.

  At https://github.com/k0kubun/hamlit#project-status says

  >Hamlit's implementation was copied to Haml 6. From Haml 6, you don't need to switch to Hamlit.

  So I don't think I should replace following

  ```
  gem 'haml', '~> 6.0', '>= 6.0.10'
  ```

  WITH

  ```
  gem 'hamlit', '~> 3.0', '>= 3.0.3'
  ```

  in my Gemfile.

  The error says

  ```
    To ignore this and use another engine for .haml templates, dereigster this adapter before calling your views:

    Hanami::View::Tilt.deregister_adatper(:haml)
  ```

  but from which place in my Hanami 2.0 application to do that deregistration I don't know.

  So I switched to `hamlit` gem.


### `StartupTemplate::Actions::Doctors::Action` (`app/actions/doctors/action.rb`)

I defined the above mentioned class making it extend `StartupTemplate::Action`
so that all my actions under `app/actions/doctors` folder extends the above class instead of `StartupTemplate::Action`.

Then I defined following in `StartupTemplate::Actions::Doctors::Action`

```
  private

  def doctor_repository
    @doctor_repository ||= ::StartupTemplate::Repositories::DoctorRepository.new
  end
```

and then used that method in a class `StartupTemplate::Actions::Doctors::Index` extending `StartupTemplate::Actions::Doctors::Action`.
Then started my server and navigated the route mapped to the action `StartupTemplate::Actions::Doctors::Index` but encountered following error

```
FrozenError: can't modify frozen StartupTemplate::Actions::Doctors::Index:

  ..../app/actions/doctors/base_action.rb:11:in `doctor_repository'
  ..../app/actions/doctors/index.rb:16:in `get_all_doctors'
  ..../app/actions/doctors/index.rb:10:in `handle'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action.rb:326:in `block in call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action.rb:307:in `catch'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action.rb:307:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.1/lib/hanami/slice/routing/resolver.rb:78:in `block in resolve_slice_action'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-router-2.0.1/lib/hanami/router.rb:108:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/rack/middleware.rb:36:in `block in call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/clock.rb:15:in `measure'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/rack/middleware.rb:36:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-router-2.0.1/lib/hanami/middleware/app.rb:40:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.1/lib/hanami/slice.rb:758:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/rack-2.2.4/lib/rack/static.rb:161:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/configuration.rb:268:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/request.rb:89:in `block in handle_request'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/thread_pool.rb:343:in `with_force_shutdown'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/request.rb:88:in `handle_request'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/server.rb:430:in `process_client'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/server.rb:233:in `block in run'
```

Then I modified `doctor_repository` method like following and the error was gone.

```
  def doctor_repository
    ::StartupTemplate::Repositories::DoctorRepository.new
  end
```

That raises a question: Can't we define memoize a result against an instance variable, like `@doctor_repository`, in actions?

### `StartupTemplate::Actions::Doctors::Index` (`app/actions/doctors/index.rb`)

* `res[:doctors] = get_all_doctors` in `handle(req, res)` method.

  From an action values can be made available for usage outside the action using syntax `response[:<variable_name>]` under `handle(req, res)`.
  In Hanami terminology this is called exposure.

  **References**:

  * https://github.com/hanami/controller/tree/v2.0.0#exposures

* Additional adjustments were made in this with later developments. Following are the related sections in which the details about
  those adjustments can be found:

  * `StartupTemplate::Views::Doctors::Edit`

### `StartupTemplate::View::Base` (`app/view/base.rb`)

* View config options like `paths`, `layout` etc

  **References**:

    https://github.com/hanami/view/blob/main/docsite/source/configuration.html.md

* View renderer options specific for HAML engine faciliated by `hamlit` gem.

```
  config.renderer_options = { escape_html: false }
```

  Without that in place rendered view contains escaped HTML.

  References:

   * https://github.com/k0kubun/hamlit#sinatra

* `include Hanami::Helpers`

  **References**:
    * https://guides.hanamirb.org/v1.3/helpers/overview/
    * https://github.com/hanami/helpers

* `expose :layout_stylesheet_link_tags_string, layout: true`

  **References**:
    * https://github.com/hanami/view/blob/main/docsite/source/exposures.html.md#layout-exposures

* Note: With later developments wherein we started using custom Scope class for view
  (see `StartupTemplate::Views::Doctors::Scopes::Index`), for encapsulating helper methods
  used by the view template(s), the `expose` shown above was removed in lieu of
  `layout_stylesheet_link_tags_string` moved to a helper module `StartupTemplate::View::AssetsHelpers`
  (`app/view/assets_helpers.rb`) and which was included in `StartupTemplate::View::CommonHelpers`
  (`app/view/common_helpers.rb`) which is included in `StartupTemplate::View::Scope` (`app/view/scope.rb`)
  meant to be subclassed by each custom scope class we desire to introduce in our application. That way
  for any view when a respective scope class will be configured the helpers in `StartupTemplate::View::CommonHelpers`
  should be automatically available for use in view templates including layout.


* Overridden `Hanami::View`'s `call` method as following:

  ```
    attr_reader :view_context

    def call(**options)
      @view_context = options[:context]
      super
    end

    def csrf_token
      view_context.csrf_token
    end

    private

    def request
      view_context.request
    end

    def session
      view_context.session
    end
  ```

  That is done so that the view context, which is automatically instantiated
  and registered in app's container against key `views.context` by Hanami and
  which is passed to `Hanami::View#call` method by an Action while rendering response, we can store that
  context instance in our views and use it for accessing request, response, session, csrf_token etc
  in view classes. That context when passed to `Hanami::View#call` is not accessible as instance method
  if `Hanami::View` which our views extend.

  To be specific the CSRF token is accessed by `form_for` helper (faciliated by `hanami-helpers` gem) and that helper
  we use in our view classes (for e.g. `StartupTemplate::Views::Doctors::New` (`app/views/doctors/new.rb`))
  for constructing a HTML form markup. `form_for` helper passes instance of view (for e.g. an object of class `StartupTemplate::Views::Doctors::New`) as context for itself
  (see https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/form_helper.rb#L446) and in such a case `request`, `response` etc available in
  view context instance is not available for direct access in a view class. So we make it accessible by overriding the `Hanami::View`'s `call` method
  in our views base class (like shown above) and before invoking the actual implementation of `Hanami::View#call` from the `options` grab the context instance.

  Note that `csrf_token` must be public because at https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/form_helper/form_builder.rb#L1589
  `@context.respond_to?(:csrf_token)` is used to check whether the set for `Hanami::Helpers::FormHelper::FormBuilder` instance responds to method `csrf_token`
  and `respond_to?` method by default checks against only public methods. And as mentioned before context set in `Hanami::Helpers::FormHelper::FormBuilder` instance
  should be the instance of `StartupTemplate::Views::Doctors::New`.

  **References**:

  **Automatic Instantiation of a custom view context and passing of that while rendering a view**

    Hanami extends behaviour of classes extending `Hanami::Action`, `Hanami::View`, `Hanami::View::Context`.
    Refer the code at https://github.com/hanami/hanami/tree/v2.0.1/lib/hanami/extensions for more details.

    Accordingly https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action/slice_configured_action.rb#L41

    should call following method

    https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action/slice_configured_action.rb#L129

    which should access `actions_config.view_context_identifier` which is defined at

    https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/config/actions.rb#L87

    Coming back to https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action/slice_configured_action.rb#L129
    it attempts accessing the object set against that identifier from the slice.

    Hanami by default auto-registers every class added to `app` folder (see https://guides.hanamirb.org/v2.0/app/container-and-components). That auto-registration
    can be prevented using magic comment `auto_register: false` as documented about at https://guides.hanamirb.org/v2.0/app/container-and-components/#opting-out-of-the-container.
    So if we add a class `StartupTemplate::Views::Context` (`app/views/context.rb`) containing following code

    ```
      # frozen_string_literal: true

      require 'hanami/view/context'

      module StartupTemplate
        module Views
          class Context < Hanami::View::Context
            def initialize(**options)
              @options = options
              super(**options)
            end

          end
        end
      end
    ```

    then it should be automatically registered in `app` container against the key `views.context` and that's the key set against `actions_config.view_context_identifier` as mentioned before.

    That context class extends `Hanami::View::Context` and Hanami extends the behavior of that class through https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/view/context.rb#L105
    Through that extension Hanami overloads `Hanami::View::Context.new` method at https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/view/slice_configured_context.rb#L47.
    So when a view context class is instantiated by Hanami then that overloaded `new` method should be invoked. So if a view context is not instantiated using any explicit keyword args
    then it uses the default ones defined at https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/view/slice_configured_context.rb#L48-L51. So when
    `StartupTemplate::Views::Context` is attempted to be instantiated using `new` method that method should be passed the default keyword arguments. So that way in `StartupTemplate::Views::Context`
    instance in its options (see https://github.com/hanami/view/blob/main/lib/hanami/view/context.rb#L41) Hanami's `inflector`, `settings`, `routes` and `assets` options should be made
    available by default.

    Now when Hanami instantiates an Action using its `new` method  (which is overloaded at https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action/slice_configured_action.rb#L38)
    without any explicit arguments then by default the `view_context` arg should hold a Proc returned by `method(:resolve_view_context)` at https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action/slice_configured_action.rb#L34.
    *Note `method` is a method of Ruby API which returns a closure.*

    Then when Hanami's action processing should start invoking its `call` method at https://github.com/hanami/controller/blob/v2.0.0/lib/hanami/action.rb#L303 first its `build_response` method at https://github.com/hanami/controller/blob/v2.0.0/lib/hanami/action.rb#L314
    should get invoked. That method is overridden in hanami gem at https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action.rb#L85. So while building response for an action
    view_options containing the auto-registered view context is added to options for building the response. See following references:

    https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action.rb#L86
    https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action.rb#L104
    https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action.rb#L109

    and finally control is transferred to

    https://github.com/hanami/controller/blob/v2.0.0/lib/hanami/action.rb#L446

    which then instantiates Response object using its `new` method which should invoke following method

    https://github.com/hanami/controller/blob/v2.0.0/lib/hanami/action/response.rb#L51

    wherein `view_options` should be holding the auto-registered view context Proc instance.

    Then when action's response is attempted to be finished through action's `finish` method (see https://github.com/hanami/controller/blob/v2.0.0/lib/hanami/action.rb#L332)
    that `finish` version overloaded at https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action.rb#L91 is invoked which first invokes response's render method (see below)

    https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action.rb#L92
    https://github.com/hanami/controller/blob/v2.0.0/lib/hanami/action/response.rb#L87

    it should invoke the `view_options` Proc set as an instance variable while constructing the Response object.

    The invocation should transfer the control to https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action.rb#L104 which inturn should transfer the control to
    https://github.com/hanami/view/blob/main/lib/hanami/view/context.rb#L72.

    That `Hanami::View::Context#with`, whose `**new_options` arg should be holding `request` and `response` options (set by https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action.rb#L109 while rendering the response),
    that method (`with`) using the default `StartupTemplate::Views::Context` view context instance
    (which should be containing `inflector`, `settings`, `routes` and `assets` in its `_options`) create a new instance of `StartupTemplate::Views::Context` by adding additional
    `**new_options` to the `_options` of the new instance.

    So that way when https://github.com/hanami/controller/blob/v2.0.0/lib/hanami/action/response.rb#L87 invokes the `view` Proc it's `call` method at https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L561
    is passed `context` arg set to `StartupTemplate::Views::Context` instance.

* Method `app_route_path(route_name_sym:)`

  Instead of that custom method ideally `routes` method from `Hanami::Helpers` should be used for getting the path to a route but at the time of writing this
  following error was encountered when tried to use `routes.doctors_new_doctor_path`.

   ```
      undefined method `routes' for <AppName>:Module (NoMethodError)

      ..../helpers-d6147c3aabab/lib/hanami/helpers/routing_helper.rb:52:in `routes'
  ```

  Note: `hanami-helpers` gem compatible with Hanami version 2.0 is
  not yet released  at the time of writing this. Thus in our Gemfile
  we directly use the helpers code from the its repository's `main` branch.

  **References**

    * https://guides.hanamirb.org/v1.3/helpers/overview/#clean-context

* Additional adjustments were made in this with later developments. Following are the related sections in which the details about
  those adjustments can be found:

  * `StartupTemplate::Action`
  * `StartupTemplate::Views::Doctors::Create`
  * `StartupTemplate::Views::Doctors::Edit`

### `StartupTemplate::Views::Context` (`app/views/context.rb`)

  Without this in place views cannot access request, session, csrf etc in views.
  The need for this raised while trying to implement a form using `form_for` in view `StartupTemplate::Views::Doctors::New#new_doctor_form`
  method which when executed raised runtime error which when investigated found to be caused because of unable to obtain the csrf_token (to be added to the form)
  from the session. To be specific refer https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/form_helper.rb#L459 which was reported in the error trace
  to be causing the error.

  So the application's session is made available by this view-context. Regarding how that happens please refer the details under following section above

  ```
    Overridden `Hanami::View`'s `call` method as following

      References

        Automatic Instantiation of a custom view context and passing of that while rendering a view
  ```

### `StartupTemplate::Views::Doctors::Index` (`app/views/doctors/index.rb`)

* `expose :doctors`

  This view (`StartupTemplate::Views::Doctors::Index`) should be automatically rendered by `StartupTemplate::Actions::Doctors::Index`
  and that action exposes an Array of `StartupTemplate::Entities::Doctor` instances against key `doctors` (see details above under section `StartupTemplate::Actions::Doctors::Index`).
  That should be passed to `Hanami::View#call` method https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L561 in its `**input` arg
  so we expose that here directly based on the documentation at https://github.com/hanami/view/blob/main/docsite/source/exposures.html.md#accessing-the-context
  (refer section "Allow a matching value from the input data to pass through to the view" under that link)

  **References**

  **Automatic determination of a view by an Action**

    When an Action is instantiated by Hanami it should automatically determine the view to be rendered for that action.
    Regarding how that is done please refer following references:

      https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action/slice_configured_action.rb#L33
      https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action/slice_configured_action.rb#L40
      https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action/slice_configured_action.rb#L118

    As explained before under **Automatic Instantiation of a custom view context and passing of that while rendering a view** Hanami automatically registers
    added anything inside the `app` folder. So an action class should also get registered and while determining the view for an action
    the identifier for that view is determined which should be the key against an instance of the class extending `Hanami::View`. For e.g
    the view class `StartupTemplate::Views::Doctors::New` (`app/views/doctors/new.rb`) its instance should be auto-registered under the container against
    key `views.doctors.new` and when action `StartupTemplate::Actions::Doctors::New` is processed its view identifier should be determined as `views.doctors.new`
    and when that action's response is rendered the `call` method on the instance of the view, against that identifier, should be invoked. Following is the
    code that should be invoked in that execution chain:

    https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action/slice_configured_action.rb#L40
    https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action/slice_configured_action.rb#L118
    https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action.rb#L74
    https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/extensions/action.rb#L92
    https://github.com/hanami/controller/blob/v2.0.0/lib/hanami/action/response.rb#L88
    https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L561

### `StartupTemplate::Views::Doctors::New` (`app/views/doctors/new.rb`)

* Method `new_doctor_form`

  ```
    form_for(form_name, form_url, params: {}) do
      html.p do
        label("Name")

        text_field(:name)
      end
    end
  ```

  Above an empty Hash needed to be passed against `params` keyword.
  Not passing `params: {}` following error is encountered

  ```
    undefined method `params' for #<StartupTemplate::Views::Doctors::New config=#<Dry::Configurable::Config values={:paths=>[#<Hanami::View::Path dir=#<Pathname:.../app/templates> root=#<Pathname:.../app/templates>>], :template=>"doctors/new", :template_inference_base=>"views", :layout=>"application", :layouts_dir=>"layouts", :scope=>nil, :default_context=>#<Hanami::View::Context _options={}>, :default_format=>:html, :part_namespace=>nil, :part_builder=>Hanami::View::PartBuilder, :scope_namespace=>nil, :scope_builder=>Hanami::View::ScopeBuilder, :renderer_options=>{:default_encoding=>"utf-8", :escape_html=>false}, :renderer_engine_mapping=>nil, :inflector=>#<Dry::Inflector>}> exposures=#<Hanami::View::Exposures exposures={:layout_stylesheet_link_tags_string=>#<Hanami::View::Exposure name=:layout_stylesheet_link_tags_string proc=#<Method: StartupTemplate::Views::Doctors::New(StartupTemplate::View::Base)#layout_stylesheet_link_tags_string() .../app/view/base.rb:69> object=#<StartupTemplate::Views::Doctors::New config=#<Dry::Configurable::Config values={:paths=>[#<Hanami::View::Path dir=#<Pathname:.../app/templates> root=#<Pathname:.../app/templates>>], :template=>"doctors/new", :template_inference_base=>"views", :layout=>"application", :layouts_dir=>"layouts", :scope=>nil, :default_context=>#<Hanami::View::Context _options={}>, :default_format=>:html, :part_namespace=>nil, :part_builder=>Hanami::View::PartBuilder, :scope_namespace=>nil, :scope_builder=>Hanami::View::ScopeBuilder, :renderer_options=>{:default_encoding=>"utf-8", :escape_html=>false}, :renderer_engine_mapping=>nil, :inflector=>#<Dry::Inflector>}> exposures=#<Hanami::View::Exposures exposures={...}>> options={:layout=>true}>, :layout_script_tags_string=>#<Hanami::View::Exposure name=:layout_script_tags_string proc=#<Method: StartupTemplate::Views::Doctors::New(StartupTemplate::View::Base)#layout_script_tags_string() .../app/view/base.rb:75> object=#<StartupTemplate::Views::Doctors::New config=#<Dry::Configurable::Config values={:paths=>[#<Hanami::View::Path dir=#<Pathname:.../app/templates> root=#<Pathname:.../app/templates>>], :template=>"doctors/new", :template_inference_base=>"views", :layout=>"application", :layouts_dir=>"layouts", :scope=>nil, :default_context=>#<Hanami::View::Context _options={}>, :default_format=>:html, :part_namespace=>nil, :part_builder=>Hanami::View::PartBuilder, :scope_namespace=>nil, :scope_builder=>Hanami::View::ScopeBuilder, :renderer_options=>{:default_encoding=>"utf-8", :escape_html=>false}, :renderer_engine_mapping=>nil, :inflector=>#<Dry::Inflector>}> exposures=#<Hanami::View::Exposures exposures={...}>> options={:layout=>true}>, :new_doctor_form=>#<Hanami::View::Exposure name=:new_doctor_form proc=#<Method: StartupTemplate::Views::Doctors::New#new_doctor_form() .../app/views/doctors/new.rb:14> object=#<StartupTemplate::Views::Doctors::New config=#<Dry::Configurable::Config values={:paths=>[#<Hanami::View::Path dir=#<Pathname:.../app/templates> root=#<Pathname:.../app/templates>>], :template=>"doctors/new", :template_inference_base=>"views", :layout=>"application", :layouts_dir=>"layouts", :scope=>nil, :default_context=>#<Hanami::View::Context _options={}>, :default_format=>:html, :part_namespace=>nil, :part_builder=>Hanami::View::PartBuilder, :scope_namespace=>nil, :scope_builder=>Hanami::View::ScopeBuilder, :renderer_options=>{:default_encoding=>"utf-8", :escape_html=>false}, :renderer_engine_mapping=>nil, :inflector=>#<Dry::Inflector>}> exposures=#<Hanami::View::Exposures exposures={...}>> options={}>}>>

          @values      = Values.new(form.values, params || @context.params)
                                                                   ^^^^^^^ (NoMethodError)
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/form_helper/form_builder.rb:121:in `initialize'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/form_helper.rb:446:in `new'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/form_helper.rb:446:in `form_for'
    ...../app/views/doctors/new.rb:18:in `new_doctor_form'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/exposure.rb:83:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/exposure.rb:83:in `call_proc'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/exposure.rb:70:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/exposures.rb:53:in `block in call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/exposures.rb:50:in `each'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/exposures.rb:50:in `each_with_object'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/exposures.rb:50:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view.rb:598:in `locals'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view.rb:567:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action/response.rb:88:in `render'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.1/lib/hanami/extensions/action.rb:92:in `finish'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action/cookies.rb:23:in `finish'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action.rb:332:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.1/lib/hanami/slice/routing/resolver.rb:78:in `block in resolve_slice_action'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-router-2.0.1/lib/hanami/router.rb:108:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/rack/middleware.rb:36:in `block in call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/clock.rb:15:in `measure'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/rack/middleware.rb:36:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-router-2.0.1/lib/hanami/middleware/app.rb:40:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.1/lib/hanami/slice.rb:758:in `call'
  ```

   Checking the source code based on the trace, the `Hanami::View::Context` was not found to have a `params` method.
   Found reference for passing params at https://www.rubydoc.info/gems/hanami-helpers/Hanami/Helpers/FormHelper#form_for-instance_method

   Later the implementation of `new_doctor_form` was changed to following

  ```
    form_for(form_name, form_url, params: {}) do
      p do
        label("Name")

        text_field(:name)
      end
    end
  ```

   Note: `html.p` replaced with `p`. The reason that was done was the `p` tag was not getting included in the generated form markup. Investigating the
   hanami-helpers gem source code found the root cause as explained below:

   When invoking html.p inside `form_for` block it should not be evaluated in context of form_for.
   form_for returns an instance of `Hanami::Helpers::FormHelper::FormBuilder` which is a subclass of `Hanami::Helpers::HtmlHelper::HtmlBuilder`.
   Now `Hanami::Helpers::HtmlHelper::HtmlBuilder` by default has its html_node class attr set to `Hanami::Helpers::HtmlHelper::HtmlNode`
   (see https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/html_helper/html_builder.rb#L182).
   But when FormBuilder is instantiated `Hanami::Helpers::HtmlHelper::HtmlBuilder` class attr html_node used is `Hanami::Helpers::FormHelper::HtmlNode`
   because that is the one set for FormBuilder (see https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/form_helper/form_builder.rb#L82).
   So when we add any tag under `form_for` block like below

   ```
     form_for(form_name, form_url, params: {}) do
       p
     end
   ```

   that `p` tag node should be added to `Hanami::Helpers::FormHelper::FormBuilder`'s `@nodes` variable but that node should be an instance
   of `Hanami::Helpers::FormHelper::HtmlNode` (see https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/html_helper/html_builder.rb#L163).

   However if we add a tag in following manner:

   ```
     form_for(form_name, form_url, params: {}) do
       html.p
     end
   ```

   Then that `p` tag should not be added to `Hanami::Helpers::FormHelper::FormBuilder`'s `@nodes` because `html` should return an instance
   of `Hanami::Helpers::HtmlHelper::HtmlBuilder` (see https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/html_helper.rb#L206) and
   on it `p` method should be invoked (see https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/html_helper/html_builder.rb#L162).
   Now as said before `Hanami::Helpers::HtmlHelper::HtmlBuilder` has its class attr `html_node` set to `Hanami::Helpers::HtmlHelper::HtmlNode`.

   So `html.p` should add `p` tag node to `Hanami::Helpers::HtmlHelper::HtmlBuilder`'s `@nodes` variable and that node should be an instance of
   `Hanami::Helpers::HtmlHelper::HtmlNode`.

   So this is the reason why adding nodes using `html.<html_tag_name>` under `form_for` block they are not getting included in generated form markup.

   If you add this code

   ``
     form_for(form_name, form_url, params: {}) do
       html.p
     end
   ```

   and then add following debug statements in the beginning of `initialize` method in `Hanami::Helpers::HtmlHelper::HtmlNode`
   (https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/html_helper/html_node.rb#L24)

    ```
      puts ">>>>>> name: #{name}"
      puts ">>>>>> content: #{content}"
      puts ">>>>>> self class: #{self.class};; #{self.object_id}"
    ```

   and then accessing the action which should render a view executing above `form_for` code then in logs you should see something like following:

   ```
      >>>>>> name: form
      >>>>>> content: #<Proc:0x00007f3eea7eed68 ..../app/views/doctors/new.rb:22>
      >>>>>> self class: Hanami::Helpers::FormHelper::HtmlNode;; 7680
      >>>>>> name: p
      >>>>>> content: Something
      >>>>>> self class: Hanami::Helpers::HtmlHelper::HtmlNode;; 7700
   ```

   Its clear that for `form_for` which generates `form` node (see https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/form_helper/form_builder.rb#L140),
   in `Hanami::Helpers::HtmlHelper::HtmlNode` the runtime class for it should be `Hanami::Helpers::FormHelper::HtmlNode` because for `Hanami::Helpers::FormHelper::FormBuilder`
   instance the nodes added to its `@nodes` variable should be of type `Hanami::Helpers::FormHelper::HtmlNode`.

   Similarly for `html.p` which should generate `p` node, in `Hanami::Helpers::HtmlHelper::HtmlNode` the runtime class for it should be `Hanami::Helpers::HtmlHelper::HtmlNode`
   because for `Hanami::Helpers::HtmlHelper::HtmlBuilder` instance the nodes added to its `@nodes` variable should be of type `Hanami::Helpers::HtmlHelper::HtmlNode`.

   Additional References:
     https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/form_helper.rb#L353

* Additional adjustments were made in this with later developments. Following are the related sections in which the details about
  those adjustments can be found:

  * `StartupTemplate::Views::Doctors::Create`
  * `StartupTemplate::Views::Doctors::Edit`

* Hanami Helpers runtime flow:

  Assuming we define a markup like following using hanami helpers

    ```
      form node; content block;
        p node; content block
          label node content string
    ```

  following should be the flow:

    ```
      FormBuilder when initialized from form_for. Let's say object_id assigned to this FormBuilder instance is FF-FB-1.
        @nodes = [] (in HtmlBuilder)

      FF-FB-1 FormBuilder when to_s invoked
        1. form(@blk, @attributes) - this should add a form node to FF-FB-1 FormBuilder's  @nodes and that form node's content should be block
           and that form node should be an instance of FormHelper::HtmlNode. Let's say this instance is assigned object_id Form-HN-1.
           This Form-HN-1 instance should have its @builder set to a new FormBuilder instance (ref: FormHelper::HtmlNode#initialize at L32).
           Let's say object_id assigned to this FormBuilder instance is Form-HN-1-FB-1.

        2. super - this should invoke to_s in HtmlBuilder. That should internally invoke `@nodes.map(&:to_s).join(NEWLINE)`. At this point @nodes contains only just 1 node which is Form-HN-1.

        Form-HN-1 node should invoke its to_s which inturn should invoke its super class HtmlHelper::HtmlNode's to_s which contains `%(#{super}#{content}</#{@name}>)`. As part of that

        3. super should be invoked which should call EmptyHtmlNode's to_s which contains `%(<#{@name}#{attributes}>)`.
           So super should return `<form [form attrs here if any]>`. For brevity purpose lets assume it returns `<form>` string.

        4. content method should be invoked which is a private method in HtmlHelper::HtmlNode.

           4.1 This method checks if instance var @content is a Proc? In our Form-HN-1 node case yes it is.
               So it should run `result = @builder.resolve(&@content)`. `@builder` is Form-HN-1-FB-1 FormBuilder.
               So the @content block should be run in context of Form-HN-1-FB-1. Now let's say @content block contains following code:

               p do
                label("Name")
               end

               So that should invoke p on Form-HN-1-FB-1 FormBuilder instance.
               That invocation should end up at p method dynamically defined under `CONTENT_TAGS` loop at L162 in FormBuilder's superclass HtmlBuilder.
               The p method should create an instance of FormHelper::HtmlNode and its content should be a block. Let's say this instance is assigned object_id P-HN-1.
               This P-HN-1 instance should have its @builder set to a new FormBuilder instance. Let's say object_id assigned to this FormBuilder instance is P-HN-1-FB-1.
               This P-HN-1 instance should be added to Form-HN-1-FB-1's @nodes. Then p method should return Form-HN-1-FB-1 FormBuilder instance.

               # [ Update: I think following evaluation regarding assignment to `result` var is incorrect. `HtmlBuilder#resolve` should return what am not sure. ]
               # So at this point in content method `result` variable should be assigned Form-HN-1-FB-1 FormBuilder instance i.e. following should be the case `result = Form-HN-1-FB-1`.

               Now next content method should run `if @builder.nested?` (i.e. `Form-HN-1-FB-1.nested?`). `nested?` method is defined in HtmlBuilder and its implementation is

                ```
                  def nested?
                    @nodes.any?
                  end
                ```

               So `Form-HN-1-FB-1.nested?` should return true because its @nodes contains P-HN-1.
               So the content method should return `"\n#{@builder}\n"` i.e. "\n#{Form-HN-1-FB-1.to_s}\n".

               So now Form-HN-1-FB-1 FormBuilder's `to_s` should be invoked whose implementation is

                ```
                  def to_s
                    if toplevel?
                      _method_override!
                      form(@blk, @attributes)
                    end

                    super
                  end

                  def toplevel?
                    @attributes.any?
                  end
                ```

               Now FormBuilder instantiated by `FormHelper::HtmlNode#initialize` in following manner:

                ```
                  @builder = FormBuilder.new(
                    options.fetch(:name),
                    options.fetch(:values)
                  )
                ```

               Now `FormBuilder#initialize` method implementation is following:

                ```
                  def initialize(form, attributes, context = nil, params = nil, &blk)
                    super()

                    @context    = context
                    @blk        = blk
                    @verb       = nil
                    @csrf_token = nil

                    # Nested form
                    if @context.nil? && attributes.is_a?(Values)
                      @values      = attributes
                      @attributes  = {}
                      @name        = form
                    else
                      @form        = form
                      @name        = form.name
                      @values      = Values.new(form.values, params || @context.params)
                      @attributes  = attributes
                      @verb_method = verb_method
                      @csrf_token  = csrf_token
                    end
                  end
                ```

               As per that when FormBuilder is instantiated by `FormHelper::HtmlNode#initialize`, `context` arg passed to `FormBuilder#initialize` method should be nil.
               `options.fetch(:values)` (from `FormHelper::HtmlNode#initialize`) passed to `attributes` arg of `FormBuilder#initialize` should be of type `Values`  then
               `if @context.nil? && attributes.is_a?(Values)` should evaluate, else `else`. In present use-case `else` should execute and thus
               Form-HN-1-FB-1's `@attributes` should be empty.

               Thus in Form-HN-1-FB-1 FormBuilder's `to_s` `toplevel?` should return false and hence `super` should be invoked.

               super should invoke to_s in HtmlBuilder. That should internally invoke `@nodes.map(&:to_s).join(NEWLINE)`. At this point @nodes contains only just 1 node which is P-HN-1.
               P-HN-1 node should invoke its to_s which inturn should invoke its super class HtmlHelper::HtmlNode's to_s which contains `%(#{super}#{content}</#{@name}>)`. As part of that

               5. super should be invoked which should call EmptyHtmlNode's to_s which contains `%(<#{@name}#{attributes}>)`.
                  So super should return `<p [p attrs here if any]>`. For brevity purpose lets assume it returns `<p>` string.

               6. content method should be invoked which is a private method in HtmlHelper::HtmlNode.

                  6.1 This method checks if instance var @content is a Proc? In our P-HN-1 node case yes it is.
                      So it should run `result = @builder.resolve(&@content)`. `@builder` is P-HN-1-FB-1 FormBuilder.
                      So the @content block should be run in context of P-HN-1-FB-1. Now let's say @content block contains following code:

                      label("Name")

                      So that should invoke label on P-HN-1-FB-1 FormBuilder instance.
                      That invocation should end up at label method dynamically defined under `CONTENT_TAGS` loop at L162 in FormBuilder's superclass HtmlBuilder.
                      The label method should create an instance of FormHelper::HtmlNode and its content should be a string "Name" and NOT a block.
                      Let's say this instance is assigned object_id L-HN-1.
                      This L-HN-1 instance should have its @builder set to a new FormBuilder instance. Let's say object_id assigned to this FormBuilder instance is L-HN-1-FB-1.
                      This L-HN-1 instance should be added to P-HN-1-FB-1's @nodes. Then label method should return P-HN-1-FB-1 FormBuilder instance.

                      # [ Update: I think following evaluation regarding assignment to `result` var is incorrect. `HtmlBuilder#resolve` should return what am not sure. ]
                      # So at this point in content method `result` variable should be assigned P-HN-1-FB-1 FormBuilder instance i.e. following should be the case `result = P-HN-1-FB-1`.

                      Now next content method should run `if @builder.nested?` (i.e. `P-HN-1-FB-1.nested?`).  That should return true
                      because P-HN-1-FB-1's @nodes contains L-HN-1.

                      So the content method should return `"\n#{@builder}\n"` i.e. "\n#{P-HN-1-FB-1.to_s}\n".

                      So now P-HN-1-FB-1 FormBuilder's `to_s` should be invoked. Since the P-HN-1-FB-1 FormBuilder's @context and @attributes should be nil
                      in P-HN-1-FB-1 FormBuilder's `to_s` `toplevel?` should return false and hence `super` should be invoked.

                      super should invoke to_s in HtmlBuilder. That should internally invoke `@nodes.map(&:to_s).join(NEWLINE)`. At this point @nodes contains only just 1 node which is L-HN-1.
                      L-HN-1 node should invoke its to_s which inturn should invoke its super class HtmlHelper::HtmlNode's to_s which contains `%(#{super}#{content}</#{@name}>)`. As part of that

                      7. super should be invoked which should call EmptyHtmlNode's to_s which contains `%(<#{@name}#{attributes}>)`.
                         So super should return `<label [label attrs here if any]>`. For brevity purpose lets assume it returns `<label>` string.

                      8. content method should be invoked which is a private method in HtmlHelper::HtmlNode.

                         8.1 This method checks if instance var @content is a Proc? In our L-HN-1 node case no it is not a Proc, it is a String.
                             So it should run `Utils::Escape.html(@content)` which should return "Name".

                             So at this point

                             L-HN-1 node's `to_s` should return `"<label>Name</label>"`

                             and

                             P-HN-1-FB-1 FormBuilder's `to_s` should return `"<label>Name</label>\n"`

                                  AND THEN

                             P-HN-1 node's `to_s` should return `"<p>\n<label>Name</label>\n\n</p>"`

                             and

                             Form-HN-1-FB-1 FormBuilder's `to_s` should return `"<p>\n<label>Name</label>\n\n</p>\n"`

                                  AND THEN

                             Form-HN-1 node's `to_s` should return `"<form>\n<p><label>Name</label>\n</p>\n\n</form>"`

                             and

                             FF-FB-1 FormBuilder's `to_s` should return `"<form>\n<p><label>Name</label>\n</p>\n\n</form>\n"`
    ```

### `StartupTemplate::Action` (`app/action.rb`)

* `set_flash_message(response:, key:, message:, is_for_redirect_request: false)` method:

  * Initially defined following private method

  ```
    def expose_flash_message(response:, key:, message:)
      response[key] = message
    end
  ```

   and used that method in a desired action and it did worked as in the defining `expose :<key>`  in view class, corresponding to the action,
   and using that exposed method in the view's template, the flash message did appeared.

   However when used that to set a flash message before a `response.redirect_to <path>` was done in an action, the flash didn't appeared.
   And to address that limitation the idea which came to my mind is setting the message in session and after rendering it in the view template
   remove that message from session.

   Then after few hours I was wondering how come there is not a readily available flash container which can work for redirects as well?

   So I looked over the tests under https://github.com/hanami/controller/tree/v2.0.1/spec/integration/hanami/controller
   and found that there is a spec for flash (see https://github.com/hanami/controller/blob/v2.0.1/spec/integration/hanami/controller/flash_spec.rb).
   So I searched for `flash` in github repo https://github.com/hanami/controller and found following `res.flash[:error] = "ouch"`
   in https://github.com/hanami/controller/blob/v2.0.1/spec/support/fixtures.rb. So that way I came to know that flash can be set on `response` object in an action.

   So I replaced the above shown `expose_flash_message` method with following:

    ```
      def set_flash_message(response:, key:, message:, is_for_redirect_request: false)
        if !!is_for_redirect_request
          response.flash[key] = message
        else
          response.flash.now[key] = message
        end
      end
    ```

  *Note: In case wondering why for redirect request `flash` is used and why for normal request `flash.now` is used, then
  refer https://github.com/hanami/controller/blob/v2.0.1/lib/hanami/action/session.rb#L36. That module is included by hanami
  while extending behaviour for an action class (see https://github.com/hanami/hanami/blob/v2.0.2/lib/hanami/extensions/action/slice_configured_action.rb#L104).
  Thus when an action's `finish` method is invoked (see https://github.com/hanami/hanami/blob/v2.0.2/lib/hanami/extensions/action.rb#L91)
  the finish method overridden in https://github.com/hanami/controller/blob/v2.0.1/lib/hanami/action/session.rb should also get invoked. Also see
  https://github.com/hanami/controller/blob/v2.0.1/lib/hanami/action/response.rb#L201, https://github.com/hanami/controller/blob/2e025d26c3fbfbf64a641d928baaac279ed7872e/lib/hanami/action/request.rb#L78.*


  Now the next question was how to access the flash hash, set on response, in a view? Solved that in following manner:

  Updated `StartupTemplate::View::Base` by adding following private method

    ```
      def flash
        view_context.flash
      end
    ```

  That's because hanami makes available the flash hash, set in response, in view context . Refer
  https://github.com/hanami/hanami/blob/v2.0.2/lib/hanami/extensions/view/context.rb#L89.

  So now the only thing we need to do is expose this flash hash for usage in view template. So we added following
  in `StartupTemplate::View::Base`:

  ```
    expose :flash, layout: true
  ```

  and then in `app/templates/layouts/application.html.haml` added following as the first thing under `body` tag.

    ```
      - unless flash.empty?
        .flash-container<
          - flash.each do |flash_type, message|
            %h3{ class: flash_type }<
              = message
    ```


* `transform_errors_hash_to_error_messages(errors_hash:)` method:

  * This method is intended to transform any error messages reported by a business transaction (for e.g. refer `StartupTemplate::BusinessTransactions::CreateDoctor`)
    when invoking it from an Action class (for e.g. refer `StartupTemplate::Actions::Doctors::Create`).

### `StartupTemplate::BusinessTransactions::CreateDoctor` (`lib/startup_template/business_transactions/create_doctor.rb`)

* This class encapsulates the business logic to create a Doctor record. This is implemented using `dry-transaction` gem.
  Reference: https://dry-rb.org/gems/dry-transaction/0.13/basic-usage/#defining-a-transaction-with-local-operations.

  Note: In Hanami 1.3 for the purpose of encapsulating business log Service Objects or Interactors (https://guides.hanamirb.org/v1.3/architecture/interactors/)
  are preferred however they are not supported in Hanami 2.0. Refer https://github.com/hanami/utils/issues/401.
  That github issue suggests using dry-transaction gem (see https://github.com/hanami/utils/issues/401#issuecomment-1194341786).
  So accordingly we use dry-transaction for implementing our business logic.

* `validate(input)` method (this gets included from `StartupTemplate::BusinessTransactions::CreateEditDoctor::Helpers` included in this class ):

  * Notice the `to_monad` invocation on the result returned by the Validation contract `StartupTemplate::BusinessTransactions::CreateDoctorSteps::Validate`
    class. Each step in a dry-transaction must return an output wrapped in a `Success` or `Failure` (refer:
    https://dry-rb.org/gems/dry-transaction/0.13/basic-usage/#defining-a-transaction-with-local-operations)
    and by default the `call` method on a dry-validation contract returns an instance of `Dry::Validation::Result`.
    Thus to convert it to `Success` or `Failure` which is facilitated by `dry-monads` the `to_monad` method is invoked
    on the dry-validation contract result. Refer details for `StartupTemplate::BusinessTransactions::CreateDoctorSteps::Validate`
    ahead.

* `create(input, doctor_repo:)` method:

  * Note: `doctor_repo` is an supposed to be passed from an Action class from where this business transaction class should be invoked.
    Thus it is faciliated using the provision for passing additional arguments for a step while calling a transaction.
    Reference: https://dry-rb.org/gems/dry-transaction/0.13/basic-usage/#passing-additional-step-arguments

  * Returns Doctor record wrapped in `Success` which is facilitated by `Result` mixin provided by `dry-monads` gem. Refer
    https://dry-rb.org/gems/dry-monads/1.3/result/ for more details.

### `StartupTemplate::BusinessTransactions::CreateEditDoctor::Step::Validate` (`lib/startup_template/business_transactions/create_edit_doctor/step/validate.rb`)

* `Dry::Validation.load_extensions(:monads)`

  * That is required so that after invoking this validator its result can be compatible with `dry-monads` (ref: https://dry-rb.org/gems/dry-monads/1.3).
    Refer details under `StartupTemplate::BusinessTransactions::CreateDoctor` above.

  * Reference: https://dry-rb.org/gems/dry-validation/1.8/extensions/#monads.

* `:stripped_string` in `params` block is a custom dry-type which is defined in `lib/startup_template/types.rb`
  and registered in `Dry::Schema::TypeContainer` by file `lib/startup_template/type_container.rb`.

### `StartupTemplate::Actions::Doctors::Create` (`app/actions/doctors/create.rb`)

* `create_doctor(input_hash, response)`

  * This method calls the business transaction `StartupTemplate::BusinessTransactions::CreateDoctor`.
    Note how the transaction's result is handled in a block passed.

    References followed to make this work:
      https://dry-rb.org/gems/dry-transaction/0.13/basic-usage/#passing-additional-step-arguments
      https://dry-rb.org/gems/dry-transaction/0.13/basic-usage/#calling-a-transaction

### `StartupTemplate::Views::Doctors::Create` (`app/views/doctors/create.rb`)

* Initially this view class extended `View::Base` and the `config.template` for this view was set as `"doctors/new"` which is the template implemented for
  view `StartupTemplate::Views::Doctors::New`. The reason being when `StartupTemplate::Actions::Doctors::Create` encounters any validation error then that
  action's corresponding view which is `StartupTemplate::Views::Doctors::Create` should render the same page shown when manually initiating "New Doctor"
  workflow which should render the view `StartupTemplate::Views::Doctors::New` but with the valid values pre-filled in the form on the page and the validation
  errors encountered.

  However just setting the `config.template = "doctors/new"` didn't worked because the template uses `new_doctor_form`  which is exposed by
  view class `StartupTemplate::Views::Doctors::New`. So made this view class extend `New`. So this way made the "New Doctor" form render
  *again* when validation errors were encountered by the action `StartupTemplate::Actions::Doctors::Create` to which the request is sent to
  when submitting the New Doctor form.

  It should be noted that after extending this view class from `New` the `config.template` option needed to be explicitly set.
  despite the fact that the view inherits `New` and that already has `config.template = "doctors/new"`. But not setting the
  `config.template` in this view class the error "template not found" was encountered.
  It is interesting to note that exposures (i.e. `new_doctor_form`) gets inherited but template not.

  Coming back:

  However one more problem remained: When few of the values entered on the form were valid and few invalid then when this view shown the
  "New Doctor" form again then the valid values were not shown as pre-filled in the form. The root cause behind it was found to be in
  following line

  ```
    form_for(form_name, form_url, params: {})
  ```

  wherein `params` is passed as an empty Hash (regarding why that was the case please refer details for view class `StartupTemplate::Views::Doctors::New`
  above).

  So the obvious solution is to pass the request params to the `params` option supported by `form_for` helper.
  So did following

  ```
    form_for(form_name, form_url, params: params)
  ```

  and in `StartupTemplate::View::Base` added following

    ```
      expose :params
    ```


  The `expose :params` solution was based on following documentation at https://github.com/hanami/controller/tree/main#exposures

  >By default, an action exposes the received params.

  But actually that didn't worked and following error was encountered that

  ```
    undefined local variable or method `params' for #<StartupTemplate::Views::Doctors::New....>
  ```

  Exploring the source code found that while rendering the response the request params are passed to `Response#render` method

      https://github.com/hanami/hanami/blob/v2.0.2/lib/hanami/extensions/action.rb#L92
      https://github.com/hanami/controller/blob/v2.0.1/lib/hanami/action/response.rb#L87-L89

  but as can be seen in render method implementation (https://github.com/hanami/controller/blob/v2.0.1/lib/hanami/action/response.rb#L87-L89)
  following is there `**exposures.merge(options)` which means request params are added to `exposures` hash but not under the key `params`
  and accordingly `expose :params` should not work based on documentation at https://github.com/hanami/view/blob/main/docsite/source/exposures.html.md#accessing-input-data.

  However exploring the source code more above understanding (i.e. *request params are added to `exposures` hash but not under the key `params`*)
  proved wrong because `params` gets added to Action's exposures by following line https://github.com/hanami/controller/blob/v2.0.1/lib/hanami/action.rb#L594.
  Then how come it is unavailable if defining `expose :params` in `StartupTemplate::View::Base`?
  I think that's because that syntax (i.e. `expose :<name>`) exposes only the input data received by the view (see https://github.com/hanami/view/blob/main/docsite/source/exposures.html.md#accessing-input-data)
  and `params` exposed through response is not available as input data in the view. So we should access the params through the request or
  response and those (request and response) are made available, through view context, in `StartupTemplate::View::Base`. So the idea worked by doing following changes:

  Added following private method in `StartupTemplate::View::Base`

    ```
      def params
        request.params
      end
    ```

   After doing that when "New Doctor" form was submitted with only Name field filled, then when the form was rendered again
   with validation errors shown, the Name field was pre-filled.


 Later it was found that if one of the required param say `param_1` value contained leading and trailing whitespaces like '   my_value  ' and another required param say `param_2`
 value was not set then the validation errors were shown on the form page and the params value received were shown as prefilled but they were set as it is for e.g. param_1 value was
 set in form field as '   my_value  ', instead of 'my_value'. To solve this problem in `new_doctor_form` method in view `StartupTemplate::Views::Doctors::New` which this view
 (`StartupTemplate::Views::Doctors::Create`) extends the desired fields values `value` attribute was set. In other words

  ```
   text_field(:name)
  ```

  was replaced with

   ```
     name_param_name = :name
     text_field(name_param_name, value: strip_param_value( _value(name_param_name) ) )
   ```

  That `_value` method belongs to `Hanami::Helpers::FormHelper::FormBuilder`(https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/form_helper/form_builder.rb#L1633)
  whose instance is returned by `form_for` method to which a block is passed and in which the `text_field` method shown above is used.

### `StartupTemplate::Views::Doctors::Edit` (`app/views/doctors/edit.rb`)

* This view extends `New` (`StartupTemplate::Views::Doctors::New`) because this view should show the same page render the same page shown when manually initiating "New Doctor"
  workflow but with an exception that the form should be prefilled with the details of a Doctor record which needs to be edited.

  So the first thing required for showing this view was to first show a Edit link against each available Doctor record shown on the page rendered by view
  `StartupTemplate::Views::Doctors::Index` and clicking that link this view should be rendered.

  So first I introduced the Doctor's Edit route in `config/routes.rb` like following

  ```
    get "/:id/edit", to: "doctors.edit", as: :edit_doctor
  ```

  and then introduced the corresponding action class `StartupTemplate::Views::Doctors::Edit` (`app/actions/doctors/edit.rb`)

  Then I started work on updating view `StartupTemplate::Views::Doctors::Index` to show the Edit link against each existing Doctor.
  Now instead of hardcoding link markup and doctor edit path in the view template, like `%a{ href: '/doctors/<DOCTOR_ID>/edit' }`,
  the idea was to generate that link markup using Hanami Helpers (https://github.com/hanami/helpers) like we have added `new_doctor_link` method in
  `StartupTemplate::Views::Doctors::Index`. So I took the similar approach used for using `new_doctor_link` method in the view template i.e. I added

  ```
    expose :edit_doctor_link

    ...
    ...

    def edit_doctor_link(doctor_id:)
      link_path = app_route_path(route_name_sym: :doctors_edit_doctor)
      link_name = 'Edit Doctor'

      link_to( link_path, class: 'edit-doctor' ) do
        button(link_name)
      end
    end
  ```

  So while implementing `edit_doctor_link` method I realized that I will need the doctor's ID to be passed to the exposed method. So that
  raised a question that how to expose a method accepting arguments. So based on the Exposures documentation at https://github.com/hanami/view/blob/main/docsite/source/exposures.html.md
  initiated a trial and error with following 3 styles of defining exposures with arguments:

  ```
    # approach: required normal argument approach
    expose :test_method_1 do |name|
      test_m(name)
    end

    # approach: keyword argument with default value
    expose :test_method_2 do |name: nil|
      test_m(name)
    end

    # approach: required keyword argument approach
    expose :test_method_3 do |name:|
      test_m(name)
    end

    private

    def test_m(name)
      "Received name:  #{name}"
    end
  ```

  and tried invoking that exposure in view template `app/templates/doctors/index.html.haml` like

  ```
  %div
    = test_method_1('Jignesh')
    = test_method_2(name: 'Jignesh')
    = test_method_1(name: 'Jignesh')
  ```

  but none of those worked and shown errors like missing argument etc. I guess it didn't worked
  because as per the Exposures documentation if any arguments are set for it then they should be
  received in the input data passed to the view's `#call` method (ref: https://github.com/hanami/view/blob/main/docsite/source/exposures.html.md#accessing-input-data)
  which should be forwarded to the exposure when invoked from view template. But in our case we manually pass the value 'Jignesh' for the name argument from the template
  itself to exposed method invoked from template and thus those exposures doesn't satisfy the API contract for Exposures (in other words the data passed to them are not
  from the input data received by view's call method).

  So tried exploring the Hanami View source code (https://github.com/hanami/view) to figure out a way to make the `test_method_1('Jignesh')` invocation, from the tenplate, work
  but couldn't succeed and decided to seek input from the Hanami community. But while exploring the source code I found at at https://github.com/hanami/view/blob/main/lib/hanami/view/part.rb#L15
  that Hanami View is actually based on Dry View (https://dry-rb.org/gems/dry-view/0.7/). So exploring https://dry-rb.org/gems/dry-view/0.7/ noticed that the documentation
  under https://github.com/hanami/view/tree/main/docsite/source is an almost clone of documentation under https://github.com/dry-rb/dry-view/tree/main/docsite/source.

  So I decided to seek help instead of `dry-rb` community. So I posted my question at https://discourse.dry-rb.org/t/dry-view-how-to-define-a-helper-method-with-an-arg-in-view-class-which-can-be-invoked-from-view-template/1596
  and based on the answer received in https://discourse.dry-rb.org/t/dry-view-how-to-define-a-helper-method-with-an-arg-in-view-class-which-can-be-invoked-from-view-template/1596/2?u=jignesh
  to define that desired helper method in view's Context class and it should work. So to understand how defining the helper method invocation should end up finding
  itself in Context class I started exploring the Hanami View source code and following are my findings:

  So I started checking out `Hanami::View#call` method implementation and found following lines at https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L564)

  ```
    env = self.class.render_env(format: format, context: context)
    template_env = self.class.template_env(format: format, context: context)
  ```

  `render_env` is a class method defined at https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L473
  which returns an instance of `Hanami::View::RenderEnvironment` (https://github.com/hanami/view/blob/main/lib/hanami/view/render_environment.rb)

  A template's output is generated by following line (see https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L568)

  ```
  output = env.template(config.template, template_env.scope(config.scope, locals))
  ```

  Since `env` should be an instance of `Hanami::View::RenderEnvironment` its `template` method at https://github.com/hanami/view/blob/main/lib/hanami/view/renderer.rb#L28
  should be invoked. Note how that `template` method requires a `scope` arg which when passed from `Hanami::View#call` should be the result of `template_env.scope(config.scope, locals)`
  (see https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L568).

  So let's now check what does that `scope` arg should hold?

  `template_env` (in `Hanami::View#call`) should be an instance of `Hanami::View::RenderEnvironment`. So `template_env.scope(config.scope, locals)` should invoke
  `scope` method on `Hanami::View::RenderEnvironment` (see https://github.com/hanami/view/blob/main/lib/hanami/view/render_environment.rb#L39).

  Now let's first take a look at what the first arg (passed as `config.scope`) should hold.

  Unless `config.scope` explicitly set for a view class it should be by default set to nil.
  So `template_env.scope(config.scope, locals)` should get invoked at runtime as `template_env.scope(nil, locals)`.

  Now the `Hanami::View::RenderEnvironment#scope method should invoke `scope_builder.(name, locals)`. Now the `scope_builder` is set by `Hanami::View::RenderEnvironment.prepare` method
  in following manner (see https://github.com/hanami/view/blob/main/lib/hanami/view/render_environment.rb#L14)

  ```
    scope_builder: config.scope_builder.new(namespace: config.scope_namespace),
  ```

  The `config` arg of `prepare` method is passed by class method `Hanami::View.render_env` (see https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L474).
  Now `config.scope_builder` unless explicitly set for a view class it should be an instance of `Hanami::View::ScopeBuilder` (see https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L185).

  So `config.scope_builder.new` should return an instance of `Hanami::View::ScopeBuilder` (see https://github.com/hanami/view/blob/main/lib/hanami/view/scope_builder.rb).

  And on `Hanami::View::RenderEnvironment instance `scope_builder` attribute gets set in following manner (see https://github.com/hanami/view/blob/main/lib/hanami/view/render_environment.rb#L27)

  ```
    @scope_builder = scope_builder.for_render_env(self)
  ```

  which should internally invoke `Hanami::View::ScopeBuilder#for_render_env` with its arg `render_env` passed the `self` which should be the `Hanami::View::RenderEnvironment` instance
  being instantiated by `Hanami::View::RenderEnvironment.prepare` method.

  So `template_env.scope(nil, locals)` (in `Hanami::View#call`) should internally invoke `Hanami::View::ScopeBuilder#call` with its args as `nil, locals`.

  Now let's see what `Hanami::View::ScopeBuilder#call` (https://github.com/hanami/view/blob/main/lib/hanami/view/scope_builder.rb#L49) should return
  for those arguments.

  First of all it determines the scope_class (see https://github.com/hanami/view/blob/main/lib/hanami/view/scope_builder.rb#L50)
  Since the `name` arg is received as `nil` `scope_class` method should return `Scope` (see https://github.com/hanami/view/blob/main/lib/hanami/view/scope_builder.rb#L63)
  which should be resolved as `Hanami::View::Scope` (see https://github.com/hanami/view/blob/c1a6f60a989f1face809a6d8d61652748aee19a7/lib/hanami/view/scope.rb).

  So the `Hanami::View::ScopeBuilder#call` should return an instance of `Hanami::View::Scope`.

  So `template_env.scope(config.scope, locals)` (in `Hanami::View#call`) should return an instance of `Hanami::View::Scope`
  Consequently `Hanami::View::RenderEnvironment#template` method's `scope` arg should hold an instance of `Hanami::View::Scope`.

  Now `Hanami::View::RenderEnvironment#template` internally invokes following (see https://github.com/hanami/view/blob/main/lib/hanami/view/render_environment.rb#L44)

  ```
    renderer.template(name, scope, &block)
  ```

  Now the `renderer` is set by `Hanami::View::RenderEnvironment.prepare` method in following manner (see https://github.com/hanami/view/blob/main/lib/hanami/view/render_environment.rb#L11)

  ```
   renderer: renderer,
  ```

  The `renderer` arg of `prepare` method is passed by class method `Hanami::View.render_env` (see https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L474).

  Now let's see what does that `renderer` arg should hold?

  The `renderer` arg for `Hanami::View::RenderEnvironment.prepare` method is passed as `renderer(format)` (see https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L474).
  which should invoke the class method `Hanami::View.renderer` (see https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L508). That class method
  should return an instance of `Hanami::View::Renderer` (see https://github.com/hanami/view/blob/main/lib/hanami/view/renderer.rb)

  So `Hanami::View::RenderEnvironment#template` should invoke `Hanami::View::Renderer#template` (see https://github.com/hanami/view/blob/main/lib/hanami/view/renderer.rb#L28)
  wherein `scope` arg should be instance of `Hanami::View::Scope`. This scope is then passed to `Tilt#render` method (see https://github.com/hanami/view/blob/main/lib/hanami/view/renderer.rb#L32
  and https://github.com/hanami/view/blob/main/lib/hanami/view/renderer.rb#L49).

  So I thought that any ruby methods used in the template should be resolved by the `Hanami::View::Scope` so now we should check its implementation.
  And there I found `method_missing(name, *args, &block)` implemented (see https://github.com/hanami/view/blob/main/lib/hanami/view/scope.rb#L152)
  which checks `_context.respond_to?(name)`.

  So this way the ruby method used in the template should be looked up in view's Context class and if found then it should get invoked.

  Now one last question remains that how the view's Context is made available in `Hanami::View::Scope` class?

  It is through the `_context` method defined in that class (see https://github.com/hanami/view/blob/main/lib/hanami/view/scope.rb#L140)
  which internally invokes `_render_env.context`. So now what the `_render_env` should be holding in the instance of `Hanami::View::Scope` under talk?
  It is the instance of `Hanami::View::RenderEnvironment` passed to `render_env` arg of `Hanami::View::Scope#initialize` method by `Hanami::View::ScopeBuilder#call`
  which gets invoked by `template_env.scope(config.scope, locals)` invoked from `Hanami::View#call`.

  Considering the above workflow finally I thought that it is better to define a Scope class for a particular view instead of adding
  the helper methods specific for that view to view's Context class which ideally should be same for every view class defined.

  So I decided to try out implementing a custom Scope class based on the documentation added on the class method `Hanami::View.scope` (see https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L454)
  and as part of that initially I did following:

  Defined following in `StartupTemplate::Views::Doctors::Index`

  ```
    scope do
      def edit_doctor_link(doctor_id:)
        link_path = app_route_path(route_name_sym: :doctors_edit_doctor)
        link_name = 'Edit'

        link_to( link_path, class: 'edit-doctor' ) do
          button(link_name)
        end
      end
    end
  ```

  and updated the view template by invoking `edit_doctor_link(doctor_id:)` and it did got invoked but
  errors were raised for `app_route_path` method not found. That method is actually defined in `StartupTemplate::View::Base`
  so ideally it is expected to be available in view class `StartupTemplate::Views::Doctors::Index` which extends
  `StartupTemplate::View::Base`. Then how come it was not found? To figure that out I checked the `Hanami::View.scope`
  class method implementation at https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L454 and found that
  it should return an instance of `Hanami::View::Scope`. So obviously the methods defined in `StartupTemplate::View::Base`
  should not be available in instance of `Hanami::View::Scope`. So thinking about a solution regarding how to make
  the `Hanami::View::Scope` use the desired methods defined in `StartupTemplate::View::Base` I could think of following options:

   1. We move the `edit_doctor_link(doctor_id:)` method to our view's Context class `StartupTemplate::Views::Context` (`app/views/context.rb`).

   2. Define a custom scope class and inject the view instance (which should have the `app_route_path` method available) as a dependency in it.

   3. In the custom scope class include the hanami helpers and other desired methods which are defined in `StartupTemplate::View::Base`.
      and which are intended to be used by custom scopes.

  For the 1st option checking out the Context class realized that there too the method `app_route_path` should not be available because the Context class
  extends from `Hanami::View::Context`. Also the hanami helper `link_to` should be unavailable in Context class because that too is defined in `StartupTemplate::View::Base`.

  For the 2nd option a question raised in my mind that whether is that even possible? Would be it practical or correct approach?

  Finally the 3rd option looked the most appropriate to me. So I started working on implementing in following manner:

  Created file `app/view/common_helpers.rb` and added following content to it

    ```
    require 'hanami/helpers'

    module StartupTemplate
      module View
        module CommonHelpers
          include Hanami::Helpers

          private

          def app_route_path(route_name_sym:, **route_args)
            Hanami.app["routes"].path(route_name_sym, route_args)
          end

        end
      end
    end
    ```

  Then in `StartupTemplate::View::Base` made following modifications

  ** removed `require 'hanami/helpers'`

  ** replaced `include Hanami::Helpers` WITH `include CommonHelpers`

  ** removed method `app_route_path(route_name_sym:)`

  ** created file `app/view/scope.rb` and added following content to it

  ```
    # auto_register: false
    # frozen_string_literal: true

    require 'hanami/view/scope'

    # Note: This class is intended to be subclassed each custom scope class
    # we desire to introduce in our application.

    module StartupTemplate
      module View
        class Scope < Hanami::View::Scope
          include View::CommonHelpers

        end
      end
    end
  ```

  ** created file `app/views/doctors/scopes/index.rb` and added following content to it

    ```
      module StartupTemplate
        module Views
          module Doctors
            module Scopes
              class Index < View::Scope
                private

                def edit_doctor_link(doctor_id:)
                  link_path = app_route_path(route_name_sym: :doctors_edit_doctor, id: doctor_id)
                  link_name = 'Edit'

                  link_to( link_path, class: 'edit-doctor' ) do
                    button(link_name)
                  end
                end

              end
            end
          end
        end
      end
    ```

  ** added `config.scope = Scopes::Index` in `StartupTemplate::Views::Doctors::Index`

  With all above things in place finally using the `edit_doctor_link(doctor_id:)` method in view template rendered expected Edit links against each Doctor available.

  Now the next thing is to show "New Doctor" page with the form prefilled with the details of a Doctor record which needs to be edited.

  So first thing needed is to update `StartupTemplate::Actions::Doctors::Edit` by implementing `handle(request, response)` method
  which fetches from the database the Doctor record, corresponding to the ID set in the Edit link for a Doctor to be edited, and
  then exposes it for usage in view.

  Then refactored the method `new_doctor_form` in view class `StartupTemplate::Views::Doctors::New` such that
  the form markup can be reused both for "New Doctor" and "Edit Doctor" use-cases and in "Edit Doctor" use-case
  the form also can be shown as pre-filled with existing values for a selected Doctor record. As part of the refactoring
  introduced `_doctor_form` method in `StartupTemplate::Views::Doctors::New`.

  Now for "Edit Doctor" use-case for showing the form pre-filled the Doctor record exposed by action
  `StartupTemplate::Actions::Doctors::Edit` should be made availabe in this view (`StartupTemplate::Views::Doctors::Edit`).
  Did that in following manner:

  ```
    expose :doctor
  ```

  Now `edit_doctor_form` method, which was invoked from the view template, internally used the `doctor` object exposed above
  in the view class but when the page was loaded from browser `undefined local variable or method `doctor'` error was encountered.
  So I realized that the data exposed by view class cannot be used in the view class itself rather it can be used in the template itself.
  So to address the problem tried following workaround:

  In the view template replaced

    `edit_doctor_form

  WITH

    `edit_doctor_form(doctor_obj: doctor)`

  but that didn't worked because of following error

   ```
     missing keyword: :doctor_obj (ArgumentError)
      ...../app/views/doctors/edit.rb:16:in `edit_doctor_form'
   ```

  That's the similar error encountered before for view `StartupTemplate::Views::Doctors::Index` and which was resolved by introducing
  `StartupTemplate::Views::Doctors::Scopes::Index`.

  So I thought `edit_doctor_form` method should be moved to a scope class for `StartupTemplate::Views::Doctors::Edit`. But
  then I didn't felt convinced about going with that route for such a simple need and so I decided to focus on the original problem again
  i.e. how to make action's exposed data use in the view class and without exposing it in view class.

  So I decided to try whether can access `exposures` instance method (see https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L549)
  directly in `edit_doctor_form` method because ultimately this view class (`StartupTemplate::Views::Doctors::Edit`) is a subclass of `Hanami::View`.
  But then I realized that it will not work because `exposures` method returns data which is defined using `expose` statements in the view class and
  checking the source code also found that the input data (which should involved the data exposed by the action class)
  gets gathered into `locals` but in not `exposures`. See below:

    https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L567
    https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L595

  So came to the conclusion that there is no option left except following:

  1. Add `expose :doctor` in this view class.

  2. Move `edit_doctor_form` method to a scope class `StartupTemplate::Views::Doctors::Scopes::Edit` for this view class.

  3. Define the scope class for this view class as `Scopes::Edit`.

  Later I thought that if going with above Scope-based approach then there should not be any need
  for `expose :doctor` because it it should be available in template's scope which is passed the `locals` to which the input is added
  (see https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L568).

  Also this Scope-base approach poses another problem: How to reuse the `_doctor_form` method in view class `New` which this view class `Edit` extends from?
  To solve that took following approach

  1. Define a helper module `StartupTemplate::Views::Doctors::Scopes::FormHelpers` (`app/views/doctors/scopes/form_helpers.rb`) and move following methods from `New` class to it:

    ```
    _doctor_form(form_action_path:, form_submit_button_name:, doctor_obj: nil)
    ```

  2. Define a scope class for `New` view i.e `StartupTemplate::Views::Doctors::Scopes::New` (`app/views/doctors/scopes/new.rb`) and
     include the helper module in it like following `include FormHelpers` and also define `new_doctor_form` method in this scope class.

  3. Define the scope class for `New` view class as `Scopes::New`.

  With above approach the `new_doctor_form` method should already be available for use in view template to be rendered by the `New` view class
  and thus there should not be any need for `expose :new_doctor_form` in `New` view class.

  Later with above approaches following understanding in context of this view class (`Edit`) was proved wrong:

  >Later I thought that if going with above Scope-based approach then there should not be any need for `expose :doctor`
  >because it it should be available in template's scope which is passed the `locals` to which the input is added
  >(see https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L568).

 because while gathering `locals` data `input` is passed to `Exposures#call` method in following manner (see https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L595)

  `exposures.(context: render_env.context, **input)`

 Then `Exposures#call` implementation doesn't directly add the input to the Hash returned by that method, instead it checks for
 exposures defined in view class (see https://github.com/hanami/view/blob/main/lib/hanami/view/exposures.rb#L53).
 So `expose :doctor` is required in this view class `Edit` but since that exposed data doesn't have any usage in view template I thought
 instead of `expose` we should use `private_expose` (https://github.com/hanami/view/blob/main/docsite/source/exposures.html.md#private-exposures)
 but then using `private_expose` it was found that private exposures are not added to `locals` to be passed to scope class.
 See https://github.com/hanami/view/blob/main/lib/hanami/view/exposures.rb#L58. So we have to go with `expose :doctor`
 and that public expose worked and then in the scope class `StartupTemplate::Views::Doctors::Scopes::Edit` it was accessed through the `locals` hash
 like `locals[:doctor]`.

 Finally with above approach working it didn't made sense anymore to continue making this view class `Edit` extend from `New` view class.
 Thus made it extend from `View::Base`.

* Additional adjustments were made in this with later developments. Following are the related sections in which the details about
those adjustments can be found:

  * `StartupTemplate::Actions::Doctors::Update`


### StartupTemplate::Views::Doctors::Scopes::Index (`app/views/doctors/scopes/index.rb`)

* Regarding how this got introduced refer the details under section `StartupTemplate::Views::Doctors::Edit` above.

### StartupTemplate::Views::Doctors::Scopes::New (`app/views/doctors/scopes/new.rb`)

* Regarding how this got introduced refer the details under section `StartupTemplate::Views::Doctors::Edit` above.

### StartupTemplate::Views::Doctors::Scopes::Edit (`app/views/doctors/scopes/edit.rb`)

* Regarding how this got introduced refer the details under section `StartupTemplate::Views::Doctors::Edit` above.

### `StartupTemplate::Actions::Doctors::Update` (`app/actions/doctors/update.rb`)

* Its implementation similar to `StartupTemplate::Actions::Doctors::Create` initially when submitted the Edit Doctor form by deliberately
  keeping a required field empty so that validation errors are encountered, this action didn't worked as expected. Following was the error
  encountered instead of showing the expected validation errors:

  ```
    Puma caught this error: undefined method `id' for #<Hanami::View::Part name=:doctor value={:name=>"Doctor-6", :qualification=>""}> (NoMethodError)
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/part.rb:207:in `method_missing'
  .../startup_template/app/views/doctors/scopes/edit.rb:19:in `edit_doctor_form'
  .../startup_template/app/templates/doctors/edit.html.haml:5:in `__tilt_7980'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/tilt-2.0.11/lib/tilt/template.rb:181:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/tilt-2.0.11/lib/tilt/template.rb:181:in `evaluate'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/tilt-2.0.11/lib/tilt/template.rb:109:in `render'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/renderer.rb:49:in `render'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/renderer.rb:32:in `template'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/render_environment.rb:44:in `template'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view.rb:576:in `call'
  .../startup_template/app/view/base.rb:25:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action/response.rb:95:in `render'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.1/lib/hanami/extensions/action.rb:92:in `finish'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action/session.rb:43:in `finish'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action/cookies.rb:23:in `finish'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action.rb:332:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.1/lib/hanami/slice/routing/resolver.rb:78:in `block in resolve_slice_action'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-router-2.0.1/lib/hanami/router.rb:108:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/rack-2.2.4/lib/rack/session/abstract/id.rb:266:in `context'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/rack-2.2.4/lib/rack/session/abstract/id.rb:260:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/rack/middleware.rb:36:in `block in call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/clock.rb:15:in `measure'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/rack/middleware.rb:36:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-router-2.0.1/lib/hanami/middleware/app.rb:40:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.1/lib/hanami/slice.rb:758:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/rack-2.2.4/lib/rack/static.rb:161:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/configuration.rb:268:in `call'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/request.rb:89:in `block in handle_request'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/thread_pool.rb:343:in `with_force_shutdown'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/request.rb:88:in `handle_request'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/server.rb:430:in `process_client'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/server.rb:233:in `block in run'
  /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/thread_pool.rb:150:in `block in spawn_thread'
  ```

  Now the first thing which was puzzling is a `Hanami::View::Part` instance having its name set to `:doctor` and which is set to a Hash
  `{:name=>"Doctor-6", :qualification=>""}` which corresponds to the form fields. Now the error was pointing to following line

  ```
    form_action_path = app_route_path(route_name_sym: :doctors_update_doctor, id: doctor.id)
  ```

  in `edit_doctor_form` method in `StartupTemplate::Views::Doctors::Scopes::Edit` containing following implementation:

    ```
      include FormHelpers

      def doctor
        locals[:doctor]
      end

      def edit_doctor_form
        form_action_path = app_route_path(route_name_sym: :doctors_update_doctor, id: doctor.id)
        form_submit_button_name = 'Save Changes'

        _doctor_form(form_action_path: form_action_path, form_submit_button_name: form_submit_button_name, doctor_obj: doctor)
      end
    ```

  The error indicates that the value returned by `doctor` method doesn't have an `id` method. That was puzzling because that method
  is expected to return an instance of `StartupTemplate::Entity::Doctor` which was supposed to be exposed by action `StartupTemplate::Actions::Doctors::Edit`
  when clicking Edit link for a Doctor on Doctors Listing page. So how come it is not found to have an `id` method.

  Looking more deeply it was found that in case of validation errors encountered by this action (`StartupTemplate::Actions::Doctors::Update`)
  `locals[:doctor`] is not even expected to return any anything because the action doesn't expose any data under key `doctor` when validation errors are encountered
  (refer the `monad.failure :validate` handler in `StartupTemplate::Actions::Doctors::CreateUpdateRemoveHelpers#action_success_failure_handler(action_type:, monad:, response:)`
  which actually handles the validation error encountered by this action and it can be seen that we do not expose anything there).

  In such a case how come Hanami::View instance is able to construct a Part having its name set to `:doctor` and set to a Hash containing the form params?

  I remembered that Hanami Action by default exposes the request params but as it was figured out (refer details under `StartupTemplate::Views::Doctors::Create`) it is exposed under key `:params`
  and that too when response is finished (see: https://github.com/hanami/controller/blob/v2.0.1/lib/hanami/action.rb#L594) and in our case we are encountering a runtime
  error before the response reaches its to its finish handler (see the stack trace and it should be clear that response's finish method has not yet got a chance to be invoked).

  So to figure how the view is able to have an exposure by the name :doctor and its value to a Hash of form params I put debug statements
  in `Hanami::Action::Response#render` method (see https://github.com/hanami/controller/blob/v2.0.1/lib/hanami/action/response.rb#L87) to know about
  what `exposures.merge(options)` should contain (see https://github.com/hanami/controller/blob/v2.0.1/lib/hanami/action/response.rb#L88) and then
  I put debug statements in `Hanami::View#call` method (see https://github.com/hanami/view/blob/main/lib/hanami/view.rb#L561) to know about what
  its `input` arg should contain. After adding those debug statements and resubmitting the Edit form such that validation errors occurs following information
  I could see in the logs:

  ```
    Hanami Response logs
    >>>>>>>>.. response options: {:_csrf_token=>"d1e0a94b151c9b277f8f6080f214dbb70f5e81a19b9053e9728840b5a280be2c", :doctor=>{:name=>"Doctor-6", :qualification=>""}, :id=>"10"}
    >>>>>>>>.. exposures: {}

    Hanami View logs
    >>>>>>> input keys: [:_csrf_token, :doctor, :id]
    >>>>>>> input key: _csrf_token
    >>>>>>> input value: String
    >>>>>>> input key: doctor
    >>>>>>> input value: Hash
    >>>>>>> input key: id
    >>>>>>> input value: String
    2023-01-26 15:02:48 +0530 Rack app ("POST /doctors/10" - (127.0.0.1)): #<NoMethodError: undefined method `id' for #<Hanami::View::Part name=:doctor value={:name=>"Doctor-6", :qualification=>""}>>
  ```

  So looking at that it can be understood that when this action (`StartupTemplate::Actions::Doctors::Update`) encounters validation errors and
  attempts rendering its view the options passed to `Hanami::Action::Response#render` method are the form params (see `response options` info in logs)
  and response's `exposures` is empty (see `exposures` info in logs). And those form params gets passed to `Hanami::View#call`'s `input` arg wherein a key
  named `doctor` is available which is actually as Hash of form data and NOT an instance of `StartupTemplate::Entity::Doctor`
  which is exposed by Edit action. So this way even if Update action is not explicitly exposing any data when validation errors are encountered the
  `StartupTemplate::Views::Doctors::Edit` view still finds an exposure by the name `:doctor` and which is then available in its configured scope class.

  So to avoid such confusion I updated `StartupTemplate::Actions::Doctors::Edit` by changing the exposure name from `:doctor` to `:doctor_entity_obj`
  i.e.

  ```
   response[:doctor_entity_obj] = get_doctor(doctor_id)
  ```

  and accordingly updated the `StartupTemplate::Views::Doctors::Edit` by changing

  ```
   expose :doctor
  ```

  TO

  ```
    expose :doctor_entity_obj
  ```

  and then updated the `StartupTemplate::Views::Doctors::Scopes::Edit` by replacing

  ```
    def doctor
      locals[:doctor]
    end
  ```

  WITH

  ```
    def doctor_entity_obj
      locals[:doctor_entity_obj]
    end
  ```

  and accordingly updating the `edit_doctor_form` method implementation in that scope. So after these changes
  when again submitted the Edit form such that validation errors are encountered following was the runtime error
  shown.

  ```
    Puma caught this error: undefined method `id' for nil:NilClass

              form_action_path = app_route_path(route_name_sym: :doctors_update_doctor, id: doctor_entity_obj.id)
                                                                                                               ^^^ (NoMethodError)
    .../startup_template/app/views/doctors/scopes/edit.rb:18:in `edit_doctor_form'
    .../startup_template/app/templates/doctors/edit.html.haml:5:in `__tilt_7920'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/tilt-2.0.11/lib/tilt/template.rb:181:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/tilt-2.0.11/lib/tilt/template.rb:181:in `evaluate'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/tilt-2.0.11/lib/tilt/template.rb:109:in `render'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/renderer.rb:49:in `render'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/renderer.rb:32:in `template'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/render_environment.rb:44:in `template'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view.rb:569:in `call'
    .../startup_template/app/view/base.rb:25:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action/response.rb:88:in `render'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.1/lib/hanami/extensions/action.rb:92:in `finish'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action/session.rb:43:in `finish'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action/cookies.rb:23:in `finish'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action.rb:332:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.1/lib/hanami/slice/routing/resolver.rb:78:in `block in resolve_slice_action'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-router-2.0.1/lib/hanami/router.rb:108:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/rack-2.2.4/lib/rack/session/abstract/id.rb:266:in `context'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/rack-2.2.4/lib/rack/session/abstract/id.rb:260:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/rack/middleware.rb:36:in `block in call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/clock.rb:15:in `measure'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/dry-monitor-1.0.1/lib/dry/monitor/rack/middleware.rb:36:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-router-2.0.1/lib/hanami/middleware/app.rb:40:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.1/lib/hanami/slice.rb:758:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/rack-2.2.4/lib/rack/static.rb:161:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/configuration.rb:268:in `call'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/request.rb:89:in `block in handle_request'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/thread_pool.rb:343:in `with_force_shutdown'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/request.rb:88:in `handle_request'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/server.rb:430:in `process_client'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/server.rb:233:in `block in run'
    /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/puma-6.0.0/lib/puma/thread_pool.rb:150:in `block in spawn_thread'
  ```

  As can be understood there is no more confusion because the error correctly indicates that the `doctor_entity_obj` is not available
  in view which is obvious becaue this action (`StartupTemplate::Actions::Doctors::Update`) doesn't expose that when encountering validation
  errors.

  Now to fix the problem the immediate solution which comes to mind is that the action on encountering validation error should
  expose doctor's ID which be used in `StartupTemplate::Views::Doctors::Scopes::Edit#edit_doctor_form` method when `doctor_entity_obj` is not available.
  So we can take following approach such that whether newly showing Edit form or showing it again when validation errors the doctor Id always remains
  available in the scope class:

  1. In `StartupTemplate::Actions::Doctors::Edit` class expose following additional data

  ```
    response[:doctor_id] = doctor_id
  ```

  2. In `StartupTemplate::Views::Doctors::Edit` define one more following exposure

  ```
    expose :doctor_id
  ```

  3. In `StartupTemplate::Views::Doctors::Scopes::Edit` define following method

  ```
    def doctor_id
      locals[:doctor_id]
    end
  ```

    and then update `edit_doctor_form` implementation by replacing `doctor_entity_obj.id` WITH `doctor_id`.

  4. In this action (`StartupTemplate::Actions::Doctors::Update`) expose following data before invoking `update_doctor(doctor_id, input_hash, response)`

  ```
    response[:doctor_id] = doctor_id
  ```

  With above changes when submitting the Edit form such that validation errors should occur then
  the validation errors are shown on the page.

  Now one more thing which needs to be addressed with above changes is the setting the `method` option value for `form_for`
  helper used in `_doctor_form` method defined in `StartupTemplate::Views::Doctors::Scopes::FormHelpers` module. When "New Doctor"
  form is rendered (by view `StartupTemplate::Views::Doctors::New`), ideally that option doesn't need to be set explicitly because it should be automatically set to `POST` (see
  https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/form_helper.rb#L444 and https://github.com/hanami/helpers/blob/main/lib/hanami/helpers/form_helper.rb#L222).
  But "Edit Doctor" form is rendered (by view `StartupTemplate::Views::Doctors::Edit`) the form submission request should be sent to this action
  (`StartupTemplate::Actions::Doctors::Update`) which is mapped to route `PATCH /doctors/:id`.

  So as can be seen in Edit case the `method` option for `form_for` should be set to `:patch` because then only
  Hanami Router should be able to correctly route the request to this action. Now when "Edit" button against a Doctor in Doctors Listing is clicked
  the request should be served by action `StartupTemplate::Actions::Doctors::Edit` which should fetch the Doctor record from DB and expose it against key
  `:doctor_entity_obj` for usage in corresponding view class `StartupTemplate::Views::Doctors::Edit`.

  That view's scope class   `StartupTemplate::Views::Doctors::Scopes::Edit#edit_doctor_form` should thus pass `:doctor_entity_obj` to the `doctor_obj`
  arg of `_doctor_form` method and as per the logic in `_doctor_form` method the `method` option for `form_for` helper should get set to `:patch`.
  But if the "Edit Doctor" form is submitted such that validation errors should occur then as explained before `doctor_entity_obj` should not be available
  in the scope class and accordingly in that case `method` option for `form_for` helper should get set to `:post` which would be wrong.

  Thus instead of relying on `:doctor_entity_obj` we should rely on `doctor_id` which should always be available in Edit case whether newly rendered Edit Form
  and rendered it again on encountering validation errors while attempting an Update. And to achieve this we modify `_doctor_form` method by adding
  one more optional argument `doctor_id` and using it to set the `method` option value for `form_for` helper.


### `config/app.rb`

* `config.actions.content_security_policy[:default_src] = "'self'"`

  Without above configuration when an asset file, like a CSS file, was tried to be loaded by the browser
  error like following was seen in browser's console

  ```
   Content Security Policy: The page’s settings blocked the loading of a resource at http://localhost:2300/css/simple.min.css (“default-src”).
  ```

  **References**

  * https://content-security-policy.com/examples/blocked-csp/
  * https://guides.hanamirb.org/v1.3/helpers/assets/#content-security-policy
  * https://github.com/hanami/hanami/blob/v2.0.1/spec/unit/hanami/config/actions/content_security_policy_spec.rb
  * https://github.com/hanami/hanami/blob/beb60078bc9a5e84ba77946f2823ee12f7f6d0dc/CHANGELOG.md#v200alpha4---2021-12-07
  * https://github.com/hanami/hanami/blob/v2.0.1/lib/hanami/config/actions.rb

* `config.actions.sessions`

  Without enabling sessions using `form_for` helper, facilitated by `hanami-helper` gem for generating an HTML form,
  runtime errors should be encountered for e.g. when the form tries to add a CSRF token while constructing the HTML form
  using that helper. For more details please refer details added before under **Automatic Instantiation of a custom view context and passing of that while rendering a view**
  section.

* `config.middleware.use Rack::MethodOverride`

  Without this in place routes defined with PATCH and DELETE verbs are not recognized and hence `405 Method Not Allowed` error is seen in the browser.
  Initially tried manually to search for the cause and the solution but unable to do so posted the problem at https://gitter.im/hanami/chat?at=63d3e79a434214494d287c01
  and simultaneously kept searching for related issue on web and found https://github.com/hanami/router/issues/190 based on which I got an idea that
  the solution should be to use the middleware `Rack::MethodOverride` (https://github.com/rack/rack/blob/2.2.4/lib/rack/method_override.rb) but
  I also got a thought that why such a basic thing is not supported by default? So I decided to inspect that by default what all middlewares are configured in a Hanami 2.0 app?
  But before doing that I first checked the documentation at https://guides.hanamirb.org/v2.0/app/app-config/#router for `middleware` config and found that by default
  middleware stack is empty (see quote below)

  >Configures the Rack middleware stack to be used by the app’s router. Defaults to an empty middleware stack.

  So even before trying my inspect idea it was confirmed that `Rack::MethodOverride` middleware was not in use and hence the PATCH and DELETE verb routes were not being recognized.
  But still I added following debug statement in one of an action mapped to `GET` verb

  ```
    puts ">>>>>>>>> #{Hanami.app.config.middleware.to_a}"
  ```

  and commented out following `config.middleware.use Rack::MethodOverride` added to this file (`config/app.rb`) and found that the default behaviour about empty middleware stack
  to be true. Then I uncommented out the `config.middleware.use Rack::MethodOverride` and again accessed the page invoking the action in which the debug statement
  was added and this time found following in the logs:

  ```
    >>>>>>>>> [["/", [[Rack::MethodOverride, [], nil]]]]
  ```

  and after adding that middleware the PATCH and DELETE verb routes started working as expected.

  Additional References:
    https://chris-w-iverson.medium.com/rack-methodoverride-and-you-a15e5b2c772c

### `StartupTemplate::Repository` (`lib/startup_template/repository.rb`)

* `ROM::Repository::Root`

  **References**

    * https://discourse.rom-rb.org/t/using-rom-5-3-0-repository-with-hanami-2-0/569/6
    * https://discourse.rom-rb.org/t/rom-root-purpose-and-usage/570

* Using entities.

  Add `struct_namespace Entities`

  It is also recommended to add `auto_struct true` with above but it is by default enabled in Repositories
  as per documentation at https://rom-rb.org/learn/core/5.2/structs/#auto-struct.

  **References**
    * https://rom-rb.org/learn/core/5.2/structs/#auto-struct-with-custom-classes

### `StartupTemplate::Repositories::DoctorRepository` (`lib/startup_template/repositories/doctor_repository.rb`)

* Create a record with timestamp columns automatically set.

  ```
    def create(doctor_attrs_hash)
      changeset = doctors.changeset(:create, doctor_attrs_hash).map(:add_timestamps)
      changeset.commit
    end
  ```

  **References**
    * https://discourse.rom-rb.org/t/automatic-created-at-and-updated-at/96/4?u=jignesh

### My Questions

* https://discourse.rom-rb.org/t/using-rom-5-3-0-repository-with-hanami-2-0/569/8
* https://discourse.rom-rb.org/t/rom-root-purpose-and-usage/570
* https://github.com/hanami/hanami/issues/1261
* https://discourse.dry-rb.org/t/how-to-use-dry-validation-with-dry-transaction/1588
* https://discourse.dry-rb.org/t/dry-view-how-to-define-a-helper-method-with-an-arg-in-view-class-which-can-be-invoked-from-view-template/1596

### ROM usage references

* https://discourse.rom-rb.org/t/automatic-created-at-and-updated-at/96/4?u=jignesh

* For getting all results in a repository interface
  * https://rom-rb.org/learn/core/5.2/relations/#getting-all-results

* For models
  * https://rom-rb.org/learn/core/5.2/structs/

* For getting single result by an ID
  * https://rom-rb.org/5.0/learn/sql/queries/#default-code-by_pk-code-method
  * https://rom-rb.org/5.0/learn/core/relations/#getting-a-single-result
  * https://rom-rb.org/5.0/learn/repositories/reading-simple-objects/#full-example
