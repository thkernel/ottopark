module API
    module V1
      class PlanningItems < Grape::API
        include API::V1::Defaults
        resource :planning_items do
          desc "Return all plannings"
          get "" do
            PlanningItem.all
          end


          desc "Return by name"
          params do
            requires :name, type: String, desc: "ID of the user"
          end
          get "/plannings/:structure_id/:user_id" do 
              PlanningItem.where("structure_id  = ? AND user_id = ?",  permitted_params[:structure_id], permitted_params[:user_id]) 

 
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