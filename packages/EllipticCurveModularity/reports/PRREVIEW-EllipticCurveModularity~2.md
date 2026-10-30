# Review of EllipticCurveModularity (pull request #1018 at 6a07636)

**Verdict:** accepted

This is a full review of the repaired head. The previous review's nine findings were checked first, then the whole roadmap was reviewed again. No P1 or P2 finding remains; four P3 notes follow.

**Repairs since the previous review (ed342f3), finding by finding.**

- R01 (ModularCurvesPartII sections): repaired. `README.md:272-278` now reads "§16.3 the dimension and Tate realization, and §16.4 the differential comparison. Section 16.5 supplies the actual Γ₀ quotient … §16.6 the oldform factors, §16.7 the nonconstant Abel–Jacobi composite, and §17.3 the cusp-normalised map `abelJacobiInfty`". At the supplier's open head these are `### 16.3 Tate module and Shimura's dimension theorem`, `### 16.4 Differentials on A_f`, `### 16.5 Trivial character: the quotient of J₀(N)`, `### 16.6 Oldforms`, `### 16.7 The Abel–Jacobi composite to A_f is nonconstant`, `### 17.3 Cusp-normalised Abel–Jacobi maps` (which lists `abelJacobiInfty`). Every repeated citation (lines 1303, 1509, 1558, 1600, 1710-1713, 1763, 1846, 2001) was repointed consistently.
- R02 (residual-attachment and weight suppliers): repaired. `README.md:65-67, 251-254, 263, 846-848` cite §4.9, §5.10, §§6.1–6.2 and §7.5 of AlgebraicModularFormsAndSerreWeights; all four headings exist at its head (`### 4.9 The weight-two criterion`, `### 5.10 Deligne–Serre eigenvalue lifting`, `### 6.1`, `### 6.2`, `### 7.5 S-type and modularity predicates`), the anchor `#75-s-type-and-modularity-predicates` is the GitHub anchor of that heading, and the predicate is now described as "a planned supplier interface" with the finite field, single coefficient map and semisimplification caveats (lines 842-868), not as an existing `TauCeti.ResidualModularity.ArisesFrom` declaration.
- R03 (15-isogeny headline): repaired. `Suggested.lean:107-109` states `fifteen_isogeny_j` with the four j-values; `README.md:598` names it.
- R04 (summability ownership): repaired on this side. `Suggested.lean:142-144` now states the number-field theorem on the native `W.LFunction`, `README.md:81-85` records ownership in R29.6 with the rational bound as the ℚ specialization, and `README.md:1859-1923` gives the norm-fibre proof with the ℚ(√17), ℚ(√5), ℚ(√2) Checks. The consumer side is not yet aligned; see R01 below.
- R05 (DDT link, table page): repaired. `README.md:605` links the readable copy; line 609 says "§19.1, p. 93".
- R06 (HTML anchors), R07 (layer-heading delimiters), R08 (namespace and module title), R09 (exemption for undeclared names): repaired. The gate reports `residue=0 layer-ids=0 readme-ids-missing=0`; `Suggested.lean:8` is "…: target signatures", line 41 opens `namespace TauCetiRoadmap.EllipticCurveModularity`; `README.md:402` now says "The remaining APIs are specified in mathematical prose", and no backticked own name outside the nine Lean declarations survives.

## R01 (P3) — The periods roadmap at its open head still builds the summability theorem

**Location:** `TauCetiRoadmap/EllipticCurveModularity/README.md:81-82`: "R29.6 owns elliptic coefficient summability over number fields; EllipticCurvePeriodsAndModularParametrizations §3.1 consumes this result."

**Claim:** The consumer imports the number-field summability from R29.6.

