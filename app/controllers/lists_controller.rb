class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のオブジェクトを生成する
    @list = List.new
  end

  # 以下を追加
  def create
    # データを受け取り新規登録するためのインスタンス作成
    @list = List.new(list_params)
    # データをデータベースに保存するためのsaveメソッドを実行
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :index #<= newからindexに変更
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id]) #データ(レコードの)を1件取得
    list.destroy #データ(レコード)を削除
    redirect_to '/lists' # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end

end
