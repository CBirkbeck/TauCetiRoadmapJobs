# Review of BesselPoincareSeriesAndGramBounds (pull request #2916 at fd2b385)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BesselPoincareSeriesAndGramBounds/`
**Verdict:** needs changes

**Summary.** Changes are needed: three of the four earlier findings are repaired and the one on locators only partly, and two new mathematical errors appear, namely that the lower bound for the critical level in 5.20a (b) is false at every real place that is not a top place (R01) and that the first Check of 5.13 asserts something the route of 5.13d refutes (R02). The steps the README leaves unproved still rest on the formal proof with no declaration named (R03), and the volume identity behind `D*` has two owners, this roadmap and ThetaChainsAndFrobeniusPrimeSums §9.4 (R04). There are seven small corrections and no format notes; the human reviewers decide on scope and licence for the targets that rest only on the formal proof.

## R01 (P1) — The lower bound for the critical level in 5.20a (b) is false at the real places that are not top places

This bound is a stated result under (St). Its second form, `T_crit ≥ (g₀g₁)^m·k^{3r_S}`, is what 5.20b uses, and the route derives that second form from the first.

**Why the route fails.** The statement (lines 1316–1319) is `T_crit(w,τ) ≥ (1/5)(g₀g₁)^m(π/v_E)^{−(m−1)}∏_je′_j(τ)/a_eff(w,τ)`, with `a_eff = u_1 − v_0` off the tops. The route (line 1346) needs "a_eff = u_1 − v_0 ≥ 4kΔ_w". Under (St), with the adapted data of ThetaChainsOnDefiniteUnitaryGroups §2.3b (line 1301), that inequality cannot hold:
- off the tops every entry of `u(τ)` lies in `[−Sc, Sc]` (that README, line 583);
- `v_0 = v_{k−2} + 4(k−2)Δ_w ≥ 4(k−2)Δ_w`;
- so `a_eff ≤ 8Δ_w`;
- the existence statement §2.3a even takes `u_0(τ) = v_0(τ) + ½` off the tops (its line 649), so the chain itself has `a_eff = ½`.

**How far off the bound is.** The product `∏_{j>1}(u_1 − u_j)` is at least `(4Δ_w)^{k−2}(k−2)!`, not at most `a_eff^{k−1}e^{k/2}`. So `T_crit` falls short of the claimed bound by a factor of order `kΔ_w/a_eff`. I evaluated the definition of `T_crit` in (a) with `k = 200`, `m = 4`, `Δ_w = 10⁶`, `e′_j ≈ 10¹⁵`, `g₀g₁ = 10¹²` and `v_E = 10`, giving `log(T_crit/bound)`:

| `a_eff` | `k = 200` | `k = 4000` |
|---|---|---|
| `½` | −17.3 | −21.5 |
| `8Δ_w` | −0.85 | −4.9 |

At a top place the same computation gives +3.4, so the top case stands.

**The fix.** Off the top places, put `a_eff(w,τ) := 2Sc = 8kΔ_w`. All entries of `u(τ)` lie in `[−Sc, Sc]` there, so `u_1 − u_j ≤ 2Sc` and `∏_{j>1}(u_1 − u_j) ≤ a_eff^{k−1}`, and the rest of the route goes through; the same test then gives between +2.0 and +8.9. Since `2Sc ≤ e′_0/4`, the bound `a_eff ≤ e′_0b^{C_u}` and the second form are unchanged. The table of symbols should then describe `a_eff` accordingly.

## R02 (P2) — The first Check of 5.13 says that interlacing keeps every translation step unblocked, which 5.13d refutes

A reader who trusts the Check concludes that the walk of 5.13d (e) never meets a blocked step. The Check (lines 326–328) ends "the interlacing, not half-integrality, keeps every translation step unblocked".

