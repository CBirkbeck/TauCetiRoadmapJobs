# Review of CategoricalOperatorAlgebras (pull request #888 at 3375f9e)

**Verdict:** needs changes

This is an incremental re-review of the 19 lines changed since `136b93a` (four reference entries in `README.md`; nothing else in the folder changed, nothing outside it).

- **R01 (P2), carried.** CA1a/CA2a still have two open owners: this folder and the QuantumGroups revision #1705, now at `96014ab`. Neither this README, nor #1705's ownership text, nor this pull request's description has changed on this point.
- The previous R02 (arXiv pagination under journal citations) is repaired, and the repair introduced no new problem.
- The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with no diagnostic.

## R01 (P2) — CA1a/CA2a still have two open owners: this folder and the QuantumGroups revision #1705

Carried from the previous review's R01. No repair report marks it settled.

**Location.** `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` lines 40–46: "C*-categories, their finite additive and Karoubi completion … (CA1a), and C*-tensor categories … unitary dual functors and signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a".

The Downstream consumers bullet at lines 2303–2309 repeats this. CA2a (lines 466–477) defines the sign ε and proves `ε=ν₂(x)` on a simple self-dual object.

**Claim.** CA1a and CA2a are the single owner of these objects, and QuantumGroups consumes them.

**Witness.** QuantumGroups #1705 is open at `96014ab` (it moved from `7c3e850` since the previous review; the change is elsewhere, in its §8.7).
- Its lines 33–42 still say "Section 0.2 is the single home of C*-categories … the balanced unitary dual functor and signed self-dualities … CategoricalOperatorAlgebras CA1a–CA2a … consume these objects from §§0.2–0.3".
- Its lines 1796–1799 repeat this.
- Its lines 305–307 define `bar(r) r=ε φ_X` and ask: "Prove invariance of the sign on a simple self-dual object", the target this head proves at lines 471–477.

**Status elsewhere.** This README agrees with main and with the other open heads:
- main (`3090489`) QuantumGroups line 42 lists "CategoricalOperatorAlgebras CA1a,CA2a" as a supplier;
- TemperleyLiebOperatorAlgebras #867 at `ba43cc7` consumes CA1a/CA2a (lines 106, 320);
- the other QuantumGroups revision, #1649 at `9b3ff6c`, leaves the general theory to this roadmap (line 35).

Only #1705 claims the objects. This pull request's merge-order paragraph lists AlgebraicKTheory → OperatorKTheory → this pull request and does not mention #1705.

**Repair.** Choose the order and state it in this pull request's description. The README names no pull request either way.

- **This roadmap first.** This is the order main, #867 and #1649 assume.
  - Change nothing in the README.
  - The description names the QuantumGroups revision as later.
  - That revision then deletes its §§0.2–0.3 single-home claim (its lines 33–42 and 1796–1799) and its sign-invariance target (line 307), and cites CA1a/CA2a, with `ε=ν₂(x)` from CA2a.
- **The QuantumGroups revision first.** Once it has merged:
  - at lines 40–46, replace "have their single home here" for the overlapping objects by a citation of QuantumGroups §0.2;
  - delete the QuantumGroups bullet at lines 2303–2309;
  - keep here what §0.2 does not build: W*-categories and W*-Cauchy completion, the grading groupoid for a nonsimple unit, Penneys's Theorem A, the braided sign law and the comparison `ε=ν₂(x)` with the pinned indicator.

**Tested.** Under the first option, ε has one definition (line 466) and one invariance theorem (lines 471–477), and the two roadmaps' sign conventions agree: #1705 line 309 gives the SU(2) fundamental object ε=−1, and on Q₈ the indicator is `(1/8)Σχ(g²)=(2+2+6·(−2))/8=−1`, as in CA2a's Check. The dependency check prints 0 problems at this head.

## Previous findings

- R01 — not repaired: lines 40–46 still read "(CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a"; #1705 at `96014ab` keeps its lines 33–42 and its target at line 307. Carried as R01.
- R02 — repaired: the Katsura, Masuda–Tomatsu 2007 and Masuda–Tomatsu 2009 entries now end "(numbering and printed page numbers of the linked arXiv v3 / v2 / v1)", and each link carries its version.

## Verified sound

### The changed passages (README lines 2357–2416)

The diff touches four reference entries: Katsura, Masuda–Tomatsu 2007, Masuda–Tomatsu 2009 and Izumi 2003. Each link now names an arXiv version, and each entry says its numbering and page numbers are those of that version.

- **The versions are the ones read.** The cached texts are stamped with exactly the linked versions: `Katsura2004` line 5 (math/0309088v3, 18 Sep 2003), `MasudaTomatsu2007` line 5 (math/0604348v2, 14 Nov 2006), `MasudaTomatsu2008` line 5 (0802.0344v1, 4 Feb 2008) and `Izumi2003` line 5 (math/0104228v1, 24 Apr 2001).
- **The locators resolve in those versions.** I reopened 16 of them; every one is on the page the README states.

