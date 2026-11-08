# Review of AnalyticNumberTheoryPartI (pull request #1126 at 70913eb)

**Verdict:** needs changes

Four P3 findings and nothing blocking. Paths are relative to `TauCetiRoadmap/AnalyticNumberTheoryPartI/`. Source labels other than the manifest's (`dit2016`, `kedlayaant`, `green2026`, `openai2026lspdf`, `taodivisorbound`) name the worker's cached open copies of the README's references, listed under Verified sound.

## R01 (P3) — Six backticked Lean names belong to this roadmap, but `Suggested.lean` declares none of them

**Location.**
- `README.md:506`: "The comparison is `2 * riemannXi = entireCompletion (dirichletData 1)`".
- `README.md:2668`: "Define `besselY : ℂ → ℂ → ℂ` for arbitrary complex order".
- `README.md:2766`: "`atkinson.logRatio(y)=L(y)=log((1+y)/y)` … `atkinson.logarithmicWeight(α,β,γ,y)=…`".
- `README.md:2804–2806`: "`atkinson.movingWeight(T,x)=Q_T(x)=…`", "`atkinson.movingPhase(T,x)=h_T(x)=…`".

**Claim.** These are Lean names of this roadmap's own. Four of them sit in its `atkinson` namespace, and the other two name its own ξ (§0.14) and Y_ν (§3.23b). A backticked name of the roadmap's own claims that `Suggested.lean` declares it, and none is declared. The gate misses them because each sits inside a formula span. `dirichletData 1` is also ill-formed: LFunctions' `dirichletData` takes a character and a primitivity proof (`TauCetiRoadmap/LFunctions/Suggested.lean:1440` on main).

**Witness.** `grep -c "riemannXi\|besselY\|logRatio\|logarithmicWeight\|movingWeight\|movingPhase" Suggested.lean` returns 0. None of the six names is in pinned Mathlib or Tau Ceti; Mathlib's `logRatio` (`Probability/Distributions/Fernique.lean`) is an unrelated helper. None is in ZerosOfLFunctions or LFunctions on main either.

**Repair.** Keep the mathematics and drop the Lean names. Write "`2ξ` is ZerosOfLFunctions' `entireCompletion` of LFunctions' Dirichlet record at the trivial character modulo 1", "Define `Y_ν(z)` for …", "`L(y)=log((1+y)/y)`", "the weight `y^(−α)(1+y)^(−β)L(y)^(−γ)`", "`Q_T(x)=…`" and "`h_T(x)=…`". None of these objects is needed to state a headline, so none should be added to `Suggested.lean`. After the change, the grep above still returns 0 and no backticked name of this roadmap's own is undeclared.

## R02 (P3) — §2.9 states Zaman's count in a degree-dependent special case, although its source and §2.9a give a general form with an absolute constant

**Location.** `README.md:1445`: "For each fixed degree `n` there is a positive effective `c_n` and an absolute effective `D₀` such that `π_k(Y)≥c_n D_k^(−19)Y/log Y`". The same form appears in `Suggested.lean:761–768` (`∀ n : ℕ, 1 ≤ n → ∃ c : ℝ, 0 < c ∧ ∀ (k : Type) …`).

**Claim.** The target is narrower than both its source and the roadmap's own proof route. §2.9a concludes, for every Galois `L/F` and every class `C`, that `π_C(x)≫D_L^(−19)(|C|/|G|)x/log x` with "all thresholds … absolute and effective, fixed before `L,F,C,B`" (`README.md:1491`). Only afterwards does it specialize to `L=F=k`, `C={1}`. That general form can be stated at the pins: Tau Ceti's `NumberField.Chebotarev.frobeniusPrimeCount K L C x` (`TauCeti/NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.lean:177`) is exactly `π_C(x)`. The constant `c_n` also need not depend on the degree.

