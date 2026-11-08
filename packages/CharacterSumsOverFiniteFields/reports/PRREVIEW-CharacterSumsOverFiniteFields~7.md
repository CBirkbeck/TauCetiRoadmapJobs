# Review of CharacterSumsOverFiniteFields (pull request #1712 at 3b6487f)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md` and `Suggested.lean` at `3b6487fd9f9d985bcfc515e7412eaeeaf5e98f7e`. Results of the mechanical checks:

- Gate: run by me with the build; every scanner 0, `OK`.
- Dependency check: `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Build: `lake env lean` on `Suggested.lean` exits 0 with exactly 35 `declaration uses sorry` warnings and nothing else.
- Padding probe: the one-tactic probe on a scratch copy closes none of the 35 admitted theorems (35 errors, 0 `sorry` warnings).
- Signatures: `#check @name` for all 54 declarations elaborated in one scratch file; every elaborated type agrees with its README statement (details under Verified sound).
- `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.

All three findings of the previous review are repaired (table below). One new finding, P3.

## R01 (P3) — 0.7 proposes to prove the conductor product and the primitivity criterion of the Chinese-remainder factors, which the pins already state

**Location:** `README.md:730–731`: "Prove that `χ` is primitive iff both factors are, and `conductor χ = conductor χ₁ · conductor χ₂`." Also the API bullet `README.md:737`: "The conductor is the product of the conductors of the two factors, and primitivity is equivalent to primitivity of both factors."

**Claim:** both facts are targets of 0.7.

**Witness:** Tau Ceti `2fd255d9`, `TauCeti/NumberTheory/DirichletCharacter/Conductor.lean:62`, `DirichletCharacter.conductor_mul_of_coprime`: for `χ ψ : DirichletCharacter R N` with `χ.conductor.Coprime ψ.conductor`, `(χ * ψ).conductor = χ.conductor * ψ.conductor`. Mathlib `1b1ccf4b`, `Mathlib/NumberTheory/DirichletCharacter/Basic.lean:363`, `conductor_changeLevel`: `(changeLevel hm χ).conductor = χ.conductor`. With `χ = changeLevel χ₁ · changeLevel χ₂` at level `c₁ c₂` (0.7's own identity `χ(x) = χ₁(x) χ₂(x)`), the conductors of the two factors divide `c₁` and `c₂` and are coprime, so the product formula is the Tau Ceti declaration read through the Mathlib one, and "primitive iff both factors are" is the case `conductor χ = c₁ c₂`. The README cites neither; `Conductor.lean` is not among the files under *From Tau Ceti*.

**Repair:**
1. In 0.7, replace "Prove that `χ` is primitive iff both factors are, and `conductor χ = conductor χ₁ · conductor χ₂`" by: "Hence, by Tau Ceti's `DirichletCharacter.conductor_mul_of_coprime` applied to `changeLevel χ₁` and `changeLevel χ₂`, whose conductors are those of `χ₁` and `χ₂` (Mathlib's `conductor_changeLevel`) and are coprime, `conductor χ = conductor χ₁ · conductor χ₂`, and `χ` is primitive iff both factors are." Keep `χ(x) = χ₁(x) χ₂(x)` and the additive-character decomposition as the targets of 0.7.
2. Add `conductor_mul_of_coprime` (and `conductor_prod_of_pairwise_coprime`, `Conductor.lean:76`) with its file under *From Tau Ceti*, and `conductor_changeLevel` under *From Mathlib* (Dirichlet characters).
3. Reword the API bullet at `:737` as a consequence, not a target.

**Tested:** for the 100 characters modulo `15, 20, 21, 24, 35, 36, 7, 7, 40` (the nine coprime pairs of the Checks), `conductor χ = conductor χ₁ · conductor χ₂` holds in every case, as the native predicts; the Check "(conductor)" at `:747–749` (conductors `15` and `5`) is unchanged.

## Disposition of the previous review (b408a45)

| Previous finding | Passage at 3b6487f and disposition |
|---|---|
| R01 (P2, the prime-field sign is native) | **Repaired.** `README.md:40–42`: "Gauss's evaluation `∑_{r<N} e(r²/N) = (1 + i)/2 · (1 + (−i)^N) · √N` for every `N` is Tau Ceti's `TauCeti.sum_range_cexp_two_pi_I_sq_div`; 1.4 reads it at an odd prime", and "`AnalyticNumberTheoryPartI` §2.30 … nothing here consumes it." The *From AnalyticNumberTheoryPartI* section and the item under *Consumed, not redefined* are deleted; the declaration is listed with its file at `:373–377`; 1.4 (`:816–828`) derives `g(η_p) = ε_p √p` from CAC 4.19 (iii) and the native at `N = p`, with the two values of `(1 + i)/2 · (1 + (−i)^p)` computed; the *Needs:* lines at `:827–828`, `:862` and the 1.5 Example (`:853–855`, the `N = 4` value `2 + 2i`) follow. `Suggested.lean:40–46` no longer lists 1.4 as not statable; the docstring of `gauss_quadChar_eq` (`:229–231`) names the Tau Ceti declaration. I recomputed: the native gives `i√3, √5, i√7, i√11, √13` at `p = 3, 5, 7, 11, 13`, equal to `g(η_p)` and to `∑_{r<p} e(r²/p)` in all five cases; at `N = 4` it gives `2 + 2i = ∑_{r<4} e(r²/4)`. |
| R02 (P2, two-squares identity absent) | **Repaired, and generalised.** `Suggested.lean:178–184` states `jacobsthalPhi_two_sq_add_sq` over every finite field with `Nat.card F % 4 = 1` and every non-square `r`: `(φ₂(1)/2)² + (φ₂(r)/2)² = q`. `README.md:960–972` states it, gives Jacobsthal's second-moment proof over `F` through Tau Ceti's `sum_quadraticChar_mul_sub`, names it in an API bullet (`:991`) and adds two Checks (`:1004–1011`: `𝔽_9`, `𝔽_25`, and the non-square and `q ≡ 3 (mod 4)` controls). The generalisation is sound: I verified the identity for every non-square `r` over `𝔽_q`, `q = 5, 9, 13, 17, 25, 29, 37, 41, 49, 53, 81` (140 cases, 0 failures), and the second moment `∑_e φ₂(e)² = q(q − 1)(1 + η(−1))` over the same fields (table). |
| R03 (P3, three Dirichlet Gauss-sum natives restated) | **Repaired.** `README.md:379–387` lists `gaussSum_mul_gaussSum_inv_eq_neg_one_mul_card_of_isPrimitive`, `IsPrimitive.norm_gaussSum`, `gaussSum_ne_zero_of_isPrimitive` with their hypotheses and file; 7.1 (`:1924–1930`): "For `χ` primitive the following are in the libraries and are cited, not reproved"; 7.2 (`:1952–1954`) cites `gaussSum_ne_zero_of_isPrimitive` with `(N : ℂ) ≠ 0`; 7.7 (`:2091–2094`) cites `IsPrimitive.norm_gaussSum` at `e = ψ_q.mulShift 2`. I opened the three declarations at `DirichletCharacter/GaussSum.lean:93, 82, 115`; the hypotheses the README states (`[IsDomain R]`, `[NeZero n]`, primitive `χ` and `e`, `(n : R) ≠ 0` for the third, complex values for the norm) are exactly theirs. |

The same commit also repaired 2.3 (`README.md:884–894`): the two-squares shape of the quartic and cubic Jacobi sums is now cited from `TauCeti.norm_jacobiSum_eq_card_of_orderOf_eq_four` (`Four/JacobiSum.lean:84`: `Algebra.norm ℤ (J(χ, χ)) = #F` for `orderOf χ = 4`, values in `𝓞 K`, `K = ℚ(i)`), `TauCeti.isPrimaryGaussian_neg_apply_neg_one_mul_jacobiSum` (`:73`: `IsPrimaryGaussian (−χ(−1) · J(χ, χ))` for `χ^4 = 1` and `4 ∣ #F − 1`; `IsPrimaryGaussian x` is `(1 + i)³ ∣ x − 1`, `Four/Primary.lean:68`) and `TauCeti.isPrimaryEisenstein_jacobiSum` (`Three/JacobiSum.lean:65`: `IsPrimaryEisenstein (J(χ, χ))` for `orderOf χ = 3`, values in a domain; `IsPrimaryEisenstein x` is `3 ∣ x − 2`, `Three/Primary.lean:59`). All three exist at the pin with these hypotheses, and the README's reading of them ("`a` odd, `b` even", "`J ≡ 2 (mod 3)`") is correct: `≡ 1 (mod (1 + i)³)` implies `≡ 1 (mod 2)`. Recomputed: `J(χ, χ) = −1 − 2i, 3 − 2i, 3, −1 + 4i, −5 − 2i` over `𝔽_5, 𝔽_13, 𝔽_9, 𝔽_17, 𝔽_29` (norms `5, 13, 9, 17, 29`, `(−χ(−1)J − 1)/(1 + i)³ = i, −1, 1 + i, −1 + i, 1 + 2i`, all integral); cubic `J = −1 − 3ω, −4 − 3ω, 2, 2 − 3ω, −4` over `𝔽_7, 𝔽_13, 𝔽_4, 𝔽_19, 𝔽_16`, each `≡ 2 (mod 3)` with norm `q`. The `𝔽_5` worked instance at `:890–892` (`(−1 − 2i) − 1 = −2(1 + i)`, quotient `i` by `−2 + 2i`) is right.

