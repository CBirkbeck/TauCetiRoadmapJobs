<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13148#issuecomment-6897238217 -->
Review (claude) of cc9d42d

Verdict: needs_changes

1. **F01** (P2) The coefficient local systems have a second owner, AutomorphicBundles §§3.4–3.5, 3.7–3.8

   **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:28–32`: "It also owns the
   realizations of the cohomology of compact Shimura varieties with automorphic coefficient systems …
   no earlier roadmap states these". Also §0.2, lines 546–559 (the local system `𝕍`, the étale sheaf
   `𝕍_ℓ`, their comparison); the gap contract, lines 242–245 ("supply: the local system `𝕍_K` … by
   descent"); `design/plan.json`, gap `shimura-matsushima-comparison`, `needs` ("construct at neat K
   the local system on S_K"); and lines 2583–2585 (Downstream consumers).

   **Claim.** No earlier roadmap states the Betti local system of a representation factoring through
   `G/Z_s`, its `ℓ`-adic counterpart on the canonical tower, or their comparison; so §0.2 constructs
   them, and the gap asks ArithmeticLocallySymmetricSpaces for the first.

   **Witness.** AutomorphicBundles is line 183 of `merge-order/ORDER.txt`; this roadmap is line 290.
   At its open head, `TauCetiRoadmap/AutomorphicBundles/README.md` states:

   - §3.4, line 1423, `bettiCoefficientLocalSystem`: the Betti local system `Γ∖(X × W)` of a rational
     representation of `Gᶜ = G/Z_s` on a neat effective arithmetic component, with the variation of
     Hodge structure of ShimuraData when the weight is rational, treated weight by weight;
   - §3.5, line 1463, `etaleCoefficientLocalSystem`: the `ℓ`-adic local system from a stable lattice on
     the canonical tower, independent of the lattice, compatible with Hecke pullbacks;
   - §3.7, line 1551, `realizationComparison`: `W_B ⊗ ℚ_ℓ ≃ W_ℓ|S_ℂ`;
   - §3.8, line 1575: tensor, dual and Hecke coherence;
   - §0.1, line 419, `centralSplitQuotient` (a representation factors through `Gᶜ` exactly when `Z_s`
     acts trivially) and §0.2, line 465, `ineffectiveFibreDescent` ("a neat group can still contain
     nontrivial central units").

   These are the first three bullets of §0.2 and its first API bullet, object for object. The package
   report (`reports/PKG-HodgeClassesForJacquetLanglands.md`, lines 62–70) records that the notion was
   moved down when AutomorphicBundles stood later in the order (235 against 168). The order has since
   changed, so the earlier roadmap is now the owner. The same holds for the last paragraph: lines
   2584–2585 name HilbertModularVarietiesAndShimuraCurves (line 162 of the order) and AutomorphicBundles
   (line 183) as downstream consumers, and a roadmap earlier in the order cannot consume this one.

   What stays this roadmap's own, and is stated by neither AutomorphicBundles nor
   HilbertModularVarietiesAndShimuraCurves (searched by object at their heads): the cohomology
   `H^i(Sh_K, 𝕍)` as an object of `M_E^L`, its Hodge structure, the unramified and de Rham properties,
   the Hecke isotypic parts and their Matsushima description, Poincaré duality, and the pullbacks and
   normalized traces of §0.3.

   **Exact repair.**

   1. Scope, lines 28–32. Replace "It also owns the realizations of the cohomology of compact Shimura
      varieties with automorphic coefficient systems, their pullbacks and normalized traces (§§0.2–0.3)"
      by "It also owns the cohomology of compact Shimura varieties with automorphic coefficient systems
      as compatible realizations (its Hodge structure, `ℓ`-adic properties, Hecke isotypic parts and
      Matsushima description), with its pullbacks and normalized traces (§§0.2–0.3)". Add a deferral
      bullet: "The Betti and `ℓ`-adic local systems of a representation of `Gᶜ = G/Z_s`, their
      comparison and their tensor, dual and Hecke compatibilities are AutomorphicBundles §§0.1–0.2, 3.4,
      3.5, 3.7 and 3.8; the quotient `Gᶜ` is ShimuraData §4.9."
   2. Add the subsection `### From TauCetiRoadmap.AutomorphicBundles` to the supplier contracts, with
      those sections and the four declaration names above.
   3. §0.2. In the first bullet cite AutomorphicBundles §3.4 for `𝕍` in place of
      gap:shimura-matsushima-comparison. In the second cite AutomorphicBundles §3.5 for `𝕍_ℓ`. In the
      third cite AutomorphicBundles §3.7 for the comparison of sheaves, keeping ComplexComparisonPartII
      C6 for the comparison of cohomology. In the first API bullet cite AutomorphicBundles §3.8. Add
      AutomorphicBundles §§0.1–0.2, 3.4–3.5, 3.7–3.8 to the *Needs:* line of §0.2 and to the
      Dependencies of Layer 0.
   4. Gap contract, README lines 242–245, and the `needs` of the plan's gap. Replace "supply: the local
      system `𝕍_K` of `L`-vector spaces on `S_K`, by descent …, acting trivially on `V`; the Hecke
      action" by "with `𝕍_K` the local system of `L`-vector spaces on `S_K` obtained by descent along
      `G(ℚ)` (AutomorphicBundles §3.4 for a Shimura datum, which is used and not built again; it is
      constructed here only for `(G, K_h)` that is not a Shimura datum), supply: the Hecke action".
   5. Downstream consumers, lines 2583–2585. Delete "in particular
      HilbertModularVarietiesAndShimuraCurves for quaternionic varieties with an arbitrary split set `Σ`
      and AutomorphicBundles for coefficient realizations".

   **Repair test.** On the instance of §0.2, `T = Res_{ℚ(√2)/ℚ}𝔾_m` with trivial `ρ` at level `K(3)`,
   AutomorphicBundles §3.4 gives the constant local system (its degenerate Check) on the one point, so
   `(dim H⁰, dim H¹) = (1, 0)` as §0.2 states. For `ρ = σ₁`, the first embedding, `Z_s = ker N` acts by
   `ε^m ≠ 1`, and `centralSplitQuotient_factor_iff` excludes it, as §0.2 does. AutomorphicBundles
   precedes this roadmap, so the new citation is not upward.

