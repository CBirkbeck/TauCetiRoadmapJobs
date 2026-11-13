# Review of PadicFamiliesPartII (pull request #2280 at 88b66ee)

**Verdict:** needs changes

## R01 (P2) — §6.1: the degree range of the comparison map contradicts the README's own definition of `X((ε_v)_v)`

**Location.** `TauCetiRoadmap/PadicFamiliesPartII/README.md:940` and `:942`: "on which `deg_v ≥ 1 − ε_v` for `v ∈ I`" and then "For `ε_v ∈ [1 − 1/p, 1)` at `v ∈ I` and `ε_v ∈ [2 − 1/p, 2)` at `v ∈ Iᶜ` … the canonical map to `RΓ(X_{K(I,p)}(ε₁), ω^κ(−D))`".

**Claim.** For ε in that range the degree neighbourhood maps to the Hodge–Tate neighbourhood at level p, and `β_κ` is built from that map.

**Witness.** `p = 3`, `v ∈ I`, `ε_v = 2/3`: the README's `X(ε)` is `{deg_v ≥ 1/3}`. P20 line 4207 defines its neighbourhood by `deg ≥ ε`, and P20 line 4237 gives the inclusion for `deg ≥ 1 − 1/p = 2/3`, that is the README's `ε_v ≤ 1/3`.

**Repair.** Replace the range by "For rationals `0 < ε_v ≤ 1/p` at every v, that is `deg_v ≥ 1 − 1/p` at `v ∈ I` and `deg_v ≥ 2 − 1/p` at `v ∈ Iᶜ`," (at `p = 3`, `ε_v = 1/3` gives `deg_v ≥ 2/3`, inside P20 Lemma 14.1.2), keep the rest of the sentence, and add the Source issues bullet given below for BCGP21 §6.5.3.

## R02 (P2) — §4.7 states derived control with the highest-weight quotient; §§6.6–6.7 consume it with `ω^κ`

**Location.** `README.md:746`: "its derived `δ_κ`-fibre is `e(U^I)RΓ` of the formal mixed-level variety with `Ω^κ(−D)`".

**Claim.** The control theorem identifies the fibre with ordinary cohomology of the quotient coefficient `Ω^κ(−D)`.

**Witness.** `README.md:1025` uses "`M_I ⊗^L_{Λ_I,κ} ℂ_p` (§4.7), the last being `e(U^I)RΓ(X^mult, ω^κ(−D))`"; BCGP21 line 5150 has `ω^κ(−D)`. For `k_v − l_v = 2`, `Sym²ω_v` has rank 3 and the quotient rank 1 (`README.md:625`).

**Repair.** Replace the clause by: "for every classical κ in the component, pullback along the highest-weight projection `ω^κ → Ω^κ` of §4.2 is a quasi-isomorphism from `e(U^I)RΓ` of the formal mixed-level variety with the full coefficient `ω^κ(−D)` to the derived `δ_κ`-fibre of `M_I` (BCGP21 Theorem 4.6.1(3))".

## R03 (P2) — HigherHidaAndColemanTheory §9.6, item 4, is cited for an intertwining it states with the opposite exponent

**Location.** `README.md:7` ("is normalized there (§9.6, item 4) by `d₁ ∘ U = p^{k+1} U ∘ d₁`"), `:92`, `:1003` and `:1496`.

**Claim.** The supplier's item 4 states `d₁ ∘ U = p^{k+1} U ∘ d₁`, so §6.4 only repeats the supplier's normalization at each place.

**Witness.** `packages/HigherHidaAndColemanTheory/README.md:1396` (board package, the only copy): "with U on the middle term intertwined with p^(−k−1)U on the last". It states the ranges `s < k − 2` and `s < k + 1`, not the identity cited.

**Repair.** In the four places import from §9.6 only the exact two-term sequence and the two slope ranges, and own the identity: "The intertwining `d₁ ∘ U = p^{k+1} U ∘ d₁` is §6.4 of this roadmap at `F = ℚ`, `I = {p}` (AIP15 Proposition 7.2.3, p. 34); HigherHidaAndColemanTheory §9.6, item 4, words it with `p^{−k−1}U` on the last term, the printed reading of P20 Proposition 13.3.3.1 (Source issues)." The two eigenline computation of §6.4's first Check already separates the two readings.

