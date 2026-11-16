# Review of MotivesAndAlgebraicCyclesPartII (pull request #2459 at 1fff774)

**Verdict:** needs changes

## R01 (P2) — §7.6 applies `E_K` to strict rings on which §7.1 does not define it

**Location:** `TauCetiRoadmap/MotivesAndAlgebraicCyclesPartII/README.md` line 959: "On nonarchimedean strictly totally disconnected Banach rings `A` with `|ℓ| ≥ 1` everywhere on `M(A)` for every prime `ℓ ∉ S`, the functor `A ↦ E_K(A)[1/S]` is a finitary ball-invariant arc-sheaf of spectra".

**Claim:** §7.1 defines `E_K(A)` only when `A` has a topologically nilpotent unit with `n_i`-th roots. §7.6 neither assumes this of a strict `A` nor proves it, and the roots are a hypothesis of the source.

**Witness:** README line 921 (§7.4): "totally disconnected and in the class of §7.1, so that `E_K(A)` is defined". Scholze line 1944 makes the unit with roots a standing assumption on the base ring before Theorem 8.9 (line 1988).

**Repair:** Replace the first sentence of §7.6 by: "Prove: fix a set `S` of primes and a nonarchimedean Banach ring `A₀` in the class of §7.1. Every strictly totally disconnected Banach `A₀`-algebra `A` lies in that class, the image of the unit of `A₀` and of its roots being a topologically nilpotent unit with the same roots. On those `A` with `|ℓ| ≥ 1` everywhere on `M(A)` for every prime `ℓ ∉ S`, the functor `A ↦ E_K(A)[1/S]` is a finitary ball-invariant arc-sheaf of spectra, hence equals `Kmot[1/S]` over `Marc(A₀)`." The field case is unchanged (`A₀ = A = C`, a pseudouniformizer of an algebraically closed field has all roots). Add the same qualifier to the Summary clause on strict rings and to the §7.6 bullet of the pull request description.

## R02 (P3) — §4.7 does not list the section that constructs its object

**Location:** `TauCetiRoadmap/MotivesAndAlgebraicCyclesPartII/README.md` line 724: "*Needs:* §§1.8, 2.2, 2.5, 4.6; the animated group completion (gap:animated-group-completion)."

**Claim:** §4.7 is about `ℤmot[U]` for a finitary arc-sheaf of sets `U` over `X`. That object is built in §2.7 (case 2 with `n = 0`), which is neither listed nor reached through §§1.8, 2.2, 2.5, 4.6.

**Witness:** README line 469 (§2.5): "For `U ⊂ Aⁿ_X` open … free motives of more general arc-stacks are §2.7"; line 498: "for `n = 0`, that is for finitary `f`, it is `L_B f_♯ ℤ`".

**Repair:** "*Needs:* §§1.8, 2.2, 2.5, 2.7 (the free motive of a finitary arc-sheaf: case 2 with `n = 0`), 4.6; the animated group completion (gap:animated-group-completion)."

## R03 (P3) — four page ranges run one page past the cited statement

**Location:** `TauCetiRoadmap/MotivesAndAlgebraicCyclesPartII/README.md` lines 293, 320, 635, 967: "Theorem 4.1 and Remark 4.2, pp. 19–20"; "Theorem 4.14, Propositions 4.15–4.16, pp. 23–24"; "Definition 6.2, pp. 35–36"; "Corollary 8.10 and proof, pp. 47–48".

**Claim:** Each cited item, with its proof where one is cited, lies on the first page of the range only.

**Witness:** Scholze lines 791–809 (p. 19), 969–998 (p. 23), 1500–1505 (p. 35), 1992–2002 (p. 47); the page markers are at lines 789, 833, 962, 1002, 1467, 1508, 1962, 2003.

**Repair:** "Theorem 4.1 and Remark 4.2, p. 19"; "Theorem 4.14, Propositions 4.15–4.16, p. 23"; "Definition 6.2, p. 35"; "Corollary 8.10 and proof, p. 47".

## Verified sound

