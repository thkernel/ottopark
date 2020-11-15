module API
    module V1
      class Specialities < Grape::API
        include API::V1::Defaults
        resource :specialities do
          desc "Return all specialities"
          get "" do
            Speciality.all
          end
        desc "Return a locality"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Speciality.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end