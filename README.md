[Maven]: http://maven.apache.org/

# pom

A shell script and associated XSL stylesheets for reporting on details of a
[Maven] POM.

## Installation

```
curl https://raw.github.com/kbzod/pom/master/pom -o ~/bin/mvnpd && chmod +x ~/bin/mvnpd
for n in art pd ver
do
  curl https://raw.github.com/kbzod/pom/master/pom_${n}.xsl -o ~/bin/pom_${n}.xsl
done
```

## Usage

Run with no arguments for help, including a list of recognized commands.

```
$ pom
```

Pass just a command to analyze pom.xml in the current directory. To analyze a
different POM, pass its path as an additional argument after the command.

```
$ pom ver  # defaults to pom.xml
$ pom ver pom2.xml
```

### Commands

#### art

Dumps out the artifact specification in the typical colon-separated format.

```
$ pom art
my.group:artifact:1.2.3:war
```

#### ver

Dumps out just the version string.

```
$ pom ver
1.2.3
```

#### dep

Lists the non-transitive dependencies.

```
$ pom dep
group1:artifact1:1.2.3:jar
group2:artifact2:4.5.6:jar
```

### pd

Lists the ID of each profile, along with how it is activated, whether by
default, JDK, OS, property, or file.

```
$ pom pd
Profile: db-test
  active for system property db = test

Profile: db-prod
  active for system property db = prod
```
