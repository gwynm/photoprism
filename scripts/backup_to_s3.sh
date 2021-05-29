#!/bin/bash
rclone sync --s3-provider="AWS" --s3-env-auth="true" --s3-region=$AWS_REGION /photoprism/originals :s3:$AWS_BUCKET

