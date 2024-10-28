@Library('utils@orfs-v2.2.2') _


// Prevent builds stomping on each other and set a timeout to avoid runaways
options {
    disableConcurrentBuilds(abortPrevious: true);
    timeout(time: 72, unit: 'HOURS');
}

// kick off worker using megaboom cloud definition
node('gce-megaboom-central1') {
    properties([copyArtifactPermission('${JOB_NAME},'+env.BRANCH_NAME)]);

    // checkout megaboom and apply PR
    stage('Checkout Megaboom') {
        checkout([
            $class: 'GitSCM',
            branches: [[name: scm.branches[0].name]],
            extensions: [
                [$class: 'CloneOption', noTags: false],
            ],
            userRemoteConfigs: scm.userRemoteConfigs
        ]);
        def description = sh(script: "git log -1 --pretty=%B", returnStdout: true).trim();
        if (description.contains('ci') && description.contains('skip')) {
            currentBuild.result = 'SKIPPED'; // 'SUCCESS', 'SKIPPED'
            return;
        }
    }

    def DOCKER_IMAGE;
    
    // Run docker build for machine image
    stage('Build and Push Docker Machine Image') {
        DOCKER_IMAGE = dockerPush('ubuntu22.04', 'megaboom');
	echo "Docker image is $DOCKER_IMAGE";
    }

    // execute bazel to build BoomTile through grt stage
    stage('Build Megaboom') {
	buildMegaboom(DOCKER_IMAGE);
    }

    // TODO Add some smoke tests

    stage ('Cleanup and Reporting') {
        finalReport(DOCKER_IMAGE, "megaboom");
    }
}

