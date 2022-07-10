class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のオブジェクトを生成する
    @list = List.new
  end

  def index
  end

  def show
  end

  def edit
  end
end
