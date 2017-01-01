require 'FileUtils'

ROOT_DIR = "#{File.expand_path("..", Dir.pwd)}"
PODS_ROOT = "#{ROOT_DIR}/Pods"

def generate_mock_class(src, dest)
	components = []
	components << "#{PODS_ROOT}/Cuckoo/run" << "generate"
	components << "--output" << "#{dest}"
	components << "#{src}"

	command = components.join(" ")
	puts "Run command: #{command}"
	`#{command}`
end

SRC_FILE = "#{ROOT_DIR}/NTTesting/Examples/Person.swift"
DST_FILE = "#{ROOT_DIR}/NTTesting/Examples/MockPerson.swift"

generate_mock_class(SRC_FILE, DST_FILE)
