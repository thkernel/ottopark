module API
    module V1
      class Posts < Grape::API
        include API::V1::Defaults
        resource :posts do
          desc "Return all posts"
          get "" do
            exclude_posts = PostCategory.where("id IN (?)", [PostCategory.find_by(name: "Nos produits").id, PostCategory.find_by(name: "A propos de nous").id ])
            exclude_posts_ids = exclude_posts.map {|item| item.id}

            if exclude_posts.present?
              Post.where.not(post_category_id: exclude_posts_ids).order('id DESC')
            end
          end

          desc "Return a user by localiy"
          params do
            requires :id, type: Integer, desc: "ID of the user"
          end
          get "/search/:id" do
            Post.find(permitted_params[:id])
          end
        

        desc "Return a locality"
          params do
            requires :id, type: String, desc: "ID of the user"
          end
          get ":id" do
            Post.where(id: permitted_params[:id]).first!
          end
        end
      end
    end
  end