2. **F02** (P2) The gap contract's "compact quotient `G(ℚ)Z(ℝ)°∖G(𝔸)`" is not Hausdorff when SV5 fails

   **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:253–255`: "from the discrete
   decomposition of `L²` of the compact quotient `G(ℚ)Z(ℝ)°∖G(𝔸)` (AutomorphicSpectralTheory §4.7)".
   The same words are in `design/plan.json`, gap `shimura-matsushima-comparison`, `needs`.

   **Claim.** The supplier is told to obtain the Matsushima decomposition from `L²` of that quotient,
   by AutomorphicSpectralTheory §4.7, with "axiom SV5 … not imposed".

   **Witness.** For the package's own torus `T = Res_{ℚ(√2)/ℚ}𝔾_m`, `ε = 1 + √2`: the idele
   `(1, 1; ε^{2m})` equals `ε^{2m}·(ε^{−2m}, ε′^{−2m})_∞` and so lies in `T(ℚ)T(ℝ)°` for every `m`. The
   closure of `ε^{2ℤ}` in `Ô^×` is an infinite compact group, hence uncountable, so it contains some
   `u ∉ ε^{2ℤ}`. Then `(1, 1; u)` is a limit of points of `T(ℚ)T(ℝ)°` and is not in it: a rational
   `q` equal to `u` at every finite place is a totally positive unit, so `q ∈ ε^{2ℤ}`. Hence
   `T(ℚ)T(ℝ)°` is not closed and the quotient is not Hausdorff. The same happens for the centre `F^×`
   of `Res_{F/ℚ}B^×` whenever `[F : ℚ] ≥ 2`. AutomorphicSpectralTheory §4.7, at its head
   (`TauCetiRoadmap/AutomorphicSpectralTheory/README.md:2334`), is stated for "a cocompact lattice `Γ`
   in a real reductive `G`".

   **Exact repair.** In the README contract and in the plan's `needs`, replace the quoted clause by:
   "from the discrete decomposition, at each level `K`, of `L²` of the compact space
   `G(ℚ)∖G(𝔸)/Z(ℝ)°K = ⊔_g Γ_g∖G(ℝ)/Z(ℝ)°`, where `g` runs over the finite set `G(ℚ)∖G(𝔸_f)/K` and
   `Γ_g` is the image of `G(ℚ) ∩ gKg⁻¹`, a cocompact lattice in `G(ℝ)/Z(ℝ)°`
   (AutomorphicSpectralTheory §4.7 for each `Γ_g`); the adelic quotient by `G(ℚ)Z(ℝ)°` is not used,
   because `Z(ℚ)Z(ℝ)°` is not closed in `Z(𝔸)` when `Z(ℚ)` is not discrete in `Z(𝔸_f)`". Add the
   witness above to the Checks of §0.2 as a negative control.

   **Repair test.** `Γ_g` is discrete in `G(ℝ)/Z(ℝ)°`: its image in `G(ℝ)/Z(ℝ)` is arithmetic in the
   adjoint group, and `Z(ℝ)/Z(ℝ)°` is finite. It is cocompact because `S_K` is compact and
   `K_h/Z(ℝ)°` is compact. On the torus instance at level `K(3)` there is one `g`, `G(ℝ)/Z(ℝ)°` is
   `{±1}²`, and `Γ_g`, generated by `−ε⁴` (negative at both real places), has image
   `{(1,1), (−1,−1)}`. The quotient has two points, so `L²` has dimension 2 and its
   `K_h = T(ℝ)`-invariants have dimension 1. This is `H⁰` of the one-point `Sh_{K(3)}`, as the Check of
   §0.2 says.

3. **F03** (P3) Two ClassFieldTheory names that are not declarations

   **Location.** `packages/HodgeClassesForJacquetLanglands/README.md:407–408`: "Layer 10
   (`brauerSupport`, `sumLocalInv`, `sumLocalInv_eq_zero`, `eq_zero_of_localInv_eq_zero`,
   `exists_br_of_sum_eq_zero`)".

   **Claim.** These five are declarations of ClassFieldTheory Layer 10.

   **Witness.** `TauCetiRoadmap/ClassFieldTheory/README.md:300–301` (main), table "Name used elsewhere
   | Declaration | Difference": `eq_zero_of_localInv_eq_zero` is `brLocalization_injective`, and
   `sumLocalInv_eq_zero` is `sumLocalInv_brLocalization_eq_zero`. The pinned Tau Ceti declares only the
   latter two (`TauCeti/NumberTheory/ClassFieldTheory/Global/Brauer/SumFormula.lean:135`, 142).

   **Exact repair.** Write "Layer 10 (`brauerSupport`, `sumLocalInv`,
   `sumLocalInv_brLocalization_eq_zero`, `brLocalization_injective`, `exists_br_of_sum_eq_zero`)". The
   other three names resolve as written (`InvariantSum.lean:123`, 172; `Exactness.lean:98`).

Three findings: two P2 and one P3. Both findings of round 5 are repaired. `Suggested.lean`
elaborates with `sorry` as the only warning, its four signatures agree with the README, and none of
its three theorems is padding. The two blocking findings are both in text that the last repair
added: the coefficient local systems that §0.2 builds, and now asks
ArithmeticLocallySymmetricSpaces for, are already stated by AutomorphicBundles, which the merge
order now places before this roadmap; and the new gap contract names a "compact quotient" that is
not a Hausdorff space in exactly the case the contract was written for.

## Verified sound

### Round 5 findings, checked first

| Round 5 finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P1): the ArithmeticLocallySymmetricSpaces transfer is not the Shimura transfer | Line 231: "No construction on its spaces `X_K = G(ℚ)∖(G(ℝ)/K_∞A_∞ × G(𝔸_f)/K)` is consumed." Lines 651–654: "`f_*` is the covering trace onto the image, that is the transfer of this finite covering (AlgebraicTopology §5.3 …; EtaleCohomologyFoundations §0.8 …)". | **Repaired.** Recomputed below: 1 and 3 points, effective degree 3, normalized `3·(1/3) = 1`; the supplier's circles give 9. The new contract is the subject of R01 and R02; neither reopens the transfer. |
| F02 (P2): §3.5 excluded odd weights | Line 1316: "For every integer `k ≥ 2`, odd as well as even (this local statement is not subject to the global even-weight convention)"; the `k = 3` Check at lines 1349–1356; *Needs:* no longer lists §3.4. | **Repaired.** IP23 line 2002 has every `k ≥ 2`; the supplier's §3.35 (line 1034 at its head) has the `k = 3` Check. §§3.4, 5.4 and 8.2 keep even `k`, where the parity is used. |

The repaired patterns were searched in the rest of the package. No other passage consumes a
construction on `X_K`: every use of the comparison (§§0.2, 0.3, 8.4, 8.5, 10.4 and three Dependencies
lists) names gap:shimura-matsushima-comparison. No other local statement is restricted to even `k`
without using the parity.

### Principles and shape

All 75 numbered targets were read, with their 75 Checks blocks (each has at least three bullets,
counted mechanically), 75 *Needs:* lines, and the 11 Examples and 11 Dependencies subsections. No
`set_option`, sorry'd data, `lemma`, algorithm, pull-request number, date, machine path, HTML
anchor or LaTeX delimiter was found in the README or the Lean file. The title is lower-case. The end
theorems are not narrowed: the Galois statement is for all `ℓ`, and `d = 0` and `B₁ ≃ B₂` are
treated. The organisation is the roadmap's own (see Copyright below).

### Seeded source sample

All 15 targets were checked against the IP23 text; none of the manifest's locators is flagged
unverified.

| Target | Evidence read | Result |
| --- | --- | --- |
| 0.1 | IP23 lines 792–800 (Remark 3.1, p. 18), 840–856 (Theorem 3.2, p. 20) | Even weights from the central character; hypothesis is a real place ramified in both algebras, `d < n`. |
| 1.1 | IP23 lines 1168–1183 (rescaling and Definition 5.2, p. 28) | Agrees. The source's "lies in `F^×`" assumes nondegenerate Hermitian; the README states the general case. |
| 1.2 | IP23 lines 1086–1100 (Proposition 5.1, pp. 25–26, (5.1)–(5.2)) | Agrees. |
| 1.7 | IP23 lines 1249–1276 (Proposition 5.6, (5.7)–(5.10), pp. 30–31) | Kernel `{±1}`, dimension 16, the factor `ν²·det⁻¹`. |
| 2.5 | IP23 lines 1398–1413 (p. 34), diagram at lines 937–975 (p. 22) | `E^× ⋊ ⟨j⟩`, Proposition 5.13; the diagram prints `U_E` for the rank-one block, as the README notes. |
| 3.3 | IP23 lines 1861–1880 (Lemma 6.2, p. 44) | Formula and the centre `{±1} × ℝ_{>0}` agree. |
| 4.2 | IP23 lines 2120–2165 (§8.3, (8.2), pp. 50–51) | Four operator identities agree, signs included. |
| 5.2 | IP23 lines 1000–1027 (§4.3, pp. 23–24) | Centre, map to `T₁` and kernel agree; the README does not take over the source's bijection of components. |
| 7.4 | IP23 lines 3156–3160 (Lemma 10.2, p. 71), 3227 ((10.7), p. 72), 2841–2848 (§10.2, p. 66), 5081–5089 (Proposition A.14, p. 113) | Agrees; A.14 assumes a real place split in both algebras, as §7.4 does. |
| 7.6 | IP23 lines 3361–3379 (Lemma 10.4, pp. 75–76) | A unit at `v₀` that is not a norm; ramified `E_{v₀}`; `K_{v₀}`-fixed vectors. |
| 8.1 | IP23 lines 3603–3630 ((11.1), Lemma 11.1, p. 80), 3974–3986 (proof of Proposition 11.4, p. 86) | Parameter, base change, Asai decomposition agree. |
| 9.1 | IP23 lines 4157–4215 (§11.5, pp. 91–92) | `θ̂`, the contragredient of `⋀²`, the intertwiner `A`, the extension to `Γ_{F_Σ}`. |
| 9.4 | IP23 lines 4133–4148 (Remark 11.10, p. 90) | Class-group argument; the README's route is stated in its own order. |
| 10.2 | IP23 lines 4306–4308 (§12.2.1, p. 94), 3114–3120 (Proposition 10.1, p. 70), 4520–4524 (p. 98) | Conditions (i)–(iii) agree. |
| 10.7 | IP23 lines 4526–4530 (Theorem 12.4(i), p. 98) | Agrees. |

Also read: Mil17 lines 2486–2513 (Lemma 5.13 and footnote 40, p. 57), which give the description
`Sh_K = G(ℚ)∖G(𝔸)/(K_∞K)` with `K_∞` the centralizer of `h`.

### Computed adversarial table

Basis of `⋀²` is `e₁₂, e₁₃, e₁₄, e₂₃, e₂₄, e₃₄`, and `d_U(e₁₂₃₄) = −1` unless stated.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 0.1 data | `k_v = 3`; `Σ = ∅` | exponent `(2−3)/2` not integral; `d = 0`, reflex field `ℚ` | rejected and accepted as stated |
| 0.2 torus Check | `T = Res_{ℚ(√2)/ℚ}𝔾_m`, `K(3)` | `ε² ≡ −√2`, `ε⁴ ≡ −1 mod 3`, so `−ε⁴ ≡ 1`; `(O/3)^×/⟨ε⟩` has `8/8 = 1` point; translation `4·2 log ε = 8 log ε` | Check correct |
| 0.2 `ρ = 1 ⊕ N` on `Res_{ℚ(i)/ℚ}𝔾_m` | `h(z) = z` | `N∘h = zz̄`, type `(−1,−1)`; weights `0, −2` | not pure, each summand pure |
| 0.3 degree formula | `K(9) ⊂ K(3)` | `ε⁴ ≡ −1+3√2`, `ε⁸ ≡ 1+3√2`, `ε¹² ≡ −1 mod 9`: order 24; `72/24 = 3` points; index `72/8 = 9`; degree 3 | `[K̄₂ : K̄₁] = 3` |
| 0.3 `[K₂ : K₁(K₂∩Z(ℚ))] = [K̄₂ : K̄₁]` | general | `Z(ℚ)⁻ ∩ K₂ = (Z(ℚ)∩K₂)⁻ ⊂ (Z(ℚ)∩K₂)K₁`, `K₁` open | equality holds |
| 0.3 level independence | `K₁′ ⊂ K₁`, index `m` | right side `m·tr(x)·v₁′/v₂ = tr(x)·v₁/v₂` | holds |
| 0.3 neat stabilizers | central `q` of finite order on `V` | eigenvalues are roots of unity; neat gives 1 | "neat" suffices in the contract |
| R02 quotient | same torus | `(1,1; ε^{2m}) ∈ T(ℚ)T(ℝ)°`; a limit `(1,1; u)`, `u ∉ ε^{2ℤ}`, is not | **R02** |
| R02 repair | level `K(3)` | 2 points, `L²` of dimension 2, `T(ℝ)`-invariants 1 | matches `H⁰` |
| 0.5, 0.7 weights | `d` | `V_i ≃ V_i^∨(−d)`: `−d + 2d = d`; `d + d − 2d = 0` | consistent |
| 0.6 types | weights `(2, 4)` | `(3,−1), (2,0), (0,2), (−1,3)` | Check correct |
| 1.1 volume | `diag(1,2,1,−5)`; `d_U ↦ 2d_U` | `−10`; `−10/4 = −5/2` | correct |
| 1.3 headline, basis images | `diag(a₁..a₄)` | signs of `e_K ∧ e_J`: `+,−,+,+,−,+`; images `−a₁a₂e₃₄, a₁a₃e₂₄, −a₁a₄e₂₃, −a₂a₃e₁₄, a₂a₄e₁₃, −a₃a₄e₁₂` | list correct |
| 1.3 versus Mathlib's star | `σ = id`, bijective `B` | `B(⋆(Lu), y) = vol(Lu ∧ y) = B(u, y)`, so `⋆∘L = id` | "inverse of `hodgeStar`" correct |
| 1.4 headline | diagonal; `H = 0`; general Hermitian | `σ(a₁a₂/c)·a₃a₄/c = ∏a_i/(σ(c)c)`; `0 = 0`; in general `C₂(H)·adj₂(H) = det H`, a polynomial identity, so characteristic 2 is included | true |
| 1.4, arbitrary `σ` | `H ≠ 0` Hermitian | `H` is onto `E`, so `σ² = id`; otherwise `H = 0`, `L = 0` | Lean binder sound |
| 1.5 | diagonal; non-Hermitian `diag(i,1,1,1)` | `b(Le₁₂, e₃₄) = −i∏a = b(Le₃₄, e₁₂)`; `−1` against `+1` | Checks correct |
| 1.7 headline | general `g`; `H = 0` | pairing `L(⋀²g u)` with `⋀²g y`: `ν²·wp(Lu, y) = (ν²/det g)·wp(⋀²g Lu, ⋀²g y)`; `0 = 0` | true for every `σ` |
| 1.8 | `g ↦ gα` | `ν²/det` times `(σα/α)²`; `β′ = βα⁻²`; `α²·α⁻² = 1` | class independent |
| 2.1 | `β = (1+2i)+ji`, `α = 2−i`, `J = −3` | `Nrd = 8`, multiplier `8/5`, determinant `8/(3−4i) = (24+32i)/25` | correct |
| 2.3 dimensions | — | `5+5−1−1 = 8 = 7+2−1` | correct |
| 2.4 image | equal multipliers | `N(Nrd(b₁)α₁⁻¹α₂) = Nrd(b₁)Nrd(b₂)` | lands in the fibre product |
| 2.5 | `(t, t⁻¹)`; `α` on `W₀` | multiplier `t²t⁻² = 1`; `N(α)` | correct |
| 2.6 | `J₁ = −2, J₂ = 5` | images `e₂₄, −2e₁₄, 5e₂₃, −10e₁₃`; form `diag(1, 2, −5, −10)` | correct |
| 3.2 | `(z, z, N(z))` | `(N(z)², N(z)², N(z)²)` | central |
| 3.3 | `y = (1,1,1,−1)`; `(1,1,i,i)` | `(−1,−1,−1)`; `(1,1,−1)` | Checks correct |
| 3.4 | inverse map; `(2,0,0)` | `k₁+k₃ = l₁`, `k₁+k₄ = l₂`, `k₁+k₂ = l₃`; `(1,−1,1,−1)` | mutually inverse |
| 3.5 | `k = 2, 3, 4` | lowest `K`-types `(k,0,0)`; `(1+t²)² = 1+2t²+t⁴` shifted by `(1,1)` | F02 repaired |
| 4.2 | `w = x₁+ix₂`; `x₁²` | `(∂₁+i∂₂)w = 0`, so `A^Nφ₀ = 2^N w^N φ₀`; `(x−∂/2π)²φ₀ = (4x²−1/π)φ₀` | Checks correct |
| 4.4 | `e₁²` in signature `(2,2)` | trace of `e₁² − Q/4` is `1 − 4/4 = 0` | correct |
| 4.5 | `α = (1,1), (2,2), (1,2), (2,1)` | `+1, −1, εi, εi`: `(z₁+εiz₂)²` | correct |
| 5.2 | centre to torus | `[t²,1] = [t,t]`; kernel `t = ±1`, `α = 1` | correct |
| 5.3 | `j(s)` | `η((s²)⁻¹s) = η(s⁻¹) = 1` | correct |
| 7.4 | `d = 0` instance | `3` is not a norm from `ℚ₃(i)` | `d ≥ 1` needed, as stated |
| 7.5, 7.8, 7.9 weights | split and compact places | `(ℓ+3) − 1 = k_v`; `−(ℓ+3) + 1 = −k_v`; `k_v + 1` and `−k_v − 1` | consistent with §7.1 |
| 7.6 | ramified `E_{v₀}` | `N(E^×)O^× = F^×`, so `O^× ∩ N` has index 2 in every residue characteristic | a non-norm unit exists |
| 7.7 | `η_v` on `E_v¹` | `x/σ(x) = x²`, so `η_v = χ_v²` there | order 2 rejected correctly |
| 8.1 | `ω_σ = ξ_E` | `As⁺∘BC = Sym² ⊕ (⋀² ⊗ ξ_E)`; `⋀²σ ⊗ ξ_E = 1` | `L(Sym²σ)·ζ_F` |
| 8.6, 8.7 | six rows | `p+q+m`: `2k, 2k−2, 2k, 2k, 2k+2, 2k`; `λμ^{−k′} = α⁻²` gives `k′ = k−1` | table correct |
| 9.1 | `d = 0, 1, 2` | dimensions `1, 6, 36`; `ν` acts by `ν⁻¹` | correct |
| 9.3 | — | `dim H¹_f = 1 + 0`; `D_cris(ℚ_ℓ(1))^{φ=1} = 0`, so `H¹_g = H¹_f` | correct |
| 9.4 | length-two `W` | each pushout to `ℚ_ℓ` by `ℚ_ℓ` is a quotient, so de Rham; its class is 0 | induction sound |
| 10.2 | `B = B₁·B₂` | `B` ramifies only where one `B_i` does; `E` nonsplit there | `E` embeds in `B` too |
| 10.6 | `diag(x₁c₁, x₂c₂)` | `x₁x₂c₁c₂`; zero at `x = (1,0)` | two-step choice needed |
| 10.7, 10.8, 10.9 headlines | `d = 0`; `d = 1` | rank one, any nonzero class; types `(1,0)+(0,1)` paired to `(1,1)`, then `(0,0)` after `(1)` | consistent with §§0.6, 8.8 |

### Lean acceptance test

- `lake env lean` on `packages/HodgeClassesForJacquetLanglands/Suggested.lean`, from the content
  checkout: exit 0; the only output is three `declaration uses 'sorry'` warnings, at lines 70, 81
  and 95. The single import is `Mathlib`.
- `#check @name` for the four declarations in one scratch copy: every theorem keeps
  `[FiniteDimensional E U]`, `σ`, `vol`, `hkl`; `comp_self` keeps `hH` and `b`; `map_similitude`
  keeps `g`, `ν`, `hg`. They agree with §§1.3, 1.4 and 1.7. Nothing changed.
  `[FiniteDimensional E U]` follows from `hkl`, since `finrank = 4`; it is harmless.
