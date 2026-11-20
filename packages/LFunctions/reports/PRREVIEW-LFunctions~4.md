# Review of LFunctions (pull request #2626 at 3ef2fae)

**Verdict:** needs changes

**Summary.** Changes are needed for two findings. First, §7.3's `Grossencharacter.unitaryCancelling` is stated for every algebraic Hecke character, but its route names only the inputs for ray class characters. The infinite-order case therefore has no planned input, and the unconditional nonvanishing for the angular characters of §7.4 rests on that case. Second, the overview and §6.6 say that the full completion of a character of shift `σ` "reflects about `1/2 + σ`" against the inverse character, which `N^m` over `ℚ` refutes: against the inverse the reflection is `s ↦ 1 − s`. There are also eight small corrections and one format note, none blocking. A human has to note that Neukirch, the source with almost all the locators, could not be read.

## R01 (P2) — `Grossencharacter.unitaryCancelling` has no planned input for characters of infinite order, and §7.4's "unconditionally" rests on it

§7.3 (README lines 1470–1473) asks for the cancellation package "for every presentation whose unitary weight is not a pure norm twist on its good ideals … constructed from the ray-class and archimedean inputs". Its *Needs:* line (1494–1497) names only `RayClassCharacter.hasCancellation_toUnitaryIdealWeight` and `rayClassCharacter_partialSums`. An implementer has nothing for the case the layer is built to reach. §7.4 (1510–1512) concludes that the angular characters of `ℚ(i)` "have no zero on `Re s = 1`, unconditionally", and §7.5's `exists_continuousOn_logDeriv` takes its zero-freeness from the same premise.

At the pin, these are the only Tau Ceti results that produce `HasCancellation`:
- `hasCancellation_toUnitaryIdealWeight` (`NumberField/Global/RayClass/Character/Cancellation.lean:81`), which needs a ray class character `χ ≠ 1`;
- `HasCancellation.normTwist` (`ArithmeticDirichletSeries/Cancellation.lean:168`), which needs `1 < Module.finrank ℚ K`;
- `restrictAway` and the conjugate.

So two cases have no named source, layer or declaration:
- the partial sums `∑_{N𝔞 ≤ x} χ_u(𝔞) = O(x^(1−1/n))` of an infinite-order unitary character, such as `(α) ↦ (α/ᾱ)^(2k)`;
- over `ℚ`, the bounded twisted sums `∑_{n ≤ x} χ(n) n^(it)` that the `cancellation_normTwist` field demands.

The statement itself looks true. Numerically, `|∑_{n≤x} χ₄(n) n^(i)| ≤ 1.22` for `x ≤ 10⁶`, and for `k = 1` over `ℚ(i)`, `|∑_{N𝔞≤x} χ(𝔞)| / √x ≤ 0.053` at `x = 10⁴, 10⁵, 10⁶`. What is missing is the input. The smallest repair would be one of these:
- state the missing count as a target with a locator: the lattice-point count in the cone weighted by the degree-zero archimedean character, or Landau's estimate for an entire L-function with a functional equation, which gives `O(x^((n−1)/(n+1)+ε))`; for `K = ℚ`, the periodicity argument for the twisted sums;
- or route §7.3's nonvanishing through Layer 6's continuation of the primitive unitary card. Tau Ceti's `UnitaryIdealWeight.ne_zero_of_eqOn_LSeries` (`EulerProduct/ThreeFourOne.lean:159`) accepts any `f` differentiable at the point that agrees with the series on `Re s > 1`, so the cancellation package would then be needed only where `continuedLFunctionOfWeight` is consumed.

## R02 (P2) — The full completion does not reflect about `1/2 + σ` against the inverse character

The overview (README lines 22–23) says "the full completion of a character of shift `σ` reflects about `1/2 + σ` against the inverse character". §6.6 (1200–1202) and the docstring of `grossencharacterData` (`Suggested.lean` 1122–1125) say its equation "is centred at `1/2 + σ` and reflects against the inverse". This is the headline in the form a reader takes away, and it contradicts the stated theorem. `Grossencharacter.completed_one_sub` is `Λ(χ, s) = W(χ) Λ(ψ, 1 − s)`, with `ψ` the inverse (shift `−σ`), so against the inverse the reflection is `s ↦ 1 − s`.

