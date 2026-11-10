# Review of ClassifyingSpaces (pull request #1807 at 54ff3d8)

**Verdict:** needs changes

This is an incremental re-review. The previous review read 7871afe. Since then the folder has changed by 129 lines in one commit, "ClassifyingSpaces: review repairs":
- `README.md`: +101/−23;
- `Suggested.lean`: +4/−1, in the headline-3 docstring only.

The pins and the files outside the declared folders are unchanged. `git diff --stat 7871afe HEAD -- TauCetiRoadmap/AlgebraicTopology` is empty.

Status of the previous findings:
- R01 (the degree-one sign) is repaired, and its new route checks out at the pins.
- R03 is repaired.
- R02 is not repaired, because the AlgebraicTopology side was not touched. It is carried below as R01.

The repair adds one new P3, R02 below.

## R01 (P2) — Hatcher 1B.9 still has two owners in this pull request, and the nerve-model comparison has none (was R02)

**Location.**
- `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 75–92: "The nerve model … and its comparison with the two pinned models normalised to the identity on `G`, belong to the algebraic-topology roadmap, Stage 8, items 8.8a and 8.8b … is owned here, not in the algebraic-topology roadmap."
- The *Downstream consumers* bullet, lines 1184–1194.

**Claim.** This README makes three claims:
- AlgebraicTopology 8.8b owns the normalised nerve-model comparison;
- that comparison consumes Layer 1 here;
- this roadmap owns Proposition 1B.9 and consumes nothing from AlgebraicTopology.

**Witness.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:693` still states `exists_mapOfEq_eq_of_isAspherical_cwComplex`. It matches this file's line 84 binder for binder. Its README says the opposite of this one:
- lines 94–107: "ClassifyingSpaces consumes that classification … owns no second proof", and ClassifyingSpaces owns "the identity-on-π₁ normalized comparison";
- the 8.8b row of its table (line 3314) has inputs "8.8a bar model, 4, 8.5".

The consequences at this head:
- the same theorem is stated twice in one pull request;
- each README hands the normalised comparison to the other, so neither owns it;
- this README's consumer bullet ("Its inputs from this roadmap are Layer 1") is false at this head.

The repair commit changed only the numbering here, to "items 8.8a and 8.8b". That is step 3 of the earlier repair. Steps 1–2, which are in the AlgebraicTopology folder, were not made.

**Repair.** Make both folders of this pull request say the same thing. The direction this README already takes is the one that main's AlgebraicTopology README takes (lines 93–100: "Stage8.8b owns only its normalized comparison with those ClassifyingSpaces models"). It is also the one the stacked #1808 takes: its AlgebraicTopology `Suggested.lean` has no `exists_mapOfEq_eq_of_isAspherical_cwComplex`.
1. Delete `exists_mapOfEq_eq_of_isAspherical_cwComplex` from `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` (lines 685–702).
2. In `TauCetiRoadmap/AlgebraicTopology/README.md`, rewrite lines 94–107 and 2825–2861 so that:
   - 8.8b consumes ClassifyingSpaces Layer 1, items 1.1–1.3, and gets `[X, Bπ]_* ≃ Hom(π₁X, π)` as items 1.1–1.2 with the bar model as target;
   - 8.8b owns the normalised comparison of the bar model with the pinned models.
3. Add "ClassifyingSpaces Layer 1 items 1.1–1.3" to the inputs of its table row at line 3314.
4. Change nothing here.

Tested after the repair:
- the pull request has one `IsAspherical`-target theorem concluding `HomotopicRel f g {x}`;
- the only edge between the two roadmaps is AlgebraicTopology consuming this roadmap, the direction main already has;
- the dependency check still finds no cycle, since this README cites nothing of AlgebraicTopology as a supplier.

#1854's head of this README makes the opposite choice ("Stage 3 item 11 | Hatcher, Proposition 1B.9 | the algebraic-topology roadmap, Stage 8 item 8b"). It must follow whichever owner this pull request settles on when it rebases, which per the description is after #1808.

## R02 (P3) — A Hurewicz lemma is cited for a fact it states only through a second identification

**Location.** README lines 510–512: "`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv_ofMul_of_mk` (the Hurewicz class of a loop is the class of its chain)". Also:
- the 2.1 bullet, lines 915–916: "sends the class of `γ` to the class of its chain (`…_ofMul_of_mk`)";
- 2.1's *Needs*, lines 956–957.

**Claim.** The cited lemma gives the degree-one route its first step: the Hurewicz image of `γ` is the homology class, in `((singularChains ℤ).obj X).homology 1`, of the chain of `γ`.

