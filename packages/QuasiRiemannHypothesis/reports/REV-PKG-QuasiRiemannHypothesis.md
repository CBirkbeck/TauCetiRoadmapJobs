<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18800#issuecomment-6939342487 -->
Review (claude) of 73f7bcb

Verdict: needs_changes

**Source independence:** 27 passages compared with 9 sources, no sentence shared, four runs of 5 to 7 words (R02); largest share `openai2026quasiRH`, 58 of 128 locators; contents compared with `openai2026quasiRH`: independent (its §§4.1–4.4 are split over Layers 2, 4, 3, 5 in another order, its §8 is Layer 7 and precedes its §5 as Layer 9, Layer 6 gathers its Lemma 6.1, §5.4 and §9.1, Layer 8 has no counterpart, and the order inside Layer 10 is forced by the Needs lines of §§10.2, 10.3, 10.5–10.7).

**Research link:** the headline targets are Theorem 3.1 and Corollary 1.2 of OpenAI 2026 (unrefereed), with Liu 2026 a second account; they build on Kubota 1969, Patterson 1977, Heath-Brown 2000, Goldmakher–Louvel 2013 and Blomer–Goldmakher–Louvel 2014, and settle Vinogradov's conjecture as stated in Tao 2015; README Summary and References, and `openai2026quasiRH` pp. 4–10.

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) a Mathlib declaration cited under a name that does not exist at the pin

   Location: `packages/QuasiRiemannHypothesis/README.md` lines 117, 227, 784, 796 and 806:
   "Mathlib `NumberField.ideal.tendsto_norm_le_div_atTop`".

   Claim: the name is a pinned Mathlib declaration.

   Witness: `#check @NumberField.ideal.tendsto_norm_le_div_atTop` at the pin answers "Unknown
   constant". The declaration is in `namespace NumberField.Ideal`
   (`Mathlib/NumberTheory/NumberField/Ideal/Asymptotics.lean` lines 33 and 152).

   Repair: write `NumberField.Ideal.tendsto_norm_le_div_atTop` at the five places. Tested:
   `#check @NumberField.Ideal.tendsto_norm_le_div_atTop` elaborates at the pin; its limit is
   `2^(r₁) (2π)^(r₂) R h/(w √|d_K|)`, as the README says.

2. **F02** (P3) four short runs of the main source's wording, one with an undefined term

   Location and witness (shared consecutive words, `openai2026quasiRH`):

   - README line 636, "A numerator containing a moving good prime is not in this family": 7 words
     shared with `openai2026quasiRH` line 486 (p. 12). "Moving" is the source's term and is defined
     nowhere in the README.
   - README line 1732, "The character acts on the whole index `cn³`": 7 words shared with
     `openai2026quasiRH` line 1082 (p. 25).
   - README lines 2052–2053, "the allowance `T₁/2` is not renewed between successive estimates":
     6 consecutive words, 8 of 9 in all, shared with `openai2026quasiRH` line 3469 (p. 77).
   - README lines 950–951, "valid on noncoprime primary pairs because `R` is the bicharacter there":
     5 words shared with `openai2026quasiRH` line 701 (p. 17).

   Claim: the roadmap's prose is its own. Each run is under a dozen words, so none is a copied
   passage, but each is the source's turn of phrase and not forced by the mathematics.

   Repair, in the roadmap's own words:

   - line 636: "The numerator is fixed before `A` varies: when it is divisible by a good prime that
     changes with the row, the symbol is not one of these characters."
   - line 1732: "`Ψ` is evaluated at the product `cn³`, not at `c` and `n` separately; a primary
     index `A` …" (the rest of the bullet unchanged).
   - lines 2052–2053: "…inside the zero-free rectangle of §7.2; the margin `T₁/2` is spent once, for
     all the estimates together. Put".
   - lines 950–951: "…with finitely many constants `c_(θ,θ')`; since `R` is defined as a bicharacter
     of the square-class group, the expansion also holds when `a` and `b` have a common factor;".

