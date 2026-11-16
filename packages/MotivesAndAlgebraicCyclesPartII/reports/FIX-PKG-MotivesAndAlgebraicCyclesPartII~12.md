# FIX-PKG-MotivesAndAlgebraicCyclesPartII~12: repair report

Review settled: `REV-PKG-MotivesAndAlgebraicCyclesPartII~11` (two findings, both P2). Files changed: `packages/MotivesAndAlgebraicCyclesPartII/README.md`; `packages/MotivesAndAlgebraicCyclesPartII/design/plan.json` (top-level `gaps` list only). `Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged.

## F01 (P2) — applied

The finding is right: the old route sentence of §10.5 shared an 18-word run with Scholze lines 2438–2441, and the next clause followed the source's order. I replaced the two sentences from "Writing `O_C` as" to "of §10.3." with a finite-level argument in new words: total ramification gives `O′ = k[[u]]`; dévissage `K(X) ≃ K(X_{O′} on X)`; the weight shift by one; transition maps are multiplication by `e`; continuity and completion. I added three Checks.

I applied the suggested repair differently in its citations. The review's text cites SchemeKTheoryOperations §6.11 for the dévissage identification and §3.8 for continuity. At its head, §6.11 is only the weight shift. Dévissage with regular support is §3.5 ("If Z itself is regular, `Ri_*` further identifies K(Z) with the supported spectrum"), and continuity along affine limits is §2.7. Completion with supports is §3.4 (infinitely-near flat maps) and §3.8 (derived closed-fibre excision). The multiplication by `e` needs additivity, which is GeneralAlgebraicKTheory §4.3. The new route cites these sections.

**Pattern.** I compared the whole README mechanically with the five cached sources at a 9-word threshold. Outside formulas, forced statements and the bibliography, nothing reaches 12 words:
- 13 words at README:895: a statement plus formula letters;
- 14 words at :1107 and :1367: Lean-style formula statements;
- 15 words at :1498 and 12 words at :1501: bibliography lines.

The new §10.5 text shares at most 3 consecutive words with Scholze lines 2422–2441.

**Other places changed.**
- The SchemeKTheoryOperations and GeneralAlgebraicKTheory contract now lists SchemeKTheoryOperations §2.7 and §3.5 and GeneralAlgebraicKTheory §4.3, each with what is assumed of it.
- The Scope bullet now names additivity, continuity and dévissage, with GeneralAlgebraicKTheory §4.3 and SchemeKTheoryOperations §§2.6–2.7.
- The §10.5 *Needs* line adds §3.2, SchemeKTheoryOperations §§2.7, 3.4 and 3.5, and GeneralAlgebraicKTheory §4.3.
- The Layer 10 *Dependencies* line now has the same additions.

## F02 (P2) — applied

The finding is right. On main, `TauCetiRoadmap/AdicSpacesPartIII/README.md` §R3.5 (heading at its line 10179; target *sheafy-tate-acyclicity-and-kiehl-gluing* at line 10289) proves the following. For a complete sheafy Tate Huber pair and a rational subset `U = Spa(B, B⁺)`, `P ↦ P̃` is an equivalence from finite projective `B`-modules to vector bundles on `U`. Line 10299 adds that for an affinoid `K`-algebra `A`, vector bundles on `Spa(A, A°)` are finite projective `A`-modules, and that line bundles on the closed disc are trivial. Its convention 4 makes `K` nontrivially valued.

The gap's only use is in §3.3, at a nondiscrete algebraically closed `C`. There `C⟨T⟩` is affinoid over such a field, and TropicalAndBerkovichArithmetic §0.30 (at its head, line 850) identifies strict affinoid charts, intersections and glued structure sheaves of `M(A)` and `Spa(A, A°)`. The trivially valued case covered by the gap's wording is never used.

Open pull request #1807 changes AdicSpacesPartIII, but its head keeps the §R3.5 heading and the target name (its line 9749 and its line 9859).

**Changes.**
- Removed the `What TropicalAndBerkovichArithmetic must provide (gap:affinoid-line-bundles)` paragraph.
- Added a "From TauCetiRoadmap.AdicSpacesPartIII" contract subsection, written in my own words.
- The §3.3 *Needs* line now cites AdicSpacesPartIII §R3.5 and TropicalAndBerkovichArithmetic §0.30.
- The Layer 3 *Dependencies* line now lists §0.30, §R3.5 and only the gap animated-group-completion.
- Added a Scope sentence on AdicSpacesPartIII §R3.5.
- Removed the `affinoid-line-bundles` entry from the `gaps` list of `design/plan.json`.

The README and the plan now agree on eight gaps; I compared both slug lists.

## Checks

- **Elaboration.** `lake env lean packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, run from the content checkout, exited 0 with no output. The file is unchanged: `import Mathlib`, the module docstring and an empty namespace.
- **`#check @name` audit.** `Suggested.lean` declares no names, so there is nothing to compare and nothing changed.
- **Dependency check** (`gate --depcheck … --movable`):

  ```text
  depcheck: 251 roadmaps, 2396 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line. AdicSpacesPartIII is on main. SchemeKTheoryOperations (merge order line 37) and GeneralAlgebraicKTheory (line 18) are earlier than this roadmap.
- **`roadmaps resolve`** on the README: no cross-roadmap citation and no Lean name found nowhere. The resolver checked main and 462 open heads.
- **New citations read at their heads.**
  - SchemeKTheoryOperations at its open head: §2.7 (continuity), §3.4 (infinitely-near excision, including completion), §3.5 (dévissage with regular support), §3.8 (closed-fibre excision), §6.11 (`ψ^k j_* = k^c j_* ψ^k` for trivial conormal).
  - GeneralAlgebraicKTheory at its open head: §4.3 (additivity, including finite filtrations).
  - AdicSpacesPartIII on main: §R3.5.
- **Gate failures listed in the brief:** none.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §10.5: a finite `K′/k((T))` is totally ramified with `O′ = k[[u]]` | `k` of characteristic 0, `K′ = k((T^{1/2}))`; `k = 𝔽̄_p`, the Artin–Schreier extension `x^p − x = T⁻¹` | residue field `k` in both; `e = 2` and `e = p` = degree; `O′ = k[[T^{1/2}]]`, and `k[[1/x]]` with `T = (1/x)^p/(1 − (1/x)^{p−1})` of valuation `p` | holds; Cohen structure needs `k ⊂ O′` as coefficient field, which is stated |
| §10.5: `i′_* : K(X) ≃ K(X_{O′} on X)` | `X = Spec k` | `K₀(O′ on (u)) = ℤ·[O′/(u)]`, `[k] ↦ [O′/(u)]`; `X_{O′} = Spec k[[u]]` regular | holds (SchemeKTheoryOperations §3.5 needs `X_{O′}` regular noetherian and `X` regular: both hold since `X` is smooth projective) |
| §10.5: weight shift by one | `X = Spec k`; codimension `c = 1`, trivial conormal | `ψ^n [O′/(u)] = n [O′/(u)]`, so weight 0 → weight 1; `ψ^n i_* = n i_* ψ^n` | holds; this matches the weight of `ℤ(1)[1]` (new Check 1) |
| §10.5: transition is multiplication by `e` | `e = 2`; `e = 1` | `O″/(u) = k[[v]]/(v²)`, filtration `v·O″/(u) ≅ k`, quotient `k`: `[O″/(u)] = 2[O″/(v)]`; `e = 1`: identity | `×2` on `K₀(k) = ℤ` is not an isomorphism integrally; the route asserts the identification only rationally (new Check 2) |
| §10.5: continuity and completion | `O^∪ → O_C` | `O_C` is torsion-free over a valuation ring, hence flat; `O^∪/T ≅ O_C/T` | holds (SchemeKTheoryOperations §3.4 infinitely-near flat map; §3.8 derived closed fibre) |
| §10.5: cofibre for `X = Spec k` | `i^* i_*` on `K_*(k)` | `[O′/(u)] ↦ [k] − [k] = 0` via `O′ --u--> O′`; projection formula through the split surjection `K(O′) → K(k)` gives `i^* i_* = 0` | rational cofibre `K(k)_ℚ ⊕ K(k)_ℚ[1]`; weight-one `π₁ = (k^× ⊗ ℚ) ⊕ ℚ` equals `Ḡ_m(C) ⊗ ℚ` (extension of `|C^×| ≅ ℚ` by `k^×`, §3.2 Check 3), the `π₁` of `ℚ(1)[2]` at `C` |
| §10.5 Check 1 as I first drafted it | general algebraically closed `k` | first draft: "`K(X_{O_C} on X)_ℚ = ℚ`"; but `K₁(k)_ℚ = k^× ⊗ ℚ ≠ 0` for `k = ℂ` with the trivial norm | false in general; restated on `π₀` |
| AdicSpacesPartIII §R3.5 for §3.3 | `A = C⟨T⟩`, Laurent cover `{|T| ≤ |t|}`, `{|t| ≤ |T| ≤ 1}`, `0 < |t| < 1` | both pieces are strict rational subsets; `C⟨T⟩` affinoid over a nontrivially valued field, hence covered by §R3.5's affinoid clause; rank-one projective over a PID is free (Tau Ceti `TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring`, `c = 1`) | holds |
| AdicSpacesPartIII §R3.5: degenerate field | trivially valued `K` | outside AdicSpacesPartIII convention 4; §3.3 uses only nondiscrete `C` (a geometric Banach point) | the contract says "nontrivial rank-one absolute value"; nothing uses the trivially valued case |

## Ownership and direction

- No new construction is owned here. The F01 route cites existing sections of SchemeKTheoryOperations and GeneralAlgebraicKTheory, both earlier in the merge order.
- F02 moves an assumed input from a declared gap on TropicalAndBerkovichArithmetic to AdicSpacesPartIII on main. That is a downward citation.
- Nothing moved down from a later roadmap.

## For the maintainer

- `gap:affinoid-line-bundles` is withdrawn from this package's `design/plan.json` and README. The review notes that the intake had announced this gap to TropicalAndBerkovichArithmetic. Whether that announcement must be retracted, and whether a package-stage repair may withdraw an announced gap, is a process decision for the humans. Nothing in this package depends on TropicalAndBerkovichArithmetic supplying it any longer.
- No name that other roadmaps cite changed: no section, layer or target id of this roadmap was renumbered or removed.
- No suspicious instruction was found in the review text.
