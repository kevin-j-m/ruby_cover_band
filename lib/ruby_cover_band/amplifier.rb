require "sonic_pi"

module RubyCoverBand
  class Amplifier
    PORT_LOG_REGEX = Regexp.compile(/Listen port:\s+(?<port>\d+)/)

    def initialize
      @port = find_port
      @speaker = SonicPi.new(@port)
    end

    def play(sound)
      @speaker.run(sound)
    end

    private

    # courtesy of https://github.com/Widdershin/sonic-pi-cli/blob/20a18f91b4aa24de9f4b187aa20c69334ddf0329/bin/sonic_pi#L13-L33
    def find_port
      port = 4557

      begin
        log_path = File.join(Dir.home, ".sonic-pi", "log", "server-output.log")

        File.open(log_path, 'r') do |f|
          port_log_entry =
            f.each_line
            .lazy
            .map { |line| line[PORT_LOG_REGEX, "port"] }
            .find { |match| !!match }

          port = port_log_entry.to_i if port_log_entry
        end
      rescue Errno::ENOENT
        # not to worry if the file doesn't exist
      end

      port
    end
  end
end