- One-tactic probe on all three theorems, five scratch copies: `simp [IsExteriorStar]`, `rfl`,
  `infer_instance`, `aesop` and `exact?` each fail on each theorem. No padding.
- Headlines. Stated: §§1.3, 1.4, 1.7. Named in the docstring with the missing carriers: the Hodge
  class (§10.7), its weight-two case (§10.9), the conditional Galois statement (§10.8), the
  exceptional isogeny and isomorphism as algebraic groups (§§1.7–1.8), nonvanishing (§7.10),
  rigidity (§6.5), purity (§8.8), the restriction formulas (§§4.5–4.6), unipotent triviality (§9.4).
  No statable headline is absent.
- The four backticked names of the roadmap's own are all declared.

### Library declarations opened at the pins

| Declaration | File and line |
| --- | --- |
| `exteriorPower.wedge`, `wedgePairing`, `Module.Basis.topVector`, `isUnit_apply_topVector`, `instIsPerfPairWedgePairing` | `Mathlib/LinearAlgebra/ExteriorPower/WedgePairing.lean:34`, 42, 78, 92, 130 |
| `exteriorPower.pairingDual`, `pairingDual_ιMulti_ιMulti` (the matrix is `f j (v i)`) | `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean:64`, 71 |
| `exteriorPower.hodgeStar` (bijective bilinear `B`; the identity `Δ • ⋆⋆x = (−1)^{kl} x` is listed as not proved, lines 21–26) | `Mathlib/LinearAlgebra/ExteriorPower/HodgeStar.lean:48` |
| `LinearMap.map_exteriorPower_finrank_eq_det_smul`, `Module.Basis.exteriorPowerTopEquiv` | `TauCeti/LinearAlgebra/ExteriorPower/Basis.lean:157`, 175 |
| `TauCeti.QuaternionAlgebra.rescaleJEquiv`, `normMulEquiv` | `TauCeti/Algebra/Quaternion/SymbolEquiv.lean:226`, 426 |
| `tensorAlgEquivTensorMatrix`; `TauCeti.BrauerGroup.quaternionClass_mul` | `TauCeti/Algebra/Quaternion/TensorProduct.lean:192`; `BrauerClass.lean:255` |
| `TauCeti.symPowerRep` | `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:57` |
| `TauCeti.Hodge.HodgeStructureOn`, `tateTwist`, `internalHom` | `TauCeti/Geometry/Hodge/Structure.lean:62`; `Tate/Twist.lean`; `InternalHom/Basic.lean` |
| `IsCoveringMap.singularTransfer` and its degree formula | `TauCeti/AlgebraicTopology/Singular/Transfer/Basic.lean:179`; `Degree.lean:65` |
| `MvPolynomial.funext`, `groupCohomology.H1ofAutOnUnitsUnique` | resolved by `#check` in the scratch file |

