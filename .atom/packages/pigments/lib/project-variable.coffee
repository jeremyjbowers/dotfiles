{Emitter, Range} = require 'atom'

nextId = 1

module.exports =
class ProjectVariable

  constructor: (params={}, @project=null) ->
    {@name, @value, @range, @path, @bufferRange, @line} = params
    @id = nextId++
    @emitter = new Emitter

  onDidDestroy: (callback) ->
    @emitter.on 'did-destroy', callback

  isColor: -> @getColor()?

  getColor: -> @color ?= @readColor()

  getLine: -> @bufferRange?.start.row ? @line

  readColor: -> @project.getContext().readColor(@value)

  destroy: ->
    @emitter.emit('did-destroy')
    {@name, @value, @range, @path, @project, @color} = {}

  isValueEqual: (variable) ->
    @name is variable.name and
    @value is variable.value and
    @path is variable.path

  isEqual: (variable) ->
    bool = @isValueEqual(variable)

    bool &&= if @bufferRange? and variable.bufferRange?
      @bufferRange.isEqual(variable.bufferRange)
    else
      @range[0] is variable.range[0] and @range[1] is variable.range[1]

    bool

  serialize: ->
    {@name, @value, @range, @path, line: @getLine()}
