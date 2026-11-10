# Review of ClassifyingSpaces (pull request #1807 at 3f935aa)

**Verdict:** needs changes

This is an incremental re-review. The previous review (r58) read 78fe8c3.

What changed since then:
- This folder has changed by 0 lines.
- `git diff --stat 78fe8c3 HEAD -- TauCetiRoadmap/ClassifyingSpaces TauCetiRoadmap/AlgebraicTopology lake-manifest.json lean-toolchain` is empty.
- The seven commits since 78fe8c3 touch only BordismFormalGroups, CharacteristicClasses, GeneralizedCohomology, LocalPurity, PadicFunctionalAnalysis, RigidAnalyticGeometry and TopologicalKTheory. None of their added or removed lines mentions this roadmap: `git diff 78fe8c3 HEAD | grep -i classifying` is empty.

r58 had one finding, R01. It is not repaired, because the AlgebraicTopology folder that has to change is untouched. It is carried below under its old number, with every witness re-read at this head. No repair report marks it as not actionable.

## R01 (P2) — Hatcher 1B.9 still has two owners in this pull request, and the nerve-model comparison has none (carried from r58 R01)

**Location.**
- `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 83–88: "The classification of pointed maps from a connected pointed CW complex into a `K(π, 1)` … is owned here, not in the algebraic-topology roadmap. This roadmap consumes nothing from the algebraic-topology roadmap".
- The *Downstream consumers* bullet, lines 1191–1196: "Its inputs from this roadmap are Layer 1".

**Claim.** This README makes three claims:
- AlgebraicTopology Stage 8.8b owns the normalised nerve-model comparison;
- that comparison consumes Layer 1 here;
- this roadmap owns Proposition 1B.9.

**Witness.** In this same head the AlgebraicTopology side says the opposite:
- `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:693` still states `exists_mapOfEq_eq_of_isAspherical_cwComplex`. It matches headline 1 here (line 84) binder for binder.
- Its README, lines 94–107, says ClassifyingSpaces "consumes that classification … and owns no second proof of it".
- Its table row at line 3314 lists the inputs of 8.8b as "8.8a bar model, 4, 8.5".

The consequences:
- one theorem is stated twice in one pull request;
- each README hands the normalised comparison to the other, so neither owns it;
- this README's consumer bullet is false.

**Repair.** This follows the direction that main's AlgebraicTopology README already has. Its lines 98–100 say: "Stage8.8b owns only its normalized comparison with those ClassifyingSpaces models".
1. Delete `exists_mapOfEq_eq_of_isAspherical_cwComplex` from `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` (lines 685–702, the Stage 8.8b section comment and the theorem).
2. In `TauCetiRoadmap/AlgebraicTopology/README.md`:
   - rewrite lines 94–107 and the 8.8b item (from line 2826) so that 8.8b consumes ClassifyingSpaces Layer 1, items 1.1–1.3, gets `[X, Bπ]_* ≃ Hom(π₁X, π)` as items 1.1–1.2 with the bar model as the aspherical target, and owns the normalised comparison of the bar model with the pinned models;
   - replace the backticked name at line 556 (`mapsToGroupClassifyingSpaceEquiv` … "`exists_mapOfEq_eq_of_isAspherical_cwComplex` applied to the bar model"), and the one at line 2833, by a citation of ClassifyingSpaces item 1.1–1.2. Otherwise the gate's own-name check would flag them once the declaration is gone.
3. Add "ClassifyingSpaces Layer 1 items 1.1–1.3" to the inputs of the 8.8b row at line 3314.
4. Leave this folder as it is.

Tested on the instance that refuted the original:
- after these edits, `roadmaps grep --fixed 'HomotopicRel f g {x}'` over this pull request finds one `IsAspherical`-target theorem, `exists_continuousMap_mapOfEq_eq_of_isAspherical`;
- the only edge between the two roadmaps is AlgebraicTopology consuming this one, the direction main has;
- the dependency check stays clean, because this README cites nothing of AlgebraicTopology as a supplier.

Two other heads bear on this:
- #1854's head still states the theorem (`AlgebraicTopology/Suggested.lean:639`) and cites "Stage 8 item 8b" from `ClassifyingSpaces/README.md:226`. It follows whichever owner this pull request settles on when it rebases, after #1808 per the description's shared-folder order.
- #1652's AlgebraicTopology head, which merges before this pull request, does not state the theorem. The repair does not conflict with it.

## Previous findings

- R01 — not repaired: `AlgebraicTopology/Suggested.lean:693` still states `exists_mapOfEq_eq_of_isAspherical_cwComplex`, and that folder's README lines 94–107 still say ClassifyingSpaces "consumes that classification". This README lines 83–88 claim 1B.9 here. Carried as R01.

## Verified sound

**Gate and build.**
- The worker's gate at 3f935aa passes every check, including `build=0`.
- My own gate run (`gate … ClassifyingSpaces --base origin/main`) prints every content counter as `0`:
  - `set_option`, `sorry-data`, `statement-hygiene`, `readme-ids-missing`, `depcheck`, `stray-files`, `source-material` and the rest.
  - Its only failing counter is `outside-folder=26`. Every listed file is in one of the 13 sibling folders this pull request declares.
  - `git diff --stat origin/main...HEAD` with those folders and this one excluded is empty (exit 0, no output).
- The dependency check (`gate --depcheck … --movable --pr 1807`) prints `depcheck: 229 roadmaps, 2125 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` exits 0 with exactly four warnings, `declaration uses 'sorry'` at lines 84, 102, 123 and 138.
- In a scratch copy, `#check @` of all four headlines prints types identical to `signatures.md`:
  - `exists_continuousMap_mapOfEq_eq_of_isAspherical`: `T2Space X`, `CWComplex univ`, `PathConnectedSpace X`, `IsAspherical Y y`;
  - `exists_homotopyEquiv_of_isAspherical`: both `T2Space`, both `CWComplex univ`, both `IsAspherical`;
  - the two twisted comparisons: `CommRing k`, `T2Space X`, `CWComplex univ`, `PathConnectedSpace X`, `IsAspherical X x`, `Ψ : π₁ ≃* G`.
  No binder was lost, and the generality equals the README's.
