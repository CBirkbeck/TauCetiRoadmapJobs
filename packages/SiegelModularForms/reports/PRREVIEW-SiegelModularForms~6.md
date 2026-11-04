# Review of SiegelModularForms (pull request #1714 at 77069cb)

**Verdict:** needs changes

This head repairs 21 of the 22 findings of the previous review (`788fba7`); the disposition, finding by finding, is tabulated under *Verified sound*. One previous finding (its R14) is repaired only in part and is re-raised below as the single blocking finding. The whole roadmap was then re-read; the new text of 0.2, 0.6, 2.4–2.6, 5.3, 6.3, 6.5, 6.7–6.9, 7.2, 8.2–8.4, 9.8 and 10.1 was checked against the sources and recomputed where numerical.

Source ids name the cache texts: `vdg` (van der Geer, arXiv math/0605346), `pooryuen2015` (arXiv 0912.0049), `arakawa1983` (Manuscripta copy), `aokiibukiyama2005` (journal copy, author page), `hayashidaibukiyama2005`, `ibukiyama1991` (OCR), `satoh1986`, `cvdgg2015` (arXiv 1306.6018), `hayashi2013` (arXiv 1305.1076), `ikeda2006`, `gelbartjacquet1978` (Numdam).

## R01 (P2) — Two dimension formulas are statable on carriers of `Suggested.lean` and are absent

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:1619`–1631 ("State **Tsushima's dimension formula** … its transcription into this roadmap waits only on reading Tsushima's text … until then it is pinned by the acceptance values") and 2766–2770 ("state **Ibukiyama's formula** for `dim S_k(K(p))` … its transcription waits only on reading Ibukiyama's texts"); `TauCetiRoadmap/SiegelModularForms/Suggested.lean:37`–42.

**Claim:** The previous review's R14 asked for the three untranscribed formulas; the two level-two cubics and the weight-four paramodular case are now stated (`finrank_gammaTwo_odd`, `finrank_gammaTwo_even`, `finrank_cusp_paramodular_four`), but Tsushima's quasi-polynomial for `dim S_{k,j}(Γ₂)` and Ibukiyama's quasi-polynomial for `dim S_k(K(p))`, `k ≥ 5`, are still named and not written. The module docstring concedes both are statable on `cuspSubmodule (Gamma 2) (rho k j)` and `cuspSubmodule (paramodularR p) (rho 4 0)`'s siblings; a statable headline that is absent is a defect, and "waits only on reading", "until then", "pinned meanwhile" are process narrative.

**Witness:** `Suggested.lean:37`–42 ("two statable formulas are not stated for a different reason … whose explicit forms the README cites and has not transcribed"); the carriers exist at `Suggested.lean:939` and 417. The sources service, run against a scratch copy of the manifest, finds no PDF link on the Project Euclid landing pages of DOI 10.3792/pjaa.59.139 (Tsushima 1983) and 10.2969/aspm/00710007 (Ibukiyama 1985), and Wakatsuki's trace-formula paper resolves only to a paywalled page.

**Repair:** Transcribe both formulas with their ranges and exceptional weights into 6.4 and 10.1 and state them in `Suggested.lean` on the existing carriers (the quasi-polynomial periodic terms are finitely many case splits on residues of `k` and `j`, or of `p`). Both journals are open access on Project Euclid: request the texts through the worker's `needs-references` so a human names the legal copy, and record each as `uncertified` only if none is named. Replace the process sentences by a timeless statement of what is proved and what is cited; the Checks (the seven table values and the `j = 0` column, the weight-four values) stay.

## R02 (P3) — `GSp₄⁺(ℝ)` already has an owner in the merge order

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:35`–37, 156, 374–376, 459–465.

**Claim:** `AutomorphicFormsOnReductiveGroups` §6.4 constructs `G⁺ = {g : ν(g) > 0} = ℝ_{>0}·Sp₄(ℝ)` (its planning API `positiveSimilitude`), and `MetaplecticAutomorphicForms` 8.11 consumes it from there ("AutomorphicFormsOnReductiveGroups §6.4 owns `GSp₄⁺(ℝ)` (`positiveSimilitude`), which 8.11 writes in BFH's coordinates"). This roadmap owns `GSp⁺_{2g}(R)` for every `g` and cites only `ClassicalGroupsPartII` CG.0.1 and MAF 8.11–8.12; the earlier owner of the degree-two real group is not named, so two roadmaps plan `GSp₄⁺(ℝ)`.

**Witness:** `AutomorphicFormsOnReductiveGroups` README at its open head, §6.4 first paragraph and the "Expose `positiveSimilitude`" paragraph; `MetaplecticAutomorphicForms` README at its open head, supplier table row for AutomorphicFormsOnReductiveGroups ("§6.4 `GSp₄⁺(ℝ)`, its `positiveSimilitude` carrier and multiplier") and 8.11.

**Repair:** In *Not owned here* and the supplier contracts name `AutomorphicFormsOnReductiveGroups` §6.4 as the owner of `GSp₄⁺(ℝ)` with its multiplier, keep the general-`g` `GSpPos g R` here with the one-clause difference (every `g`, every ordered field), and state in 0.2 the comparison `GSpPos 2 ℝ = positiveSimilitude` as a Check, exactly as 0.3 states `ℍ[2] = SiegelSpace` for MAF 8.10.

