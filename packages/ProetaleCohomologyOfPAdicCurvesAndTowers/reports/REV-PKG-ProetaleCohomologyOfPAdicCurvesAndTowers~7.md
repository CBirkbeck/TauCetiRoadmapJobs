<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13166#issuecomment-6852033418 -->
Review (claude) of b9ffd1c

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §4.6 states the similarity theorem for overconvergent affinoids, on objects defined only for curves without boundary

   **Location:** `README.md:581` (§4.6): "for `Y` an overconvergent affinoid or a curve without boundary defined over a finite `K/ℚ_p`, with `C = ℂ_p`, the `WD_Y`-representations `H¹_proét(Y^sp, ℚ_ℓ(1))` (`ℓ ≠ p`) and `H¹_HK(Y)(1)` are similar (CDN-CURVES Théorème 8.12 = Remarque 0.16(ii))".

   **Claim:** Théorème 8.12 covers overconvergent affinoids, and `Y^sp`, `WD_Y` exist for them.

   **Witness:** `README.md:557` (§4.4) defines `Y^sp`, `W_Y`, `WD_Y` "for a curve without boundary" only. CDN-CURVES lines 4284–4285, 4324, 4372, 4542: §8 and Théorème 8.12 are for curves without boundary; line 4352 (footnote 49) uses the absence of `0+` points. `WD_Y` occurs in the source only in lines 4410–4560. Remarque 0.16(ii) (lines 412–415) is a statement about `Aut(Y)` and `WD_K`, not `WD_Y` and `Y^sp`.

   **Exact repair:** replace the first sentence of §4.6 by:

   > Prove that for a curve without boundary `Y` defined over a finite `K/ℚ_p`, with `C = ℂ_p`, the `WD_Y`-representations `H¹_proét(Y^sp, ℚ_ℓ(1))` (`ℓ ≠ p`) and `H¹_HK(Y)(1)` are similar (CDN-CURVES Théorème 8.12); together with §4.5, the `WD_K`-representations `WD(H¹_proét(Y, ℚ_ℓ(1)))` and `H¹_HK(Y)(1)` are similar, compatibly with `Aut_K(Y)`. For an overconvergent affinoid `Y^†` defined over `K`, for which `Y^sp` and `WD_Y` are not defined (§4.4), prove the `WD_K`-statement: `WD(V)`, formed by the recipe of §4.5 from the `G_K`-representation `V = H¹_proét(Y^†, ℚ_ℓ(1))` (§4.1(c)), and `H¹_HK(Y^†)(1)` are similar (CDN-CURVES Remarque 0.16(ii)), by the same weight splitting applied to the filtrations of §§4.1(a) and 4.3.

   Tested on the instance that refuted the original, the overconvergent closed annulus over `K`: `Y^sp` is not needed; `V = ℚ_ℓ` (the residue class of the Kummer class of `T`, fixed by `G_K`), so `WD(V) = ℚ_ℓ` with `N = 0` and Frobenius `1`; `H¹_HK(Y^†)(1) = C̆(−1)(1)` has `φ = σ`, linearized Frobenius `1`, `N = 0`: similar. Overconvergent closed disc: both sides `0`. Nothing downstream uses the `WD_Y` form for an affinoid: §7.4 applies §4.6 to `M_n^ϖ`, a curve without boundary.