- `Suggested.lean` is unchanged, so r57's one-tactic padding probe (all four fail) and headline list (four statable headlines, all stated) still stand.

**Library declarations opened at the pin.**
- `TauCeti/AlgebraicTopology/EilenbergMacLane/Basic.lean:59`: `IsAspherical X x := PathConnectedSpace X ∧ ∀ n, Subsingleton (π_ (n + 2) X x)`. Path connectedness is part of it, so headlines 2–4 need no separate `PathConnectedSpace` for the aspherical spaces. Headlines 3–4 carry it redundantly, which is harmless.

**Cross-roadmap citations.**
- `citations.md` lists nothing unresolved.
- "Stage 8, items 8.8a and 8.8b" resolves in this pull request's AlgebraicTopology README (lines 2810–2861, table line 3314) and on main (lines 93–101). The contradiction between them is R01.
- The sibling folders changed since 78fe8c3 introduce no citation of this roadmap. CharacteristicClasses' existing mentions (lines 58, 184, 543, 1079) are untouched.

**Overlaps.**
- #1808, #1854 and #1187 change this folder. The description fixes the order "this pull request → #1808 → #1854 → #1187 (pin bump)".
- No id this README cites is dropped by an open pull request, and none is defined only by an open revision.
- Remark on untouched text, no change requested: FreeGroupsAndLimitGroups (main line 29) cites the anchor `#stage-2-the-cellular-model`. The *Stage and item numbers* list maps it, but the overlap tool still lists it.

**Sources (seeded sample).** No sampled target changed. I spot-checked the locators again:
- 1.1, 1.2 and 1.3 cite Hatcher, Proposition 1B.9 and Theorem 1B.8, p. 90. They are at `hatcher-at` line 3884 (running head "90"), Theorem 1B.8 at lines 3897–3898 and Proposition 1B.9 at lines 3905–3907. Hatcher's `K(G, 1)` has a contractible universal cover. The README says so at 1.1 and justifies using only `π_{n−1}(Y) = 0`.
- 2.1 cites Section 2.2, p. 148: `hatcher-at` line 6441 (running head 148) and line 6471 ("Homology of Groups").
- 2.1–2.3 cite Example 3H.1, p. 329: `hatcher-at` lines 14372–14376 (running head 329), the trivial-module reduction.
- The README flags no locator as unverified.

**Adversarial table.** Rows marked (r58) or (r57) are carried from those reports, for statements this diff leaves untouched; no statement changed. Rows marked (r59) were recomputed for this head on the headlines.

