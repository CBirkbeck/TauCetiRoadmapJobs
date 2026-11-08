# Review of EisensteinIdealAndRationalTorsion (pull request #1264 at e49787c)

**Verdict:** accepted

This is an incremental re-review of the 84 changed lines since 65d9398. The pins are unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.

The diff makes three changes:
- It states Mazur's index `T/I ≅ ℤ/n` in `Suggested.lean` as `eisenstein_index`, with the definition `eisensteinIdeal` that it needs.
- It describes the pinned single-double-coset operators correctly and adds the `Γ₀(N)` Hecke-ring contract.
- It attributes the cusp constant terms to the unnormalized `charG2MF`.

All three previous findings are repaired, and the repairs introduce no new problem. The gate passes with the targeted build. No finding remains.

No findings.

## Previous findings

- R01 — repaired: `Suggested.lean:50–67` declares `eisensteinIdeal` and `eisenstein_index`. It states that every Hecke-ring element is congruent to an integer and that the integers in the ideal are `nℤ`. The docstring (lines 18–20) now names only integral Hecke duality as not statable.
- R02 — repaired: README:41 now reads “These single-double-coset operators (…) are the classical `T_r` unless `p²|r` for a prime `p∤N`; at `r=p²` the operator is the classical `T_{p²}` minus `p^{k−2}⟨p⟩`.” README:43 adds the `Γ₀(N)` action, and §0.4 *Needs:* (line 258) names it.
- R03 — repaired: README:39 now reads “The constant terms at the other cusps are computed for the unnormalized series `TauCeti.EisensteinSeries.charG2MF` …” and gives the scale through `normalizedCharG2MF_def`. The §4.2 *Needs:* line (666) adds `charG2MF` and `normalizedCharG2MF_def`.

## Verified sound

**Gate.** I ran the gate at this head with `--build`. Every scanner is at zero, and the output ends `build=0 OK`. The worktree is clean, and no file outside the folder changed: the `git diff --stat` excluding the folder is empty. The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.

**Dependency check.**

```text
depcheck: 245 roadmaps, 2474 edges, 0 problem(s)
```

The output has no UPWARD, CYCLE or moved line. The diff adds no roadmap supplier. Its new suppliers are pinned Tau Ceti declarations, plus ModularCurvesPartII §§13.2–13.3, which were already suppliers of §§0.2–0.4.

**Elaboration.**
- `lake env lean` on `Suggested.lean` exits 0 with seven `sorry` warnings and nothing else. The seven are the six existing theorems plus `eisenstein_index`.
- I ran `#check @eisensteinIdeal` and `#check @eisenstein_index` in a scratch copy. The types are identical to `signatures.md`, and both carry `[NeZero P]`. `eisenstein_index` also carries `P.Prime`, matching README §0.4's “for every prime `P`”. Nothing depends on a section variable.
- Padding probe on `eisenstein_index`: `simp`, `rfl`, `norm_num`, `aesop` and `simp [eisensteinIdeal]` all fail. The six untouched theorems keep the 30 failed probes recorded in the previous report.
- Two sanity probes elaborate. First, `heckeTCompositeGamma0 P P - 1 ∈ eisensteinIdeal P`, from the span at `l=P`. Second, `heckeRingHomCuspCharSpace (N := P) 2 1 (heckeTScalarGamma0 P l) = 1` for `0<l` coprime to `P`, which follows from `heckeRingHomCuspCharSpace_heckeTScalarGamma0`.
- The pinned Hecke ring has only a `Ring` instance; commutativity is a theorem (`Composite.lean` module docstring). So `Ideal.span … ⊔ RingHom.ker …` is the left ideal generated. The ring is commutative, so this is the two-sided ideal that README §0.4 describes.

**Library declarations opened at the pins (Tau Ceti `2fd255d9`), namespace and line checked; these are all the names the diff adds:**
- `HeckeRing.GL2.Delta0` (`HeckeRing/GL2/Delta0.lean:76`): integral matrices with positive determinant, `N∣c`, and `a` a unit mod `N`.
- `heckeTGeneratorGamma0` (`Gamma0/Diagonal/PrimePower.lean:93`), the double coset of `diag(1,p)`, and `heckeTGeneratorRecGamma0` (`:178`), the recurrence `T_{r+2}=T_p·T_{r+1}−p·S_p·T_r`.
- `heckeTCompositeGamma0` (`Gamma0/Diagonal/Composite.lean:118`), with `_prime` (`:168`), `_prime_pow` (`:156`) and `_prime_pow_of_not_coprime` (`:176`), which gives `T_p^v` at bad primes.
- `heckeRingHomCuspCharSpace` (`ModularForms/HeckeSlash/Nebentypus/Action.lean:393`): a ring hom `𝕋(Δ₀(N),Γ₀(N)) ℤ →+* End_ℂ(cuspFormCharSpace k χ)`, with `χ : (ZMod N)ˣ →* ℂˣ`.
- `qExpansion_coeff_heckeRingHomCuspCharSpace_heckeTCompositeGamma0` (`Nebentypus/CoefficientFormula.lean:114`): `a_m(T_n F)=Σ_{d∣(m,n)} χ(d)d^{k−1}a_{mn/d²}(F)`. This is the classical normalization.
- `heckeRingHomCuspCharSpace_heckeTScalarGamma0` (`Nebentypus/Scalar.lean:171`, elaborated): the scalar coset acts by `χ(c)c^{k−2}`.
- `cuspFormCharSpace` (`ModularForms/DiamondOperators.lean:291`): the joint eigenspace of the diamond operators.
- `heckeTCuspNat` (`HeckeSlash/Operators.lean:104`, namespace `HeckeRing.GL2`). Its module docstring (lines 19–23) gives the `p^{k−2}⟨p⟩` discrepancy at `p²`.
- `commute_heckeTCuspNat_diamondOpCusp` (`HeckeSlash/Diamond.lean:293`), which supports README:45's restriction sentence.
- `TauCeti.heckeTCuspAlgebra` (`HeckeSlash/Finite.lean:51`): `Algebra.adjoin ℤ` of `heckeTCuspNat` at positive indices.
- `charG2MF` (`EisensteinSeries/WeightTwo/Character.lean:96`).
- `constantTermAt_charG2MF` (`WeightTwo/ConstantTerm.lean:134`), with hypotheses `u*v∣N` and `ψ≠1 ∨ φ≠1`, as README:39 says.
- `normalizedCharG2MF` and `normalizedCharG2MF_def` (`WeightTwo/Normalized.lean:75,81`): the scale `(−8π²/v²·g(φ⁻¹))⁻¹`.
- No `eisensteinIdeal` or Eisenstein-ideal object exists in Mathlib or Tau Ceti at the pins (grep, 0 hits).

