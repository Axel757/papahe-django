from django.contrib.auth.mixins import UserPassesTestMixin
from django.shortcuts import redirect

class AdminRequiredMixin(UserPassesTestMixin):

    def test_func(self):
        return self.request.user.is_authenticated and self.request.user.is_staff

class UsuarioNormalRequiredMixin(UserPassesTestMixin):

    def test_func(self):
        return self.request.user.is_authenticated and not self.request.user.is_staff
