#!/bin/bash

echo Release version?

read version

mvn release:prepare release:perform -Dgoals=install -DreleaseVersion=$version

cp ~/.m2/repository/com/github/gv2011/parent/$version/parent-$version.pom ./target

mvn gpg:sign-and-deploy-file -Durl=https://oss.sonatype.org/service/local/staging/deploy/maven2/ -DrepositoryId=ossrh -DpomFile=./target/parent-$version.pom -Dfile=./target/parent-$version.pom