## Verified sound

**Coverage.** Read every line of the README (2393 lines: scope, conventions, contracts, all 49 numbered targets and 3.6, every Check, Example, Dependencies line, the worked examples, Provenance, References) and all 547 lines of `Suggested.lean` (35 admitted theorems, 17 definitions and abbreviations, 2 instances). The change set (204 lines since `b408a45`) was read hunk by hunk; the unchanged passages were reviewed too.

**Principles.** No route-specific shortcut (every bound is stated for every finite field and every modulus); nothing re-plans an existing roadmap (the Stickelberger, Gross–Koblitz, hyper-Kloosterman and `S(m, n; c)` objects are consumed by section); no copied passage; no algorithm; no sorry'd data; no `set_option`; no `lemma`; no pull-request number or process word in the folder; a single `import Mathlib` plus one `TauCeti.*` module that exists at the pin.

**Supplier order.** The roadmap is at position 156 of the merge order; its open suppliers are earlier: DirichletPadicLFunctions 93, AutomorphicSpectralTheory 94, EllipticLegendreCharacterInterfaces 99, CongruenceSpectralGap 155; ClassicalArithmeticCompletion is on main. AnalyticNumberTheoryPartI (49) is now named only in Scope as a non-supplier. No declared gaps and no `design/plan.json`; none is needed. The ids this roadmap cites in ClassicalArithmeticCompletion on main (`94294cd`): 4.19 at line 8168 with `quadraticExpSum_one_eq_gaussSum` at 8179 (statement: `S_p(1) = gaussSum χ ZMod.stdAddChar` for `ψ = ZMod.stdAddChar`, `χ = quadraticChar (ZMod p)` cast to `ℂ`), which is exactly what 1.4 consumes.

