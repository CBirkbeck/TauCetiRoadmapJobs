# Review of CharacterSumsOverFiniteFields (pull request #1712 at b408a45)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md` and `Suggested.lean` at `b408a454380b1b022b3948fd240907687a56cf49`. Results of the checks:

- Gate: passes (every scanner 0).
- Dependency check: no UPWARD or CYCLE line.
- Build: `Suggested.lean` elaborates with exactly 34 `sorry` warnings and nothing else.
- Padding probe: the one-tactic probe closes none of the 34 theorems.
- Adversarial table: every value below was recomputed in this review.

Both findings of the previous review are repaired. Three findings remain:

- R01 (P2): the prime-field sign of 1.4 is native at the pinned Tau Ceti. The README says the opposite, and `Suggested.lean` calls the result not statable.
- R02 (P2): Jacobsthal's two-squares identity is statable but absent. This is the formula 3) that 2.5 cites as its source.
- R03 (P3): three Tau Ceti natives on primitive Dirichlet Gauss sums are restated as targets in 7.1, 7.2 and 7.7.

## R01 (P2) — The sign `g(η_p) = ε_p √p` is native at the pinned Tau Ceti; the README's absence claim and the "not statable" entry are false

**Location:**
- `README.md:454–455`: "Tau Ceti has no evaluation of Gauss's quadratic exponential sum at the pin: 1.4 consumes `AnalyticNumberTheoryPartI`."
- `Suggested.lean:40–45` lists "the sign of the quadratic Gauss sum over the prime field (1.4)" under "Not statable at the pins".
- The same supplier appears at `README.md:40–42`, `:164–167`, `:210`, `:474–479`, `:804–811`, `:844` and in `Suggested.lean:222–224`.

**Claim:** the pins carry no sign for the quadratic Gauss sum, so 1.4 must consume `AnalyticNumberTheoryPartI` §2.30 (ii), which is still an open roadmap.

**Witness:** Tau Ceti `2fd255d9`, `TauCeti/NumberTheory/ModularForms/JacobiTheta/GaussSum.lean:227`, `TauCeti.sum_range_cexp_two_pi_I_sq_div (N : ℕ)`. It states `∑_{r < N} cexp(2πi r²/N) = (1 + I)/2 · (1 + (−I)^N) · √N`; I checked it with `#check` after building the module. At an odd prime `N = p` the right side is `√p` for `p ≡ 1` and `i√p` for `p ≡ 3 (mod 4)`, which is exactly `ε_p √p`.

**Repair:**
1. In 1.4 (`README.md:804–811`), obtain the sign as `g(η_p) = ∑_{r mod p} e(r²/p)` from `quadraticExpSum_one_eq_gaussSum` (ClassicalArithmeticCompletion 4.19, already cited), followed by `TauCeti.sum_range_cexp_two_pi_I_sq_div` at `N = p`. The identification of `ε_D` with `η_p` is then no longer needed.
2. Delete `README.md:454–455`, and list the declaration with its file under *From Tau Ceti*.
3. Remove `AnalyticNumberTheoryPartI` from the supplier contracts and the *Needs:* lines (`:164–167`, `:474–479`, `:811`, `:844`), and repoint `:40–42` and `:210` to the Tau Ceti name. §2.30 may stay as a remark outside the contracts.
4. In `Suggested.lean`, delete 1.4 from the "Not statable" paragraph: 1.4 is consumed, not a headline. In the docstring of `gauss_quadChar_eq` (`:222–224`), replace "`AnalyticNumberTheoryPartI` §2.30, consumed in 1.4" with the Tau Ceti name.

**Tested:**
- At `p = 3, 5, 7, 11, 13` the native formula gives `i√3, √5, i√7, i√11, √13`. These equal the Gauss sums computed directly against `ψ_p` (table row 1.4).
- The 3.3 values derived from 1.4 (`g(η_9) = 3`, `g(η_25) = −5`, `g(η_27) = −3√3 i`, `g(η_49) = 7`, `g(η_81) = −9`, `g(η_121) = 11`) were recomputed directly and are unchanged.

## R02 (P2) — Jacobsthal's two-squares identity is statable but absent from `Suggested.lean`; only the sign of `a` is stated

**Location:**
- `Suggested.lean:173–177`, `jacobsthalPhi_two_one`: "Jacobsthal's theorem: for `p ≡ 1 (mod 4)` and `p = a² + b²` with `a ≡ 1 (mod 4)`, `φ_2(1) = −2a`."
- `README.md:936–943`: "and `φ_2(r) = ±2b` for every non-square `r` (Jacobsthal 1907, §2, formula 3), p. 240".
- `README.md:107` calls this "Jacobsthal's theorem on `p = a² + b²`".

**Claim:** `jacobsthalPhi_two_one` is the roadmap's Jacobsthal theorem.

**Witness:** the statement assumes a representation `a² + b² = p` and fixes only the sign of `a`, which is Jacobsthal's 5) combined with 2). The representation itself is formula 3) at `jacobsthal1907` line 117–123, p. 240: `p = (φ(r)/2)² + (φ(n)/2)²`, which 2.5 cites as its locator. That formula is stated nowhere in the file, and no declaration constrains `φ_2` at a non-square.

**Repair:** add the following inside Layer 2, after `jacobsthalPhi_two_one`, and name it in 2.5's API bullet:

