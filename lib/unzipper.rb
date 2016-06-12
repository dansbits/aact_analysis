require 'zip'

class Unzipper

  def self.unzip(file_path)
    Zip::File.open(file_path) { |zip_file|
      zip_file.each { |f|
        f_path=File.join("source_data/aact/", f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
      }
    }
  end

end