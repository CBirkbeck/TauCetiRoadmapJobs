# Repair report FIX-RT-LieHighestWeightPartII~1

Red-team round 1, passes a and b, on `packages/LieHighestWeightPartII`. Twelve findings; the two Chevalley-restriction findings overlap and are settled once. None is disputed.

## RT-LieHighestWeightPartII~1a/F01 (P2) — applied

Added the headline `existsUnique_positiveRealPart` to `Suggested.lean` (Layer 5): for `H` with `TauCeti.reductiveCommHopfAlgProperty` and a semisimple point `s`, `∃! r, IsPositiveRealPart s r`. In README §5.4 it is now a "Prove" target with an existence and uniqueness route. The docstrings and text of §5.5 now cite it. This makes the hypotheses `hr`, `hr'` of `exists_conj_positiveRealPart_of_weightPattern_eq` satisfiable.

## RT-LieHighestWeightPartII~1a/F02, RT-LieHighestWeightPartII~1b/F01 (P2) — applied

The README no longer says LieHighestWeight Layer 7 owns Chevalley restriction. It now cites the pinned `LieSubalgebra.map_lieInvariants_lieCartanRestriction` and `LieSubalgebra.lieChevalleyRestrictionIso`, carried to polynomial functions by `TauCeti.killingSymmetricEquiv`, `TauCeti.killingSymmetricEquiv_mem_lieInvariants_iff` and `TauCeti.map_dualMap_killingSymmetricEquiv`. This affects Scope, the Tau Ceti and LieHighestWeight contracts, the §3.1 route, its Needs line and the Layer 3 Dependencies. Layer 7 is still cited for the Serre presentation only.

## RT-LieHighestWeightPartII~1a/F03 (P2) — applied

The §3.5 Checks no longer quote table rows. They state values computed from §3.2 (principal: `i_max = 58, 22, 10`, `D_0 = 8, 4, 2`; `F₄` `(1,0,0,0)`/`(0,0,0,1)`: `D_1 = 14/8`) and compare the tables by locator only. Same pattern at §3.4: the five `G₂` profiles became the separating `D_0`, `D_1`.

## RT-LieHighestWeightPartII~1a/F04 (P2) — applied

