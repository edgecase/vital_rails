module SongsHelper
  def flash_success
    if flash[:success]
      "<h3>#{flash[:success]}</h3>"
    end
  end
end
