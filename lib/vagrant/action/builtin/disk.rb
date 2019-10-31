module Vagrant
  module Action
    module Builtin
      class Disk
        def initialize(app, env)
          @app    = app
          @logger = Log4r::Logger.new("vagrant::action::builtin::disk")
        end

        def call(env)
          machine = env[:machine]
          defined_disks = get_disks(machine, env)

          # Call into providers machine implementation for disk management

          # Continue On
          @app.call(env)
        end

        def get_disks(machine, env)
          return @_disks if @_disks

          @_disks = []
          @_disks = machine.config.vm.disks

          @_disks
        end
      end
    end
  end
end
