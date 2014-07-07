vowels = /[aeiouAEIOU]/
nonword = /^(__.+__|[^\w]+)$/
punctuation = /[\.,;:\(\)"'\?]/


replaceAt = (index, character, word) ->
  word.substring(0, index) + character + word.substring(index + 1)

fixCasing = (word, translation) ->
  wordIsUpper = word == word.toUpperCase() and word.length > 1
  wordIsCap = word.charAt(0) == word.charAt(0).toUpperCase()

  return translation.toUpperCase() if wordIsUpper
  return translation.charAt(0).toUpperCase() + translation.slice(1) if wordIsCap
  return translation

wrapper =
  latinWord : (word)->
    return word if (word.match nonword) or word is ''
    newStartIndex = word.search vowels
    newStartIndex = 0 if newStartIndex < 0
    suffix = if newStartIndex is 0 then 'way' else 'ay'

    newEndIndex = word.search punctuation
    newEndIndex = word.length if newEndIndex < 0

    translation = word.substring(newStartIndex, newEndIndex) + word.substring(0, newStartIndex).toLowerCase() + suffix + word.substring(newEndIndex)

    fixCasing(word, translation)

  latinPhrase : (phrase)->
    str = ''
    tarr = phrase.split ' '
    for word, index in tarr
      endSpace = if index is tarr.length - 1 then '' else ' '
      str += wrapper.latinWord(word) + endSpace
    str
module.exports = wrapper
