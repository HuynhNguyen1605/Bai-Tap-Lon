package com.hn.service.impl;

import com.hn.pojo.CoachLine;
import com.hn.pojo.Comment;
import com.hn.repository.CoachLineRepository;
import com.hn.service.CoachLineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CoachLineServiceImpl implements CoachLineService {
    @Autowired
    private CoachLineRepository coachLineRepository;

    @Override
    public List<CoachLine> getCoachLines(Map<String, String> params, int page) {
        return this.coachLineRepository.getCoachLines(params, page);
    }

    @Override
    public int countCoachLine() {
        return this.coachLineRepository.countCoachLine();
    }

    @Override
    public boolean addOrUpdate(CoachLine coachLine) {
        return this.coachLineRepository.addOrUpdate(coachLine);
    }

    @Override
    public CoachLine getById(int id) {
        return this.coachLineRepository.getById(id);
    }

    @Override
    public boolean delete(CoachLine coachLine) {
        return this.coachLineRepository.delete(coachLine);
    }

    @Override
    public List<Comment> getComments(int coachlineId) {
        return this.coachLineRepository.getComments(coachlineId);
    }
}
