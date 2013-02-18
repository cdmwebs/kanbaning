#= require jquery
#= require jquery_ujs
#= require jquery.ui.all
#= require foundation
#= require handlebars
#= require ember
#= require_tree .

jQuery ->
  $(".cards").sortable
    connectWith: '.cards'
    placeholder: 'ui-state-highlight'
    stop: (e, ui) ->
      next = ui.item.next()
      next.css
        '-moz-transition': 'none'
        '-webkit-transition': 'none'
        'transition': 'none'
      setTimeout next.css.bind next,
          '-moz-transition': 'border-top-width 0.5s ease-in',
          '-webkit-transition': 'border-top-width 0.5s ease-in',
          'transition': 'border-top-width 0.5s ease-in'

