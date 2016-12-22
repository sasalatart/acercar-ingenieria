class RulesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rule, only: [:edit, :update]
  before_action :authorize_admin

  def index
    @rule = Rule.new
  end

  def new
    params[:category] ||= Topic.model_name.param_key
    @url = "/rules/#{params[:category]}s"
    @category = t "#{params[:category]}s"

    @rule = Rule.new
  end

  def create
    @rule = Rule.new(rule_params)
    @rules.category = params[:category].split('_').collect(&:capitalize).join(' ')

    if @rule.save
      redirect_to rules_path, notice: 'Se han creado las nuevas reglas.'
    else
      redirect_to rules_path, alert: GENERIC_ERROR_MESSAGE
    end
  end

  def edit
    @category = t "#{params[:category]}s"
  end

  def update
    if @rule.update_attributes(rule_params)
      redirect_to rules_path, notice: 'Se han actualizado las reglas.'
    else
      redirect_to rules_path, alert: GENERIC_ERROR_MESSAGE
    end
  end

  private

  def set_rule
    @rule = Rule.find(params[:id])
  end

  def rule_params
    params.require(:rule).permit(:content, :category)
  end
end