3. **F03** (P3) "the corrected row" is used in a locator and defined nowhere

   Location: README lines 1864–1865: "(`openai2026quasiRH` (6.1) and the corrected row, pp. 45–46;
   `liu2026improved` (4.5))".

   Claim: every term is the literature's, Mathlib's, or defined in the roadmap.

   Witness: "corrected row" occurs once in the README. It is the source's name for the series
   `T_(m,v,η)` (`openai2026quasiRH` line 2025, p. 45), and in a roadmap it reads as a process word.

   Repair: "(`openai2026quasiRH` (6.1) and the display defining `T_(m,v,η)` before it, pp. 45–46;
   `liu2026improved` (4.5))". Checked: the display is on p. 45 and (6.1) on p. 46.

4. **F04** (P3) the build paragraph omits two dependencies that the layers themselves list

   Location: README lines 383–386: "Layer 7 detects zeros … and needs Layers 3 and 5. Layer 9 … needs
   Layers 3, 4, 6 and 8."

   Claim: the paragraph gives each layer's dependencies.

   Witness: §7.2 has "*Needs:* §§5.1–5.3; LFunctions Layers 5 and 7; Layer 1 (§1.2)" and Layer 7's
   Dependencies list Layer 1 (line 1441). §9.2 needs §2.5 and §9.3 needs §2.4, and Layer 9's
   Dependencies say "Layers 2–4, 6 (§6.2) and 8" (line 1846).

   Repair: "…and needs Layers 1 (§1.2), 3 and 5. Layer 9 … needs Layers 2, 3, 4, 6 and 8." No order
   changes: Layers 1 and 2 are already first.

Four findings, all P3 and none blocking: one Mathlib name that does not exist at the pin (five
occurrences), four short echoes of the main source's phrasing, one undefined term in a locator,
and one line of the build paragraph that disagrees with the layers' own dependency lines. No
mathematical defect was found: every Check recomputed below agrees with the README, and
`Suggested.lean` elaborates with `sorry` as its only warning.

Previous review of this package: none. Maintainer notes: none.

## Verified sound

**Elaboration.** `lake env lean` on `packages/QuasiRiemannHypothesis/Suggested.lean` from the
content repository: 10 warnings, all "declaration uses `sorry`", no error. One `import Mathlib`,
one `TauCeti.*` import (`TauCeti.NumberTheory.LFunctions.Hecke.Basic`, object file present), no
`set_option`, no sorry'd data, `theorem` throughout, one real-bodied definition.

**Signatures.** The 11 elaborated types in the worker's signature file were compared with the
README statements (§§1.1, 5.5, 10.7, 11.1, 11.2, 11.3): the generality is equal in each and no
binder is lost. The file has no section variables.

**Padding probe.** Each of the 10 theorems was tried on a scratch copy with `simp`, `rfl`,
`infer_instance`, `simp [ZeroFreeRightOf]`, `intro s hs; simp_all [ZeroFreeRightOf]` and
`exact riemannZeta_ne_zero_of_one_le_re (by linarith)`: 10 of 10 fail under each of the six. None
restates a definition or mirrors a Check.

**Headlines.** The Summary's end theorems are the `11/12` half-plane (three statements), the zero
strip (two), the conditional least-value bound (two), the least quadratic nonresidue and
Vinogradov's conjecture, with the transfer of §5.5. All ten are stated. The module docstring names
Layers 1.2–1.4, 2–4, 5.1–5.3, 6, 7, 8, 9 and the mechanism of 10 as not stated, with reasons (no
`ℍ³` with its `SL₂(ℂ)` action, no `K`-Bessel function, no Fisher–Friedberg characters at the pins).
All 11 Lean names appear backticked in the README, and the README backticks no other name of its
own.

