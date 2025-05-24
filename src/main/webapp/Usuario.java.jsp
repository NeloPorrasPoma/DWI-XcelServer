<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Administrar Usuarios</title>
  <script type="module">
    import { UserController } from './controllers/UserController.js';

    const userController = new UserController();

    const form = document.getElementById('userForm');
    const userTable = document.getElementById('userTableBody');

    function refreshUserTable() {
      userTable.innerHTML = '';
      userController.listUsers().forEach(user => {
        const row = `
          <tr>
            <td>${user.id}</td>
            <td>${user.nombre}</td>
            <td>${user.email}</td>
            <td>${user.rol}</td>
            <td>
              <button onclick="editUser(${user.id})">Editar</button>
              <button onclick="deleteUser(${user.id})">Eliminar</button>
            </td>
          </tr>
        `;
        userTable.innerHTML += row;
      });
    }

    window.editUser = function(id) {
      const user = userController.userDao.getUserById(id);
      if (user) {
        form.nombre.value = user.nombre;
        form.email.value = user.email;
        form.rol.value = user.rol;
        form.id.value = user.id;
      }
    };

    window.deleteUser = function(id) {
      userController.removeUser(id);
      refreshUserTable();
    };

    form.addEventListener('submit', (e) => {
      e.preventDefault();
      const id = parseInt(form.id.value);
      const nombre = form.nombre.value;
      const email = form.email.value;
      const rol = form.rol.value;

      if (id) {
        userController.editUser(id, nombre, email, rol);
      } else {
        userController.addUser(nombre, email, rol);
      }
      form.reset();
      refreshUserTable();
    });

    document.addEventListener('DOMContentLoaded', refreshUserTable);
  </script>
</head>
<body>
  <h1>Administración de Usuarios</h1>

  <form id="userForm">
    <input type="hidden" name="id">
    <label>
      Nombre:
      <input type="text" name="nombre" required>
    </label><br>
    <label>
      Email:
      <input type="email" name="email" required>
    </label><br>
    <label>
      Rol:
      <select name="rol" required>
        <option value="admin">Administrador</option>
        <option value="cliente">Cliente</option>
      </select>
    </label><br><br>
    <button type="submit">Guardar</button>
  </form>

  <h2>Lista de Usuarios</h2>
  <table border="1">
    <thead>
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Email</th>
        <th>Rol</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody id="userTableBody">
      <!-- Se llena dinámicamente -->
    </tbody>
  </table>
</body>
</html>