**Witness:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:649-651` at its open head (#1715) is "### 3.1 Absolute convergence for `Re s > 3/2`" and plans `LSeriesSummable_LFunction`; its `Suggested.lean:253-254` states the same theorem with `sorry`. Both files are, after unfolding, the statement of `lCoeff_LSeriesSummable` (`Suggested.lean:142-144` here).

**Repair:** None in this folder beyond wording: ownership here is the direction the previous review fixed (the periods roadmap consumes R29.3–R29.6, lines 57 and 145 of its README, so citing it from here would be a cycle). The periods roadmap's own review must delete its §3.1 statement and cite EllipticCurveModularity R29.6. If the sentence is kept, "consumes" is the contract after both merge; "is to consume" is misleading in a timeless README, so the present wording is acceptable. Test instance: at `K = ℚ`, `s = 7/4`, both files' conclusions are literally `LSeriesSummable (fun n => (E.LFunction n : ℂ)) (7/4)`.

## R02 (P3) — Two source locators

**Location:** `TauCetiRoadmap/EllipticCurveModularity/README.md:1666` "Milne, *Abelian Varieties* (2022), Proposition 12.1, p. 19" and line 1672 "(Milne, §8, p. 12)"; line 428 "Theorem 5 in §4.7, pp. 208–209" against line 1984 "Serre §4.7, Theorem 5, pp. 209–210".

**Claim:** The Milne document dated 2022 has Proposition 12.1 (a Poincaré complement) on p. 19 and the isogeny inverse in §8 on p. 12.

**Witness:** No 2022 Milne text exists. The author's site lists the course notes (v2.00, 2008, 172 pages: §7 Isogenies p. 32, §12 étale cohomology with Theorem 12.1 p. 55) and the corrected 1986 Storrs article (2012, 46 pages). In the Storrs article the locators are exact: `milne` line 463 (§8 Isogenies, page 12) and line 755 (Proposition 12.1, page 19, the complement of an abelian subvariety). Serre's Theorem 5 is on printed p. 209 (`serre` line 1334, PDF page 31).

**Repair:** Cite "Milne, *Abelian varieties* (1986 Storrs article, corrected 2012), §8, p. 12 and Proposition 12.1, p. 19" at both places, and use one page range for Theorem 5 (§4.7, pp. 208–210, the theorem on p. 209). Instance checked: the complement `D` with `C × D → A` an isogeny used at line 1661 is exactly what the Storrs Proposition 12.1 supplies.

## R03 (P3) — References section placed mid-document and incomplete

**Location:** `TauCetiRoadmap/EllipticCurveModularity/README.md:410-460` (`## References` between the supplier contracts and `## How to read the build`).

**Claim:** The section lists the cited works.

**Witness:** It lists five works (Serre 1987, Faltings, Carayol, Deligne–Serre, Cremona). Barrios (line 575), Darmon–Diamond–Taylor (604), González–Jiménez–Lario (607), Khare–Wintenberger (317, 413), Serre 1970 and Brumer–Kramer (1327-1328), Ribet–Stein and Milne (1666-1667, 1715-1716), Silverman (497, 528, 1896) and Miyake (1096) are cited only inline. The shape puts `## References` last, after `## Downstream consumers`.

**Repair:** Move the section after `## Downstream consumers` and add one entry per cited work with the locators used (the printed-page conventions paragraph at lines 456-460 stays with it). Count after repair: fifteen entries for fifteen cited works.

## R04 (P3) — Two naming and contract nits

**Location:** `TauCetiRoadmap/EllipticCurveModularity/Suggested.lean:142` and `README.md:1861, 1936, 1972` (`lCoeff_LSeriesSummable`); `README.md:1319` (`WeierstrassCurve.IsSemistable ℤ E`).

**Claim:** The name describes a theorem about `lCoeff`; the semistability predicate is an existing declaration.

**Witness:** The theorem is about `W.LFunction` over an arbitrary number field, and `lCoeff` is defined only over ℚ (`Suggested.lean:49`). `WeierstrassCurve.IsSemistable` exists at the pin in Tau Ceti `TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/Semistable.lean:90` with signature `(O) (W : WeierstrassCurve F) [W.IsElliptic] : Prop`, but the supplier-contract table (lines 171-186) does not list it.

**Repair:** Rename the theorem `LFunction_LSeriesSummable` in both files, and add a row `WeierstrassCurve.IsSemistable` (Tau Ceti, `MinimalModel/Semistable.lean`) to the contract table. At `O = ℤ`, `F = ℚ` the cited use at line 1319 elaborates as written.

## Verified sound

**Gate, build, dependency direction.** The gate was rerun on this head and passes every check (`set_option=0 … residue=0 … layer-ids=0 … stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`). `git diff --stat origin/main...HEAD` outside the folder is empty. The four `TauCeti.*` imports were built, then `lake env lean` on `Suggested.lean` exited 0 with exactly thirteen `declaration uses sorry` warnings and nothing else. The dependency check returned

```text
depcheck: 208 roadmaps, 1474 edges, 0 problem(s)
```

with no UPWARD or CYCLE line. This roadmap is line 151 of the merge order, directly after ClassicalSerreModularity (150); every roadmap it cites is on main (EllipticCurves, ModularForms, ModularCurves, JacobianChallenge, AlgebraicCurves, RepresentationTheory/SemisimpleAlgebras, Completed/ArithmeticDirichletSeries) or earlier in the order. No declared gaps; none needed. Nothing in the folder is a stray file (`README.md`, `Suggested.lean`, `metadata.toml`).

**Signatures.** A scratch copy with `#check @name` for all twenty-one declarations elaborated. Every theorem carries `[E.IsElliptic]` (or `[W.IsElliptic]`) explicitly; the two reduction predicates and `IsNewformOf` deliberately accept any `WeierstrassCurve ℚ`, as the README says. No binder was lost: `lCoeff_LSeriesSummable` keeps `[NumberField K]`, `span_range_rationalTateRep` keeps `[Fact r.Prime]`, `IsNewformOf.localPolynomial_eq` keeps `[Fact ℓ.Prime]` and `[NeZero M]`. Nothing changed.

