#= require_tree ./templates

window.Kanbaning = Ember.Application.create()

Kanbaning.Store = DS.Store.extend
  revision: 11
  adapter: 'DS.FixtureAdapter'

Kanbaning.Router.map ->
  @resource 'boards', ->
    @resource 'board', path: ':board_id'

Kanbaning.IndexRoute = Ember.Route.extend
  redirect: -> @transitionTo('boards')

Kanbaning.BoardsRoute = Ember.Route.extend
  model: -> Kanbaning.Board.find()

Kanbaning.BoardRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('lanes').set('model', model.get('lanes'))

Kanbaning.LanesController = Ember.ArrayController.extend()

Kanbaning.LaneView = Ember.View.extend
  didInsertElement: ->
    console.log 'inserted card view'
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

Kanbaning.Board = DS.Model.extend
  name: DS.attr('string')
  lanes: DS.hasMany('Kanbaning.Lane')

Kanbaning.Lane = DS.Model.extend
  name: DS.attr('string')
  cards: DS.hasMany('Kanbaning.Card')

Kanbaning.Card = DS.Model.extend
  lane: DS.belongsTo('Kanbaning.Lane')
  name: DS.attr('string')
  tags: DS.attr('string')

Kanbaning.Board.FIXTURES = [
  {
    id: 1
    name: 'Enjoy the Arts'
    lanes: [1, 2, 3, 4, 5]
  }
  {
    id: 2
    name: 'AgriScout'
    lanes: [6, 7]
  }
  {
    id: 3
    name: 'IPC'
  }
]

Kanbaning.Lane.FIXTURES = [
  {
    id: 1
    name: "To Do"
    cards: [1, 2, 3]
  }
  {
    id: 2
    name: "Design"
  }
  {
    id: 3
    name: "Development"
  }
  {
    id: 4
    name: "Testing"
  }
  {
    id: 5
    name: "Done"
  }
  {
    id: 6
    name: "To Do"
    cards: [2, 3]
  }
  {
    id: 7
    name: "Done"
    cards: [1, 3]
  }
]

Kanbaning.Card.FIXTURES = [
  {
    id: 1
    name: "Card 1"
    tags: "Tag 1, Tag 2"
  }
  {
    id: 2
    name: "Card 2"
    tags: "Tag 2"
  }
  {
    id: 3
    name: "Card 3"
    tags: "Tag 3, Tag 4"
  }
]