**Witness.** At the pin (`TauCeti/AlgebraicTopology/Homotopy/Hurewicz/One/Basic.lean:715`) the lemma's right-hand side is `H₁AddEquivHomology X (loopClass γ)`. That is a class in Tau Ceti's auxiliary `H₁ X` (line 240), transported by an equivalence. The step "this is the class of a cycle over `pathChain ℤ γ`" is a separate lemma, `TauCeti.HurewiczOne.H₁AddEquivHomology_loopClass` (line 693).

**Repair.** In all three places, cite `TauCeti.HurewiczOne.H₁AddEquivHomology_loopClass` next to `…_ofMul_of_mk`. For example, at lines 510–512: "`TauCeti.HurewiczOne.hurewiczHomologyAddEquiv_ofMul_of_mk` and `TauCeti.HurewiczOne.H₁AddEquivHomology_loopClass` (together: the Hurewicz class of a loop is the homology class of a cycle whose chain is the chain of the loop)".

Tested: `#check @TauCeti.HurewiczOne.H₁AddEquivHomology_loopClass` elaborates at the pin. Its type ends `H₁AddEquivHomology X (loopClass γ) = homologyπ z` for `z` with `iCycles z = pathChain ℤ γ`. Composing it with `_ofMul_of_mk` gives the claimed fact.

## Previous findings

- R01 — repaired: lines 912–940 now send the chain of `γ` to the `1`-cycle `(Ψ γ)⁻¹`, minus the class of `Ψ γ`, and call the pinned comparison the negative of `…FirstHomologyAddEquivGroupHomology`; circle Checks give `−1` (2.1) and `1 ↦ −1` (2.2).
- R02 — not repaired: README lines 75–86 still assign the normalised nerve comparison to AlgebraicTopology 8.8a/8.8b and 1B.9 here; `AlgebraicTopology/Suggested.lean:693` still states `exists_mapOfEq_eq_of_isAspherical_cwComplex`. Carried as R01.
- R03 — repaired: `fundamentalGroupMulEquivOfPath` is under *From Mathlib* with its file; `Rep.trivial`/`Rep.ihom` are placed in `Rep/Basic.lean`; both negative controls now say `k = ℤ` and note the zero ring.

## Verified sound

**Gate and build.**
- The worker's gate at 54ff3d8 passes every check.
- My own run of the gate prints every content counter as `0`. Its only failing counter is `outside-folder=26`, and all 26 files are in the 13 sibling folders this pull request declares (filtering them leaves nothing). `git diff --stat origin/main...HEAD` with those folders excluded is empty.
- The dependency check prints `depcheck: 234 roadmaps, 2262 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` exits 0 with exactly four warnings, `declaration uses 'sorry'` at lines 84, 102, 123 and 138.
- One scratch file of `#check @` lines (importing Mathlib, nine Tau Ceti modules and the built `Suggested`) prints the four headline types identical to `signatures.md`. No binder was lost, and the generality matches the README. The four statements are unchanged since 7871afe, so the earlier one-tactic padding probe (all four fail) stands.

**The R01 repair, re-derived at the pins.**
- `classifyingSpaceSingularHomologyIsoGroupHomology` is `IsQuotientCoveringMap.singularHomologyIsoGroupHomology` for the orbit map (`ClassifyingSpace/Homology.lean:69`).
- That comparison is the homology of `(singularChainsRepCoinvariantsTensorIso).symm`, followed by `(groupHomologyIso _ n (singularChainsResolution …)).symm` (`Singular/ModuleChains/GroupHomology.lean:242–249`).
- `…_hom_f_coinvariantsTensorMk` (line 228) sends `⟦a ⊗ c⟧ ↦ a • p_* c`, with no inversion.
- `groupHomologyIso` is `groupHomologyIsoTor ≪≫ torIso` (Mathlib `GroupHomology/Basic.lean:254`). `inhomogeneousChainsIso` has components `(coinvariantsTensorFreeLEquiv …).symm` (line 181).
- `coinvariantsTensorFreeLEquiv` sends `⟦a ⊗ single x (single g r)⟧ ↦ single x (r • ρ(g⁻¹) a)` (`Coinvariants.lean:469, 500`). That is the README's new convention sentence.
- From `d_single` with `n = 0` (`Homological/Resolution.lean:348`), the bar differential is `d[g] = g·[] − []`.
- `d₂₁_single` (`GroupHomology/LowDegree.lean:148`) gives `[h'] − [hh'] + [h]` with trivial coefficients.
- `…_apply_eq_iff` (`ClassifyingSpace/EilenbergMacLane.lean:77`) puts the end of the lift at `(0, g⁻¹)`, and `smul_universalGSpaceBasepoint` identifies that point with `g⁻¹ • e₀`.
- `singularChains_d_pathChain` and `singularChains_map_f_pathChain` (`Singular/ModuleChains/Basic.lean:223, 233`) say what the route uses.
- The cohomology comparison pulls cochains back as `f ∘ p_*` (`Cohomology/GroupCohomology.lean:191, 248`). So the 2.2 sign follows by evaluation, with no inversion.
- No pinned lemma relates the two `H₁` isomorphisms: grep over `ClassifyingSpace/` finds none.

