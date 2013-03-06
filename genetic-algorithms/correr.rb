require './Gabil'

begin

	g = Gabil.new(0.01, 16, 690)
	g.load_examples(g.outputs, "crx.data")
	

end