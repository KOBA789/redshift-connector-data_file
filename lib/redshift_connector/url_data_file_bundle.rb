require 'redshift_connector/reader'
require 'redshift_connector/abstract_data_file_bundle'
require 'redshift_connector/url_data_file'
require 'redshift_connector/logger'
require 'uri'

module RedshiftConnector
  class UrlDataFileBundle < AbstractDataFileBundle
    def initialize(urls, format: :redshift_csv, filter: nil, logger: RedshiftConnector.logger)
      super filter: filter, batch_size: 1000, logger: logger
      reader_class = Reader.get(format)
      raise ArgumentError, 'no URL given' if urls.empty?
      @data_files = urls.map {|url| UrlDataFile.new(URI.parse(url), reader_class: reader_class) }
      logger.info "reader: #{reader_class}"
    end

    attr_reader :data_files
  end
end