Take `χ = N` over `ℚ` (`σ = 1`, `W = 1`) and `s = 5`:
- left side: `Λ(N, 5) = Λ_ℚ(4) = π²/90 = 0.10966`;
- the stated theorem: `Λ(N⁻¹, 1 − 5) = Λ_ℚ(−3) = Λ_ℚ(4)`, the same value;
- a reflection about `1/2 + σ = 3/2`: `Λ(N⁻¹, 1 + 2σ − 5) = Λ_ℚ(−1) = Λ_ℚ(2) = π/6 = 0.5236`.

A reflection about `1/2 + σ`, `s ↦ 1 + 2σ − s̄`, is the equation against the conjugate `conj(χ_u) N^σ`. Repair: in all three places, say that the equation relates `Λ(χ, s)` to `Λ(χ⁻¹, 1 − s)`. Where the centre is meant, say that the critical line of `Λ(χ, ·)` is `Re s = 1/2 + σ` and that `s ↦ 1 − s` carries it to the critical line `Re s = 1/2 − σ` of the inverse.

## C01 — Nine statements of `Suggested.lean` hold by one tactic or term and ask an implementer for nothing

Tau Ceti's canonical continuation is in normal form "even in the failure case" (`Analysis/Meromorphic/Continuation.lean:77–78`). Probes on a copy of the file elaborated with the pinned libraries closed nine statements:
- `meromorphic_dedekindZetaC` (line 291), `meromorphic_completedDedekindZeta` (326), `meromorphic_completedPartialZeta` (672) and `Grossencharacter.meromorphic_lFunctionC` (1054) each close with `fun x ↦ (meromorphicNFOn_meromorphicContinuation _ _ (Set.mem_univ x)).meromorphicAt`. They also hold when no continuation exists.
- `sum_partialZeta_one` (264) closes with `simpa [finiteEulerCorrection_one] using sum_partialZeta K _ hs`.
- `grossencharacterData_conductor` (1304) closes with `simp` after unfolding `grossencharacterData` and `primitiveConductor`.
- `finiteCharacter_unit` (1445) closes with `simp [finiteCharacter, Ideal.span_singleton_eq_top.mpr u.isUnit]`.
- `unitaryCompletion_congr` (1169) and `rootNumber_congr` (1173) are `congrArg` of `grossencharacterData_congr` once that is placed above them.

The content of the continuation is in `dedekindZetaC_eq`, `completedPartialZeta_eq_tsum` and `lFunctionC_eq`, not in the `meromorphic_*` statements. Zeros of L-functions cites two of these by name, so the repair keeps them: mark them in their docstrings as corollaries or sanity checks. §3.4's sentence that meromorphy "with `completedPartialZeta_eq_partialZeta` … continues the partial zeta functions" would point to `completedPartialZeta_eq_tsum` instead.

## C02 — §§7.1 and 7.3 re-derive Tau Ceti's nonvanishing theorems for weights instead of citing them

The routes of §7.1 (1420–1426) and §7.3 (1477–1483) run the `3-4-1` case analysis on the square of the weight: the square cancels, or it is trivial or a norm twist on its good ideals. At the pin this is already proved for any unitary weight with cancellation:
- `TauCeti.continuedLFunctionOfWeight_ne_zero_of_hasCancellation_sq`, `ArithmeticDirichletSeries/Cancellation/Nonvanishing.lean:84`;
- `…_of_isNormTwistOnGood_sq`, line 99;
- `…_of_isTrivialOnGood_sq`, line 134.

What remains here is the Landau case at `s = 1`. Cite the three theorems in the routes, the *Needs:* lines and the Tau Ceti supplier contract.

## C03 — The scope section leaves non-algebraic Hecke characters and Artin L-functions without their owner on main