| Statement | Instance | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Headline 1 (r59) | `X = Y = S¹`, `x = y = 1`, `φ = ×2` | `f(z) = z²`, `f 1 = 1`, `mapOfEq f` sends generator `1 ↦ 2`; `[S¹, S¹]_* = π₁(S¹) = ℤ`, so `g` of degree `2` gives `f ≃ g rel {1}` | holds | none |
| Headline 1, non-vertex base point (r59) | `X = [0, 1]` with 0-cells `{0, 1}`, `x = 1/2` | `π₁ = 1`, `f = const y`; `H(s, t) = g((1 − s)t + s/2)` has `H(s, 1/2) = y` | holds | none |
| Headline 1, target control (r57) | `X = Y = S²` | `id` and `const` both trivial on `π₁`; degrees `1` vs `0` | asphericity needed | none |
| Headline 1 vs AlgebraicTopology (r58, re-read) | `AlgebraicTopology/Suggested.lean:693` vs line 84 | identical binders and conclusion | duplicate | R01 |
| Headline 2 (r59) | `X = Y = pt` | `π₁ = 1`, `e = id`, `F = id`, `F x = y` | holds | none |
| Headline 2, CW control (r57) | point vs Warsaw circle | both have `π_n = 0`; not homotopy equivalent | CW hypotheses needed | none |
| Headline 3 (r59) | `G = ℤ`, `X = S¹`, `k = ℤ`, trivial `A` | `H_n(ℤ; ℤ) = ℤ, ℤ, 0`; `H_n(S¹; ℤ) = ℤ, ℤ, 0` for `n = 0, 1, 2` | holds | none |
| Headline 3, twisted (r59) | `G = ℤ`, `X = S¹`, `k = ℤ`, `t ↦ −1` | `H₀ = ℤ/(−1 − 1) = ℤ/2`, `H₁ = ker(−2) = 0` on both sides | holds | none |
| Headline 4 (r59) | `G = ℤ`, `X = S¹`, `A = ℤ₋`, `N = ℤ` | `Hom(ℤ₋, ℤ) = ℤ₋`; `H⁰ = ker(−2) = 0`, `H¹ = coker(−2) = ℤ/2` on both sides | holds | none |
| Headlines 3/4, zero ring (r57) | `k = 0` | `0 = 0` | holds | none |
| Headlines 3 and 4, `A = k[G]` (r57) | Shapiro | `k, 0` on both sides | hold | none |
| 2.3 / headline 3 asphericity control (r57) | `S² ∨ S¹`, `k = ℤ` | `H₂ = ℤ` vs `H₂(ℤ, ℤ) = 0` | asphericity needed | none |
| Contract, Hurewicz composite (r58) | `S¹`, counterclockwise `γ`, `z` over `pathChain ℤ γ` | both sides are the generator `1` of `H₁(S¹; ℤ)`; the Lean `rw` closes | holds | none |
| Contract, degenerate loop (r58) | `γ = refl x` | `[refl] = 0`; the constant 1-simplex is a boundary, so `homologyπ z = 0` | holds | none |
| Contract, "any `1`-cycle" (r58) | `z, z'` over the same chain | `iCycles` is injective, so `z = z'` | holds | none |
| 2.1 degree-one bullet (r58) | `G = ℤ/3`, `Ψγ = t` | `[t²] = −[t] = 2`; FirstHomology `1` | holds; sign detected | none |
| Conventions, `Φ = m⁻¹` (r57) | `S₃`, `s = (1 2)`, `t = (2 3)` | `m(ℓ_sℓ_t) = ts`; `Φ` gives `st`; `ts ≠ st` | holds | none |
| Conventions, deck action sign (r57) | `ℤ`, `⟨t | ⟩` | `Φ = −1`; `∂` of the lifted cell is `(t⁻¹ − 1)·base` | holds | none |
| 1.1 NDR data (r57) | `{0} ∪ {1/m}`; `S¹`, `x = −1`; `B(F₂)`, `λ = a` | retraction fails at `(1, 0)`; trace `1 → −i → −1`; `b ↦ aba⁻¹ ≠ b` | hold | none |
| 1.3 / headline 2 (r57) | `S¹`, `e = −id` | degree `−1 = e` | holds | none |
| 2.1 `ℤ/m` and torus (r57) | `ℤ –0→ ℤ –m→ ℤ –0→ ℤ`; `r = 2` | `H₂ = 0`, `H₁ = ℤ/m`; ranks `2`, `1` | hold | none |
| 2.2 circle and Bockstein (r57) | value `1` on the counterclockwise loop; `ℤ/2 → ℤ/4 → ℤ/2` | `1 ↦ −1` (Hurewicz `1 ↦ 1`); over `𝔽₂` both `1 ↦ 1`; `δ` an isomorphism | hold | none |
| 2.3 twisted circle (r57) | `ℤ`, unit `u` | fibre gives `u`; `H₀ = k/(u − 1)` | holds | none |

**Ownership against open pull requests.** This was checked in r57–r58 against the open heads, using `roadmaps grep` for the objects:
- 1B.9 by its conclusion `HomotopicRel f g {x}` with an `IsAspherical` target;
- the nerve model;
- the twisted comparisons.

Since then, only #1854 (unchanged witness, see R01) and #1652 (no duplicate) bear on these objects. This diff adds or moves no object.

## Not verifiable

- `brown-cohomology`, Chapter III §1 (2.1–2.3): uncertified, and no legal text is held. The Hatcher locators at the same claims were verified.
- `schwamberger-vogt-2009`, §2 (1.3, the Warsaw circle): uncertified. The fact used was checked by reasoning.
- `milnor-1956`, §3: uncertified. It is cited only for the pinned model.

## Source issues

- none
