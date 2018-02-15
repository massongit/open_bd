module OpenBd
  class Resource
    attr_reader :source

    def initialize(source)
      @source = source
    end

    def content
      if !content_source.nil?
        Content.new(content_source).content
      end
    end

    def content_detail
      if !content_source.nil?
        Content.new(content_source).content_detail
      end
    end

    def contributors
      values = source.dig("onix", "DescriptiveDetail", "Contributor")
      if !values.nil?
        values.map { |v| Contributor.new(v) }
      end
    end

    def cover_image
      source.dig("summary", "cover")
    end

    def height
      Paper.new(source.dig("onix", "DescriptiveDetail")).height
    end

    def isbn
      source.dig("summary", "isbn")
    end

    def main_title
      Title.new(source.dig("onix", "DescriptiveDetail")).main_title
    end

    def paper_size
      Paper.new(source.dig("onix", "DescriptiveDetail")).size
    end

    def paper_size_detail
      Paper.new(source.dig("onix", "DescriptiveDetail")).size_detail
    end

    def publisher
      source.dig("summary", "publisher")
    end

    def release_date
      source.dig("summary", "pubdate")
    end

    def sub_title
      Title.new(source.dig("onix", "DescriptiveDetail")).sub_title
    end

    def table_of_contents
      if !content_source.nil?
        Content.new(content_source).table_of_contents
      end
    end

    def title
      Title.new(source.dig("onix", "DescriptiveDetail")).title
    end

    def width
      Paper.new(source.dig("onix", "DescriptiveDetail")).width
    end

    private

    def content_source
      source.dig("onix", "CollateralDetail", "TextContent")
    end
  end
end
