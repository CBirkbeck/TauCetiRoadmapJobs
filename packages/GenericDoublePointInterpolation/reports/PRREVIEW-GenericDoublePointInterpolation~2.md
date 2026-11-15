# Review of GenericDoublePointInterpolation (pull request #1472 at 6326e74)
**Verdict:** needs changes

Incremental re-review of the 6 lines changed since `5cd46bd`, and the first check of the pull request's title and description against the head. The folder's files need no change; both findings are in the description.

## R01 (P3) — The description names a consumer the README does not name

**Location:** pull request description, "Dependencies" paragraph: "the roadmaps named in the README that are neither on main nor in the merge order are consumers (ArithmeticStatisticsPartV, EffectiveBoundsPartII), not prerequisites."

**Claim:** The README names ArithmeticStatisticsPartV and EffectiveBoundsPartII as consumers.

**Witness:** `TauCetiRoadmap/GenericDoublePointInterpolation/README.md` contains no occurrence of "EffectiveBounds". Its only consumer citations are ArithmeticStatisticsPartV §3.28, at lines 51 and 1683.

**Repair:** Replace the parenthesis by "(ArithmeticStatisticsPartV)". Tested: every other roadmap the README cites by section is on main or is AlgebraicModuliForArithmeticGeometry, which the merge order lists.

## R02 (P3) — The description's list of end theorems stops at degree five

**Location:** pull request description, first paragraph after the summary block: "…through projective restriction ranks, the plane and cubic bases, and ordinary and differential Horace induction. The end theorems give Alexander–Hirschowitz maximal rank in degree at least five, a nonempty principal open…"

**Claim:** The end theorems on the projective side are the degree-at-least-five rank theorem, reached through the plane and cubic bases.

**Witness:** README §4.8 (line 1495) and `Suggested.lean:252` state `alexanderHirschowitzRank` for every degree, with four exceptional triples and the quadric interval; `quarticDoublePointRank` and `univariateHermiteRank` are headlines too. The summary block of the same description says "every degree".

**Repair:** "…through projective restriction ranks, the quadric, plane, cubic, quartic and univariate bases, and ordinary and differential Horace induction. The end theorems give Alexander–Hirschowitz maximal rank in every degree with its exceptions stated (degree at least five by the induction, the lower degrees from the bases), a nonempty principal open of well-poised affine configurations in degree at least five, and bounded integer coordinates."

## Previous findings

- R01 — repaired: README lines 693, 701, 777 now cite "BO lines 604–620, §6, p.12" (with the linear-algebra reformulation clause), "BO lines 654–670, §6, proof of Lemma 6.1, p.13" and "BO lines 620–623, §6, p.12". No new problem introduced.

## Verified sound

| Statement (cited by the changed text) | Instances tried | Values on both sides | Result / change |
| --- | --- | --- | --- |
| Restriction rank of a finite scheme (§2.1) | Double origin in A¹; D=span(1,x,x²), then D=span(1) | kernel span(x²): 3−1=2=min(3,2); kernel 0: 1−0=1≤min(1,2) | Agrees with BO lines 606–618 (rank = dim D − dim of the vanishing subspace). No change. |
| Restriction rank on disjoint unions (§2.1) | A=reduced 0, B=double point at 1 in A¹; D=degree ≤1, then ≤2 | degree ≤1: 2=2+0 (B-kernel 0); degree ≤2: 3=2+1 (B-kernel span((x−1)²), value 1 at 0) | Agrees with the identity used at BO lines 665–667. No change. |
| Independent subschemes (§2.3) | X=double origin in A¹, Y=reduced origin; D=span(1,x), then span(1); superscheme X∪{1} | span(1,x): h(X)=2=length, h(Y)=1=length; injective rank 2 stays 2 on X∪{1}; span(1): h(Y)=1=length but h(X)=1<2, so no converse | Both directions agree with BO lines 620–623. No change. |

Rows for the untouched statements stand as in the previous review, of `5cd46bd`.

- Source locators checked against the text: 3 (BO lines 604–620 and 620–623 lie before the page-12 footer at BO line 635; BO lines 654–670 lie on page 13 inside the proof of Lemma 6.1, which begins at BO line 631). The seeded sample falls in the changed passages only at §2.3, covered by the third locator.
- The change touches no statement, no Needs line, no supplier citation and no Lean declaration; no file outside the folder changed (`git diff --stat origin/main...HEAD` outside the folder is empty).
- Gate at `6326e74`, run again: every check 0, `OK`. Dependency check: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration of `Suggested.lean` with `lake env lean`: 17 `sorry` warnings, no other warning, no error.
- Citation lead `TauCeti.MvPolynomial.apply_mem_of_basis` (README line 171): the name is in use at the pinned Tau Ceti, `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/PolynomialRep.lean:129`; not a finding.
- Description checked sentence by sentence against the head: the summary block (every degree, exceptions, integer coordinates in [0, md], §3.28 consumer through the homogeneous-partial adapter, integer determinants in place of computer calculations at README line 867), the folder contents (README, `Suggested.lean`, `metadata.toml`; a new roadmap, 30 declarations) and the validation counts agree with the head. Only R01 and R02 differ.
- Overlap check: read EffectiveBoundsPartII, ArithmeticInterpolationDeterminants; nothing shared (both cite this roadmap as owner: EffectiveBoundsPartII `README.md:15`, `:75` for §§0.1, 0.3, 1.3–1.4, 5.1–5.3; ArithmeticInterpolationDeterminants `README.md:86`, `:101` for §§1.3–1.4, 4.6). The third list is empty.
- Source independence: changed passages only; 3 passages compared with 1 source (BO), none shared (the added text is three locators and one clause of the roadmap's own); no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- The description's sentence on AI assistance ("0 independent review rounds and 2 red-team rounds on the job board") describes the board's history, not the head; it was not checked.
- As in the previous review: BO lines 879–890 do not establish the compatible mixed-stratum specialization of README §4.3, which the roadmap states as its own target.

## Source issues

- none

## For the human reviewers

- none
