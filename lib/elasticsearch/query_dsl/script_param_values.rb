class ScriptParamValues < Hash
  def method_missing(method_symbol, *args)
    self[method_symbol] = args.first
  end
end
