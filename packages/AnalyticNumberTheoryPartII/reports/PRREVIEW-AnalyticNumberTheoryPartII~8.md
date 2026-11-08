# Review of AnalyticNumberTheoryPartII (pull request #1167 at d58f419)

**Verdict:** needs changes

:robot: Independent AI review, a full review of `TauCetiRoadmap/AnalyticNumberTheoryPartII/` (274 lines changed since 480e1c2). The gate fails on two `statement-hygiene` hits (R04). The new harmonic-analysis block §§5.3f–5.3n carries one false identity (R01), a missing hypothesis (R03), and objects that three other open roadmaps also own (R02).

**Previous review.** The r6 review of 480e1c2 accepted with no findings, so nothing carries over. The four r5 repairs it confirmed still hold at this head: `Suggested.lean:97` uses `Subgroup.derivedSeries`; lines 1–4 and 51 keep the module header and `@[expose] public section`; §5.7a is at `README.md:805`; and `README.md:39` and `:782` name `NumberField.natAbs_discr_eq_absNorm_differentIdeal_mul_natAbs_discr_pow`, `Ideal.absNorm_relNorm` and `NumberField.discr_dvd_discr`.

## R01 (P1) — §5.3g/§5.3h: the double transform is the identity, not `f(−x)`, for the alternating pairing they apply it to

**Location.** `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md:653`: "there is exactly one Haar measure, the self-dual measure, for which `f↦f̂` is a linear bijection of `S(V)` with `f̂̂(x)=f(−x)`". The same bullet then applies this to "the binary-cubic alternating pairing of §5.10a". The same claim appears at `:655` (the partial transform "has square the reflection of the `V₂` coordinate") and at `:661` (§5.3h, "satisfies `f̂̂(x)=f(−x)`").

**Claim.** This holds only for a symmetric `B`. For any nondegenerate `B`, `f̂̂(z)=∫∫f(x)ψ(B(x,y)+B(y,z))=f(−τz)`, where `τ` is defined by `B(τz,y)=B(y,z)`. For the alternating pairing `[x,y]=x1y4−x2y3/3+x3y2/3−x4y1` (where `[y,x]=−[x,y]`), `τ=−1`, so `f̂̂=f`. Rescaling the measure by `c` only multiplies `f̂̂` by `c²`. So no Haar measure satisfies the stated characterization: the self-dual measure of §5.10a, and therefore §5.21e's Poisson step and §5.21j's partial transforms, are defined by a condition that nothing meets.

**Witness.** Take `V=ℝ²`, `B=x₁y₂−x₂y₁` and Lebesgue measure. Then `f̂(y)=F(−y₂,y₁)` with `F` the standard transform, and `f̂̂=f`. For `f(x)=exp(−π|x−(1,0)|²)` this gives `f̂̂(1,0)=1`, but `f(−1,0)=e^(−4π)`. A finite model, `(ℤ/5)²` with point mass `1/5` and a random `f`, computes `max|f̂̂−f|=6·10⁻¹⁶` and `max|f̂̂−f(−·)|=0.84` for the alternating pairing; for `x·y` the two values are reversed.

**Repair.**
- In §5.3g, replace "with `f̂̂(x)=f(−x)`" by "with `f̂̂(x)=f(−τx)`, where `τ` is defined by `B(τx,y)=B(y,x)`: `τ=1` for symmetric `B` and `τ=−1` for alternating `B`, so `f̂̂=f` for the pairing of §5.10a".
- At `:655`, say that the square of the partial transform is `f↦f∘(1×(−τ₂))`.
- Make the same change in §5.3h.
- Add this Check: on `F_v²` with `x₁y₂−x₂y₁`, the double transform fixes a function that is not even.

Tested: with `τ=−1` the formula gives `f̂̂=f`, matching both computations above. It also agrees with §5.3d's Check: `C_R(u)C_R(2−u)` computes to `I` with entry error at most `4·10⁻¹⁵` at `u=0.7, 0.4, 1.3+0.2i`. The measure factor `|det A|^(1/2)=|1/9|^(1/2)=|3|^(−1)` is unaffected.

## R02 (P2) — The harmonic analysis of §§5.3f–5.3m is also owned by three other open roadmaps

