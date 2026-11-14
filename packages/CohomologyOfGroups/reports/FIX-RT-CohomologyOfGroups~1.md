# FIX-RT-CohomologyOfGroups~1 — repair of red-team round 1 (passes a and b)

Nine findings: two reviews, none overlapping. All nine verified and applied. Files changed:
`packages/CohomologyOfGroups/README.md`, `packages/CohomologyOfGroups/Suggested.lean`,
`packages/CohomologyOfGroups/sources.toml` (Loh19 locator) and
`packages/CohomologyOfGroups/design/plan.json` (one new top-level `gaps` entry).

## RT-CohomologyOfGroups~1a/F01 (P2) — applied

Verified. The module docstring listed the cohomological universal coefficient sequence as not
statable because the evaluation pairing was missing. That pairing exists at the pins
(`TauCeti.ChainComplex.kronecker`, `Rep.groupCohomologyIhomIso`), and README 5.2 already named it
as the Kronecker map.

What changed in `Suggested.lean`:
- New "Layer 5" block with two definitions that have real bodies, both transported along pinned
  isomorphisms (`CategoryTheory.MonoidalClosed.unitNatIso`, `Rep.groupCohomologyIhomIso` for the
  bar resolution, `groupHomology.inhomogeneousChainsIso`):
  - `cohomologyEvaluation : Hⁿ(G, A) →ₗ Hom(Hₙ(G, k), A)`, the Kronecker map;
  - `extToCohomology : Ext¹(Hₙ(G, k), A) →ₗ Hⁿ⁺¹(G, A)`, the transport of `extToHomology`.
- New headline `universalCoefficient_cohomology`, under `[∀ X : ModuleCat k, HasProjectiveDimensionLE X 1]`:
  `extToCohomology` is injective, it is exact with `cohomologyEvaluation`, and the evaluation has
  a right inverse.
- Four `TauCeti.*` imports added.
- Docstring: the unstatable list now names only the homological sequence. What it lacks: the
  identification `C(G; A) ≅ C(G; k) ⊗ A` of complexes, needed to transport the map
  `homologyToTor`. I checked the pins for it (`GroupHomology/Coefficients.lean` has only
  connecting-map comparisons).

What changed in the README:
- 5.2 defines both maps and names all three declarations.
- It gives the hypothesis's Lean form and states degree 0 (pinned
  `TauCeti.ChainComplex.kronecker_bijective_of_isIso`).
- It adds a negative-control Check over `k = ℤ/4`.
- The supplier contracts and the Layer 5 Dependencies are updated.

## RT-CohomologyOfGroups~1a/F02 (P3) — applied

Verified: the three Checks of 2.1 were all homological. Added three hypercohomology Checks to
2.1, each value recomputed:
- `ℤ/2` on trivial `ℤ`: `ℤ, 0, ℤ/2`. The invariant complex gives `0` in degree 2.
- Trivial group, `D = (ℤ →2 ℤ)`: `0, ℤ/2`. Dropping the differential of `D` gives `ℤ, ℤ`.
- `ℤ/2`, `ℤ_sgn` in degree 1: `H¹ = 0`, and `H² = H¹(ℤ/2, ℤ_sgn) = ℤ/2ℤ = ℤ/2`, while the
  invariant complex is `0`.

## RT-CohomologyOfGroups~1a/F03 (P2) — applied

Verified against HS53 line 404–407 (printed p. 119): the source sets `A*_j = A` for `j ≤ 0` and
`A*_j ∩ Aⁿ = 0` for `j > n`. 6.1 used to read "for `0 < j ≤ n` …" only. It now reads
`A*_j ∩ C̄ⁿ = C̄ⁿ` for `j ≤ 0`, the middle range, and `0` for `j > n`, with the HS53 line locator.

A Check was added for the boundary values:
- `A*_0 ∩ C̄⁰ = M` and `A*_1 ∩ C̄⁰ = 0`;
- `N = 1` gives `C̄ⁿ` for `j ≤ n`; `N = G` gives `0` for `j > 0`;
- `G = N = 1`, `M = ℤ` gives `E₁^{0,0} = ℤ`.

Pattern: the other filtration of 6.1, `A_j`, already had both boundary ranges.

## RT-CohomologyOfGroups~1b/F01 (P2) — applied

Verified: 5.4 claimed `ψ` bijective for every `k` (torsion-free `A`) and for every `ℚ`-algebra
`k`. 5.1 gave Künneth only for global dimension at most one or over a field, so `k = ℤ/4` and
`k = ℚ[x, y]` had no supplier.