**Names.** The scratch file's 27 library `#check @` lines include every name the diff adds or moves, and all of them elaborate at the pins. Among them:
- `groupHomologyIso`, `groupHomology.H1AddEquivOfIsTrivial`, `Rep.barComplex`, `Rep.coinvariantsTensorFreeLEquiv`, `FundamentalGroup.fundamentalGroupMulEquivOfPath` (Mathlib `FundamentalGroupoid/FundamentalGroup.lean:48`);
- `TauCeti.instDeltaGeneratedSpaceOfCWComplexUniv` (`Topology/CWComplex/Classical/DeltaGenerated.lean:66`);
- the Hurewicz and FirstHomology lemmas (`Hurewicz/One/Basic.lean:705, 715`, `FirstHomology.lean:167, 189`);
- `TauCeti.universalGSpaceBasepoint` (`CountableJoin.lean:46`).

Every file attribution in the changed contract bullets is correct, apart from R02.

**Cross-roadmap citations.**
- "Stage 8, items 8.8a and 8.8b" resolves in this pull request's AlgebraicTopology README (lines 2810–2861, table lines 3313–3314) and on main (lines 98–99, 1831–1833). The contradiction between them is R01.
- `citations.md` lists nothing unresolved.

**Overlaps.**
- #1808, #1854 and #1187 change this folder. The description's shared-folder order is "this pull request → #1808 → #1854 → #1187".
- No id this README cites is dropped by an open pull request, and none is defined only by an open revision.
- The anchor `#stage-2-the-cellular-model` (cited by FreeGroupsAndLimitGroups on main, line 29, as "Stage 2 item 7") is in untouched text. It is mapped by the *Stage and item numbers* list (item 7 → `TauCeti.PresentationComplex R`), as the previous review found.
- Remark, no change requested: the overlap tool still lists the anchor, so a table naming the former heading would let the tool read the mapping.

**Sources (seeded sample).**
- 1.1–1.3 are untouched; the previous review's verification is carried (`hatcher-at` lines 3905–3949, 818–819, 22629–22630, 15549–15550, 3897–3911).
- 2.1–2.3 changed, so their Hatcher locators were re-read:
  - §2.2 "Homology of Groups", p. 148, is `hatcher-at` lines 6471–6479 (PDF page 157);
  - §3.H, p. 328, lines 14326–14370, has chains `Cₙ(X̃) ⊗_π M` and cochains `Hom_{ℤ[π]}(Cₙ(X̃), M)`, for a path-connected `X` with a universal cover;
  - Example 3H.1, p. 329, lines 14373–14383, gives the trivial-module reduction for both.
  All are correct as restated. The README flags no locator as unverified.

**Adversarial table.** Rows marked (r55) are carried from the previous report, for statements this diff leaves untouched. The other rows were computed for this head.