## R04 (P2) — PadicLocalLanglandsForGL2Qp §0.1 is cited for general Fréchet–Stein algebras, which it does not state

**Location.** `README.md:13` ("Fréchet–Stein algebras and coadmissible modules in general are PadicLocalLanglandsForGL2Qp §0.1"), `:15` and `:255`.

**Claim.** §0.1 of that roadmap defines Fréchet–Stein algebras as inverse limits of noetherian Banach algebras with flat transitions, in general.

**Witness.** LocallyAnalyticDistributionsPartII at its open head, Scope: §0.1 has "the Fréchet–Stein property of D(H, L)"; its own `### 1.4 Fréchet–Stein algebras and coadmissible modules` owns the general notion.

**Repair.** Line 13: "Fréchet–Stein algebras over a complete discretely valued field and their coadmissible modules in general are LocallyAnalyticDistributionsPartII §1.4; the Fréchet–Stein property of the distribution algebras `D(H, L)`, here the `D(G_r)`, is PadicLocalLanglandsForGL2Qp §0.1". Change lines 15 and 255 the same way, add §1.4 to the LocallyAnalyticDistributionsPartII contract and to the *Needs* line of §7.1.

## R05 (P2) — Layers 4–6 follow the table of contents of BCGP21 §§4–6

**Location.** `README.md:585`, `:766`, `:928` (the three layer headings) and `:11`: "the Hilbert higher Coleman families of Boxer–Calegari–Gee–Pilloni 2021 §§4–6 (Layers 4–6)".

**Claim.** The organisation of the Hilbert layers is the roadmap's own.

**Witness.** BCGP21 has the largest share of locators (94 of 237). Pairs: `Layer 4 ↔ §4`, `Layer 5 ↔ §5`, `Layer 6 ↔ §6`; `6.2 ↔ 6.2`, `6.3 ↔ 6.3`, `6.4 ↔ 6.4`, `6.5 ↔ 6.5`, `6.6–6.7 ↔ 6.6`; `5.2–5.3 ↔ 5.5–5.6`, `5.4 ↔ 5.7`, `5.5–5.9 ↔ 5.8`.

**Repair.** The *Needs* lines force Layer 4 before Layers 5 and 6 (§5.1 needs §4.3, §6.1 needs §§4.1–4.3) and the chain §6.1 → §6.2 → §6.3 → §6.5 → §6.6 → §6.7; they force neither Layer 5 before Layer 6 nor a Hilbert trio parallel to Layer 3. Reorganise by what §4.7, §5.8 and §6.7 need: (a) one layer "special-fibre ordinary amplitude and the spherical-to-Klingen comparison" holding §§3.2–3.3, 4.4, 4.4a and 4.6, stated for totally real F with `F = ℚ` as a case (further sources P20 Proposition 8.2.1, p. 53, and Corollary 14.9.1, p. 102); (b) one layer "partial-ordinary families and derived control" holding §§4.1–4.3, 4.5, 4.7 with §§3.4–3.5 and the operator identities §§5.1 and 5.5 (P20 Theorem 11.3.1, p. 71); (c) the overconvergent comparison §§6.1–6.7 (P20 Theorem 14.7.1, p. 99; AIP15 Propositions 7.2.3 and 7.3.1, pp. 34–35); (d) the doubling layer last, split into the companion-operator algebra (§5.6) and the divisor geometry (§§5.2–5.4, 5.7–5.9). In line 11 name the layers by their mathematics, not by the source's sections, and extend the former-numbering table.

## R06 (P2) — the proof route of §5.8 follows BCGP21's proof clause by clause

**Location.** `README.md:898`: "the kernel is a colimit of finite-dimensional spaces stable under the commuting operators; a nonzero simultaneous eigenvector `(f, g)` with eigenvalues αβ and β gives `f = −βg`, …".

**Claim.** The route is in the roadmap's own words.

**Witness.** BCGP21 lines 6535–6543: the same five clauses in the same order; longest shared runs 6 words ("spaces stable under the commuting operators") and 5 words ("a nonzero simultaneous eigenvector (f, g)").

