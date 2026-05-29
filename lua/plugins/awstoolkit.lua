return {
  "wingitman/awstoolkitwrapper.nvim",
  keys = {
    { "<leader>als", "<cmd>AwsToolkitSsoLogin<cr>", desc = "AwsToolkit: " },
    { "<leader>all", "<cmd>AwsToolkitListLambdas<cr>", desc = "AwsToolkit: " },
    { "<leader>ali", "<cmd>AwsToolkitInvokeLambda<cr>", desc = "AwsToolkit: " },
    { "<leader>alu", "<cmd>AwsToolkitUploadLambdaZip<cr>", desc = "AwsToolkit: " },
    { "<leader>ald", "<cmd>AwsToolkitDownloadLambda<cr>", desc = "AwsToolkit: " },
    { "<leader>alb", "<cmd>AwsToolkitSamBuild<cr>", desc = "AwsToolkit: " },
    { "<leader>ald", "<cmd>AwsToolkitSamDeploy<cr>", desc = "AwsToolkit: " },
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
