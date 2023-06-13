# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # before_action :authenticate_user!
  before_action :set_should_render_navbar

  def set_should_render_navbar
    @should_render_navbar = false
  end
  
  private
  # アクセスを許可するIPアドレス
  def whitelisted?(ip)
    return true if ENV['IP'] === ip
    false
  end

  #　whiltelisted?で許可したIPアドレス以外のアクセスがあれば制限
  def block_foreign_hosts
    return false if whitelisted?(request.remote_ip)
  end
end
