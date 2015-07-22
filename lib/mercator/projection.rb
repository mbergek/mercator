module Mercator

  # Base projection class. Normally you would not use this class in calculations,
  # instead use one of the subclasses defined below.

  class Projection
    attr_accessor :central_meridian
    attr_accessor :scale
    attr_accessor :false_easting
    attr_accessor :false_northing
  end

  # Base SWEREF 99 class that sets some common SWEREF 99 properties.
  
  class Sweref99 < Projection
    def initialize
      super
      self.scale = 1.0
      self.false_northing = 0.0
      self.false_easting = 150000.0
    end
  end

  # SWEREF 99 TM class, one of the most common projection used by
  # Swedish applications.

  class Sweref99TM < Sweref99
    def initialize
      super
      self.central_meridian = 15.0
      self.scale = 0.9996
      self.false_easting = 500000.0
    end
  end

  # Various regional SWEREF classes for Sweden

  class Sweref991200 < Sweref99
    def initialize
      super
      self.central_meridian = 12.00
    end
  end
  class Sweref991330 < Sweref99
    def initialize
      super
      self.central_meridian = 13.50
    end
  end
  class Sweref991500 < Sweref99
    def initialize
      super
      self.central_meridian = 15.00
    end
  end
  class Sweref991630 < Sweref99
    def initialize
      super
      self.central_meridian = 16.50
    end
  end
  class Sweref991800 < Sweref99
    def initialize
      super
      self.central_meridian = 18.00
    end
  end
  class Sweref991415 < Sweref99
    def initialize
      super
      self.central_meridian = 14.25
    end
  end
  class Sweref991545 < Sweref99
    def initialize
      super
      self.central_meridian = 15.75
    end
  end
  class Sweref991715 < Sweref99
    def initialize
      super
      self.central_meridian = 17.25
    end
  end
  class Sweref991845 < Sweref99
    def initialize
      super
      self.central_meridian = 18.75
    end
  end
  class Sweref992015 < Sweref99
    def initialize
      super
      self.central_meridian = 20.25
    end
  end
  class Sweref992145 < Sweref99
    def initialize
      super
      self.central_meridian = 21.75
    end
  end
  class Sweref992315 < Sweref99
    def initialize
      super
      self.central_meridian = 23.25
    end
  end

end
