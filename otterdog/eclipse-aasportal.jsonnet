local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('dt.aasportal', 'eclipse-aasportal') {
  settings+: {
    description: "Eclipse AASPortal",
    name: "Eclipse AASPortal",
    workflows+: {
      actions_can_approve_pull_request_reviews: true,
      default_workflow_permissions: "write"
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
          required_approving_review_count: 0,
          bypass_pull_request_allowances: [
            "@eclipse-aasportal/dt-aasportal-project-leads"
          ],
          requires_status_checks: true,
          required_status_checks: [
            "Build and Test",
          ]
        },
        orgs.newBranchProtectionRule('development') {
          lock_branch: false,
          requires_pull_request: true,
          required_approving_review_count: 0,
          bypass_pull_request_allowances: [
            "@eclipse-aasportal/dt-aasportal-project-leads"
          ],
          requires_status_checks: true,
          required_status_checks: [
            "Build and Test",
          ]
        },
        orgs.newBranchProtectionRule('staging') {
          lock_branch: false,
          requires_pull_request: true,
          required_approving_review_count: 0,
          bypass_pull_request_allowances: [
            "@eclipse-aasportal/dt-aasportal-project-leads"
          ],
          requires_status_checks: true,
          required_status_checks: [
            "Build and Test",
          ]
        },
      ],
    },
  ],
}
