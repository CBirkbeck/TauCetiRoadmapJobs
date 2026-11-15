# Review of SpinRepresentations (pull request #1207 at 60e7039)
Folder: `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/`
**Verdict:** needs changes

Incremental re-review of the 107 lines changed since 2dbbfae (`BogoliubovTargets.lean` deleted, 39 lines added to `Suggested.lean`, `README.md` untouched). The gate fails at this head.

## R01 (P3) — gate: `letI` in four signatures, two unnamed `Nonempty` conclusions

**Location:** `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/Suggested.lean:143–148`, `:159–164`, `:175–180`, `:191–196` (`letI := TauCeti.TypeDStd.isKilling_typeD (K := ℂ) n hn` and four more per theorem); `:220` (`spin6_equiv_sl4`), `:324` (`kostant_isotypic`).

**Claim:** `Suggested.lean` passes the gate's `statement-hygiene` rule (no `letI`/`haveI` in a signature; a theorem concluding `Nonempty (A ≃ B)` is named `nonempty_*`).

**Witness:** gate at 60e7039: `statement-hygiene=22 … FAIL`, five `letI` hits in each of the four `spin{Plus,Minus}_equiv_irreducibleQuotient_of_{even,odd}` theorems (20), and the `Nonempty` conclusions of `spin6_equiv_sl4` and `kostant_isotypic` (2).

**Repair:** the three structure instances are `Prop`s, so make them instance binders, and state the module isomorphism as an explicit intertwiner, the form `kostantSpinRep_multiplicity` already uses:

```lean
theorem spinPlus_equiv_irreducibleQuotient_of_even {n : ℕ} {V : Type v} [AddCommGroup V]
    [Module ℂ V] {Q : QuadraticForm ℂ V} (P : TauCeti.SpinPolarizationData Q)
    (b : Module.Basis (Fin n) ℂ P.W) (hn : 4 ≤ n) (hline : P.line = ⊥) (heven : Even n)
    [LieAlgebra.IsKilling ℂ (LieAlgebra.Orthogonal.typeD (Fin n) ℂ)]
    [(TauCeti.typeDDiagonalCartan ℂ (Fin n)).IsCartanSubalgebra]
    [LieModule.IsTriangularizable ℂ (TauCeti.typeDDiagonalCartan ℂ (Fin n))
      (LieAlgebra.Orthogonal.typeD (Fin n) ℂ)] :
    ∃ e : TauCeti.spinPlus Q P ≃ₗ[ℂ]
        TauCeti.irreducibleQuotient (TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).base
          ((TauCeti.TypeDStd.lieBasis (K := ℂ) n hn).cartanBasis.dualBasis
            (⟨n - 1, by omega⟩ : Fin n)),
      ∀ (x : LieAlgebra.Orthogonal.typeD (Fin n) ℂ) (s : TauCeti.spinPlus Q P),
        e (P.typeDSpinPlusLieRep b hline x s) = ⁅x, e s⁆ := sorry
```

and the three siblings by the same pattern (`spinMinus`/`typeDSpinMinusLieRep`, index `n - 1` or `n - 2`, `Even`/`Odd` as now). Tested: this statement elaborates at the pin (`sorry` the only warning), and the binders are discharged by `TauCeti.TypeDStd.isKilling_typeD n hn`, `(TauCeti.TypeDStd.lieBasis n hn).isCartanSubalgebra` and `.isTriangularizable`. On a scratch copy with all four replaced, the scanner reports only the two `Nonempty` hits. Renaming those theorems `nonempty_spin6_equiv_sl4` and `nonempty_kostant_isotypic` in `Suggested.lean` and at `README.md:323`, `:325`, `:1021`, `:1484` gives `statement-hygiene=0` and gate `OK` on that copy (text checks; the three sibling replacements and the renames were not elaborated).

## R02 (P3) — the Bogoliubov companion was moved into `Suggested.lean`, not deleted

**Location:** `Suggested.lean:78–111` ("**This section is not the roadmap and is not exhaustive.** … The admitted statements are future theorem targets, not completed proofs of the full group comparison.", then `planeForm`, `positive_plane_model`, `Z`, `X`, `D`, `Dinv`, `matrix_counterexample`) and `:16–18`.

**Claim:** `Suggested.lean` states headline theorems only, every Lean name appears in the README, and no docstring carries process narrative.

**Witness:** `README.md:318–326` lists the headlines; none of the seven names is there or anywhere in the README. `matrix_counterexample` computes 2×2 products that `README.md:439–443` keeps as a Check: its first four conjuncts close by `simp [D, Dinv, Z, X, Matrix.one_fin_two]`.