**Witness.**
- `zaman-thesis` lines 570–576 (Theorem 1.3.1, p.12): `π_C(x,L/F)≫D_L^(−19)(|C|/|G|)Li(x)` for `x≥D_L^35`.
- `zaman-thesis` lines 1059–1063: all implied constants are absolute and effective.
- `loww` lines 1109–1113 (Lemma 4.4): the degree-dependent specialization cited here.

**Repair.** In §2.9, state Zaman's Theorem 1.3.1 as the target: there are absolute effective `c>0` and `D₀` such that `frobeniusPrimeCount K L C x ≥ c·|discr L|^(−19)·(|C|/|G|)·x/log x` for every finite Galois extension `L/K` of number fields, every conjugacy class `C`, every `|discr L|≥D₀` and every `x≥|discr L|^35`. State it in that form in `Suggested.lean`. Keep the prime-ideal count, with one absolute `c`, as a corollary bullet citing LOWW Lemma 4.4. Tested at `L=K=k`, `C={1}`: there `|C|/|G|=1` and `frobeniusPrimeCount` counts every prime of norm at most `x`, since the unramified condition is empty. This recovers the current statement with `c` independent of `n`.

## R03 (P3) — Six Lean definitions have no Checks, and `zamanDelta` restates Mathlib's digamma

**Location.**
- `README.md:1474`: the `ZamanDigammaInput` bullet defines `δ` (`zamanDelta`), `G₁` (`zamanG₁`), `G₂` (`zamanG₂`) and `Q` (`zamanQ`), and §2.9a has no Check on any of them.
- `README.md:2638` defines `divisorCoprimeError` and `divisorRemainderIntegral`. They have API only (`README.md:2644`); the Checks blocks at `README.md:2648–2658` test `D`, `Δ`, `Δ*` and the cap.
- `Suggested.lean:730–732`: `zamanDelta` is `(deriv Complex.Gamma z / Complex.Gamma z).re`.

**Claim.** Every definition needs at least three discriminating Checks, and these six have none. `zamanDelta` also re-derives `Complex.digamma`, which is `logDeriv Gamma` at the pin (`Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:48`).

**Witness (computed values).**
- `δ(2,0)=ψ(1)=−0.5772157`, whereas the plausible wrong model `ψ(x+it)` gives `ψ(2)=0.4227843`. Also `δ(1,0)=ψ(1/2)=−1.9635100`.
- `G₁(1,0)=−1.7219456` and `G₂(1,0)=−1.4150927`.
- `W₁(1)=π²/24=0.4112335` and `W₂(1)=π²/6−1=0.6449341`.
- `zamanQ(1,0)=2.25`: both arguments of the max are negative.
- `divisorCoprimeError 2 4=Δ(4)−Δ(1)=10−4log4−6γ=0.9915286`. Dividing by `δ` instead of `δ²` gives `Δ(4)−Δ(2)=0.5322543`.
- `divisorCoprimeError 6 4=0.9267283`.
- `divisorRemainderIntegral 1 2 (7/4)=0.1537822`; the weight `u^(+7/4)` would give `−0.0315315`.

**Repair.** Add these values as Checks bullets in §2.9a and §3.23a, and redefine `zamanDelta x t := (Complex.digamma (((x : ℂ) + (t : ℂ) * I) / 2)).re`. Tested: the redefinition matches at `(2,0)` and `(1,0)`, since Mathlib's `Complex.digamma_one` and `Complex.digamma_one_half` give `−γ` and `−2log2−γ`.

## R04 (P3) — ASCII leftovers and undefined tokens in §§0.23a, 2.21, 2.22, 2.34, 2.44, 2.50 and 2.51