| Entry | Locator | Source line, page |
|---|---|---|
| Katsura | Definition 3.2, p. 5 | `Katsura2004` 206, p. 5 |
| Katsura | Theorem 6.4, p. 14 | 569, p. 14 |
| Katsura | Theorem 8.6, p. 18 | 764, p. 18 |
| Katsura | Proposition B.5, p. 24 | 1032, p. 24 |
| Masuda–Tomatsu 2007 | Lemma 8.2, p. 64 | `MasudaTomatsu2007` 3037, p. 64 |
| Masuda–Tomatsu 2007 | Lemma 8.3, p. 65 | 3071, p. 65 |
| Masuda–Tomatsu 2009 | Corollary 3.16, p. 29 | `MasudaTomatsu2008` 1320, p. 29 |
| Masuda–Tomatsu 2009 | Theorem 4.6, p. 31 | 1401, p. 31 |
| Masuda–Tomatsu 2009 | Lemma 4.7, p. 32 | 1422, p. 32 |
| Masuda–Tomatsu 2009 | Theorem 4.12, p. 35 | 1534, p. 35 |
| Masuda–Tomatsu 2009 | Lemma 4.15, p. 36 | 1606, p. 36 |
| Masuda–Tomatsu 2009 | Theorem 4.18, p. 37 | 1656, p. 37 |
| Masuda–Tomatsu 2009 | Corollary 4.19, p. 38 | 1664, p. 38 |
| Izumi 2003 | Theorem 2.4, p. 5 | `Izumi2003` 208, p. 5 |
| Izumi 2003 | Theorem 3.3, p. 9 | 376, p. 9 |
| Izumi 2003 | Remark 3.8, p. 17 | 716, p. 17 |

- **What depends on them.** The body locators that these entries serve are unchanged and agree with them: CA7 lines 1129–1157 (Katsura Definition 3.2 p. 5, Definition 8.3 and Proposition 8.2 p. 17, Lemma B.2 and Proposition B.3 p. 23) and the CA9 citations of Masuda–Tomatsu and Izumi. The Katsura entry's wording "the printed page numbers CA7 cites" is accurate: the entry itself gives no pages, CA7 does.
- **Seeded sample.** Of the previous review's 15 sampled targets, one falls on a changed entry: Masuda–Tomatsu 2009 Corollary 4.19 (p. 38), rechecked above. The other 14 are untouched and stand as the previous review recorded them.
- The change states no mathematics, so it adds no statement, Check, supplier citation or Lean name.

### Gate, build and form

- **Gate.** My run of `gate … --base origin/main` at `3375f9e` printed `gate CategoricalOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited 0. The worker's run adds `build=0`.
- **Dependency check.** `gate --depcheck … --movable --content …` printed `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. Since `136b93a` only `README.md` changed (11 insertions, 8 deletions); `Suggested.lean` (57 lines) and `metadata.toml` are byte-identical.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with no diagnostic. The file declares nothing, so the `#check @name` comparison and the one-tactic probe have nothing to run on, and there is no padding. The headline list and the not-statable claims are unchanged from the previous review, which checked them at the pins.
- **Overlaps and citations.** `overlaps.md` lists no other pull request changing this folder and no dropped or revision-only id; the citation resolver lists nothing missing. The one two-owner case is R01.

### Adversarial table

The diff changes no statement, so no new statement row is needed. The 26 statement rows of the previous review (at `136b93a`; CA1a through CA10, all "sound" with their computed values) are carried forward unchanged, since every statement they cover is untouched. The rows for what this review touches:

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| CA2a `ε=ν₂(x)`, shared with #1705 line 307 (R01) | Q₈ and S₃ 2-dimensional irreducibles; SU(2) fundamental at #1705 line 309 | Q₈: `(2+2+6·(−2))/8=−1`; S₃: `(2+3·2+2·(−1))/6=1`; #1705 states ε=−1 for SU(2), matching Q₈ ⊂ SU(2) | conventions agree; two owners (R01) |
| CA1a/CA2a owner (R01) | this README; #1705 at `96014ab`; main QuantumGroups; #867; #1649 | here l. 45; #1705 ll. 33–42, 305–307, 1796–1799; main l. 42; #867 ll. 106, 320; #1649 l. 35 | two single-home claims (R01) |
| Katsura locators (previous R02) | Definition 3.2, Theorems 6.4 and 8.6, Proposition B.5 | pp. 5, 14, 18, 24 of arXiv v3 = pages stated | repaired |
| Masuda–Tomatsu 2007 locators (previous R02) | Lemmas 8.2, 8.3 | pp. 64, 65 of arXiv v2 = pages stated | repaired |
| Masuda–Tomatsu 2009 locators (previous R02; sample target Cor. 4.19) | Cor. 3.16, Thm 4.6, Lem. 4.7, Thm 4.12, Lem. 4.15, Thm 4.18, Cor. 4.19 | pp. 29, 31, 32, 35, 36, 37, 38 of arXiv v1 = pages stated | repaired |
| Izumi 2003 locators (changed wording) | Thm 2.4, Thm 3.3, Rem. 3.8 | pp. 5, 9, 17 of arXiv v1 = pages stated | sound |

## Not verifiable

- **Published numbering.** I could not compare the arXiv numbering with the journal versions of Katsura (J. Funct. Anal. 217), Masuda–Tomatsu (Comm. Math. Phys. 274; Adv. Math. 220) or Izumi 2003 (Amer. J. Math. 125): the publisher pages are paywalled. The entries now cite the versions that were read, so nothing depends on this.
- **Kosaki 1986, Izumi 1993 and Popa 1995** remain `uncertified` and cited by locator; the diff does not touch them.

## Source issues

- none
