module Rake
  class Application
    alias_method :top_level_alias, :top_level

    def top_level
      t = Thread.new { EM.run }
      until EM.reactor_running?; end
      top_level_alias
      until EM.defers_finished?; end
      EM.stop
    end
  end
end