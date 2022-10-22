class Api::V1::GeeksController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy, :mark_deleted]

  def initialize
    super Geek, [:stack, :resume, :name]
  end
end


