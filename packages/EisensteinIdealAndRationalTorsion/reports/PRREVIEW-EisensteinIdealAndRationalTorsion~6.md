# Review of EisensteinIdealAndRationalTorsion (pull request #1264 at 3360c02)

**Verdict:** needs changes

This is an incremental re-review of the 8 changed lines since 27586f6. Since then the branch has also merged main, which moved the pins to Lean v4.36.0-rc2, Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. That move is why the gate now fails (R01). It also put the objects behind two README citations into the pinned Tau Ceti (R02, R03).

## R01 (P1) — The targeted build fails: `Suggested.lean` is not in module form

**Location:** `TauCetiRoadmap/EisensteinIdealAndRationalTorsion/Suggested.lean:1–2`, “import Mathlib / import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois”.

**Claim:** The file passes the push gate's targeted build.

**Witness:** I reran the gate with `--build` at this head and got `build=2 FAIL`. Lake warns twice that the file “imports `Mathlib` … designed for use with the module system; consider adding `module`”. The imported Tau Ceti file is itself a module (`Galois.lean:6`).

**Repair:**
- Make line 1 `module`.
- Use `public import Mathlib` and `public import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois`.
- Put `public section` after the module docstring and a closing `end` after `end TauCetiRoadmap.EisensteinIdealAndRationalTorsion`.

This is the shape of the main-branch module-form files, for example `TauCetiRoadmap/FlagVarieties/Suggested.lean:1–36`.

**Tested:** A scratch copy with exactly these edits elaborates with `lake env lean`: exit 0, only the six `sorry` warnings, and all six signatures are unchanged. I did not run a Lake build of the scratch copy, because the brief allows the targeted build only on the worktree.

## R02 (P2) — The Eisenstein-series, Hecke and modular-symbol inputs credited to ModularForms Layers 0 and 8 have moved to Tau Ceti

**Location:** `TauCetiRoadmap/EisensteinIdealAndRationalTorsion/README.md:51`, “Layer 0 supplies the corrected weight-two Eisenstein series … Its Layer 8 supplies integral modular symbols, the integral Hecke algebra and the coefficient-field decomposition.” Line 9 says “`TauCetiRoadmap.ModularForms` owns `q`-expansions, integral modular symbols, the classical integral Hecke algebra and coefficient fields”. The same Layer 0/8 citations appear in the *Needs:* lines at 216, 228, 479, 560, 611, 636, 663 and 717, and in the Dependencies at 236 and 737.

**Claim:** ModularForms Layers 0 and 8 supply these objects, and ModularForms owns `q`-expansions.

