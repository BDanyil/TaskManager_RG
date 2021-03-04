document.addEventListener("change", (event) => {
  let target = event.target;

  if (!target.matches(".task-complete-checkbox")) return false;

  let taskId = target.id;
  let path = `/tasks/complete`;
  let csrf = document.querySelector('meta[name=csrf-token]').content;
  let payload = {id: taskId, task: {completed: target.checked}};

  fetch(path, {
    method: "PATCH",
    dataType: "script",
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-Token': csrf,
      'Cache-Control': 'no-store'
    },
    body: JSON.stringify(payload),
  })
    .then((response) => {
      if (response.status != 200) return false;

      target.closest(".task").classList.toggle("completed");
    })
    .catch((error) => {console.log(error)});
})
