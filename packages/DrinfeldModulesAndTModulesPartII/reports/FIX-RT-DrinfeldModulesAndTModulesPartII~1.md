# FIX-RT-DrinfeldModulesAndTModulesPartII~1: repair of red-team round 1

Two reviews were merged: review a (findings F01–F03) and review b (findings F01–F05). They do not overlap, so each is settled once below; both reviews number from F01, so each section opens by naming its review. Files changed: `packages/DrinfeldModulesAndTModulesPartII/README.md` and `packages/DrinfeldModulesAndTModulesPartII/Suggested.lean`. `design/plan.json`, `sources.toml` and `metadata.toml` are unchanged: no new supplier gap is needed, and every locator added is already inside a manifest entry's recorded locator range.

## F01 (P1) — applied

Review a: §3.9 (b) route, old: “follows by Chang Theorem 5.5.2 (ζ_A(s) = Γ_s⁻¹Σ_u a_u Li_s(u) …) and §3.8”. New: choose a K-basis V_w of Z_w made of MZVs. The MZ property (§3.8) and the first descent statement make the sum direct, and §1.7 identifies the K̄-span with 𝒵. CMPL values use K-bases of monomials.

Related edits: statement (b) now defines the CMPL grading by monomials; Needs gains §1.7 and §0.9; the Layer 3 dependencies change from “0” to “0, 1”.

Evidence: CHANG14 line 968 shows Chang proves Theorem 2.2.1 through Theorem 5.5.2 (CHANG14 lines 919–930), which no target or gap states. The roadmap does not need it, because §3.8 (Q = H, c = Γ_s ∈ K^×) already gives each ζ_A(s) the MZ property. Other places checked: §3.9 (c) already uses the n = 1 case, not Corollary 5.5.5's route. §3.5 cites only display (5.5.3), the specialisation formula it proves itself. No other proof route uses the expansion.

## F02 (P3) — applied

Review a: §2.12 Check, old: “for q = 2 the two sets differ but have the same cardinality d(w)”. New: AS_w = AT_w for w ≤ q, first differing at w = q + 1 ((q + 1) ∈ AS ∖ AT). At q = 2, w = 3: AS_3 = {(3), (1,1,1)} and AT_3 = {(2,1), (1,1,1)}, both of size 2.

No other “differ” claim in the README lacks its weight range.

## F03 (P3) — applied

Review a: §2.1, old: "In the formal setting of MZ.1". New: "In the formal setting of §§1.3–1.4". I searched the README and Lean file for other internal section labels of the `MZ.n` form; none remain. The `DM.n` and `PS.9.n` labels are supplier sections, not internal labels.

## F01 (P2) — applied

Review b: `direct_small_weight_spanning`: `hw : w ≤ 2 * Fintype.card F - 1` → `- 2`; docstring “2q-1” → “2q-2 (… Proposition 4.11)”. README §5.13 (1): “(and also w = 2q − 1)” becomes a sentence saying that Remark 4.12 gives no argument and (1) does not assert it. New boundary Check at q = 3, w = 5.

The Check computes (3,2) ∈ I^T_5 ∖ I′_5 and (2,3) ∈ I′_5 ∖ I^T_5, with 130 = s(5) arrays in each family, so spanning there would be equivalent to an independence statement that no source proves.

Evidence: IKLNDP24 Proposition 4.11 (IKLNDP24 line 6517) is stated only for w ≤ 2q − 2. Remark 4.12 (IKLNDP24 lines 6729–6732) claims w = 2q − 1 without proof. The Note proves no spanning statement: its Theorems 1.5–1.6 (IKLNDP-NOTE lines 260–264) are independence results. Elsewhere, the §5.13 basis sentence and the route already use w ≤ 2q − 2, so nothing else changed.

## F02 (P2) — applied differently

Review b: The reviewer's “not yet written” is process narrative, so instead claims of existing supply became requirements. Scope: each depth-one object is “a requirement on that roadmap, registered as a supplier gap”, and “Nothing else is assumed”. Conventions: C∞ “required of … DM.2 (gap:parent-period-analytic-field)”. Bullets: “supplies” → “must supply”. Gamma values are no longer assigned to it.

Evidence for the fact: `roadmaps show 'DrinfeldModulesAndTModules'` prints "no roadmap DrinfeldModulesAndTModules on main or in an open roadmap pull request". The name is absent from `merge-order/ORDER.txt` and from the board package index. All 13 DM dependencies are already declared gaps in `design/plan.json` with matching README lines. Whether that roadmap is to be created is not settled by this package; see the maintainer notes.

## F03 (P3) — applied

Review b: `character_roots_independent` is deleted from `Suggested.lean`: it concerns free roots in F̄ and states no object of the roadmap. In README §5.8 the paragraph naming it is deleted, and the statement stays as a README target. The module docstring already names the real headline of §5.8 (character splitting of period relations) as not statable for lack of the period realisation.

