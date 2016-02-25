App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
  collection: function() {
    return $("[data-channel='notifications']");
  },
  connected: function() {
    return setTimeout((function(_this) {
      return function() {
        _this.followCurrentMessage();
        return _this.installPageChangeCallback();
      };
    })(this), 1000);
  },
  received: function(data) {
    return this.collection().append(data.notification);
  },
  followCurrentMessage: function() {
    var messageId = this.collection().data('user-id');

    if (typeof messageId !== 'undefined')
      return this.perform('follow', { message_id: messageId });
    else
      return this.perform('unfollow');
  },
  installPageChangeCallback: function() {
    if (!this.installedPageChangeCallback) {
      this.installedPageChangeCallback = true;
      return $(document).on('page:change', function() {
        return App.notifications.followCurrentMessage();
      });
    }
  }
});
