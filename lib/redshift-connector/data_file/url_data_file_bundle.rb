require 'redshift-connector/data_file/reader'
require 'redshift-connector/data_file/logger'
require 'redshift-connector/data_file/abstract_data_file_bundle'
require 'redshift-connector/data_file/url_data_file'

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
