module Service
  def self.included(base)
    base.extend(ClassMethods)

    def call
      raise NotImplementedError
    end
  end

  module ClassMethods
    def call(*args)
      new(*args).call
    end
  end
end
