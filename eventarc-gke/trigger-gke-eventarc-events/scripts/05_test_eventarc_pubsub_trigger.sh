#!/bin/bash

# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

TRIGGER_NAME=trigger-pubsub-gke
REGION=us-central1
echo "Get the underlying topic for trigger $TRIGGER_NAME"
TOPIC_ID=$(gcloud eventarc triggers describe $TRIGGER_NAME --location $REGION --format='value(transport.pubsub.topic)')

echo "Send a message to topic $TOPIC_ID"
gcloud pubsub topics publish $TOPIC_ID --message="Hello World"