**Location and repair.**
- `README.md:1701` (§2.21): "`K, Q=D_K*N(f_chi), 0<r≤1/2`, and -`r≤σ≤1+r`" (the minus sign sits outside the span). Replace with "`Q=D_K N(𝔣_χ)`, `0<r≤1/2` and `−r≤σ≤1+r`".
- `README.md:1713, 1921, 2154, 2164`: "Write `D_K=|Disc(K)|, f_η` for its finite conductor". Replace with "Write `D_K=|Disc(K)|` for a number field `K` and `𝔣_η` for the finite conductor of `η`".
- `README.md:1713`: "`Γ_R` prime/`Γ_R` at 1 and 2 sum to -`γ-log(2π)`" and "`γ` is Euler constant". Replace with "`Γ_ℝ′/Γ_ℝ(1)+Γ_ℝ′/Γ_ℝ(2)=−γ−log(2π)`" and "Euler's constant".
- `README.md:1921, 2164`: "`|L_f prime(1,eta_E/F)|`", "`|L_f prime(1)|≤C_(g,r)*Q^r/r`" and "`|L_f prime(1,η)/L_f(1,η)|`". Replace with `|L_f′(1,η_(E/F))|`, `|L_f′(1)|≤C_(g,r)Q^r/r` and `|L_f′(1,η)/L_f(1,η)|`.
- `README.md:2154`: "`L_f(1,eta_E/F)`", "`kappa_E/kappa_F`" and "`2*ε/3`". Replace with `L_f(1,η_(E/F))`, `κ_E/κ_F` and `2ε/3`.
- `README.md:660` (§0.23a Check): "`R′(1)=1/2−EulerGamma`". Replace with `R′(1)=1/2−γ`.
- `README.md:2082` (§2.44): "The Lean calculus adapter keeps the arithmetic conductor identification separate." `Suggested.lean` has no such declaration. Replace with "Keep the arithmetic conductor identification separate from the differentiation."

**Witness.** Only the text is wrong. §2.22's identity itself checks out: for `χ₋₄`, Lerch's formula gives `ℓ₀=0.7831888` and the closed form gives `ℓ₁=0.2456096`, so `ℓ₀+ℓ₁=1.0287984=−log4+γ+log(2π)`.

## Verified sound

**Previous review (at 979e68c), finding by finding.**

