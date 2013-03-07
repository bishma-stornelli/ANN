require './Gabil'

begin

	g = Gabil.new()
	g.load_examples(g.inputs, g.outputs, "crx.data")

	g.dropCondition(7)
	

end