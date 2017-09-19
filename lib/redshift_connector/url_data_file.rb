require 'redshift_connector/abstract_data_file'
require 'open3'

module RedshiftConnector
  class UrlDataFile < AbstractDataFile
    def initialize(url, reader_class:)
      super reader_class: reader_class
      @url = url
    end

    attr_reader :url

    def key
      @url.path
    end

    def open
      stdin, stdout, stderr, wait_th = Open3.popen3('curl', @url.to_s)
      stdin.close
      stderr.close
      stdout
    end
  end
end