**Cross-roadmap citations resolved (5).**
- ModularCurvesPartII §13.3 at its open head (README line 3330). `modularEisensteinIdeal` (line 3338) is generated by `T_q−(1+q)`, `U_q−1` (`q∣N`) and trivial-diamond relations. At level `P` these are `eisensteinIdeal`'s generators, and the diamond relations lie in its kernel term. So README:237's claim holds.
- ModularCurvesPartII §13.2 (line 3287): the Hecke correspondences and `heckeJacobian_cotangent`.
- ModularCurvesPartII §7.5 `analyticFullHeckeAlgebra` (line 2379) is a complex-algebra image. It has no integral ideal, so it is not a second owner of `T/I`.
- The worker's two “found nowhere” leads both resolve:
  - `ContinuousRep.iso_of_charpoly_eq` is at `TauCetiRoadmap/ArithmeticGaloisRepresentations/Suggested.lean:88` at its open head, §1.8.
  - `NonabelianH1.equivSheafH` is SchemeAndStackFoundations §2.3 on main (README lines 3330, 3344).
- `overlaps.md` reports no other pull request changing this roadmap and no dropped id.

**Ownership.** No other open roadmap or library defines an integral Eisenstein ideal on the `Γ₀(P)` Hecke ring. `roadmaps grep` for `eisensteinIdeal` in Lean files finds only this roadmap. The prose hits name non-Eisenstein ideals or cite Mazur. The Lean name `TauCetiRoadmap.EisensteinIdealAndRationalTorsion.eisensteinIdeal` clashes with no declaration in a readable roadmap.

**Sources (Mazur1977, the cached Numdam text; printed page = PDF page + 31).**
- The definition of `T` is on printed p. 90 (Mazur1977 lines 2446–2447): generated by `T_l` (`l≠N`) and `w`.
- The definition of `I` is on p. 95 (lines 2656–2657): generated by `1+l−T_l` (`l≠N`) and `1+w`.
- Proposition 9.3 is on p. 94 (line 2616), 9.4 on p. 95 (line 2636), and 9.7 on p. 96 (line 2673).
- §6 runs from p. 87 (line 2350) to p. 90, and §7 starts on p. 91 (line 2481).
- So §0.4's “definition of `T`, p. 90, the definition of `I`, p. 95 … pp. 87–90, 94–96” and both Lean docstring locators (“II §6, p. 90, and §9, p. 95”; “II Proposition 9.7, p. 96”) are exact.
- Mazur's surjectivity argument for `ℤ→T/I` (line 2674) is the one README:240 restates.

**Seeded sample.** None of the 15 seeded targets (§§0.3, 1.6, 2.1, 2.3, 4.3–4.5, 5.4, 6.1, 7.3, 7.6, 8.5–8.8) is a changed passage, and none cites one. §0.3 cites the `correctedE2` contract sentence, which is unchanged. §§1.x, 2.2 and 2.4 cite §0.4 (lines 309, 468, 509), whose statement `T/I ≅ ℤ/n` is unchanged. Their computed rows carry forward below. The README flags no locator as unverified.

### Adversarial table

The rows below cover every statement the diff adds or changes.

