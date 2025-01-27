local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('dt.aasportal', 'eclipse-aasportal') {
  settings+: {
    description: "",
    name: "Eclipse AASPortal project",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('aasportal-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "AASPortal project website",
      web_commit_signoff_required: false,
    },
  ],
}
