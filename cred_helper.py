#!/usr/bin/env python3

import subprocess
import json
import re
import sys


def get_gcloud_auth_token():
    with open(".user-bazelrc") as f:
        all = f.read()
    # The username is in the .user-bazelrc file as "# user: <username>"
    # fish it out using a regex
    USER = re.search(r"# user: (.*)", all).group(1)

    # Run gcloud command to get the authentication token
    result = subprocess.run(
        ["gcloud", "auth", "print-access-token", USER],
        capture_output=True, text=True, check=True)
    token = result.stdout.strip()
    return token


def generate_credentials():
    # Get the Bearer token from gcloud
    bearer_token = get_gcloud_auth_token()

    # Create the JSON object with the required format
    credentials = {
        "headers": {
            "Authorization": [f"Bearer {bearer_token}"]
        }
    }
    return credentials


def main():
    if len(sys.argv) != 2 or sys.argv[1] != "get":
        sys.exit("Usage: python credential_helper.py get")

    credentials = generate_credentials()
    print(json.dumps(credentials, indent=2))


if __name__ == "__main__":
    main()