```lean
/-- **2.5.** Jacobsthal's two-squares identity: `p = (φ₂(1)/2)² + (φ₂(r)/2)²` for a non-square
`r` (Jacobsthal 1907, §2, formula 3), p. 240). -/
theorem jacobsthalPhi_two_sq_add_sq (p : ℕ) [Fact p.Prime] (hp : p % 4 = 1) {r : ZMod p}
    (hr : ¬ IsSquare r) :
    (jacobsthalPhi (F := ZMod p) 2 1 / 2) ^ 2 + (jacobsthalPhi (F := ZMod p) 2 r / 2) ^ 2 = p :=
  sorry
```

**Tested:**
- Inserted into a scratch copy of `Suggested.lean`, the theorem elaborates with the `sorry` warning only.
- Over all non-squares `r` for the 14 primes `p ≡ 1 (mod 4)` up to 113: 412 cases, 0 failures. For example, at `p = 13`: `φ_2(1) = 6`, `φ_2(2) = −4`, and `9 + 4 = 13`.

## R03 (P3) — 7.1, 7.2 and 7.7 restate three Tau Ceti natives on primitive Dirichlet Gauss sums

**Location:**
- `README.md:1880–1883`: "`τ(χ) τ(χ⁻¹) = χ(−1) N` and `|τ(χ)| = √N`, as a one-line corollary of Tau Ceti's `gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive`".
- `README.md:1906`: "then `τ(χψ) ≠ 0`".
- `README.md:2044`: "`|τ_2(χ)| = √q` for `χ` primitive and `q` odd".

**Claim:** these facts are to be proved here.

**Witness:** all three are in `TauCeti/NumberTheory/DirichletCharacter/GaussSum.lean`, the file the README already cites. Each was checked with `#check`:
- `:82` `DirichletCharacter.IsPrimitive.norm_gaussSum`: `‖gaussSum χ e‖ = √n` for primitive `χ` and every primitive `e`.
- `:93` `gaussSum_mul_gaussSum_inv_eq_neg_one_mul_card_of_isPrimitive`: `gaussSum χ e · gaussSum χ⁻¹ e = χ(−1) · #ZMod n`.
- `:115` `gaussSum_ne_zero_of_isPrimitive`.

**Repair:**
1. List the three declarations under *From Tau Ceti*.
2. In 7.1, cite the first two in place of "Record and prove … one-line corollary".
3. In 7.2, cite the third for `τ(χψ) ≠ 0`, with `(N : ℂ) ≠ 0`.
4. In 7.7, cite `IsPrimitive.norm_gaussSum` with `e = ψ_q.mulShift 2`, which is primitive for odd `q`.

**Tested:**
- For the quartic character modulo 5: `τ(χ)τ(χ⁻¹) = −5` and `|τ(χ)|² = 5`.
- 7.2's quotient formula holds in 2820 pairs with `χψ` primitive modulo `N ≤ 30` (table).

## Disposition of the previous review (1233043)

