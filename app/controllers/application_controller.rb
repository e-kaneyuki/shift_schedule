# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

    def after_sign_in_path_for(resource)
      leaders_show_path # ログイン後に遷移するpathを設定
    end

    def after_sign_out_path_for(resource)
      root_path # ログアウト後に遷移するpathを設定
    end
end
