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

## const ## 
The _const_ keyword is used to create read-only, named constants. 
Similar to _let_, _const_ has block scope and is not hoisted. 
* However, a value **must** be set with a _const_ declaration, and the value cannot be changed within the same block-scope.  

### Comparison between const and let ### 
const  | let
------------- | ------------- 
use when new value reassignment is not expected | use when value reassignment is expected 

## Arrow Functions ## 
* Generally shorter and more concise than regular functions. 
* This is generally achieved by using shorthand notations and reducing line usage where possible. 

## this ## 
* Bound by [innermost] functional scope, depending on where it is being used. 
* Arrow functions resolves this issue. 
* Whenever you want to use _this_ in the execution context, then using arrow functions may be beneficial. 
* However, if you want to use _this_ in a local function/want a separate _this_ for the function itself, then use _function()_ instead of arrow functions.  

## Default Function Parameters ## 
* In ES5, when a parameter is not specified for a function [that requires/specifies that it takes parameters in its definition] during its call, then the value would be undefined.  
* However, ES6 offers a feature wherein default values can be set for parameters in parentheses. 
* Thus, if no value/parameter is specified, the default value is taken, otherwise the specified value is taken. 
* arguments.length only takes into consideration the number of arguments _passed during a function call_ and _ignores any default values_ in its computation. 

## Rest Operator ## 
* A rest parameter presents an indefinite number of [function] arguments as an array. 
* Syntax in function definition [within parentheses] is ``` ... ``` followed by the variable parameter. 
* How it works: the variable/indefinite args are converted to an array, upon which array operations like iteration are performed. 

## Spread Operator ## 
Can be thought of as the opposite of the rest operator. 
* While the rest operator takes multiple elements and packages them into an array, the spread operator takes an array and splits it into constituent elements. 
* Bears the same syntax [three dots preceding variable] as rest operator. 
* However, the difference lies in the fact that the rest operator is used in the _function definition_, whereas the spread operator is used during _function call_.

## Object Literals ## 
* ES6 provides several shorthand notations for object literals. 
* Can have spaces in property names. 
* Can also use variables as property names [provided they are enclosed within square brackets]. 