**Witness:** The ModularForms revision (pull request #1706, head 3453d2b) renames Layer 8 to “weight-one arithmetic and Galois stability” (`TauCetiRoadmap/ModularForms/README.md:779`). Its line 334 hands the old Layer 8 to Tau Ceti `heckeTCuspAlgebra`, the period map and coefficient fields. Its line 172 gives E₂ to Tau Ceti `correctedE2`. On main, line 182 of the same README lists `qExpansion` as Mathlib's.

**Repair:**
1. Under **From Mathlib and Tau Ceti**, cite the pinned declarations, each with its file:
   - `TauCeti.EisensteinSeries.correctedE2` (`TauCeti/NumberTheory/ModularForms/EisensteinSeries/WeightTwo/Basic.lean:81`);
   - `TauCeti.heckeTCuspAlgebra` and `TauCeti.heckeTCuspAlgebra_finite` (`…/HeckeSlash/Finite.lean:51,122`). These are on `S_k(Γ₁(N))`, with finiteness for `k≥2`.
   - `TauCeti.ModularSymbols.periodMap_injective` (`…/ModularSymbols/Period/Injective.lean:148`) and `TauCeti.ModularSymbols.periodMap_heckeTCuspNat` (`…/Period/Hecke.lean:104`);
   - `TauCeti.CoefficientField` (`…/Newforms/Fields.lean:48`);
   - Mathlib's `UpperHalfPlane.qExpansion` (`Mathlib/NumberTheory/ModularForms/QExpansion.lean:172`).
2. In lines 9 and 51 and in the *Needs:* and Dependencies lines listed above, replace “`ModularForms` Layer 0/Layer 8” with these names.
3. Keep ModularForms Layer 10C in §7.9: at the revision head it still holds the automorphy-sheaf section spaces.
4. The prime-level `Γ₀(P)` weight-two image algebra `T` stays as it is, constructed from ModularCurvesPartII §§13.1–13.4 and §0.4 here.

**Tested:** Each name is at the Tau Ceti pin `2fd255d9` at the line given (namespaces checked). They are the declarations the revision's own Tau Ceti contract names (its lines 172 and 243–250). At `t=11`, `correctedE2` has constant term `1−t=−10`. Its normalized `qⁿ` coefficient `σ(n)−11σ(n/11)` equals §0.3's `Σ_{d|n, 11∤d} d`; at `n=11` both are 1.

## R03 (P3) — The Mathlib and Tau Ceti contract names the old pins and a partial declaration name

**Location:** `TauCetiRoadmap/EisensteinIdealAndRationalTorsion/README.md:33`, “The baseline is Mathlib `6b7abb3c…` and Tau Ceti `a91d3aafa8…`.” Line 39: “`AlgebraicGeometry.AbelianVariety`, in `TauCeti.AlgebraicGeometry.AbelianVariety.Basic`”.

**Claim:** These are the pins, and `AlgebraicGeometry.AbelianVariety` is the declaration's name.

**Witness:** `lake-manifest.json` at this head pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. `#check @AlgebraicGeometry.AbelianVariety` fails at the pin with “Unknown identifier”. The structure is declared in `namespace TauCeti` (`Basic.lean:68,95`).

**Repair:** In line 33, state the current pins or delete the sentence. In line 39, write `TauCeti.AlgebraicGeometry.AbelianVariety`.

**Tested:** I checked the other 21 library names the README cites at the new pins. 19 pass `#check`. `LeftCosetModule.deg` (`Degree.lean:104`) and `NumberField.Chebotarev.infinite_frobeniusPrimeSet` (`Chebotarev.lean:74`) are found in the source, because their object files are not built.

## Previous findings

- R01 — repaired: line 13 now reads “EllipticCurveModularityPartII §6.0c consumes §7.9 here as its cuspidal-divisor-torsion contract and supplies its §§6.5 and 6.8 from that import.” Line 1308 says the same, with “imports”.
- R02 — repaired: line 51 now reads “The rational first-coefficient pairing comes from `ModularCurvesPartII` §§7.5–7.6 and the integral differential lattice from its §§13.7–13.9”. Line 9 matches. The remaining ModularForms Layer 0/8 attribution on the same lines is the separate new finding R02 above.

## Verified sound

**Gate and dependency check.** My gate run without `--build` reports every scanner at zero and `OK`. With `--build`, the only failure is R01's `build=2`. The outside-folder diff against `origin/main` is empty, and the worktree is unchanged. The dependency check output:

```text
depcheck: 240 roadmaps, 2441 edges, 0 problem(s)
```

It prints no UPWARD, CYCLE or moved line. The README has no supplier citation of EllipticCurveModularityPartII. The name occurs only at lines 13 and 1308, both consumer statements, and no *Needs:* line cites it.

**Elaboration at the new pins.**
- `lake env lean` on `Suggested.lean` exits 0 with six `sorry` warnings only.
- `#check @name` for all six declarations gives types identical to the README statements and to the previous round: every prime, `7<P`, exact-order and `IsElliptic` binder is present, and the last headline uses `Gal(AlgebraicClosure ℚ/ℚ)` acting through `torsionGaloisAction` on `torsionBy … ↑P`.
- Padding probe: 30 one-tactic attempts (`simp`, `rfl`, `infer_instance`, `decide`, `norm_num` × 6 theorems) all fail.
- The pinned Tau Ceti has no theorem duplicating a headline: I searched for `classNumber` on cyclotomic fields, order-13 exclusion and Ogg/Mazur torsion.

**Library declarations opened at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).**
- Mathlib: `UpperHalfPlane.qExpansion` (`Mathlib/NumberTheory/ModularForms/QExpansion.lean:172`); `ModularForm.discriminant_ne_zero` and `CuspForm.discriminant` (`…/ModularForms/Discriminant.lean:123,237`); `IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver` (`…/NumberField/Cyclotomic/Ideal.lean:149`).
- Tau Ceti: `WeierstrassCurve.torsionGaloisAction` (`TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:77`); `LeftCosetModule.deg` (`TauCeti/NumberTheory/HeckeRing/Degree.lean:104`); `NumberField.Chebotarev.infinite_frobeniusPrimeSet` (`…/Chebotarev/Density/Chebotarev.lean:74`); `TauCeti.AlgebraicGeometry.AbelianVariety` (`…/AbelianVariety/Basic.lean:95`); and the five R02 declarations at the lines given there.
- Plus the 19 `#check`s of R03, with the full name `TauCeti.AlgebraicGeometry.AbelianVariety` also confirmed by `#check`.

**Cross-roadmap citations resolved (6).**
- EllipticCurveModularityPartII at head 51b297d. Its contract line 150 restates §7.9 here clause for clause: a number field `K`, every `X₀(N)` with `N≥1`, Cartan quotients, and images under every homomorphism to an abelian variety. §6.0c line 664 imports it. §6.5 (line 872) and §6.8 (line 902) take it through §6.0c. This roadmap's §§7.8, 7.9 and 8.9, which that roadmap cites, are at README lines 986, 998 and 1284.
- ModularCurvesPartII at the #913 head: §7.5 (line 2365, the rational pairing `β(T,f)=a₁(Tf)` with bad `U` blocks); §7.6 (line 2397, rational perfection only, integral perfection explicitly not claimed); §§13.7–13.9 (lines 3428, 3449, 3468, dualizing differentials and the identification `B⁰(R)`, including the fibre at `P`).
- ModularForms on main: Layer 0 (line 259) and Layer 8 (line 764). ModularForms at the #1706 head: Layers 0, 8 and 10C (lines 341, 779, 1207).

### Adversarial table

The first block has a row with computed values for every statement the diff changed, and for the six Lean statements re-elaborated at the new pins. The second block carries forward, unchanged, the previous report's rows for the statements the diff leaves untouched, each marked “carried from r5”. That block covers the seeded targets 0.1, 1.5, 2.4, 3.5, 4.1, 4.5, 5.2, 6.6, 7.2, 7.4, 7.6, 7.7, 8.3, 8.7 and 8.8, and every headline.

