module API
    module V1
      class Schedules < Grape::API
        include API::V1::Defaults
        resource :schedules do
          desc "Return all schedules"
          get "" do
            Schedule.all
          end


          desc "Return by name"
          params do
            requires :structure_id, type: Integer, desc: "ID of the user"

          end
          get "/:structure_id" do 
              Schedule.find_by(structure_id: permitted_params[:structure_id])

 
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