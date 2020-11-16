module API
    module V1
      class WorkPlaces < Grape::API
        include API::V1::Defaults
        resource :workplaces do
          desc "Return all workplaces"
          get "" do
            WorkPlace.all
          end



          desc "Return by name"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get "/search/:id" do 
             workplace =  WorkPlace.find_by(user_id:  permitted_params[:id]) 
             if workplace.present?
              workplace
             else
              []
             end

          end



        desc "Return a workplace"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            WorkPlace.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end