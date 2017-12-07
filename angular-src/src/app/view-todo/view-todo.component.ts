import { Component, OnInit } from '@angular/core';
import { TodoService } from '../_services/todo.service';
import { Todo } from '../_models/Todo'

@Component({
  selector: 'app-view-todo',
  templateUrl: './view-todo.component.html',
  styleUrls: ['./view-todo.component.css']
})
export class ViewTodoComponent implements OnInit {
  
  //lists propoerty which is an array of List type
  private todos: Todo[] = [];

  constructor(private todoServ: TodoService) { }

  ngOnInit() {
    //Load all list on init 
    this.loadTodos();
  }

  public loadTodos() {
	
	//Get all todos from server and update the todos property
	this.todoServ.getAllTodos(this.userid()).subscribe(
		response => { 
      this.todos = response;
      console.log('GETALL!', this.todos);
    }, (err) => {
      console.log('ERROR');
    });  
      
  }

  //The deleted todo is being filtered out using the .filter method
  public deleteTodo(todo: Todo) {
    this.todoServ.deleteTodo(todo.id).subscribe(
	  response =>	this.todos = this.todos.filter(todos => todos !== todo),)		
	}

  //onAddTodo will be invoked when the child component emits an event
  public onAddTodo(newTodo) {
    this.todos = this.todos.concat(newTodo);
  }


  private userid() {
    let currentUser = JSON.parse(localStorage.getItem('currentUser'));    
    if (currentUser) {
      return currentUser.id;
    }
  }
}
	
