#
# Description: <Method description here>
#

tower_job_id = $evm.root['tower_job_id'].to_s
if tower_job_id.blank?
  $evm.log(:warn, "No Tower Job ID returned, cannot get output")
else
  job = $evm.vmdb(:ManageIQ_Providers_EmbeddedAnsible_AutomationManager_Job).where(["ems_ref = ?", tower_job_id]).first
  $evm.log(:info, "Output from previous Ansible playbook: \n#{job.stdout}")
end
