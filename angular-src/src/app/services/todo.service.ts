import { Injectable } from '@angular/core';
import { Http, Headers } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { Todo } from '../models/Todo'

import 'rxjs/add/operator/map';

@Injectable()
export class TodoService {

  constructor(private http: Http) { }

  private serverApi = 'http://localhost:3000/api';

  public getAllTodos(): Observable<Todo[]> {
    let URI = `${this.serverApi}/todos`;
    return this.http.get(URI)
      .map(res => res.json())
      .map(res => <Todo[]>res.items);
  }

  public deleteTodo(todoId: string) {
    let URI = `${this.serverApi}/todos/${todoId}`;
    let headers = new Headers;
    headers.append('Content-Type', 'application/json');
    return this.http.delete(URI, { headers: headers })
      .map(res => res.json());
  }

  public addTodo(todo: Todo) {
    let URI = `${this.serverApi}/todos`;
    let headers = new Headers;
    let body = JSON.stringify({ author_id: "0", title: todo.title, description: todo.description, priority: todo.priority });
    headers.append('Content-Type', 'application/json');
    return this.http.post(URI, body, { headers: headers })
      .map(res => res.json());
  }
}