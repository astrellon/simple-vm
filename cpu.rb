class CPU
    @memory
    @program

    def initialize()
        @memory = {}
        @program = nil
    end

    def execute(program)
        @program = program

        program_running = true
        program_index = 0;
        while program_running
            line = program.program_lines[program_index]
            program_index += 1

            if line.nil?
                program_running = false
                next
            end

            if line.length == 0
                next
            end

            instruction = line[0]
            first = instruction[0]

            if first == '#' || first == ':'
                next
            end

            case instruction
            when "ASSIGN"
                pos = get_memory_index(line[1])
                value = get_value(line[2])

                @memory[pos] = value

            when "ADD"
                pos = get_memory_index(line[1])
                value = get_value(line[2])

                @memory[pos] += value

            when "SUB"
                pos = get_memory_index(line[1])
                value = get_value(line[2])

                @memory[pos] -= value

            when "JUMP"
                value = get_value(line[1])
                program_index = value

            when "EQUAL"
                pos = get_memory_index(line[1])
                value1 = get_value(line[2])
                value2 = get_value(line[3])

                @memory[pos] = value1 == value2

            when "NOT_EQUAL"
                pos = get_memory_index(line[1])
                value1 = get_value(line[2])
                value2 = get_value(line[3])

                @memory[pos] = value1 != value2

            when "IF"
                condition = get_value(line[1])
                location = get_program_index(line[2])

                if condition
                    program_index = location
                end

            when "PRINT"
                for i in 1 ... line.length
                    print get_value(line[i])
                end
                puts

            when "EXIT"
                program_running = false

            else
                puts "Unknown line #{line} on line #{program_index + 1}"

            end
        end

        puts "---"
        puts "Done"
    end

    def get_value(input)
        first = input[0]

        case first
        when '@'
            index = get_memory_index(input)

            @memory[index]

        when '"'
            input[1 ... -1]

        when ':'
            @program.label_locations[input]

        else
            input.to_i
        end
    end

    def get_memory_index(input)
        input[1 .. -1]
    end

    def get_program_index(input)
        first = input[0]
        if first == '@'
            index = get_memory_index(input)
            return @memory[index]
        end
        if first == ':'
            return @program.label_locations[input]
        end

        input.to_i
    end

end
