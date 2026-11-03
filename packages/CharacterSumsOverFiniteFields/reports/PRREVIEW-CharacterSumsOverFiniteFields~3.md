# Review of CharacterSumsOverFiniteFields (pull request #1712 at e459420)

**Verdict:** accepted

Full review of `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md` and `Suggested.lean` at `e459420d235f0e3bd9f325953309dbe3f8b9fc7e`. The gate passes, the dependency check reports no UPWARD or CYCLE line, every one of the 22 findings of the previous review is repaired except one locator finding that is only partly repaired (R04 below, re-raised as P3), and the adversarial pass found no false statement. The four findings below are P3 notes; none blocks acceptance. No pull-request file was changed.

## R01 (P3) — The 3.4 Checks label the sides of the product relation opposite to the contract and invert the character factor

Location: `README.md:949–955`, the Checks of 3.4: “(`χ^m = 1`) … the left side is `g(λ⁻¹) g(1) g(λ) = −λ(−1) · 7 = −7` and the right side is `λ⁻¹(3)^{−3} g(1) g(λ) g(λ²)`”, and “(`m = 1`) … the right side being `χ(1)⁻¹ g(χ)` times an empty product”.

Claim: the Checks exercise the supplier's identity `g(χ^m) ∏_{1≤j<m} g(λ^j) = χ(m)^m ∏_{0≤j<m} g(χλ^j)` (`README.md:354`, `ClassicalArithmeticCompletion` §7.29, main line 15058; Conrad (A.6), `conrad line 1182`).

Witness: in the contract's form the left side is `g(χ^m) ∏ g(λ^j) = g(1) g(λ) g(λ²)` and the factor is `χ(m)^{+m}`. The Checks swap the two sides and write `λ⁻¹(3)^{−3}` and `χ(1)⁻¹`; the values agree only because `λ(3)³ = 1 = χ(1)`. The direction matters in general: over `𝔽_13` with `χ = ω`, `m = 4`, `λ = ω³`, the contract's form gives `−42.6928 − 163.5186 i` on both sides, while the `χ(4)^{−4}` form gives `−120.2648 + 118.7324 i`.

Repair: write both Checks in the contract's orientation, `g(χ^m) ∏_{j≥1} g(λ^j)` on the left and `χ(m)^m ∏_{j≥0} g(χλ^j)` on the right (so `λ⁻¹(3)^{3}` and `χ(1)^{1}`), and add the `m = 4` instance above as the Check that fixes the sign of the exponent. Tested: all twelve characters and every `m ∣ 12` over `𝔽_13` satisfy the contract's form (0 failures), and the inverted exponent fails at `m = 4`.

## R02 (P3) — The 5.5 “endpoints” Check gives a reason that fails for `p ≡ 1 (mod 4)`

Location: `README.md:1316–1318`: “`θ = 0` would mean `K = −2√q` … both irrational for a prime field with `q > 4` while `K(1; a, b)` is an algebraic integer of `ℚ(ζ_p)^+`; neither endpoint is attained”.

Claim: irrationality of `±2√p` excludes `K(1; a, b) = ±2√p`.

Witness: for `p ≡ 1 (mod 4)`, `√p ∈ ℚ(ζ_p)^+`: `ζ_5 + ζ_5⁴ − ζ_5² − ζ_5³ = 2.236068 = √5`, so `2√5` is an algebraic integer of `ℚ(ζ_5)^+` and irrationality excludes nothing. The conclusion is still true: `K(1; 1, c)` over `𝔽_5` takes the values `0.382, −3.236, 1.236, 2.618`, none `±4.472`.

Repair: replace the reason by the second-moment argument, `∑_{c ∈ 𝔽_p^×} K(1; 1, c)² = p(p − 1) − 1` (computed: `19` at `p = 5`, `155` at `p = 13`), so that if one value were `±2√p` its `(p − 1)/2` Galois conjugates `K(1; 1, t²c)` would contribute `2p(p − 1) > p(p − 1) − 1`; or keep the irrationality reason only for `p ≡ 3 (mod 4)`, where `√p ∉ ℚ(ζ_p)`.

## R03 (P3) — Two supplier declaration names are expansions of abbreviations the supplier never spells out

Location: `README.md:369–370` (“its corollaries `grossKoblitz_formula_valuation` … and the leading residue”) and `README.md:1476` (“`grossKoblitz_formula_leading_residue`”).

Claim: these are declaration names of `DirichletPadicLFunctions` §4.5.

