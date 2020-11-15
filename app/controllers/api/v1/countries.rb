module API
    module V1
      class Countries < Grape::API
        include API::V1::Defaults
        resource :countries do
          desc "Return all countries"
          get "" do
            Country.all
          end

          desc "Return a locality"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Country.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end