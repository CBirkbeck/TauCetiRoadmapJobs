# Review of LFunctions (pull request #2626 at 966e5f8)

**Verdict:** needs changes

**Summary.** Changes are needed for one finding. §7.3 now gives a route for `Grossencharacter.unitaryCancelling`, but the route splits on the order of the Hecke character. Its infinite-order branch asserts that some complex place then has a nonzero angular frequency, which `χ₄·N` over `ℚ` refutes. So every ray class character times a nonzero norm power has no route. The earlier reflection error is repaired. There are three small corrections (a sign in step 3 of §8.2, Lean names that other roadmaps still cite, sections without a locator) and one format note, none blocking. A human has to note that Neukirch, the source of 54 of the 68 citations, could not be read.

## R01 (P2) — §7.3's route for `Grossencharacter.unitaryCancelling` splits on the order of the Hecke character, and its infinite-order branch is false for `χ₄·N` over `ℚ`

An implementer following the route has no input for the cancellation field when the unitary part has finite order but the shift is nonzero. That covers every ray class character times a nonzero norm power, over any field. The route (README lines 1497–1515) splits on whether the Hecke character has finite order. For the infinite-order case it says: "If it has infinite order, some complex place has angular frequency `k_w ≠ 0`, since a Hecke character trivial on the identity component of the archimedean ideles has finite order". The last clause is true, but the inference fails.

Take `χ = χ₄·N` over `ℚ`: the idele class character `χ₄‖·‖⁻¹`, which on ideals is `(n) ↦ χ₄(n)·n`.
- It is algebraic, of exponent `−1`, and has a presentation, for instance at `(4)·∞`.
- It has infinite order, since `|χ((3))| = 3`.
- `ℚ` has no complex place.

The finite-order branch does not apply either. §6.2's `unitaryWeight_eq_rayClassIdealWeight` assumes `χ.toHeckeCharacter = ofRayClassCharacter η`, which fails here. So the field `cancellation` for the weight `χ₄` has no route, although it holds (the partial sums are bounded). The Landau step later in §7.3 ("For `χ_u` of order two … as the L-function of a nontrivial finite-order Hecke character") relies on the same identification. The docstring of `Grossencharacter.unitaryCancelling` (`Suggested.lean` 2031–2036) and the description's §7.3 sentence repeat the split.

The smallest repair is to split on the unitary part:
- **Every angular frequency is zero.** Then `χ.toHeckeCharacter.unitaryPart` is trivial on the identity component, hence of finite order. By Tau Ceti's `isFiniteOrder_iff_exists_rayClassCharacter` (`HeckeCharacter/FiniteOrder.lean:81`) it is `ofRayClassCharacter η` for a ray class character `η` of some modulus `𝔫`, and `η ≠ 1` because `χ_u` is not a norm twist. `χ_u` and `η.toUnitaryIdealWeight` agree off the primes dividing `𝔪₀𝔫₀`, so `hasCancellation_toUnitaryIdealWeight` with `HasCancellation.restrictAway` (`ArithmeticDirichletSeries/Cancellation.lean:220`) gives the cancellation of `χ_u`.
- **Otherwise** some `k_w ≠ 0`, and the weighted lattice count applies as written.

`𝔫` cannot be taken to be `𝔪` in general. `χ₄·N` is presentable at `(4)`, because its archimedean component `x ↦ x⁻¹` has the parity of its exponent. Its unitary part `χ₄` is not a ray class character of `(4)`, since that ray class group is trivial.

## C01 — Step 3 of §8.2 gives the limit of "the difference" with the sign of the reverse difference

Step 3 (README lines 1685–1689) says that "the difference of the two left sides tends to `−∑_𝔭 (log(1 − N𝔭⁻¹) + N𝔭⁻¹)`". Read in the order written, the difference is `∑ N𝔭^(−1−δ) − log ζ_K(1+δ)`. That tends to `+∑_𝔭 (log(1 − N𝔭⁻¹) + N𝔭⁻¹)`, which is the sign that gives the stated formula for `B_K` (Lebacque, Proposition 3, `lebacque-mertens` lines 457–485).

