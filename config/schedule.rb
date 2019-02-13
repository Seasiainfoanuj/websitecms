set :job_template, "bash -l -c '[[ ! -f /tmp/STOP_CRONS ]] && . /etc/app_description && . $APP_LOCATION/shared/envvars && :job'"

every 1.day, at: "6am" do
  rake "sitemap:generate"
end
