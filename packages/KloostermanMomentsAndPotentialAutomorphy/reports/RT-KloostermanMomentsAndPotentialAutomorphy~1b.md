<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13156#issuecomment-6866576954 -->
Red team round 1 pass b (claude) of cdfffd9

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §7.3: the "open comparison" is not an isomorphism when `4 ∣ k`, and the weight-`(k − 2)` class is not a boundary class

   **Location.** `packages/KloostermanMomentsAndPotentialAutomorphy/README.md:1842–1850`, "Open
   comparison: `π` induces an isomorphism `H^{k−1}_c(K′)^χ ≅ H^{k−1}_c(K)^χ` on `χ`-isotypic parts";
   ":1849–1850" "the `χ`-part of this weight-`(k − 2)` boundary correction has dimension `δ_{4∣k}`";
   the Check at :1856–1859 (`k = 4`); the restatements at :1879–1880 (§7.4) and :2135 (§9.1).

   **Claim.** For every even `k ≥ 4` the resolution `π : K′ → K` of the `binom(k, k/2)` nodes induces
   an isomorphism on `χ`-parts of `H^{k−1}_c`, and for `4 ∣ k` the weight-`(k − 2)` line of
   `H^{k−1}_c(K)^χ` survives in `H^{k−1}_c(K′)^χ` as the boundary term `E₂^{1,k−2}`.

   **Witness.** The localization sequences of `T ⊂ K′` and `S ⊂ K` give
   `H^{k−2}_c(K′) → H^{k−2}(T) → H^{k−1}_c(K) → H^{k−1}_c(K′) → H^{k−1}(T) = 0`: a surjection whose
   kernel is the image of `H^{k−2}(T)`, and `H^{k−2}(T) ≠ 0` (`T` is a union of quadrics of even
   dimension `k − 2`). The vanishing of `H^{k−2}(S)`, `H^{k−1}(S)`, `H^{k−1}(T)` (FSY line 2019) gives
   surjectivity only. Computed:

   | object | `k = 4` | `k = 6` | general even `k ≥ 4` |
   |---|---|---|---|
   | stabilizer of the node `s = (+^{k/2}, −^{k/2})` in `S_k × μ₂` | `(S₂ × S₂)·⟨(σ₀, −1)⟩` | `(S₃ × S₃)·⟨(σ₀, −1)⟩` | `σ₀` = the half-swap, `sgn σ₀ = (−1)^{k/2}` |
   | action on the hyperplane class of the quadric `T_s` | trivial, `χ` is the sign: killed | killed | killed (a transposition in a half has `χ = −1`) |
   | action of a transposition in a half on the primitive class | `−1` (a reflection swaps the rulings) `= χ` | `−1 = χ` | `= χ` |
   | action of `(σ₀, −1)` on the primitive class | `+1` (`z ↦ −swap(z)` maps `{w = Ru}` to `{w = R⁻¹u}`, same ruling) | `+1` | `+1` |
   | `χ(σ₀, −1)` | `+1` | `−1` | `(−1)^{k/2}` |
   | `dim H^{k−2}(T)^χ` | `1` | `0` | `δ_{4∣k}` |

   So `H^{k−2}(T)^χ` is a line of weight `k − 2` exactly when `4 ∣ k`. Its image in
   `H^{k−1}_c(K)^χ` is the vanishing-cycle line of the `b = 0` nodes (the primitive class maps onto
   `H^{k−2}` of the link, hence onto the generator of `H^{k−1}_{\{s\}}(K, RΨ)` for the family `g = τ`),
   and that line is nonzero: by this README's own §5.4 and the Check of §3.6 at `k = 2`, the monodromy
   of `M` at `τ = 0` is one Jordan block of size two, so `N ≠ 0`, so `δ ≠ 0`; `μ₂` acts on it by
   `(−1)^{k/2}`, which matches the `δ_{4∣k}` of FSY Theorem 1.8. As `gr^W_{k−2}H^{k−1}_c(K)^χ` has total
   dimension `δ_{4∣k}` (FSY line 1997–1999), all of it is this kernel, and
   `gr^W_{k−2}H^{k−1}_c(K′)^χ = 0`. Consistency: Frobenius on the `b = 0` primitive class is
   `(−1)^{0·p(p−1)/4}p^{(k−2)/2}`, after the twist `p^{k/2}`, the trivial factor `1 − p^{k/2}T` of
   `Z_k` for `4 ∣ k` (§8.2); the same phenomenon in dimension one is the nodal cubic of the Check of
   §7.1 (`H¹` of weight `0`, normalization `ℙ¹`). Nothing in §§7.4, 8.4, 8.6, 9.1 needs more than the
   isomorphism on `gr^W_{k−1}`, which holds.

   **Repair** (tested on `k = 4`: kernel of dimension one; `k = 6`: isomorphism).

   - Replace the "Open comparison" bullet by: "Open comparison: `π^* : H^{k−1}_c(K)^χ → H^{k−1}_c(K′)^χ`
     is surjective, and its kernel is the image of `H^{k−2}(T)^χ`, the `χ`-part of the primitive
     classes of the exceptional quadrics: a space of dimension `δ_{4∣k}`, pure of weight `k − 2`. So
     `π^*` is an isomorphism for `k ≡ 2 (mod 4)`, and for every even `k ≥ 4` it is an isomorphism on
     `gr^W_{k−1}` and on `W_{k−3}`. This holds in the Betti, de Rham and `ℓ`-adic realizations over `ℚ`,
     and `ℓ`-adically over `𝔽_p` for odd `p ≠ ℓ` (FSY (5.18), whose stated isomorphism is corrected
     here)."
   - Replace the bullet "With the open comparison, the `χ`-part of this weight-`(k − 2)` boundary
     correction has dimension `δ_{4∣k}`" by: "The `χ`-part of the boundary term `E₂^{1,k−2}` of `K̄′` is
     zero: the weight-`(k − 2)` line of `H^{k−1}_c(K)^χ` for `4 ∣ k` is the vanishing-cycle line of the
     `b = 0` nodes, the kernel of the open comparison."
   - Replace the Check `k = 4` by: "`k = 4`: `gr^W₂H³_c(K_{ℚ̄})^χ` has dimension one, spanned by the image
     of the primitive classes of the six quadric surfaces of `T`; it is the kernel of
     `H³_c(K)^χ → H³_c(K′)^χ`, so `gr^W₂H³_c(K′_{ℚ̄})^χ = 0`, and the middle part `gr^W₃` has dimension
     `d₄ = 0` on both. At `k = 6` the stabilizer element `(σ₀, −1)` has `χ = −1` and acts by `+1` on
     the primitive class, so `H⁴(T)^χ = 0` and the comparison is an isomorphism."
   - In §7.4 (line 1879–1880) and §9.1 (line 2135–2137) replace "its open comparison
     `H^{k−1}_c(K′)^χ ≅ H^{k−1}_c(K)^χ`" by "the isomorphism
     `gr^W_{k−1}H^{k−1}_c(K)^χ ≅ gr^W_{k−1}H^{k−1}_c(K′)^χ` of §7.3".
   - In §8.4, add after the statement of `E`: "for `4 ∣ k` the quotient `ℚ_ℓ(−k/2)` of `E` is the
     twisted vanishing-cycle line of the `b = 0` nodes".
   - Add to "Corrections to the sources" the first bullet of `## Source issues` below.

