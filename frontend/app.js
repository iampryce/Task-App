function addTask() {
    const input = document.getElementById('taskInput');
    const value = input.value;
    if (!value) return;
    const li = document.createElement('li');
    li.textContent = value;
    document.getElementById('taskList').appendChild(li);
    input.value = '';
}

f
