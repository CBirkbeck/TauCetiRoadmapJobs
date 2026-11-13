# FIX-RT-GaloisActionOnEtaleCohomology~1: repair of red-team round 1 (passes a and b)

Seven findings in two reviews; the two F01 findings describe one defect and are settled together. All were verified against the suppliers at their heads, the pinned Mathlib and the cached sources before any edit.

## RT-GaloisActionOnEtaleCohomology~1a/F01, RT-GaloisActionOnEtaleCohomology~1b/F01 (P2) — applied differently

Changed: §4.4 (d) "`X` proper" → "`X` quasi-compact quasi-separated, proper or not" (contains (a)). Finiteness comes from §11.1, or the gap for spaces with no algebraic presentation. Vanishing above `2d` comes from ClassicalAdicEtaleCohomology §11.2, or §8.4 for proper `X`. The false Check is replaced; a quasi-compactness negative control is added. The gap's `needs` and contract now say qcqs.

Why: both findings are right. The Check fails for `ℓ` invertible in `𝒪_K` (the disc gives `ℤ/ℓ, 0, 0`). The old (d) was narrower than huber2007, Corollary 5.6 (line 963: quasi-separated, of finite type, any characteristic). I did not add 1b's case (e): it is limited to `X_C` locally algebraically of finite type, which is again narrower than huber2007. 1b also places the dimension bound in §11.1; it is in §11.2. The slug `proper-rigid-finiteness` is kept: the design's §4.4 prerequisites name it, and the board refuses a removed slug that a target still names.

## RT-GaloisActionOnEtaleCohomology~1a/F02 (P3) — applied differently

Changed: §4.2, renamed "Equivariant comparison with analytifications", gains a non-proper statement. For `Y` of finite type over `K` and `F` a constructible `ℤ/n`-sheaf with `n` invertible in `K`, the composite `H^i(Y_{K^sep}, F) → H^i(Y_C, F) → H^i((Y^an)_C, F^an)` is a `G_K`-equivariant isomorphism (EtaleCohomologyFoundations §F.2.2; ClassicalAdicEtaleCohomology §11.1). Three Checks are added. The Summary, Scope and docstring are updated.

Why: the finding is right, and no roadmap on main or at an open head owns this equivariance (searched by object). A disclaimer with no owner would break the "by owner" rule of Scope, so I planned it here. The route uses pullback functoriality, not §2.3, because `Y^an` is not quasi-compact.

## RT-GaloisActionOnEtaleCohomology~1a/F03 (P3) — applied differently

Changed: added the Downstream consumer "DeligneWeightsAndPurityPartII: compatibility of the proper algebraic–adic comparison with the continuous `K`-automorphisms of `C` (§§0.2, 4.2)".

Why: the duplicate is real (DeligneWeightsAndPurityPartII README line 89, `gap:analytic-comparison-automorphisms`). I dropped the review's cup-product clause: §1.3 (d) is about `ρ` and cup products on `X_C`, and §4.2 states no multiplicativity of the comparison. Withdrawing the duplicate gap is that later roadmap's edit.

## RT-GaloisActionOnEtaleCohomology~1b/F02 (P2) — applied

Changed: §2.3 "prove there is an isomorphism `(R^i f_*M)_{ξ_C} ≅ H^i(X_C, M_C)`" → the isomorphism is ClassicalAdicEtaleCohomology §1.5's strict-localisation stalk theorem (clause (b) and the `D⁺` form); the target is that it carries the §0.3 stalk action to `ρ`. The route explains how the supplier's map decomposes. The §1.5 contract and the Needs line are extended.

Why: confirmed at the supplier's head (§1.5). Same pattern checked in §2.4: SchemeAndStackFoundations has no scheme stalk theorem (only `higherDirectImage_iso_sheafify` and `etale_cohomology_limits`), so §2.4 stays as it is.

## RT-GaloisActionOnEtaleCohomology~1b/F03 (P3) — applied