**Padding probe.** Each of the thirteen sorried theorems was tried, on scratch copies, with `simp`, `rfl`, `infer_instance`, and with `exact?` in a file from which the original theorems were removed. None closed (six `simp` runs made progress without closing; `exact?` failed on twelve and timed out on the summability goal). No declaration restates a definition, mirrors a Check or computes a value. No padding.

**Headline coverage.** README headlines: `End_ℚ(E)=ℤ`; finiteness of `Σ_E`; the 3-, 5- and 15-isogeny classifications; residual irreducibility and exact residual conductor; finite-flat weight two and Serre witnesses; one exact newform from infinitely many congruences; rational coefficients; Tate comparison, exact conductor and all local factors; quotient isogeny and parametrisation; absolute irreducibility of `V_r(E)`; exhaustive Γ₀ decomposition and the Jacobian converse; the three formulations; summability; the entire completed L-function. Stated at the pins: thirteen theorems covering the first three, rationality, all local factors and coefficients, absolute irreducibility, number-field summability, modularity at a positive level, and the completed L-function (conditional and unconditional). The module docstring names what is not statable and why: no elliptic or Artin conductor, no Serre weight or residual-attachment API, no `X₀(N)`, `J₀(N)` or modular quotient at Mathlib `6b7abb3` / Tau Ceti `a91d3aa`. I confirmed the absences: `grep conductor` in `Mathlib/AlgebraicGeometry/EllipticCurve/` is empty, and Tau Ceti's only conductors are of ray-class, Hecke characters and orders; no modular curve carrier exists. The exact-level form of `modularity` is therefore not statable, and exhibiting `∃ N` with the conductor identification left to R29.4 is the honest statement, not a stand-in.

**Adversarial table.** One row per statement; values on both sides were recomputed from the displayed coefficient tuples (discriminant, `c₄`, `c₆`, `j`, point counts by brute force).

