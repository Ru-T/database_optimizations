class ReportsController < ApplicationController
  helper_method :memory_in_mb

  def all_data
    @start_time = Time.now
    @assembly = Assembly.find_by_name(params[:name])

    @hits = Hit.where(subject: Gene.where(sequence: Sequence.where(assembly: @assembly))).
      order(percent_similarity: :desc)

    @memory_used = memory_in_mb
  end

  def search
    if params[:search]
      @hits = Hit.joins(gene:[:assembly]).
      where("match_gene_name LIKE ? or assembly.name LIKE ?",
      "%#{params[:search]}", "%#{params[:search]}")
    end
  end

  private def memory_in_mb
    `ps -o rss -p #{$$}`.strip.split.last.to_i / 1024
  end

end