Over `ℚ`, `B − γ = 0.26150 − 0.57722 = −0.31572 = ∑_p (log(1 − 1/p) + 1/p)`, while the text's limit is `+0.31572`. Either name the difference as `log ζ_K(1 + δ) − ∑_𝔭 N𝔭^(−1−δ)`, or drop the minus sign.

## C02 — Lean names this pull request removes are still cited by two other roadmaps, and no sentence maps them

The citing roadmaps cannot follow these names, because neither the head nor Tau Ceti at the pin declares them:
- GeometryOfNumbersAndQuadraticArithmetic, on main (its README line 256), cites "LFunctions §1 / `covolume_dualIdealLattice`";
- ThetaInvariantsOfEuclideanLattices, an open new roadmap, cites `coe_dualIdealLattice` as LFunctions Layer 1 (its README lines 188 and 636).

A sentence in Scope and ownership would fix this, for example: "the dual of an ideal lattice and its comparison with the trace dual, formerly `dualIdealLattice`, `coe_dualIdealLattice` and `covolume_dualIdealLattice`, are Tau Ceti's `mixedDual`, `mixedDual_idealLattice` and `covolume_idealLattice_dual`". ZerosOfLFunctions already redirects the removed Layer 7–8 names.

## C03 — The theorems of §§7.3–7.5 still carry no source, and the functional equations of §§5.4 and 6.9 have none at the claim

The nonvanishing of Grossencharacter L-functions on `Re s = 1`, the angular characters of `ℚ(i)` and the boundary datum (§§7.3–7.5) cite no work. `completedHeckeLFunction_one_sub` (§5.4) and `Grossencharacter.completed_one_sub` (§6.9) have no locator at the claim. The References attribute Neukirch VII (8.2)–(8.6) to the functional equation. A locator at each of these claims would let a reader check the generality stated. The other locators the previous review asked for are now given.

## N01 — The docstring of `Grossencharacter` names `UnitaryIdealWeight.imaginaryNormTwist`, which does not exist

The name is at `Suggested.lean` line 1052. The declaration is this file's `imaginaryNormTwist` (line 1999).

## Questions for the author

- §5.3 (README 926–928) and the docstring of `heckeMellinTotal_inv` give Neukirch's closed form of the root number as VII (8.5), with `τ(χ_f)` the Gauss sum of (7.4). Is that the book's numbering and normalisation? I could not open Neukirch. The transformation law that pins `rootNumber` does not depend on the closed form.

## Earlier findings

These are the remarks of the review of `3ef2fae`.

