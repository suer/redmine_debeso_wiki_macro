require 'redmine'
require 'open-uri'
require 'json'
require 'rexml/document'
module DebesoWikimacro
  Redmine::WikiFormatting::Macros.register do
    desc "debeso(str)"
    macro(:debeso) do |obj, args|
      if args.nil? or args.size < 1
        return ''
      end
      atag = args[0]
      doc = REXML::Document.new(atag)
      code = ''
      puts doc.root.text
      open(doc.root.text) {|f| code = f.read}
      code
    end
  end
end
