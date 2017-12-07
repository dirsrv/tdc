import { Injectable } from '@angular/core';
import { Http, Headers, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import { environment } from '../../environments/environment';
import 'rxjs/add/operator/map'

@Injectable()
export class AuthenticationService {
    private apiurl = environment.apiurl;

    constructor(private http: Http) { }

    login(email: string, password: string) {
        let logindata:any = {};
        logindata.email = email;
        logindata.password = password;

        return this.http.post(this.apiurl+'/logins', logindata)
             .map((response: Response) => {
                // login successful if there's a jwt token in the response
                let respobj = response.json();
                let user = respobj.user;

                if (user && respobj.token) {
                    user.token = respobj.token;
                    // store user details and jwt token in local storage to keep user logged in between page refreshes
                    localStorage.setItem('currentUser', JSON.stringify(user));
                }

                return user;
            });
    }

    logout() {
        // remove user from local storage to log user out
        localStorage.removeItem('currentUser');
    }
}