default['platformstack']['cloud_monitoring']['custom_monitors']['name'].push('mysql')
default['platformstack']['cloud_monitoring']['custom_monitors']['mysql']['source'] = 'monitoring-agent-mysql.yaml.erb'
default['platformstack']['cloud_monitoring']['custom_monitors']['mysql']['cookbook'] = 'stack_commons'