2. **F02** (P2) a statable headline is absent from `Suggested.lean`: the valuation bound `v_p(c_n) ≥ n(n − 1)`

   **Location.** `packages/KloostermanMomentsAndPotentialAutomorphy/Suggested.lean:13–40` (module
   docstring lists four stated results and four not statable); README :2143–2147 (§9.1) and
   :2417–2418 (§11.2, "**Corollary.** For odd `k`, `Z_k(2; T) = Σ c_nTⁿ` satisfies
   `v₂(c_n) ≥ n(n − 1)`").

   **Claim.** The file states the headline theorems that are statable at the pins.

   **Witness.** The bound mentions only `momentSeries` and integers, so it is statable with the
   definitions already in the file; it follows from no tactic (it is Newton above Hodge, FSY
   Corollary 5.27, Remark 5.28 and Remark 5.41, lines 2294–2319 and 2660–2679); it is neither stated
   nor named as not statable. Values computed from the finite sums: `Z₉(3; T)`: valuations
   `0, 0, 3, 10` against `0, 0, 2, 6`; `Z₁₃(2; T)`: `0, 0, 2, 6, 12, 20, 30, 42`, equal to `n(n − 1)`.

   **Repair.** Add under `/-! ## Layer 11 … -/`, and add the README name to §11.2's Corollary (and
   to §9.1's conclusion) in backticks; add one line to the module docstring's "Stated here" list. The
   statement was not elaborated (this pass runs no Lean); elaborate it with `#check @` before
   submitting.

   ```lean
   /-- For `k ≥ 1`, and for `p` odd or `k` odd, the coefficient of `Tⁿ` in `Z_k(p; T)` is an integer
   divisible by `p^{n(n−1)}`: the Newton polygon of `Z_k(p; T)` lies above the polygon with slopes
   `0, 2, 4, …` (Fresán–Sabbah–Yu, Corollary 5.27 and Remark 5.28 for odd `p`, Remark 5.41 for `p = 2`
   and odd `k`). At `n = 0` the exponent is `0`. -/
   theorem momentSeries_coeff_dvd (p : ℕ) [Fact p.Prime] (k : ℕ) (hk : 0 < k)
       (h : p ≠ 2 ∨ Odd k) (n : ℕ) :
       ∃ c : ℤ, coeff n (momentSeries p k) = (p : ℂ) ^ (n * (n - 1)) * (c : ℂ) := by
     sorry
   ```

   Tested on the refuting instance: `p = 2`, `k = 13`, `n = 7`: `c₇ = −2⁴²`, `c = −1`; `n = 0`:
   `0·(0 − 1) = 0` in `ℕ`, `c₀ = 1`.

3. **F03** (P3) two PadicHodgeTheory citations point at sections that do not state the fact used

   **Location.** README :413–415 ("§5.1: a de Rham representation of `G_K` … is potentially semistable;
   §5.2: the filtered `(φ, N)`-module of a semistable representation is weakly admissible, so its
   Newton polygon lies above its Hodge polygon"), used at :2411–2412 and :2420–2421.

   **Claim.** PadicHodgeTheory §5.1 and §5.2 own these two theorems.

   **Witness.** At its head PadicHodgeTheory §5.1 imports `deRham_iff_potentiallySemistable` from
   NoncommutativeAndEquivariantIwasawa §F.6 stage 3, and §5.2 is "Filtered modules as Robba
   modifications" (weakly admissible ⇔ étale modification) and says the admissibility theorem is
   "already supplied". The owner of "`D_st(V)` is weakly admissible" and of the polygon criterion is
   FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.2–R07.3.3 (`isWeaklyAdmissible_iff_polygon`),
   which PadicDifferentialEquationsAndRigidCohomology §RD.7.22 cites for the same step. Both owners
   are earlier in the merge order (lines 30 and 66 against 310).

   **Repair.** In the supplier contract and in §11.2 (proof sketches and `*Needs:*`): cite
   "NoncommutativeAndEquivariantIwasawa §F.6 stage 3 (`deRham_iff_potentiallySemistable`), as consumed
   by PadicHodgeTheory §5.1" for potential semistability, and "FiniteFlatGroupsAndIntegralPadicHodgeTheory
   §§R07.3.2–R07.3.3 (weak admissibility of `D_st(V)`; Newton above Hodge with equal endpoints)" for
   weak admissibility; keep PadicHodgeTheory §5.3 for `D_pst`. Add both roadmaps to the Layer 11
   Dependencies line and rerun the dependency check.

Three findings: R01 (P1), R02 (P2), R03 (P3). Both files were read in full (README 2581 lines,
Suggested.lean 219 lines). No finding re-raises a settled one: no repair report marks anything
`not actionable in this package`.

## The pass: Suggested.lean declarations

No `variable` or `include` line exists in the file; every binder is in the declaration's own
signature. I compared the 21 elaborated types of `scratch/signatures.md` with the README
statements: none lost a binder, nothing changed.

| declaration (layer) | instances tried | values computed | result |
|---|---|---|---|
| `kloostermanSum` (0) | `𝔽₂, a = 1`; `𝔽₃, a = 1, 2`; `a = 0`; trivial `ψ` on `𝔽₅` | `1`; `−1, 2`; `−1`; `4` | agrees with §0.2 |
| `traceChar` (0) | `m = 0`; `𝔽₄/𝔽₂` at `1`; `𝔽₉/𝔽₃` at `1` | `GaloisField p 0 = 𝔽_p`; `1 = (−1)²`; `ζ₃²` | total, as documented |
| `symmetricTrace` (0) | `h₂(3, 2)`, `h₃(2, 1)`, `h₉(1, 3)`, `h₉(−2, 3)` | `7`, `4`, `31`, `22` | sum `53 = m₂⁹(3)` |
| `moment` (0) | `k = 0`; `k = 1`; `(p, k, m) = (2, 3, 2)`, `(3, 9, 2)`, `(3, 9, 3)` | `q − 1`; `−1`; `−17`; `115181`; `−9408475` | agrees |
| `momentSeries` (0) | `k = 0`; `k = 1, 2` | `(1 − T)/(1 − pT)`; `1 − T` | `0 < k` needed and present |
| `momentSeries_weights` (8) | `(p, k) = (2, 3)`, `(3, 6)`, `(2, 12)`, `(3, 8)`, `(2, 5)`; `p = 2`, odd `k` | roots `−1/4`; `−1/27`; `±1/64`; `±1/81`; `|z| = 1/8`; no weight-`k` root (image of inertia at `∞` contains `−1`) | true as typed |
| `momentDegree` (8) | exact integer moments: `p = 2`, `k ≤ 16` and `k = 18, 20, 22, 24`; `p = 3`, `k ≤ 12`; `p = 5`, `k ≤ 5`; `p = 7`, `k ≤ 4` | coefficient `d` nonzero and `d + 1` zero in all 41 cases | agrees |
| `momentSeries_eq_intPolynomial` (8) | the same 41 cases | integer coefficients, constant term `1` | true on all |
| `thetaPlus`, `thetaMinus` (8) | `(k, p) = (9, 3)`, `(3, 3)`, `(1, p)`, `p = 2` | `{3}`, `{1}`; `∅`, `{1}`; `∅, ∅`; `Θ⁺₂ = ∅` | agrees with FSY line 1798–1803 |
| `oddEulerFactorInv`, `oddEulerFactor` (8) | `(9, 3)`; `(5, 2)`; `(1, p)`; `(3, 3)` | `(1 + 54T + 3¹⁰T²)(1 − 243T)` with `(−2/3) = 1`; `1 − 4T + 64T²`; `1`; `1` | agrees with FSY (5.13) |
| `oddConductor` (8) | `k = 1, 3, 5, 9` | `1, 3, 15, 105` | `= Π sf(j)` |
| `evenEulerFactorInv`, `evenEulerFactor` (8) | `(6, 3)`; `(4, p)`; `(8, 3)`; `(12, 3)`; `p = 2` | `1 + 27T`; `1`; `1 + 81T`; `(1 + 729T)(1 − 729T)`; `1` | agrees with FSY (5.22) |
| `evenConductor` (8) | `k = 6, 8` | `3, 3` | agrees |
| `middleDim` (8) | `k = 1…8`; `k = 0` | `0, 0, 1, 0, 2, 2, 3, 2`; junk `0` | `k = 0` never used |
| `paperGamma` (10) | `d = 0`; `d = 1`; `d = 2` | `1`; `π^{−1/2}Γ_ℝ(s − 1)`; `π^{−3/2}Γ_ℂ(s − 2)` | agrees |
| `eulerCoeff` (10) | `n = 0, 1, 6`; `L(2) = 2`; `L(p) = 1 + T − T²` | `1, 1, a₂a₃`; series `1` against product `2`; coefficient `1` at every prime | Checks of §10.4 hold |
| `oddMoment_functionalEquation` (11) | `k = 1`; `k = 3`; poles | `Λ = 1`; `3^{s/2}π^{−s/2}Γ((s − 1)/2)L(s − 2, χ_{−3})`, symmetric under `s ↦ 5 − s`; a normal form takes the value `0` at a pole on both sides | true as typed |
| `evenMoment_functionalEquation` (11) | `k = 2, 4`; `k = 6` | `r = 0, P = 1, ε = 1, Λ = 1`; level-`6` weight-`4` form: `a₃ = −3` gives `1 + 27T`, `a₂ = −2` gives `P = 1 + 8T`, `r = 1` | true as typed |

## The pass: README targets

| statement | instances tried | values on each side | result |
|---|---|---|---|
| §1.2 single block, pairing | `𝔽₂, a = 1` | `1 + T + 2T²`, roots of modulus `2^{−1/2}` | sound |
| §1.3 monodromy table | normalizer argument in the four cases | multiplier `c^{−2(r−1)}p^{r−1} = 1`; `λ² = λ⁷ = 1 ⇒ λ = 1` for `G₂` | sound |
| §1.4 determinant formula | `k = 0, 1`; `(p, k) = (2, 3)` | `(1 − T)/(1 − pT)`; `1 − T`; partner `16/(−4) = −4` | sound |
| §2.1, §2.3, §2.6 signs | `−f_r` with `x ↦ −x`; index over `ℚ` on `ℙ¹ ∖ {x² + 1}` | `f_r(x′, (−1)^r z)`; `0 − 2·1 = −2` | sound |
| §3.2–3.5 projectors, dimensions | `r = 2`, `k = 2, 3, 4` | cover `(2, 0)`, `(4, 3)`; descended `(1, 0)`, `(2, 1)`, `(2, 0)` | sound |
| §3.6, §5.7 weights | `k = 1, 2, 3` against MixedHodgeModules §§9.3, 9.4, 9.6 at its head | `P_{k−1} ⊂ gr^W_{2k−2}`, `gr^W_{2k+1}M′ = P_{k−1}(−1)`; types `(2,2), (3,3), (4,4)` | sound |
| §4.2 | `r = 2, k = 2` | `(y₁ + y₂)(1 + y₁y₂)` | sound |
| §5.2–5.6 | `k = 1…8`; leading matrix at `k = 1, 2` | irregularity `⌊(k+1)/2⌋`; `det = −z`; kernel `u₂ − zu₀` | sound |
| §6.1 fan and polytope | `k = 1, 2` | `3^k − 1` rays, `2^k k!` cones; `h = j(2k − j + 1)/2`; `21` lattice points; `g₁` at `k = 2` | sound |
| §6.4, §6.6 Hodge tables | `k = 1…10` | counts `k + 1`, `k`; `d_k`; gamma product `Π_{j ≤ d_k} Γ_ℝ(s − j)` | sound |
| §7.1 boundary, localization (a)–(c) | `g₁` on `z_r = 0`; edge map | `∂g₁/∂z₁ = A = −1/z₁`; `E_∞^{0,m} ⊂ H^m(Y)`, other pieces of weight `< m` | sound |
| §7.2 orbits | `(k, p) = (3, 3), (9, 3), (6, 3)`; `p = 2` odd `k` | `1`; `2` with constants `6, 18`; `2`; `g(1,…,1) = 2k`, valuation one | sound |
| §7.3 | `k = 4, 6` | see R01 | **false for `4 ∣ k`** |
| §8.2 factorizations | `p = 3`, `k = 6, 8, 10, 12`; `p = 2`, even `k ≤ 24` | `u, v, m` and `a_k, b_k, deg M_k` sum to `momentDegree` in all 16 cases; leading coefficients match | sound |
| §8.3–8.6 | `(9, 3)`; `(6, 3)`; `d_k = deg M + 2u` | `4 = 2 + 2`; `dim U = 1`; `v = ⌊(u + 1)/2⌋` | sound |
| §10.1 | `k = 3…15` odd | sign of `±k!!` with radicand `≡ 1 (4)`: `−, −, +, +, −, −, +` | agrees with `k ≡ 1, 7 (8)` |
| §10.3 even sign | `det(−F | V/U^⊥)` | `(−1)^u` for `p ≡ 1 (4)`, `(−1)^{u − v} = (−1)^{⌊k/(4p)⌋}` for `p ≡ 3 (4)` | sound |
| §9.1, §11.2 valuation bound | `p = 3`, `k ≤ 12`; `p = 2`, odd `k ≤ 15` | all `v_p(c_n) ≥ n(n − 1)`; equality for `p = 2`, `k = 5, 7, 9, 11, 13` | sound; see R02 |

## Dependency check

    depcheck: 240 roadmaps, 2187 edges, 0 problem(s)

No UPWARD or CYCLE line. The overlap listing shows no other open pull request changing this
roadmap, no dropped id and no second copy. KloostermanSheavesAndBesselIsocrystals (merge order 366)
is named only as a consumer.

## Verified sound

- Declarations read: 21 of 21. No padding: no declaration follows by one tactic or one library
  lemma, restates a definition or mirrors a Check; every definition is used by a stated theorem.
- Headline theorems listed from the README: integrality and degree; weights; Hodge numbers;
  monodromy groups; classicality and the motive; local structure, Euler factors and conductors;
  the regular polarized compatible system and potential automorphy; the two functional equations;
  the valuation bound. Stated: four. Named as not statable: four. Statable and absent: one (R02).
- README targets read: all of Layers 0–11 (58 subsections with their Checks).
- Checks recomputed: every Check carrying a numeric value in Layers 0, 1, 5–8, 10, 11 and the
  Worked examples (about 70), by hand or from exact finite sums; none is false except the `k = 4`
  Check of §7.3 (R01). Every definition has at least three Checks.
- Locators: 31 read against the text (FSY Theorems 1.2, 1.3, 1.8, (1.1), (1.5), (5.1)–(5.5),
  §§5.1.2–5.1.4, Theorems 5.8, 5.17, (5.13), (5.14), (5.18)–(5.22), Proposition 5.23, Corollaries
  5.27, 5.30, Remarks 5.12, 5.15, 5.28, 5.35, 5.37, 5.41, (5.31)–(5.36), Theorem 5.38, Corollary
  5.39, Lemma 5.40, §5.3.3; XZ (1.1.1.6), (1.1.2.1)–(1.1.2.3)); 24 more checked by statement
  number and printed page only. All agree with the README.
- Sibling citations: 127 section ids resolved to a heading at the supplier's head or on main (one,
  FormalConnectionsOpers F2.2, is the heading "2.2 … (F2.2)"); statements read and compared for
  CongruenceSpectralGap §§4.2a–4.2b, PadicDifferentialEquationsAndRigidCohomology §§RD.7.20–RD.7.22
  and RD.7.21a, MixedHodgeModulesAndIrregularHodgeTheory §§6.6, 8.4–8.8, 9.1–9.6,
  LefschetzPencilsAndVanishingCycles §§2.4, 6.6 and the Layer LPV.2 Examples,
  DeligneWeightsAndPurity §7.12, ArithmeticGaloisRepresentations §§2.6, 3.3,
  ModularityAndLanglandsExtensions §§2.42, 2.43, 2.49, AutomorphicGaloisRepresentationsPartII
  Layer AG2.6, PadicHodgeTheory §§5.1–5.3, AnalyticToricGeometryPartII §0.3.
- Pinned declarations: the 32 Mathlib and 4 Tau Ceti names of the supplier contracts exist at the
  pins (20 located by grep in their files, the others through the elaborated signatures).
- Declared gaps: the six slugs agree between `design/plan.json` and the README, each with a named
  supplier and section that exists; none is raised.
- Policy: the pull request changes only the package folder; no `set_option`, no `lemma`
  declaration, no pull-request number or process narrative in the README or docstrings; single
  `import Mathlib`.
- Ownership: no declaration of `Suggested.lean` shares a fully qualified name with a readable
  roadmap; the rank-two sum is declared as CongruenceSpectralGap §4.2a's at unit parameters.

## Not verifiable

- Saito-orthogonal: uncertified, cited by locator only.
- Fu–Wan and Yun (degree, trivial factors, determinant formula): primary texts not in the manifest;
  the degree and the `p = 2` factorization were confirmed only on the computed range above.
- The signs of the unramified lines `E⁺` and of the epsilon factors: checked for internal
  consistency and against FSY, not recomputed independently beyond `(k, p) = (9, 3)` and `(6, 3)`.
- Layer 6 Hodge filtration on the explicit bases (§§6.2, 6.3, 6.5): dimension counts only.
- XZ §2.1.5 and §4.1.13, Serre-orthogonal Theorem 4.2.1: page located, statement not compared.
- The six README "Corrections to the sources" other than those repeated below: not checked.
- Supplier sections whose headings resolve but whose statements were not read (the remainder of
  the 127).
- No Lean was run: the repair text of R02 is not elaborated.
- Ownership against open pull requests was checked through the overlap and citation listings and
  by reading the 22 suppliers and the companion roadmap, not by a search of all 234 heads.

## Source issues

- **Error** in FSY at the proof of Theorem 5.17, (5.18), printed page 46: the source says the resolution of the nodes induces an isomorphism on compact-support cohomology in degree `k − 1`, from the vanishing of three groups; it should be a surjection from `K` to `K′` whose kernel is the image of the middle cohomology of the exceptional quadrics, nonzero on the `χ`-part when `4 ∣ k`; affects the proof.
- **Error** in FSY at the proof of Theorem 5.17, after (5.20), printed pages 46–47: the source says the `χ`-part of the boundary term `E₂^{1,k−2}` has dimension `δ_{4ℤ}(k)`; it should be zero, the weight-`(k − 2)` line being the vanishing-cycle line of the characteristic-zero nodes; affects the proof.
- **Misprint** in FSY at §5.1.1, printed page 40: the source says the reciprocal roots of `M_k` are stable under an involution with exponent `(k + 1)/2`; it should be `α ↦ p^{k+1}/α`; affects nothing.
- **Misprint** in FSY at §5.1.2, printed page 41: the source says the derivative of `g₁` in `z₁` does not vanish on the divisor `z_r = 0`; it should be on the intersection of that divisor with the closure of `K`; affects nothing.
- **Error** in FSY at the proof of Proposition 5.23, printed page 50: the source says every ordinary quadratic point has local equation `Q − u·(√−p)²` with `u` a unit; it should allow `(√−p)^{2e}`, `e ≥ 1` (constant term `18` at `k = 9`, `p = 3`, `a = 3`); affects the proof.

Source independence: 16 passages compared with 2 sources (FSY, XZ), none shared beyond formulas and statement-forced phrases of at most six words; largest share FSY, 98 of 108 source mentions; contents compared with FSY: independent — Layers 2–11 are an order-preserving regrouping of FSY §§2.1–5.3 (Layer 2 ↔ §2.1, Layer 3 ↔ §§2.2–2.3, Layer 4 ↔ §3, Layer 5 ↔ §§4.1–4.2, Layer 6 ↔ §4.3, Layers 7–8 ↔ §§5.1.1–5.1.4, Layer 9 ↔ §5.1.5, Layer 10 ↔ §§5.2 and 5.3.1, Layer 11 ↔ §§5.3.2–5.3.3), not one to one, and the order is forced by the Dependencies lines (3 on 2; 4 on 1–3; 6 on 3–5; 7 on 3, 4, 6; 8 on 1, 4, 7; 9 on 4, 6–8; 10 on 6, 8, 9; 11 on 4, 6–10); Layers 0 and 1, the boundary-localization theorem of §7.1, §5.7 and the slope theorem of §11.2 have no counterpart section. Serre-orthogonal was located but not compared; Saito-orthogonal could not be read.

## For the human reviewers

- **Scope.** One article supplies 98 of 108 source mentions (FSY, Duke Math. J. 2022), and Layers 2–11 follow its sections in order under the dependency lines listed above (README "How to read the build", FSY contents lines 15–35).
- **Licence.** none
- **Not tested.** Saito-orthogonal (Invent. Math. 1995) is cited through FSY §5.3.3 only; its hypotheses for the declared root-number gap were not read.
- **Source errata.** R01 asserts an error in a published proof (FSY (5.18), p. 46) that the README currently reproduces; the argument is in R01's witness and a specialist may wish to confirm it before it enters the errata register.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cdfffd9b058d84dceef7b41b74d255604f5fea1f", "job": "RT-KloostermanMomentsAndPotentialAutomorphy~1b", "model": "fable", "worker": "chris-x26"} -->
