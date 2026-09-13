from tkinter import Label, Tk, Toplevel

from PIL import Image, ImageTk

from lib.img import image_to_tk_image

# Default DLP resolution – used as the pattern canvas size before the window renders
_DLP_W, _DLP_H = 1280, 720


class ProjectorController:
    def show(self, image: Image.Image):
        pass

    def size(self) -> tuple[int, int]:
        return (_DLP_W, _DLP_H)

    def clear(self):
        pass

    def toggle_fullscreen(self):
        pass


class TkProjector(ProjectorController):
    window: Toplevel
    label: Label

    def __init__(self, root: Tk, title: str = "Projector", background: str = "#000000"):
        self.window = Toplevel(root)
        self.window.title(title)
        self.window["background"] = background
        self.window.geometry(f"{_DLP_W}x{_DLP_H}")   # start windowed — move to DLP, then fullscreen
        self._fullscreen = False

        self.window.grid_rowconfigure(0, weight=1)
        self.window.grid_columnconfigure(0, weight=1)

        self.label = Label(self.window, bg="black")
        self.label.grid(row=0, column=0, sticky="nesw")

        self.clear_image = image_to_tk_image(Image.new("L", (_DLP_W, _DLP_H)))

    def toggle_fullscreen(self):
        self._fullscreen = not self._fullscreen
        self.window.attributes("-fullscreen", self._fullscreen)

    def size(self) -> tuple[int, int]:
        w = self.window.winfo_width()
        h = self.window.winfo_height()
        if w <= 1 or h <= 1:
            return (_DLP_W, _DLP_H)
        return (w, h)

    def show(self, image: Image.Image):
        photo = image_to_tk_image(image)
        self.label.configure(image=photo)  # type:ignore
        self.photo = photo

    def clear(self):
        self.label.configure(image=self.clear_image)  # type:ignore
