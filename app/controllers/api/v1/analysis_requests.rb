module API
    module V1
      class AnalysisRequests < Grape::API
        include API::V1::Defaults
        resource :analysis_requests do
          desc "Return all appointments"
          get "" do
            AnalysisRequest.all
          end

          desc "Find by access token"
          params do
            requires :access_token, type: String, desc: "Username or email address"
         end

          get "/find/:access_token" do
            AnalysisRequest.find_by(access_token: params[:access_token])
          end

          desc "Creates new appointment."
          params do
            requires :structure_id, type: Integer, desc: "Username or email address"
            requires :analysis_id, type: Integer, desc: "Password"
            requires :patient_id, type: String, desc: "Password"
         end

         post :new do

            patient = ApiKey.find_by(access_token: params[:patient_id])
            
            if patient.present?
                analysis_request = AnalysisRequest.new
                analysis_request.structure_id = params[:structure_id]
                analysis_request.patient_id = patient.user_id
                
                if analysis_request.save!
                
                    analysis_request_item = AnalysisRequest.new
                    analysis_request_item.analysis_request_id = analysis_request.id
                    analysis_request_item.analysis_id = params[:analysis_id]
                    

                    if analysis_request_item.save! 
                        {status: 'ok', analysis_request: analysis_request}
                    else
                        {status: "no"}
                    end
                end

            else
                error!({error_code: 422, error_message: "Impossible de traiter la requette."},422)
                return
            end
         end


          desc "Return a locality"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Advice.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end