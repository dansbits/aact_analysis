module Aact
  class TextFileProcessor

    def initialize(file_path)
      @file_path = file_path
    end

    def process
      parse_headers
      parsed_rows = rows.map { |r| r.split('|', -1) }

      DB[table_name.to_sym].import @headers, parsed_rows, commit_every: 1000
    end

    private

    def parse_headers
      header_row = rows.shift
      @headers = header_row.split('|').map { |h| h.downcase }
    end

    def rows
      @rows ||= file_string.split "\r\n"
    end

    def file_string
      @file_string ||= File.open(@file_path).read
    end

    def table_name
      @file_path.split('/').last.chomp('.txt')
    end
  end
end