| Statement / location | Instances tried | Values on each side; wrong model excluded | Result |
| --- | --- | --- | --- |
| Model table, README 713-723 | all nine tuples | `(Δ,c₄)` = 11a1 (−161051, 496), 11a2 (−11, 375376), 11a3 (−11, 16), 26b1 (−1664, 129), 274a1 (−17536, 337), 162b1 (−648, 225), 32a2 (64, 48), 37a1 (37, 48), twist (−659664896, 7936); all nine match | pass |
| `j = c₄³/Δ`, twist invariance, 734 | 11a1 and its twist | both `j = −122023936/161051`; `v₁₁(j) = −5` for both; 11a2 and 11a3 have `v₁₁(j) = −1` | pass |
| `lCoeff`, Checks 485-490 | 11a1, n = 0, 1, 2, 3, 4, 6, 121 | `a₀=0, a₁=1, a₂=−2, a₃=−1`; `a₄=(−2)²−2=2`, `a₆=(−2)(−1)=2`; `a₁₂₁=1`; good recurrence at 11 would give `1−11=−10` | pass |
| Reduction predicates, 501-506 | 11a1 at 7, 11; 32a2 at 2 | `v₇(Δ)=0` good; `v₁₁(Δ)=5`, `v₁₁(c₄)=0` split multiplicative; 32a2: `v₂(Δ)=6, v₂(c₄)=4` additive, both predicates false | pass |
| `rationalEndomorphisms_eq_int`, Lean 86 | identity, 0, [−2]; `dim A = 0` | scalars 1, 0, −2 with degrees 1, 0, 4; for `dim 0` the ring `End A` is the zero ring, not ℤ, and the hypothesis excludes it | pass |
| CM control, 536-537 | `y²=x³−x` | `[i]` has differential scalar `i ∉ ℚ`; `End_ℚ = ℤ`, `End_ℚ(i) = ℤ[i]` | pass |
| `HasRationalCyclicSubgroup`, Lean 60 | p = 0, 1; 11a1 p = 5; 162b1 p = 7 | p = 0: `Finite C ∧ Nat.card C = 0` impossible; p = 1: zero subgroup, true; (5,5) on 11a1 has order 5; 162b1 has `#E(𝔽₅)=6`, no rational 7-torsion, yet the cubic `x³−3x²+3` gives a stable order-7 subgroup | pass |
| `three_isogeny_j`, Lean 95 | u = −3, −27, 0 | `(u+27)(u+3)³` = 0, 0, 729; j = 0 allowed (y²=x³+1 has the 3-torsion point (0,1)); u = 0 is the cusp (729 ≠ 0) | pass |
| `five_isogeny_j`, Lean 101 | 11a1 with v = −1/11; v = 0 | `j·v = (v²+10v+5)³ = 122023936/1771561` both sides; v = 0 gives 125 ≠ 0; `v²+10v+5` has discriminant 80, no rational root, so j = 0 excluded | pass |
| Barrios Table 1 direction, 577 | n = 3, 5 | second column `(t+27)(t+3)³/t`, `(t²+10t+5)³/t` is the target curve's j; the dual isogeny makes E the target | pass |
| `fifteen_isogeny_j`, Lean 107 | four table models; `y²=x³−x²−8x+112`; 50a1 | `−5²/2, −5²·241³/2³, −5·29³/2⁵, 5·211³/2¹⁵` = `−25/2, −349938025/8, −121945/32, 46969655/32768`; the displayed model has `(Δ,c₄)=(−5120000, 400)`, `j = −25/2`; 50a1 `(1,0,1,−1,−2)` gives `(−1250, 25)`, `j = −25/2` | pass |
| 5-adic exclusion, 600-621 | the four j-values | `v₅(j)` = 2, 2, 1, 1; good reduction with j ≠ 0 forces `v₅(j) ∈ 3ℕ`, multiplicative forces `v₅(j) < 0`; the displayed model is additive at 5 (`v₅(Δ)=4, v₅(c₄)=2`) | pass |
| `exceptionalPrimes`, Lean 71 | p = 0, 1, 4; 2, 3, 5 | nonprimes excluded by the `∃ hp` guard; 2, 3, 5 in by `p ≤ 5` | pass |
| Valuation clause, 637-644 | 11a1 at 11; 26b1, 274a1 at 2; 162b1 at 2 | `v₁₁(j)=−5`, `v₂(j)=−7, −7, −3`; `7 ∣ −7` true for 26b1 and 274a1, false for 162b1; `padicValRat` of `j = 0` would be 0 but multiplicative reduction forces `j ≠ 0` | pass |
| 7 ∉ Σ(11a1), 755-760 | Frobenius at 3 mod 7 | `#E(𝔽₃)=5`, `a₃=−1`, discriminant `1−12 ≡ 3 (mod 7)`, squares mod 7 are {0,1,2,4} | pass |
| 274a1 valuation-only, 766-771 | Frobenius at 3 | `#E(𝔽₃)=6`, `a₃=−2`, discriminant `4−12 ≡ 6 (mod 7)`, nonsquare | pass |
| 26b1 point (1,0), 763 | substitution | `y²+xy+y = 0 = x³−x²−3x+3` at (1,0) | pass |
| `exceptionalPrimes_finite`, Lean 91 | 11a1; CM curve | `Σ(11a1) ⊇ {2,3,5,11}`; finiteness of prime isogeny degrees from R28.6.5–6 with `End_ℚ=ℤ`; `y²=x³−x` not excluded | pass |
| Residual conductor divides, 352-361 | 11a1 at p = 5, 7, 11 | prime-to-p conductors 1, 11, 1; all divide 11 | pass |
| Equality criterion, 363-387 | p = 7 and p = 5 for 11a1 | at 7: `7 ∤ 11`, `7 ∤ 5`, equality; at 5: `5 ∣ v₁₁(j) = −5`, conductor drops to 1 ≠ 11; Serre states p > 5 (`serre` line 1272), the README's p = 5 extension uses only `5 ∤ 24` and is not used by the proof (p ≥ 7) | pass |
| Absolute irreducibility via oddness, 690-697 | complex conjugation at p = 7, p = 2 | eigenvalues 1, −1 distinct for p odd; coincide at p = 2 (excluded by `p ≤ 5`) | pass |
| Finite-flat weight two, 813-822 | `E[7]` of 11a1 | `det = χ̄₇`, finite flat at 7 gives k = 2; `k ≡ 2 (mod 6)` alone admits k = 8 | pass |
| Residual attachment Check, 880-883 | 11a1, p = 5, Frobenius at 2 | semisimplification `1 ⊕ χ̄₅`: trace `1+2=3 ≡ −2`, determinant 2, `X²−3X+2`; the trivial rank-two representation has (2, 1) and fails | pass |
| Isogeny transport, 886-888 | 11a1 → 11a3 degree 5 | kernel of order 5 is an equivalence on `E[p]` for p ≠ 5 only | pass |
| Serre witness existence, 896-908 | p = 7 for 11a1 | export gives weight 2, level `N(ρ̄) = 11`, trivial character for p ≥ 5 (`ClassicalSerreModularity` R27.6 text at its head, lines 936-938) | pass |
| Root-of-unity reduction, 949-957 | ζ = −1, m = 2, p = 3 and p = 2 | at 3: reduction 2 ≠ 1; at 2: reduction 1 although ζ ≠ 1 | pass |
| Character triviality, 959-973 | S₃ sign at p = 5; level 5 at p = 2 | sign of a transposition reduces to 4 ≠ 1; quadratic character mod 5 reduces to 1 mod 2 with `φ(5)=4` even | pass |
| Norm vanishing, 1028-1050 | α = 2 in (2); α = 0 | one congruence `2 ∈ (2)` but 2 ≠ 0; infinitely many characteristics needed | pass |
| Integer form, 1039-1043 | 6; 0 | positive divisors of 6 are four; every n divides 0 | pass |
| `IsNewformOf`, Lean 79 | level 11 form and 11a1, 11a3; 37a1; nontrivial χ | `a₂,a₃,a₅ = −2,−1,1` for all three level-11 curves; 37a1 has `a₃=−3 ≠ −1` and conductor 37 ≠ 11; nontrivial χ fails the first conjunct | pass |
| Cross-level uniqueness, 1077-1082 | level-11 form, its oldform at 22 | the oldform is not a `Newform 22 2`; levels would have to satisfy 11 = 22 | pass |
| Infinite congruences to one form, 1118-1142 | fixed difference 2 vs 0 | 2 vanishes only mod 2; 0 mod every p; the form is fixed before taking norms | pass |
| Good reduction at ℓ ∤ N, 1133-1136 | ℓ = 11 for 11a1 at level N = 11 | 11 ∣ N so no claim; at ℓ = 7, p = 13 ∉ Σ, residual conductor 11, `7 ∤ 11` | pass |
| `IsNewformOf.coeff_int`, Lean 115 | level 11; level 23 | `−2,−1,2 ∈ ℤ`; level 23 has `a₂ = (−1±√5)/2`, not attached to any E/ℚ | pass |
| Quadratic twist, 1230-1236 | twist by −1 at ℓ = 3, 7, 13 | twist traces 1, 2, 4; `χ₋₄(3)(−1)=1`, `χ₋₄(7)(−2)=2`, `χ₋₄(13)(4)=4` | pass |
| Level-22 newness, 1238-1245 | `S₂(Γ₀(22))` | dimension 2 (genus of `X₀(22)`), spanned by `f(z), f(2z)`, new part 0 | pass |
| Rational Tate comparison, 1270-1287 | 11a1 at r = 5, ℓ = 2 | both polynomials `X²+2X+2`; degree-two coefficient field would give rational dimension 4 | pass |
| Conductor, 1333-1337 | 11a1, 37a1, 32a2 | 11 vs `|Δ_min| = 11⁵`; 37; Artin conductor 32 vs bad-prime product 2 (additive, `IsSemistable` fails) | pass |
| Level = conductor, 1341-1356 | ℓ = r = 11 | second auxiliary prime needed; a prime-to-r comparison alone leaves `v_r` unmeasured | pass |
| `IsNewformOf.localPolynomial_eq`, Lean 122 | 11a1 at 2, 7, 11; 37a1 at 37; 32a2 at 2 | Mathlib's `localPolynomial` (`LFunction.lean:43`) minimises first and gives `1−aX+qX²`, `1−X`, `1+X`, `1`; values `1+2X+2X²`, `1+2X+7X²` (`#E(𝔽₇)=10`), `1−X`, `1+X` (`−c₆ = 216 ≡ 31`, nonsquare mod 37), `1`; the `if ℓ ∣ M` branch matches since M = N_E | pass |
| Completion transport, 1392-1409 | prime above 11 | `v₁₁(11)=1`, residue field of size 11 on both carriers | pass |
| `IsNewformOf.coeff_eq`, Lean 128 | n = 0, 1, 4, 6, 121 | 0, 1, 2, 2, 1 on both sides | pass |
| Quotient isogeny and parametrisation, 1572-1589 | 11a1, 11a3, 37a1 | degrees 1, 5, 2; `Hom(11a1,11a3)` generated in degree 5, so degrees `5n²`; `[n]∘φ` has degree `n²·deg φ`, 0 at n = 0 | pass |
| `span_range_rationalTateRep`, Lean 135 | 11a1; `y²=x³−x` at r = 5 | commutant `End_ℚ(E)⊗ℚ_r = ℚ_r`; CM restriction to `G_ℚ(i)` splits into two lines swapped by conjugation; the upper-triangular algebra (dimension 3, scalar commutant, invariant line) shows semisimplicity is needed | pass |
| Rational Tate surjectivity, 1658-1684 | `[r]`, `E×E→E`, `A→0` | `V_r([r]) = r·I₂` invertible though `T_r` cokernel has order `r²`; projection has rank 2; target dimension 0 | pass |
| Exhaustive Γ₀ decomposition, 1706-1727 | N′ = 1, 22, Mq² | empty product = `J₀(1) = 0`; two level-11 copies give `dim J₀(22) = 2`, Tate dimension 4; `d(q²) = 3` whether or not `q ∣ M` (`cremona` line 1299: oldclass dimension `d(N/M)`) | pass |
| Jacobian converse, 1729-1756 | N′ = 22, 23 | level 11 recovered as a proper divisor of 22; at 23 the surface with `K_f = ℚ(√5)` has no elliptic quotient over ℚ | pass |
| Three formulations, 1799-1834 | 11a1; geometric level 22 | newform at 11, quotient at 11, parametrisation at 11; a level-22 quotient recovers level 11 | pass |
| `lCoeff_LSeriesSummable`, Lean 142 | K = ℚ, n = 4; ℚ(√17); ℚ(√5); ℚ(√2); s = 7/4, 3/2 | `a₄ = 2 ≤ d(4)√4 = 6`; 17 ≡ 1 (mod 8) so 2 splits: norm-2 coefficient `−2−2=−4`, norm-4 coefficient `2+4+2=8`, majorants `4√2` and `3·2+4·2+3·2=20`; 5 ≡ 5 (mod 8) inert: norm-4 trace `(−2)²−4=0`; ℚ(√2) ramified: `−2`; exponent `σ−1/2` is 5/4 > 1 at 7/4 and 1 at 3/2 | pass |
| Majorant identity, 1884-1889 | σ = 7/4 | `Σ d_K(𝔞)N𝔞^{1/2−σ} = ζ_K(σ−1/2)²` by ordered factorizations; `summable_absNorm_rpow_ideal_iff` needs `1 < s` (`Convergence.lean:82`) | pass |
| Completed function, Lean 150 and 168 | s = 2; s = 1 with w = −1 | multiplier `N/(4π²)` at s = 2 (`Γ(2)=1`); `Λ(1) = −Λ(1)` forces 0 at w = −1 | pass |
| Sign convention, 1948, 1959-1964 | 11a1 | Fricke eigenvalue −1, `w = −ε = +1`, `a₁₁ = 1 = −ε`; rank 0 and nonzero `L(1)` consistent | pass |
| Mellin half-plane, 1950-1954 | weight 2 | ModularForms Layer 7 Euler product for `Re s > k/2+1 = 2`; identity theorem extends to `Re s > 3/2` using summability | pass |
| Real-multiplication boundary, 1984-1989 | `[K:ℚ] = 1, 2` | Tate dimensions 2 and 4; dimension-2 case explicitly outside scope | pass |

