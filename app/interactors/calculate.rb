# frozen_string_literal: true

class Calculate
  include Interactor

  # input interface
  delegate :cl_in_micrograms, :pt_in_micrograms, :location_type, to: :context

  # internal aliases
  delegate :calculated_cl_value, :calculated_pt_value, to: :context

  # - Rios
  #  IET (CL) = 10x(6-((-0.7-0.6x(ln CL))/ln 2))-20
  #  IET (PT) = 10x(6-((0.42-0.36x(ln PT))/ln 2))-20

  # - Reservatórios
  #  IET (CL) = 10x(6-((0.92-0.34x(ln CL))/ln 2))
  #  IET (PT) = 10x(6-(1.77-0.42x(ln PT))/ln 2))

  # IET = [IET(PT) + IET(CL)] / 2

  def call
    context.calculated_cl_value = calculate_cl
    context.calculated_pt_value = calculate_pt
    context.iet_value = (calculated_pt_value + calculated_cl_value) / 2.0
  end

  private

  def calculate_cl
    return ((10 * (6 - ((-0.7 - (0.6 * ln_cl)) / ln2))) - 20) if rios?
    return (10 * (6 - ((0.92 - (0.34 * ln_cl)) / ln2))) if reservatorios?
  end

  def calculate_pt
    return ((10 * (6 - ((0.42 - (0.36 * ln_pt)) / ln2))) - 20) if rios?
    return (10 * (6 - ((1.77 - (0.42 * ln_pt)) / ln2))) if reservatorios?
  end

  def ln_cl
    Math.log(cl_in_micrograms, Math::E)
  end

  def ln_pt
    Math.log(pt_in_micrograms, Math::E)
  end

  def ln2
    Math.log(2, Math::E)
  end

  def reservatorios?
    location_type == 'reservatorios'
  end

  def rios?
    location_type == 'rios'
  end
end