## F04 (P3) — applied

Review b: `two_row_rigidity` is deleted from `Suggested.lean`, and its README §4.7 paragraph is deleted; the target and its q = 3 Check stay.

Pattern repair: `twisted_system_rigidity` has the same shape. It is a coefficient-comparison step inside the proof of IKLNDP24 Theorem 3.4, quantified over free polynomial families. It is deleted from `Suggested.lean`. In README §4.6, "The headline `twisted_system_rigidity` states the vanishing part …" becomes "After one forward coefficient twist the vanishing part reads as follows …", keeping the full statement.

The Mathlib bullet for `FiniteField.frobeniusAlgHom` and `Polynomial.mapRingHom` now points to the forward-twisted form of §4.6 instead of §4.7.

`frobenius_solution_dimension` is kept. It is a named source theorem (CCM23 Theorem 4.3.5), the main result of Layer 4, and it is stated on the roadmap's own carrier `frobeniusSolutionSpace`.

## F05 (P2) — applied

Review b: New headline `zeta_space_mul_le` in a new `/-! ## Layer 1: products and value algebras -/` section. The reviewer suggested Layer 2, but §1.7 belongs to Layer 1. The headline states Z_w·Z_(w′) ≤ Z_(w+w′) and AZ_w·AZ_(w′) ≤ AZ_(w+w′), citing Thakur 2010 Theorem 3 (THAKUR10 line 230) and IKLNDP24 Proposition 4.2 (IKLNDP24 lines 4804–4806).

README §1.7 gains a sentence naming the headline and its scope. The Mathlib contract gains `Submodule.mul` and `Submodule.mul_le`, which I checked at the pin in `Mathlib/Algebra/Algebra/Operations.lean` (lines 214 and 222).

Ownership: a `roadmaps grep` for Thakur, multizeta, "Carlitz multiple" and q-shuffle over main and the open heads finds no other owner of function-field MZV products. PeriodsAndSpecialValues PS.9 concerns real MZVs.

## Checks

- **Elaboration** (`lake env lean packages/DrinfeldModulesAndTModulesPartII/Suggested.lean`, run from the content checkout): exit 0, 0 errors, 18 warnings, all "declaration uses `sorry`", one per theorem. No `TauCeti.*` import, so nothing needed building. The file has 355 lines and 34 declarations: 16 definitions and 18 theorems, against 36 before (−3 deleted, +1 added).
- **Mechanical signature check**: I put `#check @name` for all 34 declarations in one scratch file and elaborated it once, then compared each result with the pre-change signature artifact after normalising binder printing. Results:
  - 31 declarations: unchanged apart from how binder types are printed.
  - `direct_small_weight_spanning`: bound `2q − 1` → `2q − 2`, as intended.
  - `zeta_space_mul_le`: new; it keeps `F`, `[Field F]`, `[Fintype F]`, `[DecidableEq (RatFunc F)]`, `w` and `w'`, matching README §1.7.
  - No section binder was lost (the file has no section variables).
