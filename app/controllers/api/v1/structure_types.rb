module API
    module V1
      class StructureTypes < Grape::API
        include API::V1::Defaults
        resource :structure_types do
          desc "Return all structure types"
          get "" do
            StructureType.all
          end
        desc "Return a structure type"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            StructureType.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end