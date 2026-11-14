# Repair report: FIX-DESIGN-CohomologyOfGroups~6

Files changed:

- `packages/CohomologyOfGroups/design/README.md`
- `packages/CohomologyOfGroups/design/plan.json`

`packages/CohomologyOfGroups/sources.toml` is unchanged: no new work is cited (6.8 keeps its Loh19
locators; the new supplier is a roadmap on main, not a source).

One review (`REV-DESIGN-CohomologyOfGroups~5`), five findings, all P3. Each was checked against the
cited roadmap text (main or the open head), the pinned Mathlib and Tau Ceti, and the cached sources
before any edit. The design stage has no `Suggested.lean`. So no Lean declaration was added, changed
or elaborated, and the `#check @name` binder audit has nothing to run on. The review's "For the
human reviewers" section raises no finding and changed nothing. No text read in this job contained
instructions.

## F01 (P3) — applied differently

Old: "`H₂(G, ℤ) ≅ (R ⊓ ⁅F, F⁆) ⧸ ⁅F, R⁆`", reached through the `d²` of 6.7 (*Needs:* 6.7, the gap).
New: an explicit map `h` (lift a 2-cycle to `F`, take its boundary, send `[x] − [y] ↦ xy⁻¹`). It is
proved an isomorphism by a direct chain-level route. Added a naturality bullet, a §3.29 comparison
bullet, a normalisation Check (`⁅a, b⁆⁻¹`), and a contract for StableHomotopyKTheory §3.29.

Why "differently":

- **(i) and (ii) are applied as asked.** The map is the reviewer's, and so is the Check.
- **The route changed.** Defining the map is not enough if the isomorphism is still proved through
  6.7's `d²`. That differential reaches this roadmap through `gap:homological-low-degree`, and
  DerivedModuleAlgebra §S.1 states no sign for it. So 6.8 now gets its isomorphism from the
  connecting map of `0 → K → C(F) → C(G) → 0`. That route needs neither 6.7 nor the gap.
- **(iii) is applied in a weaker form.** StableHomotopyKTheory §3.29 on main (README lines
  1347–1349) says to "identify the supplied presentation kernel (R∩[F,F])/[F,R] with H₂(P;ℤ),
  naturally under presentation comparisons", but it fixes no map. "`h` *is* §3.29's
  identification" therefore cannot be checked. The bullet says instead that `h` is an
  identification of the kind §3.29 states, that §3.29 leaves the map unfixed, and that `h` fixes
  it.

Verification (by hand):

- **The differential at the pin.** In Mathlib's chains
  (`groupHomology.inhomogeneousChains.d_single`, `…/GroupHomology/Basic.lean:132`),
  `d(a[x|y]) = (x⁻¹·a)[y] − a[xy] + a[x]` and `d[x] = 0` for trivial coefficients.
- **`φ : K₁ → R/⁅F,R⁆` is well defined.** It is the restriction of `[x] ↦ x·σ(x̄)⁻¹` for any
  section `σ`, because `(xσ⁻¹)(yσ⁻¹)⁻¹ = xy⁻¹`.
- **`φ` kills `d(K₂)`.** Take `x = r₁x′`, `y = r₂y′`. Then
  `d([x|y] − [x′|y′]) = ([x] − [x′]) + ([y] − [y′]) − ([xy] − [x′y′])` maps to
  `r₁r₂(r₁x′r₂x′⁻¹)⁻¹ = r₁⁅r₂, x′⁆r₁⁻¹ ∈ ⁅F, R⁆`.
- **`ψ(r) = [r] − [1]` is a homomorphism `R/⁅F,R⁆ → H₁(K)` and is onto:**
  - `d([r|r′] − [1|1]) = [r] + [r′] − [rr′] − [1]`, so `ψ` is additive.
  - `d([f|r] − [f|1]) = [r] − [fr] + [f] − [1]` and
    `d([fr|f⁻¹] − [f|f⁻¹]) = [fr] − [frf⁻¹] − [f] + [1]` give `[frf⁻¹] ≡ [r]`, so `ψ` kills
    `⁅F, R⁆`.
  - `d([r|y] − [1|y]) = [y] − [ry] + [r] − [1]`, so `ψ` is onto.
  - `φψ = id`, so `ψ` and `φ` are mutually inverse.
