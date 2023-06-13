# frozen_string_literal: true

class AdminController < ApplicationController
  before_filter :block_foreign_hosts
  
  def index
    @posts = Post.all
  end
end
