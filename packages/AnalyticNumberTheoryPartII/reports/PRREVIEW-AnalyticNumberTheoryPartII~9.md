# Review of AnalyticNumberTheoryPartII (pull request #1167 at 749c801)

**Verdict:** needs changes

:robot: Independent AI review. This is an incremental re-review of the 75 lines changed in `TauCetiRoadmap/AnalyticNumberTheoryPartII/` since d58f419.

- The gate passes, and so do the elaboration and the dependency check.
- r8's R01, R03, R04 and R05 are repaired. R02 is only partly repaired, and its remainder is R01 below.

## R01 (P2) — §§5.3g, 5.3h and 5.3j still have two other owners, which the new ownership sentence says do not exist

**Location.** `README.md:7`: "This part is their single owner; the later roadmaps listed under Downstream consumers cite these sections instead of restating them". `README.md:3097`: "ArithmeticGaloisRepresentations §2.7 (global inputs) uses the trace character, self-dual and multiplicative measures, adelic Schwartz–Bruhat space and Poisson summation of §§5.3g, 5.3h and 5.3j."

**Claim.** This carries r8 R02, which is partly repaired.
- Repaired: AdelicAlgebraicGroups (#792 at d2e6304), AutomorphicLFunctionsAndLocalFactors (#924 at f4dd981) and AutomorphicSpectralTheory (#925 at e73fe1f) now cite these sections.
- Not repaired: two open roadmaps later in ORDER.txt (lines 57 and 52, against this roadmap's 50) still build the same objects themselves:
  - ArithmeticGaloisRepresentations §2.7 builds the trace character, the self-dual and Tate multiplicative measures, the adelic Schwartz–Bruhat space and Poisson summation;
  - GeometryOfNumbersAndQuadraticArithmetic §3.3 builds an adelic Schwartz–Bruhat space with self-dual measures.

So the ownership sentence at `:7` and the consumer bullet at `:3097` are false at those heads.

**Witness.**
- #856 at f901260, `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2285` says to "Construct the Schwartz–Bruhat space on the adeles, … the self-dual Fourier transform and Poisson summation".
- #851 at 6143cad, `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:1082` says to "Construct `adelicSchwartzBruhat V`".
- Neither file mentions AnalyticNumberTheoryPartII.

**Repair.**
1. In ArithmeticGaloisRepresentations §2.7, "Global inputs" (`README.md:2257–2294` at f901260), replace these constructions by citations of §§5.3g, 5.3h and 5.3j:
   - the trace character and the local and adelic dualities;
   - `F⊥=F`;
   - the adelic Schwartz–Bruhat space, the self-dual transform and Poisson summation;
   - Tate's multiplicative measures.

   Keep its standard-test-function evaluations and root-number product formula, which AutomorphicLFunctionsAndLocalFactors `README.md:3, 11` cites. No conversion is needed, because its conventions match §§5.3g and 5.3j:
   - `ψ_∞=exp(2πix)`, `ψ_p=exp(−2πi{x}_p)` and `ψ_ℂ(z)=exp(2πi(z+z̄))`;
   - additive measures `dx`, `2dxdy` and `vol(O_v)=q_v^(−ν_v/2)`;
   - multiplicative measures `d^×x=(1−q_v⁻¹)⁻¹dx_ψ/|x|_v`.
2. In GeometryOfNumbersAndQuadraticArithmetic §3.3 (`README.md:1082` at 6143cad), cite §§5.3g–5.3h for `adelicSchwartzBruhat V`, its additive character, its self-dual measures and its transform, and keep the Weil operators. Then add GeometryOfNumbersAndQuadraticArithmetic as a fifth bullet under this README's Downstream consumers (`:3093`).
3. Fix the pull-request description:
   - Its "Dependencies" paragraph lists 31 pull requests as "cited in the README by roadmap name and section", but the README cites only AnalyticNumberTheoryPartI (#1126) as a supplier. `grep -c` is 0 for 26 of the 31 names, and #792, #856, #924 and #925 occur only under Downstream consumers. Reduce the paragraph to #1126.
   - Name #851 and #856 in the merge-order paragraph as pull requests that merge after this one and cite these sections.

Tested: AdelicAlgebraicGroups made exactly this change at d2e6304 (`README.md:282–283` and `Suggested.lean:70–71, 219–220` cite §§5.3f and 5.3k by full Lean name), and so did AutomorphicLFunctionsAndLocalFactors at f4dd981 (`README.md:11, 27, 629`). Three other roadmaps attribute these objects to §2.7 and then reach this roadmap through it: GL2AutomorphicRepresentationsAndTransfer (#931, `README.md:45`), AutomorphicFormsOnReductiveGroups (#1037, `:47`) and MetaplecticAutomorphicForms (#1063, `:59`).

## Previous findings

- R01 — repaired: `README.md:656` "let `τ` be the linear automorphism of `V` with `B(τx,y)=B(y,x)` … `f̂̂(x)=f(−τx)` … for an alternating pairing, such as the binary-cubic pairing of §5.10a, `f̂̂=f`". §5.3h (`:673`) and §5.21q (`:1261`) follow, and three Checks are added (`:665`).
- R02 — partly repaired: `README.md:7` now claims single ownership and `:3093–3098` list four consumers. Three of them cite these sections at their heads, but ArithmeticGaloisRepresentations does not, and GeometryOfNumbersAndQuadraticArithmetic is a further owner. This is now R01.
- R03 — repaired: `README.md:642` "Let `S₀` be the finite set of indices `i` for which `B_i` is not compact or `μ_i(B_i)≠1`. For a finite set `S⊇S₀`…". The proof takes `S₀⊆S⊆T` (`:646`), and the `2·Haar` Check is added (`:648`).
- R04 — repaired: `Suggested.lean:267` reads "[MeasurableSpace (Πʳ i, [G i, B i])] [BorelSpace (Πʳ i, [G i, B i])]", and `:290–291` has the same binders for `MulAction.orbitRel.Quotient H G`. My gate rerun prints `statement-hygiene=0`.
- R05 — repaired by another route:
  - the supplier-name comment block is gone, and `/-! ## Layer 4/5/6 … -/` are at `Suggested.lean:58, 175, 335`;
  - docstring lines 30–34 state the ownership;
  - the five declarations stay because AdelicAlgebraicGroups `Suggested.lean:70–71, 219–220` cites the two measure theorems by full name, and `README.md:711` now names `gl2Integral` and `gl2Rational`.

## Verified sound

**Gate, build and dependency check.**
- My gate rerun on 749c801 prints `gate AnalyticNumberTheoryPartII: … statement-hygiene=0 … depcheck=0 … outside-folder=0 … OK`. The worker's targeted build reports `build=0`.
- `gate --depcheck … --movable` prints `depcheck: 237 roadmaps, 2428 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty.

**Elaboration.** A scratch copy with `#check @name` for all 30 declarations, run through `lake env lean`, exits 0 with 13 `declaration uses sorry` warnings and no other message.
- The elaborated `exists_unique_restrictedAddHaar` carries `[MeasurableSpace (RestrictedProduct …)] [BorelSpace (RestrictedProduct …)]` together with every family binder.
- `exists_unique_quotientMeasure` carries the two quotient binders.
- AdelicAlgebraicGroups' scoped `instMeasurableSpace` and `instBorelSpace` (`Suggested.lean:62–65` at d2e6304) satisfy these binders.
- The other 28 types are unchanged from r8.
- One-tactic probe: the changed theorems only gained binders, and neither closes by one tactic.

**Changed passages checked:**
- the scope paragraph (`:7`);
- §5.3f with its three Checks;
- §5.3g's `τ` law, the first-variable annihilator, the partial transforms and its three Checks;
- §5.3h's `τ`, the adjoint `g^†` and `W^⊥`;
- §5.3m's naming of `gl2Integral` and `gl2Rational`;
- §5.21q's involution step;
- Downstream consumers (`:3093–3098`);
- the `Suggested.lean` docstring, binders and layer comments.

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9):
- `MeasureTheory.Measure.infinitePi` (`Mathlib/Probability/ProductMeasure.lean:354`) is defined by cases on all factors being probability measures, which is why R03's `S⊇S₀` is needed.
- `DoubleCoset.Quotient` (`Mathlib/GroupTheory/DoubleCoset.lean:79`).
- `NumberField.classNumber` (`Mathlib/NumberTheory/NumberField/ClassNumber.lean:65`).
- A grep of both libraries finds no Schwartz–Bruhat space, no restricted-product Haar measure and no Weil quotient formula. Only the fundamental-domain `quotientMeasure` lemmas exist (`Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:157–267`). This supports the docstring's "absent at the pins".

**"Which no earlier roadmap supplies" (`:7`) holds:**
- LFunctions on main (`README.md:201`) excludes Tate's thesis.
- ThetaSeries on main owns lattice Poisson summation in real inner-product spaces only.
- The completed RestrictedProducts (`README.md:151–153, 437`) leaves Schwartz–Bruhat theory and Poisson summation to an `AdelicFourierAnalysis` roadmap that exists nowhere: not on main, not in ORDER.txt and not among the open pull requests.
- AnalyticNumberTheoryPartI §2.3a uses Hecke's theta method (`README.md:75` at e22e67a).
- SmoothRepresentationsOfLocalGroups (#1688) has only ring-valued Haar measures on locally profinite groups (`README.md:1097`).
- IntegralHeckeAndGaloisDeterminants (#1689) has none of these objects.

**Consumers resolved:**
- AdelicAlgebraicGroups at d2e6304: `README.md:36, 46, 129, 282–283, 522–528`, and `Suggested.lean:70–71, 219–220`. Its `exists_unique_convergentHaarProduct` (`:78`) is a summable-deviation generalization built on §5.3f.
- AutomorphicLFunctionsAndLocalFactors at f4dd981: `README.md:3, 11, 27, 56, 629, 657`.
- AutomorphicSpectralTheory at e73fe1f: `README.md:48, 953–954`.
- The four consumers sit at ORDER.txt lines 51, 57, 93 and 95, all after line 50.
- No open pull request changes this folder or drops an id it cites (`overlaps.md`), and this diff drops no id.

**Sample.** All 15 sampled targets lie outside the changed passages, so their locators were not rechecked, except §5.24, which matches LOWW line 614–621, p.12. Each sampled target has a computed row below. No locator in the README is flagged as unverified.

**Remarks on untouched text** (no change requested):
- The Summary (`README.md:3`) does not mention the adelic harmonic analysis that `:7` now makes an owned deliverable.
- AutomorphicLFunctionsAndLocalFactors `README.md:11` still says AdelicAlgebraicGroups owns restricted Haar products and quotient measures.

**Adversarial table.** It has 72 rows: 33 computed this round and 39 carried from r8 for untouched statements (38 from its table, one from its Verified sound). The sampled §§6.42 and 6.45 are covered by the carried rows §6.42b and §6.29/§6.45.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §5.3f Fubini clause with `S⊇S₀` | `ι` primes, `μ_2=2·Haar`; `S=∅`, `S={2}` | `S₀={2}`; for `S=∅`, `μ_2(ℤ_2)=2`, so `μ_2|ℤ_2` is not a probability measure and `infinitePi` does not apply; for `S={2}`, `μ_2(ℤ_2)·∏_(p≠2)1=2=ν(∏_pℤ_p)` | Holds | R03 repaired |
| §5.3f Check 1 | `Ẑ`; `C_3=3^(−1)ℤ_3` | `∏_p1=1`; `μ_3(3^(−1)ℤ_3)=3μ_3(ℤ_3)=3` | Holds | None |
| §5.3f Check 3; the cofinite hypothesis of `exists_unique_restrictedAddHaar` | `C_p=p^(−1)ℤ_p` for every `p` | boxes of mass `∏_(p∈T)p` (210 for `T={2,3,5,7}`) lie inside, so `ν=∞`; Lean's `∏ᶠ` of an infinite-support family is 1 | Hypothesis needed; Check discriminates | None |
| §5.3g `f̂̂=f∘(−τ)` | `(ℤ/5)²` with point mass `1/5` and random `f`, for `x·y`, `x₁y₂−x₂y₁` and `x₁y₁+x₁y₂+x₂y₂` | `τ=1`, `−1` and `[[1,1],[−1,0]]`; `max|f̂̂−f(−τ·)|=7·10⁻¹⁶` in all three; `max|f̂̂−f(−·)|=0`, `0.84`, `1.22` | Holds, including non-symmetric `B` | R01 repaired |
| §5.3g `B(x,y)+B(y,z)=B(x+τz,y)` | the definition of `τ` | `B(y,z)=B(τz,y)`, then additivity in the first slot | Holds | None |
| §5.3g partial transforms | binary-cubic pairing, `V₁=⟨e₁,e₄⟩`, `V₂=⟨e₂,e₃⟩` | `[V₁,V₂]=[V₂,V₁]=0`; `B|V₂=−x₂y₃/3+x₃y₂/3` is alternating, so the partial square is the identity; `B(τx,V₂)=B(V₂,x)=0` gives `τV₁=V₁` | Holds | None |
| §5.3g first-variable annihilator | `ℚ₃`, `L=ℤ₃⁴` | `L^⊥=ℤ₃×3ℤ₃×3ℤ₃×ℤ₃`; `{x:[x,L^⊥]⊆ℤ₃}=ℤ₃⁴=L` | Holds | None |
| §5.3g Check 1 | `ℝ²`, `f=exp(−π|x−(1,0)|²)` | `f̂̂(1,0)=f(1,0)=1`; `f(−1,0)=e^(−4π)=3.487·10⁻⁶` | Holds | None |
| §5.3g Check 2 | `p=3`, model `3^(−1)ℤ₃²/3ℤ₃²≅(ℤ/9)²` with mass `1/9`, `a=(1/3,0)` | `vol(L)=1.000`, `f̂̂(a)=1.000000`, `f(−a)=0`, `max|f̂̂−f|=7·10⁻¹⁶` | Holds | None |
| §5.3g Check 3 | `ℚ₃`, binary-cubic pairing | `L^⊥` has coordinate mass `1/9`; `c²/9=1` gives `c=3=|3|₃^(−1)=|1/9|₃^(1/2)`; agrees with §5.10a and with §5.21r's Check (`:1269`) | Holds | None |
| §5.3h `g^*=(g^†)^(−1)` | `(ℤ/5)²`, `B=x₁y₁+x₁y₂+x₂y₂`, `g=[[2,1],[1,1]]`; scalar `a` | `g^†=[[1,1],[1,2]]`, `g^*=[[2,4],[4,1]]`; `max|(f∘g)^−f̂∘g^*|=0`, while `(gᵀ)^(−1)` gives `1.02`; for scalar `a`, `g^*=a^(−1)` and `|det g|=|a|^(dim V)` | Holds | None |
| §5.3h restriction along `W` | `W=⟨e₄⟩`, Wright's `T1` | `W^⊥={y₁=0}`; `∫_(W^⊥)f̂(y+z)dz=∫f(0,0,0,t)ψ(−ty₁)dt`, which is `(f|_W)^(y)` | Holds | None |
| §5.3h Poisson for scalar ideles | `|det g|_𝔸^(−1)` with `g=a` | `|a|^(−dim V)`, as stated | Holds | None |
| §5.3m with `gl2Integral` and `gl2Rational` | Lean bodies; `K=ℚ`, `ℚ(√−5)` | entries and inverse entries in `adicCompletionIntegers` at every `v` give `GL₂(Ô)`; the range of `GeneralLinearGroup.map (algebraMap K _)` is `GL₂(K)`; `h=1`, `h=2` | Matches the README | None |
| §5.21q involution step | §5.21p's `I` with `FFΦ=Φ` | `I(FΦ,2−u)=I(Φ,u)` term by term; residue at `u=2`: `[FΦ(0)/ρ0+Σ2(FΦ)]/2`; at `5/3`: `Σ1(FΦ)/6` | Holds | None |
| `exists_unique_restrictedAddHaar` binders | elaborated type; AdelicAlgebraicGroups' scoped Borel instance | explicit `MeasurableSpace` and `BorelSpace` binders, filled by `borel _` with `⟨rfl⟩`; r8's `ι=∅`, `G=B=ℝ` and `0·∞` cases unchanged | Holds | R04 repaired |
| `exists_unique_quotientMeasure` binders | elaborated type; `H=G`; `ℤ≤ℝ` | explicit quotient binders; a point quotient gives `ν=c·δ`; on `ℝ/ℤ`, Lebesgue measure of mass 1 | Holds | R04 repaired |
| Scope: no earlier owner | main, and ORDER.txt lines 1–49 | LFunctions:201 excludes Tate's thesis; Part I §2.3a uses Hecke's theta method; SmoothRepresentationsOfLocalGroups:1097 has only ring-valued local Haar measures; RestrictedProducts:437 names a roadmap that exists nowhere | Holds | None |
| Scope: single owner; Downstream consumers | heads of #792, #924, #925, #856, #851 | citations of this roadmap: 54, 33, 9, 0 and 0; #856:2285 and #851:1082 construct the objects | **Fails** for two | R01 |
| `quadratic_large_sieve` | `M=N=1`; `M=1`, `N=3`, `a₁=a₃=1` | `|a₁|²≤2C|a₁|²` needs `C≥1/2`; `|1+1|²=4≤C·3^e·4·2` | Consistent | None |
| `quadratic_fourth_moment` | `σ=1`; `σ=1/2` | right side `C(Q+1)(Q(1+|t|))^e` against about `Q` characters with bounded `L(1,χ)`; `C·Q(2+|t|)(Q(1+|t|))^e` is Heath-Brown's `(Q(1+|t|))^(1+ε)` | Consistent | None |
| `firstEisenstein_generate` | `a=1/2`, `1/4` | `firstEisenstein(1/2)=0`; `u=firstEisenstein(1/4)=(e(3/4)−e(1/4))/4`, `u²=(e(1/2)−1)/8`, so `e(1/2)=1+8u²` | Generation survives the zero | None |
| `critical_scaling_measure_unique` | `β=1`, Haar; `β=0.5`, `δ₀` | `(q_*μ)(E)=μ(q⁻¹E)=|q⁻¹|_fμ(E)=qμ(E)`; `2_*δ₀=δ₀≠√2δ₀` | Holds; non-example excluded | None |
| §4.8 (sample) | `a=1/2`, `s=2` | `expZeta=−η(2)=−π²/12=−0.8225`; `Φ(−1,2,1)=+0.8225`; `zΦ=−0.8225` | Holds | None |
| §5.24 (sample) | LOWW Proposition 3.7(3); `s=1/2` | factor and `D^(4s−2)` as at LOWW line 614–621; per degree, `3π⁻²·π·2π/√3=2√3=3.4641`, and `D⁰=1` | Holds | None |
| §6.6 (sample) | `∅`; `{λ}`; `{1/4}` with `u=s(s−1)` | `1`; `λ+u`; `(s−1/2)²` | Holds | None |
| §6.12 (sample) | `g=2` | `ζ(0)=a₁−dim ker=−(g−1)/3−1=−4/3` (`a₁` from `:2060`); `1/Γ(s)∼s` cancels `a₁/s` | Holds | None |
| §6.23 (sample) | `μ₂`; scaling state | `μ₂*μ₂=1`; `α₂(1)=1_(2Ẑ)` of mass `1/2`; `φ(μ_nμ_n*)=μ(nẐ)=n^(−β)` | Holds | None |
| §6.27 (sample) | `t_(n,m,γ)` with `a=n/m` | `σ_(−i/2)`: `(n/m)^(1/2)(nm)^(−1/2)=1/m`; `μ_n↦x_n`; `μ_n*↦x′_n/n` | Holds | None |
| §6.30 (sample) | `σ_t(a)=r^(it)a`, `r=2`, `β=1` | imaginary-time factor `r^(−β)=1/2`, as at `:2396` | Holds | None |
| §6.33 (sample) | `μ₂μ₂*` | `x₂x₂′=1+e(1/2)` (`:2155`), so `φ_base(μ₂μ₂*)=1/2`; `2^(−β)=1/2` iff `β=1` | Holds | None |
| §6.35 (sample) | doubling; `v=−1` | `1+e(1/2)↦1+e(1)=2≠1+e(1/2)`; `θ_(−1)e(γ)=e(−γ)` | Holds | None |
| §4.13 `a(k)` | `k=1`; `k=2`, `p=2` | local factor 1; `1−x²`, `3/4`, `a(2)=6/π²=0.6079` | Holds | Carried (r8) |
| §4.13 `g(k)` | `k=1,2,3` | `1`; `1/12`; `G(4)²/G(7)=4/34560=1/8640` | Holds | Carried (r8) |
| §4.14 `k=2` | Ingham | `a(2)g(2)=1/(2π²)=0.05066` | Holds | Carried (r8) |
| §4.2 Checks | `ζ_H(2,1+i)−ζ_H(2,2+i)`; `c=1/2` | `−i/2`; `2^s(1−2^(−s))ζ(s)` | Holds | Carried (r8) |
| §4.3 Checks | `G(1)` to `G(5)`, `N=1` | `G(5)=12`; `−1/16`; `−1/(720r²)` | Holds | Carried (r8) |
| `barnesG_asymptotic` | `z log Γ(z+1)` | `B₂/2−1/12=0`; tail coefficient `1/(2j(2j+1)(2j+2))` | Holds | Carried (r8) |
| `complexHurwitzContinuation_exists` | `m=0,1`, `c=1` | `−1/2=ζ(0)`, `−1/12=ζ(−1)`, `H(0,c)=1/2−c` | Holds | Carried (r8) |
| `lerch_completed_functional_equations` | the equation applied twice | `(−1)^k e^(−2πia)` reproduces `Λ_k` | Consistent | Carried (r8) |
| `lerchContinuation_solvable` | basepoint `(1/2,−1,1/2)` | `z∉{0,1}`, `Re s,Re c>0` | Well defined | Carried (r8) |
| §5.1/§5.17 | `d=9`, `ψ1`; `d=1`, `ψ2` | `(9/3)=0`; `ψ2(3)=−1` | Holds | Carried (r8) |
| §5.15 `A` | 16×16 | `A²=I`, `A=Aᵀ`, entries `±0.5` | Holds | Carried (r8) |
| `quadraticReflectionFactors` | `ψ−1`, `η=1`, `s=0` | `4/(3π)` | Matches §5.26 | Carried (r8) |
| §5.26 Checks | `B(0)[(1,0),(1,0)]` | `4/(3π)=0.4244` | Holds | Carried (r8) |
| §5.23 Checks | `ψ−2`, `s=0`; `ψ2`, `s=1/2` | `√8/π`; `1` | Holds | Carried (r8) |
| §5.18 Checks | `(−2,−2)`, `(0,0)`, `(10,10)` | memberships; `Q=1083/4` | Holds | Carried (r8) |
| `quadraticDoubleSeries_continuation` | `P∘α`, `P∘β` | `P(w,s)=P(s,w)`; reflection block | Consistent | Carried (r8) |
| §5.3d | `u=0.7, 0.4, 1.3+0.2i` | `C_R(u)C_R(2−u)=I`, error at most `4·10⁻¹⁵` | Holds | Carried (r8) |
| §5.3e | `u=0.7, 1.3, 0.9+0.3i` | `7.6029247` on both sides; `C_C(1)=1` | Holds | Carried (r8) |
| §5.10a `det A` | binary-cubic pairing | `1/9`; `|3|^(−1)` | Holds | Carried (r8) |
| §5.10 vs §5.10b | `|P|^(s−1)` | `(1−q⁻¹)(1−q⁻²)|Δ|^s/o_α` | Consistent | Carried (r8) |
| §5.3l moduli | `n(x)t` | right scaling `|s₁/s₂|^(−1)` | Holds | Carried (r8) |
| §5.3l `ι` height | `diag(t₁,t₂)` | `t(g)` preserved | Holds | Carried (r8) |
| §5.3m height | `n(x)diag(t)k` | `|t₁/t₂|` | Holds | Carried (r8) |
| §5.3n intertwiner | finite, real, complex | `ζ_v(z−1)/ζ_v(z)`, `Γ_ℝ` ratio, `Γ_ℂ` ratio | Holds | Carried (r8) |
| §5.3n `M` | `diag(t)` | exponent `(2−z)/2` | Holds | Carried (r8) |
| §5.21j residues | principal `χ` | `κf̂(0)` at 1, `−κf(0)` at 0 | Holds | Carried (r8) |
| §5.21w poles | constant term | `ρ`, `−ρ`, residue `ρ0` | Holds | Carried (r8) |
| §5.21w Bessel | real, complex | `K_ℝ(2,1)=πe^(−2π)` | Holds | Carried (r8) |
| §5.7a | `ℚ(√−3)` | `κ=0.60460`, `κlog3=0.66422` | Holds | Carried (r8) |
| §6.10 | `δ₀`, `β=0.5`; Haar, `β=1` | `2_*δ₀=δ₀≠2^(0.5)δ₀`; `μ(2Ẑ)=1/2` | Holds | Carried (r8) |
| §6.29/§6.45 | `f=x′₂`, `g=x₂` | `2^(1−β)=1` iff `β=1` | Holds | Carried (r8) |
| §6.43 `e(1/2)` | Gibbs | `2^(1−β)−1→−1` | Holds | Carried (r8) |
| §6.50 | `b=2` | `2^(1−β)−1` on both sides | Consistent | Carried (r8) |
| §6.31 | `e_(2,1/3)` | `u²−1/4=(e(1/3)+e(2/3)−11)/36` | Holds | Carried (r8) |
| §6.42b | swap | `(q/p)^β`; `(p/q)^β` | Holds | Carried (r8) |
| `supercritical_scaling_measures` | `ν=δ₁`, `β=2` | `W` mass `6/π²=0.6079` | Holds | Carried (r8) |
| §6.17g constant | `u→∞` | `C(4ζ′(−1)−log2π−1/2)` | Holds (source erratum) | Carried (r8) |
| §5.3l `Δ_B` | left Haar of `B` | `Δ_B=|t₁/t₂|` (`modularCharacter`) | Holds | Carried (r8, Verified sound) |
| `gl2_classNumber` statement | `K=ℚ`, `ℚ(√−5)` | 1 double coset; Steinitz classes give 2 | Holds | Carried (r8) |
| §5.3j measures | finite `v` | `d^×x(O_v^×)=N(𝔇_v)^(−1/2)`, equal to ArithmeticGaloisRepresentations' `q_v^(−ν_v/2)` | Holds | None |

## Not verifiable

- **Wright [103]**, Theorem 6.1, pp.532–533 (§5.21q's changed proof sentence): the GDZ copy is not in the manifest, and this review edits no manifest. The involution step was checked by computation instead (table).
- **Tate [129]** §§2.2 and 3.3, and **Ramakrishnan–Valenza [130]** Ch. 5 (unchanged locators of §§5.3f–5.3g): no legal open copy was consulted.
- **Datskovsky–Wright [105]**, §2 (§5.3g's binary-cubic pairing): the GDZ scan is image-only and OCR is not available on this worker. Check 3 was recomputed from §5.10a's pairing.
- **Sampled locators outside the changed passages** (§§4.2, 4.8, 4.13, 4.14, 5.15, 6.6, 6.12, 6.23, 6.27, 6.30, 6.33, 6.35, 6.42, 6.45): not rechecked this round. r8 checked ConnesMarcolli08, Neshveyev02/09, JSS25 and Blomer11 at their locators. Keating–Snaith [100] is paywalled.
- **Ownership against open pull requests:** `roadmaps grep` over 471 heads for these objects. Read in context: AdelicAlgebraicGroups, AutomorphicLFunctionsAndLocalFactors, ArithmeticGaloisRepresentations, AutomorphicSpectralTheory, GeometryOfNumbersAndQuadraticArithmetic, GL2AutomorphicRepresentationsAndTransfer, AutomorphicFormsOnReductiveGroups, MetaplecticAutomorphicForms, EndoscopicTransferAndUnitaryTraceComparison and NoncompactQuantumSymmetry. NoncompactQuantumSymmetry's quasi-invariant measure classes are a different object. The others were searched only by grep.

## Source issues

- none
