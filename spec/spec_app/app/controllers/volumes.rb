class Volumes < BaseClass
  include Praxis::Controller

  implements ApiResources::Volumes
  include Concerns::BasicApi

  before actions: [:show] do |controller|
    #puts "before action for volumes"
  end

  def index
    volumes = Volume::Collection.example
    
    response.body = volumes.collect { |v| v.render }
    response.headers['Content-Type'] = 'application/vnd.acme.volumes'
    response
  end

  def show(id:, **other_params)
    response.body = JSON.pretty_generate(Volume.example.render)
    response.headers['Content-Type'] = 'application/vnd.acme.volume'
    response
  end


end
