package net.koreate.mvc.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.mvc.board.service.Ask_boardService;
import net.koreate.mvc.board.vo.AskBoardVO;
import net.koreate.mvc.comment.service.ReplyService;
import net.koreate.mvc.comment.vo.ReplyVO;
import net.koreate.mvc.common.util.Criteria;
import net.koreate.mvc.common.util.PageMaker;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	Ask_boardService<AskBoardVO, PageMaker, Criteria> service;
	
	// test
	@Inject
	ReplyService rs;
	
	@PostMapping(value = "replies/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	@ResponseBody
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) throws Exception {

		int insertCount = rs.register(vo);
		System.out.println(vo);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

	@GetMapping(value = "replies/{rno}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	@ResponseBody
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") int rno) throws Exception {

		return new ResponseEntity<>(rs.get(rno), HttpStatus.OK);
	}

	/*
	 * @RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH }, value =
	 * "/{rno}", consumes = "application/json", produces = {
	 * MediaType.TEXT_PLAIN_VALUE })
	 */
	@PutMapping("replies/{rno}")
	@ResponseBody
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") int rno) throws Exception {

		vo.setRno(rno);

		return rs.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@DeleteMapping(value = "replies/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	@ResponseBody
	public ResponseEntity<String> remove(@PathVariable("rno") int rno) throws Exception {

		return rs.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@GetMapping(value = "replies/pages/{bno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public List<ReplyVO> getList(@PathVariable("page") int page, @PathVariable("bno") int bno, Model model)
			throws Exception {

		Criteria cri = new Criteria(page, 5);

		return rs.getList(cri, bno);
	}


	//test
	
	
	@GetMapping("ask")
	public String ask() {
		return "board/ask";
	}

	/*
	 * @GetMapping("asklist") public String asklist() {
	 * System.out.println("글 목록 페이지로 이동"); return "board/asklist"; }
	 */

	@GetMapping("/askmain")
	public String askmain() {
		System.out.println("문의메인으로 이동");
		return "/board/askmain";

	}

	@GetMapping("/register")
	public String register() {
		System.out.println("글 작성 페이지로 이동");
		return "/board/register";

	}

	@PostMapping("/register")
	public String register(AskBoardVO vo, RedirectAttributes rttr) {
		try {
			System.out.println(vo);
			service.register(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/asklist";
	}
	
	@GetMapping("/asklist")
	public String list(Criteria cri, Model model) {

		try {
			model.addAttribute("list", service.list(cri));
			model.addAttribute("pm", service.getPageMaker(cri));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/board/asklist";
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
			e.printStackTrace();
		}
		return "redirect:/board/asklist";
	}

}
