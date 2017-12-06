import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpModule } from '@angular/http';
import { FormsModule} from '@angular/forms';

import { AppComponent } from './app.component';
import { ViewTodoComponent } from './view-todo/view-todo.component';
import { AddTodoComponent } from './add-todo/add-todo.component';
import { TodoService } from './services/todo.service';
@NgModule({

  //Components are added here
  declarations: [
    AppComponent,  
    ViewTodoComponent,
    AddTodoComponent
  ],
  //All the modules are declared as imports
  imports: [
  
    BrowserModule,
    HttpModule,
    FormsModule
  ],
  //All the services go here.
  providers: [TodoService],
  bootstrap: [AppComponent]
})
export class AppModule { }