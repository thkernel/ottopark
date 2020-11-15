module API
    module V1
      module Defaults
        extend ActiveSupport::Concern

        included do
          prefix "api"
          version "v1", using: :path
          default_format :json
          format :json
          formatter :json, 
               Grape::Formatter::ActiveModelSerializers
  
=begin
          before do
            error!("401 Unauthorized, 401") unless authenticated
          end
=end          
            
          helpers do
            def permitted_params
              @permitted_params ||= declared(params, 
                 include_missing: false)
            end
  
            def logger
              Rails.logger
            end

            # For auth
            def authenticate!
              error!('Unauthorized. Invalid or expired token.', 401) unless current_user
            end
        
            def current_user
              # find token. Check if valid.
              token = ApiKey.where(access_token: params[:token]).first
              if token && !token.expired?
                @current_user = User.find(token.user_id)
              else
                false
              end
            end
 

            def structure_doctors(structure)
              work_place_items = WorkPlaceItem.where(structure_id: structure.id)
              users_id = work_place_items.map {|work_place_item| WorkPlace.find(work_place_item.work_place_id).user_id}
              puts "USERS ID: #{users_id.inspect}"
              @doctors = Profile.where("user_id IN (?)", users_id )
            end
      
          def general_doctors(structure)
              work_place_items = WorkPlaceItem.where(structure_id: structure.id)
              users_id = work_place_items.map {|work_place_item| WorkPlace.find(work_place_item.work_place_id).user_id}
                      
                      general = ["Médecin généraliste"]
                      @doctors = Profile.where("user_id IN (?)", users_id )
                      @doctors.where("speciality IN (?)", general)
          end
      
          def special_doctors(structure)
              work_place_items = WorkPlaceItem.where(structure_id: structure.id)
              users_id = work_place_items.map {|work_place_item| WorkPlace.find(work_place_item.work_place_id).user_id}
                      general = ["Médecin généraliste"]
      
                      @doctors = Profile.where("user_id IN (?)", users_id )
                      @doctors.where("speciality not IN (?)", general)
          end

      
            
          end
  
          rescue_from ActiveRecord::RecordNotFound do |e|
            error_response(message: e.message, status: 404)
          end
  
          rescue_from ActiveRecord::RecordInvalid do |e|
            error_response(message: e.message, status: 422)
          end
        end
      end
    end
  end
  