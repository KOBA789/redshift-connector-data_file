require 'redshift_connector/reader'
require 'redshift_connector/logger'
require 'redshift_connector/abstract_data_file_bundle'
require 'redshift_connector/url_data_file'

module RedshiftConnector
  class UrlDataFileBundle < AbstractDataFileBundle
    def initialize(data_file_urls, format: :redshift_csv, filter: nil, logger: DataFile.logger)
      raise ArgumentError, 'data_file_urls is empty' if data_file_urls.empty?
      @data_file_urls = data_file_urls
      @filter = filter || lambda {|*row| row }
      @logger = logger
      @reader_class = Reader.get(format)
    end

    def data_files
      @data_file_urls.map do |url|
        UrlDataFile.new(url, reader_class: @reader_class)
      end
    end
  end
end
