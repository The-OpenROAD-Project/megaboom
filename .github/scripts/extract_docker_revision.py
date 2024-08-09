import json
from pathlib import Path
import sys
from typing import Optional


def find_docker_orfs(data: dict) -> Optional[dict]:
    """
    Recursively search for the 'docker_orfs' configuration in
    the provided JSON data.

    Parameters
    ----------
    data : dict
        The JSON data to search for the 'docker_orfs' configuration.

    Returns
    -------
    Optional[dict]
        The 'docker_orfs' configuration if found, otherwise None.
    """
    if isinstance(data, dict):
        if 'docker_orfs' in data:
            return data['docker_orfs']
        for key, value in data.items():
            result = find_docker_orfs(value)
            if result:
                return result
    elif isinstance(data, list):
        for item in data:
            result = find_docker_orfs(item)
            if result:
                return result
    return None


if __name__ == "__main__":
    if len(sys.argv) < 2 or not Path(sys.argv[1]).exists():
        print(f"Usage: {sys.argv[0]} <MODULE.bazel>")
        exit(1)

    with open(sys.argv[1], 'r') as file:
        try:
            data = json.load(file)
        except json.JSONDecodeError:
            print(f"Unable to parse JSON data from {sys.argv[1]}")
            exit(1)

        docker_orfs = find_docker_orfs(data)
        if docker_orfs is None or docker_orfs.get('attributes', None) is None:
            print("Unable to find 'docker_orfs' configuration in the provided file")    # noqa: E501
            exit(1)

    docker_tag = docker_orfs.get('attributes').get('image', None)
    docker_sha256 = docker_orfs.get('attributes').get('sha256', None)

    if docker_tag is None or docker_sha256 is None:
        print("Unable to find Docker tag or SHA256 in the provided file.")
        exit(1)

    print(json.dumps({
            'image': f"{docker_tag}@sha256:{docker_sha256}",
            'tag': docker_tag,
            'sha256': docker_sha256
    }))
