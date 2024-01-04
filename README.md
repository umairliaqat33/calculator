# calculator

Calculator

## Getting Started

I cloned this project after a long time, it had an old version of flutter.
What i did to solve this problem is given below in steps:
1. I upgaded its packages
2. Then i ran flutter pub outdated
3. In next step i ran this command "./gradlew wrapper --gradle-version=7.6.1" to upgrade its gradle version.
4. Next step was to update compileSdkVersion in app level gradle file, i changed it to 31.
5. Then i had to update the     ext.kotlin_version  which i changed to '1.9.22' after checking on kotlin's website "https://kotlinlang.org/docs/releases.html#release-details"

After all these steps my project was good to go.