**Library names.** 62 cited declarations were checked with `#check` in one scratch file: 61
resolve and one fails (R01); `meromorphicOrderAt_mul`, `meromorphicOrderAt_of_not_meromorphicAt`,
`riemannZeta_ne_zero_of_one_le_re`, `gaussSum_mulShift` and `gaussSum_mul_gaussSum_eq_card` were
found by search in the pinned Mathlib. Opened at the pin, among others:
`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74` (`heckeLFunctionC`, a
`meromorphicContinuation`) and `:138` (germ comparison on `𝓝[≠] s`);
`…/Hecke/Primitive.lean:287` (`eulerCorrection_ne_zero` under `0 < s.re`);
`…/Cyclotomic/Three/Primary.lean:59` (`IsPrimaryEisenstein`: `3 ∣ x − 2`);
`…/Three/CubicReciprocity.lean:84, 144, 273` (cube of the Gauss sum; primes of different norms;
the rational-integer form); `…/PowerResidueSymbol/Ideal.lean:94` (a `MulChar (𝓞 K ⧸ 𝔞) (𝓞 K)`,
zero on non-coprime classes); `…/RayClass/Count/Asymptotic.lean:96`; `…/GaussSum/Basic.lean:65`
(`TauCeti.norm_gaussSum`, `χ ≠ 1`, `ψ` primitive); Mathlib `DirichletContinuation.lean:291`,
`Nonvanishing.lean:404, 412, 468`, `Harmonic/ZetaAsymp.lean:420`. Read in source only, their
modules not being built: `TauCeti.LFunctions.sum_smul_rayClassCoeff` (`Hecke/Orthogonality.lean:68`)
and `Ideal.powerResidueSymbolIdeal_intCast_three` (`Three/RationalResidue.lean:47`). The lead in
the worker's citation list (`SieveApplications.leastNonresidue` "found nowhere") is refuted: it is
the name SieveMethodsAndPrimePatterns §2.9 defines (its README line 2457 on main), not a pinned
declaration, and the README cites it as such.

**Dependency check.** Output: `depcheck: 261 roadmaps, 2606 edges, 0 problem(s)`. No UPWARD, CYCLE
or `moved:` line. The roadmap is at line 296 of the merge order, after AnalyticNumberTheoryPartIII.

**Supplier citations, resolved now.** On main: LFunctions Layers 0, 4–8 (`heckeData`,
`grossencharacterData`, `gaussSum_mul`, `norm_gaussSum` at its lines 1005–1031, 1574);
ZerosOfLFunctions §§1.6 (line 942: `continuedL (heckeData χ) = heckeLFunctionC χ.character`), 3.1,
4.4–4.5, 8.4–8.6, Layer 9 (GRH, line 2947); ExplicitZetaBounds §3.2 (lines 1227–1245: the
hypotheses and the bound are those the README quotes); ClassicalArithmeticCompletion §§1.12, 1.23,
1.33, 1.34, 1.38, 1.43, 1.52, 1.72, 1.75; ClassFieldTheory Layer 11 and §13.1; ThetaSeries 1A
(line 432, the sign `e(+⟨v, m⟩)`); SieveMethodsAndPrimePatterns §§2.2, 2.3, 2.7, 2.9;
AnalyticNumberTheoryPartIII §§8.2, 9.2; AnalyticNumberTheoryPartI §§0.34, 1.6;
AnalyticNumberTheoryPartII §5.29; AutomorphicFormsOnReductiveGroups §4.5 (line 708: `K_ν`, its
equation, decay); Completed GlobalNumberFields Layers 2 and 9. At open heads: BianchiModularForms
§§0.3–0.4; MaassForms §§7.1, 7.3; CharacterSumsOverFiniteFields §§1.4, 1.5, 3.4 (the duplication
formula "for every `χ`"); AutomorphicSpectralTheory §§0.15, 0.16, 1.15a–1.15c. Each section exists
and says what it is cited for. No declared gap; `design/plan.json` has `"gaps": []`.

