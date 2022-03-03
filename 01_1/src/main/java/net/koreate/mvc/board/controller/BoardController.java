package net.koreate.mvc.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.mvc.board.service.Ask_boardService;
import net.koreate.mvc.board.vo.AskBoardVO;
import net.koreate.mvc.common.util.Criteria;
import net.koreate.mvc.common.util.PageMaker;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	Ask_boardService<AskBoardVO, PageMaker, Criteria> service;

	@GetMapping("ask")
	public String ask() {
		return "board/ask";
	}

	/*
	 * @GetMapping("asklist") public String asklist() {
	 * System.out.println("글 목록 페이지로 이동"); return "board/asklist"; }
	 */

	@GetMapping("/register")
	public String register() {
		System.out.println("글 작성 페이지로 이동");
		return "/board/register";

	}

	@GetMapping("/asklist")
	public String list(Criteria cri, Model model) {

		try {
			model.addAttribute("list", service.list(cri));
			model.addAttribute("pm", service.getPageMaker(cri));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/board/asklist";
	}

	@PostMapping("/register")
	public String register(AskBoardVO vo, RedirectAttributes rttr) {
		try {
			service.register(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/asklist";
	}

	@GetMapping("/get")
	public void get(@RequestParam("bno") int bno, Model model) throws Exception {

		model.addAttribute("board", service.get(bno));
		service.updateViewCnt(bno);
	}

	@GetMapping("/modify")
	public void modify(@RequestParam("bno") int bno, Model model) throws Exception {

		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	public String modify(AskBoardVO vo, RedirectAttributes rttr) {
		try {
			if (service.modify(vo)) {
				rttr.addAttribute("result", "success");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/board/asklist";

	}

	@PostMapping("/remove")
	public String remove(@RequestParam("bno") int bno, RedirectAttributes rttr) {
		try {
			if (service.remove(bno)) {
				rttr.addFlashAttribute("result", "success");

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/board/asklist";
	}

}
