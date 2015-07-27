root = exports ? this
root.userSignedIn = ->
  if root.g_currentUser.id != ''
    return true
  false

root.setCurrentUser = (currentUser) ->
  root.g_currentUser =
    # auth_token: currentUser.auth_token
    # role: currentUser.role
    id: currentUser.user_id
    # available_to_chat: currentUser.available_to_chat
    # is_student: ->
    #   currentUser.role is 'student'
    # is_tutor: ->
    #   currentUser.role is 'tutor'

  root.checkCurrentUser()


root.getCurrentUser = ->
  root.g_currentUser

root.removeCurrentUser = ->
  root.g_currentUser =
    # auth_token: ''
    # role: ''
    id: ''
    # available_to_chat: ''
  root.checkCurrentUser()

root.checkCurrentUser = ->
  if root.userSignedIn()
    $(".require-login").hide()
    $(".require-no-login").show()
  else
    $(".require-login").show()
    $(".require-no-login").hide()
  return

root.isEmpty = (data) ->
  return false  if typeof (data) is "number" or typeof (data) is "boolean"
  return true  if typeof (data) is "undefined" or data is null
  return data.length is 0  unless typeof (data.length) is "undefined"
  count = 0
  for i of data
    count++  if data.hasOwnProperty(i)
  count is 0

root.shareWithFacebook = ->
  title = $("title").text()
  $("a.btn-facebook").click (e) ->
    e.preventDefault()
    FB.ui
      method: "feed"
      name: "eTutorCloud"
      link: "http://etutorcloud.com"
      picture: "http://etutorcloud.com/pics/step1.png"
      caption: "The World’s Tutoring Marketplace: Let the best tutors find you!"
    return

root.randomArrCustom = (arr) ->
  arr.sort ->
    0.5 - Math.random()

root.sortBy = (key, reverse) ->
  moveSmaller = (if reverse then 1 else -1)
  moveLarger = (if reverse then -1 else 1)
  (a, b) ->
    return moveSmaller  if a[key] < b[key]
    return moveLarger  if a[key] > b[key]
    0

root.getParameterByName = (path, name) ->
  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]")
  regex = new RegExp("[\\?&]" + name + "=([^&#]*)")
  results = regex.exec(path)
  (if not results? then "" else decodeURIComponent(results[1].replace(/\+/g, " ")))

root.removeByAttr = (arr, attr, value) ->
  i = 0
  while i < arr.length
    if arr[i].hasOwnProperty(attr) and arr[i][attr] is value
      arr.splice i, 1
    i++
  arr