**Location.** `README.md:15`: "The binary-cubic zeta integral runs on harmonic analysis that this part states itself (§§5.3f–5.3h, §§5.3j–5.3n and §5.21w)". The corresponding Lean statements are `exists_unique_restrictedAddHaar` (`Suggested.lean:262`) and `exists_unique_quotientMeasure` (`:291`). Meanwhile `README.md:7` still says "generic carriers and supplier theory are imported".

**Claim.** The same objects have other owners at the heads of open roadmap pull requests:
- **AdelicAlgebraicGroups (#792 at 2ca91be).**
  - Restricted products of Haar measures: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:685` (*restricted-haar-product*) and `Suggested.lean:73` `RestrictedHaar.exists_unique_haarProduct`, the multiplicative form of this file's lines 262–273, with the same `Countable`, LCH, second-countable, `Fact (IsOpen)`, cofinite-compact and cofinite-mass-one hypotheses and the same box formula.
  - Weil's quotient measure: `README.md:1808` (*quotient-measure*) and `Suggested.lean:238` `HomogeneousMeasure.exists_unique_quotientMeasure`, the same statement as this file's lines 291–305 (right Haar given there as `μ.inv.IsHaarMeasure`).
  - Quotient measures in stages and the inversion between the two quotient conventions: `README.md:1846` and `:1863`.
  - Reduction theory and finiteness of class numbers, with `GL₂` as a worked case: `README.md:5` and `:52`. This overlaps §5.3m.
- **ArithmeticGaloisRepresentations (#856 at f901260)**, §2.7 **Global inputs** (`README.md:2257`): the standard trace character, self-dual measures, the adelic Schwartz–Bruhat space and Poisson summation. These are §§5.3g–5.3h.
- **AutomorphicLFunctionsAndLocalFactors (#924 at 4ea5784):**
  - AL.0.2.3, the self-dual local measure (`README.md:562`);
  - AL.0.4, adelic Schwartz spaces, Poisson summation and partial transforms (`:742`);
  - AL.1.1.2, the local Tate zeta integral (`:919`), which is §5.3j;
  - its line 12 assigns restricted Haar products and quotient measures to AdelicAlgebraicGroups.

**Witness.** Compare the two `exists_unique_quotientMeasure` signatures: same `G` binders, the same `hH`, the same `hmod` on `Measure.modularCharacter`, and the same `∃!` over measures finite on compacts, right-invariant and satisfying Weil's formula. Only the namespace differs.

**Repair.** Keep one owner. In ORDER.txt this roadmap (line 53) precedes AdelicAlgebraicGroups (55), ArithmeticGaloisRepresentations (56) and AutomorphicLFunctionsAndLocalFactors (91), so by the merge-order rule it keeps these sections and the others cite them:
1. Rewrite `README.md:7` so that it states this ownership instead of "generic carriers and supplier theory are imported".
2. List these consumers under `## Downstream consumers` (line 3077):
   - AdelicAlgebraicGroups, for §§5.3f, 5.3k and 5.3m;
   - ArithmeticGaloisRepresentations §2.7 and AutomorphicLFunctionsAndLocalFactors AL.0.2–AL.0.4 and AL.1.1.2, for §§5.3g, 5.3h and 5.3j;
   - AutomorphicSpectralTheory, for §5.3n and §5.21w. It already cites them at e73fe1f, `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:48`.
3. In the pull-request description:
   - name #792, #856 and #924 in the merge-order paragraph as the pull requests that replace their copies with citations of these sections, as #925 already has;
   - drop #792, #924 and #925 from its dependency list, since the README no longer cites them and #925 now consumes this roadmap.

## R03 (P2) — §5.3f: the Fubini clause needs `S` to contain every exceptional index

**Location.** `README.md:642`: "For a finite set `S` of indices, the open subgroup `U_S=∏_(i∈S)G_i×∏_(i∉S)B_i` carries `ν` to the product of the `μ_i` for `i∈S` with the infinite product of the probability measures `μ_i|B_i` for `i∉S`".

**Claim.** The hypotheses allow finitely many `i` with `B_i` noncompact or `μ_i(B_i)≠1`. If such an `i` lies outside `S`, then `μ_i|B_i` is not a probability measure, so the `MeasureTheory.Measure.infinitePi` of the proof is not available and the stated product is wrong.

**Witness.** Take `ι` the primes, `G_p=ℚ_p`, `B_p=ℤ_p`, `μ_2=2·Haar`, so that `μ_2(ℤ_2)=2`, which the hypotheses allow. For `S=∅`, `μ_2|ℤ_2` has mass 2, while the box formula gives `ν(U_∅)=∏_pμ_p(ℤ_p)=2`. Similarly, `B_i=G_i=ℝ` outside `S` gives an infinite factor.

**Repair.** Read "for a finite set `S` containing every `i` with `B_i` not compact or `μ_i(B_i)≠1`". Tested on the witness: `S` must contain 2. Then the factors `μ_p|ℤ_p` with `p≠2` are probability measures, and `ν(U_{2}∩∏ℤ_p)=μ_2(ℤ_2)·1=2` agrees with the box formula.

## R04 (P3) — Gate failure: `letI` in two theorem signatures

**Location.** `Suggested.lean:268` (`letI : MeasurableSpace (Πʳ i, [G i, B i]) := borel _`) and `:299` (`letI : MeasurableSpace (MulAction.orbitRel.Quotient H G) := borel _`).

**Witness.** Rerunning the gate at d58f419 prints `statement-hygiene=2 … FAIL`, with exactly these two lines (rule: no `letI`/`haveI` in a signature).

**Repair.** The gate's repair is to use an instance binder or a named instance, for example the scoped `instance … := borel _` with its `BorelSpace` instance that AdelicAlgebraicGroups' `Suggested.lean:59–63` uses. Deleting both theorems, as R05 asks, also clears the gate.

## R05 (P3) — Suggested.lean: foundational lemmas presented as headlines, a list of names, and no layer sections

**Location.**
- `Suggested.lean:250–335`: `exists_unique_restrictedAddHaar`, `exists_unique_quotientMeasure`, `gl2Rational`, `gl2Integral` and `gl2_classNumber`.
- Comment lines 277–280: "-- Supplied by AnalyticNumberTheoryPartI: … `heckeConductorScale`".
- Docstring lines 30–36.
- No `/-! ## Layer k: … -/` comments, although the file states Layer 4, 5 and 6 targets.

**Claim.**
- Restricted Haar products, Weil's formula and the `GL₂` class number are inputs to §5.11's zeta integral. They are not headline theorems of a roadmap whose summary (`README.md:3`) is Lerch and Barnes functions, double Dirichlet and binary-cubic zeta functions, the Bost–Connes phase transition and spectral determinants. The file is the acceptance test, not an API catalogue.
- `gl2Rational` and `gl2Integral` exist only to state `gl2_classNumber`, and the README never names them (`grep` count 0).
- The comment block is a list of supplier names, which the form rules exclude.

**Repair.**
1. Delete the five declarations and the comment block. The README keeps §§5.3f, 5.3k and 5.3m as targets; change the backticked `exists_unique_restrictedAddHaar` (`README.md:642`), `exists_unique_quotientMeasure` (`:678`) and `gl2_classNumber` (`:699`) to prose, or the gate reports them missing.
2. Shorten docstring lines 30–36 to one sentence.
3. Insert `/-! ## Layer 4: … -/`, `## Layer 5` and `## Layer 6` comments before the current lines 60, 175 and 337.

Tested: this edit, on a scratch copy elaborated with `lake env lean`, exits 0 with exactly ten `declaration uses sorry` warnings and nothing else.

## Verified sound

**Gate, build and dependency check.** My gate rerun matches the worker's `gate.md` (only the R04 hits). The worker's targeted build reports `build=0`. The dependency check (`gate --depcheck … --movable`) prints `depcheck: 237 roadmaps, 2427 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration.** `lake env lean` on a copy of `Suggested.lean` with `#check @name` for all 30 declarations exits 0 with 13 `declaration uses sorry` warnings and no other message. The three new sections keep every section binder in their types: the elaborated `exists_unique_restrictedAddHaar` shows `ι`, `G`, `B` and all instance binders, and `gl2_classNumber` shows `K`. I compared every elaborated type with its README statement: the 25 carried declarations are unchanged from r6, and the new ones match §§5.3f, 5.3k and 5.3m. A one-tactic probe does not apply (none of the 13 `sorry` theorems is a definitional or library one-liner).

**Headlines.**
- Stated: Lerch continuation and second-derived invariance, the two completed Lerch equations, complex Hurwitz continuation, the Barnes expansion, the quadratic large sieve and fourth moment, the double-series continuation, Eisenstein generation, critical uniqueness and supercritical parametrization.
- Named as not statable in the docstring: the cubic Shintani results, KMS states and the phase transition in state form, type III₁, and the Selberg determinant.
- Not headlines, as in r6: §5.7 and §5.7a are exported intermediate bounds.

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9):
- `MeasureTheory.Measure.modularCharacter` (`Mathlib/MeasureTheory/Group/ModularCharacter.lean:130`) with `map_right_mul_eq_modularCharacterFun_smul` (`:93`): `map (·*g) μ = Δ(g)•μ`. The left Haar measure `|t₁/t₂|^(−1)dx d^×t` of `B` gives `λ(Es⁻¹)=|s₁/s₂|λ(E)`, so `Δ_B=|t₁/t₂|`, as §5.3l states.
- `DoubleCoset.Quotient` (`Mathlib/GroupTheory/DoubleCoset.lean:79`, setoid at `:75`).
- `QuotientGroup.integral_eq_integral_automorphize` (`Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:378`). This is the discrete-subgroup case only: no Weil formula for closed subgroups and no restricted-product measure exists in Mathlib or Tau Ceti.
- `IsFundamentalDomain.quotientMeasure_eq` (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean:630`).
- `RealRMK.integral_rieszMeasure` (`RieszMarkovKakutani`).
- `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` (`Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:66`).
- `SchwartzMap.fourierTransformCLM` (`Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean:53`).
- `fourierIntegral_gaussian` (`Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:201`).
- `SchwartzMap.tsum_eq_tsum_fourier` (`Mathlib/Analysis/Fourier/PoissonSummation.lean:215`).
- `differentIdeal` (`Mathlib/RingTheory/DedekindDomain/Different.lean:481`).
- `NumberField.dedekindZeta_residue` (`Mathlib/NumberTheory/NumberField/DedekindZeta.lean:57`).
- `NumberField.abs_discr_gt_two` (`…/Discriminant/Basic.lean:275`).
- `NumberField.discr_dvd_discr` (`…/Discriminant/Different.lean:120`).
- `Ideal.absNorm_relNorm` (`Mathlib/RingTheory/Ideal/Norm/RelNorm.lean:464`).

**Cross-roadmap citations resolved.**
- AnalyticNumberTheoryPartI at its head ead4cdb, 15 ids:
  - §0.9 (`README.md:273`, `quadratic_LFunction_one_lower_bound`), §0.23a (:599), §0.31b with `.siegel_gap` (:748–750) and §0.34 (:778, `landau_siegel_exclusion`);
  - §2.1a (:1066), with `besselK`, `besselK_neg` and `besselK_one_half` in its Lean at :425–436;
  - §2.3a (:1199), with `heckeContinuation`, `heckeFiniteFactor`, `heckeArchFactor` and `heckeConductorScale` at Lean :506–531;
  - §2.5 (:1238), §2.7 (:1260), §2.15 with `dedekindZeta_residue_le` (:1406–1408), §2.21 (:1548), and §2.31e with both interfaces (:1712–1720);
  - §3.1 (:2050), §3.23 with `BBRFiniteInput` (:2448–2452) and §3.24 (:2805).
- Roadmaps on main:
  - VonNeumannAlgebras: V4, V8, V11, V10.Hecke, V10.AffineHecke, V10.AffineAP, V10.AffineType, V10.ModularTheory and V10.KMS all occur;
  - OperatorAlgebraDynamics D1 (:75), D2 (:143) and D7 (:470);
  - AmenableGroups Layer 6 (:391); ComplexKahlerGeometry K5a (:570); DifferentialGeometry Layer 12 (:910); FuchsianOrbifolds Layers 0–2 and 4;
  - completed: UniversalCovers Stages 0 and 2, GlobalNumberFields Layers 4 and 10, ProfiniteArithmetic Layer 0.
- Consumers:
  - AutomorphicSpectralTheory at e73fe1f cites §5.3n and §5.21w; it is at ORDER line 93, after this roadmap;
  - the ArithmeticStatistics parts follow at 107 and later.
- Overlaps: no other pull request changes this folder or drops an id it cites. This pull request drops no id: the diff only adds §§5.3f–5.3n and §5.21w and edits text.

**Sources checked at their locators.**
- **Neshveyev02** (arXiv math/0002141v1): (1β) is line 36, p.1; `μ(W)=1/ζ(β)` for `β>1` and the unit-orbit decomposition are lines 39–45, pp.1–2; the product density is lines 46–52 and the Proposition line 55, both p.2. These confirm §§6.2, 6.10 and 6.48a–b.
- **Neshveyev09** (arXiv 0907.1456v1): §1 ratio set, type III₁ and asymptotic ratio set are lines 58–90, p.2; Theorem 2.1 line 123, p.3; Lemma 2.3 line 151, p.4; the proof of Theorem 2.1 line 181, p.5. These confirm §6.42 and §§6.42a–6.42h.
- **ConnesMarcolli08** (author page):
  - Definition 3.4 is line 20389, p.445; Definition 3.6 line 20422, p.446; Definition 3.7 and Proposition 3.8 are on p.447 (lines 20445, 20466). These confirm §§6.29 and 6.30.
  - (3.70), with `φ₁` KMS at `β=1`, is lines 20996–21012, pp.460–461 (§6.29).
  - Lemma 3.27 with (3.91) and (3.92) is lines 21129–21133, p.464; (3.101) is line 21186, p.465 (§§6.3 and 6.31).
  - Lemma 3.28 (3.100) is line 21171, which is `firstEisenstein` (§6.26).
  - Theorem 3.30(1) is line 21292 (§6.37).
  - Theorem 3.32 is lines 21629–21659, pp.474–475, with (3.135) at line 21648 and (3.138)–(3.141) at lines 21662–21676, p.475 (§§6.43–6.50).
- **JSS25** (arXiv 2512.16681v2): §4 begins at line 639, p.13; (4.2) is on p.13, (4.3)–(4.4) on p.14 and (4.5)–(4.6) on p.15 (§6.6).
- **LOWW**: Lemma 2.5 is line 393, p.8; Remark 2.7 line 403, p.8; Remark 3.3 line 513, p.10; Proposition 3.4 line 535 and Lemma 3.5 line 539, p.11 (§5.7).
- **Blomer11** (arXiv 0907.4867v1): §2.1 with (7) is line 173 and (8)–(13) lines 184–226; Lemma 2 is line 388; (29) and (31) are lines 422 and 446; (32)–(35) are lines 481–529. These numbers are the ones §§5.1 and 5.14–5.26 cite.
- **Stark74**: Lemmas 3, 4 and 8 are as recorded in r6 and are unchanged here.

**Adversarial table** (40 rows; every value was computed this round).

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §4.13 `a(k)` | `k=1`; `k=2`, `p=2` | `c_1(j)=1`, local factor `(1−p⁻¹)/(1−p⁻¹)=1`; `Σ(j+1)²x^j=(1+x)/(1−x)³`, so `(1−x)⁴(1+x)/(1−x)³=1−x²`, `p=2`: `3/4`, `a(2)=1/ζ(2)=0.6079` | Holds | None |
| §4.13 `g(k)` | `k=1,2,3` | `G(2)²/G(3)=1`; `G(3)²/G(5)=1/12`; `G(4)=2`, `G(7)=34560`, `4/34560=1/8640=42/9!`; `∏_{j<3}j!/(j+3)!=(1/6)(1/24)(2/120)=1/8640` | Holds | None |
| §4.14 `k=2` constant | Ingham | `a(2)g(2)=(6/π²)/12=1/(2π²)=0.05066` | Holds | None |
| §4.2 Checks | `ζ_H(2,1+i)−ζ_H(2,2+i)`; `c=1/2` | `(1+i)^(−2)=1/(2i)=−i/2`; `Σ(n+1/2)^(−s)=2^s(1−2^(−s))ζ(s)` | Holds | None |
| §4.3 Checks | `G(1)` to `G(5)`, `N=1`, `t=1/2` | `w=0` gives 1; `G(5)=0!1!2!3!=12`; `B₄(1/2)=7/240`, `−1/30−7/240=−1/16`; first omitted term `−1/(720r²)` | Holds | None |
| `barnesG_asymptotic` | Expand `z log Γ(z+1)` | `B₂/2−1/12=0`; tail coefficient `1/(4j(j+1))−1/((2j+1)(2j+2))=1/(2j(2j+1)(2j+2))`, as in the Lean sum | Holds | None |
| `complexHurwitzContinuation_exists` | `m=0,1`, `c=1` | `−B₁(1)=−1/2=ζ(0)`; `−B₂(1)/2=−1/12=ζ(−1)`; `H(0,c)=1/2−c` | Holds | None |
| `lerch_completed_functional_equations` | Apply the equation twice | `i^k e^(−2πiac)·i^k e^(−2πi(1−c)a)=(−1)^k e^(−2πia)`; `Λ_k(s,1−a,1−c)·(−1)^k e^(−2πia)` reproduces `Λ_k(s,a,c)` from the definition | Consistent involution | None |
| `lerchContinuation_solvable` | Basepoint `(1/2,−1,1/2)` | `z=−1∉{0,1}`, `c∉−ℕ`; integral: `Re s=1/2>0`, `Re c>0`, `−1∉[1,∞)` | Well defined | None |
| §5.1/§5.17 | `d=9`, `ψ1`; `d=1`, `ψ2` | `(9/3)=0`; `ψ2(3)=−1` | Holds | None |
| §5.15 `A` | 16×16 numeric | `max|A²−I|=0`, `max|A−Aᵀ|=0`, `A[(0,0),(0,0)]=0.5`, `A[(0,0),(1,1)]=−0.5` | Holds | None |
| `quadraticReflectionFactors` | `ψ−1`, `η=1` (residue 3), `s=0` | `q=1`, `κ=1`, `e=(−1)^1=−1`: `(1/π)^(1/2)·Γ(1)/Γ(1/2)·2/(3/2)=4/(3π)` | Matches §5.26 | None |
| §5.26 Checks | `B(0)[(1,0),(1,0)]` | `¼(2/π+4/(3π)+2/π+0)=4/(3π)=0.4244`; `ψ1` block `1/Γ(0)=0`; `ψ2` block scalar | Holds | None |
| §5.23 Checks | `ψ−2`, `s=0`; `ψ2`, `s=1/2` | `(8/π)^(1/2)/Γ(1/2)=√8/π`; `q⁰Γ(1/4)/Γ(1/4)=1` | Holds | None |
| §5.18 Checks | `(−2,−2)`, `(0,0)`, `(10,10)` | membership `B0..B5`: `(−2,−2)` F,F,F,F,T,T; `(0,0)` all F; `Q(10,10)=3·9.5²=1083/4`; `Q≤2(x²+y²)+3` iff `½[(x+3/2)²+(y+3/2)²]≥0` | Holds | None |
| `quadraticDoubleSeries_continuation` | `P∘α`, `P∘β` | `P(w,s)=P(s,w)`; `P(βp)=(−s)(w−1)(s+w−3/2)`; reflection block `=∏r.2·B` | Consistent | None |
| §5.3d | `u=0.7, 0.4, 1.3+0.2i` | `C_R(u)C_R(2−u)=I`, error ≤`4·10⁻¹⁵` | Holds | None |
| §5.3e | `u=0.7, 1.3, 0.9+0.3i` | `C_C=7.6029247` and `−det C_R=7.6029247`; `0.13152833` both; `C_C(1)=1` | Holds | None |
| §5.3g self-dual characterization | `ℝ²` alternating; `(ℤ/5)²` | `f̂̂=f`; finite: `|f̂̂−f|=6·10⁻¹⁶`, `|f̂̂−f(−·)|=0.84` | **Fails** | R01 |
| §5.10a `det A` | binary-cubic pairing | permutation `(14)(23)` even; `(−1)(1/3)(−1/3)(1)=1/9`; `|1/9|^(1/2)=|3|^(−1)` | Holds | None |
| §5.10 vs §5.10b | `|P|^(s−1)` | `P(gx)=det(g)²P(x)`; `b_F|Δ|/o_α·|det g|^(2s−2)|Δ|^(s−1)|det g|²` gives `(1−q⁻¹)(1−q⁻²)|Δ|^s/o_α` | Consistent | None |
| §5.3f Fubini clause | `S=∅`, `μ_2(ℤ_2)=2` | `μ_2|ℤ_2` mass 2; `ν(U_∅)=2` | **Fails** | R03 |
| `exists_unique_restrictedAddHaar` | `ι` empty; `ι={0}`, `G=B=ℝ`; one factor with mass `∞` and one with `0` | singleton, `∏ᶠ_∅=1`, `ν=δ`; cofinite filter is `⊥`, `ν=μ₀`; `0·∞=0` in `ℝ≥0∞`, as for product measure | Holds | R04, R05 |
| `exists_unique_quotientMeasure` | `H=G`; `G=ℝ, H=ℤ`; Borel of `SL₂(ℝ)` | point quotient, `ν=c·δ`; Lebesgue on `ℝ/ℤ` with mass 1; `Δ_B≠1=Δ_G`, so the hypothesis fails (there is no invariant measure) | Holds | R02, R04, R05 |
| `gl2_classNumber` | `K=ℚ`; `K=ℚ(√−5)` | 1 double coset, `h=1`; Steinitz classes `[O],[𝔭₂]`, giving 2, `h=2` | Holds | R05 |
| §5.3l moduli | `n(x)t` | left translation preserves `|t₁/t₂|^(−1)dx d^×t`; right translation scales it by `|s₁/s₂|^(−1)` | Holds | None |
| §5.3l `ι` height | `diag(t₁,t₂)` | `ι(diag)=diag(t₂⁻¹,t₁⁻¹)`; `|t₂⁻¹/t₁⁻¹|^(1/2)=t(g)` | Holds | None |
| §5.3m height | `g=n(x)diag(t)k` | `|det g|/‖e₂g‖²=|t₁t₂|/|t₂|²=|t₁/t₂|` | Holds | None |
| §5.3n intertwiner | finite, real, complex | `N𝔇^(−1/2)[1+(1−q⁻¹)q^(1−z)/(1−q^(1−z))]=N𝔇^(−1/2)ζ_v(z−1)/ζ_v(z)`; `√πΓ((z−1)/2)/Γ(z/2)`; `2π/(z−1)=Γ_ℂ(z−1)/Γ_ℂ(z)` | Holds | None |
| §5.3n `M` maps `I(χ₁,χ₂,z)` | `diag(t)` | `|t₁/t₂|·|t₂/t₁|^(z/2)=|t₁/t₂|^((2−z)/2)` | Holds | None |
| §5.21j residues | principal `χ` | `Γ_ℝ(1)=1`, `Γ_ℂ(1)=1/π`; at `z=1`: `[∏∫f_v][π^(r₂)∫f_∞]·|d|^(−1/2)·|d|^(1/2)π^(−r₂)κ=κf̂(0)`; at `z=0`: `|d|^(−1/2)π^(r₂)f(0)·(−|d|^(1/2)π^(−r₂)κ)=−κf(0)` | Holds | None |
| §5.21w poles | constant term | `z=1`: `ρt−ρt=0`; `z=2`: `ρ`; `z=0`: `−ρ`; `E` has residue `ρ/Z_F(2)=ρ0` | Holds | None |
| §5.21w Bessel factors | real, complex | `Γ_ℝ(z)K_ℝ=2|u|^((z−1)/2)K`; `Γ_ℂ(z)K_ℂ=4|u|^(z−1)K`; `K_ℝ(2,1)=2πK_(1/2)(2π)=πe^(−2π)` | Holds | None |
| §5.7a | `ℚ(√−3)` | `κ=2π/(6√3)=0.60460`, `κ·log3=0.66422`; `D_F∣D_K` direction | Holds | None |
| §6.10 | `δ₀` at `β=0.5`; Haar at `β=1` | `2_*δ₀=δ₀≠2^(0.5)δ₀`; `μ(2Ẑ)=1/2` | Holds | None |
| §6.29/§6.45 | `f=x′₂`, `g=x₂` | `σ_(iβ)(x₂)=2^(−β)x₂`, LHS `2^(1−β)`, RHS `φ(1+e(1/2))`; for `φ₁`, `2^(1−β)=1` iff `β=1`; with `σ_(−iβ)`, `2^(1+β)` | Holds | None |
| §6.43 `e(1/2)` | Gibbs | `−η(β)/ζ(β)=2^(1−β)−1`, which tends to `−1` | Holds | None |
| §6.50 / (3.133), (3.138) | `b=2` | `f_(1−β)(2)/f_1(2)=2^(1−β)−1`; `2^(−β)(1−2^(β−1))/(1/2)=2^(1−β)−1` | Consistent at `β=1` | None |
| §6.31 | `e_(2,1/3)` | `u=(−e(1/3)+e(2/3))/6`; `u²−1/4=(e(1/3)+e(2/3)−11)/36` | Holds | None |
| §6.42b | swap `(0,1)→(1,0)` | ratio `p^(−β)/q^(−β)=(q/p)^β`; `μ((q/p)E)=(p/q)^βμ(E)` | Holds | None |
| `supercritical_scaling_measures` | `ν=δ₁`, `β=2`; `q=a/b` | point `n` gets `ζ(2)⁻¹n⁻²`, `Ẑ` mass 1, `W` mass `6/π²=0.6079=∏(1−p⁻²)`; `(q_*ν)(Ẑ)=0` for `b>1` | Holds | None |
| §6.17g constant (Conventions) | `u=s(s−1)→∞` | `log det=C[s²−2s²log s+(2s−2/3)log s−1/2]`, `log I_g=C[s²−2s²log s+(2s−2/3)log s+log2π−4ζ′(−1)]`; constant `C(4ζ′(−1)−log2π−1/2)` | Holds (source erratum) | None |

## Not verifiable

- **Keating–Snaith [100]** (§4.13): the DOI resolves only to a paywall. The README's URL is a third-party course page, not an author or institutional copy, so the citation is uncertified. Every constant was recomputed above.
- **Datskovsky–Wright [105]** (§§5.10, 5.10a, 5.10b, 5.3c–5.3e): the GDZ copy is an image-only scan and OCR is not available on this worker. The internal consistency rows above stand in for the locator check.
- **Blomer [102] published pagination:** the equation and lemma numbers were checked on arXiv v1; the Compositio page numbers were not.
- **Tate [129], Ramakrishnan–Valenza [130], Bump [131], Folland [132]** (new §§5.3f–5.3n): no legal open copy was consulted, and they are outside the sample. Their mathematics was recomputed where the table shows it.
- **AnalyticNumberTheoryPartI §0.34** (and through it §5.7a's logarithmic form): its truth rests on Part I's sources [109] and [110], which are reviewed with Part I and not here.
- **Friedman–Skoruppa:** paywalled, as before.
- **Ownership against open pull requests:** checked through the index and `roadmaps grep` for these objects ("quotient measure", restricted Haar product, Schwartz–Bruhat, Poisson, Siegel sets, class numbers, Eisenstein series) across all 469 heads. Of the closest-vocabulary list, AdelicAlgebraicGroups, AutomorphicLFunctionsAndLocalFactors and AutomorphicSpectralTheory were read in full sections; the rest only through grep.

## Source issues

- **Misprint** in Blomer11 at §2.1, published p.358 (arXiv v1 p.4): the source describes `ψ2` and `ψ−2` by the residues where they equal −1 (3,5 and 5,7); it should be the residues where they equal +1, namely 1,7 and 1,3; affects nothing.
- **Misprint** in Blomer11 at (11), published p.358 (arXiv v1 p.4): the source gives the `4d₀` row of the conductor table the same conditions as the `d₀` row; it should be `ψ1` with `d≡3 (4)` or `ψ−1` with `d≡1 (4)`; affects nothing.
- **Error** in JSS25 at (1.3), p.3, and (8.8), p.28 (arXiv v2): for the trivial representation, the source's torsion constant is `2C(2ζ′(−1)−log√(2π))`, which contradicts the vanishing constant term of `log det(Δ+u)` as `u→∞`; it should be `2C(2ζ′(−1)−log√(2π)−1/4)`, Sarnak's constant; affects a stated result.
