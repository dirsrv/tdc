import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { Todo } from '../models/Todo';
import { TodoService } from '../services/todo.service';

@Component({
  selector: 'app-add-todo',
  templateUrl: './add-todo.component.html',
  styleUrls: ['./add-todo.component.css']
})
export class AddTodoComponent implements OnInit {
  private newTodo :Todo;
  @Output() addTodo: EventEmitter<Todo> = new EventEmitter<Todo>();
  constructor(private listServ: TodoService) { }
 
  ngOnInit() {
  	this.newTodo = {
  		title: '',
  		priority:'',
  		description:'',
		  id:'',
		  author_id:''
  	}
  }

  public onSubmit() {
  	console.log(this.newTodo.priority);
  	this.listServ.addTodo(this.newTodo).subscribe(
  		response=> {
  			
  			if(response.success== true)
  				this.addTodo.emit(this.newTodo);
  		},
	);

	}
}