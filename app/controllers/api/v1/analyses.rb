module API
    module V1
      class Analyses < Grape::API
        include API::V1::Defaults
        resource :analyses do
          desc "Return all analyses"
          get "" do
            Analysis.all
          end

          desc "Return by name"
          params do
            requires :structure_id, type: Integer, desc: "ID of the user"

          end
          get "search/:structure_id" do 
              Analysis.where(structure_id:  permitted_params[:structure_id]) 

 
          end


          desc "Return by name"
          params do
            requires :name, type: String, desc: "ID of the user"
          end
          get "/search_name/:name" do 
            Analysis.search_by_name(permitted_params[:name]) 
          end





        desc "Return a analyse"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Analysis.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end