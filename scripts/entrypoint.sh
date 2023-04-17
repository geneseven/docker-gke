#!/bin/bash
gcloud container clusters get-credentials <cluster> --region <region> --project <project_id>

exec $@
