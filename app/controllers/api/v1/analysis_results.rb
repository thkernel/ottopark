module API
    module V1
      class AnalysisResults < Grape::API
        include API::V1::Defaults
        
        resource :analysis_results do
          desc "Return all appointments"
          get "" do
            AnalysisResult.all
          end

          desc "Return all appointments"
          params do
            requires :access_key, type: String, desc: "Username or email address"
            #requires :user_token, type: Integer, desc: "Password"
            #requires :patient_id, type: String, desc: "Password"
          end

          get "/:access_key" do
            analysis_request = AnalysisRequest.find_by(access_token: params[:access_key])
            if analysis_request.present?
              analysis_request.analysis_result
            end
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