**Source sample.** All targets of the worker's seeded sample were read in the fetched texts (`<id> line N` are lines of the sources cache extraction):

| Target | Text and locator opened | Outcome |
| --- | --- | --- |
| Hauptmodul relations | `barrios` lines 250-259: Theorem 2.3 and Table 1, printed p. 6; characteristic 0, `X₀(n)` genus 0, K-rational n-isogeny gives `t ∈ K` with `j(E_i) = j_{n,i}(t)`; rows n = 3, 5 of the second column | supports both relations as stated, including the dual-isogeny reading |
| The 15-isogeny boundary | `ddt` lines 3769-3780: §3.6, Theorem 3.48, printed p. 102 (four noncuspidal rational points of `X₀(15)`, none semistable); `gjlario` lines 2889-2919: §19.1, printed p. 93, j-values and models | supports the four-value conclusion and the model `y²=x³−x²−8x+112` |
| R29.1 (both draws) | `serre` lines 1255-1307: §4.6, Theorem 4, (4.6.1), Lemma 5, (4.6.2)-(4.6.3) on printed p. 207 (PDF page 29); the finite-choice and (4.6.4) on p. 208 (PDF page 30); lines 1272-1277 the conductor criterion for p > 5 | supports finiteness, irreducibility, conductor divisibility and the p > 5 criterion |
| Curve-level residual attachment | `serre` lines 863-887: §3.3, (3.3.1) on printed p. 198 (PDF page 20); `deligneserre` lines 574-582: Lemme 6.11, printed p. 522 (PDF page 17); AlgebraicModularFormsAndSerreWeights §7.5 at its head (one unital coefficient map, semisimplification caveat) | supports the planned predicate and the eigenvalue-only lifting |
| Conductor specialization and comparison | `serre1970` lines 255-278: n° 2.4, cases a), b), c), printed pp. 9-10; `brumerkramer` lines 550-559: §6, (6.1), the tame-plus-Swan exponent, printed p. 243 (PDF page 18 after the cover page); `carayol` lines 85-110: Théorème A §0.7 and Corollaire §0.8, printed pp. 410-411; `ddt` lines 2151-2159: Proposition 2.12, printed p. 57 | supports the conductor formulas and the all-local-factor comparison |
| Exhaustive Γ₀ decomposition | `cremona` lines 1294-1319: §2.7 and Lemma 2.7.1, printed p. 26 (oldclass dimension `d(N/M)`); `ribetstein` line 1820 (§3.6, printed p. 40) and lines 3172-3185 (Conrad, Theorem 5.14 and proof, printed p. 73); `milne` lines 463, 755 (Storrs article) | supports divisor multiplicities, `dim A_f = [K_f:ℚ]` and the Poincaré-complement exactness; R02 fixes the Milne dating |
| Elliptic coefficient summability | `cremona` lines 1228-1243: §2.6, (2.6.1)-(2.6.2), printed p. 25; pinned `hasse_bound` (`HasseBound.lean:65`); ArithmeticDirichletSeries Layer 1 (norm fibres), Layer 2 (convolution), Layer 5.1a (exact trivial abscissa 1) on main | supports the recurrences and the `d_K(𝔞)√N𝔞` majorant |
| Other locators checked | `serre` lines 479-490 (Proposition 4, printed p. 189), 568-575 (Proposition 5, p. 191), 723 ((3.1.6), p. 194), 1334 (Theorem 5, p. 209); `kw` lines 76-78 (Theorem 1.2, p. 2) and 793-799 (Theorem 9.1, pp. 18-19); `cremona` lines 2508-2562 (§2.15.1 p. 47, Proposition 2.15.1 p. 48); `carayol` lines 60-74 (§0.5, p. 410) | all as cited |