"Not covered by this roadmap" (1795–1801) lists the L-functions of non-algebraic Hecke characters and Artin L-functions without an owner. AnalyticNumberTheoryPartI, on main, owns both: §2.3a covers Hecke continuation and functional equation for continuous unitary characters, building on Layers 1, 5 and 6 here, and §2.18a covers Artin L-functions. Its overview (its lines 13–15) says so. Name it: "AnalyticNumberTheoryPartI §2.3a and §2.18a".

## C04 — Three sentences say the roadmap follows Neukirch's exposition

The sentences are:
- README line 8: "by Hecke's method as Neukirch presents it";
- line 498: "following Neukirch VII (5.3)–(5.11) step by step";
- `Suggested.lean` line 129: "in Neukirch's order".

The order of Layer 3 is already forced by its *Needs:* lines: §3.3 needs §3.2, §3.4 needs §3.3, §3.5 needs §§3.2–3.4, and §3.6 needs §3.5. The sentences add only the claim that a source's sequence is the plan. Drop them, or say that the order is the dependency order; the locators stay.

## C05 — Several theorems carry no locator or only a chapter

These sections cite only "Neukirch, Chapter VII":
- §2.1 (line 412);
- §4.1 (777), the quadratic factorization;
- §4.2 (798–799), the cyclotomic factorization.

These carry no source:
- §2.2;
- §7.3, nonvanishing for Grossencharacters on `Re s = 1`;
- §7.4, Hecke's angular characters.

A reader cannot check the statements at the generality given. Add theorem or equation numbers, for example where §4.2's primitive factorization of `ζ_{ℚ(ζ_n)}` is stated, and a source for §§7.3–7.4.

## C06 — Two references support no claim, and the Lebacque pages are the arXiv pagination

No claim cites E. Hecke, *Lectures* (line 1961), or Loeffler–Stoll (1976). The Lebacque entry (1972–1973) gives "Acta Arith. (2007)", then "pp. 8–9". Propositions 2 and 3 are on pages 8 and 9 of the arXiv text math/0703570v1 (`lebacque-mertens` lines 367–369 and 444–457), not in the journal's pagination. Cite the two works at a claim or drop them, and write "(arXiv version, pp. 8–9)".

## C07 — §2.2 compares germs with a series that has no named continuation

§2.2 (456–460) says the partial zeta functions above `c` sum to `∑_{𝔞 ∈ c, (𝔞, 𝔫₀) = 1} N𝔞^(−s)` "on `Re s > 1` and as germs at every point". The right side is a Dirichlet series and is defined only on `Re s > 1`, so the germ clause has nothing to compare with. A clearer version: the sum of the continued partial zeta functions is the canonical continuation of that series.

The rest of §2.2 checks out. Over `ℚ` with `(5) ∣ (10)`, the one class `{±1 mod 10}` lies above `{±1 mod 5}`, and its series counts the odd `n ≡ ±1 mod 5`, as the Check says.

## C08 — The description does not say that ThetaSeries is no longer a supplier

On main, the README has a "Theta Series" supplier contract (heading removed in this change). The head's dependency diagram (lines 70–73) lists only Arithmetic Dirichlet Series and Global Number Fields, and line 1782 replaces ThetaSeries' Poisson summation with Mathlib's and Tau Ceti's. The description lists the new supplier contracts but not the dropped one. Add: "Theta Series is no longer a supplier: Poisson summation and the Gaussian's Fourier transform are taken from Mathlib and Tau Ceti."

## N01 — `Suggested.lean`: 44 declarations lack a docstring, and 29 lines exceed 100 characters

For example, `partialZeta_eq_lSeries` (248), `dedekindZetaC_eq` (288), `completedDedekindZeta_one_sub` (349), `norm_heckeRootNumber` (851) and `Grossencharacter.meromorphicOrderAt_lFunctionC` (1929) have no docstring. Lines 144, 154, 156, 495 and 563 are examples of lines over 100 characters.

## Questions for the author

