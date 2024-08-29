roles = [
  {
    name                = "atomiq_monitoring_metrics"
    assume_role_policy  = "atomiq_monitoring_metrics_role.json"
    inline_policy       = "atomiq_monitoring_metrics.json"
  }
]

#don't forget to add , when add more role