**Repair.** Replace the route by: "A proof route: by §5.6 the companion operator C is invertible on the source and Δ carries it to `U_Iw`, so `ker Δ` is stable under C and `U_{w,2}`, which act on it locally finitely and invertibly. Were it nonzero, after extending scalars it would contain a line on which `U_{w,2}` is a scalar u and C a scalar ξ, both nonzero. For a generator `(f, g)` the second coordinate of `C(f, g) = ξ(f, g)` reads `f = −ξg`, the first `U_Kli f = (ξ + u/ξ)f`, and `Δ(f, g) = 0` reads `Zf = ξf`, so `U_Iw f = (u/ξ)f` on the w-ordinary open. With `β = ξ`, `α = u/ξ` these are the eigen-equations excluded by §5.7, so `f = 0` and then `g = 0`."

## R07 (P3) — §2.8 needs the later §2.9, which is stated in terms of §2.8

**Location.** `README.md:463`: "*Needs:* §2.7; §2.9; ShimuraCompactifications §7.19, …"; `:473`: "Prove the conclusion of §2.8 when …".

**Claim.** The sections are in build order.

**Witness.** §2.8 lists §2.9 among its needs and §2.9 is defined by the conclusion of §2.8: each refers to the other.

**Repair.** Put the dimension-one case first: the present §2.9 becomes §2.8 "Continuation over the cusps in dimension one" with its conclusion stated in full, the theorem becomes §2.9 with `*Needs:* §2.7; §2.8; …`; update the Summary, the docstring line of `Suggested.lean` and the Checks that cite the two numbers.

## R08 (P3) — §2.7, third Check: an ill-formed count that disagrees with §2.3

**Location.** `README.md:455`: "the section is reached after `max_i d_i a_i` wall crossings at place i".

**Claim.** A point of `δ = 0` is reached after one step per integral wall.

**Witness.** The index i is bound by the maximum and then used free. With the bad complements of §2.3 (degree at least `1 − β`), BPS lines 1129–1131 pass from `]d_i a_i − 1, d_i a_i]` to `[0, d_i a_i]` in one step at place i.

**Repair.** Replace by "At place i the continuation passes in one step from `δ_i ∈ ]d_i a_i − 1, d_i a_i]` to `δ_i ∈ [0, d_i a_i]`; a point of the étale-ordinary tube `δ = 0` is reached after h steps, one per place (BPS §4.5, HAL p. 26)", and in the statement write "iterating over the places".

## R09 (P3) — `N` is used and never defined in Layer 3

**Location.** `README.md:547` ("For `ℓ ∤ Np`") and `:565` ("unramified outside `Np`").

**Claim.** N is fixed by the standing hypotheses.

**Witness.** `README.md:493` fixes only "neat prime-to-p level `K^p`"; P20 lines 4868–4869 define N as the product of the primes ℓ with `K_ℓ ≠ GSp₄(ℤ_ℓ)`.

**Repair.** Add to line 493: "N is the product of the primes `ℓ ≠ p` at which `K^p` is not hyperspecial."

## R10 (P3) — locator of the companion matrix

**Location.** `README.md:862`: "(BCGP21 the matrix before Theorem 5.8.6, p. 133)".

**Claim.** The matrix stands before Theorem 5.8.6.

**Witness.** BCGP21 lines 6443–6447: the matrix is displayed immediately before Lemma 5.8.2 (p. 133); Theorem 5.8.6 is on p. 135.

**Repair.** "(BCGP21, the matrix before Lemma 5.8.2, p. 133)".

## R11 (P3) — the description omits three suppliers that are neither on main nor in its list

**Location.** Pull request description: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim.** Every supplier is on main or in the listed pull requests.

**Witness.** `README.md:81`, `:236`, `:249` are supplier contracts with HigherHidaAndColemanTheory, LocallyAnalyticRepresentationsOfLocalGroups (board packages, in no pull request) and LocallyAnalyticDistributionsPartII (open, absent from the list and from the `merge-order` block).

**Repair.** Add: "Three suppliers are not yet on main: LocallyAnalyticDistributionsPartII (open pull request), and HigherHidaAndColemanTheory and LocallyAnalyticRepresentationsOfLocalGroups, which are not yet in a pull request; this roadmap merges after them." Regenerate the `merge-order` block.

## R12 (P3) — the description's account of the Lean file does not match the head

