# Review of ClassifyingSpaces (pull request #1807 at 35d5208)

**Verdict:** needs changes

This is an incremental re-review: the previous review (r59) read 3f935aa.

What changed since then:
- This folder has changed by 0 lines.
- `git diff --stat 3f935aa HEAD` with `TauCetiRoadmap/AlgebraicTopology`, `TauCetiRoadmap/CharacteristicClasses`, `lake-manifest.json` and `lean-toolchain` as paths is empty.
- The five commits since 3f935aa touch BordismFormalGroups, GeneralizedCohomology, PadicFunctionalAnalysis, RigidAnalyticGeometry and TopologicalKTheory. None of these five folders mentions this roadmap at this head (`grep ClassifyingSpaces` over their README and Suggested.lean files is empty). The diff's only "classifying" line, in BordismFormalGroups, is about the classifying map of a formal group law.
- One thing outside this pull request has changed. AlgebraicTopology #1652 is now merged into main (9ecced85). This pull request's merge-order block lists #1652 ahead of this one for that folder. `git merge-tree HEAD origin/main` now reports conflicts in `AlgebraicTopology/README.md` and `AlgebraicTopology/Suggested.lean`, so that folder has to be rebased. Main's new AlgebraicTopology text is a further witness for R01, and it changes the repair.

r59 had one finding, R01. It is not repaired, and no repair report marks it as not actionable. It is carried below under its old number, with every witness re-read at this head and on main as it now stands.

## R01 (P2) — Hatcher 1B.9 has two owners, and the claim here that AlgebraicTopology 8.8b consumes Layer 1 is false at this head and on main (carried from r59 R01)

**Location.** `TauCetiRoadmap/ClassifyingSpaces/README.md`:
- lines 83–86: "The classification of pointed maps from a connected pointed CW complex into a `K(π, 1)` … is owned here, not in the algebraic-topology roadmap."
- lines 1193–1196 (*Downstream consumers*): "Its inputs from this roadmap are Layer 1: item 1.1 … item 1.2 … and item 1.3".

**Claim.** This roadmap owns Proposition 1B.9 (items 1.1–1.2, headline `exists_continuousMap_mapOfEq_eq_of_isAspherical`). It also says that AlgebraicTopology Stage 8.8b consumes Layer 1, items 1.1–1.3, and compares the nerve model with both pinned models.

