# CDDDN

Content Delivery & Device Detection Network (CDDDN) is a rails engine that provides mobile detection functionality for use in CDNs, like CloudFront and Akamai. This engine specifically allows you to cache static pages in both desktop and mobile versions for the same domain & url, rather than using an m.example.com approach.

On the initial request, CDDDN automatically detects the user's device and then sets the Rails' `request.format` to be either `:mobile` or `:html`. This means that you can provide separate views for mobile and desktop by having views name `index.mobile.erb` for mobile and `index.html.erb` for desktop.

This gem also allows the user to decide to view the full desktop site any time they'd like. They can also manually override which device they would like to see the site as by going to `/cdddn/set`. This is especially useful for developers testing on multiple devices, since normally they would need to clear their cookies each time they want to go from desktop to mobile.

## Requirement

* This gem uses [localStorage](http://caniuse.com/#feat=namevalue-storage) to help the user get back to the page they first visited the site on. This means all browsers except Opera Mini and IE7 & below are supported officially. If a user visits the site with one of those browsers, they'll be redirected to the home page.

## Installation

1. Add `gem cdddn` to your Gemfile.
2. `bundle install`
3. Create a mobile layout in `app/views/layouts/application.mobile.erb`.
4. Add the following line in the `head` of your mobile layout before any of your javascript tags (`app/views/layouts/application.mobile.erb`):
  ```html+erb
    <%= render 'shared/cdddn/mobile_layout.html.erb' %>
  ```
5. Add the following line in the `head` of your desktop layout before any of your javascript tags (`app/views/layouts/application.html.erb`):
  ```html+erb
    <%= render 'shared/cdddn/desktop_layout' %>
  ```
6. Add the following in your mobile layout where ever you'd like the 'View Full Site' link to show up.
```html+erb
  <%= render 'shared/cdddn/mobile_full_site_btn.html.erb' %>
```
7. In `config/initializers/mime_types.rb`, add the following line:
```rb
  Mime::Type.register_alias "text/html", :mobile
```
8. In your CDN configuration, you'll need to whitelist a single cookie, called `cdddn_device`.
