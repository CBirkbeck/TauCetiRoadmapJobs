# Review of SiegelModularForms (pull request #1714 at 61c6276)

**Verdict:** needs changes

An incremental re-review of 44 changed lines since `bee9025`: the Hecke-ring passages of `TauCetiRoadmap/SiegelModularForms/README.md` (supplier contract `:276–280`, `:305–313`; build overview `:482`; 7.1 `:2208–2232`; Layer 7 *Dependencies* `:2449–2455`) and one bullet of the module docstring of `TauCetiRoadmap/SiegelModularForms/Suggested.lean` (`:40–42`). One finding.

## R01 (P2) — the Hecke pair and the commutativity of the Hecke ring (7.1) are statable at the pins and absent

**Location:** `TauCetiRoadmap/SiegelModularForms/Suggested.lean:40–42`: "the Satake transform `H_p ⊗ ℚ → ℚ[Y]^W` (the Hecke ring itself is at the pins: Mathlib's `HeckeRing` with Tau Ceti's ring structure `HeckeCosetModule.instRingHeckeRing`)"; `README.md:2208–2221`.

**Claim:** With the ring at the pins, 7.1's two theorems on it (`(Γ_g, GSp⁺_{2g}(ℚ))` is a Hecke pair; its Hecke ring is **commutative**) are statable on the file's own `gammaGSp`, yet neither is stated nor named in the docstring as not statable.

**Witness:** A scratch copy of the file with the three declarations below and the import `TauCeti.NumberTheory.HeckeRing.Commutativity` elaborates (`sorry` the only warning); `mul_comm a b`, `simp` and `ring` do not close the second.

**Repair:** Add `public import TauCeti.NumberTheory.HeckeRing.Commutativity` and, in Layer 7 after `gammaGSp`:

```lean
/-- `(Γ_g, GSp⁺_{2g}(ℚ))` is a Hecke pair (7.1): `GSp⁺_{2g}(ℚ)` commensurates `Γ_g`. -/
theorem isHeckeTriple_gammaGSp (g : ℕ) :
    IsHeckeTriple (⊤ : Submonoid (GSpPos g ℚ)) (gammaGSp g) (gammaGSp g) := sorry

instance (g : ℕ) : IsHeckeTriple (⊤ : Submonoid (GSpPos g ℚ)) (gammaGSp g) (gammaGSp g) :=
  isHeckeTriple_gammaGSp g

/-- The Hecke ring of `(Γ_g, GSp⁺_{2g}(ℚ))` is commutative (7.1, van der Geer §16). -/
theorem heckeRing_mul_comm (g : ℕ) (R : Type*) [CommRing R]
    (a b : HeckeRing (⊤ : Submonoid (GSpPos g ℚ)) (gammaGSp g) R) : a * b = b * a := sorry
```

and name `isHeckeTriple_gammaGSp` and `heckeRing_mul_comm` at the two sentences of 7.1 (`README.md:2208`, `:2220`).

## Previous findings

