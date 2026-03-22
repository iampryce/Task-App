function updateCounter() {
  const total = document.querySelectorAll('.task-item:not(.done)').length;
  document.getElementById('taskCount').textContent = total;
}

function updateEmptyState() {
  const tasks = document.querySelectorAll('.task-item');
  const empty = document.getElementById('emptyState');
  empty.style.display = tasks.length === 0 ? 'flex' : 'none';
}

function addTask() {
  const input = document.getElementById('taskInput');
  const value = input.value.trim();
  if (!value) return;

  const li = document.createElement('li');
  li.className = 'task-item';
  li.innerHTML = `
    <div class="task-check">✓</div>
    <span class="task-text">${value}</span>
    <button class="task-delete" onclick="deleteTask(this)" title="Delete">✕</button>
  `;

  li.querySelector('.task-check').addEventListener('click', () => toggleTask(li));
  li.addEventListener('click', (e) => {
    if (!e.target.classList.contains('task-delete') && !e.target.classList.contains('task-check')) {
      toggleTask(li);
    }
  });

  document.getElementById('taskList').prepend(li);
  input.value = '';
  updateCounter();
  updateEmptyState();
}

function toggleTask(li) {
  li.classList.toggle('done');
  updateCounter();
}

function deleteTask(btn) {
  const li = btn.closest('.task-item');
  li.style.animation = 'none';
  li.style.transition = 'all 0.2s ease';
  li.style.opacity = '0';
  li.style.transform = 'translateX(20px)';
  setTimeout(() => { li.remove(); updateCounter(); updateEmptyState(); }, 200);
}

function clearCompleted() {
  document.querySelectorAll('.task-item.done').forEach(li => {
    li.style.transition = 'all 0.2s ease';
    li.style.opacity = '0';
    li.style.transform = 'translateX(20px)';
    setTimeout(() => { li.remove(); updateCounter(); updateEmptyState(); }, 200);
  });
}

// Allow Enter key to add task
document.getElementById('taskInput').addEventListener('keydown', (e) => {
  if (e.key === 'Enter') addTask();
});

// Init
updateEmptyState();