- **Dependency check** (complete output): `depcheck: 56 roadmaps, 633 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Citation resolver** (`roadmaps resolve`): no cross-roadmap citation and no Lean name found nowhere. The tool does not flag DrinfeldModulesAndTModules, presumably because every citation of it is gap-registered (see review b, F02).
- **README ↔ Lean names**: all 34 Lean names appear backticked in the README. The only backticked lower-case names not declared in the Lean file are the Mathlib names `tsum`, `iSupIndep` and `composition_card`.
- **Gate failures listed by the brief**: none.

## Adversarial pass on new or changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.1 formal setting (label fix) | weight-zero pair ([∅], −[∅]) | R(−1) = 0 − 1 = −1, R(0) = 1 − 0 = 1; summed value 1 − 1 = 0 | agrees with the §2.1 Check | label only |
| §2.12 Check AS_w vs AT_w | q = 2, w = 1, 2, 3; q = 3, w = 3, 4 | q=2: {(1)} = {(1)}; {(1,1)} = {(1,1)}; w=3: {(3),(1,1,1)} vs {(2,1),(1,1,1)}, sizes 2 = 2 = d(3). q=3: w=3 both {(1,2),(2,1),(1,1,1)}, 16 arrays; w=4: (4) ∈ AS ∖ AT, 46 vs 48 | first difference at w = q + 1 for every q | Check rewritten |
| §3.9 (b) route, MZVs | q = 3, weights 0, 1, 2; q = 2, weight 1 | V_0 = {1}, V_1 = {ζ(1)}, V_2 = {ζ(1,1), ζ(2)} (d(2) = 2); ζ(1)² = ζ(2) + 2ζ(1,1) ∈ 𝒵_2 by §1.7; q=2: 𝒵_1 = K̄·π̃ since ζ(1) = −π̃/D₁, and π̃ ∉ K̄ = 𝒵_0 | grading follows; without §1.7, ζ(1)² would not be shown to lie in Σ_w 𝒵_w | route replaced; Needs + §1.7, §0.9 |
| §3.9 (b), CMPL at algebraic points | q = 2: Li(1)² as a monomial of weight 2; zero values | Li(1)² = ζ(1)² = ζ(2) = π̃²/D₁², weight 2 on both readings; zero values excluded (Chang Def. 5.4.2, CHANG14 line 870) | consistent | statement fixes the monomial grading |
| §3.9 (c), unchanged route rechecked | n = 1, Z = ζ(s) | aπ̃^w + bZ = 0 with (a,b) ≠ 0; b = 0 forces a = 0; hence Z/π̃^w = −a/b ∈ K | holds without Theorem 5.5.2 | none |
| §5.13 (1) and `direct_small_weight_spanning` | w = 0; q = 2, w = 2; q = 3, w = 4; q = 3, w = 5 (excluded) | w=0: span{1} = K; q=2: AT^1_2 = {(1,1)}, ζ(2) = D₁ζ(1,1); q=3, w=4: 46 = s(4) arrays; w=5: AT^1_5 and AT′_5 both have 130 arrays but differ at (3,2) and (2,3); 2q − 2 ≥ 2 so natural subtraction never truncates | sourced range only | bound 2q−1 → 2q−2; boundary Check added |
| `zeta_space_mul_le` (ordinary) | w = w′ = 0; w = 0, w′ = 3; q = 2, (1,2); q = 3, (2,2) | K·K = K; K·Z_3 ⊆ Z_3; ζ(1)ζ(2) = ζ(3) + ζ(1,2); ζ(2)² = ζ(4) + (2 + Δ^[2]_(2,2))ζ(2,2) = ζ(4) + 3ζ(2,2) = ζ(4) in char 3 | inclusion holds in each case | new headline |
| `zeta_space_mul_le` (alternating) | q = 2; q = 3, ε = −1, w = w′ = 1 | q=2: same as ordinary; ζ(−1;1)² = ζ(2) + 2ζ(−1,−1;1,1) ∈ AZ_2, with the correction zero since q − 1 = 2 ∤ 1 | holds | new headline |
| `zeta_space_mul_le`, negative control | wrong target weight w + w′ − 1, q = 3, w = w′ = 1 | ζ(1)² = ζ(2) + 2ζ(1,1) is a nonzero element of Z_2, and Z_2 ∩ Z_1 = 0 by the §3.9 grading | the weight-shifted inclusion is false, so the stated weight is forced | none |
| Supplier prose (review b, F02) | each object listed in Scope against the gaps list | DM.0 → parent-carlitz-products; DM.2 → parent-period-analytic-field, parent-carlitz-omega; DM.4 → parent-effective-dual-motives; DM.6 → parent-small-power-sums, general-power-sum-degree, anderson-thakur-generating-series, v-adic-mzv-specialisation; DM.8 → parent-twisted-analytic-rings, parent-abp-interface, abp-entire-from-equation, frobenius-constant-denominator, frobenius-fundamental-matrix (13) | each object has a gap | wording only |
| Mathlib `Submodule.mul` bullet | M = N = K·1 in K∞ | (K·1)(K·1) = K·1 | matches the pinned `mul_le` statement | new bullet |

The three deletions (`character_roots_independent`, `two_row_rigidity`, `twisted_system_rigidity`) remove Lean statements and add none. Their README targets are unchanged, and the Checks in §4.6, §4.7 and §5.8 still evaluate as before.

## For the maintainer

- **The supplier DrinfeldModulesAndTModules exists nowhere**: not on main, not at any open roadmap head, not in the merge order, not among the board packages. This Part II has 13 registered gaps on it (DM.0, DM.2, DM.4, DM.6, DM.8). The README now states them strictly as requirements. Whether that roadmap is to be created, or the depth-one theory is to be owned elsewhere, is a scope and merge-order decision outside this package, and earlier rounds raised it too.
- **Names other roadmaps might cite that changed**:
  - removed from `Suggested.lean`: `TauCetiRoadmap.DrinfeldModulesAndTModulesPartII.character_roots_independent`, `.two_row_rigidity` and `.twisted_system_rigidity`;
  - added: `.zeta_space_mul_le`;
  - `.direct_small_weight_spanning` now has bound `2q − 2`.
  A `roadmaps grep` found no other roadmap citing any of these names.
- **Ownership against open pull requests** was checked through the sibling checkouts named in the brief and through `roadmaps grep` over all open heads.
- **Suspicious text**: none found in the reviews or the sources.
