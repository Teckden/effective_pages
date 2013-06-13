module Effective
  class PagesController < ApplicationController
    skip_authorization_check if defined?(CanCan)
    respond_to :html

    def show
      @page = Effective::Page.where(:slug => params[:id]).first
      EffectivePages.authorized?(self, @page, :read)

      #raise ActiveRecord::RecordNotFound unless @page.published?

      template = EffectivePages.templates[@page.template]
      template_info = EffectivePages.templates_info[@page.template]
      raise EffectivePages::TemplateNotFound.new(@page.template) unless (template and template.kind_of?(HashWithIndifferentAccess))

      # Assign all content areas
      (template[:regions] || {}).each { |region, _| content_for(region, @page.regions[region]) }

      render "#{EffectivePages::templates_path.chomp('/')}/#{@page.template}", :layout => (template_info[:layout] || :application)
    end

    def update
      @page = Effective::Page.where(:slug => params[:requested_uri]).first
      EffectivePages.authorized?(self, @page, :update)

      # Do the update.
      params[:content].each { |region, vals| @page.regions[region] = vals[:value] }

      if @page.save
        render :text => '', :status => 200
      else
        render :text => '', :status => :unprocessable_entity
      end
    end

    private

    # https://gist.github.com/hiroshi/985457
    def content_for(region, content)
      (@_content_for ||= {})[region] = content
    end

    def view_context
      super.tap do |view|
        (@_content_for || {}).each { |name, content| view.content_for name.to_sym, content.try(:html_safe) }
      end
    end
  end
end