### Supplier citations resolved

Every cited section was looked up at main or at the supplier's open head, this round.

- ArithmeticLocallySymmetricSpaces: §§ALS.0.4, 0.6, 3.6 (`π_* ∘ π^* = [K : K′]`), 5b.1, 5b.4 exist
  (lines 1309, 1399, 2988, 4258, 4384).
- ShimuraVarieties: §§1.3, 1.6, 4.2, 4.3, 4.9, 6.7, 8.1, 8.3, 8.5, 8.6, 8.7, with the seven named
  declarations. These are the seven names the `citations.md` leads list; they are that roadmap's
  planned names, not library names.
- MetaplecticAutomorphicForms: all 28 cited sections, and the 14 names; §3.35 reads as the README
  transcribes it before dualizing.
- GL2AutomorphicRepresentationsAndTransfer: the 12 cited sections (R17.4.13 is at line 2645).
- MotivesAndAlgebraicCycles §§2.2, 2.3, 2.6, 2.7, 7.1, 7.15; ShimuraData §§3.1, 3.3, 3.10, 4.3;
  AutomorphicFormsOnReductiveGroups §§2.6, 4.2, 5.1, 5.2, 5.4, 5.7; AutomorphicSpectralTheory
  §§0.25, 0.26, 4.7; AutomorphicLFunctionsAndLocalFactors §AL.3.6.3; AdelicAlgebraicGroups §§3.4,
  4.3; EndoscopicTransferAndUnitaryTraceComparison §1.8; GeometryOfNumbersAndQuadraticArithmetic
  §4.3 (`polynomial_fischer_decomposition`, line 1547); ComplexComparisonPartII C6; PadicHodgeTheory
  §§3.3, 4.4, 7.2, 8.1; PadicPeriodRings §1.4; SelmerIwasawaCohomology §§2.7, 4.9;
  ArithmeticGaloisRepresentations §1.2.
