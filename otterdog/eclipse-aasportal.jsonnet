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
    orgs.newRepo('.github') {
    },
    orgs.newRepo('AASPortal') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "AASPortal is a Node.js based web portal for the visualization and management of Asset Administration Shells (AAS).",
      has_wiki: false,
      topics+: [
        "aas",
        "administration-shell",
        "asset-administration-shell",
        "digitaltwin",
        "digitaltwins",
        "industry40",
        "nodejs",
      ],
      webhooks: [
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/aasportal/249742/') {
          content_type: "json",
          events+: [
            "create",
            "delete",
            "pull_request",
            "push"
          ],
          secret: "********",
        },
      ],
      secrets: [
        orgs.newRepoSecret('DOCKERHUB_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('DOCKERHUB_USERNAME') {
          value: "********",
        },
        orgs.newRepoSecret('GH_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          lock_branch: false,
          requires_pull_request: true,
          requires_code_owner_reviews: false,
          require_last_push_approval: false
        },
        orgs.newBranchProtectionRule('development') {
          required_approving_review_count: 0,
          requires_strict_status_checks: true,
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
}
