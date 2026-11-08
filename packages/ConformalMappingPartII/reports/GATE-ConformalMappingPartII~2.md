# Human-review response: ConformalMappingPartII

## H01 (roed-math) — applied differently

All eleven links to `Completed/ConformalMapping/README.md#layers-each-a-discharge-gated-milestone` (old lines 7, 188, 194, 289, 316, 328, 466, 552, 767 twice, 819) are gone; the one remaining link to ConformalMapping (`TauCetiRoadmap/ConformalMappingPartII/README.md:7`) points to `Completed/ConformalMapping/README.md` with no heading anchor, a path that exists on main and at the ConformalMapping revision head `e14f401`, and every result that the anchor stood for is now cited by its pinned Tau Ceti declaration (H04). The same defect appeared twice more and is repaired the same way: the ClassicalArithmeticCompletion link at line 17 used `#layer-6-topic-20`, which the open ClassicalArithmeticCompletion revision (head `9b984ca`) drops while keeping the heading "6.20 Conformal radius using the existing normalized map" unchanged in content, so it now uses `#620-conformal-radius-using-the-existing-normalized-map`, valid on main and at that head; and line 25's "ConformalMapping’s relationship specification" (a section name the revision removes) now reads "as ConformalMapping assigns it".

## H02 (roed-math) — applied differently

The labels L1–L4 no longer occur. Line 7 names those four layers by subject (normal families; Schwarz–Pick and the Poincaré disc; the Riemann mapping theorem; analytic continuation and reflection), which matches both main's L1–L4 and the revision's Layers 1–4, and the supplier contract at lines 95–104 lists the declarations consumed from each. The suggested pinned-commit links to the revision's headings were not added: once nothing is consumed from a ConformalMapping target, a heading link has nothing to point at. A link to an unmerged head would also freeze a revision that may still change, and every other citation in the README links to `blob/main`.

## H03 (roed-math) — disputed

After the repair, no id in the README or in `Suggested.lean` is defined only by the ConformalMapping revision or dropped by it. The anchorless link and the layer subjects resolve on main and at `e14f401`. Every consumed result is a declaration at the pinned Tau Ceti (`2fd255d`), and these are the declarations that the revision itself lists as already in the library. A revision becomes a dependency only when its numbering or anchors are cited, so this roadmap does not need it in the merge order. The pull-request description is not part of this repair.

## H04 (roed-math) — applied

Old: "From ConformalMapping L1 … L2 … L3 … L4 …" and the anchored links. New: the contract at `TauCetiRoadmap/ConformalMappingPartII/README.md:97–104` states, with modules and hypotheses:

- normal families: `TauCeti.montel`, `TauCeti.IsLocallyBoundedOn`, `TauCeti.hurwitz_injOn`;
- disc automorphisms: `TauCeti.exists_forall_unitDisc_eq_unitDiscStandardAutomorphismEquiv`, `TauCeti.exists_eqOn_const_mul_of_leftInvOn_ball_of_map_zero` and `TauCeti.norm_deriv_div_one_sub_norm_sq_unitDiscStandardAutomorphismFormula_of_norm_lt_one`, with Mathlib `Complex.affine_of_mapsTo_ball_of_norm_dslope_eq_div`;
- Riemann maps, logarithms and roots: `TauCeti.riemannMapping`, `TauCeti.IsNormalizedRiemannMapOn`, `TauCeti.exists_isNormalizedRiemannMapOn`, `DifferentiableOn.invFunOn`, `TauCeti.exists_differentiableOn_eqOn_exp_comp` and `TauCeti.exists_differentiableOn_pow_eq`;
- continuation, monodromy and reflection: `TauCeti.IsAnalyticContinuationAlong`, `TauCeti.ContinuesInside`, `TauCeti.ContinuesInside.exists_analyticOnNhd`, `TauCeti.exists_differentiableOn_eqOn_chartedReflection_of_symmetric` and `TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`.

The *Needs* lines of §§0.3, 0.4, 1.1, 1.2, 1.4, 1.6, 1.7 (prose and both lists), 1.8, 2.4, 3.3, 6.1 and 6.7 cite these declarations in place of the anchored links. The revision lists these names at Tau Ceti `daa6633`; each one was checked again at the pin `2fd255d` (Mathlib `1b1ccf4`) by file and namespace.

