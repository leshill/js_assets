require 'spec_helper'

describe JsAssets::JavascriptCompiler do
  context "#precompile" do
    let(:compiler) { JsAssets::JavascriptCompiler.new(nil, nil, nil, nil) }

    it "calls the method on the context passing the arguments" do
      context = double call: true
      allow(compiler).to receive(:context).and_return context
      expect(context).to receive(:call).with 'method', 'a', 'b'
      compiler.precompile 'method', 'a', 'b'
    end
  end
end