- **R01 (no input for infinite-order cancellation): partly repaired.** §7.3 now has a route: "the bound then comes from a weighted lattice-point count … the integral vanishes". Mathlib's cone depends only on `normAtPlace` (`FundamentalCone.lean:99, 179`), so it is stable under rotations and the main term does vanish. The case split in front of it is the new R01.
- **R02 (reflection about `1/2 + σ`): repaired.** The overview (lines 22–25), §6.6 (1207–1210) and the docstring of `grossencharacterData` now say that `Λ(χ, s) = W(χ) Λ(χ⁻¹, 1 − s)` carries `Re s = 1/2 + σ` to `Re s = 1/2 − σ`.
- **C01 (one-step statements): repaired.** Each is marked as holding for every canonical continuation, or as a corollary. §3.4 points to `completedPartialZeta_eq_tsum`.
- **C02 (cite Tau Ceti's nonvanishing for weights): repaired.** See §7.1 (1433–1436), §7.3 (1533–1536) and the contracts (1987–1989).
- **C03 (owner of non-algebraic and Artin L-functions): repaired.** Lines 1859–1867 name AnalyticNumberTheoryPartI §§2.3a, 2.18a and 2.2a.
- **C04 ("follows Neukirch"): repaired.** None of the three sentences remains.
- **C05 (locators): partly repaired.** §4.1 cites Tau Ceti's theorem, §4.2 cites Washington, and §2.1 cites Tau Ceti; §§7.3–7.5 still have no source (C03).
- **C06 (references): repaired.** Hecke's *Lectures* and Iwaniec–Kowalski are gone, Loeffler–Stoll is cited at §7.1, and the Lebacque pages are marked "(arXiv version, pp. 8–9)".
- **C07 (§2.2 germ clause): repaired.** It now reads "so that their sum is the canonical continuation of that series".
- **C08 (ThetaSeries dropped as supplier): repaired** in the description.
- **N01 (docstrings, long lines): repaired.** All 179 declarations have docstrings, and no line exceeds 100 characters.

## Verified sound

**Adversarial table.** Values were computed by hand; the decimals are floating-point.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 0.1 coefficient growth | `a_n = n` at `2^k`; `a_n = √n` | `∑_{2^k≤x}2^k < 2x`; `∑√n ~ (2/3)x^(3/2)`, `∑√n·n^(−3/2)` diverges | sound |
| 1.1 Gaussian, theta | `ℚ`; `ℚ(i)` | covol `1`, `θ(t)=t^(−1/2)θ(1/t)`; covol `1·2⁻¹·√4=1`, `θ(t)²`, factor `t⁻¹`; trace dual `½ℤ[i]` | sound |
| 1.2 `mixedFourier_archGaussian`, `latticeTheta_inv` | real, complex place; real quadratic | `y^(−1/2)`; `y⁻¹=(y²)^(−1/2)`; `unitScale ε:(ε²y₁,ε⁻²y₂)`, norm kept | sound |
| 1.3 `surfaceHaar_of_isUnitFundamentalDomain` | `ℚ`; `ℚ(i)`; real quadratic | `1=2⁰·1/1`; shell `[1,e^(1/2)]` mass `1/2`; `dy/y=du dt/t`, length `2log ε` | sound |
| 3.3 unfolding, kernel, dual | `ℚ`; `ℚ(i)`; covolumes | `½·2π^(−s/2)Γ(s/2)ζ`; `(2/4)·4π^(−s)Γ(s)ζ_K=4^(s/2)Γ_ℂζ_K`; `V_dual=2^(−r₂)/(N(I)√|d|)=V_I⁻¹4^(−r₂)` | sound |
| 3.4 FE, residue of partial zeta | `ℚ`, `ℚ(i)`; real quadratic | `2·½=1`; `2·¼=½=2^(r₁+r₂)hR/w`; `2R` | sound |
| 3.6 `dedekindZetaC_leading_zero` | `ℚ`; `ℚ(i)`; real quadratic | `−1/2`; `(−½)(½)=−¼=−hR/w`; derivative `−h log ε/2`; `Γ_ℝ,Γ_ℂ ~ 2/s` | sound |
| 3.7 normalization | `ℚ(i)` | `2^s·2(2π)^(−s)Γ(s)=2π^(−s)Γ(s)`; `Γ_ℝ(s)Γ_ℝ(s+1)=2^(1−s)π^(−s)Γ(s)=Γ_ℂ(s)` | sound |
| 4.1 quadratic factorization | `ℚ(i)` at 2, 3, 5 | `(1−2^(−s))⁻¹` from `ζ`; `(1−9^(−s))⁻¹=(1−3^(−s))⁻¹(1+3^(−s))⁻¹`; `(1−5^(−s))⁻²` | sound |
| 4.2 imprimitive | characters mod 4 | `ζ_K(1−2^(−s))=ζ(1−2^(−s))L(χ₄)`; misplaced correction off by `(1−2^(−s))²` | sound |
| 5.2 orthogonality | `ratModulus 4` | `2ζ(s,[1])=ζ(1−2^(−s))+L(χ₄)`, `2ζ(s,[3])=…−L(χ₄)`; supplier uses `(χ c)⁻¹=conj` | sound |
| 5.3 Gauss sums | `χ₄`, `y=¼`; mod 5; order 3 mod 7 | `i+i=2i`, `|·|=2`; `τ(2/5)=−√5`; `ρ(−1)=ω³=1`, `ω⁻¹` | sound |
| 5.4 FE, root number | `χ₄`; `χ₅`; `W=Λ(2)/conj Λ(−1)` | `2i/(i·2)=1`; `√5/√5=1`; `Λ(χ,−1)=W′Λ(χ⁻¹,2)≠0` | sound |
| 6.5 `lFunctionC_eq_primitive`, conductor | `N^m/ℚ`; `χ₄N` | `ζ(s−m)` on `Re s>1+m`; parities odd/odd, so no `∞` in conductor | sound |
| 6.6 card | angular `k`; `N^m`, `m` odd | `gammaC={|±4k|/2}={2|k|}`, conductor `4·1`; real shift `0`, exponent parity `1` | sound |
| 6.9 `completed_one_sub` (headline 2) | `N/ℚ`, `s=5`; `Tr p>0` | `Λ_ℚ(4)=0.10966` both sides; `k−(s+T/n)/2=((1−s)+T/n)/2`; `f₀=g₀=0` | sound |
| R02 repair | shift `σ` | `Re s=½+σ ↦ Re(1−s)=½−σ` | repaired |
| 7.1 (headline 3) | `χ₄`, `t=0` | `L(1,χ₄)=π/4`; `3-4-1` orders `−3+4−1=0`; supplier needs only cancellation of `χ`, `χ²` | sound |
| 7.3 `unitaryCancelling` route | `χ₄N/ℚ` | `|χ((3))|=3`, infinite order; `r₂=0`, no `k_w`; §6.2 hypothesis fails | gap (R01) |
| 7.3 Landau step | `ζ_K L(χ_u)`, `χ_u²=1` | coefficient at `𝔭^k`: `k+1`, `(1+(−1)^k)/2`, `1`; `≥ζ_K(2s)→∞` at `½⁺` | sound |
| 7.4 angular characters | `a=2+i`, `k≠0` | `((3+4i)/5)^(2k)` vs `^(−2k)`; exponents `−2k`, `2k`; `k=0` gives `ζ_{ℚ(i)}` | sound |
| 7.5 Liouville remark | `λ_K`, `n≥3` | `ζ_K(2s)/ζ_K(s)`, zero at 1; `x^(½+ε)⊂x^(1−1/n)`, `1−1/n≥2/3` | sound |
| 8.1 cards | `dedekindZetaData ℚ` | coefficient `1`; Mathlib `Λ(0)=Λ₀(0)−1` vs `0`; `ℚ(i)` coefficient at 5 is `2` | sound |
| 8.2 Mertens (headline 4) | Lebacque Thm 5 (NF); `ℚ(√−5)`; `ℚ(i)` | `e^(−γ_K)/log x`, `γ_K=γ+log κ`; `κ=π/√5=1.405`; `π/4` | sound |
| 8.2 step 3 sign | `ℚ` | `B−γ=0.26150−0.57722=−0.31572=∑(log(1−1/p)+1/p)`; text gives `+0.31572` | C01 |

- **Source locators checked against the text:**
  - `lebacque-mertens`: Theorem 5 (NF), p. 5 (lines 193–223); Proposition 2, p. 8 (369–373); Proposition 3 and the closing formula, p. 9 (457–490).
  - `loeffler-stoll-lean`: §6, p. 54 (PDF p. 12, lines 423–458).
  - The 54 Neukirch and 2 Washington citations could not be read.
- **Library declarations opened at the pins** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`):
  - `ArithmeticDirichletSeries/Cancellation.lean:97,158,168,220,282,297,312,322` and `…/Nonvanishing.lean:73,84,99,134`;
  - `Theta/UnitFundamentalDomain.lean:58,110,161,219,232`; `RayClass/Modulus.lean:98,504`; `Quadratic/DedekindZeta.lean:199`; `Hecke/Orthogonality.lean:119`;
  - `HeckeCharacter/FiniteOrder.lean:81`, `Shift.lean:265,273`; `TraceDual.lean:187,200`; `LatticePointCount.lean:102`; `NormLeOneLipschitz.lean:312`;
  - Mathlib `NumberField/CanonicalEmbedding/FundamentalCone.lean:99,179,480,511`.
- **Cross-roadmap citations resolved:**
  - ArithmeticDirichletSeries and GlobalNumberFields are completed on main.
  - AnalyticNumberTheoryPartI on main (lines 11–15, 79) owns §§2.3a, 2.18a and 2.2a and consumes Layers 1, 5 and 6.
  - Consumers: ZerosOfLFunctions on main (486–487) redirects its removed names. ExplicitNumberFields (2725, 3090) cites Layer 8. QuasiRiemannHypothesis (557–571) cites `gaussSum_mul`, which exists. GeometryOfNumbersAndQuadraticArithmetic and ThetaInvariantsOfEuclideanLattices cite removed names (C02).
- **Automatic checks:** all passed at this head. The dependency check run here gave `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing changes outside the folder.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 111 `sorry` warnings and no other message.
- **One-tactic probe:** a copy with `first | rfl | (simp; done) | infer_instance | sorry` in place of each `sorry`, and a second copy without `rfl`, closed none of the 111; `rfl` timed out on 11.
- **Signatures:** `#check @` on all 179 declarations shows that each keeps `K`, `[NumberField K]`, its modulus and its hypotheses.
- **Form:** there is no `set_option`, `lemma`, `#eval` or sorried data; there are 32 Tau Ceti imports, all built.
- **Headlines:** the four headlines of the overview are stated, and the module docstring says all are statable. The README has 65 Checks in 27 blocks, matching the description.
- **Overlap check:** read ZerosOfLFunctions, GlobalNumberFields, QuasiRiemannHypothesis, ExplicitNumberFields, HilbertModularForms and ArithmeticDirichletSeries, with AnalyticNumberTheoryPartI. The shared objects and their owners:
  - Hecke continuation for non-algebraic unitary characters: AnalyticNumberTheoryPartI §2.3a, which consumes Layers 1, 5 and 6;
  - explicit Mertens theorems: ExplicitNumberFields, which cites Layer 8 for the qualitative product;
  - power-residue Gauss sums: QuasiRiemannHypothesis, which cites §5.3.

  Nothing is owned twice. Ownership against the open pull requests was checked with the index tools.

Source independence: 7 passages compared with 2 sources (`lebacque-mertens`: the §8.2 statement, steps 2–4 and the docstring of `tendsto_prod_one_sub_inv_absNorm_div_log`; `loeffler-stoll-lean`: the §7.1 sentence on Mathlib's quadratic case); none shared beyond forced formulas. Largest share: `neukirch-ant`, 54 of 68 source mentions. Its text and its contents page could not be read: Springer redirects to a login, and zbMATH returned 403. Compared through the README's own equation numbers: Layer 1 ↔ VII §§3 and 5 (parts), Layer 3 ↔ VII §5, Layers 5–6 ↔ VII §§6–8; Layers 0, 2, 4, 7 and 8 have no counterpart. The *Needs:* lines force 3.2 → 3.3 → 3.4 → 3.5 → 3.6 and Layer 6 → §5.4. Independent by the locators, not checked against the book.

Research link: the headlines are Hecke's continuation and functional equation for Grossencharacter L-functions (Neukirch VII §8, as the README cites) and Rosen's Mertens product over a number field (Rosen 1999; Lebacque 2007, Theorem 5 (NF)). On main they are consumed by ZerosOfLFunctions, AnalyticNumberTheoryPartI §2.3a and IntegralIwasawaTheory. This rests on the README, the `lebacque-mertens` text and those roadmaps' text.

## Not verifiable

- J. Neukirch, *Algebraic Number Theory* (`neukirch-ant`): uncertified (paywalled). The book page redirects to a login, and the zbMATH entry returned 403. Its equation locators in Layers 1, 3, 5 and 6 were checked by computation only (table).
- L. C. Washington, *Introduction to Cyclotomic Fields*, Theorem 4.3 (`washington-cyclotomic`): uncertified; checked by the `ℚ(ζ₅)` and mod-4 computations only.
- M. Rosen, J. Ramanujan Math. Soc. 14 (1999): paywalled, not read. Only its form in Lebacque was read.

## Source issues

- none

## For the human reviewers

- Not tested: Neukirch, *Algebraic Number Theory*, holds 54 of the 68 source mentions (README). Its text and its contents page could not be read legally, so the wording and the arrangement were not compared against it.