**Sources: the seeded sample.** All 15 targets were checked at their locators. The author flagged
no locator as unverified.

| Target | Locator read | Result |
| --- | --- | --- |
| 1.4 | `openai2026quasiRH` lines 3691–3710, Lemma 11.1, p. 82 | (11.1) is the README's inequality with `T₁ = Z^τ`; ceiling `min(d_min/100, τ₀)` present |
| 2.1 | lines 453–463, Lemma 4.1, p. 11; `milnecft2020` lines 7041, 7065 (V 3.5, 3.8, printed p. 158) and VIII 5.3 (printed p. 245) | supports `n = 6`, `K = F`; the general `n` is Milne's |
| 2.2 | lines 407–414, §4.1, p. 10; `dunnradziwill2024` line 216, (1.4) | primary is `≡ 1 (mod 3)`, closed under products |
| 2.3 | lines 440–447, p. 11 | zero extension and "sixth power is the coprimality indicator" present |
| 3.3 | lines 820–831 and p. 20, Lemma 4.6, p. 19 | `MW_G(s) = e^(s²)`; the three clauses present |
| 3.5 | lines 433–440, p. 11 | `e(z)`, `dμ`, self-duality and the ideal count `πH/(3√3) + O(√H + 1)` |
| 4.6 | lines 695–706, §4.2, p. 17 | Fourier expansion, `|T|^(1/2) max|Φ|`, indicator identity |
| 5.1 | lines 999–1010, Lemma 4.10, p. 23 | three bounds as stated; the README adds the dependence on `K` |
| 5.4 | lines 3796–3812, (11.2), p. 85 | split and inert factors as in the route |
| 7.1 | lines 489–494, (4.1)–(4.2), p. 12 | plain and inverse polynomials, masks kept |
| 9.1 | lines 1059–1083, §5.1, p. 25; `liu2026improved` line 672, (4.1) | `D`, `L₀`, `T`, the completed sum, `a > 1` |
| 10.2 | lines 2143–2215, Lemma 6.2 p. 48, proof pp. 48–49, Proposition 6.3 p. 49; `liu2026improved` line 1111, (6.1) | bound `(Q + Y²)/Y`, mass `O(Y⁻¹)`, exponent `1/4 + ε` |
| 10.5 | lines 3205–3664, Definition 10.1 p. 72, Lemmas 10.2–10.6 pp. 73, 74, 77, 78–80, 80–82, (10.12) p. 76, (10.14)–(10.16) p. 77 | every hypothesis, exponent and page as cited |
| 10.7 | lines 387–389, Theorem 3.1, p. 10; `liu2026improved` line 1140, Proposition 6.3; `openai2026quasiRHalt` line 42, Theorem 1.1, p. 2 | as cited |
| 11.3 | lines 275–288, Corollary 1.2, p. 7; `tao2015` line 31; `bimsissac2017` lines 598, 671 | `A = 32` from `ε = 7/16`; exponent `4/(1 − 2ε)` |

Also read outside the sample: Proposition 11.3 (p. 84, lines 3788–3830; the source assumes
`σ₀ ∈ [1/2, 1)`), `kubota1969` Proposition 1 (printed p. 24, `n² ∣ N`, the group in `GL(2, 𝔬)`) and
Theorem 6 (printed p. 50, `N` an `n`-th power), `dunnradziwill2024` (1.5) and (5.2)–(5.8), and the
page map of `patterson1977` (scan page + 123: Table II p. 129, Lemma 7.2 p. 147, Table III p. 151,
Theorem 9.1 p. 160).