| Statement | Instances tried | Values computed on both sides; wrong-model control | Result / change |
| --- | --- | --- | --- |
| `eisenstein_index`, scalar kernel (Suggested.lean:62–66; README:237) | `P=2,3,5,7,13` | `S₂(Γ₀(P))=0`, so `End` is the zero ring, the kernel is the whole ring and the comap is `(1)`. `n`: `1/gcd(1,12)=1`, `2/2=1`, `4/4=1`, `6/6=1`, `12/12=1`. | Holds. |
| same | `P=11` (curve 11a1, point counts) | `a₂,a₃,a₅,a₇,a₁₁,a₁₃=−2,−1,1,−2,1,4`. Generators act by `−5,−5,−5,−10,0,−10`; the gcd over all `l≤37` is 5. `n=10/gcd(10,12)=5`. | Holds. |
| same | `P=17` (17a1) | `a₂…a₁₃=−1,0,−2,4,0,−2`, `a₁₇=1`. Generators `−4,−4,−8,−4,−12,−16` and 0; gcd 4 over `l≤37`. `n=16/4=4`. The odd part of `n` would give `(1)`. | Holds; the dyadic part is kept. |
| same | `P=37` (37a1, 37b1) | `T={(a,b): a≡b mod 2}` (`T₂=(−2,0)`, determinant of `(−2,0),(1,1)` is −2). `w=−U₃₇=(1,−1)`. Every `T_l−1−l` for `l≤31`, and `U₃₇−1=(−2,0)`, lies in `{(x,3y): x≡y mod 2}`, which is a `T`-ideal containing `(−5,−3),(−7,−3),(2,0)`. Its integers are `3ℤ`. `n=36/12=3`. | Holds. |
| `eisenstein_index`, surjectivity conjunct | Ring generators `T(1,l)`, `T(l,l)` | `T(1,l)≡1+l` (or 1 at `l=P`) by the span. `T(l,l)`, `l∤P`, acts by `χ(l)l^{0}=1` (probe elaborates `=1`), so `T(l,l)−1` lies in the kernel. Mazur's proof uses the same step (line 2674). | Holds. |
| `eisensteinIdeal`: wrong models | Drop the kernel term; `U_P+1` for `U_P−1` | The Eisenstein line `correctedE2 P` gives a character `R→ℤ`: `T_l↦1+l`, `U_P↦1` (since `Σ_{d∣rP,P∤d}d=Σ_{d∣r,P∤d}d`), `T(l,l)↦1`. It kills the generators, so without the kernel the integers are 0 (at `P=2`: 0 against `ℤ`). With `U_P+1` at `P=11`: the generator acts by 2, `gcd(2,5)=1`, so the integers are all of `ℤ`. | Both excluded by the Checks at README:251–252. |
| Action normalization (README:43) | `k=2`, `m=1`; `l=P` | Coefficient formula: `a₁(T_l f)=a_l(f)` (on 11a, `T₂↦−2=a₂`). At `l=P`, `χ(P)=0` for trivial `χ`, so `a_m(U_P f)=a_{mP}(f)`. | Classical. |
| `Δ₀(N)` carrier and `U_P` orientation (README:43) | `diag(1,P)`, `diag(P,1)` | Upper-left entries 1 (a unit mod `P`) and `P` (not a unit). Only `diag(1,P)∈Δ₀(P)`, so `U_P=Γ₀diag(1,P)Γ₀`. | Correct. |
| `heckeTCompositeGamma0` is classical `T_r` (README:43) | `r=l`, `r=P`, `r=4` at `N=11` | Prime: the generator `diag(1,l)`. Bad prime power: `U_P^v`. `r=4`: `T₂²−2·S₂ ↦ 4−2=2=a₄`. | Correct. |
| `heckeTCuspNat` at `p²` (README:41, Check 53) | `N=11`, `r=4` | Single coset `=T₄−2⁰⟨2⟩=T₂²−3`, eigenvalue 1; classical `T₄` has eigenvalue 2. At `r=2,3,11` the two families agree. | Correct (R02). |
| Scalar coset (README:43, Check 54) | `k=2,χ=1`; `k=4` | `χ(l)l^{k−2}=1`; at `k=4`, `l=2`: `4=l²`. | Correct. |
| Image is `T`; `T` finite (README:45) | `P=11`, `P=37` | The image is generated by `T_l`, `U_P` and `T(l,l)↦1`. Mazur's `T` is `ℤ[T_l (l≠P), w]` (line 2446), with `U_P=−w`. At 37 the image is `{a≡b mod 2}`, of rank `2=g`. Restriction from `heckeTCuspAlgebra P 2` contains `T`, which is finite since `ℤ` is Noetherian. | Correct. |
| `constantTermAt_charG2MF` contract (README:39; R03) | `P=17`, `ψ=1`, `φ=χ`, `c=0`, `a=1` | Raw `Σ_{m≠0}χ(m)m⁻²=2.2529230` (2·10⁶ terms). Scale `−8π²√17/289=−1.126462`; quotient `−1.9999999`, against `−B₂,χ/4=−8/4=−2`. Hypothesis `ψ≠1∨φ≠1` matches. | Correct. |
| Check at README:52 | Same | `2.25292` and `−2.0000` as computed. Reading the raw value as the normalized constant term gives `2.25292≠−2`. | Correct. |
| Module docstring: `H¹(X₀(P)/ℤ,O)` not statable (Suggested.lean:18–20) | Pinned `TauCeti/AlgebraicGeometry/ModularCurve/` | The pin has the moduli problem `[Γ₀(N)]` (`Gamma/Zero.lean`) and fine `Y₁(N)`, `N≥4`, over bases where `N` is invertible (`YOne.lean`). It has no compactified integral `X₀(P)` and no coherent `H¹` of it. | Accurate. |
| §0.4 source line and Lean locators | Mazur1977 | p. 90 (line 2446), p. 95 (line 2656), p. 94 (line 2616), p. 95 (line 2636), p. 96 (line 2673); §6 pp. 87–90. | Exact. |
| README:237 versus ModularCurvesPartII §13.3 | Open head, line 3338 | Generators at `N=P`: `T_l−1−l`, `U_P−1`, `S_l−1`; the last is in the kernel term. 3 of 3 agree. | Correct. |
| README:167 list | `Suggested.lean` | 8 names listed against 8 declarations (`eisensteinIdeal` and 7 theorems), each with its section. | Correct. |
| *Needs:* lines 258 and 666 | Every name | 13 Tau Ceti names resolve: 9 opened this round at the files and lines above, 4 (`heckeTCuspAlgebra_finite`, `CoefficientField`, `numberField_CoefficientField`, `qExpansion_normalizedCharG2MF_coeff_zero`) opened in the previous round at the same pin. | Correct. |

Rows carried forward from the previous report for statements the diff leaves untouched. The six untouched Lean theorems were re-elaborated at this head; their types are unchanged.

