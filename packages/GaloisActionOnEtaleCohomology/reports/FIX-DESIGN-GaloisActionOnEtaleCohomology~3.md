# FIX-DESIGN-GaloisActionOnEtaleCohomology~3

Repair round for the review `REV-DESIGN-GaloisActionOnEtaleCohomology~2` of the design (eight findings: one P1, three P2, four P3). Files edited: `packages/GaloisActionOnEtaleCohomology/design/README.md`, `packages/GaloisActionOnEtaleCohomology/design/plan.json`, `packages/GaloisActionOnEtaleCohomology/sources.toml`. There is no `Suggested.lean` at the design stage, so no Lean statement changed and no `#check` pass was run. All eight findings were verified and are right.

## REV-DESIGN-GaloisActionOnEtaleCohomology~2/R01 (P1) — applied

Verified (product-topology `∏ ℤ_ℓ`: `ℓA` not open; see table). §3.3: "image of `A` open with its quotient topology" → `A[1/ℓ]` with the finest non-archimedean locally convex topology making `j_A` continuous (lattices `Ω`), universal property, joint continuity via compact `G_K`, open lattice only for finitely generated `A`. Product-topology and indiscrete Checks added; plan 3.3 rewritten.

## REV-DESIGN-GaloisActionOnEtaleCohomology~2/R02 (P2) — applied

Verified (`Tor_n^{ℤ/4}(ℤ/2,ℤ/2) = ℤ/2` ∀n; `M_2(𝔽_2)`; EnhancedDerivedSheaves §0.3 on main). Conventions, §§1.1–1.4: action on unbounded `D(X_τ, Λ)` (EnhancedDerivedSheaves §§0.1–0.4), `D⁺` the special case; cup products only for commutative `Λ`, target in `D⁺` under finite Tor amplitude. Two Checks added; plan 1.1–1.4 synchronised. Pattern: §4.1 `⊗_Λ Λ(j)(C)` → `⊗_{ℤ/n} μ_n(C)^{⊗j}`.

## REV-DESIGN-GaloisActionOnEtaleCohomology~2/R03 (P2) — applied

Verified (`Spa(K) ⊔ Spa(K)` is étale with two components). §0.3: "`V = Spa(L, 𝒪_L)`" → connected neighbourhoods are cofinal, equivalent to the poset of finite subextensions of `K^sep/K`; an étale `V` is a disjoint union of one-point `Spa(L_s, 𝒪_{L_s})` (ClassicalAdicEtaleCohomology §1.1), refined to the component through `v̄`. Two-component Check added; plan 0.3 synchronised.

## REV-DESIGN-GaloisActionOnEtaleCohomology~2/R04 (P2) — applied

Verified (`T² − t = (T − t^{1/2})²` over `𝔽_2((t))`: one embedding, `G_L = G_K`). §0.3 Check "`L = K(√a)` quadratic" → separable quadratic: `K(√a)`, `a ∉ K^{×2}`, `char K ≠ 2`, or Artin–Schreier `α² + α = t⁻¹`. Negative control `K(t^{1/2})` added (one embedding, not étale). Plan 0.3 tests updated.

## REV-DESIGN-GaloisActionOnEtaleCohomology~2/R05 (P3) — applied

Verified (Milne line 5007 is complex comparison; Hansen–Zavyalov 1706–1709 only define the groups; Berkovich 7.5.4 needs constructible prime-to-`char K` torsion). §4.2: Milne §21 and Huber §3.8 → Huber Theorem 3.7.2 via §8.2, Berkovich 7.1.1, 7.5.4 by scope. §4.3: → route via pinned `Module.Finite.of_quotient_smul_top` (contracts, *Needs*), Milne Theorem 19.2 related. Manifest, References updated.

## REV-DESIGN-GaloisActionOnEtaleCohomology~2/R06 (P3) — applied

Verified: `limits_test_separable_closure` occurs nowhere in `TauCetiRoadmap/SchemeAndStackFoundations` on main; its §2.15 has the unlabelled Check that `H^q((Spec K^s)_ét, F) = 0` for `q > 0` as a colimit over finite separable extensions. §2.2 Check citation → "SchemeAndStackFoundations §2.15, its Check on the separable closure of a field, through `etale_cohomology_limits`". No plan change (the plan never named it).

## REV-DESIGN-GaloisActionOnEtaleCohomology~2/R07 (P3) — applied

Verified (non-Galois cubic `ℚ_2(2^{1/3})`: rank 3, transposition trace 1; regular `S₃`: rank 6, trace 0). §§1.2, 2.3, 4.2 Checks: "left regular representation/action" → permutation representation on `Hom_K(L, C) ≅ G_K/G_L`, induced from the trivial representation of `G_L`, regular only for Galois `L/K`. Plan tests 1.2, 2.3, 4.2 synchronised.

## REV-DESIGN-GaloisActionOnEtaleCohomology~2/R08 (P3) — applied