A step from `hc` to `hc − e_s` is blocked when some `u_j = hc_s − ½` (5.13d, lines 272–273). Strict interlacing `u_s > hc_s > u_{s+1}` allows `u_{s+1} = hc_s − ½`:
- 5.13d's own route says so (lines 273–275);
- so does ThetaChainsOnDefiniteUnitaryGroups §2.3, where a zero bit gives `u_l = v_{l−1} − ½` (that README, line 500).

Example: take `k = 2`, `r_S = 0`, `hc_1 = 5` and `u_2 = 9/2`. Interlacing and half-integrality hold, and `ϰ_1 = 0` in 5.13d (g) because `hc_1 − ½ − u_2 = 0`.

A correct ending would be: "neither half-integrality nor interlacing excludes a blocked step (`u_{s+1} = hc_s − ½` is allowed), which is why the walk of 5.13d (e) must avoid them."

## R03 (P2) — The steps this README does not prove rest on [FormalProof] alone, and no declaration of it is named

This finding carries on R04 of the last review. The part on KNOWN inputs is repaired: Sun–Zhu Theorem B, Jiang–Sun–Zhu Theorem A, He Theorem 0.1, Beuzart-Plessis Theorem 12.4.1, and Xue Theorem 2.2 and Corollary 2.5 now carry theorem and page, and I checked each at its locator.

What remains: the README says [FormalProof] "is the reference of every *NEW* target" (line 1863), and that its hypotheses and constants are recorded at each target (lines 77–80). It names no declaration or file of it. Four steps are explicitly not given here, so for them the locator is the only support:
- **5.13d (e) for `r_S ≥ 1`:** the root-number step (line 252) and the construction of the walk above the threshold (lines 275–276) are both not given. Yet the statement says "The argument of this layer proves it" (line 227).
- **5.20c (a):** the bound on `H(γ)^C` (line 1500).
- **5.21 (i):** the crude bound (line 1591).
- **5.23 (v) (1):** the embedding statement (line 1717).

Without a locator, other claims about the formal proof cannot be checked either: the constants `c = 1/16` and `C = 8·10¹⁴(C_ϕ + 4)` of 5.16, and the form attributed to [FormalProof] in 5.22 (a).

The repair: name the declaration or file of [FormalProof] at each of these steps and at the three headline statements. In 5.13d (e), replace "The argument of this layer proves it" by a sentence saying that [FormalProof] proves it under that gap, at the named declaration, and that the route outlines the proof.

## R04 (P2) — The identity `vol([U(Y_0)]) = mass(𝒪_E^r)`, and with it `D* = mass(r)·[Stab(L^Y_0) : K₂]·∏_τd(𝒟_τ)`, is stated and proved both here and in ThetaChainsAndFrobeniusPrimeSums §9.4 (a)

The identity has no single owner. Here:
- it is part of 5.20a (a) (line 1312);
- its route goes through HermitianFormsAndLattices §§6.0b, 6.2 (a), (b) (lines 1339–1341);
- the Conventions use it, citing "route of 5.20a" (line 19).

