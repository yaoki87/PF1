class HomesController < ApplicationController
#before_action :authenticate_admin!,except: [:top, :menu]

  def top
  end

  def admin_top
  end

  def menu
  end

end
