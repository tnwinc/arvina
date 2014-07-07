'use strict'
translator = require './pig_latin_translator'
describe 'pig latin translator', ->
  it 'should translate a word', ->
    (expect translator.latinWord 'egg').to.equal 'eggway'
    (expect translator.latinWord 'happy').to.equal 'appyhay'

  it 'should translate a phrase', ->
    (expect translator.latinPhrase 'please enter atleast one field').to.equal 'easeplay enterway atleastway oneway ieldfay'

  it 'should skip words wrapped in underscores', ->
    (expect translator.latinWord '__count__').to.equal '__count__'

  it 'should not consider punctuation as part of a word', ->
    (expect translator.latinWord 'egg,').to.equal 'eggway,'

  it 'should skip non-words', ->
    (expect translator.latinWord '/').to.equal '/'

  it 'should maintain capitalization', ->
    (expect translator.latinPhrase 'I will DO the Thing').to.equal 'Iway illway ODAY ethay Ingthay'

  it 'should not translate extra spacing', ->
    (expect translator.latinPhrase 'Say no to  extra spacing').to.equal 'Aysay onay otay  extraway acingspay'