- **The maps to `F^ab` agree.** `H1AddEquivOfIsTrivial` (`…/LowDegree.lean:1019`, "`⟦single g a⟧ ↦
  ⟦g⟧ ⊗ a`") sends `[x] − [y]` to `xy⁻¹`. Through `φ`, that is the inclusion `R/⁅F,R⁆ → F^ab`.
- **Conclusion.** `H₂(F) = 0` (3.6), so the long exact sequence makes `h` injective, with image
  `ker(R/⁅F,R⁆ → F^ab) = (R ∩ ⁅F,F⁆)/⁅F,R⁆`.
- **The witness.** The lift `[a|b] − [b|a]` has boundary `[ba] − [ab]`, and
  `ba(ab)⁻¹ = bab⁻¹a⁻¹ = ⁅b, a⁆ = ⁅a, b⁆⁻¹` with Mathlib's `⁅x, y⁆ = xyx⁻¹y⁻¹`
  (`Algebra/Group/Commutator.lean:46`). The same `z` pairs to `+1` with `x ∪ y` (Conventions), so it
  generates `H₂(ℤ², ℤ)`, and its image `⁅a, b⁆⁻¹` generates `⁅F,F⁆/⁅F,⁅F,F⁆⁆ ≅ ℤ`, as an
  isomorphism must. `y⁻¹x` gives the same class as `xy⁻¹`, since `xy⁻¹ = y(y⁻¹x)y⁻¹`.
- **Agreement with K2SymbolsBrauer.** K2SymbolsBrauer §1.1 at its open head fixes its Hopf map by
  the same bar formula and the same relative-cycle rule. It gets `[s|t] − [t|s] ↦ [s,t]⁻¹`, so the
  two roadmaps agree.

Pattern repaired:

- **README.**
  - Scope bullet on StableHomotopyKTheory: now says 6.8 fixes the map and compares with §3.29.
  - New Mathlib contract bullet for `groupHomology.inhomogeneousChains`,
    `groupHomology.H1AddEquivOfIsTrivial` and `CategoryTheory.ShortComplex.ShortExact.δ`.
  - New "From TauCetiRoadmap.StableHomotopyKTheory" contract.
  - Layer 6 Dependencies.
  - DerivedModuleAlgebra gap contract: "Targets 6.3, 6.4 and 6.7 use them".
- **Plan.**
  - 6.8: statement, prerequisites (dropped `target:6.7` and `gap:homological-low-degree`; added
    the three Mathlib names and `roadmap:StableHomotopyKTheory §3.29`), API entries `hopf_natural`
    and `hopf_perfect`, and the new test `hopf_normalisation`.
  - New StableHomotopyKTheory supplier entry.
  - The gap's `neededBy` is now `6.3, 6.4, 6.7`.
- **Other maps given only up to isomorphism.** I looked for other isomorphisms whose Checks
  compute only isomorphism types. 1.5 (`Θ₁` sign Check), 3.6 (difference vs sum), 6.6 (`d₂ = −c ∪`)
  and 8.4 (`1 ↦ u`) already pin their maps. The `d²` of 6.7 is the supplier's (gap) and is no
  longer used to normalise 6.8.

## F02 (P3) — applied

`G : Type u` → `G : Type` in README 8.4 and in plan 8.1, 8.3, 8.4 and 8.5. `S : Type u` →
`S : Type` in plan 6.8 (README 6.8 now says `S : Type`). The Conventions universe bullet adds: the
carriers take the ring and the group in one universe, so for `k = ℤ` (or `ℤ_(p)`) the group lies
in `Type`.

Verification at the pins:

- Mathlib `…/GroupCohomology/Basic.lean:73` has `variable {k G : Type u}`.
- `…/GroupHomology/Basic.lean:120` has `{k G : Type u}`.
- `…/TateCohomology/Basic.lean:58` has `{R G : Type u}`.
- Tau Ceti `…/TateCohomology/Character.lean:59` has `variable (G : Type)`.
- `…/Cup/Cyclic.lean:57` has `{G : Type} [CommGroup G]`.
- `Rep` itself (`Rep/Basic.lean:30`) allows `k : Type u`, `G : Type v`. It is the carriers, not
  `Rep`, that force one universe, and the bullet says so.

Pattern repaired:

- The Layer 8 preamble now says "`G` is finite, in `Type`".
- The 5.4 integral comparison now has "`k = ℤ` (so `A : Type`)", and plan 5.4 gains the
  hypothesis "`k = ℤ` clauses: `A : Type`".
- Statements over a general `k` (3.6 `S : Type u`, 1.5, 7.2) keep `Type u`. Their integral
  instances are covered by the new Conventions sentence.

## F03 (P3) — applied

Old: "The `r`-period there is the least `d ≥ 2` … (Hutchinson13 line 494–497)", given as §5.2's
content.

New: §5.2 uses the `r`-period without defining it, and Hutchinson13 line 494–497 calls every such
`d` a period. "Assumed of §5.2: its `r`-period is the least such `d`". The `S₃` witness
(`d = 4` and `d = 8`) is added.

The 8.4 text, the 8.4 comparison bullet and plan 8.4 (statement and `pPeriod_eq_K3`) now say "under
the assumption of the Exact supplier contracts". So does the plan's K3BlochGroups supplier entry.

Verification:

- **K3BlochGroups at its open head.** §5.2 ("Unstable special-linear homology", heading at line
  1856 of its README) has, at `finiteGroup_period_fromSylow` (line 1871), only "its r-period is
  twice the order …". No definition of the period occurs anywhere in that file (searched for
  "period").
- **Hutchinson13.** Line 494–497 introduces "a number `d ≥ 2`" with the periodicity property and
  calls it the period. It does not say "least".
- **The `S₃` values.** The integral homology is `ℤ/2, 0, ℤ/6, 0, ℤ/2, 0, ℤ/6` in degrees `1–7`.
  The `3`-parts are nonzero only in degrees `3` and `7`, so `d ∈ {4, 8, …}`. Swan's value is
  `2·|S₃/A₃| = 4`, the least.

I did not adopt the review's phrase "the minimal `d` of Hutchinson13 line 494–497", because
Hutchinson does not single out a minimal `d`.

## F04 (P3) — applied

Added "§4.8: the structure theorem …, with its instance that `SL(2, ℤ)` … recovers
`ℤ/4 ∗_{ℤ/2} ℤ/6`; cited … in a Check of 3.6" to the FreeGroupsAndLimitGroups contract. Added
"§5.4: the homology of the torus `Tⁿ` as the exterior algebra on its first homology, compared with
… a Check of 5.4" to the AlgebraicTopology contract. Both are now in the Dependencies of Layers 3
and 5, and in the plan supplier descriptions.

Verified on main:

- `TauCetiRoadmap/FreeGroupsAndLimitGroups/README.md` line 937 has the §4.8 heading, and line 946
  has the `SL(2, ℤ)` sentence.
- `TauCetiRoadmap/AlgebraicTopology/README.md` line 2005 has the §5.4 heading ("Torus homology"),
  with the exterior-algebra statement.
- At the open revisions of FreeGroupsAndLimitGroups (two heads), §4.8 keeps its number and text.

## F05 (P3) — applied

- **8.1.** ", which is not restated here" was deleted. The comparison sentence stays.
- **6.8.** The whole sentence "The low-degree sequence of a central extension is
  InductionRestrictionPartII RS.0.1's and is not restated here" was deleted. Once the phrase goes,
  what is left is a pure ownership remark with no comparison. The Scope bullet on RS.0.1 already
  carries it.
- **Plan 6.8.** The matching sentence "The central-extension sequence is InductionRestrictionPartII
  RS.0.1's" was deleted from the statement.
- **Pattern search.** "not restated" now occurs only in Scope and ownership (the quaternion
  clause), where ownership statements belong. No other layer text carries an ownership remark of
  this kind. 8.4's "Swan's theorem … is K3BlochGroups §5.2's" names the imported input of 8.5 and
  stays.

## Checks run

Dependency check (the command of the brief), complete output:

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2173 edges, 0 problem(s)
```

- **Dependency check.** It reports no UPWARD and no CYCLE line. There is one more edge than in
  round 5 (2172 → 2173): the new citation of StableHomotopyKTheory §3.29, which is on main.
- **`roadmaps resolve`** on the README finds no cross-roadmap citation and no Lean name "found
  nowhere". The tool did not check names outside TauCetiRoadmap. I checked the new Mathlib names by
  hand at the pin:
  - `groupHomology.inhomogeneousChains` (`…/GroupHomology/Basic.lean:153`);
  - `groupHomology.inhomogeneousChains.d_single` (line 132, in namespace
    `groupHomology.inhomogeneousChains`);
  - `groupHomology.H1AddEquivOfIsTrivial` (`…/LowDegree.lean:1019`, namespace `groupHomology`);
  - `CategoryTheory.ShortComplex.ShortExact.δ` (`Algebra/Homology/HomologySequence.lean:282`,
    inside `namespace CategoryTheory`, `ShortComplex`, `ShortExact`).
- **`plan.json`** parses as JSON. The only fields changed are those listed above.
- **Lean.** Nothing was elaborated: the design stage has no `Suggested.lean`, so the `#check` binder
  audit is not applicable.
- **Duplication.**
  - There is no Hopf formula in pinned Mathlib or Tau Ceti: case-insensitive grep for
    "Hopf's formula", "hopfFormula" and "Hopf formula" over both trees.
  - StableHomotopyKTheory §3.29 (main) owns the perfect-group identification without a fixed map.
    It is now a declared supplier, used for the comparison only.
  - InductionRestrictionPartII RS.0.1 owns the central-extension sequence (Scope).
  - K2SymbolsBrauer §1.1 consumes a calibrated Hopf map and agrees with `h`.
- **Ownership against open pull requests** was checked with `roadmaps grep`, `roadmaps show` and
  `roadmaps list`. No open pull request revises StableHomotopyKTheory (only its Part II is open, as
  a new roadmap).

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| 6.8 `h` is an isomorphism | `S = ∅`; `R = F`; `R = 1`; `G = ℤ/n` (`F = ℤ`, `R = nℤ`); `G = ℤ²`; `G = (ℤ/2)²` | `0 = 0`; `H₂(1) = 0 = (F∩[F,F])/[F,F]`; `H₂(F) = 0 = 1/1`; `0 = (nℤ ∩ 0)/0`, model without `∩` gives `ℤ`; `ℤ ≅ [F,F]/[F,[F,F]]`; `ℤ/2`, `h[z] = ⁅a,b⁆⁻¹ = ⁅a,b⁆` (order 2) | true; the route's four identities recomputed (F01 section) |
| 6.8 normalisation Check | `ℤ²`, lift `[a|b] − [b|a]`; variants `yx⁻¹`, `y⁻¹x` | `d = [ba] − [ab]` (`x = ba`, `y = ab`), `h[z] = xy⁻¹ = bab⁻¹a⁻¹ = ⁅a,b⁆⁻¹`; `yx⁻¹` gives `⁅a,b⁆`, the other generator of `ℤ`; `y⁻¹x = b⁻¹a⁻¹ba` is the conjugate of `xy⁻¹` by `y⁻¹`, the same class in `R/⁅F,R⁆` | fixes the map; the inversion model is excluded |
| 6.8 naturality bullet | `α : F → F′`, `α(R) ⊆ R′`; identity | lift of `ᾱ_*z` is `α_*z̃`; `φ′(α[x] − α[y]) = α(x)α(y)⁻¹ = α(xy⁻¹)`; identity gives `h` | true |
| 6.8 perfect comparison | `G = 1`; `A₅` (`SL₂(𝔽₅)`); `A₆`; non-perfect `G = ℤ` | kernel `0 = H₂`; `{±I} ≅ ℤ/2 = H₂(A₅)`, sign invisible; `H₂(A₆) = ℤ/6`, sign visible, so the bullet says `h` fixes it; for `ℤ`, `[F,F]/[F,R] = 0 → ℤ` not onto, so perfectness is needed | true; claims no equality with §3.29's unnormalised map |
| Conventions universe bullet | `k = ℤ : Type`, `G : Type 1` | `Rep ℤ G` exists (`Rep/Basic.lean:30` has separate `u`, `v`), `groupCohomology` needs `{k G : Type u}`, so it fails to elaborate; `G : Type` matches `Character.lean:59` | true; says the carriers, not `Rep`, force it |
| 5.4 integral clause `A : Type` | `k = ℤ`, `A = ℤ/2 × ℤ/2` | `H₂ = Λ² = ℤ/2`, with `A : Type` | consistent |
| 8.4 `G : Type` (cyclic clause) | `ℤ/m`, `m = 1, 2` | `Ĥⁿ = 0` for `m = 1`; `Ĥ² = ℤ/2` for `m = 2`; Tau Ceti lemma at `G : Type` | consistent with the pin |
| K3 contract: least `d` | `S₃`, `r = 3`; `r = 2`; `Q₈`, `r = 2` | `H₁, …, H₇` `3`-parts `0,0,ℤ/3,0,0,0,ℤ/3`, so `d ∈ {4, 8}` and least `4 = 2·|S₃/A₃|`; `H₁(S₃,ℤ_(2)) = ℤ/2`, so `d = 2`; `H₁ = (ℤ/2)²`, `H₂ = 0`, `H₃ = ℤ/8`, so `d = 4` | "least" needed and sufficient; agrees with 8.4 Checks |
| 8.4 comparison bullet | `S₃`, `p = 3`; `p ∤ |G|` | `Ĥ⁴(S₃,ℤ)(3) = ℤ/3 ↔ H₃(S₃,ℤ_(3)) = ℤ/3`, `d = 4` on both sides; excluded by `p ∣ |G|` | true |
| 8.1 comparison sentence (unchanged mathematics) | `G = ℤ/2`, `i = 1` | `Ĥ¹(ℚ/ℤ) ≅ H²(ℤ) = ℤ/2 = Hom(H₁, ℚ/ℤ)` | true |
| Mathlib contract `d(a[x|y])` | trivial `a`; `x = 1` | `[y] − [xy] + [x]`; `d(a[1|y]) = a[y] − a[y] + a[1] = a[1]` | matches `d_single` (`Fin.contractNth`) |
| FreeGroups §4.8, AlgebraicTopology §5.4 contracts | `ℤ/4 ∗_{ℤ/2} ℤ/6`; `ℤⁿ`, `n = 0, 1, 2` | `H₁ = ℤ/12` (3.6 Check); ranks `C(n, i)`: `1`; `1, 1`; `1, 2, 1` | consistent with the 3.6 and 5.4 Checks |

## For the maintainer

- 6.8 no longer depends on 6.7 or on `gap:homological-low-degree`. The gap is still declared, now
  for 6.3, 6.4 and 6.7. If DerivedModuleAlgebra §S.1 later fixes the sign of the homological `d²`,
  comparing it with `h` will be a Check, not a dependency.
- New supplier: StableHomotopyKTheory §3.29, on main, so no merge-order consequence.
- No id of this roadmap changed: no target was renumbered or renamed, and the plan name
  `TauCeti.groupHomology.hopfFormula` is kept.
- K2SymbolsBrauer §1.1 (open, earlier in the merge order) calibrates its Hopf map by the same rule
  as `h`. Nothing there needs to change.
- An open **draft** revision of AlgebraicTopology (pull request 1808, which also touches other
  roadmaps) rewrites that roadmap into "Stages". It has no `§5.3`, `§5.4` or `§8.15` headings and
  no old → new map for them. Its "Renamed targets" table covers only Stage 8 and Stage 4 names.
  - This roadmap cites those three sections. §5.3 and §8.15 were cited before this round, and
    §5.4 already appeared in a Check.
  - The other open revision of AlgebraicTopology that carries its README keeps all three. The
    worker's overlap index lists no dropped id.
  - If the draft is taken out of draft without a numbering map, these citations need remapping.
    That is a decision outside this package.
