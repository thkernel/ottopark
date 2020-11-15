module API
    module V1
      class Messages < Grape::API
        include API::V1::Defaults
        resource :messages do
          desc "Return all advices"
          get "" do
            Message.all
          end


          desc "Creates new advice."
          params do
            requires :recipient_id, type: Integer, desc: "Password"
            requires :conversation_id, type: Integer, desc: "Password"
            requires :content, type: String, desc: "Password"
            requires :user_token, type: String, desc: "Password"
         end

         post :new do

            user_id = ApiKey.find_by(access_token: params[:user_token]).user_id
            
            if user_id.present?
                message = Message.new
                message.doctor_id = params[:doctor_id]
                message.object = params[:object]
                message.content = params[:content]
                message.user_id = user_id

                if message.save! 
                    {status: 'ok', message: message}
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