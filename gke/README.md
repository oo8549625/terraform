### terraform

terraform init：此命令用於初始化 Terraform 配置目錄。它下載必要的提供程序並設置用於存儲 Terraform 狀態的後端。

terraform plan：此命令用於創建執行計劃。它向您展示了 Terraform 將對您的基礎架構進行的更改，而無需實際進行這些更改。

terraform apply：此命令用於應用 Terraform 計劃中描述的更改。它創建或修改 Terraform 配置中指定的基礎設施。

terraform show：此命令用於查看 Terraform 狀態或執行計劃。

terraform destroy：此命令用於銷毀 Terraform 管理的基礎設施。它刪除基礎設施並更新 Terraform 狀態以反映更改。

terraform refresh：此命令用於更新 Terraform 狀態以反映基礎設施的當前狀態。

terraform output：此命令用於顯示 Terraform 配置中聲明的輸出值。

### kubeconfig

helm 部署需要知道gke的kubeconfig位置

values.yaml文檔需放置helm抓得到的地方