Twelve works were readable: `barrios`, `ddt`, `gjlario`, `serre`, `serre1970`, `brumerkramer`, `carayol`, `deligneserre`, `cremona`, `ribetstein`, `milne` (Storrs article; the 2008 course notes were also fetched and do not match the citation), `kw`. The previous review's three source issues were re-read at the same lines and stand.

**Pinned declarations opened** (file and line in the pinned libraries): Mathlib `AlgebraicGeometry/EllipticCurve/LFunction.lean:43, 53, 57, 79, 84` (`localPolynomial` minimises first and has the four branches with `q = Nat.card (ResidueField R)`; `LFunction` is `eulerProduct` over `HeightOneSpectrum (𝓞 K)`; `LSeries`); `Reduction.lean:274, 299, 323, 345, 364` (`IsMinimal`, `minimal`, `HasGoodReduction`, `HasMultiplicativeReduction`, `HasSplitMultiplicativeReduction`); `NumberTheory/ArithmeticFunction/LFunction.lean:260` (`eulerProduct`); `NumberTheory/Padics/HeightOneSpectrum.lean:109, 144, 155, 181` (`primesEquiv`, `adicCompletion.padicEquiv`, `adicCompletionIntegers.padicIntEquiv`, `coe_padicIntEquiv_apply`); `NumberTheory/LSeries/Convolution.lean:163` (`LSeriesSummable.convolution`); `NumberTheory/LSeries/Deriv.lean:160` (`LSeries_analyticOnNhd`); `RingTheory/Norm/Basic.lean:93` (`norm_eq_zero_iff` with `IsDomain`, `Module.Free`, `Module.Finite`); `Algebra/Order/Group/Unbundled/Int.lean:83` (`Int.eq_zero_of_abs_lt_dvd`); `Data/Fintype/Pigeonhole.lean:86` (`Finite.exists_infinite_fiber`); `FieldTheory/AbsoluteGaloisGroup.lean:42` (`absoluteGaloisGroup` is the unfolded `≃ₐ[K]` type used by `GQ`); `NumberTheory/LegendreSymbol/ZModChar.lean:42` (`χ₄`); `NumberTheory/ModularForms/QExpansion.lean:171` (`qExpansion`). Tau Ceti `AlgebraicGeometry/AbelianVariety/Basic.lean:95, 118` (`AbelianVariety` is proper, geometrically integral, a group object; `dim : WithBot ℕ∞`), `End/Basic.lean:83, 168` (`End A = Additive (A ⟶ A)` with its ring instance; morphisms are homomorphisms per `MorphismGroup.lean:14-17`); `EllipticCurve/Affine/Point/Galois.lean:47, 64` (`pointGaloisAction`, `torsionGaloisAction`); `EllipticCurve/TateModule/Galois.lean:71` (`tateModuleGaloisRepresentation : Representation ℤ_[ℓ] (K ≃ₐ[F] K) (TateModule ℓ …)`), `TateModule/Basic.lean:73`, `TateModule/Determinant.lean:52`; `EllipticCurve/HasseBound.lean:65`; `EllipticCurve/MinimalModel/Semistable.lean:90` (`IsSemistable`); `NumberTheory/ModularForms/Newforms/Newform.lean:87-106` (`χ : (ZMod N)ˣ →* ℂˣ`, `toCuspForm`, `isNew`), `OrthogonalBasis.lean:260, 271` (`basis`, `Finite (Newform N k)`), `StrongMultiplicityOne.lean:120` (`eq_of_forall_notMem_eigenvalue_eq`, fixed level), `FullEigenform.lean:33` (`toEigenform`); `NumberTheory/ArithmeticDirichletSeries/NormCoeff.lean:126`, `Convolution.lean:420`, `Convergence.lean:82` (`normCoeff_eq_sum_normFiber`, `normCoeff_convolution`, `summable_absNorm_rpow_ideal_iff ↔ 1 < s`). Absent, as the docstring says: any elliptic or Artin conductor, Serre weight, residual-attachment predicate, `X₀(N)`, `J₀(N)`.

