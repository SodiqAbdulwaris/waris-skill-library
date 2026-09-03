---
name: warisskill-research-academic
description: >
  Use for scholarly and literature research — literature reviews, finding
  and evaluating peer-reviewed work, systematic-style searches, or grounding
  a claim in the academic record. Triggers on "literature review," "what
  does the research say," "find papers on," "systematic review," "is this
  peer-reviewed," or citing scholarly sources. Builds on
  `warisskill-research-methodology` (credibility, triangulation, claim
  strength) — this skill adds the scholarly source hierarchy, systematic
  search discipline, and citation provenance. It does NOT reproduce the
  heavyweight multi-agent PRISMA machinery some libraries ship; it is a
  practitioner-grade lightweight discipline.
---

# Academic & Literature Research

Builds on `warisskill-research-methodology` — the evaluate/triangulate/
calibrate rules there apply as-is. This skill adds what's specific to the
scholarly record.

## Scholarly source hierarchy

Not all "studies" carry equal weight. Prefer higher tiers, and always name
the tier when the distinction matters to the claim:

| Tier | Source | Weight |
|---|---|---|
| Strongest | Systematic review / meta-analysis of many studies | Highest — it already did the triangulation |
| Strong | Peer-reviewed primary study in a reputable venue | Strong, but single-study caveats apply |
| Provisional | Preprint (arXiv/bioRxiv/SSRN), conference short paper | Useful and current, but not yet peer-reviewed — label it |
| Context | Textbook, review chapter, thesis | Good for background and established consensus, not the frontier |
| Weak | Press release, news write-up of a study, blog summary | A pointer to the real source, never the source itself |

A single striking study is a lead, not a conclusion — a meta-analysis that
disagrees with it usually wins.

## Search like it's reproducible

Even a lightweight review should be repeatable, not a lucky first hit:

1. **Frame the question** in structured terms (population / intervention /
   comparison / outcome, or the analog for your field).
2. **Write down your search terms and where you searched** (Google Scholar,
   Semantic Scholar, PubMed, the ACM/IEEE libraries, domain databases).
3. **State inclusion/exclusion up front** — date range, study type,
   language, quality bar — and apply them consistently.
4. **Follow the citation graph both ways** — what this paper cites
   (backward) and what cites it (forward) — to find seminal work and the
   current state.

Record enough that someone could re-run your search and land in the same
place. That traceability *is* the "systematic" part; you don't need the
full PRISMA apparatus to get its main benefit.

## Evaluating a single study

Beyond the methodology skill's authority/recency/incentive check, ask:
sample size and power, methodology and controls, whether it's been
replicated, the venue's standing, citation count *in context* (a 2-year-old
paper won't have many yet), and declared conflicts/funding.

## Citation discipline

- **Cite the primary source, not the thing that cited it.** If a blog
  references a study, find and read the study, then cite the study.
- **Don't cite what you didn't read** — an abstract is not the paper, and
  citing beyond the abstract you actually read is how errors propagate.
- **Use stable identifiers** (DOI, arXiv id) so the citation resolves
  later.
- **Balance seminal and current** — anchor on the foundational work *and*
  the recent state; citing only one era misleads.

## Synthesize the debate

Map consensus vs open questions explicitly: what's well-established, what's
actively contested and by whom, and what simply hasn't been studied yet.
"The literature is divided" with the two camps named beats a false tidy
answer.

## Limitations

- General research discipline (how to evaluate, triangulate, calibrate) is
  `warisskill-research-methodology` — not repeated here.
- This is a lightweight practitioner discipline, not a formal PRISMA
  systematic-review protocol; for a publication-grade systematic review,
  follow the formal reporting standard on top of this.
- Writing the paper itself (structure, argument, prose) is out of scope.