- §5.3 (921–922) and the docstring of `heckeMellinTotal_inv` give Neukirch's closed form `W(χ) = [i^(Tr p) N((md/|md|)^p)]⁻¹ τ(χ_f)/√N(𝔪)` as VII (8.5), with `τ(χ_f)` the Gauss sum of (7.4). Is that the numbering and the normalisation of the book? I could not open Neukirch, and the transformation law that pins `rootNumber` in this roadmap does not depend on the closed form.
- §0.1 cites Iwaniec–Kowalski Chapter 5 for the average-coefficient-growth predicate. Which statement there is meant? As far as I recall, their axioms bound coefficients pointwise on average, and the Checks of §0.1 distinguish the two notions. I could not read the book.

## Earlier findings

These are the four remarks of the previous review, of an earlier head of this roadmap.

- **R01 (padding): partly repaired.** Gone, now Tau Ceti declarations: `three_four_one_nonneg`, `eulerCorrection_one`, `dedekindZeta_logDeriv_eq`, `dedekindZeta_idealVonMangoldt_nonneg`. Still present and still closed by one step: `sum_partialZeta_one`, `grossencharacterData_conductor`, `unitaryCompletion_congr`, `rootNumber_congr` (C01). Still present as proved one-liners: `compatibility_inv`, `primitiveConductor_dvd`, `ratNormPow_idealShift`, `ofRayClassCharacter_idealShift`, `finiteCharacter_residue`, `finiteCharacter_eq_one_of_isCongrOne`, `dedekindZetaC_eventuallyEq`.
- **R02 (84 Lean names absent from the README): repaired.** All 179 declarations occur in README code spans.
- **R03 (references, Lebacque pages): partly repaired.** Iwaniec–Kowalski is now cited at §0.1 ("Chapter 5"). Hecke's *Lectures* is still cited at no claim, and the arXiv pages are still given under the journal (C06).
- **R04 (docstrings; the chosen `primitive`): partly repaired.** `Grossencharacter.primitive` and every other chosen datum are gone: presentations are passed as arguments with `h₀ : χ₀.toHeckeCharacter = χ.toHeckeCharacter`, for example in `lFunctionC_eq_primitive` at line 1097. 44 declarations still lack a docstring (N01).

## Verified sound

