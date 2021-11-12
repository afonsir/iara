# frozen_string_literal: true

SimpleCov.start do
  minimum_coverage 100

  add_filter 'config'
  add_filter 'spec'
  add_filter { |source_file| source_file.lines.count < 5 }

  add_filter 'app/controllers/graphql_controller.rb'

  add_group 'Models',      'app/models'
  add_group 'Interactors', 'app/interactors'
  add_group 'Organizers',  'app/organizers'
  add_group 'GraphQL',     'app/graphql'
  add_group 'Workers',     'app/workers'
  add_group 'Concerns',    ['app/concerns', 'app/controllers/concerns', 'app/models/concerns']
  add_group 'Support',     'app/support'
  add_group 'Libraries',   'lib'
end