Verified against `lake-manifest.json` of the content checkout: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. `plan.json` baseline: `f6090c70…`/`358314d4…` → these two values. The three new pinned declarations were read at these pins.

## Pattern repairs beyond the cited lines

- R02 pattern (tensor over a possibly noncommutative `Λ`): §4.1's twisting isomorphism and plan 4.1; Summary bullet now says cup products are for commutative coefficients.
- R05 pattern (locator not supporting its claim): §2.6 cited `milneLEC §17` (proper base change) for the Frobenius route; removed (the normalisation rests on `sga4half` and the pinned `TauCeti.IsArithFrobeniusLift.coe_localCyclotomicCharacter`). §4.2's `milneLEC §17, page 114` sharpened to Corollary 17.8 (b), page 116, line 4534, described as the constructible complete-variety case. `sources.toml` milneLEC `cited_for` drops 2.6 and adds 4.3.
- Earlier letter convention (complexes are `M`, `N`; `K`, `L` fields): plan 1.4 api `sep_vs_alg` still used `K` for a complex → `M`; §3.3 lattices are `Ω`, not `L`.

## Checks

Dependency gate, after all edits:

    candidate: GaloisActionOnEtaleCohomology is not in the merge order yet; checked as if placed after PadicDifferentialEquationsAndRigidCohomology (the intake inserts it when its design is accepted)
    depcheck: 236 roadmaps, 2138 edges, 0 problem(s)

No UPWARD or CYCLE line. `roadmaps resolve` on the edited README: no cross-roadmap citation and no Lean name found nowhere. `plan.json` parses as JSON and `sources.toml` as TOML. No gate failures were listed for this round. No source was fetched; no `needs-references.toml` was written (every text used is cached or settled uncertified). No local path or LaTeX delimiter in the edited files.