- On main: AlgebraicTopology §§2.6, 5.3; EtaleCohomologyFoundations §§0.8, F.2.1, F.2.2, F.3;
  ComplexKahlerGeometry K6.0, K6.1; ClassFieldTheory Layers 6–8, 10, 11, with the former §5.4 mapped
  to W.4 by its table (line 275); ReductiveGroups Layers 3, 6; ReductiveGroupsPartII RG2.5.1–2;
  SchurWeyl Layer 9; SpinRepresentations Layer 6. Completed: GlobalNumberFields Layers 1, 2, 4, 6,
  9, 10; HodgeStructures; OrthogonalSpinGroups.

No forbidden roadmap is cited. `roadmaps resolve` on the README reports no citation and no Lean
name found nowhere.

### Declared gaps

The eight slugs agree between the README and the plan, each with a named earlier supplier and the
heading form `What <Supplier> must provide (gap:<slug>)`. Seven are precise and minimal as written.
The eighth, `shimura-matsushima-comparison`, is the subject of R01 (it asks for a local system
AutomorphicBundles states) and R02 (the quotient it names). Acceptance is not conditional yet.

### Dependency check

    depcheck: 245 roadmaps, 2251 edges, 0 problem(s)

There is no `UPWARD`, `CYCLE` or `moved:` line.