Changes:
- **5.1:** new clause, over every commutative `k`: if `N` and every `H_q(H, N)` are projective,
  the cross product is an isomorphism.
  - Route: pinned `ChainComplex.projective_cycles_of_projective_homology` and
    `ChainComplex.isSplitMono_iCycles_of_projective_homology`, then
    `HomologicalComplex.homologyKunnethShortComplex_shortExact`. I checked that this last
    statement places no hypothesis on the ring (Kunneth/Sequence.lean module docstring).
  - New Check: `Hₙ(ℤ², ℤ/4) = ℤ/4, (ℤ/4)², ℤ/4`.
- **5.4:** routes rewritten to use the new clause (`H = ℤ`; for a `ℚ`-algebra, `H = F` finite, with
  `H_{q≥1}(F, k) = 0` by `transfer_comp_map_subtype_id`). `*Needs:*` updated, and a Check added
  for `k = ℤ/4` and for `k = ℚ[x, y]` with `A = ℤ² × ℤ/2`.

Pattern:
- The Scope sentence on 5.1's generality and the Künneth contract row are updated.
- The other Künneth uses (5.3, 5.4 "Products", the 8.x `C_p × C_p` Checks) are over fields and
  are covered.

## RT-CohomologyOfGroups~1b/F02 (P2) — applied

Verified at the head of K3BlochGroups: §5.2's target finiteGroup_period_fromSylow gives Swan's
values but never defines the `r`-period or states that it is the least one.

Changes:
- The README sentence "Assumed of §5.2: …" is replaced by a declared gap,
  "What K3BlochGroups must provide (gap:least-r-period): …". The same slug is added to the
  top-level `gaps` list of `design/plan.json`.
- 8.4 now cites `gap:least-r-period` in place of "assumed" and "under the assumption", and in its
  `*Needs:*`. The Layer 8 Dependencies are updated too.

Witness, recomputed for `S₃`, `r = 3`: the 3-parts of `H₁…H₇` are `0, 0, ℤ/3, 0, 0, 0, ℤ/3`, so
`d = 4` and `d = 8` both qualify, and the least is `4 = 2·|S₃/A₃|`. 8.5 needs only that the
period class exists, as the contract now says.

## RT-CohomologyOfGroups~1b/F03 (P3) — applied

Verified the pinned statement (`TateCohomology/Cup/TateNakayama.lean:360`). Its hypotheses hold
for a cyclic `G` with `C = ℤ` and `u` the connecting image of `χ`, whose Tate class is
`characterConnectingClass` by its definition (`Character.lean:65`).

Changes to 8.4:
- **Route:** replaced by the Tate–Nakayama route, with all three subgroup hypotheses and the `Tor`
  hypothesis checked in the text.
- **`*Needs:*`:** gains the theorem and `TateCohomology.isoGroupCohomology`, and loses
  `cup_δ_of_flat`, which the route no longer uses.

Pattern: the contract row for `periodicIsoOfGenerator` would otherwise go unused. It now supports
the Check `Ĥ²(ℤ/m, ℤ) ≅ Ĥ⁰ = ℤ/m` and is marked "Used in 8.4". The Tate–Nakayama row now states
its hypotheses.

## RT-CohomologyOfGroups~1b/F04 (P3) — applied

Verified: `TauCeti.groupHomology.map_comp_transfer` is at `GroupHomology/Transfer/Basic.lean:103`,
naturality in `φ : M ⟶ N`. It is now in the Tau Ceti transfer contract row and in the
`*Needs:*` of 7.1.

Pattern: a scan of every `TauCeti.*`/`Rep.*`/`HomologicalComplex.*`-prefixed name used outside the
contracts found one other, `δ_comp_corestriction`, and it was already listed in short form.

## RT-CohomologyOfGroups~1b/F05 (P3) — applied

Verified: both spaces have `ℚ`-dimension `2^{ℵ₀}`, so "larger than" proves nothing. The 5.3 Check
now argues by rank. On the summand `H₁ ⊗ H₁` the cross product is
`ℚ^ℕ ⊗ ℚ^ℕ → (ℚ^{(ℕ)} ⊗ ℚ^{(ℕ)})^*`, whose image is the finite-rank forms (`Σ_{m≤r}` has rank
`≤ r`). The form `δ_{ij}` has rank `r + 1` on `⟨e₀…e_r⟩`, so it is not in the image. The Check
also notes the equal dimensions.

## RT-CohomologyOfGroups~1b/F06 (P3) — applied

Verified: Loh19 line 2215 (p. 48) opens Remark 1.6.12 for `n ≥ 2`, and the four-term sequence is
at Loh19 line 2221, p. 49 (page marker at line 2219, printed p. 49).

