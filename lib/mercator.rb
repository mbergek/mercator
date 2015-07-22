require "mercator/version"
require "mercator/datum"
require "mercator/projection"

include Math


# The module contains methods to convert between grid
# and spherical coordinates. For information about the calculations
# used: http://bit.ly/1HGZduL
#
# Author::      Martin Bergek (mailto:contact@spotwise.com)
# Copyright::   Copyright (c) 2015 Martin Bergek
# License::     MIT License


module Mercator

  # Convert from spherical coordinates to grid coordinates using the
  # specified datum and projection.

  def self.spherical_to_grid(latitude, longitude, datum, projection)
    φ   = latitude * PI / 180.0
    λ   = longitude * PI / 180.0
    λ₀  = projection.central_meridian.to_rad

    e²  = datum.flattening * (2 - datum.flattening)
    n   = datum.flattening / (2 - datum.flattening)
    â   = datum.semi_major_axis/(1+n) * (1 + n**2/4 + n**4/64)

    a   = e²
    b   = (5*e²**2 - e²**3)/6
    c   = (104*e²**3 - 45*e²**4)/120
    d   = 1237*e²**4/1260

    φ′  = φ - sin(φ)*cos(φ)*(a + b*sin(φ)**2 + c*sin(φ)**4 + d*sin(φ)**6)
    δ   = λ - λ₀

    ξ   = atan(tan(φ′) / cos(δ))
    η   = atanh(cos(φ′) * sin(δ))

    β₁  = n/2 - 2*n**2/3 + 5*n**3/16 + 41*n**4/180
    β₂  = 13*n**2/48 - 3*n**3/5 + 557*n**4/1440
    β₃  = 61*n**3/240 - 103*n**4/180
    β₄  = 49561*n**4/161280

    x   = projection.scale * â * (ξ + β₁*sin(2*ξ)*cosh(2*η) + β₂*sin(4*ξ)*cosh(4*η) +
          β₃*sin(6*ξ)*cosh(6*η) + β₄*sin(8*ξ)*cosh(8*η) ) + projection.false_northing
    y   = projection.scale * â * (η + β₁*cos(2*ξ)*sinh(2*η) + β₂*cos(4*ξ)*sinh(4*η) +
          β₃*cos(6*ξ)*sinh(6*η) + β₄*cos(8*ξ)*sinh(8*η) ) + projection.false_easting

    return [x, y]
  end

  # Convert from grid coordinates to spherical coordinates using the
  # specified datum and projection.

  def self.grid_to_spherical(north, east, datum, projection)
    e²  = datum.flattening * (2 - datum.flattening)
    n   = datum.flattening / (2 - datum.flattening)
    â   = datum.semi_major_axis/(1+n) * (1 + n**2/4 + n**4/64)
    λ₀  = projection.central_meridian * PI / 180.0

    ξ   = (north - projection.false_northing) / projection.scale / â
    η   = (east - projection.false_easting) / projection.scale / â

    δ₁  = n/2 - 2*n**2/3 + 37*n**3/96 - n**4/360
    δ₂  = n**2/48 + n**3/15 - 437*n**4/1440
    δ₃  = 17*n**3/480 - 37*n**4/840
    δ₄  = 4397*n**4/161280

    ξ′  = ξ - δ₁*sin(2*ξ)*cosh(2*η) - δ₂*sin(4*ξ)*cosh(4*η) -
          δ₃*sin(6*ξ)*cosh(6*η) - δ₄*sin(8*ξ)*cosh(8*η)
    η′  = η - δ₁*cos(2*ξ)*sinh(2*η) - δ₂*cos(4*ξ)*sinh(4*η) -
          δ₃*cos(6*ξ)*sinh(6*η) - δ₄*cos(8*ξ)*sinh(8*η)

    φ⋆  = asin(sin(ξ′) / cosh(η′))
    δ   = atan(sinh(η′) / cos(ξ′))

    a⋆  = e² + e²**2 + e²**3 + e²**4
    b⋆  = -1.0/6*(7*e²**2 + 17*e²**3 + 30*e²**4)
    c⋆  = (224*e²**3 + 889*e²**4)/120
    d⋆  = -1.0/1260*4279*e²**4

    λ   = λ₀ + δ
    φ   = φ⋆ + sin(φ⋆)*cos(φ⋆) * (a⋆ + b⋆*sin(φ⋆)**2 + c⋆*sin(φ⋆)**4 + d⋆*sin(φ⋆)**6)

    return [λ * 180.0 / PI, φ * 180.0 / PI]
  end

end
