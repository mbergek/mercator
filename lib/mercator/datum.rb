module Mercator

  # Base datum class. Do not use this class in calculations, instead
  # use one of the subclasses defined below.

  class Datum
    attr_accessor :semi_major_axis
    attr_accessor :semi_minor_axis
    attr_accessor :inverse_flattening
    
    def flattening
      1 / self.inverse_flattening
    end
  end

  # The GRS80 datum, or the Geodetic Reference System 1980.

  class GRS80 < Datum
    def initialize
      self.semi_major_axis = 6378137.0
      self.semi_minor_axis = 6356752.314140
      self.inverse_flattening = 298.257222100882
    end
  end

  # The WGS84 datum, World Geodetic System 1984

  class WGS84 < Datum
    def initialize
      self.semi_major_axis = 6378137.0
      self.semi_minor_axis = 6356752.314245
      self.inverse_flattening = 298.257223563
    end
  end


end