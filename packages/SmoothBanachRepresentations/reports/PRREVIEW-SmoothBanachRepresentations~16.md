# Review of SmoothBanachRepresentations (pull request #1145 at 7cde28a)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`
**Verdict:** needs changes

This is an incremental re-review of the 3 lines changed since 7d95047. All of them are in `README.md`: the scope paragraph at :11 and a new entry in `## References` at :556.

- The previous R02, the description of the pinned Henkel declaration, is repaired. The repair is correct (rows N1–N6 below).
- The previous R01, the family index, is not repaired. It is carried below as R01.

The only finding is P3. The gate passes.

## R01 (P3) — The family index still omits this roadmap, and its scope paragraph contradicts it

This carries the previous R01 (earlier R02, R05 and R01). No repair report marks it not actionable.

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md`:
- :11, “## The roadmaps”: 14 of the 15 subfolders are linked. `SmoothBanachRepresentations` has no link.
- :129–131: “The analytic representation theory stops at compact groups … no infinite-dimensional unitary representations of noncompact groups”.

**Claim.**
- The family index does not list this folder.
- Its scope boundary excludes what Layers 0–4 cover: strongly continuous representations of arbitrary Lie groups, including unitary ones.
- The pull request description names neither the companion pull request that adds the entry nor the order in which the two merge. Its revision dependencies list only #1015 and #1143.

**Witness.**
- At this head, a per-folder count of `](<Dir>/README.md)` in the index gives 0 for SmoothBanachRepresentations. Every other folder gets at least 1 (ModularInduction gets 2).
- `git diff origin/main...HEAD` on the index is empty.
- #1146 (`RepresentationTheory`, head e5e8364, still open) has the bullet at :55 and the rewritten scope bullet at :119–125.

**Repair.** Do one of the following:
- Copy #1146's bullet (:55) and its scope bullet (:119–125) into this pull request's family `README.md`, replacing :129–134. The count then gives 15 of 15.
- Or add to the description: “#1146 adds the family-index entry and scope change for this roadmap and merges right after this pull request.”

## Previous findings

- R01 — not repaired: `TauCetiRoadmap/RepresentationTheory/README.md` still links 14 of 15 folders, :129–131 still exclude noncompact unitary representations, and the description names only #1015 and #1143 as revision dependencies. Carried as R01.
- R02 — repaired: “The first proves the surjective-implies-open direction of Henkel's open mapping theorem (Henkel, Theorem 1.6, p.4) only for a nonarchimedean source, with a Baire target; the published theorem has no nonarchimedean hypothesis and contains the Fréchet case” (:11). Henkel is added to References (:556). No new problem.

## Verified sound

**Head and diff.**
- Head `7cde28a07a18810431571988fe4484f3531b6c15`; the worktree is clean.
- Since 7d95047, only `README.md` changed (+2/−1):
  - In :11, the parenthetical “the formalisation of Henkel's theorem” is replaced by a sentence that says what the pinned declaration proves and what the published theorem contains.
  - :556 is a new References entry for Henkel.
- `Suggested.lean` is byte-identical to 7d95047. Nothing outside the folder changed in this round.
- This review changed no file in the worktree or the manifest. It wrote only scratch probe files.

**Gate.**
- With the default configured order, the gate prints `depcheck: NOT IN ORDER: SmoothBanachRepresentations`. That comes from the order file: the roadmap is still a pull request, and the candidate order lists it at line 60.
- Rerun with `--order` set to the candidate order and with `--build`:

```text
gate SmoothBanachRepresentations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

**Dependency check** (`gate --depcheck … --movable`, candidate order, content main 86b3953):

```text
depcheck: 238 roadmaps, 2320 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or moved line.
- LocallyAnalyticDistributions (line 44) and AutomorphicFormsOnReductiveGroups (line 59) both come before this roadmap (line 60).

**Elaboration.**
- `lake env lean Suggested.lean` gives exactly 7 warnings, all “declaration uses `sorry`”, at :95, :104, :116, :135, :148, :165 and :183. There are no other messages.
- `#check @name` on all 12 declarations, in one scratch file, elaborates without error. After stripping the namespace, the 12 types are identical to `signatures.md` (the hashes of the two texts are equal).
- No statement changed, so the earlier comparisons with the README and the one-tactic probes still stand. That includes the six “dropped binder” leads on definitions, which earlier rounds matched against the README.

