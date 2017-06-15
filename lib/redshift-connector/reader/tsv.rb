require 'redshift-connector/data_file/reader/abstract'
require 'redshift-connector/data_file/reader/exception'
require 'csv'

module RedshiftConnector
  # Parses TSV (Tab Separated Format) files.
  class Reader::TSV < Reader::Abstract
    declare_reader :tsv

    def self.data_object?(key)
      /\.tsv(?:\.|\z)/ =~ File.basename(key)
    end

    def initialize(f)
      @f = f
    end

    def each(&block)
      @f.each_line do |line|
        yield line.chomp.split("\t", -1)
      end
    end
  end
end
