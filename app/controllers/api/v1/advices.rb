module API
    module V1
      class Advices < Grape::API
        include API::V1::Defaults
        resource :advices do
          desc "Return all advices"
          get "" do
            Advice.all
          end


          desc "Creates new advice."
          params do
            requires :consultation_type_id, type: Integer, desc: "Username or email address"
            requires :doctor_id, type: Integer, desc: "Password"
            requires :object, type: String, desc: "Password"
            requires :content, type: String, desc: "Password"
            requires :user_token, type: String, desc: "Password"
         end

         post :new do

            user_id = ApiKey.find_by(access_token: params[:user_token]).user_id
            
            if user_id.present?
                advice = Advice.new
                advice.consultation_type_id = params[:consultation_type_id]
                advice.doctor_id = params[:doctor_id]
                advice.object = params[:object]
                advice.content = params[:content]
                advice.user_id = user_id

                if advice.save! 
                    {status: 'ok', advice: advice}
                else
                  {status: 'error'}
                end

            else
                error!({error_code: 422, error_message: "Impossible de traiter la requette."},422)
                return
            end
         end


          desc "Return a locality"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Advice.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end