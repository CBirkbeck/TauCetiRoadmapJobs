# FIX-PKG-LogicAndDefinabilityInNumberTheory~11

Findings of `REV-PKG-LogicAndDefinabilityInNumberTheory~10`: two, both P3, both verified and applied. `Suggested.lean` is unchanged.

## F01 (P3) — applied

Verified: at the pinned Tau Ceti (`2fd255d9`) the theorem is declared inside `namespace TauCeti` (TauCeti/NumberTheory/Height/Absolute.lean, namespace at line 65, theorem at line 187). The supplier's own §0.3 on main (DiophantineApproximationAndTranscendence README line 302) uses the qualified name.

Changed: `packages/LogicAndDefinabilityInNumberTheory/README.md`, Exact supplier contracts, "From TauCetiRoadmap.DiophantineApproximationAndTranscendence". Old: "bounded-degree Northcott `finite_setOf_absMulHeight₁_le` ([§0.3](…))". New: "bounded-degree Northcott ([§0.3](…)), which is Tau Ceti's `TauCeti.finite_setOf_absMulHeight₁_le` (TauCeti/NumberTheory/Height/Absolute.lean): in a field of characteristic zero, the elements algebraic over ℚ whose minimal polynomial over ℚ has degree at most d and whose absolute multiplicative height is at most B form a finite set." The link is unchanged. I wrote "minimal polynomial over ℚ" instead of the review's "degree at most d" because the Lean statement bounds `(minpoly ℚ x).natDegree`.

Manifest `tauceti_pin`: the locator now lists every Tau Ceti file the README names: "Geometry/RealAlgebraic/Semialgebraic/Basic.lean, RingLanguage.lean and Dimension/Basic.lean; Geometry/RealAlgebraic/CAD/Existence.lean; RingTheory/GrothendieckRing.lean; NumberTheory/NumberField/Global/Approximation/Vector.lean; NumberTheory/QuadraticForm/Global/SignPrescription.lean; NumberTheory/Height/Absolute.lean". The review's list did not have SignPrescription.lean, which holds `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite`, named in the supplier contracts; I added it. `cited_for` is now "Scope and ownership; Exact supplier contracts; 3.2; 4.20; 6.1; 6.2; 6.11; 6.12; 6.16". 6.2 is added because its *Needs:* line names `TauCeti.isSemialgebraic_iff_definable_real`. All eight files exist at the pin.

Same pattern elsewhere (library names written without their namespace). Twelve more short names were qualified:
- line 16 (Scope and ownership) and line 66 (From Tau Ceti): `ofRingHom` and `liftRingHom` become `Algebra.GrothendieckAddGroup.ofRingHom` and `Algebra.GrothendieckAddGroup.liftRingHom`, in both places;
- line 50 (From Mathlib): `realize_formula_cast` and `sentence_realize` become `FirstOrder.Language.Ultraproduct.realize_formula_cast` and `FirstOrder.Language.Ultraproduct.sentence_realize`;
- line 54 (From Mathlib): `eval₂Hom_C`, `eval₂Hom_X'`, `induction_on`, `rename`, `rename_rename`, `eval_rename` and `exists_finset_rename` each gain the `MvPolynomial.` prefix.

One scratch file `#check`s all fourteen qualified names, at Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, and every one elaborates. `frontier` is a root-namespace Mathlib definition and stays as written. `TriangulatedK0` and `exists_oMinimalStructure_definable_iff` are names of other roadmaps (MotivesAndAlgebraicCycles §4.20; ShimuraVarieties §3.4b, whose `Suggested.lean` line 130 at its head declares it) and stay as written.

## F02 (P3) — applied

Verified: in `geometric_categories_and_o_minimal_structures`, item 4.1 is the monotonicity theorem (line 472, page 12). §6.1 states the predicate `IsOMinimalExpansion`, the equivalence between finite boundary and a finite union of points and intervals, the inclusion of semialgebraic sets, reducts and constants. None of these uses monotonicity. The remaining locator is correct: §2 starts at line 240, the definition of a structure on the real field is on p.7 (line 259), and the o-minimality definition is on p.9 (line 370).

Changed: README §6.1 citation. Old: "§2, pp.7–9; §4.1, p.12 (revised author copy)". New: "§2, pp.7–9 (revised author copy)". The manifest locator of `geometric_categories_and_o_minimal_structures` now records the §2 range that §6.1 cites: "§2, pp.7–9: structures on the real field, p.7, §2.5 with item (4), pp.8–9, and the o-minimality definition, p.9; 4.1–4.4 and 4.6, pp.12–13". 4.1 stays in the manifest because §6.3 still cites it.

