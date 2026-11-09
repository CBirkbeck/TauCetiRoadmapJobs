# Review of SmoothBanachRepresentations (pull request #1145 at 7d95047)
Folder: `TauCetiRoadmap/RepresentationTheory/SmoothBanachRepresentations/`
**Verdict:** needs changes

This is an incremental re-review of the 4 lines changed since 41f719f. All of them are in the scope paragraphs of `README.md` (:9 and :11).

- The previous R02, the incomplete list of pinned open mapping theorems, is repaired.
- The previous R01, the family index, is not repaired. It is carried below as R01.
- The rewritten paragraph adds one imprecise claim, R02.

Both findings are P3. The gate passes.

## R01 (P3) — The family index still omits this roadmap, and its scope paragraph contradicts it

This carries the previous R01 (earlier R02, R05 and R01). No repair report marks it not actionable.

**Location.** `TauCetiRoadmap/RepresentationTheory/README.md`:
- :11, “## The roadmaps”: 14 of the 15 subfolders are linked. `SmoothBanachRepresentations` gets 0 links.
- :129–131: “The analytic representation theory stops at compact groups … no infinite-dimensional unitary representations of noncompact groups”.

**Claim.**
- The family index does not list this folder.
- Its scope boundary excludes what Layers 0–4 cover: strongly continuous representations of arbitrary Lie groups, including unitary ones.
- The pull request description names neither the companion pull request that adds the entry nor the order in which the two merge.

**Witness.**
- At this head, a per-folder count of `](<Dir>/README.md)` in the index gives 1 for 13 folders, 2 for ModularInduction and 0 for SmoothBanachRepresentations.
- `git diff origin/main...HEAD` on the index is empty, and the description does not mention #1146.
- #1146 (head e5e8364) has the bullet at :55 and the rewritten scope bullet at :119–125.

**Repair.** Do one of the following:
- Copy #1146's bullet (:55) and its scope bullet (:119–125) into this pull request's family `README.md`, replacing :129–134. The count then gives 15 of 15.
- Or add to the description: “#1146 adds the family-index entry and scope change for this roadmap and merges right after this pull request.”

## R02 (P3) — Calling the pinned declaration “the formalisation of Henkel's theorem” misstates Henkel's theorem

**Location.** `README.md`:11 (new at this head):

