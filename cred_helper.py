#!/usr/bin/env python3
#
# Returns information about user's GCP entitlements
#
# Usage: cred_helper.py [get|test]
#
#     get prints the GCP auth token
#     test prints the user's GCP entitlements
#
# Calling script without arguments prints out usage information and then exits with a non-zero code (per spec)
#

import subprocess
import requests
import json
import re
import sys


def get_gcloud_auth_token(test):
    """
    Returns the gcloud auth token based on the .user-bazelrc
    """

    with open(".user-bazelrc") as f:
        all = f.read()
    match = re.search(r"# user: (.*)", all)
    if match is None:
        sys.exit('Did not find username in .user-bazelrc file as "# user: <username>"')
    USER = match.group(1)

    cmd = ["gcloud", "auth", "print-access-token", USER]
    if test:
        print("Running: " + subprocess.list2cmdline(cmd))
    result = subprocess.run(cmd, capture_output=True, text=True, check=True)
    token = result.stdout.strip()
    return token


def generate_credentials(test):
    bearer_token = get_gcloud_auth_token(test)

    credentials = {"headers": {"Authorization": f"Bearer {bearer_token}"}}
    return credentials


def test_permissions(credentials, bucket_name):
    url = (
        f"https://storage.googleapis.com/storage/v1/b/{bucket_name}/iam/testPermissions"
    )
    permissions = {"permissions": ["storage.buckets.get", "storage.objects.create"]}

    response = requests.get(url, params=permissions, headers=credentials["headers"])
    response.raise_for_status()
    return response.json()


def main():
    if len(sys.argv) <= 1 or (len(sys.argv) >= 2 and sys.argv[1] not in ["get", "test"]):
        sys.exit("Usage: python credential_helper.py [get|test]")
    test = sys.argv[1] == "test"

    credentials = generate_credentials(test)
    if not test:
        print(json.dumps(credentials, indent=2))
        return

    permissions = test_permissions(credentials, "megaboom-bazel-artifacts")

    print(json.dumps(permissions, indent=2))


if __name__ == "__main__":
    main()