Added the Layer 0 headline `exists_innerAut_iff_neutral_conjugate`, with the binders of §4.1: two zero-inclusive triples are `Int(L)`-conjugate iff their neutral elements are. README §0.3 now opens "Prove `exists_innerAut_iff_neutral_conjugate`", with the locators DG lines 139–153 and SOM lines 361–362 (Mal'cev). The proof route is unchanged except for F05.

## RT-LieHighestWeightPartII~1a/F05 (P1) — applied differently

I declared the supplier gap the finding asks for, but in a wider form: `gap:orbit-map-differential` (ReductiveGroups, §3A), in `design/plan.json` `gaps` and under the ReductiveGroups contract, with three Checks. It also covers `Lie(Stab v) = ker dμ_v`, because §0.3 used `Lie(G_h) = L_0` without a supplier too. The orbit-map ownership moved from Layer 3 to §§3A.1–3A.2 (native `TauCeti.orbitMap`, `TauCeti.stabilizer`, `TauCeti.SchemeAction.isLocallyClosed_orbit`).

## RT-LieHighestWeightPartII~1a/F06 (P3) — applied

The `SOM` title in `sources.toml` changed from "Nilpotent orbits and Weyl group representations" to "Notes on nilpotent orbits" (SOM lines 5–8). The key and URL are unchanged. The References entry now reads "Notes on nilpotent orbits … Preliminary notes for the workshop Computational Theory of Real Reductive Groups, 17 July 2009; §3.1, pp.15–16."

## RT-LieHighestWeightPartII~1b/F02 (P2) — applied

Scope now says the symmetry sign of `β_n` is the rank-one case of LieHighestWeight §5.1. A new ownership sentence names `TauCetiRoadmap.RepresentationTheory.LieHighestWeight.invariantForm_isSymm_iff_tits_sign`. The §2.1 parity bullet records the agreement (`2ρ∨ = h`, sign `(−1)^n`; `n = 1`: `−1`, `n = 2`: `+1`). §5.1 is added to the §2.1 Needs and the Layer 2 Dependencies.

## RT-LieHighestWeightPartII~1b/F03 (P2) — applied

Scope no longer calls GlobalShtukasAndFunctionFieldLanglandsPartII §8.0 a consumer. It says that section states the same recognition for Frobenius-fixed `ν`, that this earlier roadmap is the single owner of §5.5, and that the reduction is under Downstream consumers. There, "§8.0 is such a consumer" now reads "follows from §5.5 as follows". The sibling's edit is outside this package.

## RT-LieHighestWeightPartII~1b/F04 (P3) — applied

The LieHighestWeight and RootSystems contract paragraphs, and Scope, now describe the former layers by their native replacements: `TauCeti.Sl2Std.finrank_eigenspace_diag`, `LieAlgebra.IsKilling.finrank_rootSpace_eq_one`, `TauCeti.existsUnique_isDominantIntegral_highestWeight_of_finiteDimensional_irreducible`, `TauCeti.exists_isCompl_of_isKilling`, `TauCeti.existsUnique_dynkinType`, `TauCeti.specialLinearDiagonalCartan` and others. Every Needs and Dependencies line in §§1.3–5.4 that cited former layers 0–6 or 9 now names declarations (list below).

## RT-LieHighestWeightPartII~1b/F05 (P3) — applied differently

Scope, the §2.0 route and Needs, and the Tau Ceti contract now cite `TauCeti.isKilling_typeB`, `TauCeti.hasTrivialRadical_sp` and `TauCeti.instHasTrivialRadicalSl` with Cartan's criterion. The reviewer's `TauCeti.SpecialLinear.instHasTrivialRadicalSl` does not exist (declared in a `section`; `#check` confirms). I added `TauCeti.hasTrivialRadical_so'` for `typeD (Fin r)`, `r = 2, 3`, and simplicity through `LieAlgebra.IsKilling.isSimple_iff_isIrreducible`.

## RT-LieHighestWeightPartII~1b/F06 (P3) — applied

"pp.36–37" → "pp.35–37" for CH Tables 2–4: in README §3.5, in References and in the `CH` locator in `sources.toml`. The header row of Table 2 is CH line 1734, before the page-36 marker at CH line 1735.

## Checks run

**Elaboration.** `lake env lean packages/LieHighestWeightPartII/Suggested.lean`, run from the content checkout, exits 0 with 11 `declaration uses 'sorry'` warnings: the 9 earlier theorems and the 2 new ones. There are no errors. No `TauCeti.*` import needed building. The file has 303 lines, the single `import Mathlib` and the same six `TauCeti.*` modules, and no `set_option`, `lemma` or sorry'd data.

**`#check @name`.** I wrote one scratch file: a copy of `Suggested.lean`, 16 extra built Tau Ceti imports, `#check @name` for all 16 own declarations and 34 newly cited pinned names. It elaborated once with exit 0 and no errors.
- The 14 earlier declarations are unchanged.
- `exists_innerAut_iff_neutral_conjugate` keeps `[IsAlgClosed K] [CharZero K] [LieAlgebra ℚ L] [FiniteDimensional K L] [LieAlgebra.IsKilling K L]` and both triple hypotheses.
- `existsUnique_positiveRealPart` keeps `hH` and `hs`.
- Each matches its README statement.

Names whose modules have no object file at the pin were checked by reading their declaration and namespace in the pinned sources instead: `TauCeti.isKilling_typeB`, `TauCeti.specialLinearDiagonalCartan`, `TauCeti.instIsCartanSubalgebraSpecialLinearDiagonalCartanOfNoZeroDivisors`, `TauCeti.hasTrivialRadical_so`, `TauCeti.hasTrivialRadical_so'`, `TauCeti.stabilizer`, `TauCeti.SchemeAction.smooth_stabilizer`, `TauCeti.SchemeAction.isLocallyClosed_orbit`. The last is in `AlgebraicGeometry/GroupAction/LocallyClosed.lean`.

**Dependency check** (command of the brief):

```text
depcheck: 239 roadmaps, 2172 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

**Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name "found nowhere".

## Gate failures

None were listed for this round.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| `exists_innerAut_iff_neutral_conjugate` | `L = 0`; `sl₂` `(H,E,F)` vs `(H,cE,c⁻¹F)`; `(H,E,F)` vs `(0,0,0)`; `sl₃` minimal vs regular; `so(8)` `(4,4)` pair | identity, both sides true; `Ad(diag(c^½,c^−½))`, both true; `φ(H)=0` impossible for invertible `φ`, both false; ad-spectra `{±2,±1,0}` vs `{±4,±2,0}`, both false; `h_I`, `h_II` not inner-conjugate, both false | true; no change |
| `existsUnique_positiveRealPart` | trivial `H = ℂ`; `G_m`, `s = 2i`, `s = i`; `SL₂` `diag(z,z⁻¹)`; unipotent `u` (excluded by `hs`) | `r = 1`; `r(t)=2`, `r(t⁻¹)=½`, and `r = 1`; `diag(|z|,|z|⁻¹)`; `u` and `1` both satisfy the predicate | true; `hs` is necessary for uniqueness (§5.4 Check); holds without `hH` (note below) |
| `gap:orbit-map-differential` | `SL₂` on `K²` at `e₁`; `G_m` scaling at `1`, `0`; char `p`, `t·x = t^p x` | `[[a,b],[c,−a]] ↦ (a,c)` onto, kernel `K E₁₂` = Lie of stabilizer, orbit `K²∖0` open; derivative `1`, orbit `K^×` open, and `0`, orbit `{0}` not open; derivative `p = 0`, orbit `K^×` open, stabilizer `μ_p` with Lie algebra `K` | true; the converse fails and is not claimed; added as Checks |
| §0.3 `Lie(G_h) = L_0` | `sl₂`, `h = H`; `h = 0` | `ker(u ↦ [u,H]) = KH = L_0`; `ker = L = L_0` | true |
| §2.0 Killing coverage | `sl(0)`, `sl(1)`; `sp(∅)`; `typeB ∅`; `typeD (Fin 1)`; `typeD (Fin 2)`, `(Fin 3)` | zero algebras, trivially Killing; `so(2)` 1-dim abelian, not Killing (`so'` needs ≥ 3 indices, `2 < 3`); 4 and 6 indices, `hasTrivialRadical_so'` applies | true; ranks `r = 2, 3` now covered |
| §2.0 simplicity | `D_2`; `D_3`; `B_1`, `C_1` | `±(ε₁−ε₂)`, `±(ε₁+ε₂)` orthogonal, reducible; `D_3 = A_3` irreducible; `= A_1` | "simple except `so(4)`" unchanged |
| §2.1 sign vs LieHighestWeight §5.1 | `V(1)`, `V(2)`, `V(0)` | `[[0,1],[−1,0]]`, `(−1)¹`; anti-diagonal `(1,−1,1)`, `(−1)²`; `[1]`, `(−1)⁰` | agree |
| §3.1 Chevalley transport | `sl₂`, `H = KH` | invariant `κ(x,x)` restricts to `8t²` on `tH`; `W = {±1}`; even polynomials reached | true |
| §3.5 principal | `E₈`, `F₄`, `G₂` at `(2,…,2)` | `i_max = 58, 22, 10`; `D_0 = D_2 = 8, 4, 2`; `D_odd = 0` | matches the computation and all 91 CH rows (row sums `dim L`, `i_max` = length − 1) |
| §3.5 `F₄` minimal pair | `(1,0,0,0)`, `(0,0,0,1)` | `D = (22,14,1)`, `(22,8,7)`; orbit dimensions `16`, `22` | true |
| §3.4 `G₂` separation | `0,(0,1),(1,0),(0,2),(2,2)` | `D_0 = 14,4,4,4,2`; `D_1 = 4,2,0` on the three with `D_0 = 4` | pairwise distinct |
| §1.4 tensor/dual | `V(1)⊗V(1)`; `V(1)*` | weights `±1+±1 = 2,0,0,−2`; weights `∓1` | true |
| §4.1 simple ideals | `sl₂ × sl₂`; `L = 0` | two atoms, independent, sup `L`; no atoms, `sSup ∅ = ⊥ = L` | true |
| `exists_conj_positiveRealPart_of_weightPattern_eq` (vacuity) | any semisimple `s, s'` | `r(s)`, `r(s')` supplied by the new headline | non-vacuous |

## Ownership and overlap

The two new Lean names match no declaration on main or at any open head (`roadmaps grep --fixed`). §0.3 and §§5.3–5.5 were already owned here; this round adds their Lean statements and no new ownership. The open-orbit criterion is assigned to ReductiveGroups §3A as a gap: searches of main and the open heads for an owner of "surjective differential ⇒ open orbit" over a general algebraically closed field found none. NilpotentOrbits N2.2 has it over `ℂ` only. `overlaps.md` lists only this roadmap's own pull request; no cited id is dropped by an open revision.

## For the maintainer

- **GlobalShtukasAndFunctionFieldLanglandsPartII §8.0** (open, later in the merge order) proves weight recognition itself and does not cite this roadmap. To end the double ownership, it should cite §§5.3–5.5 here and keep only its normalization, relative-Weyl and Aubert items. That edit is outside this package.
- **New supplier gap** `gap:orbit-map-differential`, addressed to ReductiveGroups §3A: the stabilizer Lie algebra is the kernel of the orbit differential, and a surjective differential gives an open orbit. It is used in §0.3.
- **Generality of `existsUnique_positiveRealPart`.** It also holds without `hH`, through the Zariski closure of `⟨s⟩`, a diagonalizable group. I kept the reductive hypothesis to match the §5.4 route through a maximal torus and the CH setting. This is a note, not a defect.
- **`design/plan.json` outside `gaps`.** Its node and source records still carry the old SOM title, at plan lines 170 and 2328. This job may change only the `gaps` list there.
- **Renamed names.** No name that other roadmaps cite changed. Two Lean names were added: `exists_innerAut_iff_neutral_conjugate` and `existsUnique_positiveRealPart`. No section was renumbered.
- **Needs lines rewritten for 1b/F04:**
  - §§1.3–1.4 and the Layer 1 Dependencies;
  - §§2.0–2.3 and the Layer 2 Dependencies;
  - the Layer 3 intro, §§3.1, 3.2 and 3.4, and the Layer 3 Dependencies;
  - §4.1 and the Layer 4 Dependencies;
  - §5.2 and the Layer 5 Dependencies;
  - the SpinRepresentations contract.

  RootSystems no longer appears in any Needs line. Its contract paragraph maps its former Layers 4–6 to the native declarations.
- **No suspicious instructions** were found in the reviews or the fetched texts.
