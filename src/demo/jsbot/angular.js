angular
Toggle all
document.querySelector("#toggle-all").click()
document.getElementById("toggle-all").click()

Toggle todo
document.querySelector("ul  li:nth-child(1) input.toggle").click()

Clear completed
document.querySelector("button.clear-completed").click()

Filters
document.querySelector(".filters li:nth-child(1) a").click()
document.querySelector(".filters li:nth-child(2) a").click()
document.querySelector(".filters li:nth-child(3) a").click()

location.hash ="#/"
location.hash ="#/active"
location.hash ="#/completed"


Edit Todo
document.querySelector("body > ng-view > section > section > ul > li:nth-child(2) > div > label").dispatchEvent(new Event('dblclick',{'bubbles':true}))
document.querySelector("body > ng-view > section > section > ul > li:nth-child(2) .edit").value="ngtest"
document.querySelector("body > ng-view > section > section > ul > li:nth-child(2) .edit").dispatchEvent(new Event("popstate"))

New Todo
Need to investigate as chenge event is not working here

document.querySelector('.todo-form').dispatchEvent(new Event('submit',{'bubbles':true}))


Delete
document.querySelector("ul li:nth-child(1) button.destroy").click()