Witness: at the head of `DirichletPadicLFunctions` (pull request #1039, `178c10f`) the README names its milestones as “`grossKoblitz_formula`, `_valuation`, `_leading_residue`” with the prefix elided (its §4.5, line 1098), and `Suggested.lean` there declares only `grossKoblitz_formula`. Neither full name occurs anywhere.

Repair: cite the two corollaries in prose as §4.5's valuation identity `‖g_q(a)‖ = ‖p‖^{S_p(a)/(p−1)}` and its leading-residue congruence, or quote the supplier's abbreviated names; do not present a guessed expansion as the supplier's declaration. The statements themselves are in the supplier's §4.5 (“Deduce `‖g_q(a)‖=‖p‖^(S_p(a)/(p−1))`, the leading factorial residue …”), so no mathematics changes.

## R04 (P3) — Chapter-level locators remain for Schmidt and Berndt–Evans–Williams

Re-raised: R21 of the previous review (partly repaired: 4.4 now names exact pinned declarations with files; 5.3 cites Iwaniec–Kowalski Lemma 12.4; 7.5–7.6 cite Knightly–Li by theorem and page).

Location: `README.md:1016–1017` (“Schmidt, *Equations over Finite Fields*, Ch. I (the method for `y^d = f(x)`)”), `README.md:1029` (“Schmidt Ch. I for (i)”), `README.md:1148` (“Schmidt Ch. II”), and 2.5, whose only source is “Ch. 6” of Berndt–Evans–Williams (`README.md:1909`).

Claim: these locate the bounds of 4.2, 4.3 (i), 4.7 and Jacobsthal's theorem of 2.5.

Witness: a chapter is not a theorem-and-page locator; the texts are paywalled (Springer, Wiley) and could not be read, so the exact statements and constants used were not certified.

Repair: give the theorem (or lemma and proof step) and printed page in Schmidt Ch. I–II for the two Stepanov bounds and the `L`-function step, and the theorem number in Berndt–Evans–Williams Ch. 6 for `φ_2(1) = −2a` with `a ≡ 1 (mod 4)` and for `φ_2(r) = ±2b`. The mathematics of these targets was checked independently (table below).

## Disposition of the previous review (f90a255)

| Previous finding | Passage at e459420 and disposition |
|---|---|
| R01 (Jacobsthal at `n = 0`) | **Repaired.** `Suggested.lean:144,151` carry `(hn : 0 < n)`; README:807 keeps the `𝔽_3`, `n = 0` computation `ψ_0(1) = −3` against the expansion's `−1` (recomputed: `−3` and `−1`). |
| R02 (Artin–Schreier constants) | **Repaired.** README:1023,1026 “depending only on `q,n`” / “`q,d`”; `stepanov_artinSchreier (q n)` and `stepanov_kloostermanCurve (q d)` quantify `C₀ Q₀` before the field; Layer 4 intro now includes “the degree `q` in `y`”. Recomputed the Check: `y^q − y = x²` has `N = 63` over `𝔽_81` and `525` over `𝔽_625`, normalized errors `−2, −4`. |
| R03 (resultant scalar) | **Repaired.** README:1067–1070 gives `λ_f(g) = χ((−1)^{deg f} c)^{deg g} ∏_P (χ^{e_P} ∘ N)(g mod P)` and the degree-factor Check (`1, −1` at `X − 1`, `X² − 1`; recomputed). |
| R04 (`a = 0` in the Gauss product) | **Repaired.** README:1405–1407 restricts to `0 < a < q − 1` and records `g_0 = −1`; worked example `7.2` says “`N = 7^6` for `a ≠ 0`”. Recomputed `g_a g_{6−a} = ω^{−a}(−1)·7` for `a = 1..5` and `g_0² = 1`. |
| R05 (trivial-pair `L`-series) | **Repaired.** README:873–875: `(q − 1)q^{d−1}`, `L = (1 − T)/(1 − qT)`, `1 + 2T + 6T²`. |
| R06 (composite-modulus control) | **Repaired.** README:1587–1588 and 1864–1868 state the cross-multiplied failure `0 ≠ −9` and that totalized division masks it. Recomputed: `J(χ, χ⁻¹) = 0`, `τ(χ)τ(χ⁻¹) = −9`, `τ(1_9) = 0`. |
| R07 (Katz angle) | **Repaired.** README:1313–1315: “`θ' = θ`, with both sides `−2.0489`”. Recomputed `2√7 cos θ_7 = −2.0489 = −K_7(1,1)`. |
| R08 (additive sign) | **Repaired.** Conventions:239 and README:432–434: `g(χ, ψ⁻¹) = χ(−1) g(χ, ψ)`, conjugation inverts both. Recomputed: `2.440133 − 1.022619 i` vs conjugate `−2.440133 − 1.022619 i`. |
| R09 (trace character) | **Repaired.** README:1393–1394 fixes `ψ(x) = ζ_p^{Tr x}` with the same `ζ_p` as `λ`; the shift Check at 1422 records the factor `ω(2)^a = −1`. |
| R10 (lifted Jacobi norm) | **Repaired.** README:965: `q^{n/2}` for `χψ ≠ 1`, `1` for `χψ = 1`. Recomputed: `J(η_9, η_9) = −1`. |
| R11 (absolute value at `χ = 1`) | **Repaired.** README:668–669. |
| R12 (zero polynomial) | **Repaired.** README:994 “For nonzero `f`” and the Check at 1007. |
| R13 (hyperelliptic degree) | **Repaired.** README:1165–1166 “degree `m ≥ 1`”, Check at 1173. |
| R14 (conductor exponent) | **Repaired.** README:1643–1644 “conductor `p^j`, induced to modulus `p^k`”; the principal-modulo-25 example at 1653–1655 (recomputed `S_1(5,5;25) = 1.9098 = 5 S(1,1;5)`). |
| R15 (`τ_2` at even modulus) | **Repaired.** README:1720–1723 (recomputed `τ_2 = 0` modulo `4`, `|τ_2| = √5` modulo `5`). |
| R16 (`p = 2` reflection) | **Repaired.** README:1517 restricts the parity formula to odd `p`; 1523–1527 uses the mod-four law. Recomputed `Γ_2(x)Γ_2(1 − x) = (−1)^{1+x₁}` at `x = 1/3, 2/3, 1/5, 3/5, 2, 3, 5, 6` modulo `2^12`. |
| R17 (empty family) | **Repaired.** README:744,747–748 add `r ≥ 1`; Check at 773–775. |
| R18 (product formula owner) | **Repaired.** README:35,147–149,354–355 consume `ClassicalArithmeticCompletion` §7.29; `Suggested.lean` has no product theorem. |
| R19 (Teichmüller via §1.23) | **Repaired.** README:1359–1368 specializes `powerResidueSymbol` at `n = q − 1`; contract at 349–353. |
| R20 (Kummer uniformity) | **Repaired.** `stepanov_kummer (d m)`: `∃ C₀ Q₀, ∀ F … (f : F[X]), f.natDegree = m → …` (elaborated type checked). |
| R21 (locators) | **Partly repaired**: 4.4 names `Matrix.det_vandermonde`, `Matrix.mul_nonsing_inv`, `tendsto_pow_atTop_nhds_zero_of_norm_lt_one` with files (all present at the pin); Schmidt and Berndt–Evans–Williams remain chapter-level. Re-raised as R04. |
| R22 (quadratic-character Checks) | **Repaired.** README:505–523: four API bullets and four Checks. |

No repair report marked any finding “not actionable in this package”.

## Verified sound

**Coverage and mechanical evidence.** Read all 49 numbered targets, their API lists, Checks, worked examples, references and dependency lines, and all 51 declarations of `Suggested.lean` (32 admitted theorems, 19 definitions, abbreviations and one instance). The worktree is clean at `e459420d`; `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`) only. The worker's gate reports every scanner, `depcheck=0`, `metadata=0`, `stray-files=0` and `build=0 OK`. Ran `lake env lean` on `Suggested.lean` myself: exit 0, exactly 32 `declaration uses sorry` warnings and nothing else (`module`, `public import Mathlib`, `@[expose] public section`; no `set_option`, no `lemma`, no `#eval`, no sorry'd data, no LaTeX, no process words, no pull-request numbers). The requested dependency command returned