| Previous finding | Passage at b408a45 and disposition |
|---|---|
| R01 (6.2–6.3 statable at the pin) | **Repaired.** `Suggested.lean:402–431` states `multiplicity_map_gaussSum_powerResidueSymbol_inv_pow` and `jacobiSum_powerResidueSymbol_multiplicity` on `Ideal.powerResidueSymbol P (q − 1)`, with the single extra import `TauCeti.NumberTheory.NumberField.PowerResidueSymbol.Basic`. 6.3 now also carries `[IsCyclotomicExtension {q − 1} ℚ K]`. This matters: the signature the previous review proposed omitted it, and it would be false over `K = ℚ(ζ_3, √7)`, where `v_𝔓(J(ω^{−4}, ω^{−4})) = 2` (README 6.3's own negative Check, recomputed: `6 · 2 = (4 + 4 − 2) · 2`). The deleted sentence is gone. *From Tau Ceti* (`README.md:407–441`) lists `powerResidueSymbol`, `mk_powerResidueSymbol`, `powerResidueSymbol_eq_iff`, `powerResidueSymbol_pow_div`, `orderOf_powerResidueSymbol` and `map_powerResidueSymbol`. 6.1 (`:1626–1652`) cites them. The docstring keeps only 6.4–6.5 as not statable for lack of `Γ_p`. |
| R02 (natives consumed by roadmap number) | **Repaired.** `README.md:419–441` lists `stickelbergerPhi`/`stickelbergerPhi_prime`, the cubic and quartic Gauss- and Jacobi-sum identities, and `inertiaDeg_eq_orderOf_of_val_eq_absNorm`, each with its file. 1.3, 1.5, 2.3, 6.1 and the worked examples cite them by name. 6.1 cites the splitting law instead of proving the residue degree. 1.55 remains a ClassicalArithmeticCompletion citation; no relation `P^γ` exists at the pin. |

## Verified sound

**Coverage and mechanical evidence.**
- Read all 49 numbered targets, 3.6, the Provenance section, every Check, worked example, reference and dependency line, and all 53 declarations of `Suggested.lean`: 34 admitted theorems, 17 definitions and abbreviations, 2 instances.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml` (`math.NT`).
- I ran the gate myself: every scanner is 0, `OK`.
- I ran `lake env lean` on `Suggested.lean` myself: exit 0, 34 `declaration uses sorry` warnings, nothing else.
- The dependency command printed:

```text
depcheck: 243 roadmaps, 2457 edges, 0 problem(s)
```

- The roadmap is at position 154 of the merge order, after every supplier it names: ClassicalArithmeticCompletion on main; EllipticLegendreCharacterInterfaces 96; DirichletPadicLFunctions 87; AutomorphicSpectralTheory 88; AnalyticNumberTheoryPartI 90; CongruenceSpectralGap 153.
- The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. Every library claim was checked there.
- There are no declared gaps and no `design/plan.json`; none is needed.

**Signatures.**
- I compared the elaborated type of each of the 53 declarations with its README statement.
- The two lost-binder leads (`crtFactorLeft`, `crtFactorRight`) are not defects: both take `(h : c₁.Coprime c₂)` explicitly.
- Layer 6 keeps every binder: `IsCyclotomicExtension {q − 1} ℚ K`, `HasEnoughRootsOfUnity`, `IsCyclotomicExtension {p} K L`, `P.IsMaximal`, `absNorm P = q`, `Q.LiesOver P`, `ψ.IsPrimitive`, the two `τ` hypotheses, `a < q − 1`, and for 6.3 `a, b ≠ 0`, `(a + b) % (q − 1) ≠ 0`.
- 6.2's `τ` hypothesis (`τ(μ) = μ^t` on the `(q − 1)`-th roots of unity, values of `ψ` fixed) gives `τ(g_a) = g_{ta mod (q − 1)}` exactly. The case `t = 0` is excluded by injectivity once `q > 2`.
- No `def` or `instance` lost a section variable. There is no `set_option`, `lemma`, `#eval`, sorry'd data, LaTeX, process word or pull-request number in the folder.

**Padding probe.** I replaced every `:= sorry` on a scratch copy with `first | rfl | (simp; done) | infer_instance | norm_num | positivity | decide | omega | exact le_rfl`. The result was 34 error positions and 0 `sorry` warnings: no theorem closes. None restates a definition, mirrors a Check or computes a value.

**Headline theorems** (from *Owned here*):

| Headline | Stated in `Suggested.lean` |
|---|---|
| Field of definition 1.3 | `gauss_pow_orderOf_mem` |
| 2.4 | `multiJacobiSum_eq_prod_gauss_div`, `card_diagonal_sub_le` |
| 2.5 | the Jacobi expansions and the sign of `a` (the two-squares identity is R02) |
| 3.2–3.5 | the root-power identity, `hasseDavenport_lift`, `gauss_quadChar_eq`, `jacobiSum_lift` |
| 4.2–4.3 | Stepanov's uniform bounds |
| 4.5–4.6 | the `L`-polynomials |
| 4.7–4.8 | Weil's bounds |
| 4.9 | the hyperelliptic count |
| 5.2–5.5 | expansion, Salié, `L`-polynomial and lift, Weil bound |
| 6.2–6.3 | Stickelberger at every prime above `p`, the digit-sum formula |
| 7.1–7.6 | the integer-modulus formulas and bounds |

Not statable, and checked at the pins by grep for `kloosterman`, `morita`, `grossKoblitz`, `jacobsthal`, `stepanov` and `salie` (none found):
- 6.4–6.5: no `Γ_p` at either pin.
- 7.3: no integer Kloosterman sum or `hyperKloosterman` at either pin.
- 7.7: only names characters.

The 1.4 entry is R01.

**Library declarations opened at the pins.**

Tau Ceti:

| Declaration | File and line |
|---|---|
| `powerResidueSymbol` | `PowerResidueSymbol/Basic.lean:66`, and `:92, :110, :129, :142, :207` for its API (the definition sends `x ≠ 0` to the root of unity congruent to `x^{(NP−1)/n}`; trivial if `NP` is not prime to `n`) |
| `stickelberger_congruence`, `gaussSum_inv_pow_mem_pow`, `intValuation_gaussSum_inv_pow`, `intValuation_gaussSum_inv_pow_pow_sub_one` | `GaussSum/Stickelberger.lean:289, 298, 315, 345` (hypotheses as the README states them: `ω` lifting `f`, `ψ = ζ^{Tr}`, `a < q − 1`, `v(ζ − 1) = exp(−1)`) |
| `inertiaDeg_eq_orderOf_of_val_eq_absNorm` | `Cyclotomic/ResidueDegree.lean:63` (number-field base, `m ∉ 𝔭`, unramified `Q ≠ ⊥`, an arithmetic Frobenius) |
| `TauCeti.teichmuller` | `Henselian/Teichmuller.lean:94` |
| `teichmullerLift`, `residue_teichmullerLift`, `teichmullerLift_unique` | `LocalField/Teichmuller.lean:68, 79, 168` (for `IsNonarchimedeanLocalField K`) |
| `jacobiSum_powerResidueSymbol_pow_mem`, `jacobiSum_powerResidueSymbol_mul_jacobiSum_inv` | `PowerResidueSymbol/JacobiSum.lean:57, 96` |
| `stickelbergerPhi`, `stickelbergerPhi_prime` | `StickelbergerPhi.lean:105, 137` |
| cubic and quartic identities | `Three/JacobiSum.lean:133, 147`; `Three/CubicReciprocity.lean:84`; `Four/JacobiSum.lean:156`; `Four/GaussSum.lean:61` |
| Dirichlet Gauss-sum names of R03 | `DirichletCharacter/GaussSum.lean:43, 82, 93, 115, 135, 149, 173, 199, 219` |
| `norm_gaussSum`, `apply_pow_char_of_trace`, `gaussSum_pow_char_left` | `GaussSum/Basic.lean:65, 107, 124` |
| `gaussSum_pow_three_eq_card_mul_jacobiSum`, `gaussSum_pow_four_eq_card_mul_jacobiSum_sq` | `JacobiSum/Cubic.lean:48`, `Quartic.lean:146` |
| Galois-orbit names | `MulChar/GaloisOrbit.lean:86, 139, 205, 234, 270` |
| quadric counts | `Quadric.lean:225, 238` |
| Conrey names | `Conrey.lean:78, 285, 343, 348`; `GaloisOrbitLabel.lean:116` |
| `primitiveChar_to_Complex_ne_one` | `LegendreSymbol/Complex.lean:47` |
| `ofUnitHom_inv_eq_star` | `MulChar/Lemmas.lean:35` |
| R01's native | `JacobiTheta/GaussSum.lean:227` |

Mathlib:

| Declaration | File and line |
|---|---|
| `IsArithFrobAt.exists_of_isInvariant` | `RingTheory/Frobenius.lean:222` |
| `zeta_sub_one_prime'` | `Cyclotomic/Basic.lean:311` |
| `Rat.torsionOrder_eq` | `:910` |
| `pow_eq_one_of_norm_eq_one` | `Embeddings.lean:138` |
| `exists_mulChar_orderOf_eq_card_units` | `MulChar/Lemmas.lean:173` |
| `card_eq_card_units_of_hasEnoughRootsOfUnity` | `Duality.lean:74` |
| `apply_mem_algebraAdjoin` | `MulChar/Lemmas.lean:228` |
| `ofRootOfUnity` | `MulChar/Lemmas.lean:96` |
| `equiv_rootsOfUnity` | `MulChar/Lemmas.lean:113` |
| `jacobiSum_mul_jacobiSum_inv` | `JacobiSum/Basic.lean:204` (with `ringChar ℂ ≠ ringChar F`) |
| `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum` | `:194` |
| `jacobiSum_mem_algebraAdjoin_of_pow_eq_one` | `:279` |
| `gaussSum_eq_zero_of_isPrimitive_of_not_isPrimitive` | `DirichletCharacter/GaussSum.lean:49` |
| `factorsThrough_of_gaussSum_ne_zero` | `:41` |
| `sum_char_inv_mul_char_eq` | `Orthogonality.lean:82` |
| `exists_apply_ne_one_of_hasEnoughRootsOfUnity` | `:52` |
| `algEquivOfCardEq` | `GaloisField.lean:246` |
| `hasseDeriv_mul` | `HasseDeriv.lean:212` |
| `Char.card_pow_card` | `GaussSum.lean:315` |
| `gaussSum_frob` | `:257` |
| `FiniteField.two_pow_card` | `:354` |
| `sum_mulShift` | `AddCharacter.lean:257` |
| `AddChar.card_eq` | `PontryaginDuality.lean:105` |
| `det_vandermonde` | `Vandermonde.lean:220` |
| `mul_nonsing_inv` | `NonsingularInverse.lean:209` |
| `tendsto_pow_atTop_nhds_zero_of_norm_lt_one` | `Normed.lean:223` |

**Cross-roadmap citations resolved.**

On main (`3b3f7ef`), ClassicalArithmeticCompletion: §1.19 (945), 1.23 (1040, `powerResidueSymbol_spec` at 1049), 1.36 (1410), 1.46 (1632), 1.47 (1657), 1.53 (1865), 1.55 (1917), 1.60 (2046), 4.19 (8168, `quadraticExpSum_one_eq_gaussSum` at 8179), 7.12 (14605) and 7.29 (15058). The open revision #1409 keeps every one of these ids (885 … 14562), so no citation breaks. ThetaSeries 2H is at line 562.

At open heads:

| Roadmap and section | Location at its head |
|---|---|
| AnalyticNumberTheoryPartI §2.30 (ii) | line 1567, `κ(D) δ^{1/2}` and the shifted form |
| AutomorphicSpectralTheory §1.16 | line 1282, `kloosterman_real` at 1289 |
| CongruenceSpectralGap §4.2a/§4.2b | `86faacba`, lines 647/677, `hyperKloosterman_bound ≤ k\|F\|^{(k−1)/2}` at 725 |
| DirichletPadicLFunctions §4.1 | line 910 |
| DirichletPadicLFunctions §4.4 | line 1030; odd-`p` reflection `(−1)^{R(x)}` with `R(x) ∈ {1, …, p}`; dyadic `(−1)^{1+x₁}`; digit identity |
| DirichletPadicLFunctions §4.5 | line 1072; the formula with `π^{p−1} = −p`, `π ≡ ζ − 1`, `g_q(0) = 1`; `grossKoblitz_formula`, `_valuation`, `_leading_residue` at 1098; locator Gross–Koblitz Theorem 1.7, p. 571 |
| EllipticLegendreCharacterInterfaces 5.1 | `2b50d7a9`, lines 592–596 |
| GeometryOfNumbersAndQuadraticArithmetic §4.3 | lines 1709–1892, `halfIntegralKloosterman` at 1755 |
| FunctionFieldArithmetic §5.4 | `c5d655e2`, line 1838; `\|α_i\| = √q` at 1845 |

**Ownership and overlap.** The overlap file lists no pull request changing this roadmap and no dropped id. Against the closest roadmaps:

| Roadmap | Relation |
|---|---|
| HypergeometricMotives (`ece7e652`, lines 113–118) | borders this roadmap and consumes nothing from it |
| ExplicitCharacterSumsAndSieves (`0655dd7e`, merge position 272) | consumes §4.7 `weil_mulChar_sum_bound` under that name, a downward citation |
| MaassForms (line 182) | defers Kloosterman, Gauss and Jacobi sums here |
| CongruenceSpectralGap | keeps the untwisted all-rank sums |
| DirichletPadicLFunctions (line 8) | names this roadmap as the consumer of §§4.1, 4.4, 4.5 |

No object has two owners.

**Sources read at their locators.** I read only the sources cached on this worker (Schmidt 1973, Jacobsthal 1907, Knightly–Li); the textbook sources are listed under Not verifiable.

| Source and locator | Text at the locator | Supports |
|---|---|---|
| `schmidt1973` line 47–53, Satz, p. 347 | absolutely irreducible `f(X, Y)` of degree `m > 0` in `X` and `n > 0` in `Y`; `q > 9(m + 1)²(n + 1)²`; `\|A − q\| < 2 Min(m²n, n²m) q^{1/2}` | 4.2 and 4.3 as written |
| `jacobsthal1907` line 104–149, pp. 240–241 | the scaling 2); formula 3) `p = (φ(r)/2)² + (φ(n)/2)²`; `a = φ(−1)/2`; 5) `a ≡ (p − 3)/2 (mod 8)`; Jacobsthal's remark that he could not fix the sign of `b` | 2.5 as written; formula 3) is R02 |
| Knightly–Li (arXiv 1202.0189v1), line 6817–6848 | Theorem 9.2 (all `c`, factor `τ(n)`); Theorem 9.3, p. 120 ("Let p be any prime"), (9.7), (9.8) | 7.5–7.6 |
| Knightly–Li, line 7059–7063 | Example 9.9, p. 125: `S_χ(a, b; p³) = p²`, exceeding the untwisted bound for `p ≥ 17` | 7.5–7.6 |
| LMFDB knowls `character.dirichlet.gauss_sum`, `character.dirichlet.kloosterman_sum` | `τ_a(χ) = ∑_r χ(r) e(ar/q)`; `K(a, b, χ) = ∑_{r ∈ (ℤ/q)^×} χ(r) e((ar + b r̄)/q)` | 7.1, 7.3 |
| LMFDB page `7.3` | defaults `τ_2`, `J(χ, χ_7(1, ·))`, `K(1, 2, χ)`; `χ(3) = e(1/6)`, `χ(2) = e(1/3)` | 7.7 as written |

