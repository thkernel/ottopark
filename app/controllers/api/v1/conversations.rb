module API
    module V1
      class Conversations < Grape::API
        include API::V1::Defaults
        resource :conversations do
          desc "Return all conversations"
          get "" do
            Conversation.all
          end

          desc "Return a conversation"
          params do
            requires :id, type: Integer, desc: "ID of the user"
          end
          get ":id" do
            Conversation.where(id: permitted_params[:id]).first!
          end

          desc "Return a conversation"
          params do
            requires :user_token, type: String, desc: "ID of the user"
            requires :recipient_id, type: Integer, desc: "ID of the user"

          end
          get "/:user_token/:recipient_id" do
            user_token = ApiKey.find_by(access_token: params[:user_token])
            if user_token.present?

              Conversation.between(user_token.user_id, params[:recipient_id] ).first!
            else
              error!({error_code: 422, error_message: "Impossible de traiter la requette."},422)
              return
            end
          end

        end
      end
    end
  end