```text
depcheck: 204 roadmaps, 1594 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line; the roadmap sits at position 141 of the merge order, after every supplier it names (CyclotomicClassGroupsAndStickelberger 29, GeometryOfNumbersAndQuadraticArithmetic 65, DeligneWeightsAndPurity 75, DirichletPadicLFunctions 78, AutomorphicSpectralTheory 79, AnalyticNumberTheoryPartI 81, EllipticLegendreCharacterInterfaces 86, CongruenceSpectralGap 140). FunctionFieldArithmetic (332) and CurvesOverFiniteFields and HypergeometricMotives (open, unlisted) are named only as later borderers or consumers, never on a `*Needs:*` line or in a contract.

**Signatures.** Elaborated the worker's `#check @name` file for all 51 declarations (its only error is a stray `;` parsed from prose) and compared each type with the README. The two lost-binder leads (`crtFactorLeft`, `crtFactorRight`) are not findings: both take `(h : c₁.Coprime c₂)` explicitly in their own signature. Hypotheses that matter are in scope: `(hn : 0 < n)` in both Jacobsthal expansions; `ringChar F ≠ 2` for `quadChar` theorems; `(hr : 0 < r)` and `(hb : b ≠ 0)` in `card_diagonal_sub_le`; `f ≠ 0` and `¬ ∃ c h, f = C c * h ^ orderOf χ` in 4.5 and 4.7; `0 < f.natDegree` and `¬ ringChar F ∣ f.natDegree` in 4.6 and 4.8; `Squarefree f ∧ 0 < f.natDegree` in 4.9; units `a b : Fˣ` in 5.2–5.5; `(χ * ψ).IsPrimitive` in 7.2; `p ≠ 2`, `2 ≤ k`, `¬ p ∣ m n`, `ℓ² ≡ m n` in 7.5; the cube-free hypothesis in 7.6. Generality agrees with the README in both directions (`R` a finite commutative ring for `kloostermanSum` only; the Stepanov constants quantified before the field and the polynomial). No `def` or `instance` lost a section variable its type mentions.

**Padding probe.** Replaced every `sorry` by `first | rfl | simp | infer_instance | norm_num | positivity | exact le_refl _` on a scratch copy: all 32 theorems fail, so none closes in one tactic; none restates a definition, mirrors a Check or computes a small value. The 19 non-theorem declarations are the carriers the headlines need (`stdAddChar`, `quadChar`, `liftNorm`, `liftTrace`, `gauss`, `multiJacobiSum`, the two Jacobsthal sums, `monicOfCoeffs`, `IsMonicMultiplicative`, `lSeries`, `extensionSum`, `mulCharResultant`, `addCharTrace`, `kloostermanSum`, the two CRT factors, the `Fintype` instance), each with a real body. Every Lean name appears in the README and every backticked own name in the README is declared (gate `readme-ids-missing=0`, checked by grep).

**Headline theorems.** From the README's “Owned here”: Weil's bounds (4.7, 4.8) and point-count corollaries (4.9), the uniform Stepanov bounds (4.2, 4.3), the `L`-polynomials (4.5, 4.6), the root-power identity (3.2), the Hasse–Davenport lifting relation and the sign of `g(η_q)` (3.3), Jacobi lifting (3.5), multiple Jacobi sums and diagonal counts (2.4), Jacobsthal's expansions and theorem (2.5), the field of definition (1.3), Salié's evaluation, the Kloosterman `L`-polynomial, lifting and Weil bound (5.2–5.5), and the integer-modulus formulas and bounds (7.1–7.6): all stated. The module docstring names as not statable the Teichmüller character and everything of Layer 6 (its carrier is `ClassicalArithmeticCompletion` §1.23's `powerResidueSymbol`, not compiled), the prime-field sign (`AnalyticNumberTheoryPartI` §2.30's), the two comparisons with `CongruenceSpectralGap` §4.2a and `AutomorphicSpectralTheory` §1.16, and 7.7; checked that none of these is statable at the pins.

