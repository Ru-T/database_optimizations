class ReportsController < ApplicationController
  helper_method :memory_in_mb

  def all_data
    @start_time = Time.now
    @assembly = Assembly.find_by_name(params[:name])
    @memory_used = memory_in_mb

    sequences = Sequence.where(assembly_id: @assembly.id)
    sequence_ids = sequences.map {|s| s.id}

    genes = Gene.where(sequence_id: sequence.ids)
    gene_ids = genes.map {|g| g.id}

    @hits = Hit.where(subject_id: gene_ids).order(percent_similarity: :desc)
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