ThetaChainsAndFrobeniusPrimeSums (#2924) states the same identity with the same route as its target §9.4 (a) (its README, lines 438–439). That roadmap comes later in the family and consumes this one: it cites 5.20a, 5.20, 5.21 and 5.23. This README's "Downstream consumers" paragraph nevertheless says that its §9.4 "states" the identity (line 1756), which hands the identity back to the later roadmap. RowTowerAndRallisIdentities (line 1539) also cites §9.4 for it; that citation belongs to its own review.

The repair: keep this roadmap as the owner, since it is the earlier one. Claim the identity in Scope and ownership under 5.20a (a), and change line 1756 to say that ThetaChainsAndFrobeniusPrimeSums §9.4 consumes 5.20a (a). §9.4 (a) then cites it instead of restating it.

## C01 — The table of symbols misquotes `SizeQD` of ThetaChainsOnDefiniteUnitaryGroups §2.1

At the head of that roadmap, `SizeQD` is `log q ≥ x^{ε/(6J)}` and `log d ≥ x^{19ε/(100J)}` (its README, line 274). The row at line 41 differs in two ways:
- it puts the second bound on `log q`;
- it adds an upper bound `log q, log d ≤ x^{ε/5+ε/100}` and `|(L′/L)(1, χ_K)| ≤ x^ε`, neither of which the supplier contains.

5.23 (iii) holds with the supplier's definition. Restore that definition, or cite where the extra bounds are defined.

## C02 — In (St) of 5.20a, "`m ≤ x^{1/2}` by `SizeM`" is not what `SizeM` gives

`SizeM` gives `m ≤ x^{1/2+ε/2}` (ThetaChainsOnDefiniteUnitaryGroups, line 280). The claim is at line 1296. The conclusion survives, because `C_l·x^{1/2+ε/2}·w″/(4x) ≤ w″/2` for large `x`. Write `x^{1/2+ε/2}`.

## C03 — The half-cut of 5.20 is written with `v_l` where the cut sits at `v_{l−1}`

The half-cut appears in the statement of 5.20 (line 1510), in its route (line 1543) and in the chain note of 5.18c (line 988). At the letter `l`, the two types are `v_{l−1} − ½` and `v_{l−1} − ½ − Δ_w` (ThetaChainsOnDefiniteUnitaryGroups §2.3, line 500), so the cut of 5.18a is `{5/2 ≤ v_{l−1} + Y ≤ Δ_w − 3/2}`. Since `v_l = v_{l−1} − 4Δ_w`, the set as written lies beyond that cut, where `qdet < 0`. Write `v_{l−1}` (which is `hc_l` in the numbering from 1).

## C04 — The Mathlib contract claims a Schur test and polynomial sublevel estimates that Mathlib does not have at the pin

The claims are in 5.13b's *Needs* (line 189), 5.19's *Needs* (line 1281) and the contract (line 1859).
- The Schur test is in Tau Ceti: `TauCeti.lintegral_rpow_lintegral_mul_le` (`TauCeti/MeasureTheory/Integral/SchurTest.lean`, line 132).
- The sublevel estimate used in 5.13b (b′) is in neither library. It is stated in that route, so say that it is proved there.
- The Schur product theorem is Mathlib's `Matrix.PosSemidef.hadamard` (`Mathlib/Analysis/Matrix/Order.lean`, line 214), which could be named.

## C05 — The overview's statement of 5.15a integrates over `S\𝐆/S′` without saying what `dγ` is

5.15a now works with a measurable parametrisation `h : C → 𝐆` that disintegrates Haar measure, and `dγ` is the image of `m`. The overview (line 5) should add that clause, as the docstring of `Suggested.lean` already does (line 32). That docstring still lists a quotient measure on `S\G/S′` among the missing carriers (line 35), which the statement no longer uses.

## C06 — The second Check of 5.22 calls the type primes "auxiliary primes"

Line 1652 says "This is why the level has two auxiliary primes". The two primes are the type primes `g₀, g₁`. The Conventions reserve "auxiliary primes" for `p_δ, p′_δ` (line 17).

## C07 — The validation paragraph of the pull-request description is out of date

The paragraph says that the automatic checks fail in two places only: on files changed outside the roadmap folder, and on the check that the roadmap has its place among its suppliers in the merge order, because it is not yet listed there. A reader takes from this that the roadmap still waits for a place in the merge order. At this head, the merge order lists the roadmap directly after GanGrossPrasadUnitaryGroups, and every automatic check passes. A correct wording would be: "Validation at this head: the automatic checks pass, the targeted build succeeds, and the dependency check reports no upward or cyclic edge."

## Questions for the author

- In 5.13d (e) for `r_S ≥ 1`, which characters label `D` and `π^∨` in their packets under the signs of RowTowerAndRallisIdentities §5.3? Is the interlacing pattern exactly the distinguished pair of GanGrossPrasadUnitaryGroups §3.9 (Xue, Theorem 2.2)? Xue's text is now readable, but the computation of root numbers from Harish-Chandra parameters is not given, and I did not carry it out for `r_S ≥ 1`.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 5.13a (a) `Gr` | `r_S = 0` | Gram det of `z, γz′` is `TT′ − \|⟨·,·⟩\|² ≤ 0`; `(−1)^1` times it is `Gr ≥ 0` | holds | none |
| 5.13c (d) | Bessel model element | `λ(B(·))` on `D(nh)v ⊗ π^∨(h)λ` gives `ψ(n)λ(B(v))`: lies in `Hom_H(D ⊗ π^∨, ψ)` | holds | none |
| 5.13d (e) threshold | `(k, r_S) = (10,1), (40,3), (100,10)` | least `h` with (G) for `h/4`: `1.05e6, 5.98e7, 1.8e10`; threshold `2.16e4, 1.2e6, 4.4e7` | (G) implies it | R03 |
| 5.13d (g) | Lagrange sum; degree ratio | `Σϰ_s = T` (`r_S = 0`), `0` (`r_S ≥ 1`); `\|κ_s\|²d/d_s = T∏\|λ_s−½−u_j\|/∏\|λ_s−1−λ_t\|` | consistent | none |
| 5.13 (f) | `R(e_D)` on `l(D(·)v)`; `ě_D` | `R(e_D)l(D(·)v) = ⟨w,v⟩l(D(·)w)`; `ě_D` integrand scales by `ω²`, vanishes if `ω² ≠ 1` | holds | none |
| 5.13 Check 1 | `k = 2`, `hc_1 = 5`, `u_2 = 9/2` | interlacing holds; `hc_1 − ½ − u_2 = 0`, so `ϰ_1 = 0`: step blocked | fails | R02 |
| 5.13 Check 2 | `r_S = 0`; He2017 line 58 | exchanged signs give pairs `(⊖−), (−⊖), (−+)`, admissible; reversed alternation gives `(⊖+)` | holds | none |
| 5.15 Checks | `r_S = 0`; `c₀` | `Gr = \|⟨γz′,z⟩\|² − TT′ ≥ 0` (reverse C–S); identity cell `1`, versus `(dim V)^{−1}` without the factor | holds | none |
| 5.15a (headline) | compact `𝐆`, `S = S′ = 𝐆` | `W = σ(·)w`; `O ↔ σ(γ)/d`; `‖O‖²_HS = 1/d`; `m = 1` | equality | C05 |
| 5.15a Check | `U(1)`, `σ = e^{inθ}`, `n ≠ 0` | `W = e^{inx}`: `R(e_σ)W = W`, `O(γ) = e^{inγ}`, `∫\|O\|² = 1 = 1/d`; `⟨σ(·)w, b⟩` sent to `0` | holds | none |
| 5.15a dimension count | `dim S_u = r_S(2r_S+2k+1) + k²` | `2dim S_u + 2(r_S+1) − (k−1)² = (k+2r_S+1)² = dim G_τ` | holds | none |
| 5.16 (headline) | trace step; Langlands Check | `x ∈ g′𝒪_E` with conjugates `≤ 3n < g′` forces `x = 0`; cocompact case `m = d·vol` | holds | R03 |
| 5.17a | `q = 3, 4, 5`; `q = 2, k = 3` | `∏(1 − q^{−i})^{−1} = 1.785, 1.452, 1.315` against `2, 1.75, 1.6`; `8/3 > 5/2` | holds | none |
| 5.17c (b1) | exponents; `det H_ℓ` | `t`: `−ℓ(ℓ+1)/2 + ℓ/2 = −ℓ²/2`; `z`: `ℓ − ℓ/2 + ℓ(ℓ−1)/2 = ℓ²/2`; `det = (ℓ+1)a^{−ℓ}`; `γ(t/z) = γ(tz)` | holds | none |
| 5.17c preamble | Artinian reduced datum, integers invertible | char-0 factors with infinite compact open subring are non-archimedean; Positivity §8.2 allows non-maximal orders | holds | none |
| 5.17 Checks | `g = 3`, `T = 1`; `U₂(𝔽₃)` | determinants `−99`, `−11`; `Gr = 2Tg² + g⁴`; `\|U₂(𝔽₃)\| = 3·4·8 = 96` | holds | none |
| 5.17 mean value | `n_c` via mass formula | `∏α(k−1)/α(k−1−c) = ∏d_𝔭·∏_{i=k}^rL(i,η^i)`; `W_rows = mass(k)(T^k−1)^f` when split | consistent | none |
| 5.17d `d_sup` | `j = k − 2r_S − 2 ≥ 6` | `Σ_pp^{−6} = 0.017 ≤ 3·2^{−6}`; `∏d_𝔭/α⁰_𝔭 ≤ exp(4Σx_𝔭)` | holds | none |
| 5.18a | site; sign of `N_l` | `T(Y+1)ᵀ𝐉T(Y) = 𝐉` via `[p, c^{−1}] = −c^{−1}`; `N_l(ρ) ≥ 0`: `2(k−l)` negative factors | holds | none |
| 5.18b (e) | signs on a cut | `(−1)^{k−l₀}x_ρ(y+e) > 0` (margin `2.5 − 1`); `qdet > 0` when types differ at `l₀` only | holds | none |
| 5.18c | wave identity | `T(Y)U(s) = [[Y+p+cs, −c],[c^{−1},0]]`; `e_s^{−1}pe_s = p + sc` | holds | C03 |
| 5.18e | Markov; grid | `sup\|p′\| ≤ (2d²/L)sup\|p\|`; `deg C_0 = r = k+2r_S+1`, so `k+2r_S+2` nodes suffice | holds | none |
| 5.18 Check | `u = u′` | `qdet = −TT′∏(Y+½+u_i)² ≤ 0` | holds | none |
| 5.19 Checks | `L = 0` | conclusion `(1 + C(C/Θ)^f)(1+e₁)𝔧`; support hypothesis forbids off-diagonal terms at `(L+1, 1)` | holds | C04 |
| 5.20a (a) | mass ratio against HermitianFormsAndLattices §6.4 (b) | `((M−1)!(v_E/π)^M)^f(2v_E)^{−f/2}L = \|d_F\|^{(2M−1)/2}((M−1)!/(2π)^M)^fL`; `Σ_{k<M≤r}M = (m−1)k + m(m−1)/2` | holds | R04 |
| 5.20a (b) | off top, `k = 200`, `a_eff = ½, 8Δ_w`; top place | `log(T_crit/bound) = −17.3, −0.85` (`−4.9` at `k = 4000`); top `+3.4`; with `a_eff := 2Sc`: `+2.0` to `+8.9` | fails off tops | R01 |
| 5.20b lemma | `γ` preserving `diag(T, −T′)` | `T²\|b\|² = T′²\|c\|²`; `c = 0` gives `a, d` integral, `\|a−1\|/T ≤ 2/3`, so `γ = 1` | holds | none |
| 5.20c | block `[[0,t],[t,0]]`; `ε_N` | `D_1 = 0`, `D_2 = −t²`; `log ε_N ≤ −(8C_nlog2 − C₄)m⁵fL + (m+3)log 2` | holds | R03 |
| 5.20 (headline) | `η_off` at `b = 16, 100` | `3.66e−8 ≤ 5.96e−8`; `9.8e−14 ≤ 1e−12` | holds | C03 |
| 5.21 (headline) | (iii), (v) | `2Γ₀d²/D* ≤ 2(C₀/Γ₀)d` by the window; `dim ker P_u ≤ ‖K − 1‖²_HS` | holds | R03 |
| 5.22 | `k = 1`, `r = 2`, `g = 3` | ratios `1 − 1/g`, `1 + 1/g`; shares `0.25 + 0.333 + 0.417 = 1` | holds | C06 |
| 5.23 Check | `q = 19`, `d = 526679`, `g = 1136944064017` | all prime; `d ≡ 7 (16)`; `16qd \| g − 1`; norm form `= g`; primes `≤ 19` split; `Σ = 4.6e−7 ≤ 1/76` | holds | C01 |

| Earlier finding (review of 2e29c07) | Passage at this head | Status |
|---|---|---|
| R01, the 5.15a Check | "`W = √d·⟨b, σ(·)w⟩` and `W′ = √d·⟨b′, σ(·)w⟩` satisfy the hypotheses" (line 505; Examples line 1740) | repaired |
| R02, GanGrossPrasadUnitaryGroups §§2.6, 3.9 | "the Bessel model of `D ⊗ π^∨` (GanGrossPrasadUnitaryGroups §2.6)" (line 201); §3.9 in 5.13d, *Needs*, Scope and contracts | repaired |
| R03, the hypotheses in the overview | "let the remaining hypotheses of 5.20b and 5.20 hold" (line 5); `Suggested.lean` lines 47–56 | repaired |
| R04, locators | theorem and page for every KNOWN input (line 1867); none for [FormalProof] | partly; R03 |
| C01 to C04 | `K^{loc}` and `N^{loc}` at lines 696, 722; §4.5 relabelled (line 586); carriers named in the docstring; description reworded | repaired; C07 is new |

- **Source locators checked against the text (7):**
  - SunZhu2012 line 66 (Theorem B, p. 2) and JiangSunZhu2010 line 24 (Theorem A, p. 1);
  - He2017 line 97 (Theorem 0.1, p. 3) and line 58 (Definition 1, p. 2);
  - BeuzartPlessis2020 line 11200 (Theorem 12.4.1, p. 290);
  - Xue2023 line 213 (Theorem 2.2, p. 1000) and line 254 (Corollary 2.5, p. 1001).
- **Library declarations opened at the pins:**
  - Mathlib: `ContRepresentation` (`RepresentationTheory/Continuous/Basic.lean:55`), `Matrix.PosSemidef.hadamard` (`Analysis/Matrix/Order.lean:214`), `IsMulLeftInvariant` (`MeasureTheory/Group/Defs.lean:77`), quotients by normal subgroups (`MeasureTheory/Measure/Haar/Quotient.lean:117`).
  - Tau Ceti: `integratedOperatorL1` (`RepresentationTheory/Continuous/Integrated/Basic.lean:144`, additive monoids only), `lintegral_rpow_lintegral_mul_le` (`MeasureTheory/Integral/SchurTest.lean:132`), `Continuous/MatrixCoefficient.lean`.
  - Neither library has a formal degree or square-integrable representations.
- **Cross-roadmap citations resolved:**
  - every section id cited from the nine family suppliers, at their heads;
  - GanGrossPrasadUnitaryGroups 1.2, 2.6, 3.9 and 4.1, at its head;
  - on main: AutomorphicSpectralTheory 4.5 and 4.10, AutomorphicFormsOnReductiveGroups 2.4, VonNeumannAlgebras Layer 9, RealSemisimpleLieGroups 3.3 and 4.3, AdelicAlgebraicGroups 2.3, 3.1, 3.4 and 3.5, LieGroups Layer 9, ClassicalGroups 6.3–6.6, CompactGroups Layers 2 and 4, LieHighestWeight Layer 7, GeometryOfNumbersAndQuadraticArithmetic 4.4.14;
  - one supplier definition is misquoted (C01).
- **Supplier content rechecked:**
  - DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (c), (d) and §2.4b (b), against the thresholds of 5.13, 5.13d (g) and 5.18 (i₁);
  - ThetaChainsOnDefiniteUnitaryGroups §2.3c (the list under `SizeGap`), §2.3b (f) and §2.8 (`T(u) ≡ 1 mod f_E(g₀g₁)²`);
  - RowTowerAndRallisIdentities §5.3 (signs and `e_𝒟`);
  - PositivityOfDirichletSeriesWithKernels §8.2 (non-maximal orders).
- **Automatic checks:** all passed, and none was set aside. The dependency check printed `depcheck: 21 roadmaps, 217 edges, 0 problem(s)`. Outside the folder, only the three files of the family index change.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there were no signatures to compare with `#check`.

**Overlap check:** I read the scope of:
- the open roadmaps RowTowerAndRallisIdentities, ThetaChainsOnDefiniteUnitaryGroups, ThetaChainsAndFrobeniusPrimeSums, GluedTargetAndDivisionInequality and SeesawForThetaChains;
- the roadmaps on main AutomorphicSpectralTheory, AutomorphicLFunctionsAndLocalFactorsPartII and AnalyticNumberTheoryPartII;
- the supplier GanGrossPrasadUnitaryGroups.

Three objects are shared:
- the Bessel–Poincaré series of 5.14: owned here, and SeesawForThetaChains cites it;
- multiplicity one and existence of Bessel models: owned by GanGrossPrasadUnitaryGroups §§2.6 and 3.9, and cited here;
- `vol([U(Y_0)]) = mass(𝒪_E^r)` with the identification of `D*`: owned both here (5.20a (a)) and in ThetaChainsAndFrobeniusPrimeSums §9.4 (a), see R04.

Ownership against the other open pull requests was searched by object (limit multiplicity, relative Schur orthogonality, decorated cokernels, the tower inequality, the Gelfand–Graev expansion). ShimuraVarieties §7.0h on main owns a different Clozel bound.

**Source independence:** 7 passages compared with 5 sources; no wording is shared, and Beuzart-Plessis's "exactly one member with `m = 1`" is the theorem's content in a dozen words. The largest shares of the 15 exact locators are He2017 and Xue2023, with 4 each. I compared the layers with the contents of He2017 and Xue2023 and found them independent: the layers follow the Gram-bound argument. [FormalProof], the only reference of 26 targets, was not compared.

**Research link:** 5.16 is a uniform-error form of the limit multiplicity theorems of DeGeorge–Wallach (1978), Clozel (1986) and Savin (1989). 5.13c–5.13d specialise the archimedean local Gan–Gross–Prasad theory (Sun–Zhu 2012, Jiang–Sun–Zhu 2010, He 2017, Beuzart-Plessis 2020, Xue 2023). 5.20–5.21 serve Alpöge's announced formal proof (2026). This rests on the README's References and on the five texts read.

## Not verifiable

- [FormalProof] could not be checked for the 26 *NEW* targets, among them the sampled 5.13d (g), 5.15, 5.16, 5.17c, 5.17, 5.18a–5.18e, 5.20c, 5.21, 5.22 and 5.23. The operator's copy is a kernel export of 7.7 GB without source text, so I checked these targets by computation instead (table above).
- I did not fetch the repository URL of [FormalProof] (line 1863), because its host is unclassified.
- I did not rederive the deep estimates beyond the identities in the table: 5.18b–5.18e, the counting in 5.20b–5.20c, and the crude bound of 5.21 (i).

## Source issues

- none

## For the human reviewers

- **Scope:** 26 of the 28 targets are marked *NEW* and cite only [FormalProof] (README line 1863), a Lean development announced on 20 November 2026; no refereed text states them. The KNOWN inputs (Sun–Zhu, Jiang–Sun–Zhu, He, Beuzart-Plessis, Xue) are refereed papers.
- **Licence:** the sources service does not classify the host of the [FormalProof] URL. The operator's copy of it is a kernel export with no stated licence.
- **Not tested:** [FormalProof], the reference of every *NEW* target, has no prose and no table of contents in the copy held, so neither the wording nor the arrangement was compared against it.