Three corrections go beyond renaming:

- §1.7: Tau Ceti's metric is `|dz|/(1−|z|²)`, so the automorphism equality is squared and multiplied by 4 to give invariance of `4|dz|²/(1−|z|²)²`.
- §6.1: the reflected-polygon route of Layer 6 needs the boundary extension of the triangle map, which the old L3 link did not cover. It is now `TauCeti.exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`.
- §1.1: its text says the argument principle rules out collisions in the limit, so `TauCeti.hurwitz_injOn` is now listed.

## H05 (roed-math) — answered

The request to return the status to awaiting review after the repairs is a pull-request action, which the worker takes when it pushes this commit; it needs no file change.

---

**Other change (gate requirement).** The gate failed `statement-hygiene` on `letI` in the signature of `finite_puncture_cusp_comparison` (`TauCetiRoadmap/ConformalMappingPartII/Suggested.lean:119`). Old: `∃ hd : DiscreteTopology Γ, letI := hd; Γ.IsCofinite ∧ ∃ e …`. New: `Γ.IsCofinite ∧ ∀ [DiscreteTopology Γ], ∃ e …`.

The two forms are equivalent. `Subgroup.IsCofinite` (`TauCeti/Analysis/Complex/Fuchsian/Covolume.lean:117`) has the field `discreteTopology : DiscreteTopology Γ`, which supplies the instance needed to use the `∀`. `DiscreteTopology Γ` is a proposition, so the `∃ e` clause does not depend on which instance is chosen. The README statement in §1.7 is unchanged.

