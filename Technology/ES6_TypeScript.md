# ES6 & TypeScript # 

_My notes from following the ES6 and TypeScript Tutorial by Codevolution._ 

## ES5 ## 
* JavaScript -- based on a standard implementation called ECMA Script. 
* The version of ECMA Script that was being used was Version 5 [ergo, ES5]. 

## ES6 ## 
* ECMA Script 2015 was a major update to ES5. 
* It brought a lot of new features to the table, and is colloquially known as ES6. 

## TypeScript ## 
* TypeScript is a free, open-source programming language developed by Microsoft. 
* It is a typed subset of JS that compiles to plain JS and contains features of ES5 and ES6. 
* TypeScript, as the name suggests, implements types (numbers, strings, etc.) in JS, but their use is completely optional. 
* Using TS/the implementing types enables one to write safer, bug-free code. 

## Transpilers ## 
ES6 ships with a lot of new features.  
However, not all browsers have all these features implemented.  
* Chrome and Firefox led the pack post-launch in terms of percentage of features implemented.  
* With time, browsers moved towards implementing all the available features.  

This is where a transpiler comes in handy.  
* Will use a transpiler to transpile ES6 code into ES5 code which does run on all browsers.  
* Examples of transpilers: babel, traceur  
* However, we will be using TypeScript as the transpiler.  

## Var Hoisting & Functional Scope ## 
Var hosting is JavaScript's default behavior of moving declarations to the top.  
* This allows for variables to be declared after they have been used.  
* As an obvious corollary, this also implies that in JS, a variable can be used prior to being declared.  

Vars in JS have _functional scope_.  
* This means a declared var can be accessed anywhere in the same function.  
* Functional scope also makes variable declarations and accessing/usage in JS slightly complicated.  
* Thus, ES6 introduced the _let_ keyword.  

## let ## 
_let_ is a keyword introduced in ES6. 
* not hoisted  
* block scope [any section of code within curly braces] 
    * compare to _var_, which has functional scope.  

### Comparison between let and var ### 
let  | var
------------- | -------------
block scope  | functional scope
cannot be re-declareed  | supports re-declaration without issue
designed to replace var  | legacy ES5- notation whose usage is gradually intended to be phased out in favor of _let_  

_Notes_  
* _In general, block-scoped variables cannot be re-declared [within the same block], whereas functional-scoped variables can be re-declared [within the same function]._  
* _In closures/loops, var may sometimes produce undesired results and therefore, it is advisable to use **let** in such instances._  


