# Review of ClassifyingSpaces (pull request #1807 at 78fe8c3)

**Verdict:** needs changes

This is an incremental re-review. The previous review (r57) read 54ff3d8. Since then this folder has changed by 19 lines (+13/−6), all in `README.md`, in one commit: "ClassifyingSpaces: review repairs (degree-one Hurewicz step cites H₁AddEquivHomology_loopClass alongside _ofMul_of_mk)". `Suggested.lean`, `lake-manifest.json` and `lean-toolchain` are unchanged. `git diff --stat 54ff3d8 HEAD -- TauCetiRoadmap/AlgebraicTopology` is empty.

Status of r57's findings:
- r57 R02 is repaired. The repaired citation is correct at the pin, and the composite it describes closes in Lean.
- r57 R01 is not repaired, because the AlgebraicTopology side was not touched. It is carried below as R01.

The repair introduces no new problem.

## R01 (P2) — Hatcher 1B.9 still has two owners in this pull request, and the nerve-model comparison has none (carried from r57 R01)

**Location.**
- `TauCetiRoadmap/ClassifyingSpaces/README.md` lines 75–92: "The classification of pointed maps … is the case of items 1.1 and 1.2 with target a `K(π, 1)` and is owned here … This roadmap consumes nothing from the algebraic-topology roadmap".
- The *Downstream consumers* bullet, lines 1191–1201: "Its inputs from this roadmap are Layer 1".

**Claim.** This README makes three claims:
- AlgebraicTopology 8.8b owns the normalised nerve-model comparison;
- that comparison consumes Layer 1 here;
- this roadmap owns Proposition 1B.9.

**Witness.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:693` still states `exists_mapOfEq_eq_of_isAspherical_cwComplex`. It matches headline 1 here (line 84) binder for binder. The AlgebraicTopology README says the opposite of this one:
- lines 94–107: ClassifyingSpaces "consumes that classification … owns no second proof of it";
- the table row at line 3314 lists the inputs of 8.8b as "8.8a bar model, 4, 8.5".

The consequences at this head:
- the same theorem is stated twice in one pull request;
- each README hands the normalised comparison to the other, so neither owns it;
- this README's consumer bullet is false.

**Repair.** This is unchanged from r57. It follows the direction that main's AlgebraicTopology README already has (lines 94–101: "Stage8.8b owns only its normalized comparison with those ClassifyingSpaces models").
1. Delete `exists_mapOfEq_eq_of_isAspherical_cwComplex` from `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` (lines 685–702).
2. In `TauCetiRoadmap/AlgebraicTopology/README.md`, rewrite lines 94–107 and 2826–2861 so that:
   - 8.8b consumes ClassifyingSpaces Layer 1, items 1.1–1.3, and gets `[X, Bπ]_* ≃ Hom(π₁X, π)` as items 1.1–1.2 with the bar model as target;
   - 8.8b owns the normalised comparison of the bar model with the pinned models.
3. Add "ClassifyingSpaces Layer 1 items 1.1–1.3" to the inputs of the 8.8b row at line 3314.
4. Leave this folder as it is.

Tested after the repair:
- the pull request has one `IsAspherical`-target theorem concluding `HomotopicRel f g {x}`;
- the only edge between the two roadmaps is AlgebraicTopology consuming this roadmap, the direction main has;
- the dependency check stays clean, because this README cites nothing of AlgebraicTopology as a supplier.

#1854's head makes the opposite choice: its `AlgebraicTopology/Suggested.lean:639` states the theorem, and its `ClassifyingSpaces/README.md:226` cites "Stage 8 item 8b". It has to follow whichever owner this pull request settles on when it rebases, which per the description is after #1808.

## Previous findings

- R01 — not repaired: `AlgebraicTopology/Suggested.lean:693` still states `exists_mapOfEq_eq_of_isAspherical_cwComplex`, and that folder's README lines 94–107 still say ClassifyingSpaces "consumes that classification". This README lines 75–92 claim 1B.9 here. Carried as R01.
- R02 — repaired: lines 510–516 cite `…_ofMul_of_mk` with "the image of the class of `γ` in Tau Ceti's auxiliary `H₁` under `…H₁AddEquivHomology`" and `…H₁AddEquivHomology_loopClass` for the cycle over the chain. The 2.1 bullet (lines 920–923) and 2.1's *Needs* (line 964) cite both.

## Verified sound

**Gate and build.**
- The worker's gate at 78fe8c3 passes every check, including `build=0`.
- My own gate run prints every content counter as `0`. Its only failing counter is `outside-folder=26`. Every listed file is in one of the 13 sibling folders this pull request declares, and `git diff --stat origin/main...HEAD` with those folders and this one excluded is empty.
- The dependency check prints `depcheck: 234 roadmaps, 2266 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- `lake env lean TauCetiRoadmap/ClassifyingSpaces/Suggested.lean` exits 0 with exactly four warnings, `declaration uses 'sorry'` at lines 84, 102, 123 and 138.
- In a scratch file, `#check @` of the four headlines prints types identical to `signatures.md`. No binder was lost, and the generality matches the README.
- `Suggested.lean` is unchanged since 54ff3d8, so the earlier one-tactic padding probe (all four fail) and the headline list (four statable headlines, all stated) still stand.

