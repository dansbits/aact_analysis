require_relative 'lib/initializer'

namespace :aact do
  desc "Download the aact dataset"
  task :download do
    exec 'wget http://library.dcri.duke.edu/dtmi/ctti/2016_Refresher/AACT201603_pipe_delimited.ZIP -O source_data/aact_data.zip'
  end

  desc "Crate the aact sqlite dtabase"
  task :create_db do
    Aact::SchemaCreator.create_schema
  end

  desc "Unzip the aact dataset and extract it into the SQLite database"
  task :extract do
    require_relative 'lib/unzipper'
    Unzipper.unzip('source_data/aact_data.zip')

    files_to_process = %w[
      clinical_study facilities facility_contacts investigators overall_officials central_contacts
      nct_aliases links sponsors designs responsible_parties keywords references conditions
      removed_countries location_countries authorities
    ]

    files_to_process.each do |file|
      file_path = "source_data/aact/#{file}.txt"
      p "extracting file: #{file_path}"
      Aact::TextFileProcessor.new(file_path).process
    end
  end

  desc "transorm the data"
  task :transform do
    print "Transforming partial date columns\n"
    Aact::PartialDateTransformer.transform

    print "Transforming full date columns\n"
    Aact::FullDateTransformer.transform
  end
end