## R03 (P3) — `Θ_{2g,k}` is not inside `S_k(Γ_g)` at `k = g`

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:2314`–2316: "write `Θ_{2g,k} ⊆ S_k(Γ_g)` for the span of the theta series `θ_{L,P}^{(g)}` … pluriharmonic `P` of weight `det^{k−g}`".

**Claim:** The criterion is stated for cusp forms with `k ≥ g`; at `k = g` the coefficient weight is `det⁰`, the span contains the unweighted `θ_L^{(g)}`, and 5.3 makes `θ_{L,P}` cuspidal only for `λ_g ≥ 1`.

**Witness:** `g = 4`, `k = 4`, `L = E₈`, `P = 1`: `θ_{E₈}^{(4)} ∈ M_4(Γ₄)` has constant coefficient `1` (5.1's Check), so it is in the displayed span and not in `S_4(Γ₄)`.

**Repair:** Define `Θ_{2g,k}` as that span inside `M_k(Γ_g)` and state the criterion for cusp eigenforms `F ∉ Θ_{2g,k}`, or define it as the intersection with `S_k(Γ_g)`; note that for `k > g` the span is cuspidal by 5.3 (`ν = k − g ≥ 1`).

## R04 (P3) — A residue is a number, not a Petersson projection

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:2317`–2321: "the residue of `Δ(s, F)` at `s = 1` for `F ∈ Θ_{2g,k}` is the Petersson projection of `F` to `Θ_{2g,k}`, computed by the Rallis inner-product identity".

**Claim:** The left side is a scalar, the right side a modular form; for an eigenform `F ∈ Θ_{2g,k}` the projection is `F` itself, so the sentence does not say what the target is.

**Witness:** The sentence itself; the only consumer, 8.4 ("`{1}` exactly when the residue target of 8.3 is nonzero"), reads the residue as a scalar.

**Repair:** State the target as a scalar: the residue at `s = 1` is the value the Rallis inner-product identity assigns to `F` from its Petersson projection to `Θ_{2g,k}` (a product of `⟨F, F⟩`, local zeta integrals and the Siegel–Weil constant), and it vanishes when the projection is zero; keep "whose value decides the polar divisor of 8.4".

## R05 (P3) — Three page locators are off

**Location:** `TauCetiRoadmap/SiegelModularForms/README.md:2282` ("Arakawa 1983, the Theorem on p. 157"), 1759 and 3301 ("Aoki–Ibukiyama 2005, Theorem 4.1, journal p. 262"), 3300 ("Proposition 2.1, p. 252").

**Claim:** The theorem of Arakawa is on p. 158; in Aoki–Ibukiyama, Proposition 2.1 is on p. 251 and Theorem 4.1 on p. 257 (Theorem 5.1 on p. 261 is right).

**Witness:** `arakawa1983 line 92` (the Theorem) lies on the file page whose footer is "158" (`line 111`), the previous page ending with "157" (`line 85`); `aokiibukiyama2005` file page `n` carries the journal header `248 + n` (`line 45`: "250", `line 158`: "252", `line 524`: "258", `line 700`: "262"), Proposition 2.1 is at `line 151` on page 3, Theorem 4.1 at `line 480` on page 9, Theorem 5.1 at `line 691` on page 13.

**Repair:** Write p. 158, p. 251 and p. 257 at the three places (the reference entry at 3300–3301 included).

## R06 (P3) — The Lean docstring still calls `O_g(m)` a semigroup

**Location:** `TauCetiRoadmap/SiegelModularForms/Suggested.lean:1219`: "The semigroup `O_g(m)` of integral similitudes of multiplier `m`".

**Claim:** 0.2 now says `O_g(m)` is a set, not a semigroup, with the Check `diag(1, 2)² ∈ O₁(4) ∖ O₁(2)` (README 489–491); the docstring contradicts the README it points to.

**Witness:** README 156 and 472–476 versus the docstring.

**Repair:** "The set `O_g(m)` …" in the docstring.

## Verified sound

### Disposition of the previous review's findings on this head

