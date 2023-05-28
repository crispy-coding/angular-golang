import { Component } from '@angular/core';
import {HttpClient} from "@angular/common/http";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent {
  title = 'frontend';

  constructor(private http: HttpClient) { }

  message=""
  private apiUrl = 'http://localhost:80/api';

  onClick() {
    let backendMessage = this.http.get<string>(this.apiUrl)
    backendMessage.subscribe(message => this.message = message);
  }
}