> in Tau Ceti they need … a nonarchimedean one (`TauCeti.HasZeroSequenceOfUnits.isOpenMap`, the formalisation of Henkel's theorem, and `LinearMap.isOpenMap_of_isTateRing`, which applies it)

**Claim.**
- The pinned declaration formalises only the case of Henkel's theorem with a nonarchimedean source.
- The published theorem has no such hypothesis. It already contains the open mapping theorem for Fréchet spaces over ℝ and ℂ, which the paragraph says no pinned declaration proves.
- As written, the sentence reads as if Henkel's theorem itself needs a nonarchimedean source. The paragraph's conclusion is still true, but only because the formalisation adds that hypothesis.

**Witness.**
- `henkel2014` lines 131–141 (Theorem 1.6, p. 4) assume:
  - a topological ring with a sequence of units tending to 0;
  - Hausdorff modules whose neighbourhoods of 0 have a countable basis;
  - a complete source.
- They assume nothing nonarchimedean. ℝ with units 1/n, and M=N=ℝ^ℕ, satisfy all of this.
- The pin adds `[NonarchimedeanAddGroup M]` at `TauCeti/Topology/Algebra/OpenMapping/Henkel.lean:69`.

**Repair.**
1. Replace “the formalisation of Henkel's theorem” with:

   > which formalises Henkel's open mapping theorem (Henkel, Theorem 1.6, p. 4) only for a nonarchimedean source; the published theorem has no such hypothesis and contains the Fréchet case over ℝ and ℂ

2. Add to `## References`: Timo Henkel, *An Open Mapping Theorem for rings which have a zero sequence of units*, arXiv:1407.5647 (2014), Theorem 1.6, p. 4. The package manifest already records this work as `henkel2014`.

I tested the amended sentence on R=ℝ and M=N=ℝ^ℕ:
- Theorem 1.6 applies: 1/n gives 1, 0.5, 0.1, … → 0, and ℝ^ℕ is complete with a countable basis at 0.
- The pinned theorem does not apply. The nonarchimedean argument of :11 itself excludes ℝ^ℕ: the neighbourhood {|x₀|<1} contains no open subgroup.
- So the amended sentence is true, and the paragraph's conclusion is unchanged.

## Previous findings

- R01 — not repaired: `TauCetiRoadmap/RepresentationTheory/README.md` still links 14 of 15 folders, :129–131 still exclude noncompact unitary representations, and the description does not name #1146. Carried as R01.
- R02 — repaired: “a target carrying the module topology (`IsModuleTopology.isOpenMap_of_surjective`) or a target carrying the quotient topology of the source (`Submodule.isOpenMap_mkQ`)”. The paragraph shows that W carries neither (:11). The Tau Ceti list has been extended. The new wording is R02 of this report.

## Verified sound

**Head and diff.**
- Head `7d95047bcb7cf96c544a5bb68f0b7764a1bde864`; the worktree is clean.
- Since 41f719f, only `README.md` changed (+3/−1):
  - :9 lost its last two sentences;
  - the paragraph at :11 is new.
- `Suggested.lean` is byte-identical to 41f719f. Nothing outside the folder changed.
- This review changed no file in the worktree or the manifest. It wrote only scratch probe files.

**Gate.** With the default configured order, the gate prints `depcheck: NOT IN ORDER: SmoothBanachRepresentations`. That comes from the order file: this roadmap is still a pull request, and the candidate order lists it at line 58. Rerun with the candidate order and `--build`:

```text
gate SmoothBanachRepresentations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

**Dependency check** (`gate --depcheck … --movable`, candidate order, content main dcf5cfe):

```text
depcheck: 238 roadmaps, 2353 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or moved line.
- LocallyAnalyticDistributions (line 44) and AutomorphicFormsOnReductiveGroups (line 57) both come before this roadmap (line 58).

**Elaboration.**
- `lake env lean Suggested.lean` gives exactly 7 warnings, all “declaration uses `sorry`”, at :95, :104, :116, :135, :148, :165 and :183.
- `#check @name` on all 12 declarations elaborates without error, and the 12 types match `signatures.md` exactly.
- No statement changed, so the earlier comparisons with the README and the one-tactic probes still stand. That includes the six “dropped binder” leads on definitions, which earlier rounds matched against the README.

**Every declaration named in the new paragraph, elaborated with `#check` at the pins** (Mathlib 1b1ccf4, Tau Ceti 2fd255d). There were 0 errors, and the hypotheses are as the paragraph says.

Mathlib:
- `ContinuousLinearMap.isOpenMap` (`Analysis/Normed/Operator/Banach.lean:229`): normed spaces with `CompleteSpace E` and `CompleteSpace F`.
- `AddMonoidHom.isOpenMap_of_sigmaCompact`: generated by `to_additive` from `Topology/Algebra/Group/OpenMapping.lean:114`. It needs `[SigmaCompactSpace G]`, `[BaireSpace H]` and `[T2Space H]`.
- `IsModuleTopology.isOpenMap_of_surjective` (`ModuleTopology.lean:491`): needs `[IsModuleTopology R B]`.
- `IsModuleTopology.continuous_of_linearMap` (`ModuleTopology.lean:340`): asks only `ContinuousAdd` and `ContinuousSMul` of the target, so it applies with ℝ or ℂ as the target.
- `Submodule.isOpenMap_mkQ` (`Topology/Algebra/Module/Basic.lean:333`).

Tau Ceti:
- `TauCeti.isOpenMap_of_exists_norm_le` (`Analysis/Normed/Group/OpenMapping.lean:26`): seminormed source and target.
- `LinearMap.isOpenMap_of_isTate` (`Analysis/Normed/Operator/RingOpNorm/OpenMapping.lean:159`): seminormed ultrametric source.
- `TauCeti.HasZeroSequenceOfUnits.isOpenMap` (`Topology/Algebra/OpenMapping/Henkel.lean:79`; the nonarchimedean hypothesis is at :69).
- `LinearMap.isOpenMap_of_isTateRing` (`RingTheory/Huber/OpenMapping.lean:109`): nonarchimedean source at :98, and its proof applies Henkel's theorem.

**Completeness of the list.**

I searched both pinned libraries for every theorem concluding `IsOpenMap` or `IsOpenQuotientMap`.

In Mathlib, every result that gives openness from conditions on source and target falls into one of the four classes the paragraph names, or has a finite-dimensional target:
- `isOpenMap_of_finiteDimensional` and `ContinuousLinearMap.isOpenMap_of_ne_zero` have finite-dimensional targets.
- `MonoidHom.isOpenQuotientMap_of_isQuotientMap` is the quotient-topology case.

`ContinuousLinearEquiv.isOpenMap`, `isOpenMap_toWeakSpace_symm` and the product projections concern one particular map, not a condition on source and target, so the sentence's scope excludes them.

In Tau Ceti, every openness theorem has a seminormed source or a nonarchimedean (or Tate-ring) source:
- `ContinuousLinearMap.isOpenMap_of_isTate` and `isOpenMap_rangeRestrict_of_isClosed_range_of_isTate` (RingOpNorm/OpenMapping.lean:282 and :310);
- `TauCeti.isOpenMap_of_closure_image_mem_nhds` (`OpenMapping/Complete.lean:116`, nonarchimedean);
- `IsTateRing.isOpenMap_linearCombination` (Huber/OpenMapping.lean:162);
- `isOpenMap_completion` (`Nonarchimedean/Completion/Surjective.lean:84`).

No Tau Ceti file proves openness for spaces carrying a `WithSeminorms` topology. So the claim “No pinned declaration proves the Fréchet open mapping theorem over ℝ or ℂ” holds.

**Mathematics of the new paragraph.** All five arguments are correct; see rows N1–N5 below. The quotient-topology sentence is exactly `MonoidHom.isOpenQuotientMap_iff_isQuotientMap` (`Topology/Algebra/Group/Neighborhood.lean:196`): a continuous surjective homomorphism is open if and only if it is a quotient map.

**Citations on the edited line 9, resolved.**
- LocallyAnalyticDistributions is still at head 473fb50 (#854). The heading “### 0.2 Strict sequences and three-space properties” is at :1082, and **Fréchet open mapping** is at :1108 with no ultrametric hypothesis. This is the theorem consumed in §7.2 (:454, *Needs* :456) and in the contract at :84.
- `roadmaps resolve` and `roadmaps overlaps` report no citation found nowhere, no dropped id and no other open pull request changing this roadmap.
- The deleted text of :9 is restated at :11. No other line referred to it.

**Seeded sample.**
- Of the sampled targets, only 7.2's supplier citation falls in the changed passages, and it is resolved above.
- I checked Henkel's Theorem 1.6 against `henkel2014` (lines 117, 131–141), which led to R02.
- 0.1–0.3, 1.1, 1.2, 1.4, 2.1, 3.2, 3.3, 5.1, 7.2a, 7.3, 7.4 and 8.1 are unchanged, and earlier rounds verified them.

**Ownership.** The change adds no owned object. It only names library declarations and the existing owner (LocallyAnalyticDistributions §0.2). The closest open roadmaps in `overlaps.md` were compared in earlier rounds.

**Remarks on untouched text.** None.

### Adversarial table

New rows, for the statements this diff adds or changes:

| # | Statement | Instances and values computed | Result |
|---|---|---|---|
| N1 | V is not σ-compact | V=ℝ^ℕ. Every compact K lies in some box ∏[−aₙ,aₙ]. The neighbourhood {\|x₀\|<1} contains (0, a₁+1, 0, …), which lies outside the box, so no compact set has interior. ℝ^ℕ is Baire, so countably many compact sets cannot cover it. | True |
| N2 | V is not nonarchimedean | Let U be an open subgroup containing {\|x₀\|<1}. For v=(5,0,…): v/10=(0.5,0,…) is in U, so v=10·(v/10) is in U. Vectors with x₀=0 are already in U. So U=ℝ^ℕ, and {\|x₀\|<1}, which omits (2,0,…), contains no open subgroup. | True |
| N3 | W does not carry the module topology | W=ℓ², wₙ=eₙ/n: ‖w₁₀‖=0.1 and ‖w₁₀₀‖=0.01, tending to 0. Extend to a Hamel basis with φ(wₙ)=1. Then φ(wₙ)=1 does not tend to φ(0)=0, so φ is discontinuous, whereas `continuous_of_linearMap` would force continuity. | True |
| N4 | No single seminorm defines V's topology | ℝ^ℕ with a candidate seminorm p. Some {\|x₀\|,…,\|x_m\|<δ} ⊆ {p<1} contains t·e_{m+1} for every t, so p(e_{m+1})=0. Then 2e_{m+1} lies in every p-ball but not in {\|x_{m+1}\|<1}. | True |
| N5 | The quotient-topology hypothesis is the conclusion | Openness is equivalent to being a quotient map (Neighborhood.lean:196). Off the Fréchet class: id from C∞(S¹) to (C∞(S¹), sup), with sin(nx)/n: p₀=1/n and p₁=1/n+1, so the target topology is strictly coarser than the quotient topology. | True |
| N6 | The four Mathlib classes and two Tau Ceti classes are complete | Mathlib: 4 general criteria and 2 with finite-dimensional targets. The rest concern particular maps: equivalences, the weak-space identity and product projections. Tau Ceti: 9 openness theorems, each with a seminormed or nonarchimedean source (list above). | True |
| N7 | No pinned Fréchet open mapping theorem over ℝ or ℂ | Follows from N1–N6 at V=ℝ^ℕ and W=ℓ². No Tau Ceti file proves openness for `WithSeminorms` spaces. | True |
| N8 | “the formalisation of Henkel's theorem” | Henkel Thm 1.6 at R=ℝ (units 1, 0.5, 0.1, … → 0) and M=N=ℝ^ℕ: the hypotheses hold and the conclusion is openness. The pin needs `NonarchimedeanAddGroup`, which fails by N2. | Overclaim (R02) |
| N9 | :9 citation of LocallyAnalyticDistributions §0.2 | Head 473fb50: heading at :1082, theorem at :1108, no ultrametric hypothesis. Its binders agree with contract :84 (r14 N2). | True |

Rows carried from `PRREVIEW-SmoothBanachRepresentations_r14` (adversarial table) for untouched statements, with that report's values. Its N4 and N5 (old scope sentence) are superseded by N1–N8 above, and its N6 is superseded by N6.

| r14 row | Statement | Values (from r14) | Result |
|---|---|---|---|
| N1 | §7.2 quotient topology via LocallyAnalyticDistributions §0.2 | M=E: target 0. M=0: identity. Mean-zero M in C(S¹): image of the p₀-ball of radius r is the disc of radius r. Diagonal C(S¹)⊕C(S¹): p₁(f,0)=p₁(f). | True |
| N2 | Contract :84 against `naFrechet_openMapping` | 2 field binders and 7 binders per space, plus 2 `WithSeminorms` families; ‖2‖=2>1 | True |
| N3 | Check :496 | n=1: 1 and 2; n=10: 0.1 and 1.1; n=100: 0.01 and 1.01 | True |
| N7 | §7.0 deletion | no external citation of §7.0 | No defect |
| r13 N1–N3 | 0.2 scaling, 𝕜-linearity, no additivity | A₂x=2x; A(i)=−1=i·A1; strip quotient → ∞ | True |
| r13 N4–N7 | 0.3 Check, 1.3, 4.1, 6.1 | e≈2.718; ‖π(f)v‖=‖v‖; dimension 2; J=e^{−s₂} | True |
| r13 N9, N12 | 7.2a quotient; docstring | quotient norm 1; 12 of 12 signatures | True |
| r12 1–22 | 0.1, 1.1–1.4, 3.1–3.4, 4.1, the 7 headline theorems, 7.1–7.4, 8.1 | e≈2.718; dim D_K=\|K\|; e−1≤e; δ_(12)*δ_(23)=δ_(123); q_H=1; f(1)=1/2; √2+1 against 1; ‖δ_z−δ₁‖=2; (dαE₁₂)*=E₂₁ | True |

## Not verifiable

- **Dixmier–Malliavin, Bull. Sci. Math. 102 (1978).** The manifest records it as uncertified (no legal open copy), and the README relies on Casselman's verified statements. Not fetched this round.
- **Schneider's notes, Proposition 8.6.** This is LocallyAnalyticDistributions' source for the theorem consumed here, and I did not open it. The consumed form is the classical open mapping theorem for F-spaces, which Henkel's Theorem 1.6 also contains.
- **Ownership against the three board packages** (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory): I did not read their READMEs. The change adds no owned object.

## Source issues

- none