The 8.3 Check now reads "(Loh19 Remark 1.6.12, pp. 48–49, Loh19 line 2215–2221, for `m ≥ 2`; for
`m = 1` the sequence is `0 → ℤ →id ℤ →0 ℤ →id ℤ → 0`, exact)", with `n = 1` and `χ` trivial made
explicit. The `sources.toml` Loh19 locator now reads "Remark 1.6.12 (pp. 48–49)".

Pattern: the two other Loh19 p. 48 citations are of Prop. 1.6.11 (line 2205, p. 48), which is
correct.

## Checks

- **Elaboration.** `lake env lean packages/CohomologyOfGroups/Suggested.lean`, run from the
  content checkout: exit 0, 14 warnings "declaration uses `sorry`" (one per theorem), no errors. No
  `TauCeti.*` module had to be built: all four new imports had object files.
- **Binder check.** All 23 declarations went through `#check @name` in one scratch file: a copy of
  `Suggested.lean` plus the `#check` lines and 23 pinned names the README newly cites. The types
  agree with the README:
  - `extToCohomology` and `universalCoefficient_cohomology` carry
    `[∀ X : ModuleCat k, HasProjectiveDimensionLE X 1]`;
  - `cohomologyEvaluation` correctly has no such binder;
  - the other 20 signatures are unchanged.
  
  Four pinned names failed only because the scratch file did not import their modules. Each was
  confirmed in source with its namespace: `ModuleCat.hasProjectiveDimensionLE_one_of_isPrincipalIdealRing`,
  `TauCeti.TateCohomology.cup_bijective_of_forall_isPGroup_of_lTensor_injective`,
  `Rep.FiniteCyclicGroup.periodicIsoOfGenerator` and
  `HomologicalComplex.homologyKunnethShortComplex_shortExact`.
