# fluttershow

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Code

```

package com.terapico.caf;

import java.util.Date;

public class DateTime extends Date {
	public DateTime(){
		
	}
	public DateTime(long dateTimeValue){
		super(dateTimeValue);
	}
	private static final long serialVersionUID = 1L;
	public static DateTime fromDate(Date date){
		if(date==null){
			return null;
		}
		DateTime dateTime = new DateTime();
		dateTime.setTime(date.getTime());
		return dateTime;
	}
	public static DateTime now(){
		return fromDate(new java.util.Date());
	}
}

```