Ownership: the one object whose definition changed, the topology on `A ⊗ ℚ_ℓ` for a topological `ℤ_ℓ`-module (§3.3), was searched by object (`roadmaps grep` over main and the open heads: "finest locally convex", rationalisation topologies). Nearest: LocallyAnalyticDistributions (locally convex direct limits of locally convex spaces, not scalar extension from `ℤ_ℓ`-modules) and EtaleCohomologyFoundations §F.4.5 (rational lisse sheaves). Neither owns it; it stays here. New suppliers consumed are on main (EnhancedDerivedSheaves §§0.1–0.2) or pinned (`Module.Finite.of_quotient_smul_top`, `TauCeti/Topology/Algebra/Module/Nakayama.lean` line 164; `CompactSpace Gal(K/k)`, `Mathlib/FieldTheory/Galois/Profinite.lean` line 329; `separableClosure.isGalois`, `Mathlib/FieldTheory/IsSepClosed.lean` line 322).

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §3.3 topology on `V = A[1/ℓ]` | `A = ℤ_ℓ(1)`; `ℤ_ℓ/ℓ`; `0`; `∏ ℤ_ℓ` product; `∏ ℤ_ℓ` `ℓ`-adic (§3.1); `ℚ_ℓ` indiscrete | basic `Ω`: `ℓ^k ℤ_ℓ(1)` (k ∈ ℤ) and `V`, so `ℓ`-adic, `j_A(A)` open; `V = 0`; `V = 0`; lattices `{v_1..v_M ∈ ℓ^kℤ_ℓ}`, `⋂ = 0` (Hausdorff), every `Ω ∋ ℓ⁻¹e_m ∉ j_A(A)`; `j⁻¹(ℓ^r j(A)) = ℓ^rA` open so `j_A(A)` open; only `Ω = V`, indiscrete | positive Checks kept, open-image claim refuted, general case covered | R01 |
| §3.3 universal property, joint continuity | identity `ℤ_ℓ → ℚ_ℓ`; cyclotomic action on `ℤ_ℓ(1)`; trivial action on `∏ ℤ_ℓ` | extension of `id` is `id_{ℚ_ℓ}`; `(σ, v) ↦ χ_ℓ(σ)v` continuous on `ℚ_ℓ`; `⋂_σ σΩ = Ω`; orbit of `a` compact, lies in `j⁻¹(ℓ^{−s}Ω)` for `s` with `j(a) ∈ ℓ^{−s}Ω` | holds; compactness of `G_K` is via `Gal(K^sep/K)` since `AlgebraicClosure 𝔽_p((t))` is not `IsGalois` | R01 |
| §3.3 finite-generation clause | `A = ℤ_ℓ ⊕ ℤ/ℓ` `ℓ`-adic; Enriques `H²(X_C, ℤ_2)`; fg `H` with inverse-limit topology | `V = ℚ_ℓ`, `j_A(A) = ℤ_ℓ` open; torsion `ℤ/2` dies in `V`; kernels contain `ℓ^nH`, Hausdorff and coarser than compact `ℓ`-adic, so equal | open lattice, ContinuousRep | R01 |
| §1.1/§1.3 (d) cup-product target | `Λ = ℤ/4`, `M = N = ℤ/2`; `Λ = ℤ/2`, same; `M = Λ`; `Λ = ℤ` | `H^{−n} = Tor_n = ℤ/2` for all `n ≥ 0` (not `D⁺`), `a^♮ = id`; `ℤ/2` in degree 0; `N`; Tor amplitude `[−1,0]`, so `D^{≥m−1}` | `D⁺` only under finite Tor amplitude | R02 |
| Conventions: `M ∈ D^{≥m}`, `N` Tor amplitude `[a,b]` ⇒ `M ⊗^L N ∈ D^{≥m+a}` | `τ^{≤k}M`, filtered colimit | `τ^{≤k}M ⊗^L N ∈ D^{[m+a,k+b]}`; tensor and `H^i` commute with filtered colimits (EnhancedDerivedSheaves §§0.1, 0.3) | holds | R02 |
| §1.1 noncommutative `Λ` | `Λ = M_2(𝔽_2)`, `v = e_1`, `A = E_{12}`, `B = E_{21}` | `BAv = E_{22}e_1 = 0`, `ABv = E_{11}e_1 = e_1` | no balanced tensor; additive action kept | R02 |
| §1.1 `a^*` on unbounded `D` | `a = id`; `W ∈ D⁺` | unit of `id^{-1} ⊣ id_*` is `id`; agrees with `rightDerivedFunctorPlus` on `D⁺` (EnhancedDerivedSheaves §0.4 Check) | composition/identity laws unchanged | R02 |
| §4.1 twist with noncommutative `Λ` | `Λ = ℤ/n`; `Λ = M_2(ℤ/n)`; `j = 0`; `n = 1` | `H ⊗_{ℤ/n} μ_n^{⊗j} = H ⊗_Λ Λ(j)(C)`; left `Λ`-module via first factor; `H`; `0` | well-typed in general | R02 pattern |
| §0.3 neighbourhoods | `V = Spa(K) ⊔ Spa(K)`; `Spa(K × K)` affinoid; `(Spa(ℚ_2(i)), ι)`, `(Spa(ℚ_2(i)), ῑ)` | 2 components, refined by first, `(s_1,s_2) ↦` germ of `s_1`; same; unique isomorphism = conjugation, same image field; `σ(i) = −i` sends `ι ↦ ῑ` | cofinal connected subcategory ≃ subfield poset | R03 |
| §0.3 quadratic Checks | `ℚ_3(√3)`; Artin–Schreier `α²+α = t⁻¹` over `𝔽_2((t))`; `𝔽_2((t))(t^{1/2})` | `±√3`; no root in `K` (valuation parity), roots `α, α+1`; one root, `G_L = G_K`, not étale | separability needed | R04 |
| §1.2/§2.3/§4.2 permutation module | non-Galois cubic `ℚ_2(2^{1/3})`; Galois `S₃`; quadratic | rank 3, transposition trace 1; rank 6, trace 0 off identity; rank 2, swap trace 0 | "regular" only when Galois | R07 |
| §4.2 comparison locators | `Y = ℙ¹_K`, `Λ = ℤ/p`, `K = 𝔽_p((t))`; `Y = Spec L` | 7.5.4 excluded (torsion not prime to `char K`), Huber 3.7.2/Berkovich 7.1.1 apply (proper, all torsion); `H_c = H` for proper `Y` | locators match claims | R05 |
| §4.3 (b) via Nakayama | `H = ℤ_ℓ^r ⊕ T`; `∏ ℤ_ℓ` product; `∏ ℤ_ℓ` `ℓ`-adic; open disc, `ℓ = p` | `H/ℓH` finite, compact ⇒ fg; compact but `H/ℓH = ∏𝔽_ℓ` infinite, no conclusion (and not fg); not compact, hypothesis fails; `H¹(ℤ/p)` infinite, (a) fails | pinned hypotheses all met in (b) | R05 |
| §2.2 Check citation | `Spec k^sep`, `q = 0, 1` | `H⁰ = F_{k^sep}`, `H^q = 0` for `q > 0`, the main §2.15 Check | citation resolves on main | R06 |

## For the maintainer

- No section, target id or target name of this roadmap changed, so no citing roadmap is affected. The plan's targets 1.1–1.4 now take `M ∈ D(X_τ, Λ)` (unbounded) with `D⁺` as a special case; 3.3's topology changed.
- New supplier edges: EnhancedDerivedSheaves §§0.1–0.2 (on main), Tau Ceti `Module.Finite.of_quotient_smul_top`, and the Mathlib compactness instance; all are at or before the placement the gate computes.
- The gap `proper-rigid-finiteness` is unchanged.
- Ownership against open pull requests was checked through `roadmaps grep` over the indexed open heads for the §3.3 object only; nothing else new was introduced.