2. **F02** (P2) §2.4: the symbols of a leg are used through a group and a restriction map that are not defined

   **Location:** `README.md:394–395` (§2.4): "Restriction gives maps `Symb_ℓ(Y) → Symb_ℓ(Y_i^gen) → Symb_ℓ(Y_{i,j}^gen)`" and "with `u_{i,n} ∈ A_{ℓ,n}(Y_i^gen)`, `v_{i,n}` meromorphic on `Y_i^gen` and `g_{i,j,n}` meromorphic on `Y_{i,j}^gen`".

   **Claim:** the localized symbols and the maps of (c) are defined for every `i ∈ I`, legs included.

   **Witness:** `README.md:391` defines `A_{ℓ,n}(Y)` for a quasi-compact curve only; a leg's generic fibre is an open annulus. `Symb_ℓ(Y_a^gen) = ℤ_ℓ ⊗̂ O(Y_a^gen)^×` consists of units, while a symbol `(f_n)` of a Tate curve with `Div(f_n) = ℓ^n(P_n − Q_n)`, `P_n` in the leg, restricts to a non-unit. CDN-CURVES lines 2036–2038 define `A_{ℓ,n}` of a leg with finite-support divisors; Lemme 4.4 (lines 2041–2050) gives the map.

   **Exact repair:** in the bullet *Symbols of the pieces*, after the definition of `Symb_ℓ(Z^gen)`, add:

   > For a leg or a ghost circle `Z` let `C(Z^gen)` be the field of fractions of `O(Z^gen)`. For a leg, `A_{ℓ,n}(Z^gen)` is the group of `f ∈ C(Z^gen)^×` whose divisor has finite support and is divisible by `ℓ^n` (CDN-CURVES §4.1.2, lines 2036–2038), and the natural map `Symb_ℓ(Z^gen) → lim_n A_{ℓ,n}(Z^gen)/(C(Z^gen)^×)^{ℓ^n}` is an isomorphism, a divisor of finite support on a leg being principal (CDN-CURVES Lemme 4.4, lines 2041–2050). The restriction `Symb_ℓ(Y) → Symb_ℓ(Y_a^gen)` to a leg is `(f_n) ↦ (f_n|_{Y_a})` followed by the inverse of this isomorphism.

   and in the bullet *Localized symbols* write "`u_{i,n} ∈ A_{ℓ,n}(Y_i^gen)` (for a leg, in the sense above), `v_{i,n} ∈ C(Y_i^gen)^×` and `g_{i,j,n} ∈ C(Y_{i,j}^gen)^×`".

   Tested on the instance: for the Tate-curve symbol above, `f_n|_{Y_a}` has divisor `ℓ^n P_n` of finite support; choosing `h_n` with divisor `P_n` on the leg, `u_n = f_n h_n^{−ℓ^n}` is a unit and `u_{n+1}/u_n` is an `ℓ^n`-th power of a unit (normality, line 2044), so the restriction is the class of `(u_n)` in `ℤ_ℓ ⊗̂ O(Y_a^gen)^×`. A function with infinitely many zeros on the leg (a bounded series whose Newton polygon has infinitely many slopes) is excluded from `A_{ℓ,n}`, as the gluing in the proof of Lemme 6.1 (lines 3143–3152) needs: the glued `u_n` must be rational on `Y`.

