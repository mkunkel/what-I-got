class Amazon

  def initialize
    @vacuum = Vacuum.new
    configure
  end

  def configure
    @vacuum.configure(
    aws_access_key_id:     'key',
    aws_secret_access_key: 'secret',
    associate_tag:         'tag'
    )
  end

end