### Duplication and overlap

`IsExteriorStar` is declared in no other `Suggested.lean`, on main or at an open head. The pinned
`hodgeStar` is bilinear and needs a bijective form; the three Lean targets are not instances of it.
`scratch/overlaps.md` lists no conflicting head, no dropped id and no id that only a revision
defines; the board's package index lists two other packages, neither on this subject.
HilbertModularVarietiesAndShimuraCurves owns one-real-split curves and definite algebras, and its
§R18.4.24b is a special case of the central-torus issue; it does not own §§0.2–0.5.

Overlap check: read MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactorsPartII, ExceptionalThetaCorrespondencesForG2, EndoscopicTransferAndUnitaryTraceComparison, ShimuraData (open), AdelicAlgebraicGroups, SpinGeometry (main), the third list being empty, and also AutomorphicBundles and HilbertModularVarietiesAndShimuraCurves; the Betti and `ℓ`-adic coefficient local systems are shared with AutomorphicBundles, which owns them (R01); nothing else is shared.

### Copyright, licences and arrangement

Wording: the 15 sampled passages and 7 further ones (the docstring of `IsExteriorStar` against IP23
§5.2; §8.6 against p. 88; the route of §9.4 against Remark 11.10; §1.6 against p. 34; §0.3's proof
route against Mil17 Lemma 5.13; §7.6 against the proof of Lemma 10.4; §5.3 against p. 24) were put
beside the source. None shares more than a formula or a standard phrase of about five words.