**Location.** Pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim.** `Suggested.lean` contains definitions and sorried theorems.

**Witness.** `TauCetiRoadmap/PadicFamiliesPartII/Suggested.lean:41–42`: an empty namespace; the elaboration prints no warning and no `sorry`.

**Repair.** "`Suggested.lean` states no declaration: none of the headline theorems is statable at the pins, and its docstring names each one and the carriers it lacks; it elaborates with no warning."

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §2.1 strict slope region | `(n,c,s) = (3,4,0)`, `(3,3,0)`, `(3,4,1/2)`; BPS line 1116 | `3 − 4(1−ε) < 0` iff `ε < 1/4`; `3 < 3` false; `ε < 1/8`; source: `c > v(α) + n` | agrees | none |
| §2.3 bad-complement filtration | BPS lines 886–933, 1060–1069 | source counts `δ_i(y) ≤ d_i a_i − 1 + β`, same as `deg L ≥ 1 − β`; `B_2` dim 1, `X²` dim 2 | agrees | none |
| §3.2 rank-zero vanishing | P20 lines 2262–2264, 2312–2313; `p = 2, 3` | `r ≥ p² + p`: 6 and 12; `Ker F ⊂ L` for order `p³` | agrees | none |
| §3.3 ordinary amplitude | P20 lines 2402–2403, 2427–2435 | `k > p+1`, `r ≥ 2` local finiteness; `[0,1]`; `r ≥ 3` quasi-isomorphism; `r = 2` iso on `H⁰`, injection on `H¹` | agrees | none |
| §3.4 away-from-p Hecke action | P20 lines 4844–4863; `ℓ = 2` | `ℓ^{−3}`, `ℓ^{−6}`: `1/8`, `1/64`; witness `(1,1,4,4) ↦ (1−X)⁴` in SmoothRepresentationsOfLocalGroups §SR.4.5, Checks | agrees | R09 |
| §3.5 Klingen Euler characteristic | P20 lines 4886–4888; `Λ₁ --0--> Λ₁` | Euler characteristic 0 with `H⁰ = H¹ = Λ₁` non-torsion; `p − 1 = 4` components at `p = 5` | agrees | none |
| §4.6 trace congruence | `p = 3`, `|Jᶜ| = 1`, `n = 0, 1`; BCGP21 lines 5286, 5439–5446 | degree `(p+1) = 4`; `n = 0`: `4f − 3f = f ∉ 3A`; extension of `ℤ/p ⊕ ℤ/p²` by `μ_p` has order `p⁴` | agrees | none |
| §4.7 derived ordinary control | BCGP21 lines 5142–5164; `k_v − l_v = 2` | source fibre coefficient `ω^κ(−D)`; README `Ω^κ(−D)`; ranks 3 against 1 | disagrees | R02 |
| §5.2 partial Frobenius | BCGP21 lines 6119–6150 | degrees `p³`, `p²`; `F_w^*ω_w ≅ ω_w^p`; marking `p^{−1}πη` | agrees | none |
| §5.4 second operator on `D_w` | `p = 3`; BCGP21 lines 6297–6307, 6396–6412 | A-exponents: `δ_D` `+8`, `δ_D^{−1}` `−8`; `1 − p − p³ + p = −26 = 1 − p³` | agrees | none |
| §5.6 companion operator | `T = 5, U = 6`, `(x,y) = (2,3)`; general T, U | `C(2,3) = (28, −2)`; `C² − TC + U = (0,0)` without commutation; both composites with the inverse are `(x, y)` | agrees | R10 |
| §5.7 no regular eigenvector | BCGP21 lines 6487–6516 | `(U_{w,2}f)|_D = αγ₂((Ha_w f)|_D) = 0` against `αβ f|_D ≠ 0` | agrees | none |
| §5.8 doubling injection | eigenline `C = ξ`, `U_{w,2} = u` | `f = −ξg`, `U_Kli f = (ξ + u/ξ)f`, `Zf = ξf`, `U_Iw f = (u/ξ)f` | agrees | R06 |
| §6.1 complexes and comparison map | `p = 3`, `ε_v = 2/3` and `1/3` | README `X(2/3) = {deg ≥ 1/3}`; inclusion needs `deg ≥ 2/3` | disagrees | R01 |
| §6.4 relative BGG | eigenlines `θe = f`; AIP15 lines 1511–1520; `k = 3` | AIP15: `Θ U = p^{m} U Θ`; forces `β = p^{−m}α`; reflected bound `−3 + 4 = 1 = k − 2` | agrees; supplier differs | R03 |
| §6.5 small-slope continuation | BCGP21 lines 7530–7533; `(k_v,l_v) = (k+r, r)`, `(2,2)`, `(5,2)` | `k_v + l_v − 3 = k + 2r − 3`; thresholds `1, −2, 1`; `min(4,1) = 1` | agrees | none |
| §6.7 one-place comparison | BCGP21 lines 7986–8007 | `χ_s − χ_t = −a − b`; slope 0 `< l_v − 3` iff `l_v ≥ 4` | agrees | none |
| §7.1b higher Coleman functors | BCGP25 lines 3949–3962, 4154–4155, 4320–4324, 4388–4397; modular curve | amplitudes `[0,ℓ(w)]` and `[ℓ(w),d]`: `[0,0]`, `[0,1]`, `[0,1]`, `[1,1]` | agrees | none |
| §7.8 four-piece filtration | `λ = (1,1;2)`, `(1,1;−2)`; BCGP25 lines 4711–4721 | `−2,−2,−3,−3`; `0,0,−1,−1`; sum `−6 − 2w` | agrees | none |
| §8.3 rank-one localization | BCGP25 lines 2869–2921; `η = (0,−1;1)` | `λ + ρ = (0,−1;w)`; `⟨η,β^∨⟩ = 0`; `((x+1)∂_x + 1)(1/(1+x)) = 0` | agrees | none |
| §8.6 de Rham classicality | BCGP25 lines 5080–5115 | hypothesis (3): each `Gr^i[m_f]` of dimension n and total `4n`; kernel of `N_a` is classical `H²[m_f]` | agrees | none |
| §9.2–§9.7 four modules | BCGP25 lines 7494–7527, 7654; `p = 2, 3` | weights `(5,3),(5,1),(2,−2),(0,−2)` at `ν = (0,−2)`; `r = 7`: `7 ≡ 3 mod 4`; `r = 11`: `11 ≡ 2 mod 3` | agrees | none |
| §2.8 classicality | modular curve, Siegel threefold; BPS lines 1331–1345 | `n = 1, c = k`: slope `< k − 1`; `n = 3`: slope `< k₂ − 3`; `κ = (6,3)` admits none | agrees | R07, R08 |
| §7.1 Fréchet–Stein import | supplier heads | general notion in LocallyAnalyticDistributionsPartII §1.4; `D(H,L)` in PadicLocalLanglandsForGL2Qp §0.1 | disagrees | R04 |

