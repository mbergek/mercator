require 'test_helper'

# http://bit.ly/1HGXANA

module MiniTest::Assertions
  def assert_almost_equal(exp, act)
    if exp.kind_of?(Array) && act.kind_of?(Array)
      exp.zip(act).each do |obj|
        assert_in_delta(obj[0], obj[1])
      end
    else
      assert_in_delta(exp, act)
    end
  end
end

class MercatorTest < Minitest::Unit::TestCase

  def setup
    @datum = Mercator::WGS84.new
    @projection = Mercator::Sweref99TM.new    
  end

  # These are the control points for SWEREF 99 TM as defined on the web page http://bit.ly/1HGXANA
  def test_grid_to_spherical_55_00_12_45
    assert_almost_equal [12.75, 55.00], Mercator.grid_to_spherical(6097106.672, 356083.438, @datum, @projection)
  end
  def test_grid_to_spherical_55_00_14_15
    assert_almost_equal [14.25, 55.00], Mercator.grid_to_spherical(6095048.642, 452024.069, @datum, @projection)
  end
  def test_grid_to_spherical_57_00_12_45
    assert_almost_equal [12.75, 57.00], Mercator.grid_to_spherical(6319636.937, 363331.554, @datum, @projection)
  end
  def test_grid_to_spherical_57_00_19_30
    assert_almost_equal [19.50, 57.00], Mercator.grid_to_spherical(6326392.707, 773251.054, @datum, @projection)
  end
  def test_grid_to_spherical_59_00_11_15
    assert_almost_equal [11.25, 59.00], Mercator.grid_to_spherical(6546096.724, 284626.066, @datum, @projection)
  end
  def test_grid_to_spherical_59_00_19_30
    assert_almost_equal [19.50, 59.00], Mercator.grid_to_spherical(6548757.206, 758410.519, @datum, @projection)
  end
  def test_grid_to_spherical_61_00_12_45
    assert_almost_equal [12.75, 61.00], Mercator.grid_to_spherical(6764877.311, 378323.440, @datum, @projection)
  end
  def test_grid_to_spherical_61_00_18_45
    assert_almost_equal [18.75, 61.00], Mercator.grid_to_spherical(6768593.345, 702745.127, @datum, @projection)
  end
  def test_grid_to_spherical_63_00_12_00
    assert_almost_equal [12.00, 63.00], Mercator.grid_to_spherical(6989134.048, 348083.148, @datum, @projection)
  end
  def test_grid_to_spherical_63_00_19_30
    assert_almost_equal [19.50, 63.00], Mercator.grid_to_spherical(6993565.630, 727798.671, @datum, @projection)
  end
  def test_grid_to_spherical_65_00_13_30
    assert_almost_equal [13.50, 65.00], Mercator.grid_to_spherical(7209293.753, 429270.201, @datum, @projection)
  end
  def test_grid_to_spherical_65_00_21_45
    assert_almost_equal [21.75, 65.00], Mercator.grid_to_spherical(7225449.115, 817833.405, @datum, @projection)
  end
  def test_grid_to_spherical_67_00_16_30
    assert_almost_equal [16.50, 67.00], Mercator.grid_to_spherical(7432168.174, 565398.458, @datum, @projection)
  end
  def test_grid_to_spherical_67_00_24_00
    assert_almost_equal [24.00, 67.00], Mercator.grid_to_spherical(7459745.672, 891298.142, @datum, @projection)
  end
  def test_grid_to_spherical_69_00_21_00
    assert_almost_equal [21.00, 69.00], Mercator.grid_to_spherical(7666089.698, 739639.195, @datum, @projection)
  end

end