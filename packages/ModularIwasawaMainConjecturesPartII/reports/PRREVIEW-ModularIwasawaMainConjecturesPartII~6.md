# Review of ModularIwasawaMainConjecturesPartII (pull request #2281 at 953523b)

**Verdict:** needs changes

**Summary.** Changes are needed: two findings, both in Layer 4. The tame Euler factor of §4.6 (and of the Check of §4.1, the scalar of §4.3 and the projection formula of §6.1) carries the character value inverted relative to the twisted smoothing factor of §4.5, so for a character whose Frobenius value is not ±1 the divisor statement of §4.6 is wrong as written; and the Check of §4.5 on the smoothing ideal at the trivial character is false outside the case where the cyclotomic character is trivial on `Δ`. There is one small correction and one format note. The regulator normalization of §4.2, which departs from the printed source, is left to the human reviewers as before.

## Previous findings

- none: the previous review, of `6fc6492`, raised no finding. Since then the scope and supplier contracts moved to the end, and NoncommutativeAndEquivariantIwasawa §4.3 changed from a supplier to a comparison; the whole text was reviewed again.

## R01 (P1) — The tame Euler factor of §4.6 is twisted by `χ` where the smoothing factor of §4.5 is twisted by `χ⁻¹`, so for non-real Frobenius values §4.6 states the wrong divisor

An implementer who builds `ζ(χ, f)` as §4.6 defines it proves a false divisor identity for wild characters, exactly the case Layer 4 is written to include.

By the Conventions (line 13) and §1.1 (line 67), `x ↦ x ⊗ t_χ` is `Tw_{χ⁻¹}`-semilinear, so an operator `P(g)` on `h¹` becomes `P(χ(g)⁻¹g)` on the `χ`-coefficients. Applied to `N(a) − σ_a` this gives `N(a) − χ(σ_a)⁻¹[σ_a|Γ]`, which is `s_a(χ)` of §4.5 (line 320). Applied to `1 − Frob_𝔩⁻¹` it gives `1 − χ(Frob_𝔩)Frob_𝔩⁻¹`. The supplier's definition agrees: in EulerSystemsAndKolyvaginSystems §2.2 the factor is `P(Fr_q⁻¹ | T^*; Fr_q⁻¹)`, and for `T = O_p(χ)(1)` the dual `T^*` is the line of `χ⁻¹`, on which `Fr_q⁻¹` acts by `χ(Fr_q)`. The README instead writes `1 − χ(𝔩)Frob_𝔩⁻¹` "with `χ(𝔩)` in the inverse-Artin convention", `χ(𝔩) = χ(Frob_𝔩⁻¹)` (Check of §4.1, line 262; §4.6, line 342), which is `1 − χ(Frob_𝔩)⁻¹Frob_𝔩⁻¹`: the image of `1 − Frob_𝔩⁻¹` under `g ↦ χ(g)g`, the opposite twist. No single ring homomorphism sends `σ_a` to `χ(σ_a)⁻¹[σ_a|Γ]` and `Frob_𝔩⁻¹` to `χ(Frob_𝔩)⁻¹[Frob_𝔩|Γ]⁻¹`. Instance: `p = 3`, `χ(Frob_𝔩) = ζ_3`, `γ` the image of `Frob_𝔩` in `Γ`. Then `1 − ζ_3γ⁻¹` and `1 − ζ_3⁻¹γ⁻¹` are both non-units of `ℤ_3[ζ_3][[Γ]]` (their augmentations `1 − ζ_3^{±1}` lie in the maximal ideal) and vanish on `γ = ζ_3` and `γ = ζ_3⁻¹` respectively, so they have different divisors and §4.6 is off by their difference. Every Check on these factors uses the value `−1` (§§4.5, 4.6, 1.5), where the two agree. The same inversion is in §4.3 (line 289), where the rule gives the scalar `N(a) − η(σ_a)` for the line of `η⁻¹`, not the inverse-Artin value, and in §6.1 (line 522), where the factor `O[[Γ]](χ)` of `R_O` on which `Δ` acts by `χ` carries the coefficient line of `χ⁻¹` (Johnson-Leung–Kings use the projector `p_{χ⁻¹}`, JLK line 1499), so the formula there pairs one character's factor with the other's class.

