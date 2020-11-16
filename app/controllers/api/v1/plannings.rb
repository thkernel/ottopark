module API
    module V1
      class Plannings < Grape::API
        include API::V1::Defaults
        resource :plannings do
          desc "Return all plannings"
          get "" do
            Planning.all
          end


          desc "Return by name"
          params do
            requires :structure_id, type: Integer, desc: "ID of the user"
            requires :user_id, type: Integer, desc: "ID of the user"

          end
          get "/:user_id/:structure_id" do 
              Planning.where("structure_id  = ? AND user_id = ?",  permitted_params[:structure_id], permitted_params[:user_id]).first 

 
          end

          desc "Return by name"
          params do
            #requires :structure_id, type: Integer, desc: "ID of the user"
            requires :user_id, type: Integer, desc: "ID of the user"

          end
          get "/user/:user_id" do 
              Planning.where("user_id = ?", permitted_params[:user_id]).first 

 
          end


          desc "Return by name"
          params do
            requires :structure_id, type: Integer, desc: "ID of the user"

          end
          get "/:structure_id" do 
              Planning.where(structure_id: permitted_params[:structure_id]) 

 
          end



        desc "Return a medicaments"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Medicament.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end