**Witness.** Main `AlgebraicTopology/README.md:139` (after #1652) says "nothing of it is consumed here", and lines 3720–3721 prove `[X,Bπ]_*≃Hom(π₁X,π)` themselves. This head's `AlgebraicTopology/Suggested.lean:693` states `exists_mapOfEq_eq_of_isAspherical_cwComplex`, matching headline 1 binder for binder.

Further witnesses, all re-read today:
- **This head's AlgebraicTopology.** README lines 94–107 and 2857 say this roadmap "consumes that classification … and owns no second proof of it". Line 2825 says it owns the normalised bar comparison. The 8.8b row at line 3314 lists only "8.8a bar model, 4, 8.5" as inputs.
- **Main's AlgebraicTopology, comparison.** 8.8b compares the nerve model with Milnor's model only (`c_G : Bπ ≃ classifyingSpace π`, line 3707). It makes the equivalence pointed itself, along a path, from the pinned `TauCeti.IsAspherical.exists_homotopyEquiv` (lines 3707–3711). That pointed upgrade is item 1.3 here.
- **Main's table.** Row 4691 lists only Layer 8.8a and Tau Ceti as inputs of 8.8b. Main's §8.14 (line 4440) uses 8.8b's "existing K(π,1) classifier".
- **The grep.** `roadmaps grep --fixed 'HomotopicRel f g {x}'` returns these hits:
  - #1807: `AlgebraicTopology/Suggested.lean:701` and `ClassifyingSpaces/Suggested.lean:92`;
  - #1808: `ClassifyingSpaces/Suggested.lean:90`;
  - #1854: `AlgebraicTopology/Suggested.lean:647`;
  - main: no hit.

So the same theorem is stated twice in this pull request. On both sides the other roadmap is called the consumer, and the consumer bullet here matches neither this head's AlgebraicTopology nor main's.

**Repair.** This roadmap's general statement (any aspherical target, any base point) should be the single owner, and AlgebraicTopology should cite it. This README already says it consumes nothing from AlgebraicTopology (line 86), so the new AlgebraicTopology → ClassifyingSpaces edge creates no cycle.

1. **Rebase.** Rebase this pull request's `AlgebraicTopology` folder onto main. When resolving the conflicts, drop `exists_mapOfEq_eq_of_isAspherical_cwComplex` (this head's `AlgebraicTopology/Suggested.lean` lines 685–702, with its Stage 8.8b section comment) and its README mentions (this head's lines 556 and 2833). Main's `AlgebraicTopology/Suggested.lean` does not state it.
2. **AlgebraicTopology README.** In the rebased file, using main's line numbers:
   - line 139: replace "and nothing of it is consumed here" by "Layer 8.8b consumes its Layer 1, items 1.1–1.3, and nothing else of it";
   - lines 3707–3711: take the pointed, π₁-normalised `c_G` from ClassifyingSpaces item 1.3, with items 1.1–1.2 for the pointed map and its uniqueness up to pointed homotopy. This replaces making `TauCeti.IsAspherical.exists_homotopyEquiv` pointed along a path;
   - lines 3720–3722: obtain `[X,Bπ]_*≃Hom(π₁X,π)` as ClassifyingSpaces items 1.1–1.2 with the bar model as target (aspherical by 8.8a). Keep the conjugation-orbit description and the componentwise treatment of disconnected X;
   - line 4691 (8.8b row): add "ClassifyingSpaces Layer 1 items 1.1–1.3" to the inputs.
3. **This README, lines 75–80 and 1191–1193.** Name only the models 8.8b actually compares with. Main's 8.8b names `classifyingSpace π` alone. Either 8.8b also compares with `TauCeti.cellularClassifyingSpace R`, or these lines drop it.

An equivalent repair keeps main's path-based route at lines 3707–3711. In that case narrow lines 80–83 and 1193–1196 here to "items 1.1–1.2 for `[X, Bπ]_* ≃ Hom(π₁X, π)`" and drop item 1.3. Either way, the two READMEs must say the same thing.

**Checked against the refuting instance.**
- The grep above shows two #1807 hits today, and main has none. After step 1 the only #1807 hit is `ClassifyingSpaces/Suggested.lean:92`.
- The only edge between the two roadmaps is then AlgebraicTopology consuming ClassifyingSpaces.
- This README's dependency check is unaffected: it cites nothing of AlgebraicTopology as a supplier, and today's run is `0 problem(s)`.
- #1808 and #1854 merge after this pull request, by the description's shared-folder order. #1854's AlgebraicTopology head still states the theorem (line 647), and its ClassifyingSpaces README line 226 cites it as "Stage 8 item 8b". Both follow this repair when they rebase.

## Previous findings

- R01 — not repaired: this head's `AlgebraicTopology/Suggested.lean:693` still states `exists_mapOfEq_eq_of_isAspherical_cwComplex`. This README's lines 83–86 still claim 1B.9 and lines 1193–1196 still say 8.8b consumes Layer 1, while main's AlgebraicTopology line 139 says nothing of this roadmap is consumed. Carried as R01.

## Verified sound

**Gate and build.**
- The worker's gate at 35d5208 passes every check, including `build=0`.
- My own run, `gate … ClassifyingSpaces --base origin/main`, prints `0` for every content counter, including `set_option`, `sorry-data`, `statement-hygiene`, `readme-ids-missing`, `depcheck`, `stray-files` and `source-material`.
  - Its one failing counter is `outside-folder=26`: two files in each of the 13 sibling folders this pull request declares.
  - `git diff --stat origin/main...HEAD`, with those folders and this one excluded, is empty (exit 0).
- The dependency check (`gate --depcheck … --movable --content … --pr 1807`) prints `depcheck: 236 roadmaps, 2135 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` exits 0 in 6 s. Its only warnings are four `declaration uses 'sorry'`, at lines 84, 102, 123 and 138.
- In a scratch file, `#check @` of all four headlines prints types identical to `signatures.md`:
  - `exists_continuousMap_mapOfEq_eq_of_isAspherical`: `T2Space X`, `CWComplex univ`, `PathConnectedSpace X`, `IsAspherical Y y`, `X : Type u_1`, `Y : Type u_2`;
  - `exists_homotopyEquiv_of_isAspherical`: both `T2Space`, both `CWComplex univ`, both `IsAspherical`, independent universes;
  - the two twisted comparisons: `CommRing k`, `T2Space X`, `CWComplex univ`, `PathConnectedSpace X`, `IsAspherical X x`, `Ψ : π₁ ≃* G`.
  No binder was lost, and the generality equals the README's.
- `Suggested.lean` and the pins are unchanged, so these earlier results still stand:
  - r57's one-tactic padding probe (all four headlines resist one tactic);
  - r57's headline list (four statable headlines, all four stated).

**Library declarations opened at the pinned Tau Ceti (2fd255d, the same pin on main and here): 9.**
- `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59`: `IsAspherical X x := PathConnectedSpace X ∧ ∀ n, Subsingleton (π_ (n + 2) X x)`.
- `TauCeti/AlgebraicTopology/ClassifyingSpace/Uniqueness.lean`:
  - line 73, `IsAspherical.exists_homotopyEquiv`: `X Y : Type u`, `[CWType X] [CWType Y]`, conclusion `∃ e γ` with `γ : Path (e x) y`;
  - line 94, `IsEilenbergMacLaneSpaceOne.nonempty_homotopyEquiv`;
  - line 109, `IsAspherical.exists_homotopyEquiv_classifyingSpace`.

  All three citations at README lines 144–145 and 401–405 resolve. Headline 2 is not one of them, because it asks for `F x = y` and allows independent universes (table below).
- `TauCeti/AlgebraicTopology/EilenbergMacLane/Homotopic.lean`:
  - line 191, `homotopicRel_singleton_of_mapOfEq_eq`, which needs a 0-skeleton equal to `{x₀}`;
  - line 220, its `_of_cwComplex` form.
- `TauCeti/AlgebraicTopology/ClassifyingSpace/Cellular.lean`:
  - line 174, `exists_mapOfEq_cellularClassifyingSpace`, whose source is the cellular model only;
  - line 242, `homotopicRel_of_mapOfEq_eq_cellularClassifyingSpace`.

  As `Suggested.lean` lines 78–83 say, the pin has 1B.9 only for these special sources.
- `TauCeti/AlgebraicTopology/EilenbergMacLane/WeakHomotopyEquivalence.lean:49`: `isWeakHomotopyEquivalence_iff`.

**Cross-roadmap citations resolved: 9.**
- `citations.md` lists nothing unresolved.
- "Stage 8, items 8.8a and 8.8b" (lines 77, 1191) resolves in two places:
  - on main, at §8.8 (line 3682), through main's numbering map at line 884: "Stage 8 items 1–16 are §§8.1–8.16, with 8.8a/8.8b … as subdivisions";
  - at this head, at lines 2810–2861.
  What 8.8b consumes is R01.
- CharacteristicClasses' mentions of this roadmap (lines 58, 184, 543, 1079) are unchanged since 3f935aa.
- FreeGroupsAndLimitGroups lines 40, 2413 and 2554 cite "Stage 2 item 7". The *Stage and item numbers* list maps it at line 126.

**Overlaps.**
- #1808, #1854 and #1187 change this folder. The description fixes the order "this pull request → #1808 → #1854 → #1187 (pin bump)".
- No id this README cites is dropped by an open pull request, and none is defined only by an open revision.
- Remark on untouched text, no change requested: FreeGroupsAndLimitGroups line 29 (main and #1187) cites the heading anchor `#stage-2-the-cellular-model`. The numbering list maps the stage at line 126, but the overlap tool still lists the anchor.

**Ownership against open pull requests.**
- `roadmaps grep` over main and the 438 open heads, by object:
  - the 1B.9 conclusion: hits as listed under R01;
  - `IsAspherical.exists_homotopyEquiv`: only pinned-name citations, plus #850's citation of the pinned `…_classifyingSpace`;
  - `twistedHomology|twistedCohomology` in Lean files: only #1227's `twistedHomologyMap` invariance and #2036's stabilisation theorems, which are different statements.
- No other roadmap states the twisted comparisons (headlines 3–4) or the pointed uniqueness (headline 2).

**Sources (seeded sample).** No sampled target changed. I re-read the locators anyway:
- **1.1–1.3** (README lines 613, 733, 825) cite Hatcher, Proposition 1B.9 and Theorem 1B.8, p. 90. The page starts at `hatcher-at` line 3884 (running head "90"); Theorem 1B.8 is at lines 3897–3898 and Proposition 1B.9 at lines 3905–3907. The hypotheses are a connected CW `X` and a `K(G, 1)` target, and the README explains why its asphericity hypothesis is enough (line 615).
- **2.1** (line 893) cites Section 2.2, p. 148: `hatcher-at` line 6441 (running head 148) and line 6471 ("Homology of Groups").
- **2.1–2.3** (lines 895, 1002, 1061) cite Section 3.H, p. 328: `hatcher-at` line 14320 (running head 328), with "Local Coefficients via Modules" at line 14326. They also cite Example 3H.1, p. 329: lines 14372–14376.
- **Segal 1968, §3** (README line 91): `segal-1968` lines 95–126 compare the nerve model with Milnor's join.
- The README flags no locator as unverified.

**Adversarial table.** No statement changed. Rows marked (r57), (r58) or (r59) are carried from those reports. Rows marked (r60) were computed for this head.

| Statement | Instance | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Headline 2 vs pinned `IsAspherical.exists_homotopyEquiv` (r60) | `X = Y = S¹`, `x = 1`, `y = −1`, `φ` = base-point change along the upper half-circle | pin: `e = id`, `γ` = upper half path, conclusion holds; headline: `F x = y` needs `F 1 = −1`, so `id` fails, `F z = −z` works | headline strictly stronger; not a pin restatement | none |
| Headline 2, universes (r60) | `X : Type 0`, `Y : Type 1` | pin needs `X Y : Type u` (`Uniqueness.lean:73`); headline elaborates with `u_1`, `u_2` | not covered by the pin | none |
| Headline 1 vs AlgebraicTopology (r60, re-read) | `#1807` grep `HomotopicRel f g {x}` | `AlgebraicTopology/Suggested.lean:701` and `ClassifyingSpaces/Suggested.lean:92`; main: 0 hits | duplicate in this pull request | R01 |
| Consumer bullet vs main 8.8b (r60) | README 1191–1196 vs main AT 139, 3707, 4691 | here: inputs 1.1–1.3, models `classifyingSpace G`, `cellularClassifyingSpace R`; main: "nothing of it is consumed", `classifyingSpace π` only | contradiction | R01 |
| Headline 1 (r59) | `X = Y = S¹`, `x = y = 1`, `φ = ×2` | `f(z) = z²`, `f 1 = 1`, `mapOfEq f` sends `1 ↦ 2`; `[S¹, S¹]_* = ℤ`, so a degree-2 `g` is `≃ f rel {1}` | holds | none |
| Headline 1, non-vertex base point (r59) | `X = [0, 1]` with 0-cells `{0, 1}`, `x = 1/2` | `π₁ = 1`, `f = const y`; `H(s, t) = g((1 − s)t + s/2)` has `H(s, 1/2) = y` | holds | none |
| Headline 1, target control (r57) | `X = Y = S²` | `id` and `const` both trivial on `π₁`; degrees `1` vs `0` | asphericity needed | none |
| Headline 2 (r59) | `X = Y = pt` | `π₁ = 1`, `e = id`, `F = id`, `F x = y` | holds | none |
| Headline 2, CW control (r57) | point vs Warsaw circle | both have `π_n = 0`; not homotopy equivalent | CW hypotheses needed | none |
| Headline 3 (r59) | `G = ℤ`, `X = S¹`, `k = ℤ`, trivial `A` | `H_n(ℤ; ℤ) = ℤ, ℤ, 0`; `H_n(S¹; ℤ) = ℤ, ℤ, 0` for `n = 0, 1, 2` | holds | none |
| Headline 3, twisted (r59) | `G = ℤ`, `X = S¹`, `k = ℤ`, `t ↦ −1` | `H₀ = ℤ/(−1 − 1) = ℤ/2`, `H₁ = ker(−2) = 0` on both sides | holds | none |
| Headline 4 (r59) | `G = ℤ`, `X = S¹`, `A = ℤ₋`, `N = ℤ` | `Hom(ℤ₋, ℤ) = ℤ₋`; `H⁰ = ker(−2) = 0`, `H¹ = coker(−2) = ℤ/2` on both sides | holds | none |
| Headlines 3/4, zero ring (r57) | `k = 0` | `0 = 0` | holds | none |
| Headlines 3 and 4, `A = k[G]` (r57) | Shapiro | `k, 0` on both sides | hold | none |
| 2.3 / headline 3 asphericity control (r57) | `S² ∨ S¹`, `k = ℤ` | `H₂ = ℤ` vs `H₂(ℤ, ℤ) = 0` | asphericity needed | none |
| Contract, Hurewicz composite (r58) | `S¹`, counterclockwise `γ`, `z` over `pathChain ℤ γ` | both sides the generator `1` of `H₁(S¹; ℤ)` | holds | none |
| Contract, degenerate loop (r58) | `γ = refl x` | `[refl] = 0`; the constant 1-simplex is a boundary, `homologyπ z = 0` | holds | none |
| Contract, "any `1`-cycle" (r58) | `z, z'` over the same chain | `iCycles` injective, `z = z'` | holds | none |
| 2.1 degree-one bullet (r58) | `G = ℤ/3`, `Ψγ = t` | `[t²] = −[t] = 2`; FirstHomology `1` | holds; sign detected | none |
| Conventions, `Φ = m⁻¹` (r57) | `S₃`, `s = (1 2)`, `t = (2 3)` | `m(ℓ_sℓ_t) = ts`; `Φ` gives `st`; `ts ≠ st` | holds | none |
| Conventions, deck action sign (r57) | `ℤ`, `⟨t | ⟩` | `Φ = −1`; `∂` of the lifted cell is `(t⁻¹ − 1)·base` | holds | none |
| 1.1 NDR data (r57) | `{0} ∪ {1/m}`; `S¹`, `x = −1`; `B(F₂)`, `λ = a` | retraction fails at `(1, 0)`; trace `1 → −i → −1`; `b ↦ aba⁻¹ ≠ b` | hold | none |
| 1.3 / headline 2 (r57) | `S¹`, `e = −id` | degree `−1 = e` | holds | none |
| 2.1 `ℤ/m` and torus (r57) | `ℤ –0→ ℤ –m→ ℤ –0→ ℤ`; `r = 2` | `H₂ = 0`, `H₁ = ℤ/m`; ranks `2`, `1` | hold | none |
| 2.2 circle and Bockstein (r57) | value `1` on the counterclockwise loop; `ℤ/2 → ℤ/4 → ℤ/2` | `1 ↦ −1` (Hurewicz `1 ↦ 1`); over `𝔽₂` both `1 ↦ 1`; `δ` an isomorphism | hold | none |
| 2.3 twisted circle (r57) | `ℤ`, unit `u` | fibre gives `u`; `H₀ = k/(u − 1)` | holds | none |

## Not verifiable

- `brown-cohomology`, Chapter III §1 (2.1–2.3): uncertified, and no legal text is held. The Hatcher locators at the same claims were verified.
- `schwamberger-vogt-2009`, §2 (1.3, the Warsaw circle): uncertified. The fact used was checked by reasoning, and the pinned `Uniqueness.lean` docstring cites the same source for it.
- `milnor-1956`, §3: uncertified, and cited only for the pinned model. `segal-1968` line 116 attributes the join to its reference [8], which line 313 lists as *Construction of universal bundles, I* (pp. 272–284). The README, the manifest and the pin cite *II* (pp. 430–436). I could not open either paper legally to settle which part contains the join, so no source issue is recorded.

## Source issues

- none