- The previous report (of `bee9025`) had no finding of its own; its R01 of the round before stays repaired: the description's "Why Tau Ceti wants it" sentence is unchanged at this head.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Contract `README.md:305–306`: "Mathlib's `HeckeRing` carries no product at the pin" | `Mathlib/NumberTheory/HeckeRing/Defs.lean` at the pin; grep of Mathlib for `HeckeRing` | One file only; instances: `Inhabited`, `One` on `HeckeCoset`, `FunLike`, `AddCommMonoid`, `AddCommGroup`; no `Mul` | Pass |
| Contract `:306–308`: `.Multiplication`, `.One`, `.Associativity` give the ring `HeckeCosetModule.instRingHeckeRing` | Tau Ceti `NumberTheory/HeckeRing/Associativity.lean:484`; `Multiplication.lean:109`; `One.lean:123` | `instRingHeckeRing {H} [IsHeckeTriple Δ H H] {R'} [Ring R'] : Ring (𝕋 Δ H R')`; any group `G` | Pass: hypotheses as written |
| Contract `:309–311`: Shimura's criterion, `HeckeCosetModule.mul_comm_of_antiInvolution`, `HeckeAntiInvolution` | `Commutativity.lean:79`, `:459` | Fields `toFun : Δ →* Δᵐᵒᵖ`, `involutive`, `mem_H`; theorem needs `[CommSemiring R]` and `ι.onHeckeCoset D = D` for all `D` | Pass; "commutative coefficient ring" is within `CommSemiring` |
| 7.1 (changed): `γ ↦ γ^∨ = μ(γ)γ⁻¹` is a `HeckeAntiInvolution` of `(⊤, Γ_g)` fixing every double coset | `g = 2`: `diag(1,1,p,p)`, `diag(1,p,p²,p)`; `g = 1`: `[[1,1],[0,2]]`; non-integral `c⁻¹γ`; `γ ∈ Γ_g` | `diag(p,p,1,1)`, `diag(p²,p,1,p)`: both `JγJ⁻¹`; `[[2,−1],[0,1]]`, divisors `(1,2)` both sides; `(c⁻¹γ)^∨ = c⁻¹γ^∨`; `(γ^∨)^∨ = γ`; `γ^∨ = γ⁻¹ ∈ Γ_g` | Pass; agrees with 0.2 (`README.md:543`) |
| 7.1 coset counts (same paragraph) | `p = 2, 3` | `(p+1)(p²+1) = 15, 40`; `p³·` that `= 120, 1080`; `p·` that `= 30, 120`; totals `15·10 + 1 = 151`, `40·30 + 1 = 1201` | Pass |
| 7.1 locators (van der Geer) | `vdg` lines 1401, 1416, 1437–1441, 1453, 1474 | Lemma 16.1 (p. 30), Proposition 16.2 (p. 30), commutativity by `γ^∨` (p. 30), Theorem 16.3 (p. 31), Definition 16.4 (p. 31) | Pass: each where cited |
| Docstring `Suggested.lean:40–42`: 7.4 lacks the Satake transform | grep of both pins for `Satake` | Mathlib: none; Tau Ceti: `ModularForms/Newforms/Satake.lean` (the `GL₂` newform parameters) and one use; no transform `H_p → ℚ[Y]^W` | Pass for 7.4; R01 for 7.1 |
| R01: `isHeckeTriple_gammaGSp`, `heckeRing_mul_comm` | scratch copy elaborated; `g = 0`; one-tactic probes | `heckeRing_mul_comm : ∀ g R [CommRing R] (a b : HeckeRing ⊤ (gammaGSp g) R), a * b = b * a`; `g = 0`: trivial group, ring `≅ R`; `mul_comm`: no `CommMagma`; `simp`, `ring`: no progress | Statable, not padding |
| 7.2 (seeded sample; cites 7.1's ring) | `ψ₄`, `ψ₆` at `p = 2` | `(1 + 2²)(1 + 2³) = 45`; `(1 + 2⁴)(1 + 2⁵) = 561`; the homomorphism `H → End(M_ρ)` now has a ring as its source at the pins | Pass |
| Build overview `:482` and Layer 7 *Dependencies* `:2449–2455` | against 7.1's *Needs:* line `:2231–2232` | Same three Tau Ceti names and the same Mathlib names; `HeckeRing/GLn/`, `HeckeRing/GL2/`, `ModularForms/HeckeSlash/` exist at the pin | Pass |
| Description: "It reuses Mathlib's analytic and Hecke infrastructure, Tau Ceti's symplectic and degree-one modular theory" | contract at this head | Mathlib's `IsHeckeTriple`, `HeckeCoset`, `HeckeRing` are still consumed; Tau Ceti was a supplier before; no supplier added or dropped | Pass: not contradicted |

Rows for the roadmap's other statements stand as in the previous review, of `bee9025`.

- **Source locators (5):** the five `vdg` locators of 7.1 above. Of the seeded sample only 7.2 and 7.5 cite the changed passages; the other thirteen targets were not re-read.
- **Library declarations opened (6):** Mathlib `NumberTheory/HeckeRing/Defs.lean:75` (`IsHeckeTriple`), `:189` (`HeckeRing`); Tau Ceti `NumberTheory/HeckeRing/Associativity.lean:484`, `Commutativity.lean:79`, `:459`, `GLn/TransposeAntiInvolution.lean:83`.
- **Cross-roadmap citations:** the diff adds none; `scratch/citations.md` lists no unresolved cross-roadmap citation, and the three new library names resolve at the pin.
- **Pull request text:** title and description read against this head; none contradicted. They say the pull request adds a roadmap (the folder is not on main); "12 layers and 66 milestones" unchanged (the diff adds or removes no heading).
- **Gate** (worker's, on this head): every check `0`, `build=0`, `OK`.
- **Dependency check:** `depcheck: 250 roadmaps, 2380 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits `0` with 72 `declaration uses sorry` warnings and nothing else; the diff changes only the module docstring, so the signatures stand.
- **Outside the folder and overlaps:** the diff outside the folder is empty; `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no second copy.

Overlap check: searched every open roadmap and main for the objects of the changed passages (the abstract Hecke ring, its product, Shimura's criterion, a Hecke pair on `GSp` or `Γ_g`) instead of re-reading the closest-roadmap lists (HalfIntegralWeightModularForms, HilbertModularForms, LevelOneAutomorphicFormsForClassicalGroups, ModularForms, ThetaSeries), which the change does not name; nothing shared: AutomorphicBundles, IgusaVarietiesAndTorsionConcentration (and its Part II), HigherHidaAndColemanTheory and VonNeumannAlgebras cite the same pinned declarations and own none of them, no other roadmap states the Siegel Hecke pair of 7.1, and R01's two names occur in no `Suggested.lean`.

Source independence: changed passages only: 2 passages compared with 1 source (`vdg` lines 1401–1475), none shared (longest common run 2 words); the arrangement was not compared again, no layer having been added, removed or reordered.

## Not verifiable

- "Shimura's criterion" (`README.md:309`, `:2220`, `:2451`) is credited through the pinned declaration, whose docstring gives Shimura, Proposition 3.8; Shimura's book is not in the sources cache and was not opened.
- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" (description): a statement about other pull requests.

## Source issues

- none

## For the human reviewers

- The worker's source listing gives three uncertified keys the titles of unrelated works (`mizumoto1991`, `arakawa1983`, `satoh1986`: an article on Teichmüller spaces, one on the integer 5906, one on an exotic 4-manifold); the README's own references are unaffected (D01).