**Adversarial table** (values computed by hand unless marked numeric; numeric values were computed in floating point for this review).

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §2.2 change of modulus (Check) | `ℚ`, `(5) ∣ (10)` | `Cl` both order 2; `{1,9}↦{1,4}`, `{3,7}↦{3,2}`; series over `n≡±1 (10)` = odd `n≡±1 (5)`; `ζ(s,[1]_(5))` has `4,6,14,16` | true; germ clause unclear (C07) |
| §3.3 kernel, `completedPartialZeta_eq_mellin` | `ℚ`; `ℚ(i)`; general `K` | `θ(u)/2−1/2 ↦ Γ_ℝ(s)ζ(s)`; `θ(√u)²/4−1/4 ↦ 2π^(−s)Γ(s)ζ_K = 4^(s/2)Γ_ℂζ_K`; general `V^s2^(r₂s)2^(−r₂) → |d|^(s/2)Γ…ζ(𝔎,s)` | sound |
| §3.3 `mellinKernel_dualIdealLattice` | `traceShift`, covolumes | `N(c₀)=16^(r₂)/16^(r₂)=1`; needs `V_𝔟=4^(−r₂)V_I⁻¹`: `N(I)⁻¹|d|⁻¹2^(−r₂)√|d| = 1/(V_I4^(r₂))` | sound |
| §3.4 residue | `ℚ`, `ℚ(i)` | `(s/2−1/2)Λ(s/2)→a₀` gives `2a₀`: `1`, `1/2` | sound |
| §3.5 class number formula, residues | `ℚ(i)` | `√4·Γ_ℂ(1)·π/4 = 2·(1/π)·(π/4) = 1/2 = 2^(r)hR/w` | sound |
| §3.6 `dedekindZetaC_leading_zero` | `ℚ`; `ℚ(i)`; real quadratic | `−1/2`; `(−1/2)(1/2) = −1/4`; order 1, `ζ(0)L′(0,χ_d) = −h log ε/2` | sound |
| §1.3 `surfaceHaar_of_isUnitFundamentalDomain` | `ℚ(i)`; real quadratic; `r₁=r₂=1` | `1/2`; `2 log ε`; Jacobian `1/2`, length `2|log|ε|₁||` gives `R = 2^1R/2` | sound |
| §4.1, §4.2 factorizations | `ℚ(i)` at 3, 5; level 4; `ℚ(ζ₅)` | `(1−9^(−s))⁻¹=(1−3^(−s))⁻¹(1+3^(−s))⁻¹`; `ζ(1−2^(−s))L(χ₄)=ζ_K(1−2^(−s))`, wrong side off by `(1−2^(−s))²`; one conductor-1, three conductor-5 | sound |
| §5.1 presented series | odd mod `4∞`; trivial at `(4)∞` | weight `χ₄(n)`: `−1` at 3, `1` at 5, `0` at 2; `ζ(s)(1−2^(−s))` | sound |
| §5.3 `gaussSum_mul`, `norm_gaussSum` | `χ₄`, `y=1/4`; mod 5; order 3 mod 7 | `2i`, `|·|=2`; `τ(2/5)=−√5`; `ρ(3)=ω ↦ ω⁻¹`; `y=1/25` would force `τ(1/5)=0` | hypotheses needed as stated |
| §5.4 `completedHeckeLFunction_one_sub` | `χ₄`, `χ₅` | `W = 2i/(i√4) = 1`, `√5/√5 = 1`; Mathlib's law times `N^(s/2)` gives `Λ(s)=WΛ(χ⁻¹,1−s)` | sound |
| §6.1 sign of shift | `‖·‖^(−m)` over `ℚ` | supplier shift `−m`, ideal-side `m`, `χ(π_p)=p^m`; supplier's sign forces `χ_u(p)=p^(2m)` | sound |
| §6.4 `compatibility` | `ℚ(i)`, `a=2+i`; `‖·‖^(−m)`, `a>0` | `((3+4i)/5)^(2k)·((3+4i)/5)^(−2k)=1`; `1·a^m·a^(−m)=1` | sound |
| §6.7 `finiteCharacter` | odd mod `4∞`; `N^m`, `m` odd | `χ_f(−1)=−1`, `χ_f(3)=−1`; `|n|^m n^(−m) sgn n = 1` for `n<0` | sound |
| §6.8 theta kernel | `χ₄`; `N^m` odd; `ℚ(i)` | `ε=0`, `2∑χ₄(m)m e^(−πym²)`, `λ=4`; `ε=1`, scale `1`, `θ(iy)`; covolume `1`, scale `1` | sound |
| §6.9 `grossencharacterFEPair` | `T=0`; `T>0` | `k−(s+T/n)/2 = ((1−s)+T/n)/2`; `Re s>1` gives `(s+T/n)/2>k` only if `T=0`; else `ε(χ)=ε(χ⁻¹)=0`, strong pair | sound |
| §6.9 `completed_one_sub` (headline 2) | `N` over `ℚ`, `s=5` | left `Λ_ℚ(4)=0.10966`; `1−s`: `Λ_ℚ(−3)=0.10966`; "about `1/2+σ`": `Λ_ℚ(2)=0.5236` | theorem sound, prose false (R02) |
| §6.10 `completedHeckeLFunction_eq_mellin` | finite order | coefficients equal off `𝔣₀`; conductor `|d|N𝔣₀` both; `gammaC` `0` (type `0`); `gammaR` same parity | sound |
| §7.1 `heckeLFunction_ne_zero_of_one_le_re` (headline 3) | `χ₄`, `t=0` | `L(1,χ₄)=π/4`; `3-4-1` orders `−3+4−1=0`, so Landau is needed | sound |
| §7.3 `unitaryCancelling` | `χ₄` twists; angular `k=1` | numeric: `|∑χ₄(n)n^(i)| ≤ 1.22`, `≤1.93` at `t=5`, `x≤10⁶`; `|S(x)|/√x = 0.053, 0.0016, 0.022` | true; input unplanned (R01) |
| §7.3 Landau step | `ζ_K L(χ_u)`, `χ_u²=1` | coefficient at `𝔭^k`: `k+1`, `(1+(−1)^k)/2`, `1`; `≥ζ_K(2s)→∞` at `1/2⁺` | sound |
| §7.5 Liouville remark | `λ_K`, `n≥3` | `ζ_K(2s)/ζ_K(s)`, zero at 1; RH: `x^(1/2+ε) ⊂ x^(1−1/n)` since `1−1/n ≥ 2/3` | sound |
| §7.4 `angularGrossencharacterData` | `k≠0` | `gammaC={|−2k−2k|/2}={2|k|}`, conductor `4·N⊤=4`, degree `0+2=2`; `k=0` gives `ζ_{ℚ(i)}`, pole | sound |
| §8.1 comparison cards | `dedekindZetaData ℚ`; `ℚ(i)` | coefficient `1` for `n≥1`; Mathlib `Λ(0)=Λ₀(0)−1` vs canonical `0`; coefficient at 5 is `2` | sound |
| §8.2 Mertens (headline 4) | Lebacque Thm 5 (NF); `ℚ(√−5)`, `ℚ(i)` | `lebacque-mertens` lines 207–221: `∏(1−1/N𝔭)=e^(−γ_K)/log x+…`, `γ_K=γ+log κ_K`; inverse `e^γκ_K log x`; `κ=π/√5=1.405`, `π/4` | sound |
| §3.7 normalization | `ℚ(i)` | `2^s·2(2π)^(−s)Γ(s) = 2π^(−s)Γ(s)`; `Γ_ℝ(s)Γ_ℝ(s+1)=2^(1−s)π^(−s)Γ(s)=Γ_ℂ(s)` | sound |
| §0.1 Checks | `a_n=n` at `2^k`; `a_n=n^(1/2)` | `∑_{2^k≤x}2^k<2x`; `∑n^(1/2)~(2/3)x^(3/2)`, `∑n^(1/2)n^(−3/2)` diverges | sound |
| C01 padding | probe copy | 7 `sorry`s closed by one step (120 → 113 warnings, no error); 2 `congrArg` examples elaborate | padding |