| Previous | Status | Where, and what was checked |
|---|---|---|
| R01 pole "iff", rank `2k` | Repaired | README 2312–2337: sufficient direction only, rank `2g` with pluriharmonic coefficients, converse cited and not used; `vdg line 1770`–1773 says exactly this; `Δ` Check at 2374–2379 (`gelbartjacquet1978 line 2151`–2154, Theorem 9.3 (1), journal p. 534) |
| R02 `χ₁₉` signs | Repaired | README 1801 `(+, −, −, +)`; `ibukiyama1991 line 593`; recomputed below: translation invariance holds for the corrected form and fails for the all-plus form |
| R03 Taylor sequence | Repaired | README 1562–1569 has `0 → M_k^{≥2n+2} → M_k^{≥2n} → Sym²(M_{k+2n}^{≥n}(Γ₁)) → 0`, Check 1591–1594 |
| R04 arithmeticity | Repaired | README 584–586 `Γ_g(N) ≤ Γ ≤ Γ_g`, Check 605–607 |
| R05 Gaussian | Repaired | README 1352–1361: `(−i)^d det(Y)^{−m/2} ρ(Y⁻¹) P(Ξ) exp(−π tr(ΞᵀΞ Y⁻¹))`; rederived by the substitution `X = W Y^{−1/2}` (values below) |
| R06 odd-`k` summand | Repaired | README 1113–1118 and 1126–1131 |
| R07 pinned hypotheses | Repaired | README 262–270, 431–435, 465–470: `[Field K]` and `[Unique l]` stated, integral generation and `det = μ^g` owned (Pfaffian route) |
| R08 7.6 ↔ 11.2 cycle | Repaired | 7.6 *Needs* (2163) no longer lists 11.2; 11.2 *Needs* (3078) lists 7.6 |
| R09 zero eigenform | Repaired | README 2018; `Suggested.lean:1296` `f ≠ 0 ∧ …` |
| R10 odd `ψ₄` weights | Repaired | README 1856–1861, Checks 1893–1900; `hayashidaibukiyama2005 line 288`–290 |
| R11 missing headlines | Repaired | `isSingular_iff` (`Suggested.lean:890`), `exists_eigenform_basis` for every `ρ` (1307), `exists_equiv_modularForm_degreeOne` (679); 3.4 Petersson remains in the docstring as not statable |
| R12 Arakawa hypothesis | Repaired | README 2281–2286, Check 2389–2393; `arakawa1983 line 92`–96 |
| R13 level `0` | Repaired | README 579–581, 600–602, 3013–3019; `Suggested.lean:384`–387 |
| R14 untranscribed formulas | Partly | CvdGG cubics (README 1673–1678, `Suggested.lean:1199`, 1211; `cvdgg2015 line 934`–944) and Poor–Yuen weight four (README 2770–2775, `Suggested.lean:1400`; `pooryuen2015 line 235`–239) stated; Tsushima and Ibukiyama `k ≥ 5` absent: R01 above |
| R15 constant term | Repaired | README 874–876, Check 888–891 |
| R16 Schottky locus | Repaired | README 1922–1930 (closure), Check 1940–1944 |
| R17 pluriharmonic "iff" | Repaired | README 1365–1370 (`P ≠ 0`, irreducible `ρ`), Check 1406–1408; the argument via the torus weight `λ_g` checked below |
| R18 parity genus | Repaired | README 730–733, 755–759; `Suggested.lean:633`–638 |
| R19 locators | Repaired | Proposition 2.1 (README 1529, `aokiibukiyama2005 line 151`–153), Theorem 4.1 for 6.6 (`line 480`–490), Theorems A and C for 6.7 (`ibukiyama1991 line 569`, 598), Hayashi Theorem 1.1 for 9.8 (`hayashi2013 line 56`–66); page numbers R05 above |
| R20 semigroup | Repaired in the README | README 37, 156, 472–476, Check 489–491; the Lean docstring R06 above |
| R21 backticked names | Repaired | `IsotypicDecomposition`, `IsGritsenkoLift`, `IsIkedaLift`, `MiyawakiII`, `ParamodularConjecture`, `StrongMultiplicityOne` are prose now; a scan of every backticked CamelCase or underscore name in the README finds none of this roadmap's own undeclared |
| R22 Weissauer weight | Repaired | README 2239–2244, 2350–2353 (`k ≥ 3`) |

No repair report marked a finding "not actionable in this package".

### Gate, elaboration, probe, signatures and dependency direction

The worker's gate at this head reports every check `0` and `OK`; the outside-folder diff is empty and the worktree clean. `lake env lean TauCetiRoadmap/SiegelModularForms/Suggested.lean` elaborated in 12 s with exactly 70 `declaration uses sorry` warnings and nothing else.

Padding probe: a scratch copy with each `:= sorry` replaced by `by first | (simp; done) | rfl | infer_instance | (decide; done) | (norm_num; done) | sorry` elaborated with 70 `sorry` warnings remaining: no admitted declaration closes by a one-tactic probe. The five signatures flagged for dropped binders (`extendZero`, `fourierCoeff`, `phi`, `gram`, `siegelTheta`) are definitions whose bodies need only an additive carrier, a Bochner integral, a limit, an inner product and a `tsum`; every theorem about them (`hasSum_fourier`, `fourierCoeff_isBigO`, `fourierCoeff_siegelTheta`, `siegelTheta_symJ_smul`, `exists_eigenform_basis`) carries `[FiniteDimensional ℂ V]`, `[IsZLattice ℝ L]` or `[FiniteDimensional ℝ E]` in its elaborated type. The new declarations elaborate as the README states them: `exists_equiv_modularForm_degreeOne` for `Γ ≤ Sp₂(ℝ)` arithmetic and every `k`, with the `HasDetOne` instance from `map_spOneToGL_hasDetOne`; `isSingular_iff` with `0 < g`, `f ≠ 0`; `finrank_gammaTwo_odd` with `(3 ≤ k ∧ 2 ≤ j) ∨ (5 ≤ k ∧ j = 0)`; `finrank_gammaTwo_even` with `4 ≤ k`, `2 ≤ j`; `finrank_cusp_paramodular_four` with `p.Prime`, `5 ≤ p`.

Dependency check, run with the candidate order, `--movable` and main:

