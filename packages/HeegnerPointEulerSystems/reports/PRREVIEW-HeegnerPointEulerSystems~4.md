# Review of HeegnerPointEulerSystems (pull request #1423 at c6b3301)

**Verdict:** needs changes

Incremental re-review of the 6 changed lines since 2870127 (three README citations of SelmerIwasawaCohomology §2.12a), together with the two board-side edits the repair reports (the plan's `gaps` list and the sources manifest), the gate and the elaboration.

## R01 (P2) — Five README supplier contracts are still not registered as plan gaps

**Location:** `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:137`, 187, 227, 255, 257 (each “What <Supplier> must provide (gap:<slug>)”) and the Scope-and-ownership table at lines 59–64; `packages/HeegnerPointEulerSystems/design/plan.json`, top-level `gaps`.

**Claim:** The Zhang, modified-edge, distinguished-lattice and quartic-CM/Hilbert-family routes consume declared supplier obligations.

**Witness:** The README names 16 distinct `gap:` slugs; the plan's `gaps` list now has 11 entries (the plan-only `jsw-propagated-specialization` entry was retired, which is the part of the previous repair that was applied). A slug join still leaves five README contracts with no plan entry: `zhang-integral-realization` (HilbertModularVarietiesAndShimuraCurves, line 137), `modified-heegner-descent` (EulerSystemsAndKolyvaginSystems, line 187), `kato-distinguished-lattice` (KatoEulerSystems, line 227), `ordinary-quartic-comparisons` and `hilbert-family-divisibility` (AutomorphicCongruences, lines 255 and 257); and the plan's `zhang-level-raising` entry still asks SerreWeightAndLevelOptimisation for the quaternionic multiplicity-one identifications that README line 213 assigns to the HilbertModularVarietiesAndShimuraCurves contract. A contract counts as declared only when the plan carries the same slug, so the intake announces none of these five obligations to its supplier, and the routes through §§4.10, 5.3, 6.1, 6.5–6.19, 8.6a, 8.16, 8.27–8.34, 8b.5 and every Layer 8/8b consumer rest on obligations no supplier job will see.

**Exact repair:** Add five objects to the plan's top-level `gaps`, each `{slug, supplier, section, needs}` with the README's owner and its `needs` sentence as written at the line cited: `zhang-integral-realization` / HilbertModularVarietiesAndShimuraCurves / Layers R18.1–R18.5 (line 137); `modified-heegner-descent` / EulerSystemsAndKolyvaginSystems / §§4.18–4.19, 5.10–5.13, 8.28, 8.31, 8.36 (line 187); `kato-distinguished-lattice` / KatoEulerSystems / integral modular lattice and étale isogenies (line 227); `ordinary-quartic-comparisons` and `hilbert-family-divisibility` / AutomorphicCongruences / the two-variable and Hilbert-family sections (lines 255, 257). Replace the `needs` of `zhang-level-raising` by the README sentence at line 213. Test: a slug-and-owner join of README against plan then gives 16 matches and no unmatched entry on either side (today: 11 matches, 5 README-only). No file in the pull request changes.

Re-raised: H01 of the repair answer to the previous review (“applied differently”). The answer does not dispute the finding; it says the repair job may retire plan entries but not add or narrow them and leaves the additions to the worker. That is a scope limit of the repair job, not a reason the finding is wrong, and the same registration has now been requested in three rounds without anyone making it: it needs the worker or a human to edit the plan.

## Previous findings

- R01 — partly repaired: plan `gaps` 12 → 11 (`jsw-propagated-specialization` retired, matching README line 171 “not an imported arithmetic JSW formula”); the five README-only slugs and the un-narrowed `zhang-level-raising` entry remain. Carried as R01 above.
- R02 — repaired: `abelianSelmerGroup_finite` occurs 0 times; lines 167, 1269 and 1309 now read “finiteness of `Sel_φ(A/K)` for every isogeny”, which SelmerIwasawaCohomology states at its open head (§2.12a, paragraph “Finite Selmer and reduced primary groups”, its README line 691).
- R03 — repaired: `packages/HeegnerPointEulerSystems/sources.toml` now has key `matar-nekovar` (arXiv:1808.09544v2, open repository, certified, `locator_scheme = "theorem"`, locators §§0.4–0.5 and Propositions 6.4–6.5, `cited_for` §§5.7, 6.2–6.4); its sha256 is the cache text the brief lists, so the four locators verified in the previous review are now backed by a manifest entry.

## Verified sound

**What was reviewed.** The three changed lines (README 167, 1269, 1309) and the targets they belong to (§7.7 and §7.12, read in full, with the Layer 7 context of §§7.3, 7.5–7.6 they rely on); the two board-side repairs; `Suggested.lean` (49 lines, unchanged, declaring nothing beyond its docstring and namespace). Head `c6b33015…`, worktree clean, outside-folder diff against main empty.

**Gate and elaboration.** The worker's gate at this head passed every scanner (`build=0`, `depcheck=0`, `readme-ids-missing=0`, `stray-files=0`). Rerun from the worktree: `depcheck: 203 roadmaps, 1656 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line; this roadmap is at line 351 of the merge order and SelmerIwasawaCohomology (line 55) is above it. `lake env lean` on `Suggested.lean` exited 0 with no output; there are no declarations, so there was nothing to `#check`, nothing to probe with one tactic and no padding.

**The changed citation, resolved.** SelmerIwasawaCohomology at its open head, §2.12a “Abelian Kummer and Sha interfaces” (README line 676): `K` a number field, `A, B` abelian varieties over `K`, `φ : A → B` an isogeny, `Sel_φ(A/K)` built from the discrete Selmer structure of EllipticCurves Layer 7 with local Kummer images, the descent sequence `0 → B(K)/φA(K) → Sel_φ(A/K) → ker(Ш(A/K) → Ш(B/K)) → 0` (line 680), and finiteness of `Sel_φ(A/K)` for every number-field isogeny through `H¹(G_{K,S},A[φ])` of ArithmeticGaloisDuality §R02.3.1 (line 691). What §§7.7 and 7.12 need is exactly the case `B = A`, `φ` = multiplication by a generator of a principal power `𝔭^M` of a coefficient prime of `O_L ⊂ End_K(A)` (an isogeny, since its norm is nonzero), where the sequence reads `0 → A(K)/𝔭^M → Sel_{𝔭^M}(A/K) → Ш(A/K)[𝔭^M] → 0`, which is nekovar line 2096 (7.1.2). The citation is at the supplier's generality and no hypothesis of the supplier is dropped.

**Seeded sample.** Of the fifteen sampled targets only “7.12 Admissible RM Kolyvagin–Logachev application” falls in a changed passage; the other fourteen are untouched since 2870127 and stand as verified in the previous report. 7.12 and the other changed target 7.7 were re-read at their locators (page markers in the author preprint coincide with printed pages):

| Target | Source passage | Result |
| --- | --- | --- |
| 7.7 | nekovar line 2093–2097 (7.1.2, p.43: `0 → A(F′)⊗O_𝔭/𝔭^M → S(A/F′,𝔭^M) → Ш(A/F′)[𝔭^M] → 0`); line 2209–2215 (Theorem 7.3, p.45: under (⋆) and `e_β(y) ∉ A(H)_tors`, `𝔭^{C(𝔭)}` kills `S(A/H,𝔭^M)^{(β)}/O_𝔭κ₁` for `M ≫ 0`, `C(𝔭) = 0` for almost all 𝔭); line 2219 (`C₅ = ord_𝔭[H:K]`, `C₆ = ord_𝔭 deg φ`); line 2303 (p.47: `2²¹𝔭^{2C₀+2C₁+4C₂+4C₃+C₅+C₆}` in the case `β² = 1`); §3.5 line 942 (𝔭^M principal for `M ≫ 0`) | matches: `H = K`, `β = 1` gives `C₅ = 0` and `B = 2C₀+2C₁+4C₂+4C₃+C₆+21v_𝔭(2)` |
| 7.12 | nekovar line 901–926 (Theorem 3.2, pp.18–19: data (3.1.1–6), hypothesis (⋆), `e_α(y_j)` non-torsion ⇒ `(A(K(x))⊗O_L)^{(α)}/O_L e_α(y_j)` and `(Ш⊗O_L)^{(α)}` finite); line 933–941 (§3.5: `A = A_j ⊗ O_L`, `y = Tr_{K(x)/K(α)}(y_j)`); line 2216 (7.4: Theorem 7.3 implies 3.2 through 7.1.2); line 2232 (7.5, p.46) | matches the trivial-character case `K(α) = K`, `y = Tr_{K(x)/K} y_j`; (⋆) is carried in the README's RM context as “A does not acquire CM over K” (§7.3, line 1209) |

**Adversarial pass.** Rows for the two changed targets and the changed supplier line carry the values computed this round; every other row is carried from the previous report, where its values are recorded.

| Statement | Instances tried and values computed | Result / change |
| --- | --- | --- |
| 7.7 (changed) | `B = 2`, 𝔭 odd: `Ш[𝔭^∞] = ⋃_M Ш[𝔭^M]` is killed by `𝔭²`, so `Ш[𝔭^∞] = Ш[𝔭²]`, a quotient of the finite `Sel_{𝔭²}(A/K)` (SIC §2.12a) — finite; a divisible summand `L_𝔭/O_𝔭 ⊂ Ш[𝔭^∞]` is not killed by `𝔭²`, so the uniform `B` excludes it; non-example for the insufficiency clause: `ℚ_p/ℤ_p` has finite `p^M`-torsion (order `p^M`) for every `M` yet is infinite. Class number `h` of `L`: `𝔭^{hk}` is principal for every `k`, so the principal exponents are cofinal. `C₅ = v_𝔭[K:K] = v_𝔭(1) = 0`; dyadic `v_𝔭(2²¹) = 21·v_𝔭(2)`, `= 21` unramified, `42` when `v_𝔭(2) = 2` (as the §7.6 Check) | sound; no change |
| 7.12 (changed) | `y` non-torsion, `L ⊂ End⁰_K(A)` acts on `A(K)⊗ℚ`: `L·y` is a 1-dimensional `L`-space, ℤ-rank `[L:ℚ]`; `A(K)⊗O_𝔭/O_𝔭 y` killed by `𝔭^B` and `A(K)` finitely generated (HRPO §1.7) ⇒ `(A(K)/O_L y)⊗ℤ_p` finite for one `p` ⇒ rank `A(K) = [L:ℚ] = dim A` (RM: `dim A = [L:ℚ]`); `Ш` finite from §7.7 at every 𝔭 and §7.10 (zero at almost all 𝔭). `L = ℚ`: rank 1, Gross Theorem 1.3; `L` real quadratic: rank 2. Nontrivial `α` is not claimed (left to ArithmeticStatisticsPartVI's character multiplicity one, as line 171–173 says) | sound; no change |
| SIC §2.12a line 167 (changed) | `B = A`, `φ = [𝔭^M]`: SIC's sequence (its line 680) specialises to `0 → A(K)/𝔭^M → Sel_{𝔭^M} → Ш[𝔭^M] → 0`, the same as nekovar 7.1.2; finiteness for every isogeny ⊇ finiteness for every principal `𝔭^M`; `φ = 0` is not an isogeny, so the vacuous case is excluded by SIC's hypothesis | sound; no change |
| 0.1 | `√2 ↦ [[0,2],[1,0]]` over ℚ₅: `a+b√2 ↦ [[a,2b],[b,a]]`, integral iff `a,b ∈ ℤ₅`, order `O_E`; `[[0,10],[1/5,0]]`: entry `b/5` forces `b ∈ 5ℤ₅`, order `ℤ₅+5ℤ₅√2`; split `L×L`, `g=[[1,π⁻¹],[0,1]]`: `g⁻¹diag(a,b)g = [[a,(a−b)π⁻¹],[0,b]]`, condition `a−b ∈ πO` | sound (carried from the previous report) |
| 0.2 | `ℤ+3ℤi`: index 3, discriminant `3²·(−4) = −36`; all-maximal local family gives `O_E` | sound (carried from the previous report) |
| 0.3 | ℚ(√−5): `(2,1+√−5)` has norm 2 and `a²+5b²=2` has no integer solution, so nonprincipal; identity idele gives the unit class | sound (carried from the previous report) |
| 0.4 | `ℓ ∤ c`: `#(O_K/ℓ)^×/(ℓ−1) = ℓ+1, ℓ−1, ℓ`; `ℓ | c`: `#(𝔽_ℓ[ε])^×/(ℓ−1) = ℓ`; ℚ(i), c=1, ℓ=3: `u=2`, kernel `4/2=2`, and `h(O₃) = 1·3·(1+1/3)/2 = 2` | sound (carried from the previous report) |
| 0.5 | ℚ(√−5): `h=2`, `[K[1]:K]=2`; ℚ(i): 1 | sound (carried from the previous report) |
| 0.6 | S₃ with `σ=(123)`, `τ=(12)`: `τστ⁻¹ = (132) = σ²= σ⁻¹`; abelian C₃ quotient | sound (carried from the previous report) |
| 0.7 | rank `[K_P:ℚ_p] − [F_P:ℚ_p] = [F_P:ℚ_p]`: 1 for F=ℚ, 2 for quadratic `F_P` | sound (carried from the previous report) |
| 0.8 | C₃: `s ↦ s⁻¹ = s²`; `27−s−s²` fixed by `s ↔ s²` | sound (carried from the previous report) |
| 0.9 | `Λ={(a,b): a−b∈πO}` has basis `(1,1),(π,0)`; trace dual generated by `(π⁻¹,−π⁻¹)`; different `(π,−π)`, norm `−π²`; discriminant `det[[2,π],[π,π²]] = π²`; ℤ₂[i]: different `(1+i)² = (2i)`, valuation 2 | sound (carried from the previous report) |
| 1.4 | `ξ = D/2`, `deg D = 2`: `2x−D` has degree 0, `x−D` degree −1; cusp gives `d=1` | sound (carried from the previous report) |
| 1.5 | negation orbit `{1,−1}`: trace 0, selected point 1; zero quotient kills everything | sound (carried from the previous report) |
| 1.6 | `ψ: E→E′`, `E(K)/tors → E′(K)/tors` injective (finite kernel) so `I′ = j·I`; `c_{ψφ} = a·c_φ`; `N=5077, D=−7`: `h=1`, one summand | sound (carried from the previous report) |
| 2.1 | q=5: `(0,6),(1,5),(2,4)`, each sum 6; positive conductor `1+5` (cornut-vatsal line 2255–2262) | sound (carried from the previous report) |
| 2.2 | `u=2`, two equal terms `P`: `u·Tr = 4P` versus `2P` | sound (carried from the previous report) |
| 2.3 | eigenvalue 2, trivial Artin actions: split `2−1−1 = 0`, ramified `2−1 = 1` | sound (carried from the previous report) |
| 2.4 | exponents `2→1→0`; q=5: 6 neighbours minus 1 predecessor leaves 5; `prˡ = P·prᵘ` | sound (carried from the previous report) |
| 2.5 | δ=2: `L(0)/L(2) ≅ O/π²` cyclic, `πL(0)` gives `k²`; q=2 fibre `e₀,e₁,e₂` with `e₀+e₁+e₂ = 0`: `T(e₀) = e₁+e₂ = −e₀`; coefficient 4 ↦ −4 | sound (carried from the previous report) |
| 2.6 | 𝔽₉ = 𝔽₃[i]: `i³ = −i`, `i⁹ = i`; `Fr₃² = id` | sound (carried from the previous report) |
| 2.7 | `𝒩 ∩ 𝒩′ = ∅` since `a_ℓ ≡ ℓ+1 ≡ 0` versus `p ∤ q²−1`, so `q ∤ n`; residue field 𝔽_{q²} | sound (carried from the previous report) |
| 3.1 | ℤ₅/5: `5e ↦ 0`, `e ↦ 1`; `R = ℤ₅[ϖ]`, `ϖ² = 5`: 5 has ϖ-length 2 | sound (carried from the previous report) |
| 3.2 | trivial unramified 𝔽₅²: `T/(Fr−1)T` of dimension 2 | sound (carried from the previous report) |
| 3.3 | ℤ/25 component group: 5-length 2 | sound (carried from the previous report) |
| 3.4 | `5ℤ₅ ⊂ ℤ₅`: same ℚ₅-span, quotient of order 5 | sound (carried from the previous report) |
| 3.5 | `25ℤ₅`: saturation ℤ₅, length 2 | sound (carried from the previous report) |
| 3.6 | coordinate swap τ on ℤ₂²: `(1+τ)(1,0) = (1,1)`, `(1−τ)(1,0) = (1,−1)`, sum `(2,0)` | sound (carried from the previous report) |
| 4.1 | `y² = x³−x`: 19 and 199 ≡ 3 mod 4 so supersingular, `#E(𝔽₁₉) = 20`, `#E(𝔽₁₉₉) = 200`, `a = 0`; `(−7/19) = (19/7) = (5/7) = −1`, `(−7/199) = (3/7) = −1`; `−7 ≡ 1 mod 8` so 2 splits; conductor 32; `(20)+(200) = (5)`, intersection `(25)`, product `(125)` | sound (carried from the previous report) |
| 4.2 | `D = Σ_{i=1}^{d−1} iσ^i`: `(σ−1)D = d − Σ_{j<d} σ^j`; d=3 coefficients `(2,−1,−1)`; Zhang's sum to d differs by `d·1 ∈ I_ℓ` | sound (carried from the previous report) |
| 4.3 | p=5: `2·id` in the image, `x = 2x ⇒ x = 0`; trivial representation has invariants of dimension 2 | sound (carried from the previous report) |
| 4.4 | `χ(x,y) = (x+y,y)`: `χ(−1,1) = (0,1)`, `χ(1,1) = (2,1)`; zero map ℤ→ℤ not an equivalence | sound (carried from the previous report) |
| 4.5 | Gross Prop. 4.7: `c(n) = 0 ⇔ P_n ∈ pE(K_n)`, `d(n) = 0 ⇔ P_n ∈ pE(K_n)+E(K)` | sound (carried from the previous report) |
| 4.6 | `D₁ = 1`, orbit sum `= Tr_{K[1]/K} P₁ = y_K`; `d(1) = 0` | sound (carried from the previous report) |
| 4.7 | `σ_ℓ ↦ σ_ℓ^u`: scalar factor `u⁻¹`, tensor factor `u`; u=2 mod 5: `3·2 = 1` | sound (carried from the previous report) |
| 4.8 | `v_ϖ(p) = e`: reduction mod `p^m` needs `M(n) ≥ em`; e=2, m=1 gives 2 | sound (carried from the previous report) |
| 4.9 | Gross Prop. 5.4: `ε_n = ε(−1)^{f_n}`; with `w = −ε` this is `w(−1)^{ν+1}` | sound (carried from the previous report) |
| 4.10 | `k = k₀ = 𝔽₅`: identity, marking ×2 sends 1 to 2; `k = 𝔽₂₅`: `t ∉ 𝔽₅`; ϖ ↦ 0 mod ϖ | sound (carried from the previous report) |
| 5.1 | `Σ_{i=1}^{ℓ} i = ℓ(ℓ+1)/2` (howard line 912–915); not integral at p=2 | sound (carried from the previous report) |
| 5.2 | trivial Frobenius on 𝔽₅²: `P = (1−X)²`, `Q = X−1`, `Q(1) = 0`; `diag(1,2)` and the swap at `e₁`: `(0,2) ≠ (0,1)`; generator change `3·2 = 1`; conjugation `4·4 = 1` | sound (carried from the previous report) |
| 5.3 | edge −1 over 𝔽₅: `1 ↦ 4`, both of order 5; bottom 3 stays 3; zero family gives zero edges | sound (carried from the previous report) |
| 5.4 | Howard Theorem A: p odd, `p, D, N` pairwise coprime, `G_K → Aut(T)` surjective; central scalars of order `p−1` kill `H¹` | sound (carried from the previous report) |
| 5.5 | `(1±τ)/2` not integral at p=2 | sound (carried from the previous report) |
| 5.7 | p=3: `−2 ≡ 1`; p=2: `−2 = 0`; p=7: `−2 = 5`, `5·3 = 15 ≡ 1`; square-determinant subgroup of `GL₂(𝔽₇)` has index 2 and contains `−I` and the unipotents; fixed lines of the two unipotents are `⟨(1,0)⟩`, `⟨(0,1)⟩` | sound (carried from the previous report) |
| 5.8 | ℤ/25 component length 2; lattice quotient 5ℤ₅ ⊂ ℤ₅ length 1 | sound (carried from the previous report) |
| 5.9 | Tate curve `v(q) = 5`: component order 5; `μ₅ ⊂ K_v`, `v(q) = 1`: `E[5] ≠ 0`, component order 1 | sound (carried from the previous report) |
| 6.1 | `Sel_{p∞} ≅ ℚ_p/ℤ_p ⊕ M ⊕ M`, `length M ≤ length(S_p/ℤ_pκ₁)` (howard line 58–62); `D ≠ −3,−4` is Howard's §1.7 setting (line 836) | sound (carried from the previous report) |
| 6.2 | Gross Prop. 8.2: local triviality away from λ forces `s_λ = 0` by reciprocity; “non-CM” is implied by full `GL₂(𝔽_p)` at odd p | sound (carried from the previous report) (redundant hypothesis, P3 note only) |
| 6.3 | Claim 10.3 `Sel(E/K)_p = ℤ/pℤ·δy_K`; second class excluded through the composite Kummer field | sound (carried from the previous report) |
| 6.4 | MN Prop. 6.5: p ≠ 2, `D ≠ −3,−4`, `E[p]` absolutely irreducible over `G_K` ⇒ (6.3.1); full `GL₂(𝔽_p)` ⇒ image over K of index ≤ 2 ⊇ `SL₂` ⇒ absolutely irreducible; `p | D_K` and `p | N` allowed | sound (carried from the previous report) |
| 6.5 | `Sha[p∞] = M⊕M`: length `2·length M ≤ 2·length(E(K)⊗ℤ_p/ℤ_p y_K)` once `S_p = E(K)⊗ℤ_p` | sound (carried from the previous report) |
| 6.6 | Zanarella Theorem 2.3.6: `p > 4`, `L ⊇ L_s`, equality iff primitive; scaling by p raises the index by 1 | sound (carried from the previous report) |
| 6.7 | Zhang Theorem 4.3: `loc_{q₁}c(n,m) ∈ H¹(K_{q₁},k₀)`, `loc_{q₂}c(n,mq₁q₂) ∈ H¹(K_{q₂},k₀(1))`, equal up to a fixed unit | sound (carried from the previous report) |
| 6.8 | finite line `k₀` versus singular line `k₀(1)` at q; surjective `loc_q` drops the dimension by one | sound (carried from the previous report) |
| 6.9 | Zhang Theorem 7.1: p ≥ 3 good ordinary, image ⊇ `SL₂(𝔽_p)`, ramified `ℓ ∥ N`; `v_𝔭(L/Ω) = length Sel + Σ t_g(ℓ)` | sound (carried from the previous report) |
| 6.10 | `L^alg = L/Ω^can · η_ratio⁻¹`, unit iff locally nonzero bottom class | sound (carried from the previous report) (as stated by Zhang §6) |
| 6.11 | Zhang Theorem 6.4: ♥, `N⁻` with an odd number of factors, `v_𝔭(η_g(N)/ξ_g) = Σ_{ℓ|N⁻} t_g(ℓ)`; ♥(2) alternatives at line 1313–1316 | sound (carried from the previous report) |
| 6.12 | empty support ∞; `c(1) ≠ 0` gives 0; support at 6 gives 2 | sound (carried from the previous report) |
| 6.13 | zero family: all primes `∤ D_KNp`; `p` never in the locus | sound (carried from the previous report) |
| 6.15 | `ε_n = w_g(−1)^{ν(n)+1}` agrees with Zhang Theorem 1.2 (line 175) | sound (carried from the previous report) |
| 6.18 | Lemma 8.4: `dim Sel^{ε_ν} = ν+1`, opposite `≤ ν`, `2ν+1` detecting primes; ν=1 gives 2, ≤1, 3 | sound (carried from the previous report) |
| 6.19 | Theorem 1.1 / 9.3: `N⁻` squarefree even, surjective, ♠, p ≥ 5 ordinary, `p ∤ D_KN`; unit 2 keeps `1 ↦ 2 ≠ 0`; `3·2 ≡ 1 mod 5` | sound (carried from the previous report) |
| 7.1 | `(12,18) ∈ ℤ²`: 2-adic depth `min(2,1) = 1`, 3-adic `min(1,2) = 1` | sound (carried from the previous report) |
| 7.2 | `SL₂(ℤ_p)`: scalar commutant, determinant image `{1}`, infinite index; full image spans `M₂(ℤ_p)` | sound (carried from the previous report) |
| 7.3 | `u = −1`: `v₃(−2) = 0`, `v₂(−2) = 1`; `M₂(O_𝔭)` gives `C₃ = 0`; scalars never contain `ϖ^c E₁₂` | sound (carried from the previous report) |
| 7.4 | `u₀ = 2`, unramified dyadic: `M₀ = 1`, `8/2 = 4`; `v_𝔭(2) = 2`: `M₀ = 2` | sound (carried from the previous report) |
| 7.5 | `Φ_ℓ Fr = −Fr Φ_ℓ` matches nekovar 7.2.4; `κ₁ = 𝔭^{C₁}δ(y)` | sound (carried from the previous report) |
| 7.6 | nekovar line 2303 exponent reproduced; `(12,18)`: `C₀(2) = C₀(3) = 1`; trivial constants: `B = 0` odd, `21v(2)`, 42 if `v(2) = 2` | sound (carried from the previous report) |
| 7.8 | `|D_M| ∣ N` with all `N`-primes split in K forces `M ≠ K` | sound (carried from the previous report) |
| 7.9 | constants zero outside a finite set ⇒ `Sha[p∞] = 0` there | sound (carried from the previous report) |
| 7.10 | a nonzero p-primary element has a nonzero p-torsion multiple | sound (carried from the previous report) |
| 7.11 | Gross Theorem 1.3 and Nekovář Theorem 3.2: rank 1 and finite Sha from a non-torsion `y_K` | sound (carried from the previous report) |
| 7.13 | Kolyvagin Theorem A: `#Sha ∣ d·C_K²`, `ord_ℓ d = 0` for `ℓ ∈ B(E)` (odd `ℓ ∤ disc O` with surjective `O_ℓ`-linear image); `(ℤ/5)³` has exponent 5 and order 125 | sound (carried from the previous report) |
| 8.1 | p=5, `a_p=1`: inert 35, split augmentation 25; `(5−s+s²)(5+s−s²) = 25 + 2s³ − s⁴ − s² = 27−s−s²`, content 1, augmentation 25 | sound (carried from the previous report) |
| 8.2 | `P₁=4, P₀=2, α=2`: `(4 − 2/2)/2 = 3/2`; split/inert initial corrections as cgls (4.3) | sound (carried from the previous report) |
| 8.3 | `cor(raw[k+2]) = a_p raw[k+1] − raw[k]`, `cor(raw[k+1]) = p·raw[k+1]` (howard line 1272–1277) | sound (carried from the previous report) |
| 8.4 | ℤ/7: `π = id, Φ = 5`: `q = 5`; `π = 0`, bottom 1: insoluble; `tr = id`, scalar 0 with bottom 1: `q = 1` and `q = 0` conflict | sound (carried from the previous report) |
| 8.5 | ℤ/2 self-edge, bottom projection 0, trace id, scalar 1: families 0 and 1 both satisfy; difference obeys the homogeneous laws | sound (carried from the previous report) |
| 8.6 | `(1,0)` nonzero with second coordinate 0 | sound (carried from the previous report) |
| 8.6a | from `0 → S_src → S → C_S → 0` and `Λy_src/Λay_src ≅ Λ/(a)`: `char(S/Λy∞) = (a)char(C_S)char(S_src/Λy_src)`; from `0 → K_X → X_tors → X_src,tors → C_X → 0`: `char(X_tors)char(C_X) = char(X_src,tors)char(K_X)`; squaring and substituting the source equality gives `char(K_X)char(S/Λy∞)² = (a)²char(C_X)char(C_S)²char(X_tors)`; `y_src = 25, a = 5`: `(5²) → (5³)`, squares `(5⁴) → (5⁶)`; `f = [5]`: `char(C_S) = (5)`, `K_X = C_X` for an endomorphism of a torsion module, correction `(25)`; `diag(5,1)`: cokernel ℤ/5, determinant 5 | sound (carried from the previous report) |
| 8.7 | identity preceding quotient: empty stratum; `G(n) = C₂` with trivial `G₀`: the identity character is primitive | sound (carried from the previous report) |
| 8.8 | F = ℚ: one real place, sign −1; one more inert odd-exponent prime: +1 | sound (carried from the previous report) |
| 8.9 | cv-dynamics Theorem 2.9 with `R` pairwise distinct modulo `P`-rational elements, compact open `G`, Haar `dg` | sound (carried from the previous report) |
| 8.10 | Corollary 2.10: `Red(Gx) = C⁻¹(Gx̄)` off a finite set | sound (carried from the previous report) |
| 8.11 | Theorem 5.10: `P`-new θ, `χ₀ω = 1`, good x, `n ≫ 0`; standing non-exceptional assumption at cornut-vatsal line 165 | sound (carried from the previous report) |
| 8.12 | Theorem 1.4: definite, `χ₀ω = 1`, `L(π,χ,1/2) ≠ 0` for some primitive χ at every large n | sound (carried from the previous report) |
| 8.13 | p=5, `u_K=1`, `α=2`, `β=5/2`: split `4·(3/2)² = 9 ≡ 4`, inert `4·(25/4−1) = 21 ≡ 1`; `u_K = 1` under (disc); `1` and `1+T` share level-zero value 1 but ratio `1+T`; `1` and `5` generate distinct lines | sound (carried from the previous report) |
| 8.14 | `α_m = ξ_{(p−1)p^{m−1}}`: exponents 4 and 20 at p=5; `α_{m+1} = α_m^p` | sound (carried from the previous report) |
| 8.15 | `ind(5) = 2` in ℤ₅[ϖ]; `ind₃(ϖ³) = 3` versus extended ∞; `M₀ = 3, M∞ ≤ 1` example | sound (carried from the previous report) |
| 8.16 | `(5,5,5)`: `25/5 = 5`; `(5,1,1)` versus `(25,1,5)`: both ratios 5, raw products 5 and 25; `[5]` on a rank-two lattice has cokernel `(ℤ/5)²` | sound (carried from the previous report) |
| 8.17 | `c_w(α) ≡ c_w mod p^m` (bcgs Lemma 1.2.8); under (Heeg) each `ℓ | N` gives two `w` with `c_w = c_ℓ`, product `∏c_ℓ²` | sound (carried from the previous report) |
| 8.18 | `G = 0`, `L = R` in degree 0: fibre `R[−1]`, `H¹ = R`; unshifted cone has `H⁰ = R` | sound (carried from the previous report) |
| 8.19 | inert: `p²+1−(a_p²−2p) = (p+1)²−a_p²`; split: `(p+1−a_p)²` | sound (carried from the previous report) |
| 8.20 | two good places of distinct residue characteristic away from P bound torsion (cornut-vatsal Lemma 2.7) | sound (carried from the previous report) |
| 8.21 | Theorem 4.1 hypotheses and conclusion as in the sample table; `e_χα(x) ≠ 0` in `A ⊗ ℂ` | sound (carried from the previous report) |
| 8.22 | Theorem 1.5: `ω = 1`, `N, D, P` coprime, odd `|S|` | sound (carried from the previous report) |
| 8.24 | cgls Theorem 4.1.1: `E(K)[p] = 0` ⇒ nonzero `κ₁^Hg` with class-number shifts `d(k)` | sound (carried from the previous report) |
| 8.25 | p=3, r=0: `γ ↦ 4`; `v_p((1+p)^{p^r} − 1) = r+1` | sound (carried from the previous report) |
| 8.26 | bcgs Theorem 1.1.6: `κ₁(α) ≠ 0` for nontrivial `α ≡ 1 mod p^m`, `m ≫ 0` | sound (carried from the previous report) |
| 8.27 | `(0,1)` unchanged by identity derivative and restriction; `χ⁻¹(0,1) = (−1,1)` is a different class | sound (carried from the previous report) |
| 8.28 | transverse at `ℓ | n`, unramified away from `pNn`, `Fil⁺` at `v | p` (howard Lemma 2.3.4) | sound (carried from the previous report) |
| 8.29 | `α(γ) = 6`: `ι(γ) ↦ 1/6`, `6·(1/6) = 1`, `36 ≠ 1` in ℤ₅; `−1 → 24 → 4` versus `1 → 1 → 4`; `(1,2) ↦ (−1,−2)`, sum −3 | sound (carried from the previous report) |
| 8.30 | howard Theorem B: `p ∤ h_K`, ordinary, Theorem A hypotheses; `X ∼ Λ⊕M⊕M`, `char(M) = char(M)^ι`, `char(M) | char(S/H)` | sound (carried from the previous report) |
| 8.31 | cgls Theorem 4.1.2 in `Λ[1/p,1/(γ−1)]`, `Λ[1/p]` under corank one; `D = −3` odd but fails (disc), `u_K = 3`; `D = −7` passes | sound (carried from the previous report) |
| 8.32 | bcgs Lemma 1.1.5: `(α_p−1)²(β_p−1)²` split, `(p+1)²−a_p²` inert; `(α−1)²(β−1)² = (p+1−a_p)²` | sound (carried from the previous report) |
| 8.33 | bcgs Theorem 1.3.1: fixed `t`, `M, E` depending only on `T_pE`, `E = 0` under (sur); `κ̃₁ = 5³e`: length 3, `5²κ̃₁` length 5, bound uses 3; `diag(1,2)` versus the swap | sound (carried from the previous report) |
| 8.34 | `A/(T²)`, `Q = A/(T³)`: `2 ≤ 3`, `4 ≤ 6`, `(T⁴) ⊃ (T⁶)`; `A/(T⁴)`: `4 ≤ 3` fails and inverting T hides it; `diag(2,3)` over 𝔽₅: invariants `(2−1)x = (3−1)y = 0` force 0, yet reducible | sound (carried from the previous report) |
| 8.35 | `y² = x³+8x+2` mod 5: `x = 1, 2` give `y² = 1`, others nonsquares (2, 3, 3): 5 points, `a₅ = 1`, `b = 5`; `(1,6)` mod 25: `λ = 11·12⁻¹ = 11·23 = 3`, `2P = (7,1)`; `λ = −5·21 = 20`, `3P = (17,24)`; `λ = 9·22 = 23`, `4P = (11,14) ≠ −P = (1,19)`, and every lift of a mod-5 point differs by `E₁`, killed by 5 mod 25, so `h = 1`, `s = 5`; `y² = x³+x`: points `O,(0,0),(2,0),(3,0)`, `a₅ = 2`, `b = h = s = 1`; `j = ×5`, `locκ = 5`: `I = 5`, `C = 5`, index 25 | sound (carried from the previous report) |
| 8.36 | valuations `2 + 2 + 2(1+2) + 2 = 12` versus 9 counting rational primes once; `h = 1, b = s = 5, t = 2, C = 5, #Sha = 25`: `5⁴ = 25·25·1`, `I·5 = 25·5·5` so `I = 5³`, `I² = 5⁶ = 25·5⁴` | sound (carried from the previous report) |
| 8.37 | `IC = p^t b s` and `p^{2t} = #Sha·C²·∏c·h²` give `I² = #Sha·∏c·(hs)²b² = #Sha·∏c·b⁴`; anomalous example `625 = b⁴ ≠ h⁴ = 1`; with `M_r(α) = M_r + 2v(b₀)` the shift cancels in `2(M₀−M∞)`, which is what makes §8.43's `M∞ = Σv(c_ℓ)` consistent with §8.41 | sound (carried from the previous report); bcgs Corollary 1.2.12 writes `#H⁰(ℚ_p,E₀[p∞])⁴` through the identification at bcgs line 575 (Source issues) |
| 8.38 | `Λ(1,0) ⊂ Λ²` has rank 2; `y ↦ py` scales by `p²`; `y = 5`: coefficient 25; `a = γ`: `γ·γ⁻¹ = 1` | sound (carried from the previous report) |
| 8.39 | cs Prop. 3.2.3 as in the sample table | sound (carried from the previous report) |
| 8.40 | `(1+5^m)⁻¹ ≡ 1 mod 5^m`; `(1,0) ∈ ℤ₅²` rank one inside rank two; `5⁴ℤ₅` of index 625 | sound (carried from the previous report) |
| 8.41 | `κ₁ = ϖ³`, `M∞ = 1`: `2(3−1) = 4 = length (R/ϖ²)²`; `×ϖ`: `(4,2)`, still 4; ℤ₅[ϖ]: `ind(5) = 2`, length 4 not 2; 𝔽₃²: 4 lines × 2 nonzero vectors + 0 = 9 | sound (carried from the previous report) |
| 8.42 | bcgs Theorem A hypotheses as in the sample table | sound (carried from the previous report) |
| 8.43 | Theorem B: `p > 3`, (sur), integral conjecture, p-optimal; `M∞ = Σ_ℓ v_p(c_ℓ) = ½Σ_w` | sound (carried from the previous report) |
| 8.44 | cs Corollary 3.3.4: `index² = L_p²·Tam_E²·#X_BK` up to a unit | sound (carried from the previous report) |
| 8.45 | cs Theorem C: `p > 3`, (sur), `p ∤ c_φ`, good ordinary, p unramified in K; equivalence, with inert p permitted | sound (carried from the previous report) |
| 8b.1 | square-root `L_BDP` of bcgs versus single power of bcs/cgs, compared as ideals after the same extension | sound (carried from the previous report) |
| 8b.2 | bck Theorem 5.2 integral under `H⁰(G_K,ρ̄) = 0`; cgls Prop. 4.2.1 in `Λ^ur ⊗ ℚ_p`; `(3)` versus `(1)` in ℤ₃⟦T⟧: lengths 1 and 0 at `(3)`, both unit after inverting 3; rescaling the line by 3 adds 2 to the square valuation | sound (carried from the previous report) |
| 8b.3 | p inert in F, `D_F` odd, `D_F`-primes split in K, `ℓ ≡ −1 mod p` inert in F (bcs Prop. 5.2.1) | sound (carried from the previous report) |
| 8b.4 | bcs Theorem 4.2.1: (irr_K), odd ordinary p, rational divisibilities; integral under (sur) | sound (carried from the previous report) |
| 8b.5 | opposite bounds `b₁ ≤ a₁`, `b₂ ≤ a₂` with `a₁+a₂ ≤ b₁+b₂` and `(a₁,a₂) = (1,2)` force `(b₁,b₂) = (1,2)` | sound (carried from the previous report) |
| 8b.6 | bcs Theorem 1.2.2(a): `p > 3`, (irr_ℚ), equality in `Λ ⊗ ℚ_p` | sound (carried from the previous report) |
| 8b.7 | Theorem 1.2.2(b): (sur), equality in Λ; prime-to-p isogeny gives integral Selmer isomorphisms; `(a)²` for `ay∞` | sound (carried from the previous report) |
| 8b.8 | Theorem 1.2.4(a): torsion `X_Gr`, `(L_BDP)` in `Λ^ur ⊗ ℚ_p` | sound (carried from the previous report) |
| 8b.9 | Theorem 1.2.4(b): integral in `Λ^ur` | sound (carried from the previous report) |
| 8b.10 | cgs Theorem C: `p ∤ 2N` Eisenstein, (Heeg), (disc), (spl), `φ|G_p ≠ 1, ω`; bcgs Theorem 1.2.13(i) | sound (carried from the previous report) |
| 8b.11 | bcgs line 97–100: Eisenstein branch and `p > 3` (irr); (sur) integral through bcs | sound (carried from the previous report) |
| 8b.12 | Tamagawa p-parts 5 and 25: `M∞ = 1+2 = 3`, K-product valuation 6 | sound (carried from the previous report) |
| 8b.13 | cs Theorem C “in particular, if p splits” (line 227) | sound (carried from the previous report) |
| Kato contract Checks | `diag(1,5)`: identity on the line, cokernel ℤ/5; `×2`: determinant 4, unit; `×5`: cokernel `(ℤ/5)²`; bottom `5e` with saturation indices 1 and 5: `5/1 = 25/5 = 5` | sound (carried from the previous report) |
| AutomorphicCongruences contract Checks | `(5T)` and `(T)`: equal after inverting 5, `(5)`-valuations 1 and 0; `(T) ⊃ (T²)`; `n⁻ = O_F` has 0 factors, even | sound (carried from the previous report) |

Conventions recur unchanged: the exponent `2C₀+2C₁+4C₂+4C₃+C₆+21v_𝔭(2)` of §7.6 (line 1251) is the one §7.7 uses, with `C₅` dropped for the trivial character in both; the constants `C₀` (§7.5, `(12,18)` gives `C₀(2) = C₀(3) = 1`), `C₁` (§7.5), `C₂, C₃` (§7.3) and `C₆ = v_𝔭(deg λ_A)` (§7.6) are the same objects in §§7.7 and 7.12 as in the previous report's rows.

**Supplier citations resolved this round** (at the supplier's open head or on main): SelmerIwasawaCohomology §2.12a (line 676, paragraph at 691, as above); EulerSystemsAndKolyvaginSystems §§4.13, 4.18–4.19, ArithmeticGaloisDuality R02.2, HeightsRationalPointsAndObstructions §1.7, HilbertModularVarietiesAndShimuraCurves R18.1 and R18.4, GrossZagierAndArithmeticHeights §8.11 and EllipticCurves Layers 6–7 are unchanged citations on the two `*Needs:*` lines and were resolved in the previous report. No new library declaration is cited. Ownership against open pull requests: unchanged objects, checked in the previous report; nothing new is constructed.

**Declared gaps.** The eleven plan entries are unchanged in text and each still names a supplier; the retired `jsw-propagated-specialization` asked for what §8.36 proves here, so retiring it was right. The five README contracts are precise and separate their conclusions (R01 is a registration defect, not a `needs` defect).

## Not verifiable

- none. Every text consulted this round (nekovar, the SelmerIwasawaCohomology README at its open head, the plan and manifest on the board) was readable.

## Source issues

- none found in the passages checked this round (nekovar §§3.1–3.5, 7.1–7.5). The entries recorded in the previous report (howard Theorem 1.7.5; bcgs Remark 1.2.4, Theorem 2.2.2, Lemma 1.2.5; bcs Proposition 5.2.1) stand.