**Library declarations opened at the pins** (Mathlib `f6090c709`, Tau Ceti `358314d4ab`): `gaussSum_mulShift_eq`, `star_gaussSum_eq`, `gaussSum_one_one`, `gaussSum_one_right`, `gaussSum_one_left`, `mul_gaussSum_inv_eq_gaussSum`, `gaussSum_mul_gaussSum_eq_card`, `gaussSum_ne_zero_of_nontrivial`, `gaussSum_sq`, `gaussSum_frob`, `Char.card_pow_card`, `FiniteField.two_pow_card` (`Mathlib/NumberTheory/GaussSum.lean`); `jacobiSum_comm`, `jacobiSum_ringHomComp`, `jacobiSum_one_one`, `jacobiSum_one_nontrivial`, `jacobiSum_nontrivial_inv`, `jacobiSum_mul_nontrivial` (line 165: `gaussSum (χ * φ) ψ * jacobiSum χ φ = gaussSum χ ψ * gaussSum φ ψ` for `χ * φ ≠ 1`), `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`, `jacobiSum_mul_jacobiSum_inv`, `jacobiSum_mem_algebraAdjoin_of_pow_eq_one`, `gaussSum_pow_eq_prod_jacobiSum` (`JacobiSum/Basic.lean`); `quadraticChar_isQuadratic`, `quadraticChar_sum_zero`, `quadraticChar_card_sqrts`, `quadraticChar_neg_one`, `quadraticChar_two`, `quadraticChar_card_card`, `quadraticChar_odd_prime`; `DirichletCharacter.sum_characters_eq`, `sum_char_inv_mul_char_eq`, `gaussSum_mulShift_of_isPrimitive` (`DirichletCharacter/GaussSum.lean`, every `a : ZMod N`), `gaussSum_eq_zero_of_isPrimitive_of_not_isPrimitive`, `factorsThrough_of_gaussSum_ne_zero`, `rootNumber`, `changeLevel`, `FactorsThrough`, `conductor`, `IsPrimitive`, `primitiveCharacter`; `MulChar.map_nonunit`, `inv_apply'` (`MulChar/Basic.lean:324`), `star_eq_inv` (`MulChar/Lemmas.lean:73`), `apply_mem_rootsOfUnity`, `exists_mulChar_orderOf`, `exists_mulChar_orderOf_eq_card_units`, `equiv_rootsOfUnity`, `ofRootOfUnity`, `exists_apply_eq_pow`, `apply_mem_algebraAdjoin`, `val_neg_one_eq_one_of_odd_order`, `orderOf_dvd_card_sub_one`, `sum_one_eq_card_units`, `MulChar.finite` (`MulChar/Duality.lean:39`), `card_eq_card_units_of_hasEnoughRootsOfUnity`, `exists_apply_ne_one_of_hasEnoughRootsOfUnity`; `AddChar.mulShift`, `mulShift_mul`, `inv_mulShift`, `to_mulShift_inj_of_isPrimitive`, `IsPrimitive.of_ne_one`, `sum_mulShift`, `AddChar.card_eq` and `sum_apply_eq_ite` (`Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean:101`), `ZMod.stdAddChar`, `stdAddChar_apply`, `isPrimitive_stdAddChar`, `FiniteField.primitiveChar_to_Complex`; `FiniteField.trace_to_zmod_nondegenerate`, `roots_X_pow_card_sub_X`, `splits_X_pow_card_sub_X`, `algEquivOfCardEq`, `hasseDeriv_mul`, `hasseDeriv_apply`, `rootMultiplicity_zero`, `card_roots'` (`Polynomial/Roots.lean:78`), `IsCyclotomicExtension.Rat.zeta_sub_one_prime'` (`NumberField/Cyclotomic/Basic.lean:310`), `torsionOrder_eq`, `NumberField.Embeddings.pow_eq_one_of_norm_eq_one`, `adicCompletionIntegers`, `Matrix.det_vandermonde`, `Matrix.mul_nonsing_inv`, `tendsto_pow_atTop_nhds_zero_of_norm_lt_one`, `ZMod.unitOfCoprime`, `ZMod.chineseRemainder`. Tau Ceti: `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` (`DirichletCharacter/GaussSum.lean:42`, `gaussSum χ e * gaussSum χ⁻¹ e⁻¹ = Fintype.card (ZMod n)` for primitive `χ`, primitive `e`), `gaussSum_sq_of_isPrimitive_of_isQuadratic`, `gaussSumOfPrimitiveRoot` and its three lemmas, `FiniteField.primitiveChar_to_Complex_ne_one`, `MulChar.ofUnitHom_inv_eq_star`, `TauCeti.teichmuller` (`RingTheory/Henselian/Teichmuller.lean:92`), `TauCeti.teichmullerLift`, `residue_teichmullerLift`, `teichmullerLift_unique`. All present, with the hypotheses the README states.