Seeded sample:

| Target | Locator and finding |
|---|---|
| 0.1, 0.7, 3.5, 4.9, 5.6 | Derived in place from Mathlib or earlier targets; no external locator is claimed. |
| 5.1, 7.4 | Derived in place; the References cite Lidl–Niederreiter Ch. 5 §5.5 and Iwaniec–Kowalski §12.3, which are not verifiable. |
| 1.4 | Supplier sections resolved as above; see R01. |
| 3.1, 3.2 | Ireland–Rosen Ch. 11 §4; not verifiable. |
| 4.2, 4.3 | Schmidt Satz, verified. |
| 6.1 | Tau Ceti declarations, verified. |
| 6.5 | Gross–Koblitz Theorem 1.7 through DirichletPadicLFunctions §4.5, whose statement was read; the paper itself is not verifiable. |
| 7.7 | LMFDB, verified. |

The README flags no locator as unverified.

**The adversarial table.** Complex sums are to `10⁻⁶`, `p`-adic values to `7⁶`, and cyclotomic valuations are exact. The scripts are in the job's scratch directory.

| Statement | Instances tried | Values computed (left = right unless stated) | Result |
|---|---|---|---|
| 0.1 `ψ_F`, additive sign | `𝔽_7`, `𝔽_9`, `𝔽_4`, `𝔽_5` | `ψ_7(1) = 0.6235 + 0.7818i = e(1/7)`. `g(ω) = −2.440133 + 1.022619i`; `g(ω, ψ⁻¹) = 2.440133 − 1.022619i = ω(−1) g`, whereas `conj g = −2.440133 − 1.022619i`. `Tr_{𝔽_9}(1) = 2`, `Tr(i) = 0`, kernel size 3. `𝔽_4` values `1, 1, −1, −1`, sum 0. `𝔽_5` orthogonality: 0 at `a = 2`, 5 at `a = 0`. | sound |
| 0.3–0.6 | `𝔽_7`; `𝔽_3 ⊂ 𝔽_9` | `ω(2) = e(1/3)`, `ω(6) = −1`, `η(3) = −1`. Square-root counts `2, 0, 1` at `c = 2, 3, 0`. `∑_χ χ(2) = 0`, `∑_χ χ(1) = 6`. `N(i) = 1`, `N(1 + i) = 2`. `η_9 = η_3 ∘ N` and `ψ_9 = ψ_3 ∘ Tr` at all 9 points. | sound |
| 0.7 / 7.1 Chinese remainder | all characters for `(c₁, c₂) = (3, 5), (4, 5), (3, 7), (8, 3), (5, 7), (4, 9), (1, 7), (7, 1), (8, 5)` | 100 characters; `τ(χ) = χ₁(c₂) χ₂(c₁) τ(χ₁) τ(χ₂)` with 0 failures. `ψ_15(1) = e(2/3) e(2/5) = e(1/15)`. | sound |
| 1.1–1.3 | `𝔽_7`, `𝔽_3` | `g(1) = −1`; `gaussSum ω 1 = 0`; `gaussSum 1 1 = 6`. `g_2(ω) = 2.1057 + 1.6019i = ω(2)⁻¹ g`. `g_a g_{6−a} = ω^a(−1) · 7` for `a = 1, …, 5`; `\|g\|² = 7`; `g(ω⁷) = g(ω)`. Over `𝔽_3`: `g(η) = 1.7321i`, `g_2(η) = −1.7321i`. | sound |
| 1.3 `gauss_pow_orderOf_mem` | cubic over `𝔽_7`; quartic and order 6 | `g(χ)³ = 3.5 − 18.186533i = 7(−1 − 3ζ_3)`. Over `𝔽_13`, `g(ω³)⁴ = 65 − 156i = 13 J²`. `g(ω)⁶ = −248.5 − 236.4249i = −7 ∏ J(ω, ω^i)`. | sound |
| 1.4 (R01) | `p = 3, 5, 7, 11, 13` | `g(η_p) = 1.7321i, 2.2361, 2.6458i, 3.3166i, 3.6056`, equal to `ε_p √p` and to Tau Ceti's `(1 + i)/2 (1 + (−i)^p) √p` | sound; supplier is R01 |
| 2.3–2.4 | `𝔽_5`, `𝔽_7` with `r ≤ 3`; diagonal counts over `𝔽_5`, `𝔽_7`, `𝔽_9` | Quartic `J = a + bi` with `a` odd, `b` even, `a² + b² = p` for 7 primes. Gauss formula: 160 cases, 0 failures. Diagonal bound: 621 cases, 0 violations. `J(χ, χ, χ) = −0.5 + 2.5981i`; `J(χ, χ, χ⁻¹) = 7`; `J() = 0`, `J₀() = 1`. Counts `8, 1, 42`. | sound |
| 2.5 expansions | `n = 1, …, 8`; `𝔽_5, 𝔽_7, 𝔽_11, 𝔽_13, 𝔽_17, 𝔽_9`; all `a ≠ 0` | 896 cases, 0 failures; `ψ_0(1) = −3` over `𝔽_3` | sound |
| 2.5 Jacobsthal (R02) | 29 primes `p ≡ 1 (mod 4)` below 300 | `φ_2(1) = −2a` with `a ≡ 1 (mod 4)` (`p = 13`: 6, `a = −3`; `p = 53`: 14, `a = −7`). `\|φ_2(r)\| = 2b`. `φ(−1)/2 ≡ (p − 3)/2 (mod 8)`. `φ(1) = (i/p) φ(−1)`. 0 failures. Two-squares identity: 412 cases, 0 failures. | sound; R02 |
| 3.1 `L`-series | `𝔽_3`, `λ` of 3.3 | Coefficients: `(η, ψ)`: `1, 1.732i, 0, 0, 0`. `(1, ψ)`: `1, −1, 0, …`. `(η, 1)`: `1, 0, …`. `(1, 1)`: `1, 2, 6, 18, 54`, which is `(1 − T)/(1 − 3T)`. | sound |
| 3.2 / 5.4 `extensionSum_eq_neg_sum_pow`, `kloostermanSum_lift` | `κ` over `𝔽_3`, `𝔽_5` (`d ≤ 3`) and `𝔽_7` (`d ≤ 2`), all `χ`; lifts `𝔽_3 → 𝔽_9, 𝔽_27`, `𝔽_5 → 𝔽_25`, `𝔽_7 → 𝔽_49`, `𝔽_2 → 𝔽_8` | Coefficient sums `[1, K, χ(−b/a) q, 0]` in every case. `K_E = −(ω₁^n + ω₂^n)` with `\|ω_i\| = √q`: 15 cases, 0 failures. `K_3(1, 1) = −1`, `K_9(1, 1) = 5`, `K_49(ω ∘ N; 1, 2) = 6.7579 − 11.7050i`. | sound |
| 3.3 `hasseDavenport_lift`, `gauss_quadChar_eq` | the lifts above plus `𝔽_9 → 𝔽_81`, `𝔽_4 → 𝔽_16`; every `(χ, ψ) ≠ (1, 1)` | 153 cases, 0 failures. `g(η_q) = 3, −5, −5.1962i, 7, −9, 11` for `q = 9, 25, 27, 49, 81, 121`, equal to `(−1)^{f−1}(ε_p √p)^f` | sound |
| 3.4 | `𝔽_13`, every `χ` and `m ∣ 12` | 72 pairs; 72 hold, 16 fail with `χ(m)^{−m}`. `m = 3`: `−44.8610 + 13.5828i` on both sides; `46.8722` at `χ = ω²`. `m = 4`: `−42.6928 − 163.5186i`, against `−120.2648 + 118.7324i` with the inverted exponent. Duplication: `3.0991 + 1.8427i`. `𝔽_7`: `−7 = −7`. | sound |
| 3.5 `jacobiSum_lift` | all pairs `χ, ψ ≠ 1` on the lifts | 0 failures; `J(η_9, η_9) = −1`; `\|J\| = 7` over `𝔽_49` | sound |
| 3.6 Checks | `𝔽_7` | `g(χ) = 2.3705 − 1.1751i`, `g(χ⁻¹) = 2.3705 + 1.1751i`; `∑ η(x² − x) = −1` | sound |
| 4.2 Schmidt instance | `y² = x³ + x + 1` over `𝔽_1297` (`q > 1296`) | `A = 1269`, `\|A − q\| = 28 < 864.33` | sound |
| 4.3 Checks | `(q, Q) = (3, 81), (5, 625)`; the Laurent curve at `q = Q = 3` | `N = 63, 525 = Q − (q − 1)√Q`; 0 points | sound |
| 4.7 / 4.8 Weil bounds | 400 random `(p, f)` over `𝔽_5` to `𝔽_17`; the Examples | 749 tests, 0 violations. Examples: `6, −3, −2`; `4.7409, 0, 5.6800`. | sound |
| 4.9 | `𝔽_5`, `𝔽_25`, `𝔽_9`; `y² = x⁴ + x + 1` for `p < 200` | `9, 46, 15, 9` points; `max \|N − p\|/(3√p) = 0.5726 ≤ 0.58` | sound |
| 5.1 | `𝔽_7` | `K(1; 1, 1) = 2.0489`, `K(1; 1, 2) = −2.3569`. `K(ω; 1, 2) = 0.6027 − 0.3479i = K(ω⁵; 2, 1)`. `K(ω; 1, 0) = g(ω)`; `K(1; 3, 0) = −1`. `K(1; 2, 3) = K(1; 1, 6) = 1.1099`. | sound |
| 5.2 / 5.3 | `𝔽_5, 𝔽_7, 𝔽_9, 𝔽_11, 𝔽_13, 𝔽_8, 𝔽_25`, all `χ` | Expansion: 4247 cases, 0 failures. Salié: 936 cases, 0 failures. `K(η; 1, 2) = 3.2992i`; `K(η; 2, 3) = 0`; `K(η; 1, 2) = 0` over `𝔽_5`. | sound |
| 5.5 | `𝔽_7`; `p = 3, 5, 7, 11, 13` | `θ_7 = 1.9684`; `K_49(1, 1) = 9.8019`, computed three ways. Second moments `5, 19, 41, 109, 155 = p(p − 1) − 1`. `max \|K\|/2√p ≤ 0.8731`. At `p = 5`: `0.3820, −3.2361, 1.2361, 2.6180`. | sound |
| 5.6 | `𝔽_7`; `(0, 0)` at `χ = 1` | `K(ω; 0, 2) = −2.1057 + 1.6019i = ω(2) g(ω⁻¹)`; `K(1; 0, 1) = −1`. `q − 1 ≤ 2√q` holds at `q = 5` (`4 ≤ 4.472`) and fails at `q = 7` (`6 > 5.292`). | sound |
| 6.1 | `q = 7`, `𝔓 = (ζ_3 − 2)` | `T(2) ≡ 30 (mod 49)`; `30² + 30 + 1 = 19 · 49` | sound |
| 6.2 headline | `q = 7` in `ℤ[ζ_42]` and `q = 9` in `ℤ[ζ_24]`, exact through `N_{L/K}` | `q = 7`: `v_𝔓 = a` and `v_{𝔓̄} = 6 − a` for `a = 1, …, 5`, and `0, 0` at `a = 0`; `N_{L/ℚ}(g_a) = 7⁶`. `q = 9`: `v_𝔓 = 1, 2, 1, 2, 3, 2, 3 = s(a)`; `v_{τ_5 𝔓} = 3, 2, 3, 2, 1, 2, 1 = s(5a mod 8)`. | sound |
| 6.3 headline | `q = 5` in `ℤ[i]`, `𝔓 = (2 − i)` | `J = −1 + 2i, 1 − 2i, 1 + 2i, −1 − 2i`; `v = 0, 0, 1, 1`; `4v + s(c) = 2, 3, 5, 6 = s(a) + s(b)`. Excluded pairs: `J = −1, 1`. | sound |
| 6.4–6.5 | `q = 7`, 7-adic to precision `7⁶` | `π⁶ + 7 ≡ 0`; `v(π − λ) = 2`. `v(g_a + π^a Γ_7(a/6)) ≥ 36` (the full precision) for `a = 1, …, 5`. With `Γ_7(1 − a/6)` instead: `7, 2, ≥36, 4, 11`. `v(g_a + λ^a/a!) = 2, 3, 4, 5, 6 = a + 1`. `v(g_a + π^a/a!) = 7, 14, 9, 16, 11 ≥ a + 6`. `J(ω^{−4}, ω^{−4}) = 7Γ_7(2/3)²/Γ_7(1/3) = −1 − 3T(2)`, which differs from `−1 − 3T(4)` modulo 7. `J(ω^{−1}, ω^{−1}) = −Γ_7(1/6)²/Γ_7(1/3)`. | sound |
| 7.1 | all characters modulo `N ≤ 40` | Imprimitive formula: 490 characters, 0 failures. `τ(1_12) = 0`, `τ(1_7) = −1`. Quartic mod 5: `ττ⁻¹ = −5`. | sound; R03 |
| 7.2 | all pairs modulo `N ≤ 30` with `χψ` primitive | 2820 pairs, 0 failures. `N = 9`: `J = 0`, `ττ⁻¹ = −9`, `τ(1_9) = 0`. | sound |
| 7.3 | moduli 7, 12, 15, 5 | `S(1, 1; 7) = 2.0489`, `S(1, 2; 7) = −2.3569`, `S(7, 1; 7) = −1`. `S(m, 0; 12) = 0, 2, 0, −2, −4, 4`. `\|S_χ(1, 1; 15)\| = 1.9021`; `S_χ(1, 1; 5) = 1.1756i`. | sound |
| 7.4 `kloostermanSum_zmod_mul` | all `χ`, `m`, `n` for `(3, 5), (4, 5), (3, 4), (5, 7), (8, 3), (9, 2), (1, 5)` | 41628 cases, 0 failures. `S(1, 1; 15) = −2.618 = S(2, 2; 3) S(2, 2; 5)`, against `−0.382` without the inverses. `S(1, 1; 1) = 1`. | sound |
| 7.5 Salié | `p^k = 9, 25, 27, 49, 81, 121, 125, 169, 243` | Both branches: 14166 + 14166 cases, 0 failures. `S(1, 1; 25) = 8.7631`, `S(1, 1; 27) = −4.6641`, `S(1, 1; 49) = 13.5421`, `S(2, 3; 125) = −0.8428`, `S(1, 4; 125) = −21.9102`, `S(3, 5; 121) = −19.3770`. Principal character mod 25: `S(5, 5; 25) = 1.909830`. | sound |
| 7.5 twisted bounds | every `χ` modulo `2^k` (`k ≤ 7`), `9, 27, 81, 25, 125, 49, 343, 121, 169`; `m ∈ {0, 1, p, …}`, all `n` | 0 violations of: the conductor-weighted bound (maximum ratio 0.6666); the bound at `p²`; `p^{⌈k/2⌉}` for `p ∣ m`; `2p^{k/2}` for `j ≤ ⌊k/2⌋`; `2p^{j/2} p^{k/2}`. `\|S_χ(7, 7; 125)\| = 25`. | sound |
| 7.6 | untwisted: all `m, n` for `c ≤ 70`, and `128`, `243`; twisted: all `χ` modulo `c ≤ 40` | Untwisted: 121247 sums, 0 violations (maximum ratio 1.0). Twisted: 394857 sums, 0 cube-free and 0 conductor-weighted violations. `\|S_χ(1, 15; 17³)\| = 289 > 280.37`. | sound |
| 7.7 | LMFDB `7.3`, `5.2` | `τ_2 = 2.1057 + 1.6019i`, `K(1, 2, χ) = 0.6027 − 0.3479i`. Quartic: `τ_2 = 1.9021 + 1.1756i`, `K(1, 2, χ) = 1.1756 − 1.1756i`. | sound |