| Statement | Instances tried | Values computed on both sides; wrong-model control | Result / change |
| --- | --- | --- | --- |
| README:49 Check: `correctedE2 11` coefficients | `r=0,1,2,11,22` | From `qExpansion_coeff_correctedE2`: `−10, −24, −72, −24(12−11)=−24, −24(36−33)=−72`. Divided by −24: `5/12; 1,3,1,3`. `Σ_{d∣r,11∤d}d` gives `1,3,1,3`. Without the `t·σ₁(r/t)` term: `12` and `36`. | Correct. (carried from r7) |
| README:50 Check: cusp constant terms | `t=11`, `c=0,1`; `t=1` | `1−gcd(c,t)²/t`: at `c=0`, `1−121/11=−10=1−t`; at `c=1`, `1−1/11`. Times the widths 1 and 11: `−10` and `10`, sum 0 (Mazur Sublemma `Res₀=N·Res∞`, line 2332). At `t=1`: `0` and `0`. | Correct. (carried from r7) |
| README:51 Check: `B₂,χ` and the pair order | `P=17,41,73`; `(ψ,φ)=(1,χ)` and `(χ,1)` | `B₂,χ`: 17 → `(816−680)/17=8`; 41 → 32; 73 → 88 (exact rationals). Constant terms `−B/4`: `−2,−8,−22`, equal to `−r` of §4.2 (line 623 `r=B₂,χ/4`). With `u=17`, `ψ(0)=0`, so the constant term at `∞` is 0. | Correct. (carried from r7) |
| §0.3 route sentence (README:225) | `P=11`; Mazur (5.13) | Constant term `(1−11)/(−24)=5/12=(P−1)/24`. The `qʳ` coefficients equal `δ_P`'s (row above). Mazur gives `−e′=(N−1)+24δ`. | Correct. (carried from r7) |
| README:45: coefficient fields (sentence moved, wording unchanged) | Levels 11 and 23 | Level 11: coefficients in `ℤ`, field `ℚ` (degree 1). Level 23: `ℚ(√5)` (degree 2). Both number fields, with `2≤k` required. | Correct. (carried from r7) |
| README:9: owner of `q`-expansions | Mathlib pin | `UpperHalfPlane.qExpansion` at `QExpansion.lean:172`. Owners: Mathlib 1, ModularForms 0. | Correct. (carried from r7) |
| README:66: ModularForms Layer 10C | Main and the #1706 head | Lines 1119 and 1247: section spaces identified with `M_k` and `S_k` in both (2 of 2). | Correct. (carried from r7) |
| `isogeny_iteration` | `P=11` (allowed), `P=13` (excluded) | Type unchanged; `P≠13` is required because genus 0 is handled by Layer 8. 5 probes fail. | Retain. (carried from r7) |
| `cyclotomic_thirteen_class_number` | Degree 12 | `classNumber (CyclotomicField 13 ℚ) = 1`; 5 probes fail. | Retain. (carried from r7) |
| `order_thirteen_exclusion` | Identity; infinite order | `addOrderOf` is 1 and 0, never 13. 5 probes fail. | Retain. (carried from r7) |
| `occurring_small_primes` | Four witness models of r5 | Discriminants `64, −27, −11, −1664` are nonzero. `IsElliptic` sits inside the existential. 5 probes fail. | Retain. (carried from r7) |
| `all_prime_torsion` | `P=4`, `P=11` | 4 is not prime; 11 is excluded by `isogeny_iteration`, 13 by `order_thirteen_exclusion`. 5 probes fail. | Retain. (carried from r7) |
| `elliptic_fixed_torsion_zero` | `P=7` (excluded); `P=11` with scalar 2 | `7<7` is false. On `F₁₁`, `(2−1)v=0` forces `v=0`. Action is `torsionGaloisAction` over `AlgebraicClosure ℚ`. 5 probes fail. | Retain. (carried from r7) |
| README:13: Manin–Drinfeld direction (unchanged) | EllipticCurveModularityPartII | Carried from r6: 0 supplier citations of the consumer; depcheck 0 problems at this head. | Retain. (carried from r7) |

Rows carried forward from earlier rounds. They cover the seeded targets 0.3, 1.6, 2.1, 2.3, 4.3, 4.4, 4.5, 5.4, 6.1, 7.3, 7.6, 8.5, 8.6, 8.7 and 8.8.