**The R02 repair, at the pin.** The cited declarations are in `TauCeti/AlgebraicTopology/Homotopy/Hurewicz/One/Basic.lean`:
- `H₁` at line 240 and `loopClass` at line 278 (the class of `pathChain ℤ γ`);
- `H₁AddEquivHomology` at line 666;
- `H₁AddEquivHomology_loopClass` at line 693 (hypothesis `iCycles z = pathChain ℤ γ`, conclusion `H₁AddEquivHomology X (loopClass γ) = homologyπ z`);
- `hurewiczHomologyAddEquiv` at line 705, defined as `(hurewiczAddEquiv x).trans (H₁AddEquivHomology X)`;
- `hurewiczHomologyAddEquiv_ofMul_of_mk` at line 715, whose right side is `H₁AddEquivHomology X (loopClass γ)`.

I checked these in Lean:
- `#check @` of all five, and of `TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology_hurewiczHomologyAddEquiv`, elaborates at the pin.
- A scratch `example` states the claim at lines 514–515: the Hurewicz image of `[γ]` equals `homologyπ z` for every `z` over `pathChain ℤ γ`. It closes with `rw [hurewiczHomologyAddEquiv_ofMul_of_mk, H₁AddEquivHomology_loopClass γ z hz]` (exit 0).

The wording of the two passages:
- Lines 510–516 say exactly what each lemma states.
- At lines 920–921, I read "which lands in Tau Ceti's auxiliary `H₁`" as describing the factorisation at line 707, whose first factor does land in `H₁ X`. On that reading it is accurate.
- `H₁AddEquivHomology_loopClass` is stated for `X : TopCat.{0}`, which agrees with the README's restriction to "`k = ℤ` and `G : Type`" (line 918).
- No other passage cites either lemma. `roadmaps grep` finds them only at README lines 511, 513, 920, 922, 963 and 964.

**Cross-roadmap citations.**
- "Stage 8, items 8.8a and 8.8b" resolves in this pull request's AlgebraicTopology README (lines 2810–2861, table line 3314) and on main (lines 94–101). The contradiction between them is R01.
- `citations.md` lists nothing unresolved, and the diff adds no cross-roadmap citation.

**Overlaps.**
- #1808, #1854 and #1187 change this folder. The description's shared-folder order is "this pull request → #1808 → #1854 → #1187".
- No id this README cites is dropped by an open pull request, and none is defined only by an open revision.
- The diff adds or moves no object, so no new ownership question arises.
- Remark on untouched text, no change requested: the anchor `#stage-2-the-cellular-model` cited by FreeGroupsAndLimitGroups (main line 29) is mapped by the *Stage and item numbers* list, but the overlap tool still lists it.

**Sources (seeded sample).**
- 2.1 changed only in its Hurewicz citation. I re-read its locators anyway:
  - §2.2 "Homology of Groups", p. 148, is `hatcher-at` lines 6471–6479 (PDF page 157);
  - Section 3.H, p. 328, lines 14326–14370, has chains `Cₙ(X̃) ⊗_π M` for a path-connected `X` with a universal cover;
  - Example 3H.1, p. 329, lines 14373–14383, gives the trivial-module reduction for both homology and cohomology.
  All are correct as restated. The same 3.H and 3H.1 passages carry 2.2 and 2.3.
- 1.1–1.3 are untouched, so r57's verification is carried (`hatcher-at` lines 3897–3949, p. 90).
- The README flags no locator as unverified.

**Adversarial table.** Rows marked (r57) are carried from the previous report, for statements this diff leaves untouched. The other rows were computed for this head.