Changed: the §8.2 contract "natural in the data" → the base-change map is the mate of `φ_X^* f^{-1} ≅ (f^ad)^{-1} φ_Y^*`, and the supplier states no naturality. The §4.2 route "natural in `R`" → paste the cartesian `Spa(σ̂)`-square with Huber's square, using Mathlib `CategoryTheory.mateEquiv_vcomp`/`mateEquiv_hcomp` (`Mates.lean` 167, 205), then take global sections over `R`.

Why: ClassicalAdicEtaleCohomology §8.2 (Theorem 3.7.2, at the supplier's head) asserts no naturality in `R`, `S` or `f`.

## RT-GaloisActionOnEtaleCohomology~1b/F04 (P3) — applied

Changed: "lines 477, 496, 506, 491, 414" → "lines 291, 477, 496, 506, 491, 414".

Why: `def Completion` is at line 291 of `Mathlib/Topology/UniformSpace/Completion.lean` at the pin. The other line lists in the contracts were rechecked: each has one line per name.

## Checks

- **Elaboration.** `lake env lean packages/GaloisActionOnEtaleCohomology/Suggested.lean` (run from the content checkout): one warning, `declaration uses 'sorry'` at line 120 (`exists_galois_continuousAut_equiv`), no errors. Only the module docstring changed: the §4.2 bullet now names both comparison statements.
- **Signatures.** I put `#check @SpectralAlgClosure`, `#check @CompletedAlgClosure` and `#check @exists_galois_continuousAut_equiv` in one scratch file and elaborated it once. The types are `(K : Type u_1) → [Field K] → Type u_1`; `(K) → [NontriviallyNormedField K] → [CompleteSpace K] → [IsUltrametricDist K] → Type u_1`; and the four-conjunct existential over the same three instance binders. Each matches its README statement (Conventions, §§0.1–0.2). Nothing was lost and nothing changed.
- **Dependency check** (command of the brief): `depcheck: 207 roadmaps, 1901 edges, 0 problem(s)`, exit 0. No UPWARD, CYCLE or `moved:` line.
- **Citations.** `roadmaps resolve packages/GaloisActionOnEtaleCohomology/README.md`: no cross-roadmap citation and no Lean name found nowhere.
- **Plan.** `design/plan.json` differs only in `gaps[0]`: `title`, `detail`, `needs` and `section`. The slug, supplier and every other key are unchanged.
- **Sources.** `sources.toml`: `huber1996` gains the locator Theorem 3.8.1. It stays `uncertified`, cited by locator only, and is not requested. No new source and no `needs-references.toml`.
- **Gate failures listed in the brief:** none.

## Adversarial pass on new or changed statements

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §2.3 equivariance of the supplier stalk isomorphism | `X = Spa(L)`, `L/K` separable, `M = ℤ`; `X = ∅`; `K = C`; supplier hypotheses | stalk `ℤ^{Hom_K(L,C)}`, stalk action `e_τ ↦ e_{σ∘τ}` = `ρ(σ)` of §1.2; inverse convention `e_{σ⁻¹τ}` is not a left action on `S₃`; `∅`: `0 = 0`; `K = C`: trivial group; `f` qcqs, locally of finite type ⊂ locally of weakly finite type, `ξ_C` built from `C`, so clause (b) gives `Y(ξ_C) = Spa(C, 𝒪_C)` | sound |
| §4.2 proper, mate-pasting route | `σ = 1`; `Y = Spec L`; `Y = ℙ¹`, `ℤ/7`, `ℚ_2` | `σ = 1`: `s`-square base change is the identity. `Spec L`: both sides `Λ^{Hom}` with `e_τ ↦ e_{στ}`. `ℙ¹`: `H² = ℤ/7(−1)`, Frobenius `2⁻¹ ≡ 4` on all three terms | sound |
| §4.2 nonproper (new) | `𝔾_m`, `μ_n`; `𝔸¹`, `n = p`, `char K = 0`; `𝔸¹`, `𝔽_p((t))`, `n = p`; `n = 1`; `Y = ∅` | `𝔾_m`: `H¹(μ_n) = ℤ/n`, trivial action; `H¹(ℤ/n) = ℤ/n(−1)` with `q = 2`, `n = 7`: Frobenius acts by `4`, inverse convention by `2`. `𝔸¹`: `H⁰ = ℤ/p`, `H¹ = 0` on both sides, whereas the closed disc has infinite `H¹`. `𝔽_p((t))`: the image is `⊕ K̄·T^m`, a proper subgroup of `⊕ C·T^m`, so `cT` with `c ∈ C ∖ K̄` is not hit. `n = 1`: all `0`. `∅`: `0` | sound; the invertibility of `n` is shown to be needed |
| §4.4 (d), qcqs | closed disc, `ℓ ≠ p`; `ℙ^d`; `Spa(L)`, `d = 0`; `⊔_m Spa(K)`; `ℓ = p` with `char K = 0`; `ℓ = 2`, residue field `𝔽_2`; `K = ℂ((t))` | disc: `1, 0, 0`, finite, zero above `2`. `ℙ^d`: `ℤ/ℓ` in even degrees `0…2d`. `Spa(L)`: `(ℤ/ℓ)^{[L:K]}`. `⊔`: `∏ ℤ/ℓ`, infinite, excluded by quasi-compactness. `ℓ = p` and `ℓ = 2` over `𝔽_2`: not invertible in `𝒪_K`, excluded (the disc's `H¹` is infinite there). `ℂ((t))`: every `ℓ` is admitted, disc `1, 0, 0` | sound |
| §4.4 Check "properness only at the residue characteristic" | (a)–(d) with `ℓ ≠ p` and `ℓ = p` | `ℓ` invertible in `𝒪_K`: (d) covers every qcqs space. `ℓ = p`: (b), and (c) with `ℓ = p`, need properness (disc) | sound |
| gap `proper-rigid-finiteness`, broadened | huber2007 lines 951–965, 67–68, 719 | `k` algebraically closed; `X` quasi-separated of finite type; `A` noetherian torsion, prime to the residue characteristic; constant `ℤ/n` constructible ∈ `C(X, X)`; printed page 996 (line 933) | the statement holds as asked |
| contract §11.2 | supplier text: the bound `cd_ℓ(X) ≤ 2 dim.tr(X/S)` | stated for every prime `ℓ` and qcqs `X` over a geometric point, `Spa(C, 𝒪_C)` included | quoted correctly |
| consumer line, DeligneWeightsAndPurityPartII | their gap hypotheses | `K` complete rank one, `V` proper, `n` invertible in `K°`: a special case of §4.2 (torsion `Λ`) together with §0.2 (`Aut_cont(C/K) = {σ̂}`) | consistent; their cup-product and reduction clauses are not claimed |

## Ownership

- **Nonproper equivariant comparison.** I searched by object (equivariant and non-proper comparison, Theorem 3.8.1 with `G_K`) on main and at the 437 open heads: there is no owner, so this roadmap owns it (§4.2). The comparison isomorphisms themselves stay with ClassicalAdicEtaleCohomology §11.1 and EtaleCohomologyFoundations §F.2.2.
- **Stalk theorem.** ClassicalAdicEtaleCohomology §1.5 owns it and is now cited; this roadmap keeps only the equivariance.
- **Lean names.** No declaration in `Suggested.lean` reuses a qualified name of another roadmap (unchanged).

## For the maintainer

- **Duplicate gap in DeligneWeightsAndPurityPartII.** Its README line 89 declares `gap:analytic-comparison-automorphisms` on ClassicalAdicEtaleCohomology. That gap asks for the automorphism compatibility that this roadmap's §§0.2 and 4.2 supply. That roadmap (merge order 375, after this one at 121) should cite §4.2 and keep only the cup-product and coefficient-reduction clauses of its gap. This package cannot make that change.
- **§4.2 heading renamed.** It is now "Equivariant comparison with analytifications". No roadmap on main or at an open head cites GaloisActionOnEtaleCohomology (`roadmaps grep`: no match), so no citation breaks.
- **Gap slug kept.** `gap:proper-rigid-finiteness` now asks ClassicalAdicEtaleCohomology for finiteness on every quasi-compact quasi-separated rigid space over `C`, proper ones included. The slug is pinned by the accepted design.
- **No suspicious instructions.** Nothing in the reviews or the fetched texts asked for actions outside this job.