- Source locators checked against the texts: over 60 (BPS 13, P20 13, BCGP21 at least 25, BCGP25 at least 15, AIP15 1); every sampled target's theorem number and page agree.
- Library declarations opened at the pins: 8 in Mathlib (`Module.End` End.lean:33, `LinearMap.prod` Prod.lean:95, `LinearMap.coprod` Prod.lean:199, `genEigenspace` Eigenspace/Basic.lean:72, `Polynomial.aeval` AlgebraMap.lean:259, `Module.Projective` Projective.lean:71, `DerivedCategory` Basic.lean:87, `eventually_isCompl_ker_pow_range_pow` Artinian/Module.lean:307) and 3 in Tau Ceti (Verma.lean:195, CentralCharacter/Basic.lean:174, CentralCharacter/Isomorphism.lean:106); all as cited.
- Cross-roadmap citations resolved: 69 section headings opened in 14 roadmaps (27 in HigherHidaAndColemanTheory and 5 in LocallyAnalyticRepresentationsOfLocalGroups, read as board packages); the worker's resolver lists no other citation as missing; two contradicted in content (R03, R04).
- Gate at this head: every check passed. Dependency check: `depcheck: 237 roadmaps, 2141 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: exit 0, no output. It declares nothing, so the `#check` comparison and the one-tactic probe have no subject. The eight headline groups of the Summary are each named in the docstring with the missing carriers; the only native statement (§5.6) is algebra on free variables and is rightly not stated.
- The 14 declared gaps carry the same slugs in the plan and in the README, each with a named supplier and section.
- GSp4NonregularModularityLifting (open) cites this roadmap by the former numbering E6, S7, F8, which the table at `README.md:19–51` maps; it also asks this roadmap for a "horizontal-control contract" on parabolic one-weight Hida modules.