| Statement | Instance | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions, `Φ = m⁻¹` (r55) | `S₃`, `s = (1 2)`, `t = (2 3)` | `m(ℓ_sℓ_t) = ts`; `Φ`: `(ts)⁻¹ = st = Φ(ℓ_s)Φ(ℓ_t)`; `m`: `ts ≠ st` | holds | none |
| Conventions, sign (r55) | `ℤ`, lift ends at `(0, 1)` | `g⁻¹ = 1`, so `Φ = −1` | holds | none |
| Conventions, deck action (r55) | `⟨t | ⟩` | `∂` of lifted cell `(t⁻¹ − 1)·base`, not `t − 1` | holds | none |
| 1.1 controls and NDR data (r55) | `{0} ∪ {1/m}`; `r = (1 − ‖z₀‖)/2`; `S¹`, `x = −1`; `B(F₂)`, `λ = a` | retraction fails at `(1, 0)`; ball radius `< 1`; trace runs `1 → −i → −1`; `b ↦ aba⁻¹ ≠ b` | hold | none |
| 1.1/1.2 target control (r55) | `X = Y = S²` | `id` and constant both trivial on `π₁`; degrees `1`, `0` | asphericity needed | none |
| 1.2 off-vertex, vertex step, reduction (r55) | `[0, 1]`, `x = 1/2`; degree-1 loop vs constant | `H(s, 1/2) = y`; `deg = 1 = 1`; trace null-homotopic | hold | none |
| 1.3 / headline 2 (r55) | `S¹`, `e = −id`; contractible CW vs point; Warsaw circle | degree `−1 = e`; pointed equivalence exists; `π_n = 0`, not equivalent | holds | none |
| Mathlib contract, bar `d₁` | `d_single`, `n = 0`, `x = (g)` | `single [] (single g 1) + single [] (single 1 (−1)) = g·[] − []` | holds | none |
| Mathlib contract, `coinvariantsTensorFreeLEquiv` | `ℤ/2 = ⟨s⟩`, `a = 1`; sign vs trivial `A` | `⟦1 ⊗ s·[x]⟧ ↦ ρ(s⁻¹)1`: `−1` at `x` (sign), `1` at `x` (trivial) | matches "`g⁻¹ • a`" | none |
| 2.1 degree-one bullet | `G = ℤ`, `Φγ = t` | lift ends `t⁻¹•e₀`, chain ↦ `[t⁻¹] = −1`; pinned FirstHomology `+1` | holds as restated | none |
| 2.1 degree-one bullet | `G = ℤ/3`, `Φγ = t` | `[t⁻¹] = [t²]`; `d(t, t²) = [t²] − [1] + [t]`, `d(1,1) = [1]` ⇒ `[t²] = −[t] = 2` vs FirstHomology `1` in `ℤ/3` | holds; sign detected | none |
| 2.1 degree-one bullet | `G = S₃`, `Φγ = (1 2)` | `[s⁻¹] = [s]`, and `−[s] = [s]` in `H₁ = ℤ/2` | holds; sign invisible, so `ℤ` is the right Check | none |
| 2.1 route, Hurewicz step | `…_ofMul_of_mk` at pin | RHS `H₁AddEquivHomology X (loopClass γ)`; chain class needs `H₁AddEquivHomology_loopClass` | citation incomplete | R02 |
| 2.1 circle Check | ccw loop, `Ψ` = degree, `k = ℤ` | `Φ(c_X γ) = 1`, lift ends `(0, −1)`, image `[−1] = −1`; Hurewicz `+1`; `Ψ⁻¹`-normalised `+1` | holds | none |
| 2.1, `ℤ/m` and torus (r55) | `ℤ –0→ ℤ –m→ ℤ –0→ ℤ`; `r = 2` | `H₂ = 0`, `H₁ = ℤ/m`; ranks `2`, `1` | hold | none |
| 2.2 circle Check | class with value `1` on ccw, `k = ℤ` | `[1] ↦` path `(0,0) → (0,1)`, `Φ = −1`, value `−1`: `1 ↦ −1`; Hurewicz `1 ↦ 1`; over `𝔽₂` both `1 ↦ 1` | holds; needs `2 ≠ 0` as stated | none |
| 2.2 Bockstein (r55) | `ℤ/2`, `ℤ/2 → ℤ/4 → ℤ/2` | `H¹(ℤ/2) → H¹(ℤ/4)` injective, orders `2, 2`; `δ` iso | holds | none |
| 2.3 step-3, twisted circle, sign, transport (r55) | `ℤ`, unit `u`; `ℤ/2` sign; `k²`, swap, `diag(1, −1)` | fibre gives `u` (not `u⁻¹`); `H₀ = k/(u − 1)`; `ℤ/2, 0, ℤ/2`; `(−b, a) ≠ (b, −a)` | hold | none |
| 2.3 asphericity control | `S² ∨ S¹`, `k = ℤ`, `A = ℤ` | cells `ℤ –0→ ℤ –0→ ℤ`: `H₂ = ℤ`; circle resolution: `H₂(ℤ, ℤ) = 0` | control valid | none |
| Headline 3, docstring control | same; `k = 0` | `ℤ ≠ 0`; zero ring `0 = 0` | control valid for `k = ℤ`, as stated | none |
| Headline 3, `A = k[G]` (r55) | — | `Hₙ(X̃; k) = k, 0` = `Hₙ(G, k[G])` | holds | none |
| Headline 4, `A = k[G]`, `N = k` (r55) | — | `k, 0` both sides (Shapiro) | holds | none |
| Headline 1 vs AlgebraicTopology | `AlgebraicTopology/Suggested.lean:693` vs line 84 | identical binders and conclusion | duplicate | R01 |

**Direction in 2.1's route.** "Then applies Mathlib's `groupHomologyIso`" names an isomorphism that the pinned definition applies as its inverse. The next clause, "from the singular chains of `EG` to `Rep.barComplex`", already fixes the direction, so nothing needs to change.

## Not verifiable

- `brown-cohomology`, Chapter III §1 (2.1–2.3): uncertified, and no legal text is held. The Hatcher locators at the same claims were verified.
- `schwamberger-vogt-2009`, §2 (1.3, the Warsaw circle): uncertified. The fact used was checked by reasoning.
- `milnor-1956`, §3: uncertified. It is cited only for the pinned model.

## Source issues

- none