```text
depcheck: 203 roadmaps, 1656 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line names this roadmap.

### Seeded source sample

| Target | Text and result |
|---|---|
| 0.1 | `vdg line 255`–264 (Exercise 2.2: `Γ_g` generated by `n(s)` and `J`); `TorusGeneration.lean:140`–145 is `[Field K]` as 0.1 now says; `SymplecticGroup.det_eq_one` found at the pin. Statement as cited |
| 2.5 | `vdg line 442`–443 (Theorem 4.3, boundedness on `Im τ > c·1`, printed p. 11), 475–482 (Corollary 4.5 and its proof with `det(y)^{k/2}|f|`); `arakawa1983 line 253` ((1.6), the weighted cusp estimate). The route is a sketch; the `det(T)^k` and `det(T)^{k/2}` bounds are the classical ones |
| 3.4 | `vdg line 534`–546 (Petersson product with `(ρ(Im τ) f₁, f₂)` and `det(y)^{−(g+1)} ∏ dx dy`, convergence from one cusp form, `N_ρ = S_ρ^⊥`); matches 3.4; not statable (3.3), named in the docstring |
| 4.1 | `vdg line 577`–587 (`E_{g,0,k} = Σ det(cτ+d)^{−k}` over `GL(g,ℤ)\Γ_g`, Theorem 5.4 with `k > g + r + 1` even, Braun for `r = 0`), 595–596 (Corollary 5.5, `Φ` onto for even `k > 2g`). The odd-`k` paragraph is now the representative-independence statement; checked below |
| 6.2 | `aokiibukiyama2005 line 151`–153 (Proposition 2.1: the bracket of `n+1` forms is a cusp form of weight `Σk_i + n + 1`, nonzero for algebraically independent inputs), on p. 251 (R05) |
| 6.4 | `satoh1986 line 203`–210 (Theorem 2.2, the six summands with `V_k = M_k ∩ ℂ[φ₆, χ₁₀, χ₁₂]`, `W_k = M_k ∩ ℂ[χ₁₀, χ₁₂]`, printed p. 340); `vdg line 2262`–2272 (§25 table): the seven README values `1, 1, 1, 2, 3, 2, 1` and the `j = 0` column `0, 0, 0, 1, 1, 1, 2` read off; Tsushima 1983 unreadable (R01) |
| 6.6 | `ibukiyama1991 line 186`–188 (Theorem 4, p. 22: `A(Γ₀(3)) = ℂ[α₁, β₃, γ₄, δ₃]^{(2)}`); `aokiibukiyama2005 line 480`–490 (Theorem 4.1: algebraic independence, `B ⊕ Bχ₁₄` on the kernel of `ψ₃`, `B^{even} ⊕ Cα₁χ₁₄ ⊕ Cβ₃χ₁₄ ⊕ Cδ₃χ₁₄ ⊕ Cα₁β₃δ₃χ₁₄`, `B^{odd} ⊕ B^{even}χ₁₄`), on p. 257 (R05). The Hilbert values recomputed below |
| 6.7 | `ibukiyama1991 line 569`–576 (Theorem A), 589–600 (odd weights: `A_k(B(2)) = 0` for odd `k ≤ 9`, `0` for odd `k ≤ 17` on the level-two group, `θ'` with `(+, −, −, +)`, `χ₁₁ = θθ'`, Theorem C). The `χ₁₉` bracket recomputed numerically below |
| 8.1 | `vdg line 1740`–1757 (spinor and standard factors), 1673–1683 (the quartic `X⁴ − T(p)X³ + (T(p)² − T(p²) − p²T₂(p²))X² − p³T(p)T₂(p²)X + p⁶T₂(p²)²` and the generating identity `Σ T(p^i)z^i = (1 − p²T₂(p²)z²)/(z⁴F(1/z))`); with `T₂(p²) = p^{2k+j−6}` these are 8.1's identities |
| 8.2 | `vdg line 1760`–1761 (`Z_f(s) = ζ(2s − j − 2k + 4) Σ λ(m) m^{−s}`); `arakawa1983 line 246`–254 (§1.3, (1.6)); Weissauer uncertified, `k ≥ 3` now stated |
| 8.4 | `vdg line 1774`–1776 (`Φ_f(2k − 2 − s) = (−1)^k Φ_f(s)`), 1767–1773 (`Δ(f, s) = Δ(f, 1 − s)`, poles at `0, 1`, holomorphic off the rank-`2g` theta span); the exported polar divisors follow 8.3 as now stated |
| 8.5 | `TauCetiRoadmap/LFunctions/README.md:348`–390 on main: `AnalyticLFunctionData`, `ArithmeticLFunctionData` with `coeff_zero`, `NormalizationTranslation` shifting by `w/2`; the two-record export matches |
| 9.8 | `ikeda2006 line 77`–83 (Theorem 1.1: `L(s, F, st) = L(s, g, st) ∏_{i=1}^{2n} L(s + k + n − i, f)`); `hayashi2013 line 56`–66 (Theorem 1.1) with `line 200`–203 (`β(r, m, n) = α(r, m, n) − α(r, m − 2, n)`): at `n = 2`, `m = 1`, `r = ±1`, `β = 1`, giving `L(s, g ⊗ sym¹ f) L(s − k, g) L(s − k + 1, g)` in Hayashi's `k` (`f ∈ S_{2k}`), which is the README's `L(s, f ⊗ g) L(s − k + 2, g) L(s − k + 3, g)` with `k + 2` for `k`; `vdg line 1947`–1955 (Conjecture 21.3) as cited |
| 10.4 | Roberts–Schmidt 2006 and 2007 are not in any legal cache: not verifiable |
| 11.3 | `vdg line 1688`–1718 (§19: `α₀²α₁⋯α_g = p^{Σλ_i − g(g+1)/2}`, Eisenstein `(1, p^{k−i})`, `(β, β̄/β)` for `g = 1`), 1841–1845 (Theorem 21.1); the three tuples and their distinctness checked below |

### Pinned declarations opened

`TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/TorusGeneration.lean:140`–145 (`variable {K : Type u} [Field K]`, `eq_top_of_root_subgroups`); `TauCeti/LinearAlgebra/Matrix/SymplecticMultiplier.lean:58`, 84–86 (`[Unique l]`, `det A = d`); `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104` (`Newform N k`, `[NeZero N]`); `Mathlib/NumberTheory/ModularForms/Basic.lean:72`–74 (`ModularForm` with `bdd_at_cusps'` over the cusps of `Γ`) and `SlashInvariantForms.lean:201` (`instModuleComplex [Γ.HasDetOne]`, the instance the degree-one comparison needs); `Mathlib/NumberTheory/LegendreSymbol/JacobiSymbol.lean:86` (`jacobiSym`); `Mathlib/Algebra/Module/ZLattice/Covolume.lean:72` (`covolume`); `Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean:37` (`dualSubmodule`); `Mathlib/Analysis/InnerProductSpace/Basic.lean:146` (`innerₗ`). No `Suggested.lean` on main or at the open heads whose files the brief gives declares a Siegel half-space, a positive similitude group, a paramodular group, a Siegel theta series or a singular-form predicate (`roadmaps grep --lean-only` on `SiegelHalfSpace|GSpPos|paramodular|siegelTheta|IsSingular|Siegel`: no match outside this folder); the AutomorphicFormsOnReductiveGroups `Suggested.lean` at its open head states one theorem and no similitude group, so R02 is a prose-ownership citation, not a duplicate declaration.

