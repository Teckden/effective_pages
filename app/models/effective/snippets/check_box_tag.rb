module Effective
  module Snippets
    class CheckBoxTag < Snippet
      attribute :label, String
      attribute :html_class, String

      def value_type
        Boolean
      end

      def snippet_name
        'Check Box Tag'
      end

      def snippet_image
        '/assets/effective_pages/check_box_tag.png'
      end

      def snippet_description
        'Standard form check box'
      end

    end
  end
end
