require "rails_admin_process/engine"

module RailsAdminProcess
end

require 'rails_admin/config/actions'

module RailsAdmin
  module Config
    module Fields
      module Types
        class Date
          def parse_input(params)
            params[name] = self.class.normalize(params[name], localized_date_format).try(:to_date) || '' if params[name].present?
          end
        end
      end
    end
  end
end

module RailsAdmin
  module Config
    module Sections
      class SecurityProcess < Base
      end

      class CommitteeProcess < Base
      end
    end

    module Actions
      class SecurityProcess < Edit
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          obj = bindings[:object]
          !(obj.approved? || obj.rejected? || obj.awaiting_for_committee_approval?) && authorized?
        end

        register_instance_option :object_level do
          true
        end

        register_instance_option :member do
          true
        end

        register_instance_option :bulkable? do
          false
        end

        register_instance_option :http_methods do
          [:get, :put]
        end

        register_instance_option :controller do
          Proc.new do

            if request.get? # EDIT

              respond_to do |format|
                format.html { render @action.template_name }
                format.js   { render @action.template_name, :layout => false }
              end

            elsif request.put? # UPDATE
              satisfy_strong_params!
              sanitize_params_for!(request.xhr? ? :modal : :security_process)

              @object.set_attributes(params[@abstract_model.param_key])
              @authorization_adapter && @authorization_adapter.attributes_for(:security_process, @abstract_model).each do |name, value|
                @object.send("#{name}=", value)
              end
              changes = @object.changes
              if @object.save
                @auditing_adapter && @auditing_adapter.update_object(@object, @abstract_model, _current_user, changes)
                respond_to do |format|
                  format.html { redirect_to_on_success }
                  format.js { render :json => { :id => @object.id.to_s, :label => @model_config.with(:object => @object).object_label } }
                end
              else
                handle_save_error :security_process
              end

            end

          end
        end

        register_instance_option :link_icon do
          'icon-check'
        end
      end

      class CommitteeProcess < Edit
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          obj = bindings[:object]
          !(obj.approved? || obj.rejected? || obj.awaiting_for_security_check?) && authorized?
        end

        register_instance_option :object_level do
          true
        end

        register_instance_option :member do
          true
        end

        register_instance_option :bulkable? do
          false
        end

        register_instance_option :http_methods do
          [:get, :put]
        end

        register_instance_option :controller do
          Proc.new do

            if request.get? # EDIT

              respond_to do |format|
                format.html { render @action.template_name }
                format.js   { render @action.template_name, :layout => false }
              end

            elsif request.put? # UPDATE
              satisfy_strong_params!
              sanitize_params_for!(request.xhr? ? :modal : :committee_process)

              @object.set_attributes(params[@abstract_model.param_key])
              @authorization_adapter && @authorization_adapter.attributes_for(:committee_process, @abstract_model).each do |name, value|
                @object.send("#{name}=", value)
              end
              changes = @object.changes
              if @object.save
                @auditing_adapter && @auditing_adapter.update_object(@object, @abstract_model, _current_user, changes)
                respond_to do |format|
                  format.html { redirect_to_on_success }
                  format.js { render :json => { :id => @object.id.to_s, :label => @model_config.with(:object => @object).object_label } }
                end
              else
                handle_save_error :committee_process
              end

            end

          end
        end

        register_instance_option :link_icon do
          'icon-check'
        end
      end
    end
  end
end


#require 'rails_admin/config/fields/base'
#require 'rails_admin/i18n_support'