| Statement | Instances tried | Values computed on both sides; wrong-model control | Result / change |
| --- | --- | --- | --- |
| Conventions: distinct primes and full index | P=2,3,5,7,11,13,17,19,37,41,73 | (P−1)/gcd(P−1,12) gives 1,1,1,1,5,1,4,3,3,10,6 respectively. In every case gcd(P,n)=1. At P=17 deleting the dyadic part changes 4 to 1. | Retain full index. (carried from r7; computed in r5) |
| Conventions: actual groups and order | Identity; infinite-order element; cyclic C₅ | addOrderOf values 1,0,5. Thus neither the identity nor infinite-order junk value satisfies a prime-order hypothesis. S₃ is not an abelian-variety point group; its order-2 elements cannot be substituted into the elliptic statements. | Native abelian carrier and ellipticity retained. (carried from r7; computed in r5) |
| Integral differential contract | Genus zero; node in characteristic 2; P=5 in characteristic 2 | H⁰(ω)=H¹(O)=0 in genus zero. Node residues (1,1) have sum 0 in F₂. In the exceptional noncuspidal comparison dim(A/B)=1, while A⁰=B⁰=0. | No inversion of 2 or blanket A=B. (carried from r7; computed in r5) |
| Connected Néron Kummer contract | Tate curve, m=2; additive fibre in characteristic 2 | Generic 2-kernel rank 4, connected special kernel rank 2; [2] on G_a is 0 and cannot surject onto G_a. | Quasi-finite kernel and semistability are necessary. (carried from r7; computed in r5) |
| Component-defect contract | z↦z² on E_q→E_(q²), v(q)=3 | Z/3→Z/6 sends 0,1,2 to 0,2,4; cokernel has order 2. Replacing full by connected sheaves would erase this nonzero term. | Retain component term. (carried from r7; computed in r5) |
| Cotangent/logarithm contract | Split B=A×C, dimensions 1 and 2; multiplication by q on a lattice; e=1,q=2,3 | Cotangent ranks 2→3→1 are exact. Multiplication by q becomes 0 modulo q. Strict bounds read 1<1 (false), 1<2 (true). | Connected-kernel quotient and strict inequality retained. (carried from r7; computed in r5) |
| Admissible-group contract | Zero; constant Z/ℓ; μ₂; extension by zero at P | (δ,α,h⁰,h¹)=(0,0,0,0),(0,1,1,0),(0,0,1,1). The inequality gives 0≤0, −1≤−1, 0≤0. Removing the P-fibre changes δ from 0 to 1 for the same generic constant group. | Marked integral model retained. (carried from r7; computed in r5) |
| Rank-one and dyadic contract | k=F_(ℓ²); M=μ₂ or μ₄ | k-rank 1 has geometric rank ℓ². Amalgam ranks are 2·2=4 and 2·4=8, not 4 and 16. D has generic rank 4 and étale special order 2. | No generic-constancy shortcut. (carried from r7; computed in r5) |
| Cyclotomic-character contract | P=5; action 2 mod 5 and its lift 7 mod 25; P=3 | Inverse actions 3 and 18; 7⁴=1 mod 25 and gcd(7−18,25)=1. A Z/25 module with action 18 has full inverse quotient; action 7 has zero inverse quotient. B₂=1/6 is a unit at 5 but not at 3. | Keep inverse action and separate exponent-one case. (carried from r7; computed in r5) |
| 0.1 Index definition and API | P=2,11,13,17; nonprime 1 excluded | P−1=n·gcd: 1=1·1, 10=5·2, 12=1·12, 16=4·4. At input 1 the natural formula is 0/12=0, so primality is essential for positivity. | Retain. (carried from r7; computed in r5) |
| 0.2 Full/image ideals | T=0; P=11 with T=Z and I=(5) | Full H=Z, ε=id, kernel 0 when T=0. At 11 the cuspidal scalar kernel is 5Z and quotient Z/5. ε(1+w)=1−1=0; the degree character instead gives 2. | Full character cannot factor through cuspidal T. (carried from r7; computed in r5) |
| 0.3 Congruence iff | P=11,m=1,5,25,11; P=17,m=4,8; P=13,m=1,2 | Cusp divisibility values true,true,false,false; true,false; true,false. At 17 holomorphic modulus 8 divides (P−1)/2=8, but 8 does not divide n=4. | Both directions and different holomorphic/cusp conditions retained. (carried from r7; computed in r5) |
| 0.4 Integral Hecke index | P=2,3,13; P=11,17 | Genus-zero T=0 agrees with Z/1=0; dimensions and T-ranks at 11 and 17 are 1; scalar kernels 5Z and 4Z. A rational rank-one pairing multiplied by 2 has determinant 2, not an integral unit. | Integral duality proof cannot be replaced by rational perfection. (carried from r7; computed in r5) |
| 1.1 Cusp class | C₅ with c=1; zero Jacobian at 13 | w(c)=−1=4 mod 5, not 1. At 13 the two cusp points are distinct but their class difference is 0. | Marking/sign retained. (carried from r7; computed in r5) |
| 1.2 Hecke cusp action | P=11,l=2; P=17,l=3 | T₂(c)=3 mod 5; T₃(c)=4c=0 mod 4. U_P(c)=c whereas w(c)=−c. | Good/bad operators distinct. (carried from r7; computed in r5) |
| 1.3 Imported component group | P=11 weighted edges 2,3; P=17,13 | Weighted cycle length 2+3=5 versus unweighted 2; component orders 5,4,1. | Import supplied weighted computation. (carried from r7; computed in r5) |
| 1.4 Exact order and closure | P=11,17,13 | Upper and component lower bounds agree at 5,4,1. At P=17 the C₂ quotient of C by μ₂ has rank 2, while C has rank 4; an everywhere constant C₄ would have four geometric points in characteristic 2 instead of two. | Keep dyadic integral model. (carried from r7; computed in r5) |
| 1.5 Shimura kernel | P=11,13; base change to Q̄ and F̄₅ | Rank 5 kernel has five Q̄-points but μ₅ has one F̄₅-point; constant C₅ would have five. At 13 both cover degree and kernel rank are 1. | Cartier dual, not constant replacement. (carried from r7; computed in r5) |
| 1.6 Intersection | P=11,n=5; P=17,n=4; P=41,n=10 | Intersection ranks 1,2,2. Sum ranks 25,8,50; the false dyadic direct sum gives 16 or 100. At P the Σ specialization has rank n since n divides P−1. | Full scheme intersections retained. (carried from r7; computed in r5) |
| 1.7 Retraction | M=Z⊕C₅, x=(7,3); c=(0,1) | r(x)=(0,3), x−r(x)=(7,0); recombination gives (7,3). r(c)=c, r(7,0)=0; zero map fails r(c)=c. | Retain source and target. (carried from r7; computed in r5) |
| 2.1 Ideal torsion | J elliptic, a=(5),(1); zero J | Generic ranks 25,1,1 respectively; C at P=11 has rank 5, not 25. (10)⊂(5) reverses kernels: J[5]⊂J[10], ranks 25≤100. | Correct variance and closure. (carried from r7; computed in r5) |
| 2.2 Maximal ideals | P=11,41,13 | Sets of residual primes {5},{2,5},∅; residue fields F₅, F₂/F₅, none. In particular 13 is not an Eisenstein residual prime at level 13. | Retain. (carried from r7; computed in r5) |
| 2.3 Quotient definition | a=0,T,(5) with T=Z | γ_a=0,T,0 and A_a=J,0,J respectively. At level 11 [5]J=J, so J/IJ=0 would contradict the retained order-5 cusp. | Universal property excludes wrong quotient. (carried from r7; computed in r5) |
| 2.4 Support | T=Z×Z, a=(5)×Z; a=0,T | Completion Z₅×0 has kernel 0×Z and retains only first factor. a=0 retains both; a=T retains none. | Support direction correct. (carried from r7; computed in r5) |
| 3.1 Residual criterion | P=11,ℓ=5 or 11; P=17,ℓ=2 | m₅ exists since 5 divides 5; m₁₁ cannot since 11 does not. At Frobenius value χ₅=2, characteristic polynomial is (X−1)(X−2)=X²−3X+2. At 2 the two characters both equal 1, but special étale lengths are 1 and 0. | Retain full polynomials and distinct integral models; book limitation below. (carried from r7; computed in r5) |
| 3.2 Étale multiplicity | Ordinary elliptic local factor | T_ℓ-rank of dual étale half is 1, whole Tate module 2. For ℓ=5, C₅ has five geometric special points and μ₅ has one. | Rank-one assertion is about the half. (carried from r7; computed in r5) |
| 3.3 Good primes | (P,ℓ,l)=(11,5,2),(11,5,31),(17,2,2) | Fifth powers mod 11 are {1,10}; 1/2=3 mod 5. For 31 the half-difference is 15=0 mod 5. Fourth powers mod 17 are {1,4,13,16}; 2 is absent although 6²=2. | Good, not good, good respectively. (carried from r7; computed in r5) |
| 3.4 Existence/principality | l=2,167,277 mod 55; l=3,71,139 mod 68 | First progression has l mod 11=2, half-difference=3 mod 5. Second has l mod 17=3 and l mod 4=3. Both residue classes are coprime to the moduli. Local odd model I=5Z₅ has (5,5)=5Z₅ and Tate rank 2. | Dirichlet input has its coprimality hypotheses. (carried from r7; computed in r5) |
| 3.5 Odd kernel | P=11,ℓ=5; P=19,ℓ=3 | C_ℓ⊕Σ_ℓ ranks 5·5=25 and 3·3=9, residual dimensions 2. Dyadic P=17 intersection rank 2 prevents the same direct-sum test. | Odd restriction retained. (carried from r7; computed in r5) |
| 4.1 Winding | Lattice Z, e=1/5; free order-two group ring | 5e=1, e mod Z has order 5, reversing path gives −1/5. (1+σ) maps to 2 in coinvariants, not 1. | Orientation and factor two retained. (carried from r7; computed in r5) |
| 4.2 Quadratic unit | P=17,41,73; f↦−1/f | Exact Bernoulli sums 8,32,88 give r=2,8,22. Applying involution twice gives f; product f·v(f)=−1. At 41 the elements 4 in C₈ have order 2 and 4+4=0. | Corrected square argument retained. (carried from r7; computed in r5) |
| 4.3 Exceptional D | P=17,41; σ=[[1,1],[0,1]] over F₂ | σ²=1 but σ≠1; fixed subspace size 2 versus 4 for identity. Dyadic C+Σ ranks 8 at 17 and 2 at 41; rank-4 D cannot lie in the latter. | Both construction branches needed. (carried from r7; computed in r5) |
| 4.4 Plus separation | P=17 genus-one minus curve, w=−1 | (1+w)J=0, so D∩J_+=0, while w acts as +1 on all J[2], of rank 4. | Plus subvariety is not plus torsion eigenspace. (carried from r7; computed in r5) |
| 4.5 Saturation and multiplicity | D and D×C₂; M=μ₂ | Étale special orders 2 and 4; amalgam with M=μ₂ has rank 4 and étale order 2. Extra constant factor violates ambient rank-one bound. J[m₂] rank 4 matches D. | All saturation hypotheses retained. (carried from r7; computed in r5) |
| 4.6 Homology freeness | H=Z₂[σ], σ swapping basis | Invariant vector (1,1), quotient generator [1,0]; map gives 2. Plus/minus basis determinant −2, a nonunit in Z₂ but a unit in Z₅. | No integral dyadic eigensplitting. (carried from r7; computed in r5) |
| 4.7 Normalized winding | a=3 in preceding model; P=17 square root 6 of 2 | Canonical image 6e, normalized image 3e. In cyclic F₁₇× with generator 3, log(6)=15 and log(−6)=7; both are 3 mod 4, an odd generator. | Square-root sign independent in U of order 4. (carried from r7; computed in r5) |
| 4.8 Winding/index | Local models at (P,ℓ)=(11,5),(17,2),(41,2),(41,5) | Congruence quotient orders 5,4,2,5. Multiplication by 2 on Z₂ has cokernel order 2; the normalized rank-one map has cokernel order 1. | Do not use unrescaled coinvariant map. (carried from r7; computed in r5) |
| 5.1 Quotient torsion support | P=11,n=5; P=13,n=1; zero quotient | Allowed torsion prime sets {5},∅,∅; order of torsion of zero quotient is 1. No surjectivity on rational lifts is needed. | Retain arbitrary abelian quotients. (carried from r7; computed in r5) |
| 5.2 Ogg rational torsion | P=11,17,13 | C-orders and predicted torsion orders agree at 5,4,1. Removing the 2-primary part at 17 changes order 4 to 1. | Full statement retained. (carried from r7; computed in r5) |
| 5.3 Maximal μ-type | Σ=μ₅ at 11; adding μ₅ | Constant Cartier dual ranks 5 and 25; hypothetical enlargement has complementary rank 5 and would exceed the rank-5 multiplicative half of J[5]. A nonconstant dual is outside μ-type. | Integral/type hypothesis retained. (carried from r7; computed in r5) |
| 5.4 Torsion comparison | P=11,17,13 | Marked cusp orders across both quotients 5→5→5, 4→4→4, 1→1→1. At 13 dimension 0 is permitted; order >1 forces positive dimension elsewhere. | Actual maps, not isogeny-class surrogates. (carried from r7; computed in r5) |
| 6.1 Uniform cohomology bound | Local rank d=1, m=1,2; zero group | Generic lengths 2m and toric special lengths m give δ=m; ordinary étale lengths α=m; δ−α=0 in both cases. Zero group gives 0−0=0. Bounded h⁰ then bounds h¹ independently of m. | Quantifier order and geometric points retained. (carried from r7; computed in r5) |
| 6.2 Completed finiteness | Test M=C₅ versus Z at ℓ=5 | Z₅⊗C₅=C₅ (five elements); Z/5ᵐ has 5,25,125 elements for m=1,2,3, contradicting a fixed bound for a free summand. Identity transition on C₅ gives direct limit of order 5; zero transitions give order 1. | Bound does not assume transition injectivity. (carried from r7; computed in r5) |
| 6.3 Quotient rank zero | Product support with rational ranks (1,0), retain second factor | Original rational rank 1; retained quotient rank 0 and finite generated torsion. The rational vector-space projection Q⊕0→0 is exact; this says nothing about untensored rational-point surjectivity. | Retain exactness only after tensoring. (carried from r7; computed in r5) |
| 6.4 Rational quotient points | P=17,13,37 | C and A_Eis(Q) have orders 4=4,1=1,3=3. Level 37 can retain a positive-rank factor in J outside the Eisenstein quotient without changing 3. | Quotient, not whole Jacobian rank zero. (carried from r7; computed in r5) |
| 6.5 Odd Sha | Multiplication by 2 or 3 on Z/9 | [2] has kernel order 1 but group order 9; [3] has kernel order 3 and [3]²=0. Injective plus nilpotent forces order 1, while either condition alone does not. | Odd hypothesis; dyadic finiteness only. (carried from r7; computed in r5) |
| 6.6 Curve finiteness | P=11 and P=13 | At 11 the nonconstant genus-one Abel–Jacobi map has fibres of degree 1 and target rational group order 5. At 13 A=0 and X₀(13)≅P¹ has infinitely many rational points, so the excluded case would fail. | Positive-genus condition essential. (carried from r7; computed in r5) |
| 7.1 Cusp models | μ_P on a 1-gon; component generator on P-gon | Component images 0 and 1 mod P; forgetful widths 1 and P; labels ∞ and 0. At P=11 these are 1 versus 11, although both are cusps. | Fixed forgetful direction retained. (carried from r7; computed in r5) |
| 7.2 Tate valuations | P=11, v(q)=11 | μ₁₁ quotient gives v(j): −11→−121; component quotient gives −11→−1. Both inputs/outputs are negative. | Sign of v(j) alone cannot label cusp. (carried from r7; computed in r5) |
| 7.3 Relative semistable bound | δ=0,2,3,4,6,8,9,10 | 12/gcd(δ,12)=1,6,4,3,2,3,4,6. For base ramification 2 and relative 6, absolute index is 12, not 6. | Relative/absolute bounds distinguished. (carried from r7; computed in r5) |
| 7.3 Rational large-prime consequence | P=11 over Q₁₁; additive component bound | e≤6<10=P−1. Additive geometric component orders at most 4 and additive residue groups at q≠P have no P-torsion; neither can contain an order-11 point. | Includes eleven, no good-prime restriction. (carried from r7; computed in r5) |
| 7.4 Reduction at 2 and 3 | P=11; good and multiplicative fibres | Hasse upper integer bounds 5 and 7, both <11; torus orders q−1 or q+1 are 1/3 and 2/4. At q=P they are P−1/P+1, neither divisible by P. | Use prime-to-2 injection only where warranted. (carried from r7; computed in r5) |
| 7.5 Global component escape | P=11,n=5; P=17,n=4 | In C₅ or C₄, f(0)−f(∞)=1 has orders 5 or 4, not 1. Hypothetical reduction to 0 at 3 and ∞ at another odd good place forces 1=0. At P=13 n=1 would give no contradiction. | Labels and positive genus essential. (carried from r7; computed in r5) |
| 7.6 Division character | Matrices diag(1,2), U(b) over F₅ | gU(b)g⁻¹=U(3b), not U(2b). If unipotent subgroup is zero, extension degree [L:K]=1; otherwise it is 5 in this model. K has no real places. | Inverse character and normality retained. (carried from r7; computed in r5) |
| 7.7 Class obstruction | P=5,j=3; P=11,j=9; P=3 excluded from this formula | P−j=2; B₂ numerator 1 and denominator 6 give nonzero residues 1 and 2 respectively. At 3 denominator is not a unit. Vanishing selected quotient gives degree 1, not class number 1 for all cyclotomic fields. | Retain eigenspace-specific input. (carried from r7; computed in r5) |
| 7.8 Isogeny chain / Lean isogeny_iteration | P=11, initial pole order 11; nonsplit component action | Pole orders 11,121,1331 are distinct. In Z/11, fixed components under −1 solve 2x=0 and give only x=0. A rational component of order 11 therefore forces the split direction. | Strict growth and all five excluded genus-zero levels retained. (carried from r7; computed in r5) |
| 7.9 Formal immersion domain | N=11, fibre I₅; zero quotient; N=1 | Five proper rational components cannot map nonconstantly to G_m; their punctured smooth parts can. A zero target has cotangent dimension 0 against cusp dimension 1, so it is excluded. N=1 has no nonzero new quotient. | Domain is X^sm, not entire proper model. (carried from r7; computed in r5) |
| 7.9 General cuspidal torsion | N=1,4,11,15 | Degree-zero cusp ranks 0,2,1,3. At 4 genus 1+6/12−3/2=0 and unit vector (−3,0,3). At 11 vector (−10,10) kills a cusp class of exact order 5. At 15 the three displayed vectors have nonzero minor −1536 and all sums 0. | General theorem does not rely on squarefree example. (carried from r7; computed in r5) |
| 7.9 Rational splitting and descent | T(x,y)=(y,2y) on Q²; degree-2 norm | e=1−T/2 fixes (1,0) and sends (0,1) to (−1/2,0); e²=e, but e is not integral. Norm after pullback gives 2D; if 3f*D=0 then 6D=0. | Clear denominators; no integral splitting. (carried from r7; computed in r5) |
| 7.9 Integral Atkin–Lehner transport | N=15 at q=3; exact divisors 1,3,5,15 | Four cusps with widths 15,5,3,1; toggling the prime-divisor labels is transitive. d=1 leaves every label unchanged; d=15 exchanges widths 15 and 1. | Retain bad-prime model comparison and torsion translation. (carried from r7; computed in r5) |
| 7.9 Reduction/logarithm boundary | q=3,e=1; q=2,e=1; Q₃(ζ₃),e=2 | Bounds 1<2 true, 1<1 false, 2<2 false. In last case ζ₃−1≠0 has formal order 3. For a Tate curve, 1+3Z₃ is torsion-free despite bad reduction. | Strict inequality, smooth group, squarefree corollary retained. (carried from r7; computed in r5) |
| 8.1 Model and inverse | x=1, y²+3y−2=0 | Coefficients (3/2−y/4,1−3y/2,1−3y/2); Δ=(−41129070+73241675y)/2048≠0. Inverse gives x=1,y=y. Multiples 1,…,12 are affine; 12Q=(0,−1+3y/2), 13Q=O. | Moduli map tested beyond genus. (carried from r7; computed in r5) |
| 8.1 Principal divisors | y=−1 and y=x; five relation vectors | Substitution gives −x(x+1)² and x³(x+1). Relation determinant −19; vector (1,14,3,12,15) annihilates all five relations mod 19. Multiplicities 2 at B₀′ and 3 at A are necessary. | Retain marked cusp identities. (carried from r7; computed in r5) |
| 8.1 Point counts and torsion | F₂,F₄,F₃,F₉ | Affine counts by x: (2,2), (2,0,2,0), (2,0,2), (2,0,0,2,0,0,2,0,0). Add two infinity points: 6,6,6,8. Jacobian orders (36+6)/2−2=19 and (36+8)/2−3=19. Sextic discriminant −692224=−2¹²·13². | Two prime-to-residue injections bound all torsion. (carried from r7; computed in r5) |
| 8.1 Geometric intersection | All 21 unordered pairs in {0,1,3,12,14,15} mod 19 | Each residue appears once except 15, which appears three times: 1+14=3+12=0+15. Thus 21−2=19 distinct classes; canonical conjugate of V is U. | Degree-two uniqueness excludes extra geometric points. (carried from r7; computed in r5) |
| 8.2 Diamond order and norm | γ²=γ−1; residues 8,12 mod 19 | γ³=−1, γ⁶=1; (3+2γ)(5−2γ)=19. Roots satisfy 8²−8+1=57 and 12²−12+1=133, both 0 mod 19. Dimensions 2+2=4, ranks 361·361=19⁴. | Correct polynomial, factor labels and dimensions. (carried from r7; computed in r5) |
| 8.3 Kernel constituents | Local field Q₁₃; two norm-19 factors | rank F=19²=361, sub/quotient ranks 19 each. gcd(19,13−1)=1, so μ₁₉(Q₁₃) has order 1. Nontrivial order-six inertia has no nonzero fixed vector; hence F(Q₁₃) has order 1, not rank 1. | Geometric rank distinguished from local points. (carried from r7; computed in r5) |
| 8.4 Local surjectivity | Formal pro-13 group; finite quotient | 19≡6 mod 13 is a unit and πbar/19 is a formal inverse. A zero kernel on a finite group of size h gives image size h. By contrast [19]:Z→Z has zero kernel but cokernel order 19. | Compact/formal/finite steps all retained. (carried from r7; computed in r5) |
| 8.5 Cyclotomic class number | Degree 12, six complex places | Signed discriminant (+1)13¹¹. Minkowski value approximately 306.415804; stated rational upper bound approximately 306.801038<307. Residue degrees at 2,3,5,7,11,17 are 12,3,4,12,12,6. Only possible small prime-ideal norms: 13,27,53,79,131,157. | Exact finite norm proof, not a regular-prime assumption. (carried from r7; computed in r5) |
| 8.5 Norm witnesses | Six elements in displayed order | Determinants of multiplication are exactly 13,27,53,79,131,157. Norm 27 is minimal 3³, so one prime ideal, with four conjugates because 12/3=4. Norm 13 is ramified, not split. | Every small prime ideal principal; h=1. (carried from r7; computed in r5) |
| 8.5 Cohomology/localization | Units ±13^Z; degree-12 cover; coefficient 19 | −1=(−1)¹⁹; unit quotient Z/19 generated by 13; valuation sends it to 1 mod 19. gcd(12,19)=1 and 12⁻¹=8 mod 19. Residue-unit order 12 has no 19 quotient. | Localization kernel 0; no misuse of admissible-group bound. (carried from r7; computed in r5) |
| 8.6 Rank zero and order-13 exclusion | Free O-rank d=0,1,2; cusp torsion | O^d/πO^d has sizes 1,19,361. Surjectivity permits only d=0. On T₁₉, choose γ=12 so πbar=0 and π=8 is a unit: π-surjectivity is consistent with nonzero torsion of order 19. | Rank zero gives B(Q)=C₁₉, then six cusps only. (carried from r7; computed in r5) |
| 8.7 Four occurring primes | Displayed Weierstrass models for 2,3,5,7 | Discriminants 64,−27,−11,−1664, all nonzero. Exact point orders 2,3,5,7 from successive addition; explicit multiples recorded below. | All existential witnesses are elliptic. (carried from r7; computed in r5) |
| 8.8 Classification | Four actual witnesses; excluded P=11,13; identity | Actual prime orders are 2,3,5,7; the order exclusions cover 11 and 13 by different arguments. Identity order 1 fails hOrder for every prime. Composite order 4 is outside the prime quantifier. | Lean matches prime-only conclusion. (carried from r7; computed in r5) |
| 8.9 Fixed-vector consequence | Nonzero vector of C₇; identity in E[11]; stable nontrivial character line | C₇ rational vector is fixed but 7<7 is false. Identity in E[11] is fixed and equals 0. On F₁₁ with nontrivial scalar 2, fixed vectors solve (2−1)v=0, giving v=0 although the line is stable. | Fixed vector is not stable line; no irreducibility overclaim. (carried from r7; computed in r5) |

## Not verifiable

- **Some cited Tau Ceti modules have no object files at the pin.** These are `HeckeSlash/Finite`, `Nebentypus/CoefficientFormula`, and `WeightTwo/Character`, `ConstantTerm` and `Normalized`. I checked their declarations in the pinned source by namespace, file and line, not by `#check`. The modules that `Suggested.lean` imports, plus `Nebentypus/Scalar` and `HeckeSlash/Operators`, are built, and I elaborated their declarations in probes.
- **The newform coefficients in the §0.4 Checks were recomputed by point counts.** I counted points on the Weierstrass models 11a1, 17a1, 37a1 and 37b1 over `𝔽_l` for `l≤37`. The modularity identification of these curves with the newforms of levels 11, 17 and 37 is assumed, not re-derived.
- **Earlier sources not reopened.** FaltingsChai1990 III §7 stays a settled uncertified (paywalled) citation. This round reopened only Mazur1977, at the locators above.

## Source issues

- none
