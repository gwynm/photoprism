#!/bin/bash
mkdir /photoprism/db_backups
photoprism backup -i -a - | gzip > /photoprism/db_backups/backup_`date "+%Y-%m-%d-%H-%M-%S"`.gz
rclone sync --s3-provider="AWS" --s3-env-auth="true" --s3-region=$AWS_REGION /photoprism/db_backups :s3:$AWS_BUCKET/db_backups
rclone sync --s3-provider="AWS" --s3-env-auth="true" --s3-region=$AWS_REGION /photoprism/originals :s3:$AWS_BUCKET/originals