**Adversarial pass.** Values computed by hand, and by a floating-point script for the Gauss sums
(`ω ↦ 2` in `𝔽₇`, `7` in `𝔽₁₉`, `3` in `𝔽₁₃`).

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 `ZeroFreeRightOf` | `s − 2`; `0`; `1/(s − 1)`; `ζ` | order `1` at `2`; `⊤`; `−1` at `1`; `−1` at `1`, else nonzero for `Re s ≥ 1` | junk `0` excluded, pole allowed | none |
| 1.2 zero abscissa | `{}`; `{s − 3/4}`; `{s − 1/4}`; `{s − 2}` | `1/2`; `3/4`; `1/2`; `2 ∉ [1/2, 1]` | hypothesis "zero-free right of `1`" needed and stated | none |
| 1.3 continuation | `E* = min(β* − σ₀ − ω, σ)` | Mellin integral converges for `Re s > β* − E* ≥ σ₀ + ω`; at `0` for every `B`; `|e^((2+it−5/6)²)| = e^(49/36 − t²)` | contradiction with the third bullet of 1.2, which needs `β* > 1/2` | none |
| 1.4 late height | `Aτ ≤ m/4`, `Z ≥ 1` | `(1 + Z^τ)^A ≤ 2^A Z^(m/4)`, first term `Z^(C(β*) − 3m/4)`; `N` with `B − Nτ < C(β*) − m/2` | saving `m/2` | none |
| 2.1 fixed numerator | `ℚ, n = 2, a = −1`; `a = 5`; `F, n = 6, a = −1` | conductor `4∞`; `(5/3) = (3/5) = −1`, conductor `5`; `(−1)^(6/6) = −1` at norm `7`, `(−1)^2 = 1` at norm `13` | real place needed for `n = 2` only | none |
| 2.2 primary | units mod `3`; `−2`; `1 + 3ω`; `λ` | six distinct units of `𝓞/3` (order `6`); norms `4`, `7`; `λ ∣ 3` | exactly one primary associate off `λ` | none |
| 2.3 sextic symbol | `p = 1 + 3ω` | `χ_p(2) = ω`, `χ_p(3) = 3 = −ω²`, `χ_p(−1) = −1`, `χ_p^6(7) = 0` | agrees with the Examples table `1,2,4,6,5,3` | none |
| 2.5 reciprocity, supplements | `d = 1 + 3ω`, `−2`, `4 + 3ω`; pair of norm `19` | `(α₂, α₃) = (−1, 1), (1, 0), (1, 1)`; `(ω/d)_3 = ω², ω, ω`; `(λ/d)_3 = 5² = ω²`, `1`, `7⁴ = 9 = ω²`; `t = −7` | both supplements hold on three moduli | none |
| 3.3 Gaussian weight | `s = 0, 1`; variant `e^(−(log y)²)` | `1`, `e`; `√π e^(s²/4)` | normalization pinned | none |
| 3.5 lattice | `e(1)`, `e(ω)`, `e(ω/2)`; `H = 3` | `1`, `1`, `−1`; covolume `(2/√3)(√3/2) = 1`; `2` ideals against `1.81`; residue `2π/(6√3) = 0.6046` | self-dual | none |
| 4.3 prime Gauss identities | `p = 1 + 3ω`, `−2 + 3ω`, `4 + 3ω` | `γ_2³ = 0.1890 − 0.9820i`, `0.8030 − 0.5960i`, `−0.6934 − 0.7206i`, each `= −α(p)`; `γ_1γ_2 = −0.6547 + 0.7559i = χ̄_p(4) γ_3 γ_2³`; `|γ_6| = 0.378` | conjugate forced: the unbarred value is `−0.3273 − 0.9449i` | none |
| 4.4 four-term formula | `c = 1, −1, λ, −λ, −3, 5, 1 − 6ω, 7 + 3ω, 3 + 2ω, 1 + 3ω` | brute force over residues: `1, 1, i, −i, 1, 1, i, 1, −i, i`; formula the same | `τ(λ, λ) = −1`, `τ(−1, λ) = −1` | none |
| 4.5–4.6 sextic reciprocity | `a = 1 + 3ω`, `b = −2 + 3ω` | `χ_b(a) = 8 = −ω²`, `χ_a(b) = ω²`, ratio `−1`; both in the class of `λ` mod `4` (`λω² ≡ a`, `λω ≡ b`); with the conjugate `−1`, without it `−ω` | `R = τ(λ, λ) = −1` | none |
| 5.1 deleted factors | `𝔯 = 𝓞`; `(2)`, `a = 1`; `(p)`, `σ = −1`; `d` primes over `2`, `a = −1` | `2`; zeros at `2πik/log 2`; `1 − p`; `D(0) = 2^d = N𝔯` | `σ₀ > 0` and the dependence on `K` needed | none |
| 5.2 strip bound | `K = ℚ`, `ψ = 1`, `s = −1/10` | `|ℒ| = 0.5099`; `3 (0.9/2π)^(0.6) · 10.5844 = 9.895`; `C_ℚ 3^(0.6) = 61.385` | `|(s−1)/(s+1)| P(s) = 3` | none |
| 5.4 norm-composed | `F`, `χ` mod `7`; `ℚ(i)`, `χ` mod `5`; `ℚ(√2)`, `α = 1 + 3√2` | `χ(4)` at `(2)`; `i` at `(1+i)`, `χ(9) = −1` at `(3)`; `N α = −17`, `χ(17) = −1` | real places needed | none |
| 5.5 transfer (Lean) | `K = ℚ`; `σ₀ < 1/2`; level `4` principal | factorization trivial; hypothesis false (zero `1/2 + 14.13i`); factor zeros on `Re s = 0` | true; `0 ≤ σ₀` is what the route uses | none |
| 7.1 polynomials | `r = 0`; twist `y^(iv)` | `M_0 = W(1)`; `Σ μ(n) n^(iv−s) = 1/ζ(s − iv)` | sign of the shift pinned | none |
| 7.2–7.3 bins | failure chain; `ε₀ = ε'/(48 r_max)`, `ε₁ = ε'/8` | `M_I > a₀ + 1 + ε > 1`; `12εr + 2ε₁ ≤ ε'/2`; `(24 − 12m)ε + 2ε₁ ≤ 3ε'/4`; height `≤ 9^C U^(ε'/10)` | exponents below `ε'` | none |
| 8.1 characters | `γ = (1 + 3ω, −3ω²; 3, 1 − 3ω)`; `γ ∈ Γ(9)` with `a = 10` | `det = 1`; `(c/a)_3 = 9 = ω`, `(b/d)_3 = 4⁴ = 9 = ω`, `(c/d)_3 = 3⁴ = 3 = ω²`; `κ_P = ω`, `κ = 5² = ω²` | `κ_P = κ̄` on `Γ(9)` | none |
| 8.3, 8.5 | `SL₂(ℤ[i])`; cusps of `Γ₁(3)` | `φ(1) = π(−1/4)/(π/4) = −1`; `648/2 = 324`, `324/27 = 12` | unitary; twelve classes | none |
| 8.7 theta coefficients | `c = 1 + 3ω`; `k = −3, −4`, `k = 3n − 4` | `g̃(c) = 0.8960 − 0.4441i`, cube `−α(c)`; bound `3^(5/2)|d|` attained; `9|d| < 12.98|d|`; `3^(n/2+2) < 3^(n/2+7/3)` | bound `27 · 3^(k/6)|b|` holds | none |
| 9.1 completed sum | exponents; `A = p², p³, p⁴` | `q_c^(−s) q_n^(−3s+1/2)` from `t = s − 1/2`; not `cn³`, `1 · p³`, `p · p³` | Mellin form correct | none |
| 9.2 kernel | `V_G` | `𝓜_{0,0} = √π e^(1/16) = 1.887`; poles of the quotient at `−5/6, −7/6, …` | lines `Re t = −1/4` and `A` admissible | none |
| 10.2 low estimate | `v = 1 + 3ω`, `v' = 4 + 3ω`, `r₊ = 13`; scales | distance `1/√91 = 0.105 ≥ 1/13`; `Q^(−1/2) (Q/Y)^(1/2) Z^(1/2) = Z^(1/4)` | `δ_Y = min(1, 1/r₊)/Y` | none |
| 10.4 row envelope | `δ = 1/50, 2/3, 1` | `R = 1, 2/3, 1/2` | kink at `2/3` | none |
| 10.5–10.6 constants | probe data | `C(s) = s − 2/3`; `13/150 − 1/4 + 1/50 = −43/300`; `7/4 + 0.501 − 4 < −1`; `1/24 − 62/75000 = 1021/25000`; `46 · 10⁻⁶ < 1/4800`; `3/4 · 1/1200 = 1/1600 > 1/2400` | saving `1/4800` | none |
| 10.7 half-plane (Lean, three) | level-`4` principal; `ζ` at `1`; real zero `β` | pole order `−1`, factor zeros on `Re s = 0`; `s = 1` excluded; `(1 − β) log q ≥ (log 3)/12` | order statements, no junk value read | none |
| 11.1 zero strip (Lean, two) | `ζ` at `−2`, at `1`; `ζ_F` at `0` | excluded by `Re ρ > 0`; `ζ(1) ≠ 0` in Mathlib; order `r₁ + r₂ − 1 = 0` | holds | none |
| 11.2 least value (Lean, two) | `q = 2, 3, 12`; `𝔪₀ = (1)`; trivial `η` | no nonprincipal character; `n = 2`, `log 3 > 1`; `n = 5`; `log 1 + 2 = 2`; excluded by `η ≠ 1` | one `C` per `θ` (and `K`) | none |
| 11.3 nonresidue (Lean, two) | `p = 3, 7`; `ε → 5/12, 11/24` | `n = 2`, `3`; exponents `24`, `48` against `12` | holds | none |
| R01 | `#check` at the pin | unknown constant; `NumberField.Ideal.…` elaborates | name wrong | R01 |
| R04 | §7.2 and §9.2 Needs lines | Layer 1 and Layer 2 used | paragraph incomplete | R04 |

