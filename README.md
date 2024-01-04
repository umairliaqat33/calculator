# calculator

Calculator

## Getting Started

I cloned this project after a long time, it had an old version of flutter.
What i did to solve this problem is given below in steps:
1. Upgraded its packages first.
2. Then i ran flutter pub outdated.
3. In next step i ran this command "./gradlew wrapper --gradle-version=7.6.1" to upgrade its gradle version.
4. Next step was to update compileSdkVersion in app level gradle file, i changed it to 31.
5. Then i had to update the     ext.kotlin_version  which i changed to '1.9.22' after checking on kotlin's website "https://kotlinlang.org/docs/releases.html#release-details".

After all these steps my project was good to go.

6. Removed the debug tag.
7. Converted MyApp from statelfull to stateless.
8. added media query sizes.
9. Removed commented Code.
10. Made code resueable.
11. Separated UI from functionality.
12. Removed differences from all button where they were same.
13. Changed colors of operation buttons.
14. Changed colors of all numeric buttons to differentiate between them.
15. Made equal button look bigger.
16. Solved button's distance and sizes issues by giving them a min width and height.
17. Expression and result text widgets were not looking good. They had some disturbed sizes and locations gave them size and set their location to right bottom.
18. Expression text did not had a place holder, added 0 as a place holder.
19. Separated clear and delete functions