include RSpec

require_relative 'city'
require_relative 'tsp_greed'

RSpec.describe TravelingSalesman, type: Class do
  let (:traveling_salesman) {TravelingSalesman.new}

  let (:austin) { City.new('Austin') }
  let (:dallas) { City.new('Dallas') }
  let (:houston) { City.new('Houston') }
  let (:okc) { City.new('Oklahoma City') }
  let (:sa) { City.new('San Antonio') }
  let (:new_orleans) { City.new('New Orleans') }

  before do
    austin.neighbor_hash = {  dallas  =>      195,
                              houston =>      147,
                              new_orleans =>  506,
                              okc =>          386,
                              sa =>           76
                            }
    dallas.neighbor_hash = {  austin =>       195,
                              houston =>      239,
                              new_orleans =>  510,
                              okc =>          206,
                              sa =>           274
                            }
    houston.neighbor_hash = { dallas =>       239,
                              austin =>       147,
                              new_orleans =>  348,
                              okc =>          447,
                              sa =>           197
                            }
    okc.neighbor_hash =     { dallas =>       206,
                              austin =>       386,
                              new_orleans =>  708,
                              houston =>      447,
                              sa =>           467
                            }
    sa.neighbor_hash =      { dallas =>       274,
                              austin =>       76,
                              new_orleans =>  543,
                              houston =>      197,
                              okc =>          467
                            }
    new_orleans.neighbor_hash = { dallas =>    510,
                                  austin =>    506,
                                  houston =>   348,
                                  okc =>       708,
                                  sa =>        543
                                }
  end

  describe "#nearest_neighbor" do
    it "finds the nearest_neigbor for a city" do
      expect(traveling_salesman.nearest_neighbor(austin)).to eq(sa)
      expect(traveling_salesman.nearest_neighbor(dallas)).to eq(austin)
    end
  end

  describe "#travel_path" do
    it "finds path following shortest dist to next city" do
      expect(traveling_salesman.travel_path(austin)).to eq(["Austin", "San Antonio", "Houston", "Dallas", "Oklahoma City", "New Orleans"])
    end
  end
end
