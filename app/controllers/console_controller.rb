require 'fileutils'
require 'rbconfig'

class ConsoleController < ApplicationController
  def index
  end

  def upload
    return unless request.post?

	if params[:commit] == 'upload'
	  data_file = params[:data_file]
	  data_file_name = ''
	  if data_file and data_file != ''
		data_file_name = data_file.original_filename
		@data_file_length = data_file.size
		File.open("#{Rails.root}/tmp/upload/#{data_file_name}", 'wb') {|f| f.write(data_file.read) }
		`C:\Windows\System32\shimgvw.dll,ImageView_PrintTo "#{Rails.root}/tmp/upload/#{data_file_name}" "HP LaserJet P1008"`
		flash.now[:notice] = "Upload file '#{data_file_name}' successfully!"
	  end
	else
	  flash.now[:notice] = 'Error! Not upload operation!'
	end
  end

  def print
  end
end