| Statement | Instances tried | Values computed on both sides; wrong-model control | Result / change |
| --- | --- | --- | --- |
| Line 13 / 1308: Manin–Drinfeld supply direction | Consumer EllipticCurveModularityPartII at 51b297d; this README | Consumer: independent proof targets of cuspidal torsion 0; imports from §7.9 1 (line 664); uses through §6.0c 2 (lines 872, 902). Contract clauses matching §7.9: 4 of 4. Supplier citations of the consumer here: 0. Dependency-check UPWARD/CYCLE lines: 0. | Previous R01 repaired. |
| Line 9 / 51: rational pairing (ModularCurvesPartII §§7.5–7.6) | `N=11`; pairing scaled by 2 | dim `V_Q`=1, `T_Q=ℚ`, `β(1,f)=a₁(f)=1≠0`, so the pairing is perfect and `dim T_Q=dim V_Q=1`. Scaling by 2 gives determinant 2: a unit in ℚ, not in ℤ. This agrees with §7.6 claiming only rational perfection. | Previous R02 repaired. |
| Line 9 / 51: integral differential lattice (ModularCurvesPartII §13.7) | `P=11`, `R=ℤ` and `R=ℤ/11` | `H⁰(M_R,ω)` has rank 1 = genus, matching `B⁰(R)`, and §13.7 explicitly includes the fibre at `P`. The wrong model “symbol module” also has boundary rank 1 at level 11 (two cusps), so a full-symbol substitute has rank 3, not 1. | Repaired. |
| Line 51: ModularForms Layer 8 content | Main versus the #1706 head | Main Layer 8 (line 764) holds symbols, integral Hecke algebra and coefficient fields: 3 of 3. Revision Layer 8 (lines 779–975): modular-symbol mentions 0, `heckeTCuspAlgebra` mentions 0. The objects sit in its Tau Ceti contract (lines 243–250, table line 334). | R02. |
| Line 51: corrected E₂ (Layer 0) versus `correctedE2` | `t=2`, `t=11`, `t=1` | `t=2`: coefficients of `q⁰,q¹,q²` are `(−1,−24,−24)`, since `−72+48=−24`. `t=11`: constant term −10. Normalized `qⁿ` coefficient `σ(n)−11σ(n/11)` equals `Σ_{d∣n,11∤d}d`: at `n=11`, `12−11=1`; at `n=2`, 3=3. `t=1` gives zero (`Basic.lean:164`). | R02: cite `correctedE2`. |
| Line 9: owner of `q`-expansions | Mathlib pin; ModularForms on main | `UpperHalfPlane.qExpansion` is declared at `QExpansion.lean:172`. ModularForms line 182 lists it among the objects to consume, not to build. Owner: Mathlib (1), ModularForms (0). | R02. |
| Line 33 / 39: pins and names | Manifest; `#check` | Mathlib `1b1ccf4b` versus README `6b7abb3c`; Tau Ceti `2fd255d9` versus `a91d3aaf`. 21 of 22 library names resolve; `AlgebraicGeometry.AbelianVariety` gives “Unknown identifier”, while `TauCeti.…` resolves. | R03. |
| Lean form (gate build) | Original; module-form copy | Original: 2 Lake module warnings, `build=2 FAIL`. Copy: 0 non-`sorry` warnings, 6 `sorry` warnings, same six types. | R01. |
| `isogeny_iteration` at the new pins | `P=11` (allowed), `P=13` (excluded) | Type unchanged. The hypothesis `P≠13` is needed because level 13 has genus 0 and is handled by Layer 8. 5 one-tactic probes fail. | Retain. |
| `cyclotomic_thirteen_class_number` at the new pins | Degree 12, Minkowski bound | Type unchanged, `classNumber (CyclotomicField 13 ℚ) = 1`. `decide`, `norm_num`, `simp`, `rfl` and `infer_instance` all fail. No pinned theorem gives the value. | Retain. |
| `order_thirteen_exclusion` at the new pins | Identity point; infinite order | `addOrderOf` is 1 for the identity and 0 for infinite order, neither 13. Type unchanged; 5 probes fail. | Retain. |
| `occurring_small_primes` at the new pins | The four witness models of r5 | Discriminants `64,−27,−11,−1664` are nonzero; the type still requires `W.IsElliptic` inside the existential. 5 probes fail. | Retain. |
| `all_prime_torsion` at the new pins | `P=4` (not prime), `P=11` | The prime quantifier excludes 4; 11 is excluded by `isogeny_iteration`, 13 by `order_thirteen_exclusion`. Type unchanged; 5 probes fail. | Retain. |
| `elliptic_fixed_torsion_zero` at the new pins | `P=7` (excluded), `P=11` with scalar 2 | `7<7` is false, so the order-7 witness is excluded. On `F₁₁` a nontrivial scalar 2 fixes only `v=0`. The action is `torsionGaloisAction` over `AlgebraicClosure ℚ`. Type unchanged; 5 probes fail. | Retain. |

Rows carried forward from the previous report (statements untouched by the diff):

