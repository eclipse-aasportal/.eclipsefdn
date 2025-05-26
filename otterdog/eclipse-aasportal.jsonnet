local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('dt.aasportal', 'eclipse-aasportal') {
  settings+: {
    description: "Eclipse AASPortal",
    name: "Eclipse AASPortal",
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('aasportal') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "AASPortal",
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          lock_branch: false,
          requires_pull_request: true,
          requires_code_owner_reviews: false,
          require_last_push_approval: false,
          allows_force_pushes: true,
        },
        orgs.newBranchProtectionRule('staging') {
          lock_branch: false,
          requires_pull_request: true,
          requires_code_owner_reviews: false,
          require_last_push_approval: false,
          allows_force_pushes: true,
        },
      ],
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