| Id | Status at 70913eb | Evidence |
| --- | --- | --- |
| R01 | repaired | `README.md:2044`: "the product over the `[K:ℚ]` Dirichlet characters `χ` modulo `f` trivial on `H`, with `χ*` the primitive character inducing `χ`; the trivial character contributes `ζ`". The Check at `:2051` computes `ℚ(√5)`: the factor `(1−11^(−s))^(−2)` appears on both sides. |
| R02 | repaired on this side | `README.md:13` names §§2.18a and 2.2a as the single owner, and `:3422–3426` lists ArtinRepresentations, AdelicAlgebraicGroups and ArithmeticGaloisRepresentations. The counterpart change is still missing in ArtinRepresentations at its head (#1711, 67a9da9): its §4.1 (README:1087–1103) still proves "Existence is Brauer induction" with the order at 1, and its §3.4 (README:980–982) still takes the formalism from AdelicAlgebraicGroups AA.2.4. AdelicAlgebraicGroups has moved AA.2.4 here (#792, README:78–81). The citation has to come from the later roadmap, so this belongs to #1711's review; no repair is possible in this folder. |
| R03 | repaired | `README.md:15`: "an LFunctions, Part II imports §2.3a rather than planning it again". |
| R04 | repaired | `README.md:934–940`: §1.1 is now §0.33 on the line `Re s=1`, with *Needs:* §0.33 and no quotation. Recomputed: `log(2|t|+2)≤2log(|t|+2)`, and the totalized `1/riemannZeta 1=−1.0236`. |
| R05 | repaired | `README.md:1366` cites Neukirch VII §§6–8 and LFunctions Layer 5 only. |
| R06 | repaired | Checks added at §0.2 (`:206–209`), §2.1a (`:1216–1219`; recomputed `K_(3/2)(2)=0.17991` and `K_(3/2)(2π)=0.0010823`), §3.20 (`:2536–2538`, including `Ψ(5,5)=5` against the library's 4), §0.29 (`:740–744`; recomputed `|1/Γ(−n−1/2)|=Γ(n+3/2)/π`) and §2.1c (`:1265`; `w=3−1/w` and `4log((1+√5)/2)=1.92485`). |
| R07 | repaired | `README.md:1474` names `zamanDelta`, `zamanG₁`, `zamanG₂` and `zamanQ`. A scan finds all 110 `Suggested.lean` names in the README. |
| R08 | repaired | `:1447` "The case `D_k=1`"; `:2078` and `:2090` split; `:2419` "`Nat.sqrt (N−4)`"; `:2447` "`(log 2)/2`, independent of `a`"; `:2140` "ERH(`L`)". No ".;" remains. New leftovers elsewhere are R04 above. |
| R09 | repaired | The description now reads "every supplier named in the README is on main … No open supplier: this pull request merges on its own". |

**Gate, build, form.**
- The gate re-run at this head passes: `… readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. Nothing outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AnalyticNumberTheoryPartI'` is empty).
- `lake env lean TauCetiRoadmap/AnalyticNumberTheoryPartI/Suggested.lean` exits 0 with exactly 60 ``declaration uses `sorry` `` warnings and no other output.
- One-tactic probe: in a scratch copy, every `sorry` became `first | (simp <;> done) | rfl | infer_instance | (norm_num <;> done) | trivial | decide`. The errors fall on exactly the 60 `sorry` lines (diffed), so nothing closes and nothing is padding.
- Binder check: `#check @name` for all 110 declarations in one scratch file, which exits 0. Only `section Hecke`'s `{K} [Field K] [NumberField K]` is inherited, by the four Hecke declarations, which use it. `lowerConductors_integral` keeps `IsDiscreteValuationRing`, `IsAdicComplete`, `PerfectField` of the residue field, `FaithfulSMul` and `FiniteDimensional`. No change was needed.
- Dependency check: `depcheck: 238 roadmaps, 2348 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. ORDER.txt places ZerosOfLFunctions at 48, this roadmap at 49 and AnalyticNumberTheoryPartII at 50.
- Citations tool: no cross-roadmap citation is found nowhere. Its 10 "Lean names found nowhere" leads are all declared: `atkinson.*` at `Suggested.lean:979–1006`, `zetaSecondMoment.*` at `:1013–1031`, `BeurlingPrimeSystem.*` at `:907–919`.
- Overlaps tool: no other open pull request changes this roadmap and no id is dropped; I confirmed both.

**Library declarations opened at the pins.**
- Mathlib:
  - `NumberField.dedekindZeta`, `dedekindZeta_residue`, `dedekindZeta_residue_def` and `tendsto_sub_one_mul_dedekindZeta_nhdsGT` (`NumberTheory/NumberField/DedekindZeta.lean:50, 57, 61, 78`; the residue is `2^r₁(2π)^r₂Rh/(w√|D|)`);
  - `Complex.digamma`, `digamma_one` and `digamma_one_half` (`Analysis/SpecialFunctions/Gamma/Digamma.lean:48, 56, 59`; no integral representation, as §1.8a says);
  - `Matrix.gram`, `posSemidef_gram` and `det_gram_ne_zero_iff_linearIndependent` (`Analysis/InnerProductSpace/GramMatrix.lean:40, 83, 126`);
  - `MvPolynomial.schwartz_zippel_totalDegree` (`Algebra/MvPolynomial/SchwartzZippel.lean:192`);
  - `Polynomial.resultant` and `resultant_eq_zero_iff` (`RingTheory/Polynomial/Resultant/Basic.lean:131, 912`);
  - `Matrix.det_le` (`LinearAlgebra/Matrix/AbsoluteValue.lean:43`), with no Hadamard determinant inequality anywhere, as §0.34c says;
  - `Int.IsFundamentalDiscr` (`NumberTheory/FundamentalDiscriminant.lean:41`; it excludes 0 and 20, admits −4, 8, 12 and 1);
  - `Function.rightLim` (`Topology/Order/LeftRightLim.lean`).
- Tau Ceti:
  - `TauCeti.IsLocalRing.ramificationGroup` (`RingTheory/LocalRing/RamificationGroup.lean:118`; `Ideal.inertia G (maximalIdeal S ^ (i+1).toNat)` with `i : ℤ`, so the `ℕ` indices of `lowerArtinConductor` start at inertia);
  - `fundamentalDiscriminantCharCast` (`NumberTheory/Multiquadratic/FundamentalDiscriminant/Realization.lean:32`);
  - `HeckeCharacter.normPow` (`…/HeckeCharacter/Shift.lean:80`);
  - `conductorExponent` and `finiteConductor` (`…/HeckeCharacter/FiniteComponent.lean:181, 254`);
  - `NumberField.Chebotarev.frobeniusPrimeCount` and `frobeniusPrimeSet` (`NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.lean:177`, `…/FrobeniusPrimeSet.lean:93`).

**Cross-roadmap citations and ownership resolved.**
- On main:
  - LFunctions README:203 (Artin objects left to ArtinRepresentations) and :209, :1324 (continuous infinity types left to LFunctions, Part II), both now addressed at `README.md:13–15`.
  - LFunctions `Suggested.lean:1440` (`dirichletData`).
- Open pull requests:
  - AdelicAlgebraicGroups #792 README:75–81 consumes §2.18a.
  - ArithmeticGaloisRepresentations #856 README:473–486 and :680 consumes `lowerArtinConductor`, `lowerSwanConductor` and `lowerConductors_integral` of §2.2a.
  - ArtinRepresentations #1711 README:183, :1720 and :2091 consumes §§2.31, 2.39 and 2.41; its unrepaired §§3.4 and 4.1 are noted in the table above.
  - SieveMethodsAndPrimePatterns #1495 README:73 and :77 consumes §0.32 and §3.34.
  - ErdosProgressionPowers #1336, EffectiveClassNumbers #1406 and ArithmeticStatisticsPartV #1175 cite §0.34.
- No open roadmap owns the Landau–Siegel exclusion (`roadmaps grep` for the object).
- Ownership against open pull requests was checked through the sibling checkouts (#1495, #1336, #1711) and `roadmaps show` (#856, #792).

**Seeded sample (15 targets, each read at its locator).**

| Target | Source read | Result |
| --- | --- | --- |
| 0.3 | `bs-annals` lines 303–307 ((10), p.362: `Σ_(q≤k)log q<1.000081k` from Schoenfeld) | supported; recomputed in row 1 |
| 0.8 | `bs-annals` lines 1316–1323 (p.384, uses RS Theorem 6) | supported; recomputed in row 2 |
| 0.9 | `openai2026lspdf` lines 23–25 (Theorem 1), 35–36 (FI on the zero-gap/`L(1,χ)` relation) | supported; the derivation was checked (row 4) |
| 0.18 | `bs-annals` lines 822–836 (Theorem 5, (26), p.374, with the exceptional term) | supported; source error at `N=1` (Source issues) |
| 2.17 | Mathlib `dedekindZeta_residue_def` (above); `gz1986` lines 2280–2302 (pp.283–284, (4.4)–(4.5) use `L(1,ε)`) | supported, as the README describes |
| 2.21 | `tz2017` lines 366–373 (Lemma 2.3, p.1142: `η∈(0,1/2]`, strip `−η≤σ≤1+η`, factor `ζ_Q(1+η)^(n_K)`) | supported |
| 2.25 | `dit-annals` lines 989–991 (p.971: `χ(J)=sign d=sign d′`, Kronecker's decomposition, between (7.7) and (7.8)) | supported |
| 2.34 | `tsimerman-annals` lines 231–236 (p.384, Cauchy on a small circle with convexity); `tz2017` as above | supported |
| 2.49 | `zaman-thesis` lines 416–421 ((1.18), p.7), 450, 457 ((1.20), (1.21), p.8); `ptw2017` lines 69–81 (Theorems A and B, p.2) | supported verbatim in content |
| 3.1 | `taodivisorbound` lines 70–92 (large primes at most 1; small-prime Taylor bound; prime count bounded) | supported (formulas stripped in the extraction; the structure matches) |
| 3.15 | `ghoshsarnak` lines 126–128 (p.3, family (iii) `k=4+u²`), 506–513 (§4.1, pp.12–13) | supported (an elementary count of a named family) |
| 3.16 | `ghoshsarnak` lines 1226–1233 (Prop 8.1, p.23), 1283–1285 (density `K^(1/2)(log K)^(−1/2)`, p.24) | supported; recomputed in row 17 |
| 3.23 | `ss2021` lines 31–38 ((1)–(2), p.1), 249–255 (Theorem 2, Table 1, p.4), 2884–2894 ((109), p.35) | supported |
| 3.36 | `dv2016` lines 84–90, 108–153 ((5)–(7) and the discrete Euler product, pp.2–3) | supported |
| 3.42 | `dv2016` lines 74–80 (Theorem 1, p.2), 190 (Theorem 2, p.4), 279 (Prop 1, p.6), 352 (Theorem 3, p.7), 459 (Lemma 1, p.9) | supported |

The §0.34c determinant argument was also read against `green2026` lines 25–43 (Theorem 1.1, `C` even, `R=X`, `S=J=⌊X/C⌋`, `N=2X^(1/2)`) and lines 71–262 (Lemma 3.1, (4.2), Lemma 5.1, (6.1)). The README's own `N=X^(2/3)`, `J=N`, `3∣C` satisfy Lemma 3.1's (3.2) as `N²>2RS/N+R+S`. They give `(1+1/C)(2/3+1/(2C))`, as stated.

**Adversarial table (values computed).**

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | §0.3 `theta_lt_of_schoenfeld` | `x=2, 10, 100, 1000` | `θ=0.6931, 5.3471, 83.7284, 956.2453` against `2.0002, 10.0008, 100.0081, 1000.081` | holds |
| 2 | §0.8 | `x=319, 10⁵`, `E=−1.3325823` | `Σ(log p)/p−log x=−1.2472186, −1.3286305` within `[−1.4193097, −1.2458549]` and `[−1.3760117, −1.2891528]` | holds (margin 0.00136 at 319) |
| 3 | §0.5 at `x=59` | `π(59)=17` | `16.2438<17<19.7924` | holds |
| 4 | §0.9 `quadratic_LFunction_one_lower_bound` | `χ₋₃, χ₋₇, χ₅` | `L(1)log q=0.6642, 2.3106, 0.6927`; the derivation gives `Re 1/(σ−ρ)≤(1+2/c₂)Re 1/(σ′−ρ)` and `L(σ₁)≥(σ₁−1)/σ₁` | holds |
| 5 | §0.18 `character_psi_le` | `N=1` excluded; `N≥3` | at `N=1` the error `(log 1)^4=0` while `ψ(X)∼X`; `(log 3)^4=1.4567` absorbs `2X e^(−c_LS log X/log N)` | holds |
| 6 | §0.34c and §0.34 | `C=12, 15, 18, 30` | `(1+1/C)(2/3+1/(2C))=0.7674, 0.7467, 0.7330, 0.7061` against `3/4`; combination `(C/4−1−A−AC²δ)log q≤B+K_C` ⇒ `δ≥1/(16AC)` once `C≥8(1+A)` | holds for `C≥15` |
| 7 | §0.34a / `Int.IsFundamentalDiscr` | `q=12`; `D=−4, 8, 12, 20, 0` | `χ₁₂(5)=(2/5)=−1=χ₋₃(5)χ₋₄(5)`; fundamental: yes, yes, yes, no (`x=5≡1`), no | holds |
| 8 | §0.4 | `k₀=2·10¹⁰` | margin `(1−3ε)/8−0.1239=4.5875·10⁻⁵=367/8000000` against `2(1/140000+35/7290000)=2.3888·10⁻⁵` | holds |
| 9 | §0.11d bounds | `x=1.5, 2, 3, 4, 5` | upper `0.311, 0.733, 1.845, 3.238, 4.852` ≥ `log⌊x⌋!=0, 0.693, 1.792, 3.178, 4.787` | holds |
| 10 | §1.1 | `t→0`; totalized value | `Zinv(1+2it)=2it+O(t²)`; `1/riemannZeta 1=−1.0236` | holds |
| 11 | §2.15 `dedekindZeta_residue_le` | `ℚ(∛2)`, `D=108`, `R=1.34729` | `κ=0.81462≤(e log 108/4)²=10.1241` | holds |
| 12 | §2.17 and §2.27 | `D=−7`, `h=u=1` | `L(1)=π/√7=1.1874104` (series to 2·10⁶: `1.1874109`); `L(0)=−(1/7)Σaχ(a)=1=h/u` | holds |
| 13 | §2.22 and §2.22a | `χ₋₄`, `Q=4`, `g=1` | `ℓ₀=0.7831888`, `ℓ₁=0.2456096`, sum `1.0287984=−log4+γ+log2π` | holds |
| 14 | §2.25 | `D=12=(−3)(−4)` at `p=5, 7, 11, 13` | ideal factors `(1−25^(−s))⁻¹, (1−49^(−s))⁻¹, (1+11^(−s))⁻², (1−13^(−s))⁻²` equal `L(χ₋₃)L(χ₋₄)` factors; `χ(J)=−1=sign d` | holds |
| 15 | §2.34 | `r=min(ε,1/4)` | circle real parts `[1−r,1+r]⊂[−r,1+r]`; exponent `(1+r−σ)/2≤r`; `Q=D_E/D_F≤D_E` | holds |
| 16 | §2.49 against LO Theorem B | `L=ℚ(i)`, `n=2`, `D=4` | the region and range `x≥exp(20 log²4)=e^(38.4)` match `ptw2017` (1.3)–(1.4) | holds |
| 17 | §3.16 | `M=4`, `R={3}`, `X=10⁶` | class 1: 62811 (`0.2335·X/√log X`); class 3: 72313 (`0.2688·X/√log X`); `R={1}`: class 3 count 0 | holds |
| 18 | §3.15 | `K=3, 4, 5, 13` | counts `0, 1, 2, 4` against bounds `1, 1, 2, 4` | holds (tight) |
| 19 | §3.1 | `ε=1`, `B=3`; `ε=1/2`, `C=1` | `D³=3.003`: `τ(12)=6≤36`; `τ(2)=2>√2` (the Check) | holds |
| 20 | §3.23 and `atkinson_bound` | `T₀=10³⁰` | `T log(T/2π)+(2γ−1)T≡T log T−(1+log2π−2γ)T`; normalized error `3.87+…=109.548<110` | holds |
| 21 | §3.23a `BBRFiniteInput` (non-vacuity) | `ζ(3/4)=−3.4412854`, `ζ(1/2)=−1.4603545` | `κ₇=0.4076521` is consistent with `|I_1(10⁷,7/4)|≤0.4077`; `κ₃=0.5741332` | consistent |
| 22 | §2.9 `ZamanDigammaInput` (non-vacuity) | 11 triples and `α=5.8` | e.g. `Q(8.92,54)=1.74982<1.75`, `Q(11.21,332)=2.07038<2.07083`; `0.688104<0.6882`; all 12 true | the hypothesis holds |
| 23 | §3.24a | `s=2` | `ζ(2)⁴/ζ(4)=6.764520`; `Σ_(n≤2·10⁵)τ²/n²=6.762254` | holds |
| 24 | §3.13 `landau_ramanujan` | `p≡3 (4)` up to 2·10⁶ | `C_L=0.7642236` | holds |
| 25 | §3.36 and §3.42 | doubled primes; ordinary primes | `ζ_P=ζ²`, `N(x)∼x log x`, so both sides fail; `N(x)=⌊x⌋`, `a=1`, so both hold | holds |
| 26 | §2.42 abelian bullet (R01 repaired) | `ℚ(√5)`, `H={1,4}` | at 11: `(1−11^(−s))⁻²` on both sides; at 2: `(1−4^(−s))⁻¹` on both sides | holds |
| 27 | `landau_page_bounded_height` | `q=1`, `T=2`; `q=2` | `ζ` has no nontrivial zero below 14.13; the character modulo 2 is not primitive | holds |
| 28 | §1.5 `dirichlet_polynomial_mean_square` | `N=2`, `a=(1,1)` | error `4|sin(T log2)|/log2≤5.771≤18π` | holds |
| 29 | `lowerConductors_integral` | `ℚ₂(i)/ℚ₂`; `ℚ₂(√2)` | `a=1+1=2`, Swan 1; `a=3` | holds |
| 30 | R02 target (§2.9) | `L=F=k`, `C={1}` | `|C|/|G|=1`; Zaman's constant is absolute (`zaman-thesis` 1059–1063) against `c_n` here | narrower than source (R02) |
| 31 | R03 definitions | listed in R03 | `δ(2,0)=−0.5772157` against `0.4227843`; `0.9915286` against `0.5322543`; `0.1537822` against `−0.0315315` | Checks missing (R03) |

**Cached open copies read (labels used above).** `bs-annals`: [47] Annals 191 (2020). `tsimerman-annals`: [64]. `zaman-thesis`: [67]. `tz2017`: [73], ANT 11:5. `dit-annals`: [60], Annals 184. `ghoshsarnak`: [82], arXiv 1706.06712v3. `ss2021`: [87], arXiv 2105.06821v3. `dv2016`: [90], arXiv 1601.05324v2. `ptw2017`: [78], arXiv 1709.09637, fetched for this review into a scratch manifest only. `gz1986`: [71]. `loww`: [66].

## Not verifiable

- Rosser–Schoenfeld, Illinois J. Math. 6 (1962), Theorems 1, 5, 6 and 11 (§§0.3, 0.5, 0.8, 0.19, 0.25). The previous review found no PDF on the Project Euclid landing page, and no copy is cached. §§0.3, 0.5 and 0.8 were recomputed (rows 1–3).
- Schoenfeld, Math. Comp. 30 (1976), "concluding note p.360" (§0.3). The sources service rejected the AMS host (no licence class).
- Koukoulopoulos, *The Distribution of Prime Numbers* (Theorem 12.9 for §0.9, and the other cited theorems), and Iwaniec–Kowalski, Theorem 5.27 (§0.18): paywalled books.
- Friedlander–Iwaniec 2018 ([113], §0.9): settled as uncertified.
- In `taodivisorbound` the formulas are images, so only the proof structure could be compared (row 19).

## Source issues

- **Misprint** in [47] Bennett–Siksek (Annals 191, 2020) at (10), p.362: the source cites Schoenfeld's bound at "[35, p. 160]", but [35] (Math. Comp. 30) occupies pp.337–360; it should cite a page within 337–360 (p.360); affects nothing.
- **Error** in [47] Bennett–Siksek (Annals 191, 2020) at Theorem 5, (26), p.374: for the trivial primitive character, `N=1` and `δ_χ=1`, the error term carries the factor `(log N)^4=0`, so (26) asserts `ψ(X)=X` exactly; it should use `(log 3N)^4` or exclude `N=1`; affects nothing (it is applied to nontrivial characters).
- **Misprint** in [67] Zaman's thesis at Lemma 7.2.3, pp.159–160: premise and conclusion print `B≥40` and `x≥D_L^40`, while Theorem 1.3.1 (p.12), deduced from this lemma, asserts `x≥D_L^35`; it should read 35 in both places, since the proof uses nothing specific to 40; affects a stated result.
- **Misprint** in [67] Zaman's thesis at §7.2.4, p.168: with `ℓ=⌈ℒ⌉` and `A=0.88/ℒ` the source claims `B−2ℓA≥33.24`; for non-integer `ℒ` it is only `≥33.24−1.76/ℒ` (for example `≥33.23` for large `D_L`); affects nothing (the margin absorbs it).