| Statement | Instances tried | Values computed on both sides; wrong-model control | Result / change |
| --- | --- | --- | --- |
| Conventions: distinct primes and full index | P=2,3,5,7,11,13,17,19,37,41,73 | (P−1)/gcd(P−1,12) gives 1,1,1,1,5,1,4,3,3,10,6 respectively. In every case gcd(P,n)=1. At P=17 deleting the dyadic part changes 4 to 1. | Retain full index. (carried from r5) |
| Conventions: actual groups and order | Identity; infinite-order element; cyclic C₅ | addOrderOf values 1,0,5. Thus neither the identity nor infinite-order junk value satisfies a prime-order hypothesis. S₃ is not an abelian-variety point group; its order-2 elements cannot be substituted into the elliptic statements. | Native abelian carrier and ellipticity retained. (carried from r5) |
| Integral differential contract | Genus zero; node in characteristic 2; P=5 in characteristic 2 | H⁰(ω)=H¹(O)=0 in genus zero. Node residues (1,1) have sum 0 in F₂. In the exceptional noncuspidal comparison dim(A/B)=1, while A⁰=B⁰=0. | No inversion of 2 or blanket A=B. (carried from r5) |
| Connected Néron Kummer contract | Tate curve, m=2; additive fibre in characteristic 2 | Generic 2-kernel rank 4, connected special kernel rank 2; [2] on G_a is 0 and cannot surject onto G_a. | Quasi-finite kernel and semistability are necessary. (carried from r5) |
| Component-defect contract | z↦z² on E_q→E_(q²), v(q)=3 | Z/3→Z/6 sends 0,1,2 to 0,2,4; cokernel has order 2. Replacing full by connected sheaves would erase this nonzero term. | Retain component term. (carried from r5) |
| Cotangent/logarithm contract | Split B=A×C, dimensions 1 and 2; multiplication by q on a lattice; e=1,q=2,3 | Cotangent ranks 2→3→1 are exact. Multiplication by q becomes 0 modulo q. Strict bounds read 1<1 (false), 1<2 (true). | Connected-kernel quotient and strict inequality retained. (carried from r5) |
| Admissible-group contract | Zero; constant Z/ℓ; μ₂; extension by zero at P | (δ,α,h⁰,h¹)=(0,0,0,0),(0,1,1,0),(0,0,1,1). The inequality gives 0≤0, −1≤−1, 0≤0. Removing the P-fibre changes δ from 0 to 1 for the same generic constant group. | Marked integral model retained. (carried from r5) |
| Rank-one and dyadic contract | k=F_(ℓ²); M=μ₂ or μ₄ | k-rank 1 has geometric rank ℓ². Amalgam ranks are 2·2=4 and 2·4=8, not 4 and 16. D has generic rank 4 and étale special order 2. | No generic-constancy shortcut. (carried from r5) |
| Cyclotomic-character contract | P=5; action 2 mod 5 and its lift 7 mod 25; P=3 | Inverse actions 3 and 18; 7⁴=1 mod 25 and gcd(7−18,25)=1. A Z/25 module with action 18 has full inverse quotient; action 7 has zero inverse quotient. B₂=1/6 is a unit at 5 but not at 3. | Keep inverse action and separate exponent-one case. (carried from r5) |
| 0.1 Index definition and API | P=2,11,13,17; nonprime 1 excluded | P−1=n·gcd: 1=1·1, 10=5·2, 12=1·12, 16=4·4. At input 1 the natural formula is 0/12=0, so primality is essential for positivity. | Retain. (carried from r5) |
| 0.2 Full/image ideals | T=0; P=11 with T=Z and I=(5) | Full H=Z, ε=id, kernel 0 when T=0. At 11 the cuspidal scalar kernel is 5Z and quotient Z/5. ε(1+w)=1−1=0; the degree character instead gives 2. | Full character cannot factor through cuspidal T. (carried from r5) |
| 0.3 Congruence iff | P=11,m=1,5,25,11; P=17,m=4,8; P=13,m=1,2 | Cusp divisibility values true,true,false,false; true,false; true,false. At 17 holomorphic modulus 8 divides (P−1)/2=8, but 8 does not divide n=4. | Both directions and different holomorphic/cusp conditions retained. (carried from r5) |
| 0.4 Integral Hecke index | P=2,3,13; P=11,17 | Genus-zero T=0 agrees with Z/1=0; dimensions and T-ranks at 11 and 17 are 1; scalar kernels 5Z and 4Z. A rational rank-one pairing multiplied by 2 has determinant 2, not an integral unit. | Integral duality proof cannot be replaced by rational perfection. (carried from r5) |
| 1.1 Cusp class | C₅ with c=1; zero Jacobian at 13 | w(c)=−1=4 mod 5, not 1. At 13 the two cusp points are distinct but their class difference is 0. | Marking/sign retained. (carried from r5) |
| 1.2 Hecke cusp action | P=11,l=2; P=17,l=3 | T₂(c)=3 mod 5; T₃(c)=4c=0 mod 4. U_P(c)=c whereas w(c)=−c. | Good/bad operators distinct. (carried from r5) |
| 1.3 Imported component group | P=11 weighted edges 2,3; P=17,13 | Weighted cycle length 2+3=5 versus unweighted 2; component orders 5,4,1. | Import supplied weighted computation. (carried from r5) |
| 1.4 Exact order and closure | P=11,17,13 | Upper and component lower bounds agree at 5,4,1. At P=17 the C₂ quotient of C by μ₂ has rank 2, while C has rank 4; an everywhere constant C₄ would have four geometric points in characteristic 2 instead of two. | Keep dyadic integral model. (carried from r5) |
| 1.5 Shimura kernel | P=11,13; base change to Q̄ and F̄₅ | Rank 5 kernel has five Q̄-points but μ₅ has one F̄₅-point; constant C₅ would have five. At 13 both cover degree and kernel rank are 1. | Cartier dual, not constant replacement. (carried from r5) |
| 1.6 Intersection | P=11,n=5; P=17,n=4; P=41,n=10 | Intersection ranks 1,2,2. Sum ranks 25,8,50; the false dyadic direct sum gives 16 or 100. At P the Σ specialization has rank n since n divides P−1. | Full scheme intersections retained. (carried from r5) |
| 1.7 Retraction | M=Z⊕C₅, x=(7,3); c=(0,1) | r(x)=(0,3), x−r(x)=(7,0); recombination gives (7,3). r(c)=c, r(7,0)=0; zero map fails r(c)=c. | Retain source and target. (carried from r5) |
| 2.1 Ideal torsion | J elliptic, a=(5),(1); zero J | Generic ranks 25,1,1 respectively; C at P=11 has rank 5, not 25. (10)⊂(5) reverses kernels: J[5]⊂J[10], ranks 25≤100. | Correct variance and closure. (carried from r5) |
| 2.2 Maximal ideals | P=11,41,13 | Sets of residual primes {5},{2,5},∅; residue fields F₅, F₂/F₅, none. In particular 13 is not an Eisenstein residual prime at level 13. | Retain. (carried from r5) |
| 2.3 Quotient definition | a=0,T,(5) with T=Z | γ_a=0,T,0 and A_a=J,0,J respectively. At level 11 [5]J=J, so J/IJ=0 would contradict the retained order-5 cusp. | Universal property excludes wrong quotient. (carried from r5) |
| 2.4 Support | T=Z×Z, a=(5)×Z; a=0,T | Completion Z₅×0 has kernel 0×Z and retains only first factor. a=0 retains both; a=T retains none. | Support direction correct. (carried from r5) |
| 3.1 Residual criterion | P=11,ℓ=5 or 11; P=17,ℓ=2 | m₅ exists since 5 divides 5; m₁₁ cannot since 11 does not. At Frobenius value χ₅=2, characteristic polynomial is (X−1)(X−2)=X²−3X+2. At 2 the two characters both equal 1, but special étale lengths are 1 and 0. | Retain full polynomials and distinct integral models; book limitation below. (carried from r5) |
| 3.2 Étale multiplicity | Ordinary elliptic local factor | T_ℓ-rank of dual étale half is 1, whole Tate module 2. For ℓ=5, C₅ has five geometric special points and μ₅ has one. | Rank-one assertion is about the half. (carried from r5) |
| 3.3 Good primes | (P,ℓ,l)=(11,5,2),(11,5,31),(17,2,2) | Fifth powers mod 11 are {1,10}; 1/2=3 mod 5. For 31 the half-difference is 15=0 mod 5. Fourth powers mod 17 are {1,4,13,16}; 2 is absent although 6²=2. | Good, not good, good respectively. (carried from r5) |
| 3.4 Existence/principality | l=2,167,277 mod 55; l=3,71,139 mod 68 | First progression has l mod 11=2, half-difference=3 mod 5. Second has l mod 17=3 and l mod 4=3. Both residue classes are coprime to the moduli. Local odd model I=5Z₅ has (5,5)=5Z₅ and Tate rank 2. | Dirichlet input has its coprimality hypotheses. (carried from r5) |
| 3.5 Odd kernel | P=11,ℓ=5; P=19,ℓ=3 | C_ℓ⊕Σ_ℓ ranks 5·5=25 and 3·3=9, residual dimensions 2. Dyadic P=17 intersection rank 2 prevents the same direct-sum test. | Odd restriction retained. (carried from r5) |
| 4.1 Winding | Lattice Z, e=1/5; free order-two group ring | 5e=1, e mod Z has order 5, reversing path gives −1/5. (1+σ) maps to 2 in coinvariants, not 1. | Orientation and factor two retained. (carried from r5) |
| 4.2 Quadratic unit | P=17,41,73; f↦−1/f | Exact Bernoulli sums 8,32,88 give r=2,8,22. Applying involution twice gives f; product f·v(f)=−1. At 41 the elements 4 in C₈ have order 2 and 4+4=0. | Corrected square argument retained. (carried from r5) |
| 4.3 Exceptional D | P=17,41; σ=[[1,1],[0,1]] over F₂ | σ²=1 but σ≠1; fixed subspace size 2 versus 4 for identity. Dyadic C+Σ ranks 8 at 17 and 2 at 41; rank-4 D cannot lie in the latter. | Both construction branches needed. (carried from r5) |
| 4.4 Plus separation | P=17 genus-one minus curve, w=−1 | (1+w)J=0, so D∩J_+=0, while w acts as +1 on all J[2], of rank 4. | Plus subvariety is not plus torsion eigenspace. (carried from r5) |
| 4.5 Saturation and multiplicity | D and D×C₂; M=μ₂ | Étale special orders 2 and 4; amalgam with M=μ₂ has rank 4 and étale order 2. Extra constant factor violates ambient rank-one bound. J[m₂] rank 4 matches D. | All saturation hypotheses retained. (carried from r5) |
| 4.6 Homology freeness | H=Z₂[σ], σ swapping basis | Invariant vector (1,1), quotient generator [1,0]; map gives 2. Plus/minus basis determinant −2, a nonunit in Z₂ but a unit in Z₅. | No integral dyadic eigensplitting. (carried from r5) |
| 4.7 Normalized winding | a=3 in preceding model; P=17 square root 6 of 2 | Canonical image 6e, normalized image 3e. In cyclic F₁₇× with generator 3, log(6)=15 and log(−6)=7; both are 3 mod 4, an odd generator. | Square-root sign independent in U of order 4. (carried from r5) |
| 4.8 Winding/index | Local models at (P,ℓ)=(11,5),(17,2),(41,2),(41,5) | Congruence quotient orders 5,4,2,5. Multiplication by 2 on Z₂ has cokernel order 2; the normalized rank-one map has cokernel order 1. | Do not use unrescaled coinvariant map. (carried from r5) |
| 5.1 Quotient torsion support | P=11,n=5; P=13,n=1; zero quotient | Allowed torsion prime sets {5},∅,∅; order of torsion of zero quotient is 1. No surjectivity on rational lifts is needed. | Retain arbitrary abelian quotients. (carried from r5) |
| 5.2 Ogg rational torsion | P=11,17,13 | C-orders and predicted torsion orders agree at 5,4,1. Removing the 2-primary part at 17 changes order 4 to 1. | Full statement retained. (carried from r5) |
| 5.3 Maximal μ-type | Σ=μ₅ at 11; adding μ₅ | Constant Cartier dual ranks 5 and 25; hypothetical enlargement has complementary rank 5 and would exceed the rank-5 multiplicative half of J[5]. A nonconstant dual is outside μ-type. | Integral/type hypothesis retained. (carried from r5) |
| 5.4 Torsion comparison | P=11,17,13 | Marked cusp orders across both quotients 5→5→5, 4→4→4, 1→1→1. At 13 dimension 0 is permitted; order >1 forces positive dimension elsewhere. | Actual maps, not isogeny-class surrogates. (carried from r5) |
| 6.1 Uniform cohomology bound | Local rank d=1, m=1,2; zero group | Generic lengths 2m and toric special lengths m give δ=m; ordinary étale lengths α=m; δ−α=0 in both cases. Zero group gives 0−0=0. Bounded h⁰ then bounds h¹ independently of m. | Quantifier order and geometric points retained. (carried from r5) |
| 6.2 Completed finiteness | Test M=C₅ versus Z at ℓ=5 | Z₅⊗C₅=C₅ (five elements); Z/5ᵐ has 5,25,125 elements for m=1,2,3, contradicting a fixed bound for a free summand. Identity transition on C₅ gives direct limit of order 5; zero transitions give order 1. | Bound does not assume transition injectivity. (carried from r5) |
| 6.3 Quotient rank zero | Product support with rational ranks (1,0), retain second factor | Original rational rank 1; retained quotient rank 0 and finite generated torsion. The rational vector-space projection Q⊕0→0 is exact; this says nothing about untensored rational-point surjectivity. | Retain exactness only after tensoring. (carried from r5) |
| 6.4 Rational quotient points | P=17,13,37 | C and A_Eis(Q) have orders 4=4,1=1,3=3. Level 37 can retain a positive-rank factor in J outside the Eisenstein quotient without changing 3. | Quotient, not whole Jacobian rank zero. (carried from r5) |
| 6.5 Odd Sha | Multiplication by 2 or 3 on Z/9 | [2] has kernel order 1 but group order 9; [3] has kernel order 3 and [3]²=0. Injective plus nilpotent forces order 1, while either condition alone does not. | Odd hypothesis; dyadic finiteness only. (carried from r5) |
| 6.6 Curve finiteness | P=11 and P=13 | At 11 the nonconstant genus-one Abel–Jacobi map has fibres of degree 1 and target rational group order 5. At 13 A=0 and X₀(13)≅P¹ has infinitely many rational points, so the excluded case would fail. | Positive-genus condition essential. (carried from r5) |
| 7.1 Cusp models | μ_P on a 1-gon; component generator on P-gon | Component images 0 and 1 mod P; forgetful widths 1 and P; labels ∞ and 0. At P=11 these are 1 versus 11, although both are cusps. | Fixed forgetful direction retained. (carried from r5) |
| 7.2 Tate valuations | P=11, v(q)=11 | μ₁₁ quotient gives v(j): −11→−121; component quotient gives −11→−1. Both inputs/outputs are negative. | Sign of v(j) alone cannot label cusp. (carried from r5) |
| 7.3 Relative semistable bound | δ=0,2,3,4,6,8,9,10 | 12/gcd(δ,12)=1,6,4,3,2,3,4,6. For base ramification 2 and relative 6, absolute index is 12, not 6. | Relative/absolute bounds distinguished. (carried from r5) |
| 7.3 Rational large-prime consequence | P=11 over Q₁₁; additive component bound | e≤6<10=P−1. Additive geometric component orders at most 4 and additive residue groups at q≠P have no P-torsion; neither can contain an order-11 point. | Includes eleven, no good-prime restriction. (carried from r5) |
| 7.4 Reduction at 2 and 3 | P=11; good and multiplicative fibres | Hasse upper integer bounds 5 and 7, both <11; torus orders q−1 or q+1 are 1/3 and 2/4. At q=P they are P−1/P+1, neither divisible by P. | Use prime-to-2 injection only where warranted. (carried from r5) |
| 7.5 Global component escape | P=11,n=5; P=17,n=4 | In C₅ or C₄, f(0)−f(∞)=1 has orders 5 or 4, not 1. Hypothetical reduction to 0 at 3 and ∞ at another odd good place forces 1=0. At P=13 n=1 would give no contradiction. | Labels and positive genus essential. (carried from r5) |
| 7.6 Division character | Matrices diag(1,2), U(b) over F₅ | gU(b)g⁻¹=U(3b), not U(2b). If unipotent subgroup is zero, extension degree [L:K]=1; otherwise it is 5 in this model. K has no real places. | Inverse character and normality retained. (carried from r5) |
| 7.7 Class obstruction | P=5,j=3; P=11,j=9; P=3 excluded from this formula | P−j=2; B₂ numerator 1 and denominator 6 give nonzero residues 1 and 2 respectively. At 3 denominator is not a unit. Vanishing selected quotient gives degree 1, not class number 1 for all cyclotomic fields. | Retain eigenspace-specific input. (carried from r5) |
| 7.8 Isogeny chain / Lean isogeny_iteration | P=11, initial pole order 11; nonsplit component action | Pole orders 11,121,1331 are distinct. In Z/11, fixed components under −1 solve 2x=0 and give only x=0. A rational component of order 11 therefore forces the split direction. | Strict growth and all five excluded genus-zero levels retained. (carried from r5) |
| 7.9 Formal immersion domain | N=11, fibre I₅; zero quotient; N=1 | Five proper rational components cannot map nonconstantly to G_m; their punctured smooth parts can. A zero target has cotangent dimension 0 against cusp dimension 1, so it is excluded. N=1 has no nonzero new quotient. | Domain is X^sm, not entire proper model. (carried from r5) |
| 7.9 General cuspidal torsion | N=1,4,11,15 | Degree-zero cusp ranks 0,2,1,3. At 4 genus 1+6/12−3/2=0 and unit vector (−3,0,3). At 11 vector (−10,10) kills a cusp class of exact order 5. At 15 the three displayed vectors have nonzero minor −1536 and all sums 0. | General theorem does not rely on squarefree example. (carried from r5) |
| 7.9 Rational splitting and descent | T(x,y)=(y,2y) on Q²; degree-2 norm | e=1−T/2 fixes (1,0) and sends (0,1) to (−1/2,0); e²=e, but e is not integral. Norm after pullback gives 2D; if 3f*D=0 then 6D=0. | Clear denominators; no integral splitting. (carried from r5) |
| 7.9 Integral Atkin–Lehner transport | N=15 at q=3; exact divisors 1,3,5,15 | Four cusps with widths 15,5,3,1; toggling the prime-divisor labels is transitive. d=1 leaves every label unchanged; d=15 exchanges widths 15 and 1. | Retain bad-prime model comparison and torsion translation. (carried from r5) |
| 7.9 Reduction/logarithm boundary | q=3,e=1; q=2,e=1; Q₃(ζ₃),e=2 | Bounds 1<2 true, 1<1 false, 2<2 false. In last case ζ₃−1≠0 has formal order 3. For a Tate curve, 1+3Z₃ is torsion-free despite bad reduction. | Strict inequality, smooth group, squarefree corollary retained. (carried from r5) |
| 8.1 Model and inverse | x=1, y²+3y−2=0 | Coefficients (3/2−y/4,1−3y/2,1−3y/2); Δ=(−41129070+73241675y)/2048≠0. Inverse gives x=1,y=y. Multiples 1,…,12 are affine; 12Q=(0,−1+3y/2), 13Q=O. | Moduli map tested beyond genus. (carried from r5) |
| 8.1 Principal divisors | y=−1 and y=x; five relation vectors | Substitution gives −x(x+1)² and x³(x+1). Relation determinant −19; vector (1,14,3,12,15) annihilates all five relations mod 19. Multiplicities 2 at B₀′ and 3 at A are necessary. | Retain marked cusp identities. (carried from r5) |
| 8.1 Point counts and torsion | F₂,F₄,F₃,F₉ | Affine counts by x: (2,2), (2,0,2,0), (2,0,2), (2,0,0,2,0,0,2,0,0). Add two infinity points: 6,6,6,8. Jacobian orders (36+6)/2−2=19 and (36+8)/2−3=19. Sextic discriminant −692224=−2¹²·13². | Two prime-to-residue injections bound all torsion. (carried from r5) |
| 8.1 Geometric intersection | All 21 unordered pairs in {0,1,3,12,14,15} mod 19 | Each residue appears once except 15, which appears three times: 1+14=3+12=0+15. Thus 21−2=19 distinct classes; canonical conjugate of V is U. | Degree-two uniqueness excludes extra geometric points. (carried from r5) |
| 8.2 Diamond order and norm | γ²=γ−1; residues 8,12 mod 19 | γ³=−1, γ⁶=1; (3+2γ)(5−2γ)=19. Roots satisfy 8²−8+1=57 and 12²−12+1=133, both 0 mod 19. Dimensions 2+2=4, ranks 361·361=19⁴. | Correct polynomial, factor labels and dimensions. (carried from r5) |
| 8.3 Kernel constituents | Local field Q₁₃; two norm-19 factors | rank F=19²=361, sub/quotient ranks 19 each. gcd(19,13−1)=1, so μ₁₉(Q₁₃) has order 1. Nontrivial order-six inertia has no nonzero fixed vector; hence F(Q₁₃) has order 1, not rank 1. | Geometric rank distinguished from local points. (carried from r5) |
| 8.4 Local surjectivity | Formal pro-13 group; finite quotient | 19≡6 mod 13 is a unit and πbar/19 is a formal inverse. A zero kernel on a finite group of size h gives image size h. By contrast [19]:Z→Z has zero kernel but cokernel order 19. | Compact/formal/finite steps all retained. (carried from r5) |
| 8.5 Cyclotomic class number | Degree 12, six complex places | Signed discriminant (+1)13¹¹. Minkowski value approximately 306.415804; stated rational upper bound approximately 306.801038<307. Residue degrees at 2,3,5,7,11,17 are 12,3,4,12,12,6. Only possible small prime-ideal norms: 13,27,53,79,131,157. | Exact finite norm proof, not a regular-prime assumption. (carried from r5) |
| 8.5 Norm witnesses | Six elements in displayed order | Determinants of multiplication are exactly 13,27,53,79,131,157. Norm 27 is minimal 3³, so one prime ideal, with four conjugates because 12/3=4. Norm 13 is ramified, not split. | Every small prime ideal principal; h=1. (carried from r5) |
| 8.5 Cohomology/localization | Units ±13^Z; degree-12 cover; coefficient 19 | −1=(−1)¹⁹; unit quotient Z/19 generated by 13; valuation sends it to 1 mod 19. gcd(12,19)=1 and 12⁻¹=8 mod 19. Residue-unit order 12 has no 19 quotient. | Localization kernel 0; no misuse of admissible-group bound. (carried from r5) |
| 8.6 Rank zero and order-13 exclusion | Free O-rank d=0,1,2; cusp torsion | O^d/πO^d has sizes 1,19,361. Surjectivity permits only d=0. On T₁₉, choose γ=12 so πbar=0 and π=8 is a unit: π-surjectivity is consistent with nonzero torsion of order 19. | Rank zero gives B(Q)=C₁₉, then six cusps only. (carried from r5) |
| 8.7 Four occurring primes | Displayed Weierstrass models for 2,3,5,7 | Discriminants 64,−27,−11,−1664, all nonzero. Exact point orders 2,3,5,7 from successive addition; explicit multiples recorded below. | All existential witnesses are elliptic. (carried from r5) |
| 8.8 Classification | Four actual witnesses; excluded P=11,13; identity | Actual prime orders are 2,3,5,7; the order exclusions cover 11 and 13 by different arguments. Identity order 1 fails hOrder for every prime. Composite order 4 is outside the prime quantifier. | Lean matches prime-only conclusion. (carried from r5) |
| 8.9 Fixed-vector consequence | Nonzero vector of C₇; identity in E[11]; stable nontrivial character line | C₇ rational vector is fixed but 7<7 is false. Identity in E[11] is fixed and equals 0. On F₁₁ with nontrivial scalar 2, fixed vectors solve (2−1)v=0, giving v=0 although the line is stable. | Fixed vector is not stable line; no irreducibility overclaim. (carried from r5) |