**Cross-roadmap citations resolved.** On main (`95d4c02`): `ClassicalArithmeticCompletion` §§1.19, 1.23 (`powerResidueSymbol`, `_spec`, `_eq_iff`, `orderOf_powerResidueSymbol`; its exponent `(N𝔭−1)/n` is `1` at `n = q − 1`), 1.36, 1.46, 1.47, 1.53, 1.55, 1.60, 4.19 (`quadraticExpSum`, `quadraticExpSum_one_eq_gaussSum`), 7.12 (the congruence with `ζ_p − 1` and `−gaussSum(ω⁻ᵃ, ψ)`) and 7.29 (the product relation exactly as the contract quotes it, including `χ = 1` and the `j = 0` sign remark); `ThetaSeries`; `Completed/Multiquadratic`, `Completed/Chebotarev`, `Completed/ArithmeticDirichletSeries`. At open heads: `AnalyticNumberTheoryPartI` §2.30 (#1126, `89a4c37`: `κ(D) = 1` for `D > 0`, `i` for `D < 0`, `D = 5 ↦ √5`, `D = −3 ↦ i√3`); `DirichletPadicLFunctions` §§4.1, 4.4, 4.5 (#1039, `178c10f`: signed Morita `Γ_p`, the odd-`p` reflection `(−1)^{R(x)}` with `R ∈ {1,…,p}`, the dyadic `(−1)^{1+x₁}`, the digit identity, `π^{p−1} = −p`, `π ≡ ζ − 1 (mod (ζ − 1)²)`, `g_q(a) = −∑ ω(x)^{−a} ζ^{Tr x} = π^{S_p(a)} ∏ Γ_p(a_j/(q−1))`, `g_q(0) = 1`; `grossKoblitz_formula` in its `Suggested.lean:283`); `AutomorphicSpectralTheory` §1.16 (#925: `S(m,n;c)` over `(ℤ/cℤ)^×`, frequency symmetry, `kloosterman_real`, the Ramanujan value); `CongruenceSpectralGap` §4.2a–4.2b (`rev/1504`, README 622–700 and `Suggested.lean:42,51`: `hyperKloosterman F k ψ r` over unit `k`-tuples of product `r`, `hyperKloosterman_bound` for `1 ≤ k`, `ψ ≠ 1`); `EllipticLegendreCharacterInterfaces` 5.1 (`rev/1545`, README 592–620, `Suggested.lean:89` `symmetric_cubic_trace_zero` for `card F % 4 = 3`); `GeometryOfNumbersAndQuadraticArithmetic` §4.3 (#851, `halfIntegralKloosterman` with the Jacobi symbol); `FunctionFieldArithmetic` Layer 5 §5.4 (`rev/1474:1838–1845`, `|α_i| = √q`); `HypergeometricMotives` (`rev/1716`) consumes exactly this roadmap's Layer 1, 3.3–3.4 and 6.4–6.5, as the Downstream section says. The LMFDB knowls: `lmfdb-gauss line 90–92` (`τ_a(χ) = ∑_{r ∈ ℤ/qℤ} χ(r) e^{2πiar/q}`), `lmfdb-jacobi line 90`, `lmfdb-kloost line 90–93` (sum over `(ℤ/qℤ)^×`, “reduces to the Gauss sum if `b = 0`”), `lmfdb-conrey line 90–100`.

**Ownership against open work.** `tauceti-roadmap roadmaps grep` for Kloosterman, Hasse–Davenport, Stepanov, Jacobsthal, Salié and Stickelberger across main and the 439 open pull requests: the Kloosterman owners are `CongruenceSpectralGap` (hyper-Kloosterman, consumed), `AutomorphicSpectralTheory` (`S(m,n;c)`, consumed), `PadicDifferentialEquationsAndRigidCohomology` (#1002, the Kloosterman F-isocrystal, which itself consumes `CongruenceSpectralGap` §4.2a and states no twisted sum, no Salié evaluation and no integer-modulus sum), `MetaplecticAutomorphicForms` and `GeometryOfNumbersAndQuadraticArithmetic` (theta-multiplier sums, deferred at README:69–74). The Stickelberger owners are `ClassicalArithmeticCompletion` (consumed) and `CyclotomicClassGroupsAndStickelberger` (#1260, which consumes the same §§1.47, 1.55, 7.12 for its ideal descent and states none of 6.2–6.5's Gauss-sum valuations for general `a`, Jacobi digit-sum formula or Gross–Koblitz transport). No other roadmap defines `kloostermanSum` on a finite ring, the monic `L`-series, the resultant and trace multiplicative functions, Jacobsthal sums or the integer-modulus twisted bounds. No `Suggested.lean` elsewhere declares a name of this file. Ownership against open pull requests without a checkout was checked through the grep tool only.

**Sources read at their locators.** Conrad, `conrad line 1182–1190` (A.6 with `χ(n)^n` and the `j = 0` sign remark; A.5 the duplication `G(χ²) = χ(2)² G(χ)G(χη)/G(η)` at line 1172, footnote 8 for `χ = η`), p. 19 as cited. Beukers–Cohen–Mellit, `bcm line 131–143` (Theorem 1.3 on p. 3 as cited; Theorem 2.5 the Hasse–Davenport product at line 319). Knightly–Li, `knightly-li line 6817–6824` (Theorem 9.2, p. 120, general `c`, `τ(n)τ(c)(an,bn,c)^{1/2}c^{1/2}c_χ^{1/2}`, which at `n = 1` is 7.6's twisted form), `6844–6848` (Theorem 9.3, p. 120, (9.7) and (9.8) as cited), `6857` (Proposition 9.4: `|S_χ(a,b;p)| ≤ 2(a,b,p)^{1/2}p^{1/2}`), `6970–6978` and `7006–7012` (Propositions 9.7 (3) and 9.8 (3): `2c^{1/2}` whenever `γ ≤ ℓ − 1`, which contains 7.5's `j ≤ ⌊k/2⌋` case, and `S = 0` when `p ∣ b`), `7059–7063` (Example 9.9, p. 125: `S_χ(a,b;p³) = p²` for primitive `χ`, exceeding `τ(c)(a,b,c)^{1/2}c^{1/2}` from `p = 17`). Gross–Koblitz (university-hosted scan, OCR), `gross-koblitz line 31` (“Let `p` be an odd prime”), `104–106` (Theorem 1.7, printed p. 571), `154–155` (Lemma 2.3, the reflection with `0 < R ≤ p`). Bombieri (Numdam), `bombieri line 69, 110–121` (Theorem 1 by Riemann–Roch, as the References describe). `DirichletPadicLFunctions` §4.4 for the dyadic reflection law used in 6.5.

**The adversarial table.** Every value below was recomputed in this review (complex sums exactly or to `10⁻⁶`; `p`-adic identities in `ℤ_p[ζ_p]` modulo `p^7`–`p^8` with the Eisenstein basis `1, λ, …, λ^{p−2}`, `λ = ζ_p − 1`, `π = λ·v` with `v^{p−1} = −p/λ^{p−1}`, `v ≡ 1`).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 `ψ_F`, sign of the exponent | `𝔽_7`, `ω(3) = e(1/6)` | `g(ω) = −2.4401 + 1.0226 i`; `g(ω, ψ⁻¹) = 2.4401 − 1.0226 i = ω(−1) g(ω)`; `conj g = −2.4401 − 1.0226 i` | sound |
| 0.3 orthogonality and power count | `𝔽_7`: `∑_χ χ(2)`, `#{y² = 2}`, `#{y² = 0}` | `0`; `2 = 1 + η(2)`; `1 = 1 + η(0)` | sound |
| 0.5 Galois action `χ.ringHomComp σ = χ^t` | `σ_3 : ζ_7 ↦ ζ_7³` on `g(ω)` | `−0.3345 + 2.6245 i = ω(3)⁻¹ g(ω)` | sound |
| 0.6 lifts | `𝔽_3 ⊂ 𝔽_9`, `𝔽_7 ⊂ 𝔽_49` | `N(i) = 1`, `η_9 = η_3 ∘ N`; `(ψ_3).liftTrace(1) = e(2/3) = ψ_9(1)` | sound |
| 0.7 CRT factors, additive shifts, conductor | all characters mod 15, 20, 21, 24, 40; `e(2/3)e(2/5)` | `χ = χ₁χ₂` for all; `e(16/15) = e(1/15)`; conductor multiplicative, 0 failures | sound |
| 1.1 trivial cases | `𝔽_7` | `g(1) = −1`; `K(1;a,0) = −1`; `K(1;0,0) = 6` | sound |
| 1.2 `g(χ)g(χ⁻¹) = χ(−1)q` | `𝔽_7`, `a = 1..5` | `g_a g_{6−a} = ω^{−a}(−1)·7`: `−7, 7, −7, 7, −7` | sound |
| 1.3 field of definition, `g(χ)^m`, Galois norm | `𝔽_7`: `N_{L/ℚ}(g_a)`, `g(χ)³/g(χ²)³` | `7^6` for `a = 1..5`, `1` for `a = 0`; ratio `−0.9286 − 0.3712 i` of modulus 1 | sound |
| 1.4/3.3 sign of `g(η_q)` | `q = 9, 25, 27, 49, 121` | `3, −5, −5.196 i, 7, 11` `= (−1)^{f−1}(ε_p√p)^f`; `g(η_3)² = −3 ≠ 3` | sound |
| 1.5 small orders | `𝔽_7` order 6 and 3; `𝔽_5`, `𝔽_13` order 4 | `g(ω)⁶ = −7 ∏_{i=1}^{4} J(ω,ω^i) = −248.5 − 236.42 i`; `g(χ)³ = 7J(χ,χ) = 3.5 − 18.19 i`; `J(χ,χ) = χ(−1)J(χ,η)` true | sound |
| 2.1–2.2 Jacobi values | `𝔽_7` | `J(ω,ω) = 2.5 − 0.866 i = 3 − ζ_6`, `|J| = √7`; `J(η,η) = 1`; `J(ω,ω⁵) = 1`; `J(ω,1) = −1`; `J(1,1) = 5` | sound |
| 2.3 two-squares parity | `p = 5, 13, 17, 29, 37, 41` | `J(χ,χ) = −1−2i, 3−2i, −1+4i, −5−2i, −1+6i, −5+4i`: `a` odd, `b` even, `a²+b² = p`, `J ≡ χ(−1) (mod 2)` | sound |
| 2.4 multiple Jacobi, recursions, counts | `𝔽_7` cubic `χ`; `(η,η)`; `r = 0` | `J(χ,χ,χ) = −0.5 + 2.598 i = −χ(−1)J(χ,χ)`, `|J| = √7`; `J(χ,χ,χ⁻¹) = 7`; `J() = 0`, `J₀() = 1`; `J₀(η,η) = −6 = η(−1)·6·J(η)`; `x²+y²=1`: 8; `x²+y²=0`: 1 | sound |
| 2.5 Jacobsthal expansions | `n = 1..4`, `a = 1, 2`, over `𝔽_7`, `𝔽_13` | both expansions agree, 0 mismatches; `𝔽_3`, `n = 0`: `−3` vs `−1` | sound (hypothesis `n ≥ 1` necessary) |
| 2.5 Jacobsthal's theorem | `p = 5, 13, 17, 29, 37, 41` | `φ_2(1) = −2, 6, −2, −10, −2, −10 = −2a`, `a = 1, −3, 1, 5, 1, 5`; `φ_2(r) = −4, −4, 8, −4, 12, −8 = ±2b`; `ψ_2(1) = −1`; `φ_2(4) = 2 = η(2)φ_2(1)` over `𝔽_5`; `φ_2(1) = 0` over `𝔽_7`; counts `4, 8, 20` of `y² = x³ + x` | sound |
| 3.1 `L`-series Checks | `λ = 1`, trivial pair | `(1 − qT)⁻¹`; `(q−1)q^{d−1}`: `1 + 2T + 6T²` over `𝔽_3` | sound |
| 3.2 root-power identity | `1 − T + 3T²` | `−(ω₁² + ω₂²) = 5 = K_9(1,1)` | sound |
| 3.3 Hasse–Davenport lift | `𝔽_7 ⊂ 𝔽_49`, all six `χ`, `ψ_7`; `ψ = 1 ≠ χ` | `−g' = (−g)²` for `m = 0..5` (e.g. `4.9085 − 4.9907 i`); `χ = 1`: both `1`; `ψ = 1`: `0` | sound |
| 3.4 product relation and duplication | `𝔽_13`, all 12 `χ`, every `m ∣ 12`; `𝔽_7` `χ = λ⁻¹` | 0 failures in the contract's form; `m = 4`, `χ = ω`: `−42.69 − 163.52 i` vs inverted `−120.26 + 118.73 i`; `∏_{j<3} g(ω^{1+4j}) = −44.8610 + 13.5828 i`; `χ = ω²`: `46.8722`; `g(ω²) = 3.0991 + 1.8427 i`; `𝔽_7`: both `−7` | sound; R01 on the Checks' wording |
| 3.5 Jacobi lift | `𝔽_3 → 𝔽_9` `(η,η)`; `𝔽_7 → 𝔽_49` `(ω,ω)` | `−1 = −(−1)²`; `|J'| = 7`, `J' = −5.5 + 4.33 i = −(−J)²` | sound |
| 4.2 `stepanov_kummer` | `y² = x + c`; `y⁴ = x²`/`𝔽_5`; `y⁴ = (x²−1)²`/`𝔽_25` | `N = Q`; `9` (excluded `f`); `46` (excluded `f`) | sound |
| 4.3 Artin–Schreier constants | `y^q − y = x²` over `𝔽_{q⁴}`, `q = 3, 5`; Laurent at `q = Q = 3` | `N = 63, 525 = Q − (q−1)√Q`; `0` points, error `2` | sound (q-dependence necessary) |
| 4.5 resultant function | `𝔽_7`, `f = X`, `χ = η` | `λ_X(X−1) = 1`, `λ_X(X²−1) = −1`; `∑_{deg 2} κ`, `∑_{deg 3} κ` of 5.4: `3.5 − 6.06 i = ω(−2)·7`, `0` | sound |
| 4.7–4.8 Weil bounds | `𝔽_13`, `𝔽_7`, `𝔽_101`, `𝔽_11` | `∑η(x³+x) = 6 ≤ 7.211`; `−3`; `−2`; `|∑e(x³/7)| = 4.7409`; `∑_{𝔽_11} e(x³/11) = 0`; `5.6800` | sound |
| 4.9 corollaries | `y² = x⁴+x+1`, `p < 200`; `𝔽_3` `f = X`, `f = 1`; `𝔽_5` `f = X²` | `max |N−p|/(3√p) = 0.5726`; `N = 3, 6, 9` | sound |
| 5.1 identities, ring case | `𝔽_7`; `ZMod 12` | `K(ω;1,2) = 0.6027 − 0.3479 i = K(ω⁵;2,1)`; `K(ω;1,0) = g(ω)`; `K(1;2,3) = K(1;1,6) = 1.1099 ≠ K(1;1,2) = −2.3569`; `K(1;0,0) = 4`, `K(1;1,0) = 0` | sound |
| 5.2 Gauss-sum expansion | all `χ`, all unit `a, b` over `𝔽_7`, `𝔽_9` | 0 failures | sound |
| 5.3 Salié | all unit `a, b` over `𝔽_7`, `𝔽_13`, `𝔽_9`, `𝔽_25` | 0 failures; `K(η;1,2) = 3.2992 i`, `K(η;2,3) = 0`, `K_5(η;1,2) = 0` | sound |
| 5.4 lifting relation | `𝔽_3 → 𝔽_9` (`χ = 1`); `𝔽_7 → 𝔽_49` (`χ = ω`, `a = 1`, `b = 2`) | `K_9 = 5`; `K_49 = 6.7579 − 11.7050 i = −(ω₁² + ω₂²)`, `ω₁ω₂ = 3.5 − 6.06 i = ω(−2)·7`, `|ω_i| = √7` | sound |
| 5.5 bound and angle | `𝔽_5, 𝔽_7, 𝔽_11, 𝔽_13, 𝔽_9, 𝔽_49` | `0.3820, 2.0489, −2.3579, 5.2595`; `K_9(1,b) ∈ {5,2,2,2,−1,−1,−4,−4}`; `θ_7 = 1.9684`, `K_49(1,1) = 9.8019 = −14 cos 2θ`; `2√7 cos θ = −2.0489 = −K`; `∑_c K(1;1,c)² = 19, 155 = p(p−1)−1` | sound; R02 on the endpoints reason |
| 5.6 degenerate parameters | `𝔽_7` | `K(ω;0,2) = −2.1057 + 1.6019 i = ω(2) g(ω⁻¹)`; `q − 1 ≤ 2√q` iff `q ≤ 5` | sound |
| 6.1 Teichmüller character | `q = 7`, `𝔓 = (ζ_3 − 2)` | `N𝔓 = 7`; `teich(2) ≡ 30 (mod 49)`, `30² + 30 + 1 = 19·49` | sound |
| 6.2 Stickelberger congruence | `q = 3, 5, 7`, all `0 < a < q−1` | `v_λ(g_a) = a`; `v_λ(g_a + λ^a/a!) = a + 1` exactly; `v_λ(g_a + π^a/a!) = 7, 14, 9, 16, 11 ≥ a + 6` at `q = 7` | sound |
| 6.3 digit-sum valuation | `q = 7`, `(a,b) = (1,1), (4,4)` | `v_7 J(ω⁻¹,ω⁻¹) = 0`; `v_7 J(ω⁻⁴,ω⁻⁴) = 1` | sound |
| 6.4–6.5 Gross–Koblitz transport | `q = 3, 5, 7`, all `a` | `g_a = −π^a Γ_p(a/(p−1))` to full precision (`p^8, p^7, p^7`); `−π^a Γ_p(1 − a/(p−1))` fails except `a = (p−1)/2`; `v_λ(π − λ) = 2`; `J(ω⁻⁴,ω⁻⁴) ≡ 7Γ_7(2/3)²/Γ_7(1/3) ≡ −1 − 3·teich(2) (mod 7^7)`, not its conjugate; `J(ω⁻¹,ω⁻¹) ≡ −Γ_7(1/6)²/Γ_7(1/3)`, a unit | sound (`q = 9` not computed) |
| 6.5 reflection consistency | `p = 7`; `p = 2` | `Γ_7(1/6)Γ_7(5/6) = 1`, `Γ_7(1/3)Γ_7(2/3) = −1`, `Γ_7(1/2)² = 1`; `Γ_2(x)Γ_2(1−x) = (−1)^{1+x₁}` at `x = 1/3, 2/3, 1/5, 3/5, 2, 3, 5, 6` | sound |
| 7.1 Gauss sums of Dirichlet characters | all `χ` mod 7, 9, 12, 15, 16, 18, 20, 21; pairs `(3,5),(4,5),(3,7),(8,3),(8,5)`; quartic mod 5; mod 4 | imprimitive formula 0 failures, `τ(1_12) = 0`, `τ(1_7) = −1`; CRT formula 0 failures; `τ = −1.1756 + 1.9021 i`, `τ_2 = 1.9021 + 1.1756 i`, `τ(χ)τ(χ⁻¹) = −5`; `τ_2 = 0` modulo 4 | sound |
| 7.2 Jacobi sums modulo `N` | all pairs with `χψ` primitive mod 8, 9, 12, 15, 16, 21 (152 pairs); mod 9 order 6; CRT mod 15 | `J·τ(χψ) = τ(χ)τ(ψ)` 0 failures; `J(χ,χ⁻¹) = 0`, `τχτχ⁻¹ = −9`, `χ(−1) = −1`; multiplicativity 0 failures | sound |
| 7.3 comparison and character page values | `χ_7(3,·)`, `χ_7(2,·)`, quartic mod 5 | `τ_2 = 2.1057 + 1.6019 i`, `K(1,2,χ) = 0.6027 − 0.3479 i`, `J(χ,1) = −1`; `g³ = 7J`; `K(1,2,χ) = 1.1756 − 1.1756 i`; `|S_χ(1,1;15)| = 1.9021`, `S_χ(1,1;5) = 1.1756 i`; `S(m,0;12) = 0,2,0,−2,−4,4` | sound |
| 7.4 twisted multiplicativity | all `χ`, `m, n` mod 15 and mod 21 | 0 failures (with `c̄₂ = 2, c̄₁ = 2` and `c̄₂ = 1, c̄₁ = 5`); `S(1,1;15) = −2.6180 = S(2,2;3)S(2,2;5)`, `S(1,1;3)S(1,1;5) = −0.3820` | sound |
| 7.5 Salié prime-power formula | `p = 3, 5, 7, 11`, `k = 2, 3, 4` with `p^k ≤ 343`, all `m`, `n < 40`, both roots `±ℓ` (3,290 cases) | 0 failures; `S(1,1;25) = 8.7631`, `S(1,2;25) = 0`, `S(1,1;27) = −4.6641`, `S(1,1;49) = 13.5421`, `S(1,3;49) = 0`, `S(2,3;125) = −0.8428`, `S(1,4;125) = −21.9102`, `S(3,5;121) = −19.3770`, `S(1,1;81) = 17.7838`, `S(1,1;125) = 22.2478` | sound |
| 7.5 twisted prime-power claims | all `χ` mod `p^k` for `p^k ∈ {4, 8, 9, 16, 25, 27, 32, 49, 81, 121, 125}`, all `m, n` | `p ∣ m, p ∤ n ⇒ ≤ p^{⌈k/2⌉}`: 0 failures; `j ≤ ⌊k/2⌋ ⇒ ≤ 2p^{k/2}`: 0; `≤ 2p^{j/2}p^{k/2}`: 0; prime-square bound: 0; `|S_χ(1,1;25)| ∈ {0,5}` (four each); `S_1(5,5;25) = 1.9098 = 5S(1,1;5)`; `|S_χ(7,7;125)| ∈ {0, 25}` with `25` attained; `|S_χ(1,15;17³)| = 289` for 16 of the 2,176 characters of order 4624, the maximum over all primitive `χ`, `> 280.37` | sound |
| 7.6 Weil bound, general modulus | all `m, n`, `c ≤ 60`; `c = 2^k`, `k ≤ 8` | 0 failures, max ratio `0.9964`; twisted conductor-weighted bound 0 failures and cube-free bound 0 failures for all `χ`, `c ≤ 40` and `c ∈ {27, 49, 81, 121, 125}` | sound |
| 7.7 character page | `τ_2` modulo 4 and 5 | `0`; `|τ_2| = √5` | sound |

**Convention witnesses recomputed in each layer.** `χ(0) = 0` including `χ = 1` (`g(1) = −1`, `J(1,1) = q − 2`, `K(1;a,0) = −1`, `g_0 = −1`, `g_q(0) = 1` on the supplier's side); the plus sign in `ψ_F`; `−g' = (−g)^n`; `S_n = −∑ω^n`; `K = −2√q cos θ`; `ω^{−a}` in Stickelberger and Gross–Koblitz; `λ = ζ_p − 1` against `π`; `χ(m)^m` in the product relation; `(ℓ/p)^k` and `ε_{p^k}` in Salié's prime-power formula; `c̄₂, c̄₁` in twisted multiplicativity.

**Supplier-order audit.** Every `*Needs:*` line names Mathlib, Tau Ceti, an earlier target or one of the eight suppliers listed in the contracts; every supplier is earlier in the merge order; no notion is cited from `FunctionFieldArithmetic`, `CurvesOverFiniteFields`, `DeligneWeightsAndPurity` or `HypergeometricMotives` beyond deferral prose. No declared gaps (no `design/plan.json`); no gap is needed, since every consumed section exists at its head.

## Not verifiable

- **Ireland–Rosen**, Ch. 8 §§1–3, §7; Ch. 10 §3; Ch. 11 §4 Theorem 1; Ch. 14 §§1–4: the Springer DOI is paywalled (service: uncertified). The Hasse–Davenport proof route and the diagonal-equation counts were checked by computation, not against the text.
- **Lidl–Niederreiter**, Ch. 5 §§5.1–5.5: the Cambridge landing page has no open text. The book's `χ(0) = 1` convention described at README:235 and :1905 was not read.
- **Berndt–Evans–Williams**, Ch. 1–2, 6, 11 §§11.3, 11.5: no legal copy found. Jacobsthal's theorem was verified numerically at `p = 5, 13, 17, 29, 37, 41` instead.
- **Schmidt**, Ch. I–II: Springer, paywalled. The Stepanov bounds were tested for consistency (4.3's `q`-dependence, the Laurent example) but the source's statements and constants were not read.
- **Iwaniec–Kowalski**, §11.7 Theorem 11.11 and Corollary 11.12 (11.58), §12.3 (12.39), Lemma 12.4: the AMS landing page has no open text. The formulas attributed to (12.39) and Lemma 12.4 were verified by exhaustive computation (3,290 prime-power cases; Salié over four fields).
- **Washington** Ch. 6 §6.2 and **Lang** Ch. 1 §§1–2: Springer, paywalled; the Stickelberger congruence was checked `p`-adically at `q = 3, 5, 7`.
- **Weil 1948**: the PNAS endpoint returned HTTP 403.
- **Gross–Koblitz**: read from a university-hosted scan (OCR) under the institutional class; the JSTOR landing page is in no licence class. Theorem 1.7, Lemma 2.3 and the odd-`p` hypothesis were read there.
- **Katz**: cited only as the boundary for equidistribution; nothing consumed, nothing read.
- The `q = 9` Gross–Koblitz Check (README:1491) was not recomputed (it needs the unramified quadratic extension of `ℚ_3`); `q = 3, 5, 7` were.

The unreadable texts are listed in the job's reference-request file; the roadmap's manifest was not edited and the review is complete with these limits.

## Source issues

- none