**Build.** `lake build TauCetiRoadmap.ConformalMappingPartII.Suggested`: Build completed successfully (9091 jobs). There are 17 `declaration uses 'sorry'` warnings, one per headline theorem, and no errors. The worktree's own `lake-manifest.json` (unchanged, from the branch base) builds against Tau Ceti `a91d3aa`, an ancestor of the brief's pin `2fd255d` (main's manifest). Library names cited in the README were therefore verified by reading the pinned sources at `2fd255d`, not through this build. A temporary `#check` build of them could not run in that environment, because `TauCeti.Analysis.Normed.Group.LocallyBounded` does not exist at `a91d3aa`.

**Gate.** `gate ConformalMappingPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

**Direction check.** `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.

**Signature check.** `#check @name` was put for all 31 declarations of `Suggested.lean` at the end of the file and elaborated once with the prescribed build; the checks were then removed. Every elaborated type was compared with its README statement. The only changed type is `finite_puncture_cusp_comparison`, which elaborates to `… ∃ Γ, (∀ g, g ∈ Γ ↔ ∀ z, f (g • z) = f z) ∧ Γ.IsCofinite ∧ ∀ [inst : DiscreteTopology ↥Γ], ∃ e, …` and agrees with §1.7. `LinearEquation.global_initial_value` takes `SimplyConnectedSpace ↑Ω`, which is definitionally Mathlib's `IsSimplyConnected Ω` (`Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:137`), the hypothesis of `TauCeti.ContinuesInside.exists_analyticOnNhd` now cited in §0.4.

**Citations and ownership.** `roadmaps resolve` on the edited README finds no unknown roadmap name. It still reports `TeschlODE, §1.2` and `McMullenRS, §16`, which are source keys, not roadmaps. `roadmaps overlaps` still lists the two dropped anchors at the old line numbers, because it reads the pull-request head `b8c0542`; the local README contains neither `#layers-each-a-discharge-gated-milestone` nor `#layer-6-topic-20`.

No id this roadmap cites is defined only by an open revision. ConformalMapping and ClassicalArithmeticCompletion are cited as they are on main, at ids that are also valid at the heads of their open revisions (`e14f401`, `9b984ca`). A third open revision of ConformalMapping (head `fcad6f1`) keeps main's headings and is unaffected.

No construction was added, so ownership is unchanged: the declarations newly named are library declarations at the pin, not targets of any roadmap. No source was added or fetched, and `needs-references.toml` was not written. The review text contained no instruction beyond the review itself.

**Adversarial pass on changed statements.**

| Statement changed or added | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| Contract: `TauCeti.montel` paraphrase | `F n = z^n` on 𝔻; `F n = n` | first: sup on 𝔻 is 1, the subsequence tends to 0 locally uniformly; second: sup on any compact set is n, unbounded | bounded case converges, unbounded case excluded; added "into a proper complex normed space" |
| Contract: `TauCeti.hurwitz_injOn` paraphrase | `F n = z/n`; `F n = z + z²/3` (constant sequence) on 𝔻 | first: limit 0, the constant alternative; second: derivative `1 + 2z/3` has `Re ≥ 1/3` on 𝔻, so the map is injective (Noshiro–Warschawski) and the limit is injective | both alternatives occur; "eventually holomorphic, frequently injective" as at the pin |
| Contract: automorphism classification | f = id; f = −z; f = (z−1/2)/(1−z/2) | (u, a) = (1, 0), (−1, 0), (1, 1/2); a equals g(0) in each | statement matches the pin |
| Contract and §1.7: metric invariance | a = 1/2, z = 0; a = 1/2, z = 1/2 | `|φ′|/(1−|φ|²)`: (3/4)/(3/4) = 1 vs 1/(1−0) = 1; (4/3)/1 = 4/3 vs 1/(3/4) = 4/3; ×4 after squaring: squared length 4 at 0 | equal; agrees with the §1.7 Check "squared length 4 at zero" |
| Contract and §1.4: Schwarz equality case | l(z) = cz with |c| = 1; l(z) = z² | `|dslope l 0 0|` = 1, so l = cz; for z² it is 0 < 1 | rotation detected; strict case excluded |
| Contract: `TauCeti.riemannMapping` | Ω = ℂ; Ω = slit plane | ℂ excluded by Ω ≠ ℂ (Liouville); the slit plane has a map, √z then a Cayley map | hypotheses as at the pin |
| Contract and §3.3: holomorphic logarithm | g = 1 + z/2, R = 1; g = z on ℂ∖{0} | first: zero at −2 lies outside the closed disc, `L = Log(1+z/2)`, L(0) = 0; second: not simply connected, so no logarithm, correctly excluded | normalization L(0)=0 by subtracting `L(0) ∈ 2πiℤ` |
| Contract and §2.4: square root of w′ | w = x² on the disc \|x−1\|<1 | w′ = 2x has no zero there; `v₂ ∝ x^(−1/2)`: v₂″ = (3/4)x^(−5/2) = (3/(4x²))v₂; `v₁ ∝ x^(3/2)`: v₁″ = (3/4)x^(−1/2) = (3/(4x²))v₁, matching S(x²) = −3/(2x²) | consistent with the §2.1 Check |
| §0.3/§0.4: `ContinuesInside` and its monodromy theorem | germ of log at 1 in ℂ∖{0}; in the slit plane | continues along all paths in both; a global branch exists only in the simply connected slit plane | simple connectivity needed and present in §0.4 |
| Contract and §6.1: closure homeomorphism | triangle 0, 1, i (N = 2); slit disc | triangle frontier = [0,1] ∪ [0,i] ∪ arc of \|z−(1+i)\|=1, a Jordan curve; slit-disc frontier is not Jordan, excluded | applies to the Layer 6 triangle for every N ≥ 2 |
| §6.7: reflection across geodesics through i | disc reflections z ↦ z̄ and z ↦ e^(−πi/N) z̄ | composite z ↦ e^(−πi/N) z = s(z) as stated in §6.7; on u = F^N the induced Möbius map x ↦ x/(x−1) fixes 0, swaps 1 and ∞, and gives 1 − x/(x−1) = 1/(1−x) | matches (5.2.7) and u(i) = 0 |
| Line 17 anchor | main heading; heading at the ClassicalArithmeticCompletion revision head | both "6.20 Conformal radius using the existing normalized map"; that revision's internal links use `#620-conformal-radius-using-the-existing-normalized-map` | resolves at both |
| `finite_puncture_cusp_comparison` restatement | S = {0, 1, ∞}; \|S\| = 2 | Γ(2) mod ±1 is discrete and cofinite, so the instance exists and the clause is not vacuous; \|S\| = 2 is excluded by `3 ≤ S.card` | equivalent to the old form |