The smallest change: keep §4.5 and write the factor in §§4.1, 4.6 as `1 − χ(Frob_𝔩)Frob_𝔩⁻¹` (that is, `χ(𝔩)⁻¹` for the inverse-Artin value), the scalar in §4.3 as `N(a) − η(σ_a)`, and in §6.1 name the class as that of `χ⁻¹` on the `χ`-factor; or invert §4.5 and the semilinearity instead, but use one twist throughout. A Check with the value `ζ_3` at `p = 3` as above would pin it.

## R02 (P2) — The Check of §4.5 that `J_χ` at `χ = 1` has height two and is not principal fails whenever the cyclotomic character is nontrivial on `Δ` modulo `p`

A reader takes from it that the unsmoothed class `ζ(1)` is never integral, which is false in most cases.

The Check (line 336) reads "At χ = 1, J_χ is the cyclotomic auxiliary ideal, of height two; it is not principal". Take `K = ℚ(i)`, `p = 3`, `a = (2 + i)`, the ideal of the preceding Check: `s_a(1) = 5 − [σ_a|Γ]` has augmentation `4`, a 3-adic unit, so it is a unit of the local ring `ℤ_3[[Γ]]` and `J_1` is the unit ideal. The same happens for `ℚ(i)` at `p = 5` with `a = (7)` (augmentation `48`). In general the quotient of `Λ_O` by `J_χ` is `O/(χ(δ)κ(δ) − 1 : δ ∈ Δ)` with `κ` the cyclotomic character, so at `χ = 1` it is `ℤ_p` only when `κ` is trivial on `Δ`, as for `ℚ(i)`, `p = 2`, conductor one. The bullet above it ("support in codimension at least two") is correct and already allows the empty support.

The smallest change: restrict the Check to a case where it holds ("for `K = ℚ(i)`, `p = 2`, `χ = 1`, where `Δ` is trivial, `J_χ` is the kernel of the cyclotomic character, of height two and not principal") and add the contrast "for `K = ℚ(i)`, `p = 3`, `χ = 1`, `s_{(2+i)}(1)` has augmentation 4 and `J_χ` is the unit ideal".

## C01 — §5.2 still lists NoncommutativeAndEquivariantIwasawa §4.3 as a source for the exact image

In the source line of §5.2 (line 446), "NoncommutativeAndEquivariantIwasawa §4.3 for its exact image and rational-curve specialization" stands among the references that support the statement, while this head removed that section from every `*Needs:*` line and the description says it is cited only for comparison. A reader cannot tell whether §5.2 imports the exact image or proves it. Saying "compare NoncommutativeAndEquivariantIwasawa §4.3, the rational CM-curve case" would match the rest of the text.

## N01 — Three bullet lists are split by a blank line

The last bullet of the Checks of §7.3 (line 607) and of §8.7 (line 780), and the last three References (from line 933), are separated from their lists by a blank line and render as separate lists.

## Verified sound

