# GCP-IaCs-with-Terraform
 Different Google Cloud Platform resources written with Terraform.

-----------

<div align="center">

![](https://img.shields.io/badge/Terraform-Version%201.3.3-white?style=plastic&logo=terraform)&nbsp; 
![](https://img.shields.io/badge/Python-Version%203.10-yellow?style=plastic&logo=python)&nbsp;
<!-- ![](https://img.shields.io/badge/Packer-Version%20%3E=%200.0.2-blue?style=plastic&logo=packer)&nbsp; -->

</div>

----------

# List Of Infrastructures:
- [1001 VPC](./1001%20VPC%20Network%20/)
- [1002 Compute Engine](./1002%20Compute%20Engine/)
- [1003 VPC subnetting]
- [Cloud Storage]
    - create bucket
    - upload objects to the bucket
- 1004 Cloud Functions
- 1005 Cloud Run
- 1006 Google Cloud CDN
    - serve bucket contents 
    - serve static website

## Configure GCloud CLI for Terraform
1. set the current project -
```bash
gcloud auth list
gcloud config get-value project
gcloud config set project utility-cathode-451011-t4 # project id
```

2. Create a service acc [ convention: sa-{short_project_name}-tf-{Environment} ]
```bash
gcloud iam service-accounts create sa-mfp-tf-dev --project utility-cathode-451011-t4 --display-name "Terraform dev acc"
```

3. Assign role (permission) -
```bash
gcloud projects add-iam-policy-binding utility-cathode-451011-t4 --member="serviceAccount:sa-mfp-tf-dev@utility-cathode-451011-t4.iam.gserviceaccount.com" --role="roles/editor"
```

4. Download the key -
```bash
gcloud iam service-accounts keys create ~/.config/gcloud/utility-cathode-451011-t4.json --iam-account=sa-mfp-tf-dev@utility-cathode-451011-t4.iam.gserviceaccount.com
```

##### Ashraf Minhaj
##### Find me on LinkedIn [Ashraf-Minhaj](https://www.linkedin.com/in/ashraf-minhaj/)