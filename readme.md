This project will build gradle projects.

* Build this project: `docker build -t ci-build-gradle .`
* Run: `docker run --rm -v ~/dev/sbux/spring-ref-arch/:/source -it ci-build-gradle build /source`

Default buildSpec:
```
buildSpec:
  buildImageName: ci-build-gradle
  buildImageTag: latest
  buildScriptPath: build
  validateScriptPath: validate
```

### Gradle Wrapper

* As it is good practice to use the Gradle wrapper in your source repo, the docker image also includes buildw (i.e., `buildScriptPath: buildw`), which will use the repository's Gradle wrapper.  There's also a validatew.
* Otherwise, we're using whatever version of gradle Ubuntu includes in whatever version of Ubuntu this image is built from.  I'm sure nothing will go wrong!

### Includes dependencies

* When the docker image is built, it builds an empty project to load this image with all the dependency jars so they won't need to be re-downloaded
* Run this container: `docker run --rm -v $SOURCE:/source -it ci-build-gradle bash`
