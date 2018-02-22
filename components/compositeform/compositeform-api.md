<!-- Generated by documentation.js. Update this documentation by updating the source code. -->

### Table of Contents

-   [COMPOSITEFORM_DEFAULTS](#compositeform_defaults)
-   [CompositeForm](#compositeform)
    -   [handleEvents](#handleevents)
    -   [checkResponsive](#checkresponsive)
    -   [setExpanderText](#setexpandertext)
    -   [isSideOriented](#issideoriented)
    -   [updated](#updated)
    -   [destroy](#destroy)

## COMPOSITEFORM_DEFAULTS

**Properties**

-   `breakpoint` **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)** Defines the breakpoint at which the composite form will change
     into its responsive mode
-   `trigger` **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)** Expandable area trigger selector. Passed to expandable area.
-   `expandedText` **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)** Text to use for the expand button (Default localized)
-   `collapsedText` **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)** Text to use for the collapse button (Default localized)

## CompositeForm

CompositeForm is a specialized responsive form component.

**Parameters**

-   `element` **([Array](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Array)&lt;jQuery> | [HTMLElement](https://developer.mozilla.org/docs/Web/HTML/Element))** The component element.
-   `settings` **[object](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Object)?** The component settings.

### handleEvents

Sets up event handlers for this control and its sub-elements

**Parameters**

-   `expanderText` **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)** the text content

Returns **[undefined](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/undefined)** 

### checkResponsive

Checks if we've passed the breakpoint for switching into Responsive mode.

Returns **[undefined](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/undefined)** 

### setExpanderText

Sets the text content of the Composite Form's Expandable Area Expander.

**Parameters**

-   `expanderText` **[string](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/String)** the text content

Returns **[undefined](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/undefined)** 

### isSideOriented

Determines if this component is configured for "on-side" orientation of the Summary area.

Returns **[boolean](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Boolean)** If the component is currently side oriented.

### updated

Re-invokes the Composite Form

Returns **[object](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Global_Objects/Object)** The component API for chaining.

### destroy

Destroys the component instance by removing it from its associated element.

Returns **void** 