| Statement | Instance | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| Contract, Hurewicz composite (lines 510–516) | `S¹`, counterclockwise loop `γ`, `z` over `pathChain ℤ γ` | `…_ofMul_of_mk`: `H₁AddEquivHomology (loopClass γ)`; `…_loopClass`: `= homologyπ z`; both sides are the generator `1` of `H₁(S¹; ℤ) ≅ ℤ`; the Lean `rw` closes | holds | none |
| Contract, degenerate loop | `γ = refl x` | Hurewicz `[refl] = 0`; the chain is the constant 1-simplex `c`, and `∂` of the constant 2-simplex is `c − c + c = c`, so `homologyπ z = 0` | holds | none |
| Contract, "any `1`-cycle" | `z, z'` over the same chain | `iCycles` is injective, so `z = z'`; "any" is accurate | holds | none |
| Contract, universe | `X : TopCat.{0}` in `…_loopClass` | README line 918 restricts to `G : Type`, `k = ℤ` | consistent | none |
| 2.1 degree-one bullet | `G = ℤ`, `Ψγ = t` | Hurewicz `[γ] ↦` class over the chain; comparison `[t⁻¹] = −1`; pinned FirstHomology `+1` | holds as restated | none |
| 2.1 degree-one bullet | `G = ℤ/3`, `Ψγ = t` | `d(t, t²) = [t²] − [1] + [t]`, `d(1, 1) = [1]` ⇒ `[t²] = −[t] = 2`; FirstHomology `1` | holds; sign detected | none |
| 2.1 degree-one bullet (r57) | `G = S₃`, `(1 2)` | `[s⁻¹] = [s] = −[s]` in `ℤ/2` | sign invisible; `ℤ` Check right | none |
| Conventions, `Φ = m⁻¹` (r57) | `S₃`, `s = (1 2)`, `t = (2 3)` | `m(ℓ_sℓ_t) = ts`; `Φ`: `st = Φ(ℓ_s)Φ(ℓ_t)`; `m`: `ts ≠ st` | holds | none |
| Conventions, sign and deck action (r57) | `ℤ`, lift to `(0, 1)`; `⟨t | ⟩` | `Φ = −1`; `∂` of the lifted cell is `(t⁻¹ − 1)·base` | holds | none |
| 1.1 controls and NDR data (r57) | `{0} ∪ {1/m}`; `S¹`, `x = −1`; `B(F₂)`, `λ = a` | retraction fails at `(1, 0)`; trace `1 → −i → −1`; `b ↦ aba⁻¹ ≠ b` | hold | none |
| 1.1/1.2 target control (r57) | `X = Y = S²` | `id` and the constant map are both trivial on `π₁`; degrees `1`, `0` | asphericity needed | none |
| 1.2 off-vertex and vertex steps (r57) | `[0, 1]`, `x = 1/2`; a degree-1 loop | `H(s, 1/2) = y`; `deg = 1 = 1` | hold | none |
| 1.3 / headline 2 (r57) | `S¹`, `e = −id`; Warsaw circle | degree `−1 = e`; `π_n = 0` but not equivalent | holds | none |
| Mathlib bar `d₁` (r57) | `d_single`, `n = 0` | `g·[] − []` | holds | none |
| `coinvariantsTensorFreeLEquiv` (r57) | `ℤ/2`, sign vs trivial | `−1` vs `1` at `x`: "`g⁻¹ • a`" | holds | none |
| 2.1 circle Check (r57) | counterclockwise loop, degree, `k = ℤ` | image `[−1] = −1`; Hurewicz `+1`; `Ψ⁻¹`-normalised `+1` | holds | none |
| 2.1 `ℤ/m` and torus (r57) | `ℤ –0→ ℤ –m→ ℤ –0→ ℤ`; `r = 2` | `H₂ = 0`, `H₁ = ℤ/m`; ranks `2`, `1` | hold | none |
| 2.2 circle Check and Bockstein (r57) | value `1` on the counterclockwise loop; `ℤ/2 → ℤ/4 → ℤ/2` | `1 ↦ −1` (Hurewicz `1 ↦ 1`); over `𝔽₂` both `1 ↦ 1`; `δ` iso | hold | none |
| 2.3 transport and twisted circle (r57) | `ℤ`, unit `u`; `ℤ/2` sign | fibre gives `u`; `H₀ = k/(u − 1)`; `ℤ/2, 0, ℤ/2` | hold | none |
| 2.3 / headline 3 asphericity control (r57) | `S² ∨ S¹`, `k = ℤ`; `k = 0` | `H₂ = ℤ` vs `H₂(ℤ, ℤ) = 0`; zero ring `0 = 0` | valid for `k = ℤ`, as stated | none |
| Headlines 3 and 4, `A = k[G]` (r57) | Shapiro | `k, 0` on both sides | hold | none |
| Headline 1 vs AlgebraicTopology | `AlgebraicTopology/Suggested.lean:693` vs line 84 | identical binders and conclusion | duplicate | R01 |

## Not verifiable

- `brown-cohomology`, Chapter III §1 (2.1–2.3): uncertified, and no legal text is held. The Hatcher locators at the same claims were verified.
- `schwamberger-vogt-2009`, §2 (1.3, the Warsaw circle): uncertified. The fact used was checked by reasoning.
- `milnor-1956`, §3: uncertified. It is cited only for the pinned model.

## Source issues

- none