| Statement | Instances tried | Computed on one side | Computed on the other / wrong model | Result; change |
|---|---|---|---|---|
| §0.2 normalization, regular primes, `ξ` | `Δ = ℤ/2`, `p = 2`; `ℤ_p[[T]]/(p)`; `/(T²)` vs `/(T)²` | `ℤ_2[x]/(x²−1)` local, normalization `ℤ_2²`; `ξ = (1)` rationally; both `(T²)` | integral char ideal `(p)`; non-isomorphic modules | Agrees with JLK Lemmas 7.2, 7.6 (JLK lines 1419, 1477); none |
| §1.2 `h¹`, `h²`, `E_∞` | `ℚ(i)`, `p = 5`, base layer | `O_K[1/5]^× ⊗ ℤ_5` of rank 2 (`2 ± i`) | global units give `μ_4 ⊗ ℤ_5 = 0` | Matches BT lines 138–140, Kato p. 251; none |
| §1.4 `h² → H²` | `ℚ(i)`, `p = 5` and `p = 2`, `K′ = K` | Brauer kernel `ℤ_5² → ℤ_5` rank 1; rank 0 at `p = 2` | identifying `H²` with `Pic[p^∞]` loses rank 1 | Matches Kato (15.6.2), p. 254; none |
| §2.3 squared-norm Kronecker dictionary | `ℚ(i)`, `f = (3)`, `a = (5)`, `χ = 1` and quadratic `η` | theta logs 0.66192107215, 5.92975265985; sum 6.59167373201; difference 5.26783158770 | `6 log 3 = 6.59167373201`; `4 log(2+√3) = 5.26783158770`; ordinary norm halves both | Recomputed numerically; none |
| §2.4 module `z`, ideal `J` | `R/J ≅ ℤ_p`; `N(a) − σ_a` on each component | dimension 1 in a 3-dimensional ring, height 2; image `N(a) − χ(δ_a)γ_a ≠ 0` | a single factor can be a non-unit at height one | Matches Kato (15.6.3)–(15.6.4); none |
| §2.5 cotorsion | `η` ramified above `p`, `η(Frob_𝔩) ≠ 1` | order of `L(η, s)` at 0 is 1; removed factors `1 − η(𝔩) ≠ 0` | trivial `η` with `𝔩 ∣ f` has order 2 | Matches JLK Theorem 3.9 (JLK line 727); none |
| §4.1 Euler system and twists | `T = O_p(χ)(1)`, `χ(Frob) = ζ_3` | supplier factor `1 − χ(Frob)Frob⁻¹` | README Check: `1 − χ(Frob)⁻¹Frob⁻¹` | Differs; R01 |
| §4.2 scalar Tamagawa number at `s = 0` | `ℚ(i) ⊂ ℚ(ζ₁₂)`, `h = 1`, `w = 12` | `ζ_F*(0) = (−1/2)(1/2)(1/3)R = −R/12`, `R = log(2+√3)` | `−hR/w = −R/12` with `|1−ζ₁₂|² = 2−√3`; ordinary norm gives `R/2` | Agrees; see human reviewers |
| §4.4 Rubin's bound | `H²_0` vs `H²` | local `H²` are f.g. `O_p`-modules, pseudo-null | — | Matches JLK Theorem 6.4, Corollary 6.5 (JLK lines 1257, 1302), Kato 15.2(1); none |
| §4.5 character-wise main conjecture | `ℚ(i)`, `p = 3`, quadratic `χ`, `a = (2+i)`, `b = (7)`; `χ = 1` | `χ(σ_a) = −1` (5 mod 12), `χ(σ_b) = 1` (49 mod 12); factors 6, 48 | at `χ = 1`: `s_a` augments to 4, a unit, so `J_1 = (1)` | Theorem as JLK 5.2; Check false, R02 |
| §4.6 tame Euler factors | `p = 3`, `χ(Frob_𝔩) = ζ_3` | `1 − ζ_3γ⁻¹` vanishes at `γ = ζ_3` | `1 − ζ_3⁻¹γ⁻¹` vanishes at `γ = ζ_3⁻¹` | Different divisors; R01 |
| §4.8 Rubin's theorem, classical form | `ℚ(i)`, `p = 5`; `ℚ(√−7)`, `p = 2` | `#Δ = 4`, `#μ(H) = 4`; `μ(H) = μ_2` excludes 2 | division tower has 16 components, ray tower 4 | Matches Rubin91 lines 486–571, JLK §5.4; none |
| §6.2 rational equivariant equality | `ℚ(i)`, `p = 5`, `f = (3)`, trivial and `ω ∘ χ_cyc` components | `1 − γ⁻¹` non-unit; `ω(9) = −1`, `1 + γ⁻¹` augments to 2, unit | printed form (BT line 153) omits the first | Supported by JLK Theorem 5.7, Lemma 7.7; none |
| §7.3 comparison map | level 0; contained case | corestriction then Shapiro; linear over `O_λ[[G′_∞]]` | — | Matches Kato (15.12.1), p. 263; none |
| §7.6 contained case | `ℚ(i)`, 2; `ℚ(√−3)`, 3; `ℚ(i)`, 5 | `ζ_8 + ζ_8³ = i√2`; quadratic subfield of `ℚ(μ_{5^∞})` is `ℚ(√5)` | — | Matches Kato 15.14, p. 264; none |
| §7.7 length lemma | `A = ℤ_p[[T]]`, `M = A/(T)`, `a = p`; `M = A/(p)` | `[𝔽_p] = 1·[A/(T,p)]`; hypothesis fails | — | Matches Kato Lemma 14.15, pp. 243–244; none |
| §8.1 archimedean normalization | ratio of period images | fixed by `Gal(L(ζ_m)/L)`, so in `L^×` | — | Matches Kato Lemma 15.11(2), pp. 261–262; none |
| §8.3 equality on `ψ`-components | `g ∈ I_𝔩`, `q′ ⊂ q`, `p ∉ q` | `g − ζ ∈ q′`, `ζ − 1 ∈ q` divides the order, so `ζ = 1`; Euler module killed by `χ_T(g)⁻¹ − 1 ≠ 0` | — | Sound; none |
| §8.5 equality descent | `M_1 = M_2 = A/(y)`, `a = x` | `len(M/x) = 1`, `M[x] = 0`; `len H² = len(M_2/a) + len M_1[a] = len(H¹/Z)` | `H = x⁻¹A` breaks step 4 | Sound; none |
| §8.6 Kato's equality for CM forms | 32.2.a.a at 2; 27.2.a.a at 3 | `4·8 = 32`, `3·9 = 27`; contained case for both | integral form not asserted | Matches BT lines 208–218; none |
| §3.1 admissible ideals | `ψ_E²ε`, `(7)`, `(41)`; `𝔮 = (2+i)` | `ε(i) = i^{3+1} = 1`; `ψ((7)) = −49`, factor 98; `ψ((41)) = 1681`, factor 0; `(−1+2i)² = −3−4i` | `(−3+4i)/5` not integral | Sound; none |
| §5.1 Coleman Checks | `θ(T) = cT`, `p = 5`; `g = (2+T)/ω(2)` | `D_θ log g = c·(1/c) = 1`; mass 0, first moment `1/4 − 5/4 = −1` | coefficientwise `φ` gives `5c = 5c²` | Sound; none |