**Shape.** Title, Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read
the build, eleven layers each ending in Examples and Dependencies, Downstream consumers,
References. Every definition has API bullets and at least three Checks (27 definitions counted,
3 to 6 Checks each). No LaTeX delimiters, no pull-request numbers, dates of process, anchors or
machine paths. The layers are named by their mathematics, and no sentence says the roadmap follows
a source.

**Duplication.** No pinned declaration proves a target: the worker's Loogle and LeanSearch leads
for the 11 declarations were read, none has the same statement, and `ZeroFreeRightOf`,
`leastNonresidue` and a composite cubic reciprocity do not occur in Mathlib or Tau Ceti. Searched
at main and at the open heads for the Kubota character, cubic theta function, Fisher–Friedberg
characters, Goldmakher–Louvel, zero-free half-plane, least nonresidue, norm-composed character and
sextic sieve: no other roadmap states them. ExplicitMultiplicativeFunctions (open) mentions the
`7/8` half-plane as background and states nothing from it. The overlap file lists no shared pull
request, no dropped id and no second copy; that was confirmed (no folder of this name on main).

Overlap check: read ZerosOfLFunctions, LFunctions, AnalyticNumberTheoryPartIII, ExplicitNumberFields, CongruenceSpectralGap, CharacterSumsOverFiniteFields, BianchiModularForms, ExplicitMultiplicativeFunctions, MaassForms, MetaplecticAutomorphicForms; shared objects and owners: Rademacher's bound (ExplicitZetaBounds §3.2, cited), the duplication formula (CharacterSumsOverFiniteFields §3.4, cited), the Fourier–Bessel expansion for `PSL₂(ℤ[i])` (MaassForms §7.3; §8.2 here is the form with a character), Eisenstein continuation for reductive groups (AutomorphicSpectralTheory §1.15a; §8.4 here is the Kubota-character case), the least nonresidue (SieveMethodsAndPrimePatterns §2.9, cited), classical zero-free regions (ZerosOfLFunctions Layer 6; the half-plane is here); each has one owner.

