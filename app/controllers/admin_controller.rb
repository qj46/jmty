# frozen_string_literal: true

class AdminController < ApplicationController
  before_filter :block_foreign_hosts
  
  def index
    @posts = Post.all
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
    true
  end
end
