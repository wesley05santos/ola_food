class ConfigurationsController < ApplicationController
  def show
    @configuration = current_user.configuration
  end

  def edit
    @configuration = current_user.configuration
  end

  def update
    @configuration = current_user.configuration
    return redirect_to @configuration if @configuration.update(configuration_params)

    render :edit
  end

  private

  def configuration_params
    return {colors: []} unless params.dig(:configuration)

    params.require(:configuration).permit(colors: [])
  end
end