Arrangement: IP23 has 116 of the 128 source locators. Its sections map to the layers as
`§§2–3, 4.1 → Layer 0`, `§5 → Layers 1–2`, `§§6, 7.2 → Layer 3`, `§8 → Layer 4`,
`§§4.2–4.3, 12.2 → Layer 5`, `§9 → Layer 6`, `§10 → Layer 7`, `§§11.1–11.4 → Layer 8`,
`§11.5 → Layer 9`, `§12 → Layer 10`. This is not one to one: §5 and §11 are split, §§6–7 merged, §4
moved after §8, Appendix A left to a supplier. The order of Layers 3 to 10 is forced: §4.4 needs
§3.1, §5.4 needs §§3.4 and 4.1, §7.4 needs §6.2, §8.1 needs §§6.5 and 7.10, §9.2 needs §8.1, and
§10.6 needs §§8.8 and 10.4.

Reuse: the table under Worked examples is the roadmap's own form; the source has a list without the
shifted column. No public formalisation with these Lean names was found.

Source independence: 22 passages compared with 2 sources (IP23, Mil17), none shared; largest share IP23, 116 of 128 locators; contents compared with IP23: independent. Wal85 was not compared again this round; round 5 read it.

## Not verifiable

- The supplier contracts and gaps were checked for existence, statement and ownership, not as
  proofs: none of the cited open roadmaps is formalised.
