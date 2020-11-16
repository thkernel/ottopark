module API
    module V1
      class Structures < Grape::API
        include API::V1::Defaults
        resource :structures do
          desc "Return all structures"
          get "" do
            Structure.all
          end

          desc "Return all pharmacies"
          get "/pharmacies" do 
            type = StructureType.find_by(name: "Pharmacie")

            if type.present?
              Structure.where(structure_type_id: type.id) 
            else
              return []
            end
 
          end

          desc "Return all radiologies"
          get "/radiologies" do 
            type = StructureType.find_by(name: "Centre de radiologie")

            if type.present?
              Structure.where(structure_type_id: type.id) 
            else
              return []
            end
 
          end

          desc "Return by name"
          params do
            requires :name, type: String, desc: "ID of the user"
          end
          get "/pharmacy/search/:name" do 
            type = StructureType.find_by(name: "Pharmacie")

            if type.present?
              structures = Structure.where("structure_type_id = ?" , type.id) 
              structures.search_by_name(permitted_params[:name]) 

            else
              return []
            end
 
          end



          desc "Return by name"
          params do
            requires :name, type: String, desc: "ID of the user"
          end
          get "/pharmacies/search/:name" do 
            type = StructureType.find_by(name: "Pharmacie")

            if type.present?
              structures = Structure.where("structure_type_id = ?" , type.id) 
              structures.search_by_name(permitted_params[:name]) 

            else
              return []
            end
 
          end

          desc "Return by name"
          params do
            requires :name, type: String, desc: "ID of the user"
          end
          get "/laboratories/search/:name" do 
            type = StructureType.find_by(name: "Laboratoire")

            if type.present?
              structures = Structure.where("structure_type_id = ?" , type.id) 
              structures.search_by_name(permitted_params[:name]) 

            else
              return []
            end
 
          end


          desc "Return by name"
          params do
            requires :name, type: String, desc: "ID of the user"
          end
          get "/radiologies/search/:name" do 
            type = StructureType.find_by(name: "Pharmacie")

            if type.present?
              structures = Structure.where("structure_type_id = ?" , type.id) 
              structures.search_by_name(permitted_params[:name]) 

            else
              return []
            end
 
          end

          desc "Return by name"
          params do
            requires :name, type: String, desc: "ID of the user"
          end
          get "/hospitals/search/:name" do 
            types = StructureType.where(" lower(name) IN (?) ", ["Hôpital", "Cabinet médical", "Clinique", "Polyclinique"].map(&:downcase))

            if types.present?
              structures = Structure.where("structure_type_id = ?" , types.map{|type| type.id}) 
              structures.search_by_name(permitted_params[:name]) 

            else
              return []
            end
 
          end




          desc "Return by name"
          params do
            requires :name, type: String, desc: "ID of the user"
          end
          get "/search/:name" do 
              #Structure.where("lower(name) = ?",  permitted_params[:name].downcase) 
              Structure.search_by_name(permitted_params[:name]) 

 
          end


          desc "Return all laboratories"
          get "/laboratories" do 
            type = StructureType.find_by(name: "Laboratoire")
            if type.present?
              Structure.where(structure_type_id: type.id) 
            else
              return []
            end
 
          end

          desc "Return all hospitals"
          get "/hospitals" do 
            structure_types = StructureType.where("name IN (?) ", ["Hôpital", "Cabinet médical", "Clinique", "Polyclinique"])

            
            if structure_types.present?
              structure_type_ids = []

              structure_types.each do |item|
                structure_type_ids.push(item.id)
              end

              Structure.where("structure_type_id IN (?)",  structure_type_ids) 
            else
              return []
            end
 
          end

          
          desc "Return a structure"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Structure.where(id: permitted_params[:id]).first!
          end

          
        end
      end
    end
  end