Overlap check: read GSp4NonregularModularityLifting, AutomorphicBundlesPartII, AlgebraicModularFormsAndSerreWeightsPartII, OverconvergentAutomorphicForms, PerfectoidShimuraVarieties (the other two lists are empty); the integral spherical composite `C_r` is owned by AlgebraicModularFormsAndSerreWeightsPartII §7.5, relative vanishing and the cuspidal multiplicity comparison by AutomorphicBundlesPartII §§5.2, 8.8, general analytic coefficients by OverconvergentAutomorphicForms §8.6, towers and period maps by PerfectoidShimuraVarieties, lifting and its theta doubling by GSp4NonregularModularityLifting (not compared in detail with §5.8); nothing else shared.

Source independence: 10 passages compared with 5 sources, 1 shared (R06, BCGP21 lines 6535–6543); the route of §1.4 follows one clause of BPS lines 731–733, the forced form of the maximum-principle step; largest share BCGP21, 94 of 237 locators; contents compared with BCGP21: Layers 4–6 map onto its §§4–6 (R05), the other layers independent (Layers 1–2 share the order of BPS §§3–5, forced by the chain of their *Needs* lines).

## Not verifiable

- HigherHidaAndColemanTheory and LocallyAnalyticRepresentationsOfLocalGroups are on neither main nor an open pull request; their sections were read in the board packages, which are still under review and may change.
- BP26: cited once, through HigherHidaAndColemanTheory; its text was not opened.
- The remaining Source issues bullets of the README (BPS Lemma 4.4.5, P20 Corollary 14.6.2 and Proposition 15.2.4.1, BCGP21 Propositions 4.6.19, 4.4.3 and 6.6.2, BCGP25 Definition 4.6.35, Remark 4.10.7 and Proposition 3.6.15) were not rechecked beyond the lines quoted above.
- Ownership of weight-two doubling against GSp4NonregularModularityLifting §4.2 was not compared statement by statement.

## Source issues

- **Error** in BCGP21 at §6.5.3 and Lemma 6.5.4, p. 155: the source says the degree neighbourhoods with radius at least `1 − 1/p` (respectively `2 − 1/p`) lie in the Hodge–Tate neighbourhood; it should be radius at most `1/p`, its §6.5.2 measuring from the multiplicative end; affects a stated result.
- **Error** in BCGP21 at §6.4, proof of Corollary 6.4.3, p. 154: the source says the second operator applied after the differential is `p^{k_v−l_v+1}` times the reverse composite; it should be the differential after the operator, as in AIP15 Proposition 7.2.3; affects the proof.
- **Misprint** in BCGP21 at the paragraph after Proposition 5.7.4, p. 130: the source says the restriction of δ to the divisor is its inverse; it should be δ itself, a section of `ω_w^{p²−1}`; affects nothing.
- **Misprint** in BCGP21 at Lemma 4.6.16, proof, p. 112: the source says the kernels have order `p^{3n}`; it should be `p^{4n}`, as their description as extensions shows; affects nothing.
- **Gap** in BPS at Lemma 4.4.3, HAL p. 24: the source says the product of the quotient maps to the k-fold product is finite étale; it should use each quotient map separately, the dimensions differing for `k > 1`; affects the proof.
- **Misprint** in BCGP25 at the choice of r before Lemma 7.3.8, p. 167: the source says r is not 1 modulo p and, for `p = 2`, not 1 modulo 4; it should be the first condition for odd p only; affects nothing.

## For the human reviewers

- **Scope.** BCGP25 (arXiv:2502.20645v1, 2025) is cited as a preprint with no journal reference (`README.md:1485`); Layers 7–9 take 86 of the 237 locators from it.
- **Scope.** The base roadmap HigherHidaAndColemanTheory and the supplier LocallyAnalyticRepresentationsOfLocalGroups exist only as board packages under review; this pull request cannot merge before they are on main.
- **Licence.** P20 locators use the author's PDF on the author's university page (113 pages), not the Duke pagination (`README.md:1483`); BP26 is cited as "author version".
