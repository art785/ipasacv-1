class  Admin::VideosController < Admin::ResourceController
  def index
    @titulo = "Lista de videos"
    @videos = Video.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos }
      format.js
    end
  end

  def new
    @titulo = "Agregar video"
    @video = Video.new
    1.times { @video.images.build }
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
      format.js
    end
  end

  def edit
    @titulo = "Actualizar video"
    @video = Video.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @video }
      format.js
    end
  end

  def create
    @titulo = "Agregar video"
    @video = Video.new(params[:video])
    respond_to do |format|
      if @video.save
        format.html { redirect_to action:"tab" }
        format.json { render json: @video, status: :created, location: @video }
      else
        format.html { render action:"new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @video = Video.find(params[:id])
    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to action:"tab" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    respond_to do |format|
      format.html { redirect_to action:"tab" }
      format.json { head :no_content }
    end
  end

  def tab
    @videos = Video.all
     respond_to do |format|
      format.html
    end
  end
end
