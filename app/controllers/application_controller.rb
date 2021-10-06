# frozen_string_literal: true

class ApplicationController < ActionController::Base



  private
  def after_sign_in_path_for(resource)
     mypage_root_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpathを設定
  end
end