**Changed sentence, against the pin (Tau Ceti 2fd255d).**
- `TauCeti.HasZeroSequenceOfUnits.isOpenMap` (`Topology/Algebra/OpenMapping/Henkel.lean:79`).
  - Section binders at :66–69 include `[CompleteSpace M]`, `[(𝓝 0).IsCountablyGenerated]`, `[NonarchimedeanAddGroup M]`, `[T0Space N]` and `[BaireSpace N]`.
  - Hypotheses: `Function.Surjective f`, continuity at 0 of f and of the scalar action. Conclusion: `IsOpenMap f`.
  - So it is the surjective-implies-open direction, for a nonarchimedean source and a Baire target, as the sentence says.
- `HasZeroSequenceOfUnits` (`Topology/Algebra/ZeroSequenceOfUnits.lean:93`) is the existence of a sequence of units tending to 0. This is Henkel's ring hypothesis.
- `LinearMap.isOpenMap_of_isTateRing` (`RingTheory/Huber/OpenMapping.lean:109`) has a nonarchimedean source (:98), and its proof term at :111 is `TauCeti.HasZeroSequenceOfUnits.isOpenMap`. So “which applies it” is exact.

**Changed sentence, against the source.**
- `henkel2014` lines 131–141 (Theorem 1.6) assume:
  - a topological ring with units tending to 0;
  - Hausdorff modules with countable bases at 0;
  - a complete source;
  - a continuous linear map.
- Neither the theorem nor the definitions of page 3 (lines 101–104) contain a nonarchimedean hypothesis.
- Equivalence 1)⇔4) is “target complete and map surjective” ⇔ “map open”, which is what the References entry states.
- Locator:
  - the page marker is at line 117;
  - the printed folio “4” is at line 147;
  - the arXiv v2 date (6 Oct 2014) is at line 5.
  
  The manifest's `henkel2014` entry (`arxiv = "1407.5647v2"`, locator Theorem 1.6, status certified) agrees, and the README reuses that work rather than adding a second key.
- The README's “with a Baire target” is a description, not a narrowing. Henkel's target hypotheses (complete, Hausdorff, countable basis) already give Baire, by Corollary 1.3 and Proposition 1.5 (lines 121–128).

**Citations depending on the changed paragraph, resolved.**
- The paragraph explains why §7.2 consumes LocallyAnalyticDistributions §0.2.
- At that roadmap's open head 473fb50 (#854):
  - the heading “### 0.2 Strict sequences and three-space properties” is at :1082;
  - **Fréchet open mapping** is at :1108, over a complete nontrivially valued field, with no ultrametric hypothesis.
- This is what contract :84 and §7.2's *Needs* (:456) consume.
- `roadmaps resolve` and `overlaps.md` report:
  - no citation found nowhere;
  - no dropped id;
  - no other open pull request changing this roadmap.

**Seeded sample.**
- Of the sampled targets, only 7.2's supplier citation depends on the changed passage, and it is resolved above.
- 0.1–0.3, 1.5, 3.1–3.4, 5.1, 6.1, 7.1, 7.2a, 7.4 and 8.1 are unchanged, and earlier rounds verified them against `casselman2016` and `phillips1955`.

**Ownership.** The change adds no owned object. It only names pinned declarations and a source.

**Remarks on untouched text.** None.
- Outside this roadmap: the pinned Tau Ceti docstring gives the author as “L. Henkel” (`Henkel.lean:56`).
- The README correctly gives Timo Henkel.

### Adversarial table

New rows, for the statements this diff adds or changes:

| # | Statement | Instances and values computed | Result |
|---|---|---|---|
| N1 | The pinned declaration proves surjective ⇒ open only for a nonarchimedean source, with a Baire target | Applies: A=ℚ_p with units pⁿ, \|pⁿ\| = 1, 1/p, 1/p², … → 0, and M=N=ℚ_p^ℕ, which has open subgroups ∏_{i≤m} pᵏℤ_p × ∏_{i>m} ℚ_p. Excluded: A=ℝ and M=ℝ^ℕ, since `NonarchimedeanAddGroup` fails (the subgroup generated by {\|x₀\|<1} is all of ℝ^ℕ; r15 N2). Binders at Henkel.lean:66–69. | True |
| N2 | The published theorem has no nonarchimedean hypothesis | `henkel2014` lines 131–134 list 4 hypotheses: units → 0; Hausdorff with a countable basis at 0; complete source; continuous linear map. 0 of them is ultrametric. | True |
| N3 | The published theorem contains the Fréchet case over ℝ and ℂ via the units 1/n | uₙ = 1/n: 1, 0.5, 0.1 (n=10), 0.01 (n=100) → 0, each nonzero and hence a unit; the same moduli in ℂ. V=ℝ^ℕ and W=ℓ² are Hausdorff, metrisable and complete, so 1)⇒4) gives openness of every continuous linear surjection V→W. | True |
| N4 | References entry: open ⇔ surjective with complete target | id on ℝ: surjective, complete target, open. The zero map ℝ→ℝ: image {0}, not surjective and not open. id from (ℓ¹,‖·‖₁) to (ℓ¹,‖·‖₂): surjective, but the target is incomplete; on e₁+…+eₙ the norms are 4 against 2 (n=4) and 100 against 10 (n=100), so the map is not open. Both directions hold. | True |
| N5 | Locator “Theorem 1.6, p.4”, arXiv v2 (2014) | Theorem at line 131, page marker at line 117, folio “4” at line 147, v2 dated 6 Oct 2014 at line 5. The manifest's version note says “Theorem 1.6 p.4”. | True |
| N6 | `LinearMap.isOpenMap_of_isTateRing` “applies it” | The proof term at Huber/OpenMapping.lean:111 is `TauCeti.HasZeroSequenceOfUnits.isOpenMap f hf hfc _`, and the source is nonarchimedean at :98. | True |

Rows carried from `PRREVIEW-SmoothBanachRepresentations_r15` (adversarial table) for untouched statements, with that report's values. Its N8 (“the formalisation of Henkel's theorem”) is superseded by N1–N3 above.

| r15 row | Statement | Values (from r15) | Result |
|---|---|---|---|
| N1 | V is not σ-compact | V=ℝ^ℕ; (0, a₁+1, 0, …) lies in {\|x₀\|<1} but outside the box ∏[−aₙ,aₙ] | True |
| N2 | V is not nonarchimedean | v=(5,0,…) = 10·(0.5,0,…); (2,0,…) is not in {\|x₀\|<1} | True |
| N3 | W does not carry the module topology | wₙ=eₙ/n in ℓ²: ‖w₁₀‖=0.1, ‖w₁₀₀‖=0.01; φ(wₙ)=1 does not tend to 0 | True |
| N4 | No single seminorm defines V's topology | p(e_{m+1})=0; 2e_{m+1} is not in {\|x_{m+1}\|<1} | True |
| N5 | The quotient-topology hypothesis is the conclusion | Neighborhood.lean:196; sin(nx)/n gives p₀=1/n and p₁=1/n+1 | True |
| N6–N7 | The list of pinned criteria is complete; no pinned Fréchet open mapping theorem | Mathlib: 4 criteria and 2 with finite-dimensional targets; Tau Ceti: 9 theorems, all with a seminormed or nonarchimedean source | True |
| N9 | :9 citation of LocallyAnalyticDistributions §0.2 | heading at :1082, theorem at :1108 (re-resolved this round) | True |
| r14 N1–N3 | §7.2, contract :84, Check :496 | M=E: target 0; ‖2‖=2>1; n=10: 0.1 and 1.1 | True |
| r13 N1–N12 | 0.2, 0.3, 1.3, 4.1, 6.1, 7.2a, docstrings | A₂x=2x; A(i)=−1; e≈2.718; quotient norm 1; 12 of 12 signatures | True |
| r12 1–22 | 0.1, 1.1–1.4, 3.1–3.4, 4.1, the 7 headline theorems, 7.1–7.4, 8.1 | dim D_K=\|K\|; δ_(12)*δ_(23)=δ_(123); f(1)=1/2; ‖δ_z−δ₁‖=2; (dαE₁₂)*=E₂₁ | True |

## Not verifiable

- **Dixmier–Malliavin, Bull. Sci. Math. 102 (1978).** The manifest records it as uncertified (no legal open copy), and the README relies on Casselman's verified statements. Not fetched this round.
- **Schneider's notes, Proposition 8.6.** This is LocallyAnalyticDistributions' source for the theorem consumed here, and I did not open it. The consumed form is also contained in Henkel's Theorem 1.6 (row N3).
- **Ownership against the three board packages** (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory): I did not read their READMEs. The change adds no owned object.

## Source issues

- none