**Signatures.** All 54 `#check @name` outputs compared with the README; the two "dropped binder" leads of the worker (`crtFactorLeft`, `crtFactorRight`) are false positives, the coprimality hypothesis `h` being an explicit argument of both. Points checked: `jacobsthalPhi_two_sq_add_sq` carries `[DecidableEq F]`, `Nat.card F % 4 = 1`, `¬ IsSquare r` and no `ringChar F ≠ 2` (not needed: `q ≡ 1 (mod 4)` forces odd `p`); the two Jacobi expansions carry `ringChar F ≠ 2`, `0 < n`, `a ≠ 0` (needed: at `p = 2` the `ψ_n` expansion would read `1 − #{x^n = −a}` against `q − #{x^n = −a}`); Layer 6 keeps every instance and hypothesis (`IsCyclotomicExtension {q − 1} ℚ K`, `HasEnoughRootsOfUnity`, `IsCyclotomicExtension {p} K L`, `P.IsMaximal`, `absNorm P = q`, `Q.LiesOver P`, `ψ.IsPrimitive`, the two `τ` hypotheses, `a < q − 1`, and for 6.3 `a, b ≠ 0`, `(a + b) % (q − 1) ≠ 0`); the Stepanov statements fix `C₀, Q₀` before the base field, the polynomial and the extension; `stepanov_kloostermanCurve` counts on `Eˣ × E` against `Q − 1`.

