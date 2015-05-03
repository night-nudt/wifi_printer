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
    data_file_name = data_file.original_filename # "from_#{request.remote_ip}@#{Time.now.to_s(:db).gsub(/[\s:]/, '_')}"
    @data_file_length = data_file.size
    Dir.mkdir("#{Rails.root}/tmp/upload") unless File.directory?("#{Rails.root}/tmp/upload")
    tmp_file = "#{Rails.root}/tmp/upload/#{data_file_name}"
    File.open(tmp_file, 'wb') {|f| f.write(data_file.read) }
    sleep 1 while !File.exist?(tmp_file)
    `"%SystemRoot%\\System32\\rundll32.exe" "%SystemRoot%\\System32\\shimgvw.dll",ImageView_PrintTo /pt "#{tmp_file.gsub(/\//, '\\')}" "Microsoft XPS Document Writer"` # "HP LaserJet M1530 MFP Series PCL 6"`
    flash.now[:notice] = "Upload file '#{data_file_name}' successfully!"
    end
  else
    flash.now[:notice] = 'Error! Not upload operation!'
  end
  end

  def print
  end
end