**Repair:** delete `Suggested.lean:78–111` (the README keeps the plane model at `:415–430` and the Check at `:439–443`); restore `:16–18` to "together with the single definition (`kostantSpinRep`) one of them needs to be stated" and `:351` to "The only definition this file needs". Tested on a scratch copy: the gate's text checks pass with the section removed.

## R03 (P3) — README shape, two process words, two locators (carried, README unchanged)

**Location:** `README.md:269` ("## Current native producers and remaining comparisons"), `:273` ("Current native API and scope"), `:1361` ("it is not currently a public declaration"), `:253` ("`exteriorPower.basis`"), `:1175` (a GitHub blob URL at commit `a91d3aaf…`).

**Claim:** the README is timeless, cites library declarations by name and module path, and has the roadmap shape.

**Witness:** the five lines are byte-identical to 2dbbfae. Mathlib has `Module.Basis.exteriorPower` (`Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:94`), no `exteriorPower.basis`. No `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `*Needs:*` or per-layer `### Examples`/`### Dependencies`.

**Repair:** rename the heading "Native producers and remaining comparisons" and the column "Native API and scope"; write "a private declaration" at `:1361`; cite `Module.Basis.exteriorPower`; cite `TauCeti/Algebra/Lie/Presentation/Serre/Automorphism.lean` by module path. Add three Checks each for: the sphere-bundle `FiberPrebundle`, the full cover `N(x) = ±1` and `K(p, q)` (Layer 7), `x_±i(u)`, `h_i(z)`, `T_Cl(s)`, `J₁, J₃, J₄` (Layer 8), `P`, `Q_P`, `σ` (Layer 9).

## R04 (P3) — the negative-form comparison: SpinGeometry on main now hands it back, and the two links no longer resolve

**Location:** `README.md:1099` and `:1574` ("[SpinGeometry G1.1](../../SpinGeometry/README.md#g1-negative-metric-clifford-modules-and-their-positive-metrics) consumes it"), `:1112` ("**NegativeFormEvenComparison (owned here).**").

**Claim:** one owner for the comparison of compact `Spin(n)` and its even algebra with those of the negative form, and links that resolve on main.

**Witness:** `TauCetiRoadmap/SpinGeometry/README.md` on main (4d169a9): `:535` "SpinRepresentations L7 consumes G1.1's negative-form comparison"; `:576` "The comparisons between the positive and the negative form are Tau Ceti's"; headings are now `## Layer 1: …` (`:566`) and `## Layer 4: …` (`:1461`).

**Repair:** merge main into the branch. Relink to `#layer-1-negative-metric-clifford-modules-and-their-positive-metrics` (§1.1) and `#layer-4-spin-lifts-obstruction-and-classification`. At `:1112`, cite what main's Tau Ceti pin (2fd255d9) already has, `CliffordAlgebra.realCliffordSpinGroupEquivNeg` with its bivector, vector-action and `-1` lemmas (`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/Neg.lean:75–127`), and keep as targets only what it lacks (the algebra-level statement with `reverse`/`involute`, the topological-group statement); drop "consumes it" at `:1099`, `:1574` in favour of "consumes the same native comparison".

## R05 (P3) — the pull request's description describes earlier heads

**Location:** `scratch/pull-request.md`, description: "`Suggested.lean` is unchanged by the triality revision"; "The prototype retains ten admitted-declaration warnings"; "accepted the complete text and native companion. Its signatures compile with four intentional theorem admissions".

**Claim:** the description matches the head.

**Witness:** against main `Suggested.lean` changes by 1036 lines (48 declarations removed, 17 added, `trialityAut`/`trialityAut_order_three` replaced by `exists_trialityAut`); it elaborates with 16 `sorry` warnings; the companion `BogoliubovTargets.lean` is not in the folder at 60e7039.

**Repair:** replace the three sentences by: "`Suggested.lean` is rewritten as the acceptance test: 48 alias and API declarations are removed and the headline theorems are stated (16 admitted declarations at this head, `sorry` the only warning). The Bogoliubov criteria `generator_range_iff` and `first_word_piece_iff` are stated there; there is no companion Lean file." If R01's renames are made, also correct "`spin6_equiv_sl4` is unchanged" in the summary block.

## Previous findings

