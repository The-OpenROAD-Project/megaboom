#!/usr/bin/env python3

import subprocess
import json
import re
import sys


def get_gcloud_auth_token(user):
    with open(".bazelrc") as f:
        all = f.read()

    # Run gcloud command to get the authentication token
    result = subprocess.run(
        ["gcloud", "auth", "print-access-token", user],
        capture_output=True, text=True, check=True)
    token = result.stdout.strip()
    return token


def generate_credentials(user):
    # Get the Bearer token from gcloud
    bearer_token = get_gcloud_auth_token(user)

    # Create the JSON object with the required format
    credentials = {
        "headers": {
            "Authorization": [f"Bearer {bearer_token}"]
        }
    }
    return credentials


def main():
    if len(sys.argv) != 2:
        sys.exit("Usage: python credential_helper.py <USER_EMAIL>")

    credentials = generate_credentials(sys.argv[1])
    print(json.dumps(credentials, indent=2))


if __name__ == "__main__":
    main()