**Remarks that need no change.** The hypothesis `0 ≤ σ₀` of the transfer is redundant in logic
(for `σ₀ < 1/2` the hypothesis on `K` is false) but it is what the route uses and the README says
so. The five manifest entries the README does not cite have empty `cited_for`. The `module` header
of the Lean file is the one 111 roadmaps on main use.

Source independence: 27 passages compared with 9 sources, no sentence shared, four runs of 5 to 7 words (R02); largest share `openai2026quasiRH`, 58 of 128 locators; contents compared with `openai2026quasiRH`: independent (its §§4.1–4.4 are split over Layers 2, 4, 3, 5 in another order, its §8 is Layer 7 and precedes its §5 as Layer 9, Layer 6 gathers its Lemma 6.1, §5.4 and §9.1, Layer 8 has no counterpart, and the order inside Layer 10 is forced by the Needs lines of §§10.2, 10.3, 10.5–10.7).

Research link: the headline targets are Theorem 3.1 and Corollary 1.2 of OpenAI 2026 (unrefereed), with Liu 2026 a second account; they build on Kubota 1969, Patterson 1977, Heath-Brown 2000, Goldmakher–Louvel 2013 and Blomer–Goldmakher–Louvel 2014, and settle Vinogradov's conjecture as stated in Tao 2015; README Summary and References, and `openai2026quasiRH` pp. 4–10.