**Library declarations opened at the pins** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`), beyond the previous review's table, which I spot-checked at `DirichletCharacter/GaussSum.lean:43, 82, 93, 115, 135`:

| Declaration | File and line | What it says |
|---|---|---|
| `TauCeti.sum_range_cexp_two_pi_I_sq_div` | `ModularForms/JacobiTheta/GaussSum.lean:227` | `∑_{r ∈ range N} cexp(2πi r²/N) = (1 + I)/2 · (1 + (−I)^N) · √N`, every `N : ℕ` |
| `ZMod.stdAddChar_coe` | Mathlib `Analysis/SpecialFunctions/Complex/CircleAddChar.lean:86` | `stdAddChar (j : ZMod N) = exp(2πi j/N)` for `j : ℤ` |
| `TauCeti.isPrimaryEisenstein_jacobiSum`, `IsPrimaryEisenstein` | `Cyclotomic/Three/JacobiSum.lean:65`, `Three/Primary.lean:59` | as above |
| `TauCeti.isPrimaryGaussian_neg_apply_neg_one_mul_jacobiSum`, `norm_jacobiSum_eq_card_of_orderOf_eq_four`, `IsPrimaryGaussian` | `Cyclotomic/Four/JacobiSum.lean:73, 84`, `Four/Primary.lean:68` | as above |
| `TauCeti.sum_quadraticChar_mul_sub` | `LegendreSymbol/QuadraticChar/Basic.lean:57` | `∑_u η(u (c − u)) = η(−1) · (q − 1 if c = 0 else −1)`, `ringChar F ≠ 2` |
| `DirichletCharacter.conductor_mul_of_coprime`, `conductor_prod_of_pairwise_coprime` | `DirichletCharacter/Conductor.lean:62, 76` | R01 |
| `DirichletCharacter.conductor_changeLevel` | Mathlib `DirichletCharacter/Basic.lean:363` | R01 |

The 2.5 proof sketch uses `sum_quadraticChar_mul_sub` at `c = x² − y²` after `u = e + x²`; the inner sum there is `∑_u η(u (u − c)) = η(−1) ∑_u η(u (c − u))`, which is `q − 1` when `y = ±x` and `−1` otherwise, as the README says (the `η(−1)` factors cancel).

**Sources read at their locators.**

| Source and locator | Text at the locator | Supports |
|---|---|---|
| `jacobsthal1907` line 104–105, p. 240 | `φ(e)` is always even and `φ(0) = 0` | 2.5 (`φ₂(0) = 0`) |
| `jacobsthal1907` line 106–116 | the scaling 2) and "`φ²(e)` depends only on the residue class of `e`", with `r` a residue and `n` a non-residue | 2.5 as written |
| `jacobsthal1907` line 117–123 | `∑_e φ²(e)` computed directly equals `{1 + (−1/p)} p(p − 1)`; for `p = 4n + 1` formula 3) | the second-moment route and the identity, as written; the generalisation to `𝔽_q` is the author's and is checked by computation above |
| `jacobsthal1907` line 127–146, pp. 240–241 | `r = −1`, `a = φ(−1)/2`; `a` odd, `b` even; 5) `a ≡ (p − 3)/2 (mod 8)`; Jacobsthal could not fix the sign of `b` | 2.5's sign paragraph as written |
| `schmidt1973` line 47–53, Satz, p. 347 | absolutely irreducible `f(X, Y)` of degree `m > 0` in `X`, `n > 0` in `Y`; `q > 9(m + 1)²(n + 1)²`; `\|A − q\| < 2 min(m²n, n²m) q^{1/2}` | 4.2, 4.3 as written |
| Knightly–Li (cache `819ebf0b`, arXiv 1202.0189v1) line 6786–6790 | `S_χ(a, b; c) = ∑_{x ∈ (ℤ/c)^×} χ(x) e((ax + b x̄)/c)` | 7.3's definition |
| line 6817–6824, Theorem 9.2 | `\|S_χ(a, b; n; c)\| ≤ τ(n) τ(c) (an, bn, c)^{1/2} c^{1/2} c_χ^{1/2}` for `c ∈ Nℤ`; at `n = 1` the general-modulus twisted bound | 7.6 `norm_kloostermanSum_zmod_le_of_char` |
| line 6840–6848, (9.6), Theorem 9.3 | the untwisted bound `τ(c)(a, b, c)^{1/2} c^{1/2}` quoted from IK Cor. 11.12; `\|S_χ(a, b; p^ℓ)\| ≤ τ(c)(a, b, c)^{1/2} c^{1/2} c_χ^{1/2}` for conductor `p^γ`, `γ ≤ ℓ`, every prime | 7.5's conductor-weighted prime-power bound, 7.6 |
| line 6857–6858, Proposition 9.4 | `\|S_χ(a, b; p)\| ≤ 2 (a, b, p)^{1/2} p^{1/2}` for every prime and every `χ` | 5.5–5.6 at a prime, 7.6 cube-free |
| line 7059–7063, Example 9.9, p. 125 | `S_χ(a, b; p³) = p²` for some units and every primitive `χ` modulo `p³`; exceeds `τ(c)(a, b, c)^{1/2} c^{1/2}` for `p ≥ 17` | 7.5–7.6 |
| ClassicalArithmeticCompletion 4.19 on main, line 8168–8179 | `S_p(a) = ∑_u ψ(a u²)`, (iii) `S_p(1) = gaussSum χ ψ` for `ψ = ZMod.stdAddChar` | 1.4 |
| LMFDB knowl `character.dirichlet.gauss_sum` (fetched) | `τ_a(χ) = ∑_{r ∈ ℤ/qℤ} χ(r) e^{2πi a r/q}` | 7.1 |
| LMFDB knowl `character.dirichlet.kloosterman_sum` (fetched) | `K(a, b, χ) = ∑_{r ∈ (ℤ/q)^×} χ(r) ζ^{ar + b r^{−1}}`, reduces to the Gauss sum at `b = 0` | 7.3 |

Seeded sample: 0.2, 0.5, 1.2, 5.2, 5.6 are derived in place from Mathlib and earlier targets (no external locator claimed; checked by computation below and against the natives named). 1.4: the Tau Ceti declaration and CAC 4.19, verified above. 4.1: Mathlib's `hasseDeriv`, `hasseDeriv_mul`, `rootMultiplicity`. 4.3: Schmidt's Satz, verified. 4.8, 5.3, 5.5: Weil 1948, Lidl–Niederreiter, Iwaniec–Kowalski, not verifiable; checked by computation. 6.5: through DirichletPadicLFunctions §4.5 (previous review resolved the head); Gross–Koblitz not verifiable; checked at `q = 7` by the previous review and consistent with my `q = 5` valuations. 7.1: Mathlib, Tau Ceti and the knowl, verified. 7.5, 7.6: Knightly–Li verified as above; Iwaniec–Kowalski (12.39) and Cor. 11.12 not verifiable; checked exhaustively below. The README flags no locator as unverified.

**Ownership and overlap.** `scratch/overlaps.md` lists no pull request changing this roadmap and no dropped id. Closest roadmaps: #1904 QuadraticCharactersAndReduction (scope lines 6–18 at its head: quadratic characters, local conductors, primitive discriminants, integral quadratic presentations; it states no Gauss, Jacobi or Kloosterman sum); #1716 HypergeometricMotives (`README.md:113–118` at its head: borders, consumes nothing); #1717 MaassForms (`:182`, defers Kloosterman, Gauss and Jacobi sums here); #1948 ExplicitCharacterSumsAndSieves (position 268, consumes §4.7 downward: `:287`, `:995`, `:1022`, `:1061`); #1431 GrothendieckNotesLemmas (`:42`) and #1905 ArithmeticInterpolationDeterminants (`:67, :474, :570`) cite §4.1, which exists; #1039 DirichletPadicLFunctions (`:7`) names this roadmap as the consumer of its Gamma function. No object has two owners; the one duplication found is R01.

**Headline theorems** (from *Owned here*) and where each is stated:

| Headline | `Suggested.lean` |
|---|---|
| 1.3 field of definition | `gauss_pow_orderOf_mem` |
| 1.4 | consumed (Tau Ceti), its case `f = 1` of `gauss_quadChar_eq` |
| 2.4 | `multiJacobiSum_eq_prod_gauss_div`, `card_diagonal_sub_le` |
| 2.5 | the two expansions, `jacobsthalPhi_two_one`, `jacobsthalPhi_two_sq_add_sq` |
| 3.2, 3.3, 3.5 | `extensionSum_eq_neg_sum_pow`, `hasseDavenport_lift`, `gauss_quadChar_eq`, `jacobiSum_lift` |
| 4.2, 4.3 | the three Stepanov bounds |
| 4.5–4.9 | the two `L`-polynomials, `weil_mulChar_sum_bound`, `weil_addChar_sum_bound`, `card_hyperelliptic_sub_le` |
| 5.2–5.5 | `kloostermanSum_eq_sum_gauss`, `kloostermanSum_quadChar_eq`, `kloostermanSum_lift`, `norm_kloostermanSum_le` |
| 6.2, 6.3 | `multiplicity_map_gaussSum_powerResidueSymbol_inv_pow`, `jacobiSum_powerResidueSymbol_multiplicity` |
| 7.1–7.6 | the nine integer-modulus statements |

Not statable at the pins and named in the module docstring: 6.4–6.5 (no `Γ_p`), 7.3's two identifications (no hyper-Kloosterman or `S(m, n; c)` carrier), 7.7 (names only). Confirmed by grep for `moritaGamma`, `hyperKloosterman`, `kloosterman` in both pins (none).

**The adversarial table.** Every value was recomputed in this review (scripts `a.py`, `b.py`, `c.py` in the job's scratch directory); complex sums to `10⁻⁷`, valuations exact.

| Statement | Instances tried | Values computed (left = right unless stated) | Result |
|---|---|---|---|
| 0.1 `ψ_F`, sign, primitivity | `𝔽_7`, `𝔽_9`, `𝔽_4`, `𝔽_5` | `ψ_7(1) = 0.6235 + 0.7818i = e(1/7)`; `g(ω, ψ) = −2.4401 + 1.0226i`, `g(ω, ψ⁻¹) = 2.4401 − 1.0226i = ω(−1) g`, `conj g = −2.4401 − 1.0226i`; `𝔽_9`: `Tr(1) = 2`, `Tr(i) = 0`, kernel size 3; `𝔽_4` values `1, 1, −1, −1`, sum 0; `𝔽_5`: `∑ψ(2x) = 0`, `∑ψ(0·x) = 5` | sound |
| 0.2 shift bijection | `𝔽_9` | 9 distinct shifted characters for 9 parameters | sound |
| 0.3 power count, orthogonality | `𝔽_7`, `c = 2, 3, 0` | counts `2, 0, 1 = 1 + η(c)`; `∑_χ χ(2) = 0`, `∑_χ χ(1) = 6`, `∑_χ χ(0) = 0` | sound |
| 0.4 | `𝔽_7`, `𝔽_3` | `η(−1) = −1 = (−1)³`; `η_3(2) = −1` | sound |
| 0.6 lifts | `𝔽_3 ⊂ 𝔽_9` | `N(g) = 2`, `N(i) = 1`; `ψ_3 ∘ Tr = ψ_9` at all 9 points, `ψ_9(1) = e(2/3)`; `η_3 ∘ N = η_9`, `η_9(i) = 1`, `η_9(1 + i) = −1` | sound |
| 0.7 / 7.1 CRT | 100 characters over 9 coprime pairs | `χ = χ₁χ₂` pointwise, `τ(χ) = χ₁(c₂)χ₂(c₁)τ(χ₁)τ(χ₂)`, conductor product: 0 failures; `ψ_15(1) = e(2/3)e(2/5) = e(1/15)`, against `e(8/15)` without inverses; quartic mod 5 read mod 15: left factor `1₃`, right factor `(2) = i`, `χ(7) = i` | sound (R01 for the citation) |
| 1.1 | `𝔽_3`, `𝔽_7` | `g(1) = −1`; `gaussSum η 1 = 0`; `gaussSum 1 1 = 2`; `g(η_3) = 1.7321i`, shift 2 `−1.7321i`, shift 0 `0`; `g_2(ω) = 2.1057 + 1.6019i = ω(2)⁻¹ g(ω)` | sound |
| 1.2 | all `χ ≠ 1` over `𝔽_7, 𝔽_9, 𝔽_13` | `g(χ)g(χ⁻¹) = χ(−1)q`, `\|g\| = √q`, `conj g = χ(−1)g(χ⁻¹)`: 0 failures in 24 characters | sound |
| 1.3 Galois action | `𝔽_7`, `c = 1..6` | `∑χ(x)ψ(x)^c = g_c(χ) = χ(c)⁻¹g(χ)`; `g(χ₃)³ = 3.5 − 18.1865i = 7 J(χ₃, χ₃)`, `J = −1 − 3ζ_3` | sound |
| 1.4 | `p = 3, 5, 7, 11, 13`; `N = 4` | as in the disposition table | sound |
| 1.5 | `𝔽_7` | `g(ω)⁶ = −248.5 − 236.4249i = −7 ∏ J(ω, ω^i)` | sound |
| 2.3 | quartic over 5 fields, cubic over 5 fields | as in the disposition paragraph | sound |
| 2.4 | `𝔽_7`; 360 random diagonal equations over `𝔽_5, 𝔽_7, 𝔽_9` (`r ≤ 3`) | `J(χ, χ, χ) = −0.5 + 2.5981i = −χ(−1)J(χ, χ)`; `J(χ, χ, χ⁻¹) = 7`; `J() = 0`, `J₀() = 1`; `J(η, η) = 1`, `J₀(η, η) = −6`; counts `8, 1, 42`; bound violations 0 | sound |
| 2.5 expansions, closed forms | `n ≤ 6`, all `a ≠ 0`, over `𝔽_5, 𝔽_7, 𝔽_9, 𝔽_11, 𝔽_13, 𝔽_25` | 768 cases, 0 failures; `ψ_0(1) = −3` over `𝔽_3`; `ψ_2 = φ_1 = −1` over `𝔽_13`; `φ_2(4) = 2 = η(2)φ_2(1)` over `𝔽_5` | sound |
| 2.5 two-squares identity (headline) | `q = 5, 9, 13, 17, 25, 29, 37, 41, 49, 53, 81`, all non-squares | `φ_2(1) = −2, 6, 6, −2, 6, −10, −2, −10, 14, 14, −18`; `φ_2(r) ∈ {±4}, {0}, {±4}, {±8}, {±8}, {±4}, {±12}, {±8}, {0}, {±4}, {0}`; identity holds for all 140 non-squares; `∑_e φ_2(e)² = 40, 144, 312, 544, 1200, 1624, 2664, 3280, 4704, 5512, 12960 = q(q − 1)(1 + η(−1))`; `φ_2(0) = 0`. Controls: `𝔽_13`, square `r = 3`: `9 + 9 = 18 ≠ 13`; `q = 7, 11, 27`: both values `0` | sound |
| 2.5 sign of `a` | `p = 5, 13, 17, 29, 37, 41, 53` | `φ_2(1) = −2, 6, −2, −10, −2, −10, 14`; the unique `a ≡ 1 (mod 4)` is `1, −3, 1, 5, 1, 5, −7`; `−2a` agrees in every case | sound |
| 3.1 coefficient sums | `𝔽_3`, `d = 0..4` | `(η, ψ)`: `1, 1.7321i, 0, 0, 0`; `(1, ψ)`: `1, −1, 0, 0, 0`; `(η, 1)`: `1, 0, 0, 0, 0`; `(1, 1)`: `1, 2, 6, 18, 54` | sound |
| 3.3 / 3.5 lifts (headline) | `𝔽_3→𝔽_9`, `𝔽_5→𝔽_25`, `𝔽_2→𝔽_4`, `𝔽_2→𝔽_8`, `𝔽_7→𝔽_49`, `𝔽_4→𝔽_16`, `𝔽_9→𝔽_81`; all `(χ, ψ) ≠ (1, 1)`, all `χ, ψ ≠ 1` | `−g' = (−g)^n` and `−J' = (−J)^n`: 237 cases, 0 failures | sound |
| 3.3 `gauss_quadChar_eq` (headline) | `q = 9, 25, 27, 49, 81, 121` | `3, −5, −5.1962i, 7, −9, 11 = (−1)^{f−1}(ε_p√p)^f` | sound |
| 3.4 | `𝔽_13`, all 72 `(χ, m ∣ 12)` | 72 hold, 16 fail with the inverted exponent; `m = 3`: `−44.8610 + 13.5828i`, `46.8722`; `m = 4`: `−42.6928 − 163.5186i` against `−120.2648 + 118.7324i`; duplication `3.0991 + 1.8427i = g(ω²)`, `g(η_13) = 3.6056` | sound |
| 4.2 Schmidt instance | `y² = x³ + x + 1` over `𝔽_1297` | `A = 1269`, `\|A − q\| = 28 < 864.33`; `q > 1296` | sound |
| 4.3 Checks | `(q, Q) = (3, 81)`; Laurent at `q = Q = 3` | `N = 63 = Q − (q − 1)√Q`; 0 points | sound |
| 4.7 / 4.8 (headlines) | 524 random squarefree `f` of degree ≤ 5 over `𝔽_5..𝔽_17` with random `χ ≠ 1` and `ψ` | 0 violations; Examples `6, −3, −2`; `4.7409, 0, 5.6800`; off-hypothesis `∑η(x²) = 12` over `𝔽_13`, `∑e((x⁷ − x)/7) = 7` | sound |
| 4.9 | `y² = x⁴ + x + 1`, `p < 200`; `𝔽_5`, `𝔽_25`, `𝔽_9` | `max \|N − p\|/(3√p) = 0.5726`; `9, 46, 15`; `y⁹ − y = x²` over `𝔽_9`: 9 | sound |
| 5.1 | `𝔽_7` | `K(1; 1, 1) = 2.0489`, `K(1; 1, 2) = −2.3569`, `K(ω; 1, 2) = 0.6027 − 0.3479i = K(ω⁵; 2, 1)`, `K(ω; 1, 0) = g(ω)`, `K(1; 3, 0) = −1`, `K(1; 2, 3) = K(1; 1, 6) = 1.1099 ≠ K(1; 1, 2)` | sound |
| 5.2 (headline) | all `χ, a, b` over `𝔽_5, 𝔽_7, 𝔽_9, 𝔽_8, 𝔽_13` | 2863 cases, 0 failures | sound |
| 5.3 (headline) | all `a, b` over `𝔽_5, 𝔽_7, 𝔽_9, 𝔽_11, 𝔽_13, 𝔽_25` | 936 cases, 0 failures; `K(η; 1, 2) = 3.2992i = i√7 · 2cos(2π/7)` over `𝔽_7`; `K(η; 2, 3) = 0`; `K(η; 1, 2) = 0` over `𝔽_5` | sound |
| 5.4 / 5.5 (headlines) | lifts `𝔽_3→𝔽_9`, `𝔽_5→𝔽_25`, `𝔽_2→𝔽_4`, `𝔽_7→𝔽_49`, all `χ` | 109 cases with `K_E = −(ω₁^n + ω₂^n)` and `\|ω_i\| = √q`, 0 failures; `K_3(1, 1) = −1`, `K_9(1, 1) = 5`, `K_9(1, b) ∈ {5, 2, 2, 2, −1, −1, −4, −4}`; `K_49(ω ∘ N; 1, 2) = 6.7579 − 11.7050i`; `\|K\| ≤ 2√q` in 17687 cases, 0 violations | sound |
| 5.5 angle, second moment | `𝔽_7`, `𝔽_49`; `p = 5, 13` | `θ_7(1, 1) = 1.9684`; `K_49(1, 1) = 9.8019 = −14cos 2θ = −(K_7² − 14)`; `∑_c K(1; 1, c)² = 19, 155 = p(p − 1) − 1`; `p = 5` values `0.3820, −3.2361, 1.2361, 2.6180` | sound |
| 5.6 | `𝔽_7` | `K(ω; 0, 2) = −2.1057 + 1.6019i = ω(2)g(ω⁻¹)`; `K(1; 0, 1) = −1`; `K(1; 0, 0) = 6` | sound |
| 6.1 | `q = 5`, `𝔓 = (2 − i)`; `q = 7` | `(i − 2)/(2 − i) = −1`, so `i ≡ 2 (mod 𝔓)` and `ω_𝔓(2) = i`; `30² + 30 + 1 = 19 · 49` | sound |
| 6.2 (headline) | `q = 5`, `L = ℚ(ζ_20)`, through `N_{L/K}(g_a) = (−1)^a g_a⁴ ∈ ℤ[i]` (`f(𝔓̃ ∣ 𝔓) = 1`) | `g_a⁴ = −15 − 20i, 25, −15 + 20i` for `a = 1, 2, 3`; `v_{(2−i)} = 1, 2, 3 = s(a)`; `v_{(2+i)} = 3, 2, 1 = s(3a mod 4)`; numerically `g_1⁴ = −15 − 20i = 5J²`, `\|g_1\|² = 5` | sound |
| 6.3 (headline) | `q = 5`, `(a, b) = (1,1), (1,2), (2,1), (2,3), (3,3)` and the excluded `(2,2), (1,3), (3,1)`; `q = 7` | `J = −1 + 2i, 1 − 2i, 1 − 2i, 1 + 2i, −1 − 2i`, `v_𝔓 = 0, 0, 0, 1, 1`, `4v + s(a + b mod 4) = 2, 3, 3, 5, 6 = s(a) + s(b)`; excluded pairs `J = −1, 1, 1`, `v = 0`, right side `4`; `q = 7`: `J(ω⁻⁴, ω⁻⁴) = 0.5 − 2.5981i = −1 − 3ζ_3`, `J/(ζ_3 − 2) = ζ_3²` (a unit, so `v_𝔓 = 1`); `J(ω⁻¹, ω⁻¹) = 2.5 + 0.8660i`, `J/(ζ_3 − 2) = −0.7857 − 0.6186i` (not integral, `v_𝔓 = 0`) | sound |
| 7.1 (headline) | all 490 characters modulo `N ≤ 40`; 9 coprime pairs | imprimitive formula 0 failures; `τ(1_12) = 0 = μ(12)`, `τ(1_7) = −1`; quartic mod 5: `ττ⁻¹ = −5 = χ(−1) · 5`, `\|τ\|² = 5` | sound |
| 7.2 (headline) | all pairs modulo `N ≤ 30` with `χψ` primitive | 2821 pairs, 0 failures; `N = 9` order 6: `J(χ, χ⁻¹) = 0`, `ττ⁻¹ = −9`, `τ(1_9) = 0`; `J(χ, 1_7) = −1` | sound |
| 7.3 | moduli 7, 12, 15, 5 | `S(1, 1; 7) = 2.0489`, `S(1, 2; 7) = −2.3569`, `S(7, 1; 7) = −1`; `S(m, 0; 12) = 0, 2, 0, −2, −4, 4` = Ramanujan sums; `\|S_χ(1, 1; 15)\| = 1.9021`, `S_χ(1, 1; 5) = 1.1756i` | sound |
| 7.4 (headline) | all `χ, m, n` for `(3,5), (4,5), (3,4), (5,7), (8,3), (9,2), (1,5)` | 41628 cases, 0 failures; `S(1, 1; 15) = −2.6180 = S(2, 2; 3)S(2, 2; 5)`, `−0.3820` without inverses; `S(1, 1; 1) = 1` | sound |
| 7.5 Salié (headlines) | `p^k = 9, 25, 27, 49, 81, 121, 125, 169, 243`, all units `m, n` | square branch 39060 cases, non-square branch 39060 cases, 0 failures; `S(1, 1; 25) = 8.7631 = 10cos(4π/25)`, `S(1, 2; 25) = 0`, `S(1, 1; 27) = −4.6641`, `S(1, 1; 49) = 13.5421`, `S(2, 3; 125) = −0.8428`, `S(1, 4; 125) = −21.9102`, `S(3, 5; 121) = −19.3770`, `S(1, 1; 81) = 17.7838`, `S(1, 1; 125) = 22.2478`, `S(1, 3; 49) = 0`; principal mod 25: `S_χ(5, 5; 25) = 1.9098 = 5S(1, 1; 5)` | sound |
| 7.5 `p²` bound (headline) | every `χ, m, n` modulo `4, 9, 25, 49, 121` | 1724370 cases, 0 violations | sound |
| 7.5 prime-power twisted bounds (README) | every `χ` modulo `2^3..2^6, 9, 27, 81, 25, 125, 49, 343, 121, 169` | conductor-weighted bound: 3838664 cases, 0 violations, max ratio 0.6664; `p^{⌈k/2⌉}` for `p ∣ m`, `p ∤ n`: 490004 cases, 0; `2p^{k/2}` for `j ≤ ⌊k/2⌋`: 191724, 0; `2p^{j/2}p^{k/2}`: 2584700, 0; `p ∣ (m, n)`: `0` at `j = k`, `p·S_χ(m/p, n/p; p^{k−1})` at `j < k`: 128246, 0; `max_χ \|S_χ(7, 7; 125)\| = 25 > 22.36` | sound |
| 7.6 (headlines) | untwisted: all `m, n` for `c ≤ 60` and `c = 125, 128, 243, 343` (sampled `m`); twisted: all `χ, m, n` for `c ≤ 40` | untwisted 78844 sums, 0 violations, max ratio 1.0; twisted 394857 sums, conductor-weighted 0, cube-free 0; `max \|S_χ(1, 15; 17³)\| = 289 > 280.37` attained at order 4624 | sound |
| 7.7 | LMFDB `7.3`, `5.2`, mod 4 | `τ_2 = 2.1057 + 1.6019i`, `K(1, 2, χ) = 0.6027 − 0.3479i`, `J(χ, 1) = −1`; quartic: `τ_2 = 1.9021 + 1.1756i`, `K(1, 2, χ) = 1.1756 − 1.1756i`, `\|τ_2\| = 2.2361`; primitive mod 4: `τ_2 = 0` | sound |

**Convention witnesses recomputed.** `χ(0) = 0` for `χ = 1` (`g(1) = −1`, `K(1; a, 0) = −1`, `J₀() = 1`); the plus sign in `ψ_F`; the minus signs in `−g' = (−g)^n` and `S_n = −∑ω^n`; `K = −2√q cos θ`; `χ(m)^m` in the product relation; `(ℓ/p)^k` and `ε_{p^k}` in Salié's formula; `ω^{−a}` in 6.2–6.3 (`v(g_1⁴) = 1` at `(2 − i)` and `3` at `(2 + i)`); Jacobsthal's `a = φ(−1)/2` against `a = −φ_2(1)/2`; the identification `ω_𝔓(2) = i` for `𝔓 = (2 − i)`.

