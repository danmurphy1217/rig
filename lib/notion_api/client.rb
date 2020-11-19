require_relative "types"
require_relative "block"
require "gemoji"

module Notion
  attr_reader :token_v2

  class Client < Block
    def initialize(token_v2)
      @token_v2 = token_v2
    end
  end
end


heart = Emoji.find_by_alias("heart").raw

@client = Notion::Client.new(ENV["token_v2"])

#! get a page (referred to as a root-level block)
@block = @client.get_block("78c5ed52-3c42-481e-9691-3fa57ee96b17")
#TODO: when a top-level page is retrieved, I am returning it with its ID == parent_ID but technically this isn't true.
#TODO: Its parent is some "core level" page defined in the "Space" table. This holds true for each page, so I should
#TODO: find a better way to handle this that does not disrupt the data accuracy of the class I am returning.
# p Classes.each { |cls| @block.create(Notion.const_get(cls.to_s), DateTime.now.strftime("%H:%M:%S on %B %d %Y"), loc="df9a4bf7-0e0d-78d9-fa13-c5df01df033b") }