# JavaScript

[Main Site]() 

<!-- TOC -->

- [JavaScript](#javascript)
  - [Intro](#intro)
  - [Tutorials](#tutorials)
    - [General](#general)
    - [Projects](#projects)
    - [Concepts and guides](#concepts-and-guides)
  - [Resources](#resources)
  - [Related](#related)
  - [Alternatives](#alternatives)
  - [Notes](#notes)
    - [`do ... while ...` is an incredible math function.](#do--while--is-an-incredible-math-function)
    - [`eval`](#eval)
  - [](#)

<!-- /TOC -->

## Intro

## Tutorials

### General 

* [A different way of understanding `this` in JavaScript](http://2ality.com/2017/12/alternate-this.html)

* [Tutorial — Learn and build projects with pure JavaScript (No frameworks or libraries)](https://medium.com/@bramtom883/tutorial-learn-and-build-projects-with-pure-javascript-no-frameworks-or-libraries-74a259dcbb79)

* [TestFirst.org - The Home of Test-First Teaching](http://testfirst.org/) - Full stack (I think) TDD based tutorials. Vanilla JS + Ruby.

* [Your Career in Web Development Starts Here | The Odin Project](https://www.theodinproject.com/) - FOS Full stack 'curriculum'. Vanilla JS + Ruby.

* [NodeSchool](https://nodeschool.io/)

* [Modern JavaScript Explained For Dinosaurs  Node.js Collection  
Medium](https://medium.com/the-node-js-collection/modern-javascript-explained-for-dinosaurs-f695e9747b70)

* [(30) Worst JavaScript Flaws That Hackers Love To Abuse - YouTube](https://www.youtube.com/watch?v=0dgmeTy7X3I)

### Reading 

* [Sapper: Towards the ideal web app framework](https://svelte.technology/blog/sapper-towards-the-ideal-web-app-framework)
* [AddyOsmani.com - Essential JavaScript Namespacing Patterns](https://addyosmani.com/blog/essential-js-namespacing/)
* [Robust Client-Side JavaScript  A Developers Guide � molily](https://molily.de/robust-javascript/)
* [How JavaScript works: an overview of the engine, the runtime, and the call 
stack](https://blog.sessionstack.com/how-does-javascript-actually-work-part-1-b0bacc073cf)

### Videos

* [(30) Worst JavaScript Flaws That Hackers Love To Abuse - YouTube](https://www.youtube.com/watch?v=0dgmeTy7X3I)

### Projects

* [Build Custom “Serverless” Push Notifications for Any Website in 6 Minutes with StdLib and PhantomJS](https://medium.com/@jacoblee93/build-custom-serverless-push-notifications-for-any-website-in-6-minutes-with-stdlib-and-phantomjs-ea67c988801f)
* [Module Development Workflow  JavaScript January](https://www.javascriptjanuary.com/blog/module-development-workflow)

### Concepts and guides

* [Await and Async Explained with Diagrams and Examples – Nikolay Grozev](http://nikgrozev.com/2017/10/01/async-await/)
* [Async/Await Will Make Your Code Simpler](https://blog.patricktriest.com/what-is-async-await-why-should-you-care/)
* [JavaScript Factory Functions with ES6+ – JavaScript Scene – Medium](https://medium.com/javascript-scene/javascript-factory-functions-with-es6-4d224591a8b1)
* [How JavaScript works: memory management + how to handle 4 common memory leaks](https://blog.sessionstack.com/how-javascript-works-memory-management-how-to-handle-4-common-memory-leaks-3f28b94cfbec)
( [The this keyword is extremely simple and doesn't require any more than a few bullet points to understand. : 
javascript](https://www.reddit.com/r/javascript/comments/j2j8b/the_this_keyword_is_extremely_simple_and_doesnt/) 

## Resources

* [mbeaudru/modern-js-cheatsheet: Cheatsheet for the JavaScript knowledge you will frequently encounter in modern projects.](https://github.com/mbeaudru/modern-js-cheatsheet)
* [denysdovhan/wtfjs: A list of funny and tricky JavaScript examples](https://github.com/denysdovhan/wtfjs#readme)
* [Mockup](http://plone.github.io/mockup/dev/#pattern) <- Looks super useful, uptodate and comprehensive  
## Related

## Alternatives

---

## Notes

### `do ... while ...` is an incredible math function.
Example: 

```js
 x=>{do{x=x%2==0?x/2:3*x+1;}while(x!=1)}
```

Or sanely:

```js
function coll(x) {
    do{
        if ( x%2 == 0 ) {
            x = x/2
        } else {
            x = 3*x+1
        }
    } while ( x != 1 )
}
```

And recursivley: 

```js
lt("recursive")
function coll_rec(x) {
    x = x%2==0 ? x/2 : 3*x+1
     while (x!=1) return coll_rec(x)
}
```

### `eval`

```js
let x = y => 5
x() // 5
l(x())
x = eval(x+3)
l(x()) // 53
```

### Function Declarations vs Function Expressions

```js
//Function Declaration
function add(a,b) {return a + b};
//Function Expression
let add = function(a,b) {return a + b};
```

FDs are hoisted **with** their content, while in FE only the variable declaration is hoisted.

```js
//- V- actual order -V-
// function fDeclare() { console.log("Declared") }
// let fExpress
fDeclare()
fExpress()
function fDeclare() { console.log("Declared") }
let fExpress = function() { console.log("Expressed") }
```

### History

#### ECMAScript 4

[Coders at Work: Reflections on the Craft of Programming](http://www.codersatwork.com/) - has a discussion between two programmers on both sides of the ECMAScript 4 
vs ES3.1 debate.

[javascript - Why was ECMAScript 4th edition completely scrapped? - Stack 
Overflow](https://stackoverflow.com/questions/2329602/why-was-ecmascript-4th-edition-completely-scrapped)

[ECMAScript Harmony](https://mail.mozilla.org/pipermail/es-discuss/2008-August/003400.html) - A seminal moment in ECMAScript history, where a split which blocked the 
a continued development of the standard. "The Ecma TC39 meeting in Oslo at the end of July was very productive, and if we keep working together, it will be seen as 
seminal when we look back in a couple of years."