3. **F03** (P3) "Downstream consumers" names a roadmap that does not consume §6.10

   **Location:** `README.md:985`: "**CompletedCohomologyAndLocalGlobalCompatibility, Part II** (Thorne's level raising, the route of ModularityAndLanglandsExtensionsPartII): Thorne's Theorems 3.5–3.6 rest on §6.10."

   **Claim:** CompletedCohomologyAndLocalGlobalCompatibilityPartII contains Thorne's level raising.

   **Witness:** `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/README.md:1–3` is about patched modules and density of lifts; it contains no "Thorne", "Drinfeld" or "Dat". `packages/ModularityAndLanglandsExtensionsPartII/README.md:443` places Thorne 2024 §§3–6 in "CompletedCohomologyAndLocalGlobalCompatibility … (gap:drinfeld-steinberg-detection): in §0.7".

   **Exact repair:** replace the bullet by:

   > **CompletedCohomologyAndLocalGlobalCompatibility** §0.7, through the gap `drinfeld-steinberg-detection` that ModularityAndLanglandsExtensionsPartII declares on it (Thorne's level raising): Thorne's Theorems 3.5–3.6 rest on §6.10.

   Tested: the gap's `needs` at line 443 names `RΓ_c(Ω^{n−1}, k)`, the complex of §6.10(c), and the supplier it names is the base roadmap, §0.7 of which exists at its open head ("Definite unitary forms for global patching"). It is a consumer statement, no *Needs* edge, so the dependency check is unchanged.

4. **F04** (P3) a board path in the roadmap text

   **Location:** `README.md:990`: "The sources manifest is `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/sources.toml`; locators below use the numbering of the versions recorded there."

   **Claim:** the path is the manifest's location for a reader of the roadmap.

   **Witness:** the roadmap folder in the content repository is `TauCetiRoadmap/ProetaleCohomologyOfPAdicCurvesAndTowers/`; `packages/…` exists only on the board. No roadmap on main names a manifest path (grep of `TauCetiRoadmap/*/README.md` for `sources.toml`: no match).

   **Exact repair:** write "Locators below use the numbering of the versions recorded in `sources.toml`, in this folder." Tested: the sentence is true in the package folder and in the ported folder alike.

Four findings: two P2, two P3. No P1. The nine findings of the previous round are repaired (table under `## Verified sound`); one of the repairs (the definitions added to §2.4) leaves an object undefined, which is R02. R01 is in a sampled section that no earlier round checked against the hypotheses of its source theorem. Below, `README.md` and `Suggested.lean` abbreviate `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md` and `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/Suggested.lean`; library paths are relative to the pinned repositories.

## Verified sound

### Previous findings (round 6, F01–F09), checked first

| Finding | Status | Repaired passage and my check |
| --- | --- | --- |
| F01 (P2) undefined complexes and maps in §§5.4–5.5 | Repaired | `README.md:695–699`: "the two names denote this one object"; "define the crystalline Bloch–Kato syntomic complex `RΓ^BK_syn(𝔛_{O_C}, ℚ_p(r))` as the mapping fibre of `p_ϖ ⊗ ι` …"; `ι_BK`, `ι_rig`, `β` with source and target. Read CDN-STEIN lines 925–958, 961–964, 1057–1068, 1198–1200, 1224–1250, 1440–1454, 1525–1527, 1716: all as stated. The new supplier citation resolves: PadicHodgeTheory §0.6 at its open head opens "For finite `K/ℚ_p`", has `N = −N_π/e`, `N(u_π) = −1/e`, "`N` is onto", "`B_st⁺` is the union of ker `N^m`"; no map to `B_dR^+`, which the new gap asks for. CrystallineCohomology §§CR.5.3, CR.5.4 exist at its head. |
| F02 (P2) undefined groups in §2.4 | Partly repaired | Kummer regulator, `Symb_ℓ(Z^gen)` and `Symb_ℓ(Y_S)` are now stated (`README.md:393–395`), and the quotient form of the third relation is correct (recomputed below). The leg case of `A_{ℓ,n}` and the restriction map remain undefined: R02. |
| F03 (P2) object handed to a roadmap excluding it | Repaired | The bullet is gone; "locally analytic" and "Orlik" no longer occur in `README.md`. |
| F04 (P3) `flagSubspace` | Repaired | `Suggested.lean:52–57` uses `(Pi.basisFun K (Fin (d + 1))).flag k.succ.castSucc`; `flagSubspace` occurs in neither file. `README.md:66` cites `Module.Basis.flag`, line 40, and four lemmas, all found by `#check`. |
| F05 (P3) residue locator | Repaired | `README.md:402, 472`: "Proposition 4.5, lines 2051–2053, with Lemme 4.2". Read lines 2025–2027 (Corollaire 4.3), 2051–2067. |
| F06 (P3) Tau Ceti near miss | Repaired | `README.md:77`; `simple_GL2Steinberg` at `TauCeti/RepresentationTheory/CharacterTable/GL2/Boundary.lean:101`, `GL2Steinberg` at `…/GL2/Steinberg.lean:105`, an `FDRep ℂ (GL (Fin 2) F)`. |
| F07 (P3) §0.1 bullet and `H⁰` | Repaired | `README.md:153, 165`: kernels defined, "third bullet". CDN-CURVES lines 731–738 read. |
| F08 (P3) Casselman locator | Repaired | `README.md:213`, `sources.toml` key `BW00` (uncertified), `Suggested.lean:117–119`. Base-change route recomputed below. |
| F09 (P3) `S₀`, `M_m` | Repaired | `README.md:734, 762` use `O_F^0`; `README.md:872` uses `M_{LT,m}^{(0)}` and `h`. `M_LT,m` is the notation of EndoscopicTransferAndUnitaryTraceComparison §12.3 at its head. |

Nothing in the repair report was marked "not actionable in this package". Repaired patterns searched in the rest of the text: undefined symbols in statements (found R02 only; `Y^sp` for affinoids is R01); roadmaps named for objects they do not hold (found R03); wrong locators among the sampled sections (none).

### Adversarial pass: computed values

Rows cover the passages the repairs changed, the sampled targets, the headline and the targets a finding touches. For text no repair touched and outside the sample I rely on the round-6 table, whose rows carry computed values.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| Lean headline, §0.4(a) | `d = 0`; `J` everything; `d = 1`, `J = ∅` | `d = 0`: `parabolic K 0 J = ⊤` (closed by `simp [parabolic]` on a scratch copy), relations `⊥`, `Sp = LC(pt, A) = A`, simple. `J` everything: infimum over the empty family `⊤`, supremum `⊥`, `Sp = A`. `d = 1`: `[[1,0],[1,1]]e₀ = e₀ + e₁ ∉ Ke₀`, so the group is the upper triangular Borel. | Sound. |
| §0.4(a) base change from `ℂ` | `W ⊂ Sp_J(A)` stable, nonzero | `H_ℚ(U) ⊗ ℂ → End_ℂ(V^U_ℂ)` onto (Burnside), so `dim_ℚ image = (dim V^U)²` and `H_ℚ(U) → End_ℚ(V_ℚ^U)` is onto; `W^U ≠ 0` for small pro-`p` `U` (`p` invertible), hence `W^U = Sp^U`, `W = Sp`. | Sound for every characteristic-0 field. |
| §0.4(b) lattice uniqueness | `L ⊋ Sp(O)` with `Sp(O) ⊄ ϖL` | `Sp(k) → L/ϖL` nonzero, injective by (a), so `Sp(O) ∩ ϖL = ϖSp(O)`; `x ∈ L`, `ϖ^n x ∈ Sp(O)`, `n ≥ 1` minimal gives `ϖ^{n−1}x ∈ Sp(O)`: contradiction. | Holds for any DVR of residue characteristic `p`; matches GK14 Cor. 4.5 (lines 1362–1364). |
| §0.1 `H⁰`, `H⁰_c`, sequence | one vertex, two legs | `∂x = (−x, −x)`; `H⁰_c = 0`, `H⁰ = L`, `H¹_c = L²/L = L`, `H¹ = 0`; ranks `0 − 1 + 2 − 1 + 0 = 0`; `ker ∂^* = {φ₁ + φ₂ = 0}`. | Exact. |
| §0.2 `N_µ` | loop of length `µ`; compact graph, `ℚ`-coefficients; segment with 2 + 2 legs | Loop: `µ`. Compact: `µz ∈ im ∂ = Z^⊥` gives `Σ µ(a)z(a)² = 0`, `z = 0`, so injective between spaces of equal dimension. Segment: `ker(L⁵ → L²)` of rank `3`, target `coker(L² → L) = 0`. | Matches Remarques 1.5, 1.6 (lines 783–796). |
| §1.2 completed tensor | `H = C̆`; `H = ∏_ℕ C̆` | `B_st^+ ⊗_{B_cris^+} B_cris^+ = B_st^+`; `lim(B_st^+ ⊗ C̆^n) = ∏ B_st^+`. | Matches footnote 5 (lines 170–172). |
| §1.3 `X^r_st` | slope 0, 1, 1/2; `r ↦ −r` | `(B_cris^+)^{φ=p}` (kernel of `θ` is `ℚ_p t`); `ℚ_p`; `(B_cris^+)^{φ²=p^{−1}} = 0`; `(B_cris^+)^{φ=p^{−1}} = 0`. | Matches CDN-STEIN lines 2160–2167. |
| §2.2 patterns | disc with two Gauss points; annulus; Tate curve with 3 and with 2 points | Disc: `coker(L² → L) = 0`, `∂^*` at `s₂` kills the edge, at `s₁` the leg, `H¹_c^* = 0`. Annulus: `ker(L³ → L²)` of rank `1`. Tate, 3 points: pairwise one intersection, `H¹` of rank `1`; 2 points: two components meeting twice, not fine. | Matches lines 264–298, 1035–1038, 1688–1722, 3086–3091. |
| §2.4 third relation of `A_{ℓ,∞}(Y_S)` | general family; trivial family | `g_{n+1}^{ℓ^{n+1}} u_j v_j^{ℓ^n} = u_{i,n+1} = g_n^{ℓ^n} u_j v_i^{ℓ^n}`, so `(g_{n+1}^ℓ)^{ℓ^n} = (g_n v_i/v_j)^{ℓ^n}`. Trivial: `(a_{i,n+1}/a_{j,n+1})^ℓ = (a_i/a_j)(a_{i,n+1}^ℓ/a_i)(a_j/a_{j,n+1}^ℓ)`; the product form gives `a_{i,n+1}^ℓ a_{j,n+1}^ℓ a_j^{−2}`, false. | Quotient is right; the extraction of line 3124 drops the bar (lines 3147–3151 show the quotient). |
| §2.4 Kummer regulator | `(f_n)`; `(h_n^{ℓ^n})`; constant `c` | `c_n(f_{n+1}) = c_n(f_n)` since the ratio is an `ℓ^n`-th power; `h_{n+1}^{ℓ^{n+1}}/h_n^{ℓ^n} = (h_{n+1}^ℓ/h_n)^{ℓ^n}`; `c = (c^{1/ℓ^n})^{ℓ^n}`. | Matches Lemme 5.4, Cor. 5.5 (lines 2458–2491). |
| §2.4 restriction to a leg | Tate symbol with a zero in the leg | `f_n|_{Y_a}` is not in `O(Y_a^gen)^×`; `f_n h_n^{−ℓ^n}` is. | R02. |
| §2.4 graph term | Tate curve, `u = v = 1` | `g_n ∈ μ_{ℓ^n}`, `g_{n+1}^ℓ = g_n`; modulo `a_{i,n} ∈ μ_{ℓ^n}`: `coker(ℤ_ℓ(1)⁶ → ℤ_ℓ(1)⁶) = ℤ_ℓ(1)` on the 6-cycle. | Sound. |
| §4.2 diagram | open annulus; two components; kernel of `dlog` | `X^1_st(C̆(−1)) = ℚ_p`; `(0,1)`: `d = 0`, nonzero mod diagonal `C`, zero mod `C²`; kernel `t·H^{φ=1}`: slope 1 gives `0`, slope 0 gives `ℚ_p t`. | Matches Théorème 8.1 and Remarque 0.8(ii) (lines 247–249, 4292–4309). |
| §4.4 `WD_Y` law | `Φ = diag(1, q)`, `Ne₁ = e₀`; Tate module `diag(q^{−1}, 1)`, `Ne₁ = µe₀` | `NΦe₁ = qe₀ = qΦNe₁`; `ΦNΦ^{−1}e₁ = q^{−1}e₀`, so the law has `p^{−deg}`. Tate: `NΦe₁ = µe₀`, `qΦNe₁ = q·q^{−1}µe₀`. `deg` of a geometric Frobenius: `x ↦ x^{p^n}` has degree `−n`, so `x ↦ x^{1/q}` has `+f`. | Matches lines 4410–4439; the misprint of line 4432 is recorded. |
| §4.5 `ℚ_ℓ[u]` | `g(u) = χ^{−1}(u + c)` | `N(g u) = χ^{−1} = χ^{−1} g(N u)`; geometric Frobenius: `χ^{−1} = q = p^{deg}`. | Matches lines 4515–4528. |
| §4.6 similarity | `y² + y = x³` over `𝔽₂`; overconvergent annulus | Points `(0,0), (0,1), ∞`: `a = 0`; `X² + 2`, after the twist `X² + 1/2` on both sides. Annulus: `ℚ_ℓ` with trivial action against `C̆` with `φ = σ`; `Y^sp` undefined. | Curves without boundary: sound. Affinoids: R01. |
| §4.8 `Ĵ` | `μ_{p^∞}`; ordinary, supersingular `g = 1` | `(1,1)`; `(1,1) + (0,1) = (1,2)`; slope `1/2` twice: `(1,2)`; `0 → V_p → Ĵ → C → 0` gives `(1,2)`. | Matches lines 436–445, 4015–4028. |
| §4.9 variance | `μ_{p^∞}` | `D_raw`: `F = σ`, `(B_cris^+)^{φ=p}`; `D_contra` with `F = p`: `(B_cris^+)^{φ=1} = ℚ_p`; `D_raw` with `F = 1`: `ℚ_p`. `ι_BdR`: two bounded lifts differ by a bounded sequence, `p^n·` of it tends to `0`. | Matches Remarque 0.18, Théorème 7.12, Remarque 7.10 (lines 446–462, 4051–4059, 4108–4129). |
| §5.4 crystalline complex on `Spf O_K` | `r = 1`; `N = 0` dropped | Total complex of `(φ − p, N)` on `B̂_st^+`: `N` onto, `p − φ` onto `ker N = B_cris^+`, so `H⁰ = (B_cris^+)^{φ=p}`, `H¹ = H² = 0`; fibre of `θ`: `H⁰ = ℚ_p t`, `H¹ = 0`. Without `N = 0`: `φ(u) = pu`, `θ(ι_ϖ(u)) = 0`, an extra line. | Sound. |
| §5.4 overconvergent complex, `B_st^+` against `B̂_st^+` | a point, `r = 0` | both give `(B_cris^+)^{φ=1} = ℚ_p`. | Agree, as (3.37). |
| Gap `completed-semistable-ring-general-K` | `K = W(𝔽̄_p)[1/p]` | not finite over `ℚ_p`; PadicHodgeTheory §0.6 assumes finite `K/ℚ_p`. | Gap needed; precise. |
| §6.7 twisted Artin–Schreier | `μ^i x`, `φ^{−1}x = x`; cusp `y² = x³ + p`, `p ≥ 5` | `ξ^iφ^{−1}(μ^i x) = ξ^i φ^{−1}(μ)^i x = μ^i x`. `H^i(𝔛, τ≤i K) = H^i(𝔛, K)` since `τ>i K` has no hypercohomology in degrees `≤ i`. Jacobian `(−3x², 2y)` vanishes only at `x = y = 0`, where `p = 0`. | Matches Theorem 2.9, Lemmas 2.11–2.12, Cor. 2.13 (lines 357–466). |
| §6.8 | `i = 0`; points `0, 1, 2` | `H⁰ = A_inf`; residues `(1,−1,0) + (0,1,−1) − (1,0,−1) = 0`. | Matches Theorem 1.3 (lines 89–119). |
| §7.1 components | `m = 1`; `(3I₂, 3)`; `(ϖ, 1, Φ_geo)`, `h = 1`; diagonal `z` | `(q−1)q^0 = q − 1`; `9·9^{−1} = 1`; `v(ϖ·rec_F(Φ_geo)) = 1 − 1 = 0`; `ω(z^h)ω(z^h)^{−1} = 1`. `rec_F(τ) = χ_LT(τ)^{−1}`: the Artin map sends a unit `u` to `[u^{−1}]` on torsion points. | Matches STR08 lines 337–341, 370–390. |
| §7.6 five-term step | `A = B = 0`; `D = E = 0` | kernel, cokernel closure; `0 → coker(A → B) → C → ker(D → E) → 0`. Duals: `H^{i+1}(ℱ₁)^∨ → H^i(ℱ₂)^∨ → H^i(ℱ)^∨ → H^i(ℱ₁)^∨ → H^{i−1}(ℱ₂)^∨`. | Matches CDN23 lines 1283–1294. |
| §7.7 | level 0, `H⁰` | `π₀(M_{0,K}^ϖ) = π₀(Spec(K ⊗_F F₂))`: one point for `K = F`, two for `K ⊇ F₂`; `𝔽_p`, `𝔽_p²`. | Matches Théorème 2.1 (lines 1042–1044). |
| §7.8 | `n = 1`; `F = ℚ_p` | `D^×/ϖ^ℤ(1 + ϖ_D O_D) = 𝔽_{q²}^× ⋊ ℤ/2`; `θ ≠ θ^q` induces a 2-dimensional irreducible, so (e), (f) have input. `F = ℚ_p`: admissible by Remarque 2.15(i), so (c) needs `F ≠ ℚ_p`. | Matches CDN23 lines 955, 1456–1546. |
| §7.1 notation after the repair | `h = 2` | `D_2 = D`, `b^{−h} = b^{−2}` for scalar `b`; `n` only for Drinfeld levels. | Consistent. |

### Seeded source sample

All 15 targets were read at their locators in the cached texts; no author-flagged unverified locator exists in `sources.toml`.

| Target | Passage read | Result |
| --- | --- | --- |
| 0.2 | CDN-CURVES lines 783–796 | As stated. |
| 0.4 | CDN-STEIN lines 1905–1955; GK14 lines 1300–1332, 1362–1370 | As stated; the README's (b) for a general DVR is GK14 Cor. 4.5. |
| 1.2 | CDN-CURVES lines 130, 147–172 | As stated. |
| 1.3 | CDN-CURVES lines 115–123; CDN-STEIN lines 2156–2167 | As stated. |
| 2.2 | CDN-CURVES lines 264–306, 388–390, 1035–1038, 1688–1722, 3086–3115 | As stated. |
| 2.4 | CDN-CURVES lines 471–476, 2023–2067, 2458–2491, 3117–3168 | Statements as in the source; R02. |
| 4.2 | CDN-CURVES lines 220–249, 4292–4322 | As stated. |
| 4.4 | CDN-CURVES lines 4324–4468 | As stated. |
| 4.6 | CDN-CURVES lines 403–415, 4284–4290, 4540–4561 | Curves without boundary only; R01. |
| 4.9 | CDN-CURVES lines 446–462, 4051–4059, 4093–4133 | As stated. |
| 6.7 | CDN-DUKE lines 357–475 | As stated, flat models included. |
| 6.8 | CDN-DUKE lines 80–119 | As stated. |
| 7.1 | STR08 lines 337–390; CDN20 lines 94–107, 142 | As stated. |
| 7.7 | CDN23 lines 1040–1044, 1223–1427 | As stated. |
| 7.8 | CDN23 lines 950–955, 1456–1546 | As stated. |

Beyond the sample: CDN-STEIN lines 316–328, 920–968, 1052–1068, 1194–1250, 1356–1364, 1436–1454, 1522–1527, 1703–1718 (the repaired §5.4); CDN-CURVES lines 715–796 (§0.1).

### Lean, headlines and padding

`lake env lean` on `Suggested.lean`, run from the content checkout: exit 0, one warning, `122:8: declaration uses 'sorry'`. One `import Mathlib`, no `TauCeti.*` import, no `set_option`, no sorry'd data, no `lemma`, no `#eval`, no admitted `example`.

`#check @name` in one scratch file for the 7 declarations (`parabolic`, `parabolic_mono`, `translation`, `steinbergRelations`, `steinbergRelations_le_comap`, `generalizedSteinberg`, `generalizedSteinberg_isIrreducible`): each elaborated type equals its README statement (§§0.3, 0.4(a)); no binder lost; the headline keeps `Fact (Nat.Prime p)`, `NontriviallyNormedField K`, `NormedAlgebra ℚ_[p] K`, `FiniteDimensional ℚ_[p] K`, `Field A`, `CharZero A ∨ CharP A p`. Nothing changed.

One-tactic probe on the only sorried theorem: `first | simp | rfl | infer_instance | trivial | decide | exact Representation.IsIrreducible.mk | exact (Representation.irreducible_iff_isSimpleModule_asModule _).2 inferInstance | aesop` leaves the goal `(generalizedSteinberg K A d J).IsIrreducible` open in both cases of `hA`. No padding: the two proved theorems are the proof terms that `steinbergRelations` and `generalizedSteinberg` take as arguments.

Headlines of the README summary: irreducibility of `Sp_J(A)` (§0.4(a)) is stated; the curve diagrams and the Kummer regulator (§§2.4, 3.5, 4.1, 4.2, 4.7), the filtrations and Weil–Deligne similarity (§§2.5, 3.2, 4.3, 4.6), the Jacobian period isomorphism (§§4.8–4.9), the semistable Stein diagram (§5.5), the half-space theorems (§§6.2, 6.4, 6.5, 6.9, 6.10) and the tower theorems (§§7.1, 7.2, 7.4, 7.5, 7.7, 7.8) are each named in the module docstring with the missing carrier. None is statable at the pins: no rigid analytic curve, adic étale or pro-étale cohomology, Hyodo–Kato cohomology, `B_cris^+`, `B_st^+`, Lubin–Tate or Drinfeld space was found there.

Backticked names of this roadmap's own in the README: the seven declarations, all declared. `Semistable.aOmega` is AInfCohomology §AI.6.2's (its open head, README line 2860).

### Library declarations opened at the pin

| File and line | Declaration |
| --- | --- |
| `Mathlib/LinearAlgebra/Basis/Flag.lean:40, 44, 47, 65, 79` | `Module.Basis.flag`, `flag_zero`, `flag_last`, `mem_flag_iff_repr_eq_zero`, `flag_mono` |
| `Mathlib/LinearAlgebra/StdBasis.lean:120` | `Pi.basisFun` |
| `Mathlib/RepresentationTheory/Basic.lean:329` | `Representation.quotient` |
| `Mathlib/RepresentationTheory/Irreducible.lean:29, 33` | `Representation.IsIrreducible`, `irreducible_iff_isSimpleModule_asModule` |
| `Mathlib/GroupTheory/Coset/Basic.lean:424` | `Subgroup.quotientMapOfLE` |
| `Mathlib/Algebra/Module/Submodule/Pointwise.lean:186` | `Submodule.pointwiseDistribMulAction` |
| `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57`; `Shift.lean:44` | `CochainComplex.mappingCone`, `shiftFunctor` |
| `Mathlib/RingTheory/Perfectoid/BDeRham.lean` | `BDeRhamPlus` |
| by `#check` | `LocallyConstant.comapₗ`, `Matrix.GeneralLinearGroup.toLin`, `WittVector.Isocrystal`, `AlgebraicGeometry.Scheme.EllAdicCohomology` |
| `TauCeti/RepresentationTheory/CharacterTable/GL2/Boundary.lean:101`; `…/GL2/Steinberg.lean:105` | `simple_GL2Steinberg`, `GL2Steinberg` |

### Suppliers, ownership and overlap

The worker's resolver lists two cross-roadmap citations found nowhere on main or at an open head: ModpRepresentationsOfGL2OverLocalFields §0.3 and PadicLocalLanglandsForGL2QpPartII §4.1. Both are board packages; their README headings §§0.3, 0.4, 0.5, 0.7, 2.4, 2.6 and §§4.1, 4.9 exist. Every other citation resolves at main or an open head by the resolver; I re-opened the headings of PadicHodgeTheory §§0.6, 5.3, 5.4, 8.1; CrystallineCohomology §§CR.4.7 (item *Slope decomposition on the existing isocrystal carrier*), CR.5.1, CR.5.3, CR.5.4; EndoscopicTransferAndUnitaryTraceComparison §§12.2–12.4, 12.7, 12.11, 12.12, 12.14, 12.19–12.21; CohomologyComparisons §§4.5, 4.9a, 4.11, 4.12; CstConjectureForDaggerVarieties §1.5; PadicPeriodRings §§4.1, 4.3; CohomologyComparisonsPartII §§4.1–4.5; LocallyAnalyticDistributions §§0.0, 0.2, 0.CR.6.6; ScholzeFunctorAndModpCohomologyOfTheLubinTateTower §§0.2, 5.4, 6.2 and its gap `proetale-finite-presentation`, whose `needs` is §7.7 as stated here.

Declared gaps: `formal-syntomic-period-comparison`, `period-rings-general-C`, `endomorphism-characteristic-polynomials`, `completed-semistable-ring-general-K` carry the same slug, supplier and `needs` in `design/plan.json` and under `## Exact supplier contracts`. Each is precise and asks for what its supplier's cited section does not state at its head. Not raised.

Ownership against open pull requests was checked with the `roadmaps` tools at the heads of the index of 2026-11-13: `generalizedSteinberg`, `Sp_J(`, "ghost circle" and `def parabolic` match no other roadmap; "generalized Steinberg" in SmoothRepresentationsOfLocalGroups SR.5.2 is the segment representation `L(Δ)` over `ℂ`, cited here in a Check; `steinbergRelations` in KTheoryFiniteLocalFields and K2SymbolsBrauer is the symbol relation in their own namespaces. `overlaps.md` lists no second copy, no dropped id, no revision-only id and no other pull request changing this roadmap.

Overlap check: read CstConjectureForDaggerVarieties, PadicHodgeTheory, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, CohomologyComparisons, CohomologyComparisonsPartII, AdicSpacesPartIV; the model-free dagger diagram is owned by CstConjectureForDaggerVarieties §1.5 and the curve and `G_K`-equivariant semistable diagrams here; `B̂_st^+` is owned by PadicHodgeTheory §0.6 and cited; the tower components (§7.1) and finite copresentation (§7.7) are owned here and imported by ScholzeFunctorAndModpCohomologyOfTheLubinTateTower; the proper-curve exact sequence is owned here, CohomologyComparisons §4.12 leaving it; nothing else shared.

Dependency check:

```text
depcheck: 212 roadmaps, 1937 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. ModpRepresentationsOfGL2OverLocalFields is the line before this roadmap in the merge order; the two consumers are later.

### Shape, principles and source independence

Summary, scope, conventions, supplier contracts, reading guide, eight layers each ending with Examples and Dependencies, downstream consumers and references are present; every numbered subsection has a *Needs* line and a Checks block, and every section that defines an object has at least three Checks. No layer is named after a source chapter and no sentence says the plan follows a source. No pull-request number, date, round label, HTML anchor, LaTeX delimiter, `set_option` or algorithm in the roadmap text; the one path is R04. No restriction to good primes: `p = 2` and general `F`, `K` are kept with their genuine hypotheses.

Wording: 15 sampled passages and 6 further ones (§0.1 definitions against CDN-CURVES lines 715–757; §2.2 pattern against lines 264–298; §4.6 proof route against lines 4548–4561; §6.8 route against CDN-DUKE lines 96–119; §7.7 route against CDN23 lines 1295–1427; the headline docstring against CDN-STEIN lines 1918–1921) were set beside the sources. The French sources share no run of words with the English text; the two English sources share only formulas, standard names and one theorem statement of a dozen words that the mathematics forces (§6.8 against CDN-DUKE line 89: 9 consecutive words, "there is a topological `φ^{−1}`-equivariant isomorphism of `G × G_K`-modules"). The routes of §§6.8 and 7.7 compress several pages into a few clauses naming inputs and are not clause-by-clause renderings.

Arrangement: CDN-CURVES has the largest share. Its chapters 1–8 (graphs; analytic curves; construction of curves; balls, legs and ghost circles; shorts; quasi-compact curves; overconvergent affinoids; curves without boundary) do not map one to one onto Layers 0–4: Layer 0 joins its chapter 1 with the Steinberg representations of another source; its chapters 4 and 5 have no layer; Layers 2 and 3 divide its chapter 6 by cohomology theory; Layer 4 joins its chapters 7 and 8 with the Jacobian. The order quasi-compact, then limits, is forced by the *Needs* lines of §§4.1–4.2 on §§3.2–3.5.

Reuse: no table, figure, list of examples or numerical data is taken from a source. No public formalisation with the names and statements of `Suggested.lean` was found (`library-matches.md`: 0 same-name hits).

Source independence: 21 passages compared with 6 sources, none shared; largest share CDN-CURVES, 109 of 288 source-key citations; contents compared with CDN-CURVES: independent.

## Not verifiable

- SS91 §§3–4, IS01 Theorem 4.5, DS01 Theorems 5.7 and 7.7, NAK84 Theorem 4, KM74 Theorem 2, BW00 Chapter X Theorem 4.11: settled as uncertified; read only through CDN-STEIN, GK05 and CDN23, which cite them at the locators given.
- GK05, GK05-RT, GK07, DAT06, THO24, CN-I, CN-II, CGN23: not reopened this round; outside the sample, and the sections citing them were not changed by a repair.
- CohomologyComparisonsPartII, PadicPeriodRings, PadicDifferentialEquationsAndRigidCohomology: headings re-resolved; the statements behind the three older gaps were read by the previous round, not again now.

## Source issues

- **Misprint** in CDN-CURVES at §1.2.1, printed p. 18, line 725: the source says the compactly supported differential lands in finitely supported functions on compact edges; it should land in those on all edges, as its cokernel formula requires; affects nothing.
- **Error** in CDN-CURVES at §8.2.5, printed p. 107, line 4432: the source says the group law scales the additive coordinate by `p` to the plus degree; it should use the minus degree, as its own relation at line 4437 requires; affects a stated result.
- **Gap** in CDN-CURVES at §6.2.1, printed p. 75, lines 3122–3125: the source says the local data `u_{i,n}` are arbitrary nonzero meromorphic functions; it should require divisors divisible by `ℓ^n`, of finite support on legs, as §§4.1.2 and 5.1.3 do; affects a stated result.
- **Gap** in CDN-CURVES at Remarque 0.16(ii), printed p. 10, lines 412–415: the source says the Weil–Deligne actions agree for overconvergent affinoids as well; it should supply the argument, Théorème 8.12 being proved for curves without boundary only; affects a stated result.
- **Error** in CDN-STEIN at §5.2.2, printed p. 38, line 1936: the source says the dual of the Steinberg quotient is the inverse limit of duals of all finite-level functions; it should be the annihilator of the relations; affects a stated result.

## For the human reviewers

- **Licence.** BW00, SS91, IS01, DS01, NAK84 and KM74 are recorded `uncertified` in `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/sources.toml` and cited by locator only; their texts were not read.
- **Scope.** After R01 the overconvergent-affinoid case of §4.6 rests on CDN-CURVES Remarque 0.16(ii) (lines 412–415), a remark stated without proof; whether to keep that case as a target is the maintainers' choice.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b9ffd1c92edb52b234aa81ec8890f895c0ba2b21", "job": "REV-PKG-ProetaleCohomologyOfPAdicCurvesAndTowers~7", "model": "fable", "worker": "chris-x52"} -->
