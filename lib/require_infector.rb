require 'require_infector/version'

module RequireInfector
  def self.included(base) # :nodoc:
    base.class_eval do
      # Method include patches
      # @param plugin_name [String] the plugin name
      # @param resources [String] names of resources which will need patching
      # @param options [Hash] options
      # @example
      #   Rails.config.to_prepare do
      #     require_infector 'awesome_plugin', ['user', 'issue', 'user_controller', 'issue_helper']
      #   end
      def require_infector(plugin_name, resources, options = {})
        default_options = {
            dir: 'infectors',
            prefix: nil,
            postfix: nil
        }

        options = default_options.merge options

        resources.to_a.each do |resource|
          require_dependency resource unless options[:skip_require_dependency]

          infector_name = [options[:prefix], resource, options[:postfix]].select(&:present?).join('_')
          resource_patch = File.join *[plugin_name, options[:dir], infector_name].select(&:present?)
          resource_constant, resource_patch_constant = [resource, resource_patch].map(&:camelize).map(&:constantize)

          resource_constant.send(:include, resource_patch_constant) unless resource_constant.included_modules.include? resource_patch_constant
        end
      end
    end
  end
end

Kernel.send(:include, ::RequireInfector) unless Kernel.included_modules.include? ::RequireInfector
