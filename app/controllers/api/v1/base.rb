module API
    module V1
      class Base < Grape::API

        mount API::V1::Auth
        mount API::V1::Signup
        mount API::V1::Users
        mount API::V1::Sessions
        mount API::V1::Countries
        mount API::V1::Localities
        mount API::V1::Specialities
        mount API::V1::DummyMedicaments
        mount API::V1::DummyAnalyses
        mount API::V1::Medicaments
        mount API::V1::Analyses
        mount API::V1::Structures
        mount API::V1::StructureTypes
        mount API::V1::ConsultationTypes
        mount API::V1::Advices
        mount API::V1::WorkPlaces
        mount API::V1::WorkPlaceItems
        mount API::V1::Plannings
        mount API::V1::PlanningItems
        mount API::V1::Appointments
        mount API::V1::ApiKeys
        mount API::V1::Schedules
        mount API::V1::MedicamentOrders
        mount API::V1::AnalysisRequests
        mount API::V1::Posts
        mount API::V1::Conversations
        mount API::V1::Messages
        mount API::V1::FileSents
        mount API::V1::AnalysisResults
        mount API::V1::CoronaChecks






















      end
    end
end
  