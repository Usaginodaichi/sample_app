class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のオブジェクトを生成する
    @list = List.new
  end

  # 以下を追加
  def create
    # データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # データをデータベースに保存するためのsaveメソッドを実行
    list.save
    # トップ画面へリダイレクト
    redirect_to '/top'
  end

  def index
    @lists = List.all
  end

  def show
  end

  def edit
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body)
  end

end