- The three Lean theorems have `sorry` bodies. They were checked by hand computation on the
  instances in the table, not by a proof.
- Wal85 was not reopened this round; the passages that cite it were not changed by the last
  repair.

## Source issues

- **Error** in IP23 at §4.3, printed page 24: the source says a character of the norm-one idele classes is evaluated at `(t₁t₂)⁻¹α`; it should be a character of all idele classes trivial on `𝔸_F^×`, since that argument has norm `N(α)⁻¹`; affects a stated result.
- **Gap** in IP23 at §4.3, printed page 24: the source says the components are in bijection with the torus Shimura variety; it should justify this, since the derived group is not simply connected; affects the proof.
- **Gap** in IP23 at §10.2, printed page 66: the source says the Weil representations have the needed compatibilities for every split set; it should assume a real place split in both algebras, as its Proposition A.14 does; affects the proof.
- **Misprint** in IP23 at the proof of Proposition 11.6, printed page 88: the source says the Hodge type of the `(1,1)` row with an unclosed pair; it should close the pair, giving `(k_v − 1, k_v − 1)`; affects nothing.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cc9d42d55b96b2a2b9009c0a64e3a28c0c74b384", "job": "REV-PKG-HodgeClassesForJacquetLanglands~6", "model": "fable", "worker": "chris-x79"} -->
