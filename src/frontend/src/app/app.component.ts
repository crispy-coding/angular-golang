import { Component } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {environment} from "../environments/environment";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent {
  title = 'frontend';

  constructor(private http: HttpClient) { }

  message=""
  private apiUrl = environment.apiUrl;

  onClick() {
    let backendMessage = this.http.get<string>(this.apiUrl)
    backendMessage.subscribe(message => this.message = message);
  }
}
