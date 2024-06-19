import { Injectable, OnInit } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Weather } from 'src/app/interfaces/weather';
import { Observable } from 'rxjs';

import { environment } from '../../../environments/environment'

@Injectable({
  providedIn: 'root'
})
export class WeatherService implements OnInit{

  ngOnInit(): void {
      console.log(environment.apiKey)
  }

  constructor( private http: HttpClient) { }

  getWeather(city: string): Observable<Weather> {
    const options = new HttpParams()
    .set('units', 'metric')
    .set('q', city)
    .set('appId', environment.apiKey);
    
    return this.http.get<Weather>(environment.apiUrl +
    'weather', { params: options });
    }
}