| Statement | Instances tried | README side | Computed / source side | Result |
|---|---|---|---|---|
| §1.1 finitary hypersheaf criterion | `C × C′`; all functions `M(A) → ℤ` on `Cont(S, C)`, `S` infinite | product- and colimit-preserving functors are hypersheaves; `H^{>0} = 0` on strict rings | `F(C × C′) = F(C) × F(C′)`; `ℤ^S ≠ colim_j ℤ^{S_j}`, so the non-finitary functor is excluded; Scholze lines 791–809 | holds |
| §1.3 complex and Galois comparisons | `A = ℂ`; `K = ℝ`, `M = ℤ(1)` | `D(ℤ)`; `M(K) = M(C)^{hG_K}` | `ℤ/2` acting by `−1` on `ℤ`: `H⁰ = 0`, `H¹ = ℤ/2`; Scholze lines 969–998 | holds; R03 on the page |
| §3.2 reduced multiplicative group | `C = ℂ_p`: `π`, a unit with residue `≠ 1`, `1 + a` | nontrivial, nontrivial, trivial | `|π| ≠ 1`; reduction to `k^×` kills exactly the one-units; `1 → k^× → Ḡ_m(C) → |C^×| → 1` | holds; line 1370 |
| §4.1 transfers | `d` copies of the identity, `d = 0, 2`; a Banach map `A → B` | acts by `d`; functor on the opposite category | `2·id`, `0`; `A → B` gives `ℕ[Marc(B)] → ℕ[Marc(A)]`, so `M(A) → M(B)` needs the opposite | holds; R03 on the page |
| §4.6 sheafification with transfers | `F` = locally constant `ℤ/ℓ`-valued functions, characteristic `ℓ`; `B = C`, `C⟨T⟩₁` | `F` ball-invariant, its sheafification not | `c_{α/ℓ}^ℓ − c_α = δ_{α,1}` forces infinitely many nonzero `c_α`; `[T] ≠ 0` in `H¹` | holds; lines 1506–1514 |
| §4.7 explicit free motives | `U = ∗` over `C` of residue characteristic `p` | value is the group completion after inverting `p` | `ℕ` completes to `ℤ`; `ℤmot[∗](C) = ℤ[1/p]`; equal after inverting `p`; lines 1485–1494 | holds; R02 on Needs |
| §6.1 motivic K-theory | `C = ℂ₂`; `1 + aT` in `C⟨T⟩₁` | `π₀ Kmot(C) = ℤ[1/2]`; `Kcn` not ball-invariant | `π₀ K(C_{<1}) = π₋₁ K(C_{<1}) = 0`, so `π₀ E_K = ℤ`; `1 + aT ∉ C^×` | holds; lines 1872–1881 |
| §7.4 KH-cofibre | `ℚ_p`; `ℚ₂[T]` with the sum norm; disc and annulus cover of `C⟨T⟩₁` | `π₀ = ℤ`; `A_{<1}` no ideal; kernel `G` | `K₀(ℤ_p) ≅ K₀(𝔽_p)`, `ℤ_p^× ↠ 𝔽_p^×`; `|2 + 2T| = 1`; `ker((u,(v,m)) ↦ (v−u,m)) = G` | holds; line 2070 |
| §7.6 strict bases (headline) | `C` algebraically closed; a general strict `A` | `E_K(A)` used on every strict `A` | `C` has all roots of `π`; for general strict `A` no unit with roots is supplied | R01 |
| §7.7 E∞-structure | `p = 2, 3`, on `π₀` | `ℤ = ℤ[1/p] ×_{ℚ_p} ℤ_p` | `ℤ[1/p] ∩ ℤ_p = ℤ` inside `ℚ_p` | holds; lines 1992–2002; R03 on the page |
| §9.1 geometric points | `C = ℂ` | compact = dualizable | `Dmot(ℂ) = D(ℤ)`: both are the perfect complexes | holds; line 2215 |
| §9.3 monadicity | `Y = ∅`; `Y = X ⨿ X` | `0`; `Dmot(X)²` | `f_*ℤ = 0`; `f_*ℤ = ℤ × ℤ` | holds; line 2315 |
| §9.5 pointwise Artin–Tate | `j_!ℤ` on `[0,1]`, `j : (0,1] → [0,1]` | in `DMT`, not Tate-generated | stalks `ℤ`, `0`; `H^*_c((0,1], ℤ) = 0` | holds; line 2354 |
| §9.7 weak Künneth | `X = Y = S`; `X = ∅` | identity; `0` | `𝒟 ⊗_𝒟 𝒟 = 𝒟`; `0 ⊗ 𝒟 = 0` | holds; lines 2333–2339 |
| §11.6 monodromy pairs | `R = ℤ[1/3]`, `A = ℤ/2`; band coordinate ring | `(ℤ/2, 0) ≠ 0`; ring `R ⊕ tℚ[t]` | `x_n = t/n`, powers span `ℚ t^d`; `A ⊗ ℚ t^d = 0`; augmentation ideal `≅ ℚ[t]`, flat | holds; lines 2566–2573 |
| §12.4 spatial-diamond retract | `X = Spa(C, O_C)` | identity of `D(ℤ/n)` | `Y = X`, both sides `D(ℤ/n)` | holds; lines 2653–2667 |
| §5.3 cancellation (headline) | complex point; `ℤ/ℓ` over nonarchimedean `C`, `ℓ ≠ p` | `M ≃ Hom(ℤ(1), M(1))` | `ℤ(1) = ℤ`; `ℤ/ℓ(1) = μ_ℓ ≅ ℤ/ℓ`, invertible | holds; line 224 |
| §6.3 Adams splitting (headline) | `ℙ²`, eigenvalues `1, 2, 4` | three projectors | values `(1,0,0)`, `(0,1,0)`, `(0,0,1)`; denominators `3, −2, 6` | holds; lines 1937–1942 |
| §§4.8, 4.9 torsion and tilting (headline) | `‖x‖ = 2^{−⌊v₂(x)/2⌋}` on `ℤ₂`; `ℂ_p` | `‖2‖ = 1`, pointwise `|2| ≤ 2^{−1/2}`; `μ_n` preserved | `2^{−⌊n/2⌋/n} → 2^{−1/2}`; `⌊(a+b)/2⌋ ≥ ⌊a/2⌋ + ⌊b/2⌋` | holds; lines 1656–1672 |
| §§8.5, 9.4 six operations (headline) | closed disc over `C`; `βℕ` over `ℂ` | not smooth; outside `P_B` | `ℤ(1)[2] ⊗ ℚ = (Ḡ_m ⊗ ℚ)[1] ≠ ℚ`; `βℕ` not metrizable | holds; lines 2182–2202 |
| §9.6 rigidity (headline) | `[0,1]`; Hilbert cube | rigid, not compactly generated; `d = ∞` | `RΓ([0,1], j_!ℤ) = 0`; `H^n_c((0,1)^n) = ℤ` | holds; lines 2263–2267 |
| §10.6 étale comparison (headline) | `ℙ¹`; `𝔽̄₃`, `n = 2`; `E × E` | `ℤ ⊕ ℤ(1)[2]`; `μ₂`, `0`; rank `≥ 3` | `k^×/k^{×2} = 0`; determinant of `(0,1,1),(1,0,1),(1,1,0)` is `2` | holds; CD lines 2048–2053, 2579 |
| §11.8 monodromy equivalence (headline) | `A = ℚ ⊕ ℚ(1)` with `N` | `N ≠ 0`, `N² = 0` | image of `N` is the twist of the second summand, which `N` kills | holds; lines 2574–2577 |
| §12.3 overconvergent comparison (headline) | constant `ℤ/n`; `j_!` from the rank-one point | overconvergent; not | specialization `id`; `0 → ℤ/n` | holds; lines 2641–2647 |
| §3.5 annulus criterion (correction E5) | `T² + T/2 + 4` over `ℂ₂`, `r₁ = 1/4`, `r₂ = 4` | bound `min = 1` excludes it | slopes `−3, 1`, root norms `1/8, 2`; `1/8 < r₁`; `max = 4` admits it | holds |
| §4.4 test sections (correction E10) | `d = 2`, `a = (0,1)`, `k = (1,1)`; `(T − a_i)^m − ct` | degree vector `(1,1)`; basis vectors | `T₊T₋ = −t`, `(T₊−1)(T₋−1) = −t`; `Q(a_i) = −ct`, `Q(a_j)` a constant times a one-unit | holds |