- Source locators checked against the text: about 50 (BT 11, JLK 20, Kato 18, Rubin91 2, CGLS 2; HuberKings and Kriz by statement heading and page only); all at the stated place, with the source deviations listed under Source issues.
- Library declarations opened at the pins: 14, among them `TauCeti.completedGroupAlgebra` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`), `TauCeti.ClassFieldTheory.rayClassField` and `rayClassArtinEquiv` (`TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:123, 209`), `HeckeRing.GL2.Newform` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`), `NumberField.Units.regulator` and `regulator_ne_zero` (`Mathlib/NumberTheory/NumberField/Units/Regulator.lean:267, 290`), `logEmbedding` with the weight `mult w` (`Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:86`).
- Cross-roadmap citations resolved: 78 section or layer citations across 24 roadmaps, on main or at the open head; all found. NonordinaryCMSpecialValues §§2.1–2.6 and KatoEulerSystems §§4.2, 4.4, 5.1, 5.3, 7.2 read in full against what is assumed of them.
- Dependency check output: `depcheck: 199 roadmaps, 2183 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head. `Suggested.lean` elaborates with no output; it has no declaration, so no signature comparison and no one-tactic probe applies. No headline is statable at the pins: the Galois realization of `HeckeRing.GL2.Newform`, arithmetic Iwasawa cohomology and elliptic units are absent, as the module docstring says.
- Pull request text: title and description read against the head; no sentence contradicted. The folder is added (972 insertions), no change outside it.
- The declared gap on the height-one explicit reciprocity law is now met by NonordinaryCMSpecialValues §2.5, which the README cites; nothing is raised.

Overlap check: read KatoEulerSystems, NonordinaryCMSpecialValues, AutomorphicCongruences, ModularIwasawaMainConjectures, InertAnticyclotomicCMMainConjecture, EulerSystemsAndKolyvaginSystems, SelmerIwasawaCohomology, EulerSystemsCyclotomicMainConjecture and NoncommutativeAndEquivariantIwasawa. Owners: zeta morphism and CM module structure, KatoEulerSystems; theta functions, standard elliptic units, zeta element and reciprocity law, NonordinaryCMSpecialValues; formulation of Kato's conjecture, ModularIwasawaMainConjectures; Rubin's two-variable theorem for a rational CM curve at ordinary `p ≥ 5`, NoncommutativeAndEquivariantIwasawa §4.3 on main, of which §§4.8, 5.1–5.3 here are the general-field statements and say so; units of every modulus, the module `z`, the character-wise and equivariant equalities and the CM descent, this roadmap. Nothing has two owners.

Source independence: 20 passages compared with 6 sources, none shared beyond eight forced words ("whose kernel and cokernel are finitely generated", Kato line 5304); largest share Kato, 33 of about 98 locators; contents compared with Kato §15: independent (Layers 0–6 are not in its arrangement, Layer 1 precedes the elliptic units, and the order of Layers 7–8 is forced by the dependencies of §§7.2–8.6).

Research link: Layer 8 is Theorem 2.6 of Burungale–Tian (2025), resting on Kato (2004) §15, Johnson-Leung–Kings (2011) and Rubin (1991); Layer 5 supplies Castella–Grossi–Lee–Skinner (2022). Rests on the README's sources, read at BT lines 208–218 and CGLS lines 394–836.

## Not verifiable

- The proof of the Tamagawa number statement at `p = 2` (§4.2) goes through Itakura §3.1 by JLK line 432; no legal copy was found, so the dyadic compact-support comparison was checked only by the class-number computation in the table.
- Yager's thesis and Coleman's paper were not in the sample and were not opened this round.

## Source issues

- **Misprint** in Kato at proof of Proposition 15.17, printed p. 265 (Kato line 5769): the source says to apply Lemma 14.12; it should be Lemma 14.15, the length lemma at Kato line 4912; affects the proof.
- **Error** in JLK at Proposition 3.3(4), pp. 14–15 (JLK line 613): the source says the character sum of ordinary logarithms equals the smoothing factor times the leading term; it should be twice that sum (for `ℚ(i)`, `f = (3)`, `a = (5)`: `−6 log 3` against `−12 log 3`); affects a stated result.
- **Error** in JLK at §2.2, (6), pp. 9–10 (JLK lines 394–397): the source says the regulator with the ordinary absolute value gives the correct 2-part; it should be the squared norm, by the class number formula for `ℚ(ζ₁₂)` over `ℚ(i)`; affects a stated result.
- **Error** in JLK at §5.2, (17), p. 24 (JLK line 999): the source says the class divided by the untwisted factor is independent of the auxiliary ideal; it should be divided by the factor twisted by the character value; affects a stated result.
- **Error** in BT at Theorem 2.1, p. 4 (BT lines 152–153), and Kato at Theorem 15.2(2), p. 251: the source says class-group and elliptic-unit lengths agree for every conductor; it should include the Euler modules at primes of the conductor prime to `p`; affects a stated result.

## For the human reviewers

- JLK lines 394–397 state that the ordinary-norm regulator is needed for the 2-part; the README (§4.2, line 267) replaces it by the squared norm. The class-number computation supports the README; Itakura's proof at `p = 2` was not readable.
- The README corrects four printed statements of its sources (JLK (6), (17), Proposition 3.3(4); BT Theorem 2.1). Each correction was recomputed here on one example, not proved in general.