Same pattern elsewhere: every other citation of this source was checked.
- §6.2 cites §2.5(4), pp.8–9 (line 336, page 9) and the o-minimality definition (line 370). Correct.
- §6.3 cites "§4.1 and §4.2, p.12". The remark after 4.1 (line 475) says that every known o-minimal structure has analytic monotonicity, and 4.2 (lines 502–510) says that R_an,exp has analytic decomposition. Both support §6.3's analytic-cell statement. Kept.
- §6.4 cites 4.3 and 4.6 on p.13 (lines 513, 522) and connectedness of cells on p.12 (line 497). Correct.
- §6.5 cites 4.4 on p.13 (line 515). Correct.

## Checks run

- **Elaboration.** `lake env lean packages/LogicAndDefinabilityInNumberTheory/Suggested.lean`, run from the content checkout, exits 0. The only output is twelve `declaration uses sorry` warnings, at lines 40, 50, 66, 73, 89, 95, 101, 109, 127, 135, 169 and 185. No `TauCeti.*` object file was missing.
- **Signatures.** I copied `Suggested.lean` to a scratch file, added `#check @name` for all 18 declarations, and elaborated it once: exit 0, no errors. Each elaborated type is identical to the one the worker recorded for this round. The file has no `variable` block, so no binder is lost. Nothing changed, and `Suggested.lean` was not edited.
- **Library names.** One scratch file `#check`s `TauCeti.finite_setOf_absMulHeight₁_le` (it prints `∀ {F} [Field F] [CharZero F] (d : ℕ) (B : ℝ), {x | IsAlgebraic ℚ x ∧ (minpoly ℚ x).natDegree ≤ d ∧ NumberField.absMulHeight₁ x ≤ B}.Finite`) and the thirteen other qualified names above. All elaborate.
- **Citations.** `roadmaps resolve` on the edited README reports no cross-roadmap citation and no Lean name that is found nowhere.
- **Dependency check**, run as prescribed:

```
depcheck: 223 roadmaps, 1979 edges, 0 problem(s)
```

  It shows no UPWARD, CYCLE or moved line. No supplier was added or removed, so the plan's `gaps` list is unchanged.
- **Manifest.** It parses as TOML: 41 entries, 41 distinct ids, no local path. No `needs-references.toml` was needed.
- **Gate failures.** This brief lists none.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Supplier-contract sentence for `TauCeti.finite_setOf_absMulHeight₁_le` | d=0; B<1; F=ℚ with d=1, B=1; F=ℂ with d=2, B=1; x=π∈ℂ; a field of characteristic p | d=0: an algebraic x has a minimal polynomial of degree ≥1, so the set is ∅. B<1: `one_le_absMulHeight₁` (Tau Ceti Height/FiniteOrder.lean line 83) gives H≥1, so the set is ∅. ℚ: H(a/b)=max(\|a\|,b)=1 gives {0,1,−1}, 3 elements. ℂ: H=1 exactly for 0 and the roots of unity; φ(n)≤2 for n∈{1,2,3,4,6}, giving 1+1+2+2+2=8 roots plus 0, so 9 elements. π: H(π)=1 (junk value) and `minpoly ℚ π`=0 has degree 0≤d, so π is kept out only by the clause "algebraic over ℚ". Characteristic p: there is no ℚ-algebra structure, so the hypothesis "characteristic zero" is needed | Holds. The prose has the same generality as the Lean statement (any field of characteristic zero, degree of `minpoly ℚ x`) | Wording "minimal polynomial over ℚ" |
| §6.1 citation of van den Dries–Miller | p.7 line 259; p.9 line 370; 4.1 at line 472 | The structure definition is on p.7, o-minimality on p.9, monotonicity on p.12. No statement of §6.1 uses monotonicity | §2, pp.7–9 supports §6.1; §4.1 supports nothing in it | §4.1 removed |
| Qualified names (14) | `#check @` at the pins | All 14 elaborate. `MvPolynomial.induction_on` has the cases C, +, ·X; `Ultraproduct.sentence_realize` is Łoś's theorem for sentences under `[∀ a, Nonempty (M a)]` | The names exist, and the prose uses match their statements | Prefixes added |
| `tauceti_pin` locator | the 8 files listed | Each exists under the pinned Tau Ceti, and each holds a declaration that the README names | Complete | Locator and `cited_for` |

No Check or worked example uses a changed object. The changes are a citation, a locator and namespace prefixes; no statement changed.

## For the maintainer

- No Lean name of this roadmap changed, and no section id changed. TopologicalMirrorSymmetryForHitchinSystems cites §§2.5, 2.7–2.9, 2.11 and 2.12, and none of them was touched.
- Ownership: this round states no new construction, so no ownership check against open pull requests was needed.
- The service-recorded fields `url` and `fetched_from` of `tauceti_pin` name Tau Ceti tree `a91d3aaf`, while the pin in `lake-manifest.json` is `2fd255d9`. These fields belong to the sources service and were not edited. Every declaration and file the README cites was checked at `2fd255d9`.
- Nothing suspicious was found in the review text. It was treated as data.