- R01 — partly repaired: `BogoliubovTargets.lean` is deleted and the duplicate pair is gone, but `Suggested.lean:78–111` now holds its section docstring, `planeForm`, `positive_plane_model`, `Z`, `X`, `D`, `Dinv`, `matrix_counterexample` (R02 above).
- R02 — not repaired: `README.md` is unchanged; `:269` "## Current native producers and remaining comparisons", `:253` "`exteriorPower.basis`", `:1361` "not currently a public declaration", `:1175` the commit-pinned URL (R03 above).
- R03 — not repaired: `README.md:1112` still reads "**NegativeFormEvenComparison (owned here).**" with no clause; SpinGeometry on main has since been revised, which changes the witness and the repair (R04 above).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `positive_plane_model` (`Suggested.lean:93`) | `v = (a, b)`; dimension | `[[a,b],[b,−a]]² = (a²+b²)·1 = Q(v)` for `realCliffordForm 2 0`; `1, Z, X, ZX` span `M₂(ℝ)`, `dim Cliff = 4` | true | delete (R02) |
| `matrix_counterexample` (`:104`) | the five conjuncts | `D·Dinv = Dinv·D = 1`; `DZD⁻¹ = Z`; `DXD⁻¹ = [[0,2],[1/2,0]]`; `aZ + bX = [[a,b],[b,−a]]` needs `b = 2 = 1/2`; first four close by one `simp`, the fifth by `mem_span_pair` and `linarith` | true; padding | delete (R02) |
| Four type-D headlines, in R01's form | `n = 4` (even), `n = 5` (odd); action through `LieRingModule.compLieHom` | `⁅x, s⁆ = rep x s`, so `e (rep x s) = ⁅x, e s⁆` is the same `≃ₗ⁅ℂ, typeD⁆`; `n = 4`: top wedge of degree 4 in `S⁺`, index `n−1 = 3`, weight `ω₄`; `n = 5`: degree 5 in `S⁻` | equivalent statement, elaborates | R01 |
| `generator_range_iff` (cited by `:81`) | `V = 0`; `Q = 0` on `K²`, `ε₁ ↦ ε₁ + ε₁ε₂`, `ε₂ ↦ ε₂` | `V = 0`: `C = K`, `φ = id`, `W = 0`, unique isometry; `K²`: `(ε₁+ε₁ε₂)² = 0`, image of `ε₁` not in `W`, and no isometry induces it: both sides false | holds | none |

The rows for the statements the diff does not touch stand as in the previous review, of 2dbbfae.

- Gate, run again at 60e7039: every counter `0` except `statement-hygiene=22`, `FAIL` (R01); `stray-files=0`, `outside-folder=0`.
- Dependency check: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` at the worktree's pins: 16 `declaration uses sorry` warnings, nothing else; the moved declarations have no section variables, so no binder is lost.
- Files outside the folder and the family index: no change against `origin/main`.
- Library declarations opened at the pin (Tau Ceti a91d3aaf): `TypeDStd.isKilling_typeD` (`Algebra/Lie/Orthogonal/TypeD/Killing.lean:329`), `TypeDStd.lieBasis` (`TypeD/Basis.lean:45`), `LieAlgebra.Basis.isTriangularizable` (`Algebra/Lie/Basis/Root.lean:50`), `irreducibleQuotient` (`Algebra/Lie/HighestWeight/Verma.lean:525`), the native `letI` signatures at `Spin/Polarization/TypeD/HighestWeight.lean:197–206`; at main's pin 2fd255d9 only: `realCliffordSpinGroupEquivNeg` (`Spin/Real/Neg.lean:75`).
- Seeded sample: the four targets lie in README text the diff does not touch; they stand as verified at 2dbbfae. Source locators re-checked this round: none added or changed.
- Remark (untouched text): `TauCetiRoadmap/SpinGeometry/README.md:635` on main sends the positive-plane generators to `e₁ ↦ X`, `e₂ ↦ Z`, the opposite order to `README.md:439` here; the two models differ by an inner automorphism.
- Overlap check: read SpinGeometry (main: supplier list, How to read the build, §1.1); OrthogonalSpinGroups and LieHighestWeight searched for the changed passage's objects, no hit; shared with SpinGeometry: the negative-form comparison, owner Tau Ceti at main's pin (R04).

Source independence: changed passages only: 4 passages (`Suggested.lean:16–18`, `:78–85`, `:92`, `:103`) compared with 2 sources (`panyushev2001`, `shlyakhtenko2026`), none shared; no locator added; largest share by author name `fultonharris1991`, 6 of 26, text not readable; no layer added, removed or reordered, contents not compared again.

## Not verifiable

- `fultonharris1991`, `goodmanwallach2009`, `meinrenken2013`, `kostant1997`: uncertified (paywalled), cited by locator alone.
- Lawson–Michelsohn, Adams, Chevalley, Cartan: not in the manifest, no open copy known; unchanged since the previous review.
- R01's three sibling replacements and the two renames: checked by the gate's text scan only, not elaborated.
- Ownership against open pull requests: checked through `roadmaps grep` for the changed passage only.

## Source issues

- none

## For the human reviewers

- Not tested: `fultonharris1991` has the largest share of the README's citations (6 of 26 by author name) and is uncertified; wording and arrangement were not compared with it.
- Pins: the pull request's manifest pins Tau Ceti a91d3aaf, main pins 2fd255d9; `realCliffordSpinGroupEquivNeg` exists only at the latter (R04).