- **Dependency check** (command of the brief), output: `depcheck: 244 roadmaps, 2206 edges, 0
  problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Citations** (`roadmaps resolve`): no cross-roadmap citation and no roadmap Lean name found
  nowhere.
- **Ownership.**
  - The three new declarations live in this roadmap's namespace.
  - `roadmaps grep -i 'universal coefficient'` over main and the open heads found only users of
    special cases: ArithmeticGaloisDuality §D7.2 (finite groups, already cited),
    InverseGaloisAndArithmeticFundamentalGroups (integral degree 2) and InductionRestrictionPartII.
    No roadmap owns the general group-cohomology sequence, so 5.2 stays this roadmap's.
  - The new supplier gap names K3BlochGroups, which is earlier in the merge order.

## Adversarial pass

| Statement | Instances tried | Values (left / right) | Result | Change |
|---|---|---|---|---|
| `universalCoefficient_cohomology` (with `cohomologyEvaluation`, `extToCohomology`) | `k = ℤ`, `G = 1`, `A = ℤ`, `n = 0`; `G = ℤ/2`, `A = 𝔽₂`, `n = 0, 1`; `G = ℤ`, `A = ℤ`, `n = 0`; free `F`, `n = 1`; `k = ℚ`; zero ring; `k = ℤ/4` | `0 → 0 → 0`; `0 → 𝔽₂ ≅ 𝔽₂`, then `𝔽₂ ≅ 𝔽₂ → 0`; `0 → ℤ ≅ ℤ`; `Ext¹(ℤ^{(S)}, A) = 0 = H²(F, A)`; `Ext = 0`, evaluation bijective; all `0`; `ℤ/2 → ℤ/2 → ℤ/2` impossible | holds where the hypothesis holds; `ℤ/4` excluded by it | new Lean headline; `ℤ/4` Check in 5.2 |
| Index shift and zero-map model of the same | wrong model: evaluation in degree `n` with `Ext¹(Hₙ₊₁)`, `G = ℤ/2`, `A = 𝔽₂`, `n = 0`; zero evaluation, `G = ℤ`, `n = 0` | `𝔽₂ ↪ H¹ = 𝔽₂` and onto `Hom(H₁) = 𝔽₂`, impossible; a section needs `Hom(ℤ, ℤ) = ℤ ≠ 0` | both excluded by the stated law | none |
| Hypothesis satisfiable (vacuity) | `k = ℤ` | instance `ModuleCat.hasProjectiveDimensionLE_one_of_isPrincipalIdealRing` | non-vacuous | none |
| 2.1 hypercohomology Checks | as listed under a/F02 | `ℤ, 0, ℤ/2`; `0, ℤ/2`; `0, ℤ/2` against `ℤ`, `ℤ, ℤ`, `0` | sound | three Checks |
| 6.1 `A*_j` | `n = 0`; `N = 1`; `N = G`; `ℤ/4 ⊃ 2ℤ/4`, `n = 1`; `G = N = 1`, `M = ℤ` | `M` / `0`; `C̄ⁿ`; `0` (normalized, constant in the last argument); `{f(0)=f(2)=0, f(1)=f(3)} ⊊ {f(2)=0}`; `E₁^{0,0} = ℤ` | sound | definition completed, Check |
| 5.1 projective-homology case | `H = 1`, `N = k`; `k = ℤ/4`, `G = H = ℤ`; field; non-examples `H = ℤ/2`, `N = ℤ` and `N = ℤ/2` over `ℤ` | `Hₙ(G, M) ⊗ k`; `ℤ/4, (ℤ/4)², ℤ/4`; all modules projective; `H₁ = ℤ/2` not projective (`H₃(ℤ/2×ℤ/2) = (ℤ/2)³ ≠ (ℤ/2)²`); `Tor₁(ℤ/2, ℤ/2) = ℤ/2` | hypotheses needed and sufficient on these | clause, Check |
| 5.4 routes | `ℤ²` over `ℤ/4`; `ℤ² × ℤ/2` over `ℚ[x, y]`; `ℚ` over `ℤ` | `k, k², k`; `k, k², k, 0`, `H_{q≥1}(ℤ/2, k) = 0` since `2` is invertible; `H₁ = ℚ`, `H₂ = 0` | sound | routes, Check |
| 5.3 Check | finite sum of `r` pure tensors; `δ_{ij}` restricted to `⟨e₀…e_r⟩`; dimensions | rank `≤ r`; rank `r + 1`; `2^{ℵ₀}` on both sides | sound | Check reworded |
| `gap:least-r-period` | `S₃`, `r = 3`; `ℤ/m`, `p ∣ m`; `Q₈`, `r = 2` | least `d = 4 = 2·2`; `d = 2 = 2·1`; `H₁ = (ℤ/2)²` fails, `H₂ = 0` fails, `H₃ = ℤ/8` gives `d = 4` | consistent with Swan's values | gap declared |
| 8.4 Tate–Nakayama route | `G = 1`; `G = ℤ/2`, `M = ℤ`, `n = 0`; `G = ℤ/4`, `S = 2ℤ/4`; non-example `χ(g) = 2/4` on `ℤ/4` | all groups `0`, hypotheses hold for `S = 1`; `ℤ/2 → ℤ/2`, `1 ↦ δχ ≠ 0`; `χ(2) = 1/2` generates `Hom(ℤ/2, ℚ/ℤ)`; cup on `Ĥ⁰ = ℤ/4` is multiplication by `2`, not bijective | the hypothesis `χ(g) = 1/m` is needed and suffices | route, `*Needs:*` |
| 8.4 cyclic Check | `ℤ/m` | `Ĥ² ≅ Ĥ⁰ = ℤ/m` (`2 ≡ 0 mod 2`) | sound | citation added |
| 8.3 Check | `m = 1`; `m = 2` | `0 → ℤ →id ℤ →0 ℤ →id ℤ → 0` exact; `0 → ℤ →(1+t) ℤG →(t−1) ℤG → ℤ → 0` exact; `n = 1`, period divides `2`, and `Ĥ*(ℤ/2, ℤ) = ℤ/2, 0` | sound | locator, `m = 1` case |
| 7.1 naturality bullet | `map_comp_transfer` at the pin | `map id φ ≫ transfer N S = transfer M S ≫ map id (res φ)` | matches the bullet | `*Needs:*`, contract row |

## For the maintainer

- **New supplier gap on K3BlochGroups §5.2:** `gap:least-r-period`, in the README contracts and the
  top-level `gaps` of `design/plan.json`. K3BlochGroups, still an open pull request, is asked to
  define its `r`-period as the least `d ≥ 2` with `H_{d−1}(G, ℤ_(r))` cyclic of order `|G|_r`.
- **New `Suggested.lean` names:** `TauCetiRoadmap.CohomologyOfGroups.cohomologyEvaluation`,
  `TauCetiRoadmap.CohomologyOfGroups.extToCohomology` and
  `TauCetiRoadmap.CohomologyOfGroups.universalCoefficient_cohomology`. No existing name changed or
  was removed, so no other roadmap's citation is affected.
- **The new theorem's proof** is short: the pinned `extToHomology_injective`,
  `exact_extToHomology_kronecker` and `kroneckerSection`, read through the isomorphisms its two
  definitions are built from. It is stated because the docstring classes 5.2 as a headline and it
  is statable at the pins.
- **Untrusted text:** no suspicious instruction was found in the reviews or the fetched texts.