### Supplier citations resolved

| Supplier | Where resolved |
|---|---|
| ThetaSeries (main) | Layer 1 `poissonSummation`, `gaussian`, `fourier_gaussian` (README 126), 2E `level` (533), 3A `thetaSeries` (591), Layers 5 and 7 headings (673, 854), 6F `χ_L` (830) |
| IntegralLattices (main) | Layer 2 reduction (767), 6D `E₈²`, `D₁₆⁺` (127–128) |
| ModularForms (main) | Layer 2 Hecke (383), Layer 3 Petersson/oldforms (481), Layer 4 newforms (532), Layer 7 `L`-functions (708), Layer 9 Satake parameters (971, 980) |
| LFunctions (main) | Layer 0 (348–390) |
| ClassicalGroupsPartII (#1492) | CG.0.1 (README 318) |
| HalfIntegralWeightModularForms (#1721) | 6.1 (1563), 6.2 (1601), 6.3 (1636, `J^{cusp}_{k,1} ≅ S_{2k−2}`), 6.4 (1684, `V_l`, Skoruppa–Zagier) |
| LatticePackingsAndPerfectForms (#1723) | 5.6 (1459) |
| HyperellipticCurves (#1707), AbelianVarietiesOverFiniteFields (#1720) | 5.3 (2093), 5.6 (2168); 1.3 (495) |
| AutomorphicLFunctionsAndLocalFactorsPartII (#1756) | 9.1–9.3 (1533, 1570, 1604) |
| QSeriesPartitionsAndMockModularForms (#1391) | 9.1 (1358) |
| MetaplecticAutomorphicForms (#1063, `roadmaps show`) | 6.18 `jacobiSpace` (1769), 6.20 `jacobi_thetaDecomposition` (1805), 8.10 `SiegelSpace` (2491), 8.11 (2507, with `Im(gZ) = μ(C Z̄ + D)⁻ᵀ Im Z (CZ + D)⁻¹`), 8.12 (2522), 8.18 (2609), 8.19 (2625), 8.76–8.80 (3309–3374) |
| AutomorphicFormsOnReductiveGroups (#1037) | 3.1 `classicalEquiv` (525–529), 3.2 (542); 6.4 `positiveSimilitude` (1024–1030): R02 |
| AdelicAlgebraicGroups (#792) | 2.2 (1658), 2.3 (1824) |
| SmoothRepresentationsOfLocalGroups (#1688) | SR.0.1 (580), SR.0.3 (738), SR.0.4 (842), SR.1.1–SR.1.3 (1023, 1193, 1272) |
| PELModuli (#966), ShimuraCompactifications (#1053) | M5 `siegelModuli` (3532), M6 `siegelStack` (46); 2.8 (1339), 7.16 (2577) |
| LevelOneAutomorphicFormsForClassicalGroups (board design, `packages/…/design/README.md`) | LO.6/higher-genus-theta (1676: unweighted genus-`g` theta map, constant coefficient `1`, `Φ_g θ_g = θ_{g−1}`), LO.6/harmonic-theta (1702), LO.6/boecherer-criterion (1756) |

Every supplier is on main, earlier in the merge order, or a sibling the merge order does not list yet. The siblings citing this roadmap (`HalfIntegralWeightModularForms`, `LatticePackingsAndPerfectForms`, `HilbertModularForms`, `HilbertModularSurfaces`) do so in scope or downstream prose only, so the dependency check's `0 problem(s)` stands.

### Headline inventory

End theorems of the README: Fourier expansion and Koecher; coefficient bounds; the singular-form theorem; `Φ`, cusp forms, finite dimensionality; Siegel and Klingen Eisenstein series with the Maass–Cohen formula; theta inversion, pluriharmonic theta series, theta constants; Igusa, Satoh, Tsushima, the `Γ₂(2)`, `Γ₀(2)`, `Γ₀(3)`, `Γ₀(4)` rings, degrees three and four; the Hecke algebra, eigenbasis, Satake parameters, coefficient formula; the two `L`-functions with continuation; Maass lift, Saito–Kurokawa, Gritsenko, Ikeda, Miyawaki; paramodular newforms, level 277, Ibukiyama's paramodular dimensions, the paramodular conjecture; integrality and coefficient fields. Stated in Lean: expansion and uniqueness, Koecher, both bounds, the singular-form theorem, the degree-one comparison, cusp criterion, finite dimensionality and the trace bound, even-rank theta inversion and coefficients, Eisenstein membership, Igusa even/odd with the Hilbert coefficient, Satoh with its coefficient, the two level-two cubics, the vector-valued eigenbasis, the `T(p)` coefficient formula, the Maass dimensions, Saito–Kurokawa, `dim S_2(K(277)) = 11`, the weight-four paramodular formula, integrality and the number field. Named not statable with the missing carrier: Petersson and its complements, Maass–Cohen and the Jacobi Eisenstein series, Klingen, odd-rank theta, the level rings, Satake, the `L`-functions, the Jacobi side, Ikeda and Miyawaki, the paramodular theory. Statable and absent: Tsushima's and Ibukiyama's quasi-polynomials (R01).

### Adversarial values

Exact arithmetic unless decimals are shown; theta constants are 27 × 27 lattice sums in genus two.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 0.2 `det = μ^g` | `diag(1₂, 2·1₂)`; `diag(1_g, −1_g)`, `g = 2` | `μ = 2`, `det = 4`; `μ = −1`, `det = 1 > 0` | Pass; `det > 0` does not detect `μ` |
| 0.2 `O_g(m)` | `diag(1,2)²` | multiplier `4` | not closed; Pass (README); Lean docstring R06 |
| 0.6 arithmeticity | `Γ = Sp₂(ℝ) ⊇ SL₂(ℤ)` | `[Γ : Γ ∩ Γ₁] = ∞` | upper bound needed; Pass |
| 0.6 level `0` | `N = 0` | `Γ_g(0) = {1}`, `−1 ∉`, index `∞` | guarded by `N ≥ 1`; Pass |
| 0.6 orders | `g = 2`, `p = 2, 3` | `720`, `51840`; `15`, `40` | Pass |
| 1.3 parity control | `det⁰ ⊕ det¹`, `g = 1` vs `g = 2` | `diag(1, −1)` vs `diag(1, 1)` | Pass |
| 2.4 constant term | `θ_{A₂}^{(2)}` on `Γ₂(3)`, `U = diag(−1, 1)` | `det(U)·1 = −1`, `m(U) ∉ Γ₂(3)` | Pass |
| 2.5 integrand modulus | `Y = T⁻¹` | `|e(−tr(T(X + iY)))| = e^{2π tr(TT⁻¹)} = e^{2πg}` | Pass |
| 2.6 singular theorem | `g = 1`, `k = 0`; `g = 2`, `k ≥ 1`; `θ_{E₈}^{(g)}`, `g = 8, 9` | `0 < 1` true, constants singular; `2k < 2` false; rank `≤ 8`, `8 < 8` false, `8 < 9` true | Pass |
| 3.1 `Φ` on `ρ_{k,j}` | `diag(a, 1)` on `X₀^j` | `a^{k+j}` | weight `k + j`; Pass |
| 4.1 odd `k` | `g = 2`, `k = 5`, `(0, 1₂)` vs `(0, diag(−1, 1))` | `1`, `−1` | not a function on the quotient; Pass |
| 4.2 Cohen values | `B_{3,χ₋₃} = 9(B₃(1/3) − B₃(2/3))`, `B_{3,χ₋₄} = 16(B₃(1/4) − B₃(3/4))` | `2/3`, `3/2`; `H(3,3) = −2/9`, `H(3,4) = −1/2`; `c(3) = 56`, `c(4) = 126`; `240·56 = 13440`, `240·126 = 30240` | Pass |
| 5.3 Gaussian law | `X = W Y^{−1/2}` | `tr(XᵀXY) = tr(WᵀW)`, `dX = det(Y)^{−m/2} dW`, `P(X) = ρ(Y^{−1/2})P(W)`, `P(ΞY^{−1/2}) = ρ(Y^{−1/2})P(Ξ)`, total `ρ(Y⁻¹)`; `m = g = 1`, `Y = 2`: ratios `0.7071`, `78.71` | Pass |
| 5.3 cuspidality iff | `P ≠ 0`, irreducible `ρ`: span of values is `ρ`-stable, hence `V`; weights `μ` of `V_λ` have `μ_g ≥ λ_g` with equality at `λ` | `ρ(diag(1,…,t))v → 0 ∀v` iff `λ_g ≥ 1`; `P = 0`: vanishing with `λ_g = 0` | Pass with `P ≠ 0` |
| 5.4 squared `S`-law | `g = 1`, `τ = 2i`; `τ = i` | `θ₀₀(i/2)²/θ₀₀(2i)² = 2.0000`; `1` | Pass |
| 6.3 Hilbert series | `k = 0, …, 24` even; `35, 37, 39` | `1,0,1,1,1,2,3,2,4,4,5,6,8`; `1, 0, 1` | Pass |
| 6.3 Taylor kernel | `k = 10`, `n = 1` | `χ₁₀ ↦ Δ ⊗ Δ ≠ 0`, kernel `M_{10}^{≥4} = 0` | Pass |
| 6.4 bracket | `Φ[ψ₄, ψ₆]` at `q`, `q²` | `240/4 + 504/6 = 144`; `(4320 − 120960)/4 − (−33264 − 120960)/6 = −3456 = 144·(−24)` | Pass |
| 6.4 Satoh dims | `k = 10, …, 22, 28` | `1, 0, 2, 3, 3, 4, 7, 12` | Pass |
| 6.4 Tsushima values | `vdg line 2263`–2272 | `(8,6), (10,4), (14,2), (16,2), (20,2), (12,6), (6,12)`: `1, 1, 1, 2, 3, 2, 1`; `j = 0`: `0,0,0,1,1,1,2` | Pass; formula R01 |
| 6.5 cubics | `(3,2)`, `(5,0)`, `(7,0)`, `(9,0)`, `(3,0)`; `(4,2)`, `(4,0)`, `(6,2)`, `(4,4)` | `0, 1, 5, 15, −1`; `15, 0, 56, 35`; `S_{4,2} = 15 − 15 = 0`, `S_{6,2} = 56 − 30 = 26`, `S_{4,4} = 35 − 30 = 5` | `(3,0)` and `(4,0)` excluded by the ranges as stated; `dim M_{k+5} = dim M_k` at `5, 7, 9` vs `1, 5, 15`; Pass |
| 6.5 scalar formula | `k = 0, 2, 4, 6` | `1, 5, 15, 35` | Pass |
| 6.6 Hilbert values | `1/((1−t)(1−t³)²(1−t⁴))` | even `k ≤ 8`: `1, 1, 4, 7, 10`; odd `k = 1,3,5,7`: `1, 3, 4, 9` | Pass |
| 6.7 `θ'` signs | `τ = i[[1.2,.2],[.2,1.5]] + [[.1,.05],[.05,−.2]]`, `τ ↦ τ + diag(0,1)` | `X, Y, Z, K, T` invariant to `10⁻¹⁷`; `χ₁₉ = −2.890·10⁻¹³ + 3.335·10⁻¹³ i` both (modulus `4.41·10⁻¹³`); all-plus form `1.718·10⁻¹²` → `1.723·10⁻¹²` with opposite sign | Pass |
| 6.7 lower unipotent | `C = diag(2, 0)`, `γ • τ = τ(Cτ + 1)⁻¹` | ratios `X: −4.32 + 5.76i = det²`, `Y, Z, T = det⁴`, `K = det⁶`, `χ₁₉ = det¹⁹` (`−8.0555·10⁷ + 1.13924·10⁸ i`) | Pass |
| 6.7 Hilbert | `1/((1−t²)(1−t⁴)²(1−t⁶))` | `1, 1, 3, 4, 7` | Pass |
| 6.8 `g₂(2Ω) = X` | same `τ` | `1.0109484 + 0.0056222i` both | Pass |
| 6.8 `f₃` swap | `diag(2i, 4i)` ↔ swapped | `0.9925026430` both; variant `1.0074415597`, `0.9925303330` | Pass |
| 6.8 series | `(1+t⁴)(1+t¹¹)/((1−t²)³(1−t⁶))`; `(t¹²+t¹⁴)/…`; `1/((1−t)(1−t²)²(1−t³))` | `1, 3, 7, 14, 24`, `k = 11`: `1`; `0, 1, 4`; `t`: `1`, `t³`: `4`; even part `(1+t⁴)/((1−t²)³(1−t⁶))` by `(1−t)(1−t³)(1+t)(1+t³) = (1−t²)(1−t⁶)` | Pass |
| 6.9 Tsuyumine | `N(t)` palindromic; `k = 4, …, 20` | palindromic true; `1, 1, 1, 2, 4, 3, 7, 8, 11` | Pass |
| 6.9 Schottky | `diag(i,i,i,i)` | both theta series `E₄(i)⁸`, `J = 0` | closure; Pass |
| 7.1 coset counts | `p = 2, 3` | `15, 120, 30, 1` (`151`); `40, 1080, 120, 1` (`1201`) | Pass |
| 7.3 adjoint factor | cubic `χ` mod 7, `χ(3) = ω` | `2 = 3² mod 7`, `χ(2) = ω²`, `T₂* = ω⁻²T₂ = ωT₂` | Pass |
| 7.4 central action | `ρ_{k,j}`, `T₂(p²)` | `p^{2e}ρ(p)⁻¹ = p^{4k+2j−6−2k−j} = p^{2k+j−6}` | Pass |
| 7.4 Eisenstein | `ψ₄`, `ψ₆` at `2`; `ψ₄` at `3` | `(1+8)(1+4) = 45`, `(1+32)(1+16) = 561`, `(1+27)(1+9) = 280` | Pass |
| 8.1 quartic | `vdg line 1677` with `T₂(p²) = p^{2k+j−6}` | `X²`: `λ(p)² − λ(p²) − p^{2k+j−4}`; `X³`: `λ(p)p^{2k+j−3}`; `X⁴`: `p^{4k+2j−6}` | Pass |
| 8.2 bounds | `(k,j)`: `2a − w`; `ψ₆`; `E_{2,1,12}(Δ)`; `χ₁₀` | `2k + j − (2k + j − 3) = 3`, `Re s > 4`; spin `p⁹`, `Re s > 10`, standard `> 6`; `p^{31/2}`, `> 33/2`, `p¹⁰`, `> 11`; `8, 9, 17/2, 17/2`, `> 10`; `0, ±1/2`, `> 3/2` | Pass |
| 8.3 SK standard factor | `(p^{k−2}, βp^{2−k}, β̄p^{2−k})` | `α₁⁻¹ = β̄p^{1−k}`, factor `(1−X)Q_p(f, p^{2−k}X)Q_p(f, p^{1−k}X)`, so `ζ(s)L(s+k−2, f)L(s+k−1, f)`; `k = 10`: `L(9, f₁₈) = 0` by root number `(−1)⁹` | entire; Pass |
| 8.3 `Θ_{2g,k}` at `k = g` | `θ_{E₈}^{(4)}` | `a(0) = 1`, not cuspidal | R03 |
| 8.3 `Δ` control | degree one, rank 24 | Theorem 9.3 (1) hypothesis = no self-twist; `Θ_{2,k} = 0` | Pass |
| 8.5 standard coefficient | `χ₁₀`, `p = 2` | `α₁ + α₂ = −528/256 = −33/16`, `α₁α₂ = 2¹⁷/2¹⁶ = 2`, `1 − 33/16 − 33/32 = −67/32` | Pass |
| 9.5 SK eigenvalues | `χ₁₀` at `2, 3`; `χ₁₂` at `2` | `−528 + 512 + 256 = 240`; `−4284 + 19683 + 6561 = 21960`; `−288 + 2048 + 1024 = 2784`; `α₀²α₁α₂ = p^{2k−4}·p^{2k−3}·p^{4−2k} = p^{2k−3}` | Pass |
| 9.8 shifts | Ikeda `n = r = 1`, `k ↦ k − 2`; Hayashi `n = 2`, `β(±1,1,1) = 1` | `L(s + k − 2, f)L(s + k − 3, f)L(s, g, st)`; `L(s − k + 2, g)L(s − k + 3, g)L(s, f ⊗ g)` | Pass |
| 10.1 weight-four formula | `p = 5, 7, 11, 13, 17, 19, …, 67` | `576·dim`: `0, 576, 576, 1152, 1152, 1728, …`; dims `0,1,1,2,2,3,3,4,6,8,7,9,8,10,11,16,17` = Table 1 (`pooryuen2015 line 238`–239) | Pass |
| 10.1 formula, swapped symbols | `(3/p) ↔ (−3/p)` at `p = 7` | `448`, not a multiple of `576` | Pass |
| 11.2 `S₃₈` field | discriminant | `194400² + 4·137403408384 = 587404993536 = 2¹⁰·3²·63737521` | Pass |
| 11.3 types | `k = 20`, `p = 2`: Eisenstein `(1, 2¹⁹, 2¹⁸)`, Klingen `(β, β̄/β, 2¹⁸)`, Maass `(2¹⁸, β'2⁻¹⁸, β̄'2⁻¹⁸)` | `α₀²α₁α₂ = 2³⁷` all three; `|β| = 2^{19/2}` not a power of `2`; Maass orbit's `α₀` values `{2¹⁸, 2¹⁹, β', β̄'}` meet Eisenstein's `{1, 2¹⁸, 2¹⁹, 2³⁷}` only if `β' ∈ {1, 2³⁷}`, excluded by `|β'| = 2^{37/2}` | distinct; Pass |
| Lean `isSingular_iff` junk | `k < 0` | `M_k(Γ_g) = 0`, vacuous | Pass |
| Lean `igusa_odd` at odd `k < 35` | `k − 35 = 0` in `ℕ` | `P` constant, `χ₃₅·c = 0 ⟹ c = 0` | Pass |
| Lean `IsHeckeEigenform` | `m = 0`, `p = 0`, `i > g` | `T(0) = 0`, empty double coset, `p·1` | no vacuity; Pass |

## Not verifiable

- Paywalled or unavailable primary texts, cited by locator only: Tsushima 1983 and Ibukiyama 1985 (no PDF link found by the sources service; R01), Ibukiyama 2007, Wakatsuki 2012 (paywalled), Freitag 1983, Klingen 1990, Andrianov 1974, Andrianov–Kalinin 1979, Böcherer 1985 and 1989, Piatetski-Shapiro–Rallis 1987, Mizumoto 1991 (the manifest's `mizumoto1991` record is a different paper, Astala–Zinsmeister, settled as uncertified), Weissauer 2009, Kohnen 2002, Ikeda 2001, Miyawaki 1992, Gritsenko 1995, Roberts–Schmidt 2006 and 2007, Brumer–Kramer 2014 and corrigendum, Igusa 1962, 1964, 1967, 1981, Tsuyumine 1986, Poor–Yuen 2007, Heim 2012, Deligne 1974, Rankin 1939, Cohen 1975, Andrianov–Maloletkin 1975, Maass 1964, 1972, 1979.
- The Eichler–Zagier preprint and Ibukiyama 1991 are OCR scans; theorem numbers and sign patterns are legible, displayed constants were recomputed rather than read.
- Poor–Yuen 2015 was read in the arXiv version; its published page numbers are not certified.
- The LMFDB knowls other than those read in previous rounds were not re-fetched; the 27 leads of the citations file are knowl ids, not Lean names.
- The Böcherer 1989 criterion is cited and not used; the LevelOne design also records that the original theorem was not read.

## Source issues

- **Misprint** in ibukiyama1991 at the Appendix, printed p. 34 (`ibukiyama1991 line 590`): the odd-weight vanishing for `k ≤ 17` is printed for the level-three group; it should read the level-two group `Γ₀(2)` of Theorem C on the same page; affects nothing.
