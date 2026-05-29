return {
  "wingitman/awstoolkitwrapper.nvim",
  keys = {
    { "<leader>als", "<cmd>AwsToolkitSsoLogin<cr>", desc = "AwsToolkit: SSO" },
    { "<leader>all", "<cmd>AwsToolkitListLambdas<cr>", desc = "AwsToolkit: List" },
    { "<leader>ali", "<cmd>AwsToolkitInvokeLambda<cr>", desc = "AwsToolkit: Invoke" },
    { "<leader>alu", "<cmd>AwsToolkitUploadLambdaZip<cr>", desc = "AwsToolkit: Upload" },
    { "<leader>ald", "<cmd>AwsToolkitDownloadLambda<cr>", desc = "AwsToolkit: Download" },
    { "<leader>alsb", "<cmd>AwsToolkitSamBuild<cr>", desc = "AwsToolkit: SamBuild" },
    { "<leader>alsd", "<cmd>AwsToolkitSamDeploy<cr>", desc = "AwsToolkit: SamDeploy" },
  },
  config = function()
    require("awstoolkitwrapper").setup({
      invoke_payload = "event.json",
      download_dir = "aws-lambdas",
    })
  end,
}
--[[

{ "<leader>al", "<cmd>AwsToolkitSsoLogin<cr>", desc = "AwsToolkit: " },
{ "<leader>al", "<cmd>AwsToolkitListLambdas<cr>", desc = "AwsToolkit: " },
{ "<leader>al", "<cmd>AwsToolkitInvokeLambda<cr>", desc = "AwsToolkit: " },
{ "<leader>al", "<cmd>AwsToolkitUploadLambdaZip<cr>", desc = "AwsToolkit: " },
{ "<leader>al", "<cmd>AwsToolkitDownloadLambda<cr>", desc = "AwsToolkit: " },
{ "<leader>al", "<cmd>AwsToolkitSamBuild<cr>", desc = "AwsToolkit: " },
{ "<leader>al", "<cmd>AwsToolkitSamDeploy<cr>", desc = "AwsToolkit: " },


--]]
