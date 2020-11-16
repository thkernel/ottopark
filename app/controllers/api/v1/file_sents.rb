module API
    module V1
      class FileSents < Grape::API
        include API::V1::Defaults
        resource :filesents do
          desc "Return all appointments"
          get "" do
            FileSent.all
          end


          desc "Creates new appointment."
          params do
            requires :structure_id, type: Integer, desc: "Username or email address"
            requires :content, type: String, desc: "Password"
            requires :user_token, type: String, desc: "Password"
            requires :file, type: String, desc: "file"
         end

         post :new do

            api_key = ApiKey.find_by(access_token: params[:user_token])
            
            if api_key.present?
                filesent = FileSent.new
                filesent.structure_id = params[:structure_id]
                filesent.user_id = api_key.user_id
                filesent.content = params[:content]
                filesent.file = params[:file]


                if filesent.save! 
                    {status: 'ok', file: filesent}
                else
                    {status: "no"}
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
            FileSent.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end