- Source locators checked against the text: Lebacque Theorem 5 (NF), p. 5 (`lebacque-mertens` lines 193–223); Proposition 2, p. 8 (369–373); Proposition 3 and its proof sketch, p. 9 (457–485). The Neukirch locators (about 50) could not be read.
- Library declarations opened at the pin (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`):
  - Tau Ceti: `HeckeCharacter/Shift.lean:209,214,273`; `ArithmeticDirichletSeries/Weight.lean:508`; `Cancellation.lean:97,168,282,297,322`; `Cancellation/Nonvanishing.lean:84,99,134`; `EulerProduct/ThreeFourOne.lean:159`; `Analysis/Meromorphic/Continuation.lean:72,78,88`; `Theta/UnitFundamentalDomain.lean:58,110,161,219`; `Theta/SurfaceCoordinates.lean:39,73`; `DedekindZeta/PartialZeta.lean:198,208`; `RayClass/Character/Cancellation.lean:81`; `Quadratic/DedekindZeta.lean:199`.
  - Mathlib: `NumberField/DedekindZeta.lean:50–78`; `Analysis/Meromorphic/Basic.lean:760`.
  - All the Tau Ceti names of the supplier contracts resolve; `realParity`, `complexExponent` and `complexAngularFrequency` are structure fields.
- Cross-roadmap citations resolved:
  - The suppliers ArithmeticDirichletSeries and GlobalNumberFields are on main (`Completed/`).
  - The roughly 40 names that Zeros of L-functions cites from this roadmap, on main and at its open revision, all exist at this head; its main README already redirects the removed Layers 7–8 names to Tau Ceti.
  - The removed chosen-data names (`Grossencharacter.inverse`, `angularGrossencharacter`, `ratNormPow`, `residueCharacter`, `primitive`, `finiteCharacterK`) are cited by no other roadmap.
- Automatic checks: the worker's checks all passed at this head. Dependency check run here: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The change touches only `TauCetiRoadmap/LFunctions/README.md` and `Suggested.lean`; `PROGRESS.md` and `STATUS.md` are unchanged generated files.
- Elaboration: `lake env lean` on `Suggested.lean` gives 120 `sorry` warnings and no other message. A copy with `#check @` for all 179 declarations elaborated, and every statement keeps `K`, `[NumberField K]`, its modulus and its hypotheses. Imports are `Mathlib` plus 32 existing `TauCeti.*` modules. There is no `set_option`, `lemma`, `#eval` or sorried data; `dedekindFEPair` and `grossencharacterFEPair` have real data fields.
- Headlines: the four of the overview and the factorizations are all stated, and the module docstring says that every headline is statable.
- Ownership:
  - GlobalNumberFields (its Out of scope section) hands L-functions here.
  - ArithmeticDirichletSeries hands character-specific continuation here and is conditional on `primeIdealVonMangoldtBoundary`, which is in Tau Ceti.
  - AnalyticNumberTheoryPartI §2.3a extends Layer 6 to continuous infinity types and consumes Layers 1, 5 and 6.
  - QuasiRiemannHypothesis owns Gauss sums of power-residue symbols, a different object, and cites §5.3.
  - ExplicitNumberFields owns the explicit Mertens theorems and cites §8.2.
  - HilbertModularForms, SatoTateGroups and BianchiModularForms consume Layers 0, 3, 6 and 7.
- Overlap check: read ZerosOfLFunctions, GlobalNumberFields, QuasiRiemannHypothesis, ExplicitNumberFields, HilbertModularForms and ArithmeticDirichletSeries (with AnalyticNumberTheoryPartI, SatoTateGroups and BianchiModularForms). Nothing is shared: the qualitative Mertens product for `K` is this roadmap's (ExplicitNumberFields cites it), and non-algebraic Hecke L-functions are AnalyticNumberTheoryPartI's (C03).

Source independence: 6 passages compared with 1 source (`lebacque-mertens`: the §8.2 statement, steps 2–4, the route sentence and the docstring of `tendsto_prod_one_sub_inv_absNorm_div_log`); none shared beyond forced formulas. Largest share: `neukirch-ant`, 57 of 66 source mentions. Its text and contents page could not be read. Compared through the README's own equation numbers: Layer 1 ↔ VII §§3–5 (parts), Layer 3 ↔ VII §5, Layers 5–6 ↔ VII §§6–8; Layers 0, 2, 4, 7 and 8 have no counterpart. The *Needs:* lines force the order 3.2 → 3.3 → 3.4 → 3.5 → 3.6 and Layer 6 → §5.4. Independent by the locators, not checked against the book (C04).

Research link: the headlines are Hecke's continuation and functional equation for Größencharaktere and Rosen's Mertens product over a number field (Rosen 1999; Lebacque 2007, Theorem 5), consumed by Zeros of L-functions and by Hecke-equidistribution and CM-form roadmaps. This rests on the README and on the `lebacque-mertens` text.

## Not verifiable

- J. Neukirch, *Algebraic Number Theory* (`neukirch-ant`): the sources service records it as uncertified (paywalled Springer DOI), the publisher's chapter page redirects to a login, and no copy is in the cache or the operator's local directory. The equation locators of Layers 1, 3, 5 and 6 were checked by computation only (table).
- H. Iwaniec and E. Kowalski, *Analytic Number Theory*; E. Hecke, *Lectures*; M. Rosen, J. Ramanujan Math. Soc. 14 (1999): paywalled, not read.
- Lebacque, Acta Arith. pagination: only the arXiv version math/0703570v1 was read.

## Source issues

- none

## For the human reviewers

- Not tested: Neukirch, *Algebraic Number Theory*, holds 57 of the 66 source mentions; its text and contents page could not be read legally, so wording and arrangement were not compared against it.
