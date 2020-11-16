module API
    module V1
      class DummyAnalyses < Grape::API
        include API::V1::Defaults
        resource :dummy_analyses do
          desc "Return all dummy analyses"
          get "" do
            DummyAnalysis.all
          end
        desc "Return a dummy analysis"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            DummyAnalysis.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end