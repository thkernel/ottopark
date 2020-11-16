module API
    module V1
      class ConsultationTypes < Grape::API
        include API::V1::Defaults
        resource :consultation_types do
          desc "Return all consultation types"
          get "" do
            ConsultationType.all
          end

          desc "Return a locality"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            ConsultationType.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end