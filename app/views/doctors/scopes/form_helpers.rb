# auto_register: false
# frozen_string_literal: true

module StartupTemplate
  module Views
    module Doctors
      module Scopes
        module FormHelpers

          private

          def _doctor_form_cancel_link_attrs
            route_opts = {
              name: :doctors_doctors
            }

            link_path = construct_link_path(route_opts: route_opts)

            {
              href: link_path,
              class: 'cancel'
            }
          end

          def _doctor_form(form_action_path:, form_submit_button_name:, doctor_obj: nil, doctor_id: nil)
            form_url = form_action_path
            form_name = :doctor

            if doctor_id.nil?
              form_method_option_value = :post
            else
              form_method_option_value = :patch
            end

            name_field_value = nil
            qualification_field_value = nil

            unless doctor_obj.nil?
              name_field_value = doctor_obj.name
              qualification_field_value = doctor_obj.qualification
            end

            form_for(form_name, form_url, method: form_method_option_value, params: params) do
              p do
               label("Name")

               name_param_name = :name

               # TODO: Refer TODO-1 in the HERE doc at the bottom of this file
               if StringUtil.blank?(str: name_field_value)
                 # TODO: Refer TODO-2 in the HERE doc at the bottom of this file
                 name_field_value = StringUtil.strip(str: _value(name_param_name) )
               end

               text_field(name_param_name, value: name_field_value)
              end

              p do
               label("Qualification")

               qualification_param_name = :qualification

               # TODO: Refer TODO-1 in the HERE doc at the bottom of this file
               if StringUtil.blank?(str: qualification_field_value)
                 # TODO: Refer TODO-2 in the HERE doc at the bottom of this file
                 qualification_field_value = StringUtil.strip(str: _value(qualification_param_name) )
               end

               text_field(qualification_param_name, value: qualification_field_value)
              end

              a(_doctor_form_cancel_link_attrs) do
                button('Cancel', type: 'button')
              end

              submit(form_submit_button_name)
            end
          end

        end
      end
    end
  end
end

=begin
  TODO-1:
    `StringUtil.blank?` usage is to be replaced with `blank?` method defined in `StartupTemplate::View::CommonHelpers`
    which is included `StartupTemplate::View::Scope` which is turn is extended by the scope class this module is included in.
    Initially used `blank?` method only but faced following error while opening New Doctor form.

    ```
      Puma caught this error: wrong number of arguments (given 1, expected 0; required keyword: str) (ArgumentError)
      ..../app/view/common_helpers.rb:22:in `blank?'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/html_helper/html_builder.rb:387:in `method_missing'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/html_helper/html_builder.rb:387:in `method_missing'
      ..../app/views/doctors/scopes/form_helpers.rb:51:in `block (2 levels) in _doctor_form'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/html_helper/html_builder.rb:377:in `instance_exec'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/html_helper/html_builder.rb:377:in `resolve'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/html_helper/html_node.rb:60:in `content'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/form_helper/html_node.rb:51:in `content'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/html_helper/html_node.rb:46:in `to_s'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/html_helper/html_builder.rb:336:in `map'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/html_helper/html_builder.rb:336:in `to_s'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/form_helper/form_builder.rb:143:in `to_s'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/html_helper/html_node.rb:63:in `content'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/form_helper/html_node.rb:51:in `content'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/html_helper/html_node.rb:46:in `to_s'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/html_helper/html_builder.rb:336:in `map'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/html_helper/html_builder.rb:336:in `to_s'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/helpers-d6147c3aabab/lib/hanami/helpers/form_helper/form_builder.rb:143:in `to_s'
      ..../app/templates/doctors/new.html.haml:6:in `__tilt_7980'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/tilt-2.0.11/lib/tilt/template.rb:181:in `call'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/tilt-2.0.11/lib/tilt/template.rb:181:in `evaluate'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/tilt-2.0.11/lib/tilt/template.rb:109:in `render'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/renderer.rb:49:in `render'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/renderer.rb:32:in `template'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view/render_environment.rb:44:in `template'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/bundler/gems/view-35a90c2517e0/lib/hanami/view.rb:569:in `call'
      ..../app/view/base.rb:21:in `call'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action/response.rb:88:in `render'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.1/lib/hanami/extensions/action.rb:92:in `finish'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action/session.rb:43:in `finish'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action/cookies.rb:23:in `finish'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-controller-2.0.0/lib/hanami/action.rb:332:in `call'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-2.0.1/lib/hanami/slice/routing/resolver.rb:78:in `block in resolve_slice_action'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/hanami-router-2.0.1/lib/hanami/router.rb:108:in `call'
      /home/jignesh/.rvm/gems/ruby-3.1.2@startup-template-hanami-2-0/gems/rack-2.2.4/lib/rack/method_override.rb:24:in `call'
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

    Searching on web found a related answer at https://stackoverflow.com/a/68450312/936494
    which should be studied and tried.

  TODO-2:
    `StringUtil.strip` usage is to be replaced with `strip_param_value(value)` method defined in `StartupTemplate::View::CommonHelpers`.
    The details added under TODO-1 are applicable here too.
=end
