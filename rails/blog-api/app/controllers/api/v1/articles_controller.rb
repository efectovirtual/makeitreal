module Api
  module V1
    class ArticlesController < ApplicationController
      # body = { article: { title: 'first post', content: 'lorem ipsum' } }.to_json
      # HTTParty.post('http://localhost:3000/api/v1/users/1/articles', body: body, headers: headers)
      def create
        safe_params = params.require(:article).permit(:title, :content)
        article = Article.new safe_params
        article.user_id = params[:user_id]
        if article.save
          render json: article
        else
          render json: { errors: article.errors }, status: :unprocessable_entity
        end
      end

      # HTTParty.get("http://localhost:3000/api/v1/users/1/articles/#{article_id}")
      def show
        article = Article.find params[:id]
        render json: article
      end
    end
  end
end
