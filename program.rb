class Program
    attr_reader :label_locations, :program_lines

    def initialize(label_locations, program_lines)
        @label_locations = label_locations
        @program_lines = program_lines
    end

    def self.parse_text(text)
        program_lines = []

        text.each_line do |line|
            line_tokens = []
            split = line.split(/\s(?=(?:[^"]|"[^"]*")*$)/)
            split.each do |token|
                token = token.strip
                if token.length > 0
                    line_tokens << token
                end
            end

            program_lines << line_tokens
        end

        label_locations = self.find_labels(program_lines)

        Program.new(label_locations, program_lines)
    end

    def self.find_labels(program_lines)
        result = {}
        program_lines.each_with_index do |line, index|
            if line.length != 1
                next
            end

            token = line[0]
            if token[0] == ':'
                result[token] = index
            end
        end
        result
    end
end