**Cross-roadmap citations resolved** (at the open heads, through the roadmap service, or on main). ModularCurvesPartII §§3.9, 5.6, 7.1-7.4 (`weightTwoRegularDifferentials` in §7.2), 13.1, 16.2-16.7, 17.3 (`abelJacobiInfty`); AlgebraicModularFormsAndSerreWeights §§4.9, 5.10, 6.1-6.2, 7.5; ArithmeticGaloisRepresentations §1.7 (`ContinuousRep.IsAbsolutelyIrreducible`, Burnside form), §§3.1-3.6, 4.1, 5.3, 6.1 (`TateModule.residualRep`, anchor `elliptic-residual-representation`), 6.2, 6.3; NeronModelsAndSemistableAbelianVarieties §§5.3a, 5.3e, 5.3g, 5.3h, 5.3i, 5.5, 6.5, 6.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.6.1; ClassicalSerreModularity §R27.6 with `R27.6/full-classical-serre-theorem` and `R27.6/finite-flat-weight-two-export` (p ≥ 5, finite flat, `det = χ̄_p`, weight 2, level `N(ρ̄)`, trivial character; it names `EllipticCurveModularity:R29.2` as its consumer); SerreWeightAndLevelOptimisation §4.8; AutomorphicGaloisRepresentations §§1.5, 6.1, 6.2, 6.4; FaltingsFinitenessAndIsogenyTheorems §§R28.4.5-R28.4.7, R28.6.1-R28.6.6 (R28.6.6 carries the `End_K(E′) = ℤ` hypothesis this roadmap discharges in R29.1); AbelianSchemesAndArithmeticModuli A4.1, A6.5; on main: EllipticCurves Layers 1, 2, 3, 4, 4.5a, 6, 7, 8 (line 1465, the algorithmic–Artin comparison milestone), ModularForms Layers 1, 3, 4, 5 (cross-level strong multiplicity one, Miyake 4.6.19, line 657), 7, 8G, 10C, ModularCurves Layer 1, JacobianChallenge Layer F, AlgebraicCurves Layers 6 and 12, RepresentationTheory/SemisimpleAlgebras Layer 3, Completed/ArithmeticDirichletSeries Layers 1, 2, 5. The scanner's four Lean-name leads are declarations of this file (`coeff_int`, `localPolynomial_eq`, `exists_entire_completed_LSeries`) or a planned supplier definition (`IsAbsolutelyIrreducible`, ArithmeticGaloisRepresentations line 1111). No citation of a later roadmap: EllipticCurvePeriodsAndModularParametrizations, RankZeroOneBSD and EllipticCurves Layer 7 appear only as consumers.

