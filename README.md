cssdoc
======

Dynamic documentation for css, scss and sass


[![Build Status](https://secure.travis-ci.org/cssdoc/cssdoc.png?branch=master)](https://travis-ci.org/cssdoc/cssdoc)

[Roadmap](https://github.com/cssdoc/cssdoc/issues/1)




## Variables
```css
$font-size: 14px;
```

```json
{
    'name': 'font-size',
    'type': 'number',
    'description': '',
    'value': '14px'
}
```


```css
/**
 * Default background color
 * @type color
 */
$background-color: white;
```
result:
```json
{
    'name': 'background-color',
    'type': 'color',
    'description': 'Default background color',
    'value': 'white'
}
```

```css
// Default text color
$text-color: rgba(0, 0, 0, 0.9);
```

result:
```json
{
    'name': 'text-color',
    'type': 'color',
    'description': 'Default text color',
    'value': 'rgba(0, 0, 0, 0.9)'
}
```

## Mixins

```css
/**
 * Something happens
 * @param $one {Number} The first parameter
 * @param [$two='white'] {string} The optional second argument
 */
@mixin make-something($one, $two: 'white'){
    /** Mixin body */
}
```

result:
```json
{
    'name': 'make-something',
    'descriptions': 'Something happens',
    'parameters': [
        { 'name': 'one', 'type': 'number', 'description': 'The first parameter', value: null },
        { 'name': 'two', 'type': 'string', 'description': 'The optional second argument', value: 'white' },
    ]
}

## Functions

```css
/**
 * Get the color from something
 * @param $something Something given to the function
 * @param [$default-color='white'] {string} Fallback color
 * @return {color} The color from something
 */
@function get-color-from-something($something, $default-color: 'white'){
    /** function body */
    @return $color;
}
```

```json
{
    'name': 'get-color-from-something',
    'description': 'Get the color from something',
    'params': [
        { 'name': 'one', 'type': 'number', 'description': 'The first parameter', value: null },

    ],
    'return': { 'type': 'color', 'description': 'The color from something' }
}
```

## Rules

to do