- Previous review (same head): it listed no findings, so there is nothing to check as repaired; the head is unchanged since it.
- Source locators read at their lines: about 90 numbered statements of Scholze (pp. 5–6, 19–24, 26, 32, 34–40, 44–64), 9 in CD, 8 in Bachmann, 2 in van der Put, 3 in Vakil. Corrections E1–E8 and E10 of the README were recomputed and hold.
- Library declarations confirmed in the pinned sources: 27 of Tau Ceti (for instance `UnitBall.lean:90, 101, 171`, `Weierstrass/Ideal.lean:115`, `TateAlgebra/Groebner.lean:427`, `Replete.lean:91`, `EtaleCoordinates.lean:98`, `SymmetricAlgebra.lean:57, 115`, `ProjectiveLine.lean:139, 428, 520`, `PuncturedAffineSpace.lean:78, 208`) and 6 of Mathlib (`ValuationSubring.lean:631, 650`, `NormedValued.lean:47`, `PowerSeries/Restricted.lean:90`, `MvPowerSeries/Restricted.lean:159`, `ContCohomology/Basic.lean:131`).
- Cross-roadmap citations resolved: 138 section or layer headings in 26 suppliers, on main or at their open heads, and the named targets `smoothAlterationPair`, `lefschetz_fixed_point_formula`, `nonempty_sheafSingularComparison`, "Generalized Jacobian of a reduced boundary". `Perf.Spd` is the prefix of DiamondsAndVStacks §D6.1 names. AnalyticStacks line 1303 assigns the operator description to this roadmap.
- Declared gaps: the 12 slugs agree between the plan and the README; none is provided by its supplier (EnhancedDerivedSheaves, SchemeKTheoryOperations and KTheoryFiniteLocalFields contain no covering dimension, group completion, Breen–Deligne, fracture square, cdh, valuation-ring or `O_C` statement).
- Gate at 1fff774: every check 0, OK (the worker's run and a rerun). `depcheck: 263 roadmaps, 2577 edges, 0 problem(s)`. No change outside the folder. `lake env lean` on `Suggested.lean`: exit 0, no output; it declares nothing, so there is no padding to probe. None of the nine headlines is statable: the pins have no Berkovich spectrum and no K-theory spectrum.
- Pull-request text: the title, the summary block and the prose agree with the head; the §7.6 bullet inherits R01.
- Overlap check: read RationalAnalyticPrismatization, ArcTopologyAndDescent, DiamondEtaleCohomology, AnalyticStacks, EnhancedDerivedSheaves, SchemeKTheoryOperations, DiamondsAndVStacks; nothing shared. RationalAnalyticPrismatization cites Layer 0 here; compact morphisms are EnhancedDerivedSheaves §E5:presentability.4, cited; the generalized Jacobian of JacobianChallengePartII is `Pic⁰` of a nodal curve, another object.
- Source independence: 25 passages compared with 3 sources (Scholze, CD, Bachmann), none shared beyond the 12-word defining clause of quasi-pro-étale maps, which the definition forces; largest share Scholze, 107 of 121 locators; contents compared with Scholze: independent (13 layers against 11 sections: Layers 2–3, 6–7 and 10–11 each split one section, Layer 0 merges two, §§0.8, 1.8, 2.7, 10.1–10.2, 10.4 have no counterpart section, and the Dependencies lines "Layers 0–(k−1)" force the order of all but Layers 7, 8 and 12).

## Not verifiable

- BLR §9.2 (cited in §4.3): the manifest records it as uncertified, so it is cited by locator and was not read.
- A `#check` probe of the cited Tau Ceti names could not be elaborated: the object files of several pinned Tau Ceti modules are not built; the names were confirmed by reading the pinned sources instead.
- Scholze Example 3.6 (correction E9) was not reread.

## Source issues

- **Misprint** in Scholze at proof of Proposition 5.19, p. 35: the source says the coefficients are bounded by the maximum of two quantities; it should be their minimum; affects the proof.
- **Error** in Scholze at proof of Lemma 6.5, p. 38: the source says the sections given by the product of powers minus `t` have degree vector `(k_1, …, k_d)`; it should be `(1, …, 1)`, so other sections are needed; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says the outer estimate holds for `|T| ≥ r₁ > 1` and bounds the inner product by `r₁ⁿ`; it should be `|T| ≥ r₂` and `r₁^{k_i}`; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says the ratio of nearby coordinates differs from one by `(T₂ − T₁)/(T₂ − a_j)`; it should be `(T₁ − T₂)/(T₂ − a_j)`; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38: the source says each annular domain contributes a factor `ℚ^e` of degrees; it should be `ℚ^d`; affects nothing.
- **Misprint** in Scholze at Definition 6.2, p. 35: the source says a presheaf with transfers is a functor from the category of transfers; it should be from its opposite; affects nothing.
- **Gap** in Scholze at Theorem 8.9, p. 47: the source says the cofibre is a sheaf on all strict rings; it should repeat the standing assumption of p. 46, a unit with roots on the base; affects a stated result.
- **Gap** in Scholze at the construction after Proposition 9.3, p. 52: the source says the formalism starts from all affine maps of finite cohomological dimension; it should start from those of Theorem 9.2 and be rerun after Corollary 10.2; affects the proof.
- **Misprint** in Scholze at Theorem 11.1, p. 57: the source says the rational mapping spectrum is the weight-`j` Adams piece of `K(X)`; it should be that piece shifted by `[−2j]`; affects a stated result.
- **Misprint** in Scholze at the construction before Definition 11.3, p. 58: the source says the induced map runs from `f_*ℤ` to `g_*ℤ`; it should run from `g_*ℤ` to `f_*ℤ`; affects nothing.

## For the human reviewers

- none
