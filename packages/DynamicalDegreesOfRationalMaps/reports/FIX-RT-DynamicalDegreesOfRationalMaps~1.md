# FIX-RT-DynamicalDegreesOfRationalMaps~1

Repair of red-team round 1, passes a and b: ten P3 findings, two pairs overlapping, settled in eight sections. Every finding was verified and applied. Edited: `packages/DynamicalDegreesOfRationalMaps/README.md` and `packages/DynamicalDegreesOfRationalMaps/Suggested.lean`. `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no source was added and no supplier gap is needed.

## RT-DynamicalDegreesOfRationalMaps~1a/F01 (P3) — applied

`graph` docstring: "The image does not depend on the representative. For `K`-rational maps … it lies in … `X ×_K Y`" → "For a reduced `X` the image does not depend on the representative, and for `K`-rational maps … it lies in … `X ×_K Y` (README §1.2)". The second sentence also fails without reducedness (witness below). New README §1.2 Check gives both witnesses.

Evidence. The reviewer's witness holds. For `X = Spec k[x,y]/(xy, y²)`, `Y = Spec k` and the structure morphism, the representative on `X` has image `≅ X`, and the one on the dense `D(x)` has image `Spec k[x]`. Second sentence: for `k = ℚ(t)`, `a ↦ a + (da/dt)·y` is a ring map, since `y² = 0`. It agrees with the structure map on `D(x)`, and its graph is not in `X ×_k Y`, since `t ↦ t + y`. For reduced `X`, Mathlib's `Scheme.Hom.ker` (`Mathlib/AlgebraicGeometry/IdealSheaf/Basic.lean:691`) is `ofIdeals` of the kernels taken on each open. Restriction to a dense open is injective on a reduced scheme, so both representatives have the kernel of their common dense open `W`. On `W` the map is over `K`, so this kernel contains the ideal of `X ×_K Y`.

## RT-DynamicalDegreesOfRationalMaps~1a/F02, RT-DynamicalDegreesOfRationalMaps~1b/F01 (P3) — applied

README headline bullet "integrality, projectivity and the projection properties of the graph (§1.2)" → "integrality and dimension of the graph, and the properties of its two projections (§1.2)". This matches the five conjuncts of `graph_isIntegral_and_projections` and the §1.2 paragraph that names it. Projectivity stays a §1.2 target.

Same pattern elsewhere: the bullet "existence and properties of `λ_k` and of `h_alg`, including their invariance under extension of the field" claimed a Lean statement for `h_alg` that no longer exists (next section). It now reads "including the invariance of `λ_k` under extension of the field". I compared each of the other headline bullets with the Lean file. They agree.

## RT-DynamicalDegreesOfRationalMaps~1a/F03, RT-DynamicalDegreesOfRationalMaps~1b/F02 (P3) — applied

Deleted `algebraicEntropy_baseChange` from `Suggested.lean`. In README §5.4, "Invariance under extension of the field … is `algebraicEntropy_baseChange`" → "Invariance under extension of the field and under birational conjugacy, in the second item, follows term by term over `0 ≤ k ≤ d` from `dynamicalDegree_baseChange` … and from `dynamicalDegree_birational_conj`". The §5.4 target itself is unchanged.

Evidence. The hypotheses are identical to those of `dynamicalDegree_baseChange` minus `k, hk`. The proof is `congrArg Real.log (Finset.sup'_congr _ rfl fun k hk ↦ dynamicalDegree_baseChange … k (Nat.lt_succ_iff.mp (Finset.mem_range.mp hk)))`. Same pattern checked elsewhere:
- `algebraicEntropy_iterate` needs `dynamicalDegree_iterate`, `one_le_dynamicalDegree`, commuting `sup'` with `x ↦ x^n` on `[0, ∞)`, and `Real.log_pow`.
- `algebraicEntropy_bounds` needs `λ_k ≤ λ_1^k`, an induction on log-concavity.

Neither is a one-step corollary, so both are kept.

## RT-DynamicalDegreesOfRationalMaps~1a/F04 (P3) — applied

Removed the binder `hL₂d` (`0 < (L_2^d)`) from `mixedDegree_comp_le`; its docstring now reads "`L_1`, `L_2`, `L_3` nef real classes". README §4.4 now displays the multiplied form for all nef `L_j`, with the divided form only when `(L_2^d) > 0`. The route divides only by `e(f_1) > 0`. A degenerate-`L_2` Check was added.

Evidence. §3.6 assumes nothing about `B`. On `W_{f_1,f_2}` it gives `e(f_1)(L_2^d)·deg_k(f_2∘f_1) ≤ (d−k+1)^k·e(f_1)·deg_k(f_2)·deg_k(f_1)`. Directly: if `(L_2^d) = 0`, the left side is `0` and the right side is `≥ 0` by §3.2. The reviewer's instance, recomputed: `0·0 = 0 ≤ 2·1·1 = 2`. Same pattern elsewhere: `siu_inequality_products` and `khovanskii_teissier` already assume no positivity. `mixedDegree_pos`, `exists_mixedDegree_comparison` and the `tendsto_dynamicalDegree` infimum need it. For example, with `ω' = O(1,0)` on `ℙ¹×ℙ¹` and `f = id`, the comparison would need `2 ≤ C·0`.

## RT-DynamicalDegreesOfRationalMaps~1b/F03 (P3) — applied

Conventions: "big and nef" (nef, `(L^d) > 0`) is now identified, by AlgebraicModuliForArithmeticGeometryPartII §1.6 read through §2.2, with nef plus section-growth bigness. Scope cites bigness to §1.6, leaving volume and (1′), (2′) with ArakelovGeometryAndAbelianHeightsPartII §0.3. Added a §1.6 contract bullet. §3.3 now cites bigness to §1.6 and `vol(A) = (A^r)` to §0.3 (1′). Layer 3 Dependencies include §1.6.

Evidence: `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/README.md` on main, lines 364–375. That section defines section-growth bigness on integral proper `k`-schemes and proves that, for nef `L`, bigness is equivalent to `(L^n·V) > 0`.

## RT-DynamicalDegreesOfRationalMaps~1b/F04 (P3) — applied

Added a "From Tau Ceti" bullet for `TauCeti.AlgebraicGeometry.IsModification` (`TauCeti/AlgebraicGeometry/Morphisms/Modification/Basic.lean:53`, read at the pin). §1.2: "a modification in the sense of SchemeAndStackFoundations §4.11" → Tau Ceti's class, checked clause by clause, with `U` a §4.11 witness open.

Same citation repaired in the scope line, the §4.11 contract, the §1.2 *Needs:* and the Layer 1 Dependencies.

## RT-DynamicalDegreesOfRationalMaps~1b/F05 (P3) — applied

SchemeAndStackFoundations §4.19 contract: "an alteration from an integral `X_1` that is open in a regular scheme projective over a finite extension of the base field" → "an alteration from an integral `X_1` with an open immersion into a regular scheme projective over the base field". Evidence: `TauCetiRoadmap/SchemeAndStackFoundations/README.md` lines 7739–7742 on main. §3.4 applies the theorem over the algebraically closed `Ω`, so its route is unchanged.

## RT-DynamicalDegreesOfRationalMaps~1b/F06 (P3) — applied

- `exists_mixedDegree_comparison` docstring: "Dang, Theorem 1 (ii); Dinh–Sibony, Corollaire 7" → "Dang, Theorem 1 (ii); Dang–Favre, Theorem 1.3 (second item)".
- `exists_mixedDegree_birational_comparison` docstring gains "Dang, Theorem 1 (ii) and the remark after it; Dinh–Sibony, Corollaire 7 (the estimate in its proof), over `ℂ` and for `Y = X`".

Evidence:
- dinhsibony2005 lines 256–257: the corollary states convergence and birational invariance only.
- Lines 260–263: the conjugacy estimate, for a birational self-map of `X`.
- dangfavre2021 lines 457–460: the two-class comparison.
- dang2020 lines 35–41: conjugacy by `g : X′ ⇢ X`.

The §4.5 route in the README cited the same corollary and now gives each locator for what it supports. Its other citations are correct: §5.1 for convergence and §5.3 for birational invariance.

## Checks

- **Elaboration.** `lake env lean packages/DynamicalDegreesOfRationalMaps/Suggested.lean`, run from the content checkout, exits 0. There are 19 `declaration uses 'sorry'` warnings, one per theorem (20 before, minus the deleted one), and no errors. No `TauCeti.*` import needed building.
- **Signatures.** I put the file plus `#check @…` for all 32 declarations in a scratch file and elaborated it once. I then compared each type with the job's elaborated-signature list:
  - 31 are unchanged.
  - `mixedDegree_comp_le` lost exactly the binder `hL₂d`, and its README statement now has the same generality (nef `L_1, L_2, L_3`, `p + q = d`).
  - `algebraicEntropy_baseChange` is gone.
  - No section binder is dropped; the file has no `variable` block.

  I also re-wrapped one line of the module docstring so that no line begins with the word "class". The signature tool had read it as a `class` declaration, which caused the spurious "line 474: unexpected token" entry.
- **Dependency check.**

      depcheck: 239 roadmaps, 2254 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name that resolves nowhere.
- **README and Lean agree.** Each of the 32 Lean names appears in the README. `algebraicEntropy_baseChange` and `hL₂d` occur in neither file.

## Adversarial pass on the new and changed statements

| statement | instances | values computed | result |
| --- | --- | --- | --- |
| `graph` docstring, independence (reduced `X`) | `X = Spec k[x,y]/(xy,y²)`, representatives on `X` and on `D(x)`; reduced `X` with representatives on `V`, `V'` and common `W` | images `X` and `Spec k[x]`, since the kernel of the map to `k[x,x⁻¹]` is `(y)`; for reduced `X`, `ker γ_V = ker γ_W = ker γ_{V'}` because `O_V → j_*O_W` is injective | false without reducedness, true with it; scoped |
| `graph` docstring, containment in `X ×_K Y` | same `X` over `ℚ(t)` with `a ↦ a + a′y` | `t ↦ t + y ≠ t`, so the graph is not in `X ×_K Y`; for reduced `X` the kernel is that of `W`, where the map is over `K` | scoped |
| headline bullet §1.2 | Lean conjuncts | 5 conjuncts: `IsIntegral`, dimension, `IsProper π_1`, `IsIso` over the domain, surjective `π_2` | matches |
| headline bullet §§5.1–5.4 | Lean statements on `h_alg` | `algebraicEntropy_iterate` and `algebraicEntropy_bounds` only | rewritten for `λ_k` |
| §5.4 term-by-term invariance | Cremona involution conjugated by a linear map; `z ↦ z²` on `ℙ¹_ℝ` with `K' = ℂ` | `λ = (1,1,1)`, so `h = 0` on both sides; `λ = (1,2)` with `h = log 2` over `ℝ` and over `ℂ` | true |
| `mixedDegree_comp_le` without `hL₂d` | `d = 0`; `L_2 = 0` with `d ≥ 1`; `ℙ¹×ℙ¹`, `L_2 = O(1,0)`, `L_1 = L_3 = O(0,1)`; same with `L_3 = O(1,0)`; `z²∘z²`; Cremona; `E×E` with `L_2 = I` | `[K_2:K][K_1:K] = [K_1:K][K_2:K]`; `0 ≤ 0`; `0 ≤ 2`; `0 ≤ 0`; `1·4 ≤ 1·2·2`; `1·1 ≤ 2·2·2`; `2·0 ≤ 2·3·3 = 18` | true |
| §4.4 route without positivity | `(B^d) = e(f_1)(L_2^d)` on `W`; `e(f_1) ≥ 1` | `z²∘z²`: `e(f_1) = 2`, `(B) = 2·1`; both sides divided by `2` | true |
| big and nef = §1.6 bigness for nef | `π^*O(1)` on `Bl_p ℙ²`; `O(1,0)` on `ℙ¹×ℙ¹`; `O_X` on a surface | `(L²) = 1`, `h⁰(mL) = binom(m+2,2)`, big; `(L²) = 0`, `h⁰ = m+1`, not big; `(O²) = 0`, `h⁰ = 1`, not big | agree |
| `π_1` satisfies Tau Ceti's `IsModification` | identity; Cremona; projection `ℙ² ⤏ ℙ¹`; `π_2` of `z ↦ z²` | `U = X`; `U = ℙ² ∖ 3` points, blow-up iso over `U`; `U = ℙ² ∖ p`; `π_2` has generic degree `2` and is no modification | holds for `π_1` only |
| de Jong contract | §3.4 over `Ω` algebraically closed; quadric cone | `X̄_1` projective over `Ω`; the blow-up of the vertex is a regular projective alteration of degree 1 | consistent |
| Corollaire 7 locators | dinhsibony2005 lines 256–263 | 256–257: convergence and birational invariance; 260–263: `δ_l(g∘f^n∘g⁻¹) ≤ c_X²δ_l(g)δ_l(g⁻¹)δ_l(f^n)` | recited by content |
| `IsNef` docstring scope | `X` not proper, e.g. `𝔸¹` | AlgebraicModuliForArithmeticGeometryPartII §1.5 is defined only on proper `X`; on proper `X` the closed curves are proper and both use `χ(C,L) − χ(C,O_C)` | scoped to proper `X` |

## Notes for the maintainer

- **Changed names.** `TauCetiRoadmap.DynamicalDegreesOfRationalMaps.algebraicEntropy_baseChange` is deleted. `mixedDegree_comp_le` lost one hypothesis, so it is stronger. `roadmaps grep` finds neither name in any other roadmap, on main or at the open heads.
- **Ownership.** No new construction is introduced. Bigness is now cited to its owner on main (AlgebraicModuliForArithmeticGeometryPartII §1.6) and modifications to the pinned Tau Ceti class. No supplier gap is needed.
- **Sources.** No new source, and no request for references.