**Convention witnesses recomputed in each layer.**
- `χ(0) = 0` including `χ = 1`: `g(1) = −1`, `K(1; a, 0) = −1`, `J₀() = 1`.
- The plus sign in `ψ_F`.
- The minus signs `−g' = (−g)^n` and `S_n = −∑ω^n`.
- `K = −2√q cos θ`.
- `χ(m)^m` in the product relation.
- `(ℓ/p)^k` and `ε_{p^k}` in Salié's formula.
- `ω^{−a}` in 6.2–6.3 (`v(g(ω^{+a})) = 6 − a`).
- `λ` against `π` (`v(π − λ) = 2`).
- Jacobsthal's `a = φ(−1)/2` against `a = −φ_2(1)/2`.

## Not verifiable

- **Ireland–Rosen** Ch. 8, 10, 11 (Theorem 1 of §4), 14 (2.4, 3.1–3.3, 6.2–6.3): Springer, paywalled; checked by computation.
- **Lidl–Niederreiter** Ch. 5 §§5.1–5.5 (4.7–4.8, 5.1–5.5): no open text; checked by computation.
- **Iwaniec–Kowalski** §11.7, Corollary 11.12, (11.58), §12.3, Lemma 12.4 (4.3, 5.3, 7.4–7.6): no open text. Knightly–Li cite the same Corollary 11.12 for (9.6). Checked exhaustively as tabulated.
- **Gross–Koblitz 1979**, Theorem 1.7 and Lemma 2.3: Annals, behind JSTOR. The statement consumed is DirichletPadicLFunctions §4.5, read at its head. Checked 7-adically at `q = 7`.
- **Washington**, **Lang**, **Weil 1948**, **Bombieri**, **Katz**, **SGA 4½**: background or paywalled; nothing is consumed beyond what is checked above.
- **Beukers–Cohen–Mellit** Theorem 1.3 and **Conrad** (A.6): legally readable but not re-read in this review. The product relation they are cited for in 3.4 was checked on all 72 pairs over `𝔽_13`.

## Source issues

- none
