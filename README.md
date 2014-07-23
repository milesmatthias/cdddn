# CDDDN

Content Delivery & Device Detection Network (CDDDN) is a rails engine that provides mobile detection functionality for use in CDNs, like CloudFront and Akamai. This engine specifically allows you to cache static pages in both desktop and mobile versions for the same domain & url, rather than using an m.example.com approach.

## What this solves

* Mobile device detection on the client. With a CDN in front of your server, you can't do server side device detection.
* Avoid having to use separate domains (m.example.com and example.com) for mobile vs desktop.
* Using a CDN's device detection functionality makes development difficult since you'd have to fake those headers locally.
* Using a CDN's device detection functionality doesn't allow for the user to overwrite the device detection. (Ex: User wants to see desktop site on tablet.)

## How it works

On the initial request, CDDDN automatically detects the user's device and then sets the Rails' `request.format` to be either `:mobile` or `:html`. This means that you can provide separate views for mobile and desktop by having views name `index.mobile.erb` for mobile and `index.html.erb` for desktop. It also means that you can provide different data in your controllers using conditionals based on the `request.format`. For example:

```rb
  if request.format == :mobile
    sql_limit_number = 5
  else
    sql_limit_number = 20
  end
```

This gem also allows the user to decide to view the full desktop site any time they'd like. They can also manually override which device they would like to see the site as by going to `/cdddn/set`. This is especially useful for developers testing on multiple devices, since normally they would need to clear their cookies each time they want to go from desktop to mobile.

## Requirement

This gem uses [localStorage](http://caniuse.com/#feat=namevalue-storage) to help the user get back to the page they first visited the site on. This means all browsers except Opera Mini and IE7 & below are supported officially. If a user visits the site with one of those browsers, they'll be redirected to the home page.

## Installation

1. Add `gem 'cdddn'` to your Gemfile.
2. `bundle install`
3. Create a mobile layout by using `rails generate cdddn_mobile_layout`
4. Add the following line in the `head` of your desktop layout (`app/views/layouts/application.html.erb`) before any of your javascript tags: `<%= render 'shared/cdddn/desktop_layout' %>`
5. In `config/initializers/mime_types.rb`, add the following line: `Mime::Type.register_alias "text/html", :mobile`
6. In your CDN configuration, you'll need to whitelist a single cookie, called `cdddn_device`.