**Lean statement checks by reading.** `hasseDavenport_lift` at `χ = 1, ψ ≠ 1`: both sides `1`; at `ψ = 1 ≠ χ`: both `0` (`n ≥ 1`); at `χ = 1 = ψ` excluded by `h`. `jacobiSum_lift` at `χψ = 1`: `−J' = χ(−1)^n = (−J)^n`. `multiJacobiSum_eq_prod_gauss_div` at `r = 0` vacuous (`∏ = 1`), at `r = 1` reads `1 = g/g`. `card_diagonal_sub_le`: `d_i ∣ q − 1` forces `d_i ≥ 1`; `d_i = 1` gives the exact count `q^{r−1}` and bound `0`. `lSeries_mulCharResultant`'s hypothesis `¬∃ c h, f = C c · h^{orderOf χ}` over `F` is equivalent to the `F̄` form (a monic `e`-th root is Galois-invariant), and it is exactly nontriviality of the quotient character on `(F[X]/rad f)^×`; a nonzero constant `f` is excluded by it. `stepanov_kummer`'s hypothesis is Capelli's criterion over `F̄(X)` with `−4K⁴ ⊆ K²`; `stepanov_artinSchreier`, `stepanov_kloostermanCurve`: irreducibility from `q ∣ e` at the pole of order prime to `p`; the `+ 1` for `Q − 1`. `kloostermanSum_lift`: `∑_{deg 2} κ = q χ(−b/a)` and vanishing for `d ≥ 3` through the free coefficient `c_{d−1}` with `a ≠ 0`. `norm_kloostermanSum_zmod_primeSq_le` at `p = 2`: two terms, bound `4`. 6.2 at `q = 2`: `a = 0`, `g_0 = −1`, both sides `0`.