**Ownership.** Object searches over main and the 434 open heads (`roadmaps grep`) for the 15-isogeny j-values, Hauptmodul relations, the exceptional set, rational endomorphisms, rational Tate span, `IsNewformOf` and the summability theorem found the summability duplicate of R01 and nothing else. Rational Tate surjectivity for an arbitrary surjective homomorphism is stated in no other roadmap (CyclotomicClassGroupsAndStickelberger §4.3 and ModularCurvesPartII §16.3 own only the exactness of the specific quotient `B_f → J₁(N) → A_f`); the README deduces the general statement from A4.1 and A6.5, which is a reasonable owner. The isogeny-boundary roadmaps (EllipticCurveModularityPartII, Wild3Adic) do not own these targets. No `Suggested.lean` elsewhere declares a fully qualified name of this file.

## Not verifiable

- Faltings 1983 (Satz 3-4 p. 360, Korollar 1-2 p. 361): the sources service found no legal copy (Springer DOI paywalled). The statements are consumed through FaltingsFinitenessAndIsogenyTheorems R28.4 and R28.6, whose sections exist and carry the hypotheses; the primary text's page numbers were not re-read.
- Silverman, AEC (III.4-5, III.9, V.1.1, VII.1, VII.5): paywalled, uncertified. The pinned `hasse_bound` and the computed endomorphism and reduction values were checked instead.
- Miyake, Theorem 4.6.19: paywalled. The cross-level statement was checked in ModularForms Layer 5 on main.
- The finite instances above do not prove the universal theorems; the optimal degrees 1, 5, 2 and the level-22/23 cusp-space data are inputs the README itself declares as explicit hypotheses of its Checks.

## Source issues

- **Error** in gjlario at §19.1, printed p. 93 (`gjlario` line 2902): the source says the four noncuspidal rational points of X₀(15) are CM points; they are not CM, since their j-invariants such as −25/2 are not algebraic integers; affects nothing.
- **Misprint** in gjlario at §19.1 signatures table, printed p. 93 (`gjlario` line 2916): the source labels the third column E₇; it should be E₅, matching the graph and models above it; affects nothing.
- **Misprint** in cremona at §2.7, paragraph after Lemma 2.7.1, printed p. 26 (`cremona` line 1317): the source says all members of the oldclass in case (1) share the W_q-eigenvalue; it should say W_l, as the lemma's case (1) is l ≠ q; affects nothing.
