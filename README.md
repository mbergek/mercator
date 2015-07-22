# Mercator

This gem include methods to convert between spherical and grid coordinates. It was designed to handle conversions for the Swedish SWEREF99 projection but can be used for any projection based on Gauss conformal projection (transverse Mercator).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mercator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mercator

## Usage

Consider the following code:

```
require 'mercator'
datum = Mercator::WGS84.new
projection = Mercator::Sweref99TM.new
Mercator.grid_to_spherical(6097106.672, 356083.438, datum, projection)
```

Available datums:

* GRS80
* WGS84

Available projections:

* SWEREF 99 TM
* SWEREF 99 12 00
* SWEREF 99 13 30
* SWEREF 99 15 00
* SWEREF 99 16 30
* SWEREF 99 18 00
* SWEREF 99 14 15
* SWEREF 99 15 45
* SWEREF 99 17 15
* SWEREF 99 18 45
* SWEREF 99 20 15
* SWEREF 99 21 45
* SWEREF 99 23 15

To use other datums and projections, instantiate Mercator::Datum and Mercator::Projection objects and assign suitable parameters, e.g. (for SWEREF 99 TM above):

```datum = Mercator::Datum.new
datum.semi_major_axis = 6378137.0
datum.inverse_flattening = 298.257223563

projection = Mercator::Projection.new
projection.central_meridian = 15.0
projection.scale = 0.9996
projection.false_northing = 0.0
projection.false_easting = 500000.0
```

For information about the calculations used:  http://www.lantmateriet.se/sv/Kartor-och-geografisk-information/GPS-och-geodetisk-matning/Om-geodesi/Kartprojektioner/


## Contributing

1. Fork it ( https://github.com/mbergek/mercator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
