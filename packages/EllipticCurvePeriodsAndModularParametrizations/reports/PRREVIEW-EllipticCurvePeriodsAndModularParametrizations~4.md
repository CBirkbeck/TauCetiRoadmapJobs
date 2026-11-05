# Review of EllipticCurvePeriodsAndModularParametrizations (pull request #1715 at 2ec386f)

**Verdict:** needs changes

## R01 (P2) — The owned CM-reduction route is false when `p` splits in `K`

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:1633` (“Let p be an odd prime not dividing ND_K”) and 1648–1651 (“every cyclic subgroup of order pⁿ of a conductor-one CM curve A₀ has quotient with endomorphism ring exactly O_n, so C_n is the set of quotients of the conductor-one points by their cyclic pⁿ-subgroups”); the Check at 1727–1729 (“#C_n = h_K pⁿ⁻¹(p+1)”).

**Claim:** For every odd `p ∤ ND_K`, positivity of the number of cyclic `pⁿ`-isogenies `E_v → E_w` on the supersingular set proves that `red_q : C_n → S_q(N)` is surjective for `n ≥ n₀`.

**Witness:** Take `K = ℚ(√−23)`, `p = 3` (`−23 ≡ 1 (mod 3)`, so `3 = 𝔭𝔭̄` splits; the Check at line 1498 uses this `K`). The kernel of `ℂ/O_K → ℂ/𝔭⁻¹` is `𝔭⁻¹/O_K ≅ O_K/𝔭 ≅ ℤ/3`, cyclic of order `3`, and `End(ℂ/𝔭⁻¹) = O_K ≠ O_1 = ℤ + 3O_K`. In general a conductor-one curve has `(p+1)pⁿ⁻¹` cyclic `pⁿ`-subgroups, while `#Pic(O_n)/h_K = pⁿ⁻¹(p − 1)` for split `p` (line 1469's own formula): at `p = 3`, `n = 2` these are `12` and `6`, so at most half of the quotients have conductor `9`. The count `A_n(v, w) > 0` that the route proves therefore only places `w` in `red_q(C_k)` for some `k ≤ n`, not in `red_q(C_n)`. For inert `p` the claim is true (the `O_K`-stable sublattices of `p⁻ⁿO_K` are the `p⁻ᵏO_K`, none with cyclic quotient), and `(p+1)pⁿ⁻¹ = #Pic(O_n)/h_K` as the Check assumes.

**Repair:** Either add “`p` inert in `K`” to the CM-reduction target and choose `p` inert in the subgroup-comparison bullet (lines 1741–1743): Vatsal chooses `p` as an auxiliary prime (vatsal line 1117–1118, author p. 34: “choose an odd prime `p ∤ NDℓ` such that `K, p, ℓ` satisfy §3.1”), and an inert `p` with `ℓ ∤ p + 1` exists by Dirichlet since `ℓ ∤ D_K`; the ring-class section can keep both cases. Or keep split `p` and replace the quoted sentence by an exact-conductor count: with `a_k(v, w)` the number of cyclic `pᵏ`-subgroups of conductor exactly `pᵏ` with quotient `≅ E_w`, `A_n(v, w) = a_n(v, w) + Σ_{j=1}^{n} (a_{n−j}(v_{𝔭ʲ}, w) + a_{n−j}(v_{𝔭̄ʲ}, w))` with `a_0 = δ`, and induction on `n` gives `a_n(v, w) = c_w((p−1)pⁿ⁻¹ + 2) + O(nθⁿ)`, positive for large `n`. Tested on the refuting instance: with `K = ℚ(√−23)` and `p = 7` (inert, `(−23/7) = −1`) every one of the `8·7ⁿ⁻¹` cyclic `7ⁿ`-subgroups has quotient of conductor exactly `7ⁿ`, matching `#Pic(O_n)/h_K = 8·7ⁿ⁻¹`, and the written route applies unchanged; with `p = 3` the induction gives `a_2(v, w) → 8c_w` while the written count gives `12c_w`.

## R02 (P3) — The Greenberg route's last step is an invalid inference

**Location:** `README.md:1532`–1535 (“Pass to the one-prime module through the exact sequence relating X_ℓ to X and the 𝔩̄-adic local units, whose image has no finite submodule either”).

**Claim:** Since `X_ℓ` has no nonzero finite `Λ`-submodule and the image of the `𝔩̄`-adic units has none, the quotient `X` has none.