### Seeded sample and ownership

None of the 15 seeded targets (0.1, 1.5, 2.4, 3.5, 4.1, 4.5, 5.2, 6.6, 7.2, 7.4, 7.6, 7.7, 8.3, 8.7, 8.8) falls in the changed passages, so under the incremental scope I did not reopen their sources. Their computed rows carry forward above. The previous report's source audit, at the printed locators, covers 0.1 and 1.5 among them. The README flags no locator as unverified.

I checked ownership of the changed passages' objects against main and the supplied open heads: the Manin–Drinfeld theorem, the rational pairing, the integral differential lattice, the corrected E₂, integral symbols, the Hecke algebra and coefficient fields. Each has one owner once R02 is applied: this roadmap §7.9, ModularCurvesPartII §§7.5–7.6 and §§13.7–13.9, and the pinned Tau Ceti for the rest. `overlaps.md` lists no dropped id. The renamed ModularForms Layer 8 in R02 is a heading rename that the tool does not report; I found it by reading the revision.

## Not verifiable

- **Sources.** This incremental round reopened no source text. The two limitations of the previous report stand unchanged: FaltingsChai1990, III §7, Theorem 7.1 and Corollaries 7.2–7.4, pp. 76–77, is a settled uncertified (paywalled) citation; and only the 1973 IAS scan of DeligneRapoport1973 was read, not collated with the 1986 printing.
- **Lake build of the repaired file.** The brief allows the targeted build only on the worktree, which I must not edit. So R01's repair was checked by elaborating a scratch copy and by comparison with the module-form files on main, not by a Lake build of the copy.
- **Four of the R02 Tau Ceti modules** (`WeightTwo/Basic`, `HeckeSlash/Finite`, `Period/Injective`, `Period/Hecke`) and the Degree/Chebotarev modules of R03 have no built object files at the pin. `TauCeti.CoefficientField` was also checked only in the source. Building them is outside the commands the brief allows, so these declarations were checked in the pinned source by namespace, file and line, not by `#check`.

## Source issues

- none