## Not verifiable

- The conjugation bars in §8.7's coefficients `τ` and in the identity of §4.6: the extractions of
  `patterson1977`, `dunnradziwill2024` and `openai2026quasiRH` are OCR or layout text that drops
  overlines (`dunnradziwill2024` lines 1238–1250, `openai2026quasiRH` line 703). The README's own
  numerical Checks on them were recomputed and agree; the source side could not be read.
- `patterson1977` §§7–8 (the converse theorem and Theorem 8.1) beyond the page map, `kubota1968`,
  `goldmakherlouvel2013`, `bgl2014`, `heathbrown2000`, `baierbansal2018`, `gaozhao2024`,
  `maynardpratt2024`, `guthmaynard2026` and `lamzourilisound2015`: outside the seeded sample and
  not opened this round. Layers 6 and 8 were reviewed for internal consistency and computed Checks
  only.
- The two Tau Ceti modules named above are not built, so their two names were read, not elaborated.
- Truth of the headline theorems: they rest on unrefereed preprints; the review checked statements,
  conventions and closed-form constants, not the proof.

## Source issues

- **Misprint** in openai2026quasiRH at Lemma 6.2, proof, printed p. 49: the source says, as the OCR text reads, the fractions are separated by `min(1, r₊)/Y`; it should be `min(1, 1/r₊)/Y`, which is what its inequality `1/|ss'| ≥ 1/(r₊Y)` gives; affects the proof.

## For the human reviewers

- **Scope.** The headline theorem rests on `openai2026quasiRH` and `openai2026quasiRHalt`, which the manifest records as unrefereed and machine-written, and on `liu2026improved`, an unrefereed arXiv preprint; no refereed source states the `11/12` half-plane.
- **Licence.** `openai2026quasiRH` and `openai2026quasiRHalt` were read from a company's public code repository, recorded as `author-page`; the manifest states no licence for either text.
- **Scope.** The roadmap stops at `11/12` and names QuasiRiemannHypothesisPartII as owner of the `7/8` stage (README lines 132–137); no roadmap of that name exists on main or among the open pull requests.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "73f7bcb60ecd0056ce5ff6522c6e8f5b9b74f29a", "job": "REV-PKG-QuasiRiemannHypothesis", "model": "fable", "worker": "chris-x29"} -->