**Witness:** `Λ = ℤ_ℓ⟦T⟧` and its ideal `(ℓ, T)` both have no nonzero finite submodule, and `Λ/(ℓ, T) ≅ 𝔽_ℓ` is finite. The property does not pass to quotients, so the sentence proves nothing about `X`; the statement for `X` is Greenberg's (cited by locator, end of §4) and Vatsal uses it as a black box (vatsal line 955–956, author p. 29).

**Repair:** Delete the quoted inference and state the passage honestly: either cite Greenberg §4 for the one-prime module as the input of this target (the `S_ℓ`-ramified part of the route then only supplies the `Λ`-rank), or give the actual argument (the decomposition groups of the primes above `𝔩̄` in `F_𝔩,∞/F` are open, the local-unit term is `Λ`-torsion-free of known rank, and the Poitou–Tate sequence over `F_𝔩,∞` identifies the finite submodules of `X` with a subquotient of `H²` that vanishes). Tested on the instance: with the inference deleted the target's statement and its `*Needs:*` line are unchanged, and the counterexample `Λ/(ℓ, T)` no longer refutes any sentence.

## R03 (P3) — Stevens' Theorem 7.1 is on p. 104

**Location:** `README.md:1815` (“Stevens' Theorem 7.1 (p. 103: every class of conductor at most 200)”) and 2294–2295.

**Claim:** Theorem 7.1 is on p. 103.

**Witness:** stevens line 1148 (GDZ scan page 31); scan page 23 carries the printed header “96 G. Stevens” (line 832) and page 32 the header “… 105” (line 1174), so page 31 is printed p. 104; §7 opens at line 1139 on the same page. The other §5 locators are right: Theorem 5.1 line 840 (p. 96), Lemma 5.2 line 845 (p. 96), Corollary 5.3 line 865 (p. 96), Lemma 5.4 line 872 (p. 97), proof lines 876–955 (pp. 97–99), Theorem 2.3 line 424 (p. 84), (2.9) line 556 (p. 88).

**Repair:** Write p. 104 in both places.

## R04 (P3) — The declared contract bundles three theorems and has no `plan.json` counterpart

**Location:** `README.md:320`–334 (“What EulerSystemsCyclotomicMainConjecture must provide (gap:eisenstein-elliptic-unit-inputs): … the three statements restated there”).

**Claim:** One slug declares Rubin's one-variable main conjecture, the Katz–de Shalit interpolation of `char_Λ((U/C̄)^χ)` and Hida's almost-all-character unit theorem.

**Witness:** The sentence is 14 lines long and names three results with three different proofs (Euler system, Katz measure, Hecke orbits on the Igusa tower). HeegnerPointEulerSystems README line 271 declares the same slug with a one-sentence `needs` (“an independent elliptic-unit/Katz main-conjecture and μ input …”), which the three clauses here refine; this pull request carries no `design/plan.json`, so nothing lists the slug where the intake reads it. The hypotheses of each clause are stated and the supplier is earlier in the merge order (EulerSystemsCyclotomicMainConjecture at 151, this roadmap at 319), so the contract is precise and ordered.

**Repair:** Keep the slug and give it a one-sentence `needs` that names the three statements as (i)–(iii) with their hypotheses in the §4.10 paragraphs it points to, so that the intake can carry it; or split into three slugs if the worker records gaps for this pull request. Tested on the instance: the Rubin clause as written (`ℓ` odd, split, prime to `#μ(K)`, `[F:K]` prime to `ℓ`, no Hilbert-class-field hypothesis) is exactly vatsal Theorem 3.6 (line 765–767), so no clause loses a hypothesis under either form.

## R05 (P3) — Twists of `162b` with `7 ∣ D` do not satisfy Theorem 1.11's hypotheses

**Location:** `README.md:1795`–1798 (“The classes with a rational cyclic 21-isogeny are the quadratic twists of the curves of the class `162b` …; they satisfy the hypotheses of Theorem 1.11 at ℓ = 7”).

**Claim:** Every twist class satisfies the hypotheses.

**Witness:** `162b1 ⊗ χ_{−7}` has additive reduction at `7` (a ramified quadratic twist of a good-reduction curve), so it is not ordinary at `7` and Theorem 1.11 does not apply to it; the twisting theorem still covers it (`7` is not an additive prime of `162b`), so the conclusion of the paragraph is unaffected.

**Repair:** “…; those among them with good reduction at `7` satisfy the hypotheses of Theorem 1.11 at `ℓ = 7`, have four curves, and …”.

## Verified sound

A full review: every subsection of the README (lines 1–2341) and all 392 lines of `Suggested.lean` were read; the 413-line change set since d55b326 was read line by line, and each changed passage appears below.

### Previous findings, checked individually

| Previous finding | Passage at this head | Assessment |
|---|---|---|
| R01 (P2) 21-isogeny classes skipped | README 1786–1827 (“Twisting and the sporadic classes”): Stevens' Theorem 5.1 with its hypothesis, Lemmas 5.2–5.4, Theorem 7.1, the `χ_{−3}` reduction to `162c`; Checks 1844–1864 | Repaired. Stevens' statement at stevens lines 840–843 (unramified outside the semistable primes), Lemma 5.2's `n ∈ {1, 2}` rule (lines 851–854), Corollary 5.3 (865), Lemma 5.4's inclusion `n/τ(χ)·ℒ(f) ⊆ ℒ(f^χ)` (872–875), Theorem 7.1 (1148) all match the README. Vatsal Remark 1.12 (lines 233–265) is the reduction the README restates. The Check data recomputed below. The 14-isogeny and 27-isogeny exclusions are right (CM by `ℚ(√−7)`, `ℚ(√−3)`, hence additive at `7`, `3` in every twist). |
| R02 (P2) three deep inputs unowned | README 320–334 (declared contract), 1507–1520, 1552–1577, 1593–1603 (the three supplied statements), 1522–1539 (Greenberg, owned), 1631–1732 (CM reduction, owned) | Repaired in structure: the three statements are consumed through the contract, with the right hypotheses (vatsal Theorem 3.6 line 765; Theorem 3.13 lines 885–891; §3.7); Greenberg's theorem and the reduction surjectivity are now targets with routes. The reduction route has the split-`p` defect (R01 above) and the Greenberg route one invalid step (R02 above). |
| R03 (P2) ring class fields cited to IQCN §H3.1 | README 309–319, 1493, 1752, 1705 | Repaired: ClassFieldTheory Layer 13 (`ringClassField`, `gal_ringClassField_equiv_pic`, main line 594) and Layer 11; ImaginaryQuadraticClassNumber §H1.4 (main line 43) for `Pic(O_f)` and the conductor formula; §H3.1 kept for the CM dictionary only. |
| R04 (P3) cache line numbers, p. 13, no register | 481, 1314, 1326, 1333, 1390 (line clauses gone), 1065 (p. 14) | Partly: locators repaired; no `sources.toml` (none exists on main either; not re-raised). |
| R05 (P3) duplicated Checks blocks | §§2.7, 4.3, 4.8, 4.10 | Repaired: one list each. |

### Gate, dependency check, build, binders, padding

Worker's gate at 2ec386f: every check passes (`depcheck=0 … build=0 OK`). Dependency check run here:

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line; the roadmap is at position 319, after GrossZagierAndArithmeticHeights (318); every supplier of the new §4.10 text is earlier (IntegralIwasawaTheory 24, AdelicAlgebraicGroups 30, ModularCurvesPartII 70, ModularSymbolsPadicLFunctions 104, WeightsInEtaleCohomology 132, HilbertModularVarietiesAndShimuraCurves 144, SerreWeightAndLevelOptimisation 147, ComplexMultiplicationAndExplicitReciprocity 150, EulerSystemsCyclotomicMainConjecture 151, EllipticCurveModularityPartII 181) or on main (ClassFieldTheory, ImaginaryQuadraticClassNumber, PadicMeasuresIwasawaAlgebras, GlobalNumberFields). `git diff --stat origin/main...HEAD` outside the folder is empty.

`lake env lean` on `Suggested.lean` (unchanged since d55b326): 36 `declaration uses 'sorry'` warnings and nothing else. A scratch copy with `#check @name` for all 54 declarations elaborated without error; the four binders the worker flags (`localPeriod`, `jDenominatorIdeal` without `[NumberField K]`; `analyticRank`, `leadingCoefficient` without `[W.IsElliptic]`) are the generality the Conventions paragraph (README 133–139) announces, and every positivity, finiteness and nonvanishing theorem carries the instance. One-tactic probe (`first | rfl | simp | infer_instance | exact trivial | decide | (intros; simp_all)`) on a scratch copy: 36 error sites, 0 closed. No padding, no sorry'd data, no `set_option`, no admitted `example`; imports are `import Mathlib` and five existing `TauCeti.*` modules.

Headline inventory (README): lattice characterization and real shapes (1.1, 1.6), model invariance of the global period (2.5), isogeny lattice inclusion with degree index (2.7), nonvanishing and continuation-independent leading term (3.2–3.4), Stevens' minimal curve (4.10), rank-zero rationality (4.12), Faltings ratio one iff minimal (5.5): all stated. The docstring names the non-statable headlines (integral period comparison, optimality, Manin constant, modular degree, congruence theorem, semistable Manin, the §4.10 inputs, BSD quotient, Faltings-height comparisons) with the missing carriers; the pinned trees have no `faltingsHeight`, Tamagawa product or modular-curve quotient.

### Pinned declarations opened

| Object | File at the pin (Mathlib f6090c7, Tau Ceti 358314d) | What was read |
|---|---|---|
| `PeriodPair`, `lattice`, `g₂ = 60 * G 4`, `g₃ = 140 * G 6` | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean:59`, 78, 956, 959 | the invariants as 1.1 states them |
| `localPolynomial` | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43`–49 | good `1 − aX + qX²`, split `1 − X`, nonsplit `1 + X`, additive `1` (line 75): 3.2's bad factors |
| `Submodule.colon`, `mem_colon_singleton` | `Mathlib/RingTheory/Ideal/Colon.lean:35`, 48 | `r ∈ N.colon {x} ↔ r • x ∈ N`: `jDenominatorIdeal` is the integrality ideal (5.3) |
| `reducedMinimalModel`, `IsReducedMinimal`, `minimalDiscriminantIdeal`, `IsGlobalMinimal`, `Isogeny.pullbackDifferential`, `Isogeny.degree` | the five imported Tau Ceti modules | elaborate in the `#check` file |

### Cross-roadmap citations resolved (every one in §4.10's new text, at the copy named)

GrossZagierAndArithmeticHeights at its head: §0a.2 (line 176: `cmCyclicPair(b, 𝔫)`, `ℂ/b → ℂ/𝔫⁻¹b`, order `O_c` with `gcd(c, N) = 1`, coarse `H_c`-point), §0.5 (398: arithmetic Artin action, `a ↦ [b][a]⁻¹`), §§3.1, 3.5, 3.7–3.10 (1083–1306). ComplexMultiplicationAndExplicitReciprocity §5.1 (line 733: potential good reduction, supersingular iff inert or ramified), §5.2 (779: Eichler order of a level pair). SerreWeightAndLevelOptimisation §2.6 (431; the “Deuring–Eichler supersingular comparison” paragraph inside it identifies the supersingular points of `X₀(M)` with `B^×\B̂^×/R̂^×` with weights `w_x`). HilbertModularVarietiesAndShimuraCurves R18.3.5 (2791, weighted pairing `|Γ_t|⁻¹`), R18.3.6 (2803, `T_v = [U diag(π_v,1) U]`, Satake `X² − T_vX + q_vS_v`), R18.3.7 (2819: norm fibres, strong approximation at a split `w`, `F = ℚ` maximal level gives trivial norm quotient and constants with `T_v = q_v + 1`), R18.3.22 (3116). AdelicAlgebraicGroups §4.2 (4150, quaternion norm-one strong approximation at a split place). IntegralIwasawaTheory §2.5 (376, `homologicalRankCriterion`: `H²(H, D_p) = 0` iff no nonzero finite submodule and rank `−χ₂`), §2.6 (382, cyclotomic weak Leopoldt). WeightsInEtaleCohomology §6.1 (695, Ramanujan bound). ModularSymbolsPadicLFunctions §1.2 (1381: Birch's lemma `f_χ = τ(χ̄)⁻¹Σ χ̄(a) f(z + a/m)` with the path convention), §0.4 (672), §0.8 (1232). ModularCurvesPartII §§1.1–1.4 (394–467), 5.1 (1647), 5.17 (2021), 7.2 (2282), 7.5–7.6 (2365, 2397), 11.1–11.2 (2970, 2995), 14.12 (3783), 16.2 (4120), 16.5 (4175). EllipticCurveModularityPartII §5.0a (508), §5.0b (538). ClassFieldTheory Layer 13 (main line 594, 1848–1858), Layer 11. ImaginaryQuadraticClassNumber §H1.4 (43), §H3.1 (83). PadicMeasuresIwasawaAlgebras §§1.7 (909), 2.1 (1148), 4.1–4.6 (2361–2620). GlobalNumberFields (Completed) Layers 9–10. EulerSystemsCyclotomicMainConjecture is on main; HeegnerPointEulerSystems line 271 declares `gap:eisenstein-elliptic-unit-inputs` on it. Outside §4.10: EllipticCurveModularity Layers R29.3–R29.6 (1020, 1261, 1472, 1605; “Elliptic coefficient summability” 1860, `exists_entire_completed_LSeries` 1930); FaltingsFinitenessAndIsogenyTheorems R28.6.5 (2767), R28.6.6 (2788); NeronModelsAndSemistableAbelianVarieties R11.1 (= Layer 1, line 684); ArakelovGeometryAndAbelianHeights §§2.1–2.3, 2.7, 2.9, 3.1, 3.4 (684–1027) with all six cited names; PeriodsAndSpecialValues PS.1.1 (403), PS.1.7 (593), PS.1.8 (618), PS.3.3 (847); EllipticCurves Layers 1–7 and 4.5a–b (423–1262); ModularForms Layers 3, 8, 10B (481, 764, 1068); ArithmeticDirichletSeries §§3.1–3.3; EllipticIntegrals Milestone 8 (422). Ownership by object: no roadmap on main or at the open heads builds the equation-indexed period lattice, the periods over `K`, the BSD quotient over `K`, the Manin constant as a curve invariant, Stevens' curve, the Faltings ratio, or the surjectivity of CM reduction (Cornut's dynamical route is not in any roadmap); EllipticCurves line 302 and 1325 leave the complex-analytic objects to the successor roadmap.

### Seeded source sample

| Target | Text read, locator | Conclusion |
|---|---|---|
| 1.1 | Mathlib `g₂ = 60 G 4`, `g₃ = 140 G 6`; milne-mf Prop 3.10 (line 2090, p. 45 header at 2064), Prop 4.18 (2576, p. 55), Prop 4.20 (2640, p. 56: `G_k = 2ζ(2k) + 2(2πi)^{2k}/(2k−1)! Σσ_{2k−1}(n)qⁿ`) | supports the normalized Eisenstein comparison; `60·π⁴/45 = 4π⁴/3`, `140·2π⁶/945 = 8π⁶/27` recomputed |
| 1.2 | cremona §2.14 line 2402 (p. 45: `c₄ = 12g₂`, `c₆ = 216g₃`) | supports; 11a1 values below |
| 1.4 | ModularCurvesPartII §1.4 (467, invariant differentials and periods), §1.2 (422) | supports |
| 1.6 | knowl `ec.q.period_lattice` lines 92–98 (rectangular `⟨x, yi⟩` for `Δ > 0`, `⟨2x, x + yi⟩` for `Δ < 0`, real period `2x`); Silverman Advanced V.2.3.1 not readable | supports shapes and component count |
| 2.2 | knowl `ec.q.real_period` line 90 (least positive real element times the number of components); EllipticCurves Layer 7 | supports |
| 2.6 | knowl `ec.q.period_lattice` line 100 (minimal model gives the lattice); Tau Ceti `reducedMinimalModel_smul` | supports |
| 3.1 | EllipticCurveModularity “Elliptic coefficient summability” (1860–1923) | all number fields, all primes, `Re s > 3/2` |
| 3.2 | `LFunction.lean:47`–49, 75; ArithmeticDirichletSeries §§3.1–3.3 | the four local factors are Mathlib's |
| 3.4 | PeriodsAndSpecialValues PS.3.3 (847, `L^{(r)}(0)/r!`); knowl `ec.analytic_sha_order` lines 96–103 (`|D_K|^{1/2} L^{(r)}/r! · #tors²/Reg_NT · 1/(Ω ∏c_𝔭)`) | supports |
| 4.4 | GZ §3.5 (1207), §3.7 (1264); knowl `ec.q.manin_constant` (`φ^*ω_E = c·2πi f dz`, `c ∈ ℤ` (Edixhoven), `c = 1` semistable (Česnavičius)) | supports |
| 4.5 | knowl `ec.q.manin_constant` (non-optimal `c'` through the least-degree isogeny, multiplier divides `deg ψ` and may equal `1`); FFIT R28.6.6 | supports |
| 4.11 | knowl `ec.q.modular_degree` (minimum degree of a parametrization); 4.2–4.6 | supports; the knowl says nothing about non-optimal curves, as 4.6 owns |
| 5.2 | faltings §3 definition line 245 (scan page 7 = p. 354: `h(A) = Grad(ω_{A/R})`, degree of a metrized line `log #(P/Rp) − Σ ε_v log‖p‖_v`, line 231) | supports the integral-section computation |
| 5.3 | knowl `ec.q.faltings_height` (`h_stable = (1/12)(log denom(j) − log|Δ|) − ½ log A`, model independent, equal to `h` when semistable) | supports |
| 5.6 | derived from 4.7 and 5.1; cremona Prop 2.15.1 line 2561 (p. 48: `4π²‖f‖² = deg φ · Vol(E_f)`); values below | supports |
| 5.4 (used by R01's repair test) | faltings Lemma 5 line 392–395 (p. 358: `h(A₂) = h(A₁) + ½ log Grad Φ − (1/[K:ℚ]) log #s^*Ω_{G/R}`) | supports 5.4 exactly |

Other locators checked: cremona Theorem 2.1.3 line 322 (p. 13), Theorem 2.1.4 line 389 (p. 14), §2.1.3 line 208 (p. 11), (2.8.10) line 1569 (p. 31), §2.10 lattice types line 1726 (p. 34), `deg φ = 1984` line 2553 (p. 48); cesnavicius (arXiv v3) Proposition 2.2 line 153 (p. 4), Example 2.8 line 269 and Lemma 2.9 line 277 (p. 7), Lemma 2.10 line 289 and Theorem 2.11 line 312 (p. 8); ars-congruence Definition 2.1 line 58, Theorem 2.2 lines 65–67, Table 1 line 82 (`54B1 2 6`); ars-manin Conjecture 2.1 line 84, Theorems 2.3, 2.4, 2.5, 2.7 lines 91–112; cornut Theorem 3.1 line 568 and Corollary 3.2 line 580 (p. 12), Lemma 3.5 line 949 (p. 17: reduced norm of `R'(ℓ)[1/p]^×` is `p^ℤ`); vatsal Theorem 1.3 line 151, Remark 1.4 line 158, Theorem 1.10 line 212, Theorem 1.11 line 218, Remark 1.12 lines 221–265, Theorem 3.6 line 765, Theorem 3.13 line 885, Corollary 3.17 line 947 (its proof 949–956 is the “Descent through Δ” paragraph), §3.1 hypotheses lines 650–656 (`p` split or inert), §4.6 lines 1108–1157, Lemma 5.4 line 1415, §5.6 line 1445; Cremona table (ecdata) lines 573–580 (`162b1–4`, `162c1–4`), 123 (`49a1 = [1,−1,0,−2,−1]`).

### Adversarial mathematics table

Values are my own computations (double precision; the Δ < 0 covolume is `w₁ · Re(w₂)` for the AGM periods).

| Statement | Instance | Left side | Right side / control | Result |
|---|---|---|---|---|
| 1.1 invariants of 11a1 | `[0,−1,1,−10,−20]` | `c₄ = 496`, `c₆ = 20008`, `g₂ = 124/3`, `g₃ = 2501/27` | `g₂³ − 27g₃² = −161051 = −11⁵ = Δ` | agrees |
| 1.1 CM uniqueness | `g₃ = 0`: `u = i`; `g₂ = 0`: `u = ζ₆` | `i⁴ = 1`, `ζ₆⁶ = 1` | `i⁶ = −1`, `ζ₆⁴ ≠ 1` | exponent choice necessary |
| 1.1 excluded pair | `(3, 1)` | `27 − 27 = 0` | ellipticity needs `≠ 0` | excluded |
| 1.2 `j` of 11a1 | above | `1728g₂³/Δ = −122023936/161051` | `= −2¹²·31³/11⁵` | agrees |
| 1.6 shapes | 11a1 (`Δ < 0`), 37a1 (`Δ > 0`) | `[1.2692093, 0.6346047 + 1.4588166i]`; `[2.9934586, 2.4513894i]` | `Ω = 1.2692093`, `5.9869173` | `Ω = 2x` in both |
| 2.2 / 2.6 Néron covolumes | 11a1, 11a2, 11a3 | `1.8515436`, `0.3703087`, `9.2577181` | ratios `5.0000`, `5.0000` | indices `5` as 2.7 says |
| 2.3 complex place | 11a1 over `ℚ(i)` | `2·covol = 3.7030872` | `Ω² = 1.6108923` | the two differ, as 2.5 says |
| 3.1 norm-4 coefficient | 11a1 over `ℚ(√17)`, `2` split | `a_𝔭a_𝔭' + a_{𝔭²} + a_{𝔭'²} = 4 + 2 + 2 = 8` | `a₄(11a1) = (−2)² − 2 = 2` | not `2` |
| 3.2 bad factors | split, nonsplit, additive | `1 − X`, `1 + X`, `1` | `LFunction.lean:48`–49, 75 | agree with the pin |
| 3.4 factorial | germ `3(s−1)²` | `F″(1)/2! = 3` | `F″(1) = 6` | convention pinned |
| 3.6 `Ш_an` | 11a1; 37a1 | `0.2538419·25/(1.2692093·5) = 1.0000`; `0.3059998/(5.9869173·0.0511114) = 1.0000` | definition | agree |
| 4.4 Manin constant | 11a1 | `covol Λ_E/covol Λ_f = 1` | `c² = 1` | consistent |
| 4.5 non-optimal constant | 11a2; 11a3 | `α = 1`, `c' = 1`; `α = 5`, `c' = 5` | `deg ψ = 5` both | constant ≠ degree |
| 4.7 / 5.6 Petersson | 11a1 | `4π²·0.0469001 = 1.8515417` | `deg φ·covol = 1.8515436` | agree to the inputs' precision |
| 5.6 height from `‖f‖` | 11a1; 37a1 | `−log(2π·0.2165644) = −0.3080093`; `½log 2 − log(2π·0.6097164) = −0.9965421` | `−½ log covol`: `−0.3080098`; `−0.9965422` | agree |
| 5.1 / 5.4 heights | 11a1 → 11a2, 11a3 | `−0.3080098 + ½ log 5 = 0.4967091`; `+½ log 5 − log 5 = −1.1127288` | Worked examples | agree |
| 5.2 non-minimal model | `y² = x³ + 16` of 27a3 | `−log 2 − ½ log(8.1086283/4) = −1.0464644` | naive `−½ log(covol/4) = −0.3533172 = h + log 2` | prefactor load-bearing |
| 5.3 stable correction | 27a3 | `−log 27/12 = −0.2746531` | `h_st − h` | agrees |
| 5.5 ratios | 11a, 14a | `5, 25, 1`; `covol(14a4)/covol(14a1) = 7.8787542/2.6262514 = 3.0000` | Checks `14a1 ↦ 3` | agree |
| 4.10 Vatsal data for `162b1` | `[1,−1,1,−5,5]` | `#E(𝔽₇) = 6`, `a₇ = 2`; `a_p = 0, 2, −3, 2, −3, −1, −6` for `p = 5…23` | good ordinary at `7`; Cremona line 573 | agree with the Check |
| 4.10 lattices of `162b` | `162b1–4` | `covol = 4.0843965, 1.3614655, 0.5834852, 0.1944951` | ratios `3.0000, 7.0000, 21.0000` | `162b1` minimal; Check agrees |
| 4.10 lattices of `162c` | `162c1–4` | `4.0843965, 1.3614655, 0.5834852, 0.1944951` | ratios `3, 7, 21` | agrees; `covol(162c1) = covol(162b1)` |
| 4.10 twist by `χ_{−3}` | `p = 5…23` | `a_p(162c1) = 0, 2, 3, 2, 3, −1, 6` | `χ_{−3}(p) a_p(162b1)` with `χ_{−3} = −,+,−,+,−,+,−` | agree at all seven primes |
| 4.10 `j` of `162b1`, `49a1` | invariants | `−140625/8 = −3²5⁶/2³`; `−3375` | the `X₀(21)` and `X₀(14)` values | agree; `Δ(49a1) = −7³` |
| 4.10 two reducible `E[ℓ], E[p]`, `ℓ ≥ 7` | list `{1,…,19,21,25,27,37,43,67,163}` | products `ℓp` present: `14, 21` | `22, 26, 35 ∉` | only `14, 21` |
| 4.10 twist hypotheses | `162b1 ⊗ χ_{−7}` | additive at `7` | ordinary at `7` required | R05 |
| 4.10 Stevens' `n` | `D` with `8 ∣ D` | `162b1` is multiplicative at `2` (`2 ∥ 162`) | `n = 2` needs good supersingular reduction at `2` | `n = 1` for every twist of `162b` and `162c` |
| 4.10 cyclic quotients of a conductor-one curve | `K = ℚ(√−23)`, `p = 3` split, `n = 2`; `p = 7` inert | `(p+1)pⁿ⁻¹ = 12`; `56` | `#Pic(O_n)/h_K = 6`; `56` | split case refutes the route: R01 |
| 4.10 ideal witness | `ℂ/O_K → ℂ/𝔭⁻¹`, `3 = 𝔭𝔭̄` | kernel `O_K/𝔭 ≅ ℤ/3` cyclic | `End = O_K ≠ ℤ + 3O_K` | R01 |
| 4.10 Hecke recursion | `p = 3`, `n = 1…4` | sphere sizes `4, 12, 36, 108` | `(pⁿ⁺¹ − pⁿ⁻¹)/(p−1) = 4, 12, 36, 108` | agree |
| 4.10 spectral gap | `p = 3`, `λ ∈ {±3.9, 3.5, 2√3, 0}` | larger root modulus `2.846, 2.0, 1.732, 1.732` | `< p = 3` | `θ < p` whenever `|λ| < p + 1` |
| 4.10 Eichler mass | `N = 1`, `q = 11` | `1/3 + 1/2 = 5/6` | `(q−1)/12 = 5/6` | constant parts `2/5`, `3/5` |
| 4.10 subgroup count | `n = 2` | `(p+1)² − (p+1) = (p+1)p` | `(p+1)² − p = p² + p + 1` | cyclic vs all |
| 4.10 Greenberg route inference | `Λ ⊃ (ℓ, T)` | both without finite submodule | `Λ/(ℓ, T) = 𝔽_ℓ` | R02 |
| 4.10 Euler factor | `ℓ = 3`; `5` | `1 − 3a`; `1 − 125a` | `≡ 1 (mod ℓ)` | unit |
| 4.10 ring-class orders | `ℚ(√−23)`, `p = 7` | `|G₁| = 3·8 = 24`, `|G₂| = 168` | `n = 0` formula `24/7` | scoped to `n ≥ 1` |
| 4.10 inert `q` splits in `H_n` | `q` inert | `(q) = qO_K`, `q ∈ O_n` | principal in `Pic(O_n)` | splits completely |
| 4.10 Rubin hypothesis | `ℓ = 3`, `K = ℚ(√−23)`, `h_K = 3` | `3 ∤ #μ(K) = 2` | Hilbert-class-field form needs `3 ∤ h_K` | the 1994 form is the right one |
| Worked example 32a1/64a1 | `u = ζ₈` | `u⁴ = −1`, `|u|² = 1` | `±1, ±i` have fourth power `1` | repaired previously, still right |

## Not verifiable

- **Greenberg 1978** §4, **Rubin 1991** Theorem 4.1 and **Rubin 1994** Theorem 2(i): Springer and AMS pages are paywalled; the GDZ volume tables could not be navigated; the statements were checked as restated in vatsal lines 765–770 and 955–956.
- **Hida 2004** Theorem 1.1: de Gruyter page only; checked as vatsal Theorem 3.13 and Remark 3.14 (lines 885–904).
- **Vatsal 2003** §6 and **Brumer 1967**: not resolvable through the service (Project Euclid page without PDF link; the Mathematika DOI returns 404); cited by locator in the README, and only the surjectivity statement's hypotheses matter here (R01 concerns the owned route, not the cited theorem).
- **Silverman AEC and Advanced Topics**, **BLR §1.2**, **Mazur Corollary 4.1**, **Manin 1972 §5**, **Abbes–Ullmo Theorem A**, **Zagier 1985**: paywalled or unresolved; checked through Cremona, the knowls, ARS and the suppliers.
- **LMFDB knowls** `ec.q.optimal`, `ec.special_value`, `ec.q.faltings_ratio`: the cached pages are browser checks; `ec.q.faltings_ratio` was not refetched (the Faltings-ratio statements were checked against vatsal Theorem 1.3 and Stevens Theorem 2.3).
- The journal pagination of Vatsal 2005 and of Cornut 2002 was not compared with the manuscripts; the README cites manuscript pages and says so.

## Source issues

- **Gap** in vatsal at §4.6, author p. 35 (lines 1129–1134): the source says the reduction map `C_n → S_q(N)` is surjective for large `n`, citing [Vat03] §6 and [Cor02]; it should state the hypotheses of that result (`q` inert, `q ∤ NDℓp`) and that `p` is either split or inert at the point of use; affects the proof (the roadmap restates it with the hypotheses).
