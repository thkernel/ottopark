module API
    module V1
      class Users < Grape::API
        include API::V1::Defaults

        resource :users do
          desc "Return all users"
          get "" do
            User.all
          end


          desc "Return by name"
          params do
            requires :query, type: String, desc: "ID of the user"
          end
          get "/search/:query" do 

              by_locality = User.search_by_locality(permitted_params[:query])

              if by_locality.present?
                by_locality
              else
                User.profile_search(permitted_params[:query]) 
              end


 
          end


        desc "Return all doctors"
        get "/doctors" do
          User.where(role_id: Role.find_by(name: "Prestataire").id)
        end


       


        desc "Return all kosante doctors"
        get "/kosante/doctors" do
          structure = Structure.find_by(name: "Ko-Santé+")
          doctors = structure_doctors(structure)

        end

        desc "Return all kosante generaldoctors"
        get "/kosante/general/doctors" do
          structure = Structure.find_by(name: "Ko-Santé+")
          doctors = general_doctors(structure)

        end

        desc "Return all kosante special doctors"
        get "/kosante/special/doctors" do
          structure = Structure.find_by(name: "Ko-Santé+")
          doctors = special_doctors(structure)

        end

        desc "Return a user"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            User.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end