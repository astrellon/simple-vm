require_relative "program"
require_relative "cpu"

if ARGV.length != 1
    puts "This program requires a single filename to load as input."
    exit
end

program_text = File.read(ARGV[0])
program = Program.parse_text(program_text)

cpu = CPU.new
cpu.execute(program)