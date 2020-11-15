module API
    module V1
      class Localities < Grape::API
        include API::V1::Defaults
        resource :localities do
          desc "Return all localities"
          get "" do
            Locality.all
          end

          desc "Return a user by localiy"
          params do
            requires :id, type: Integer, desc: "ID of the user"
          end
          get "/search/:id" do
            Locality.find(permitted_params[:id])
          end
        

        desc "Return a locality"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Locality.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end