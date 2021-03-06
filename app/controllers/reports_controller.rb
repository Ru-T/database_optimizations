class ReportsController < ApplicationController
  helper_method :memory_in_mb

  def all_data
    @start_time = Time.now
    @assembly = Assembly.find_by_name(params[:name])

    @hits = Hit.where(subject: Gene.where(sequence: Sequence.where(assembly: @assembly))).
      order(percent_similarity: :desc)

    @memory_used = memory_in_mb
  end

  def import
    @hits = Hit.import(params[:file])
    UploadCsvJob.perform_later(@hits)
    redirect_to reports_upload_path, notice: "Your file has been imported"
  end

  def upload
    @assembly = Assembly.find_by_name(params[:name])

    @hits = Hit.where(subject: Gene.where(sequence: Sequence.where(assembly: @assembly))).
      order(percent_similarity: :desc)
  end

  private def memory_in_mb
    `ps -o rss -p #{$$}`.strip.split.last.to_i / 1024
  end

end