## Not verifiable

- **Ireland–Rosen** Ch. 8, 10, 11 §4, 14 §§3–4 (2.4, 3.1–3.3, 6.2–6.3): Springer, paywalled; checked by computation.
- **Lidl–Niederreiter** Ch. 5 §§5.1–5.5 (4.7–4.8, 5.1–5.5): no open text; checked by computation.
- **Iwaniec–Kowalski** §11.7, Theorem 11.11, Corollary 11.12, (11.58), §12.3 (12.39), Lemma 12.4 (4.3 (ii), 5.3, 5.5, 7.4–7.6): no open text; Knightly–Li quote Corollary 11.12 as (9.6); the formulas were checked exhaustively as tabulated.
- **Gross–Koblitz 1979**, Theorem 1.7 and Lemma 2.3: Annals, behind JSTOR; consumed through DirichletPadicLFunctions §4.5.
- **Weil 1948**, **Washington**, **Lang**, **Bombieri**, **Katz**, **SGA 4½**: background or paywalled; nothing is consumed beyond what the computations cover.
- **Schmidt 1976** (`schmidt1976`): settled as uncertified; cited as background only.
- **Beukers–Cohen–Mellit** Theorem 1.3 and **Conrad** (A.6): legally readable but not re-read in this review; the product relation they are cited for in 3.4 was checked on all 72 pairs over `𝔽_13`.
- The LMFDB character page `7.3` itself was not re-fetched; the two knowls defining the displayed sums were, and the displayed values were recomputed.

## Source issues

- none
