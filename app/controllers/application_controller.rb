class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_search

  def set_search
    @search = Product.ransack(params[:q]) #ransackの検索メソッド
    @search_products = @search.result(distinct: true).order(created_at: "DESC").includes(:user).page(params[:page]).per(5) # productsの検索結果一覧
     # 最終的に、@search_productsを検索結果画面（例：search.html.haml）に挿入します。
     # 検索結果の一覧：  @search_products = @search.result.order(created_at: "DESC")
     # distinct: trueは検索結果のレコード重複しないようにします。
     # ページネーション:  .includes(:user).page(params[:page]).per(5
  end

  def after_sign_in_path_for(resource)
    user_path(@user)
  end



  def after_sign_out_path_for(resource)
   homes_about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
