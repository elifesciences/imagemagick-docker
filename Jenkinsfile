elifePipeline {
    def commit
    stage 'Checkout', {
        checkout scm
        commit = elifeGitRevision()
    }

    node('containers-jenkins-plugin') {
        stage 'Build images', {
            checkout scm
            sh "IMAGE_TAG=${commit} ./build.sh"
        }

        stage 'Smoke tests', {
            sh "IMAGE_TAG=${commit} ./run.sh"
        }

        elifeMainlineOnly {
            stage 'Push images', {
                image = DockerImage.elifesciences(this, "imagemagick", commit)
                image.push().tag('latest').push()
            }
        }
    }
}
