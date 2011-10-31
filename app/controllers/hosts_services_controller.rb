class HostsServicesController < ApplicationController    
  respond_to :html, :xml, :js, :json

  def index
    @hosts_services = HostsService.where(:user_id => current_user.id).order('created_at DESC')
    
    respond_with @hosts_services
  end
    
  def show
    @hosts_service = HostsService.where(:id => params[:id]).first
    
    respond_with @hosts_service
  end

  def new
    @hosts_service = HostsService.new :host_id => params[:host_id]
    @hosts_service.user_id = @hosts_service.host.user_id unless @hosts_service.host.nil?
    @services = Service.where(:enabled => true, :monitor => true, :public => true)
    @intervals = Interval.where(:enabled => true, :public => true)
    @hosts = Host.where(:domain_id => @hosts_service.host.domain.id).order('created_at DESC')
    
    respond_with @hosts_service
  end

  def edit
    @hosts_service = HostsService.where(:id => params[:id]).first
    @services = Service.where(:enabled => true, :monitor => true, :public => true, :id => @hosts_service.service.id)
    @intervals = Interval.where(:enabled => true, :public => true)
    @hosts = Host.where(:id => @hosts_service.host.id)
    respond_with @hosts_service
  end

  def create
    @hosts_service = HostsService.new params[:hosts_service]
    @hosts_service.enabled = true
    
    if @hosts_service.save
      flash[:notice] = I18n.t :hosts_service_created
      respond_with @hosts_service
    else
      render :action => :new
    end
  end

  def update
    @hosts_service = HostsService.where(:id => params[:id]).first
    @hosts_service.enabled = true
  
    if @hosts_service.update_attributes params[:hosts_service]
      flash[:notice] = I18n.t :hosts_service_updated
      respond_with @hosts_service
    else
      render :action => :edit
    end
  end

  def destroy
    @hosts_service = HostsService.where(:id => params[:id]).first
    @hosts_service.destroy
    
    respond_with @hosts_service
  end
  
  def threads_test
    @host_service = HostsService.where(params[:id]).first
    worker_response = MiddleMan.worker(:monitor_worker).threads_test(:arg => {:id => @host_service.id})
    redirect_to @hosts_service.host, notice: "Threads Test was successfully queued. Result => #{worker_response}"
  end
    
  def manual_test
    @host_service = HostsService.where(params[:id]).first
    worker_response = MiddleMan.worker(:monitor_worker).services_check(:arg => {:id => @host_service.id})
    redirect_to @host_service, notice: "Manual Test was successfully executed. Result => #{worker_response}"
  end
    
end
