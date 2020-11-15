module API
    module V1
      class WorkPlaceItems < Grape::API
        include API::V1::Defaults
        resource :workplace_items do
          desc "Return all workplaces"
          get "" do
            WorkPlaceItem.all
          end



          desc "Return by name"
          params do
            requires :work_place_id, type: String, desc: "ID of the user"
          end
          get "/search/:work_place_id" do 
             workplace_items =  WorkPlaceItem.where(work_place_id:  permitted_params[:work_place_id]) 
             if workplace_items.present?
              workplace_items
             else
              []
             end

          end

          desc "Return by name"
          params do
            requires :structure_id, type: Integer, desc: "ID of the user"
          end
          get "/structure/:structure_id" do 
             workplace_items =  WorkPlaceItem.where(structure_id:  permitted_params[:structure_id]) 
             if workplace_items.present?
              workplace_items
             else
              []
             end

          end



        desc "Return a workplace"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            WorkPlaceItem.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end