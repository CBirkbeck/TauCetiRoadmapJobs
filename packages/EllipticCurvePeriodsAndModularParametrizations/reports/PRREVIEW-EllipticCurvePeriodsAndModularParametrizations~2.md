# Review of EllipticCurvePeriodsAndModularParametrizations (pull request #1715 at 383e7d0)

**Verdict:** needs changes

## R01 (P1) — The two CM curves are not isomorphic over ℚ(i)

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:1783`: “the two curves are isomorphic over `ℚ(i)`”.

**Claim:** The curves y²=x³+4x and y²=x³−4x become isomorphic over ℚ(i).

**Witness:** An isomorphism between these short equations requires u⁴=−1. Such u is a primitive eighth root of unity; ℚ(i) has only four roots of unity. Thus no such u exists there.

**Repair:** Replace ℚ(i) by ℚ(ζ₈), and retain ℚ(i) as a negative control. For u=ζ₈ the pinned variable-change law gives u⁻⁴·4=−4, while the other short coefficients remain zero. Since |u|=1, the equal covolumes and heights remain correct. Equal j alone gives geometric isomorphism, not isomorphism over the CM field. This repair is tested by those two field instances.

## R02 (P1) — The Vatsal route still consumes unowned deep inputs

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:1408`: “The class group argument combines elliptic-unit characteristic ideals and ℓ-adic unit special values”; also lines 1418 and 1432.

**Claim:** The intermediate targets in §4.10 complete the proof route to the two Vatsal partial results.

**Witness:** vatsal lines 765–770 require Rubin’s characteristic-ideal equality; lines 867–918 require elliptic-unit interpolation and Hida’s almost-all-character unit theorem. None is a target or an exact supplier contract in this roadmap.

**Repair:** Give these inputs their own precise targets or declared contracts with earlier owners, including coefficient rings, conductors, the exceptional finite character set, and possible ℓ-class-group torsion. Do the same for the CM-point reduction surjectivity used at line 1418. Import the cyclic-isogeny classification invoked at line 1432 from `EllipticCurveModularityPartII` §§5.0a–5.0b, rather than leaving it an unnamed premise. List those edges in the individual `*Needs:*` lines and recheck order. A source citation supplies evidence for a mathematical statement, not an owner of its formal proof.

The broader quantifiers matter: K=ℚ(√−23), ℓ=3, p=7 has units {±1}, class number 3, ℓ split, p inert, and gcd(3,p+1)=1. The narrow `RubinTwoVariableMainConjecture` in `NoncommutativeAndEquivariantIwasawa` §4.3 assumes a rational CM elliptic curve and p≥5, and is itself a named hypothesis. It does not supply this instance. A repaired contract must cover the computed class-number-3 case, not replace it by a class-number-one or ℓ≥5 case. Degree 25 must also remain allowed in the imported cyclic classification; the source expressly warns that an étale degree-25 kernel need not be constant. This is the remaining part of previous R03; the congruence and semistable-Manin routes have been substantially repaired.

## R03 (P3) — Finish the source register and exact locators

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:1835`–References, and line 326: “the Euler product in §3.2”.

**Claim:** The references and supplier locators identify the exact supporting text and version for every target.

**Witness:** The folder still has no `sources.toml`. In `Completed/ArithmeticDirichletSeries/README.md:205`, §3.2 treats finite products; the infinite Euler product is §3.3, line 207. Several sampled targets cite only supplier sections.

**Repair:** Add one register entry per work, preserving author-version and published numbering in the same entry, and add exact section/theorem and page locators to the derived targets. Change the infinite-product citation to §3.3; the finite-prime product stays §3.2. Register unavailable editions as uncertified and use the readable cached knowls identified below. This resolves the finite/infinite-product test without assigning a nonexistent theorem to §3.2. The corrected ARS preprint numbering and Milne references already address part of previous R16.

## R04 (P3) — Keep the README-only BSD predicate in prose

**Location:** `TauCetiRoadmap/EllipticCurvePeriodsAndModularParametrizations/README.md:924`: “`WeakBSD W : Prop := ∀ U F (h : IsContinuation W U F), analyticRank W h = finrank ℤ`”.

**Claim:** The backticked own declaration name denotes a declaration in the acceptance file.

**Witness:** The clean 54-declaration signature list contains no WeakBSD. The isolated definition was correctly removed from Suggested.lean in response to previous R15; the corresponding README code span remains.

**Repair:** Render this definition as mathematical prose, as for StrongBSD, without claiming a Lean counterpart. Do not restore an isolated definition that supports no headline theorem. Checking the revised text against the same 54 names then has no nonexistent own declaration at this location.

## Verified sound

This was a full review of all 38 numbered subsections, their API claims and Checks, the worked examples, and all 387 lines of `Suggested.lean`. The existing EllipticCurves and ModularForms roadmaps and completed ArithmeticDirichletSeries roadmap were used as shape/ownership references. The report distinguishes finite-instance tests from proofs and source verification. The supplied gate passes; there are two blocking findings and two P3 findings.

### Previous findings, checked individually

The quotations below are from the repaired head, with README line numbers unless otherwise stated.

| Previous finding | Current passage | Assessment |
|---|---|---|
| R01 reversed ideal divisibility | 1609: “(1) divides (27), while (27) does not divide (1)”; Lean 363–365 has the forward divisibility. | Repaired; j=0, Δ=−27 gives (1)∣(27). |
| R02 lost model defect on base change | 616–618: “the finite factor includes the defect of W”. | Repaired; identity extension of y²=x³+16 gives 2·Ω_min/2=Ω_min. |
| R03 proof by citation | 1408: “The class group argument combines elliptic-unit characteristic ideals and ℓ-adic unit special values”. | Partly repaired; §§4.8–4.9 and the main Stevens argument now have routes. The remaining unowned inputs are R02 above. |
| R04 integral elliptic-point torsion | 976–980: “quotient M_tf = M / torsion(M)” and “its kernel is precisely torsion(M)”. | Repaired; the level-37 ranks below detect why the quotient is necessary. |
| R05 nonexistent period supplier | 40–43: “The conjugation and normalized Eisenstein-sum comparisons … are proved in §1.1 and §1.5 here.” | Repaired; §§1.1, 1.5 own the missing adapters and cite actual uniformization suppliers. |
| R06 undefined fractional-ideal quotient | 1544–1548: “it need not be integral. Choose a nonzero a ∈ 𝔲.” | Repaired; 2ℤ/(2)=0 has cardinality 1; (½ℤ)/ℤ has cardinality 2. |
| R07 exchanged CM exponents | 382: “`u⁴ = 1` when `g₂ ≠ 0`, `u⁶ = 1` when `g₃ ≠ 0`”. | Repaired; i⁴=1 and ζ₆⁶=1. |
| R08 vacuous optimality test | 1023: “existence of a quotient isogeny λ : A_(F_E)⁰ → E of degree 1”. | Repaired; least degrees 1 and 5 distinguish 11a1 and 11a3. |
| R09 positive signed multipliers | 201–204: “nonzero signed integer” and “exactly when \|α_ψ\| = 1”. | Repaired; [−1] has scalar −1 and is étale. |
| R10 module warning | `Suggested.lean:1`: “module”. | Repaired; direct elaboration has only admitted-proof warnings. |
| R11 duplicate convergence target | §3.1: “EllipticCurveModularity R29.6” supplies the convergence input. | Repaired; its all-number-field coefficient theorem was opened, and the duplicate Lean theorem is gone. |
| R12 omitted native isogeny headline | `Suggested.lean:235`: “theorem periodLattice_isogeny”. | Repaired; the actual isogeny, differential pullback, nonzero multiplier, inclusion and degree index occur in the signature. |
| R13 rank-zero regulator missing | 1476–1478: “the analytic Sha corollary additionally assumes Mordell–Weil rank zero”. | Repaired; this activates the pinned Reg=1 theorem. |
| R14 substitute Faltings heights | Lean 24–27: “lack the metrized Arakelov Hodge line” and “No formula-defined height is substituted”. | Repaired; the actual comparison headlines are named, and the formula-only substitutes are gone. |
| R15 padding | Lean 15–18 lists retained lattice/analytic headlines; the four previously identified API declarations and isolated WeakBSD definition are absent. | Repaired; the new 36-theorem tactic probe found no success. |
| R16 incomplete sources | References distinguishes “published Theorem 2.1, author preprint Theorem 2.2” and the Vatsal manuscript pagination. | Partly repaired; register and remaining locator work are R03. |
| R17 shape and Checks | “**Summary.**”, “## Exact supplier contracts”, “## How to read the build”; all five layers end in Examples and Dependencies. | Repaired structurally; the definitions now have API descriptions and at least three local Checks. |
| R18 stale aliases | 450 cites `variableChange_c₄`, `variableChange_c₆`; 333–335 cites GrossZagier §3.9. | Repaired; the actual pinned names and the supplier section resolve. |

No repair report marking a prior finding “not actionable in this package” was supplied. The remaining part of R03 is assessed on its new text, not by repeating the old exclusion-of-proofs complaint.

### Build, binders and acceptance-test coverage

Pins examined: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Direct `lake env lean` on the original file completed successfully. A scratch copy with `#check @name` for every one of the **54 actual declarations** also elaborated. The worker's count of 55 includes a word in a comment. The four suspected dropped binders are intentional generality: localPeriod needs a specified infinite place, jDenominatorIdeal needs a field and ellipticity, and the continuation-dependent rank/coefficient definitions do not need ellipticity. README Conventions says this explicitly. The nonvanishing and finiteness theorems retain ellipticity. No signature was changed.

All **36 admitted theorem bodies** were tried on a scratch copy with each of `simp`, `rfl`, and `infer_instance`; none closed. The probe produced 36 failed goals, including one instance-synthesis diagnostic, not a syntax failure. Reading the definitions and pinned lemmas found no additional one-library-lemma restatement. The admitted theorems are propositions about the roadmap's actual objects, not free-scalar stand-ins. The real-body instances are needed by the retained lattice definitions.

Headline inventory: normalized equation-period lattice existence/uniqueness and differential identification; real shape; local/global periods and model/base-change laws; isogeny lattice inclusion/index; nonvanishing and compatible continuation; finite, real, continuation-independent leading term; BSD period/regulator comparison; integral newform periods and optimal quotients; Manin constants, modular degree, Petersson and congruence formulas, semistable Manin theorem; Stevens' minimal curve and the stated partial conjecture results; rank-zero period rationality; relative/stable Faltings-height comparisons, isogeny change and Faltings ratio. Native lattice, analytic, isogeny, Stevens and ratio statements are present. The docstring names the unavailable modular-geometric, Tamagawa-product and metrized-Hodge-line carriers. No additional statable missing headline was established. Manin's and Stevens' full conjectures remain statements, not claimed proved theorems.

No sorry-defined data, `set_option`, admitted example, foreign roadmap import, algorithm target, copied source passage, or change outside this folder was established. The only diff outside the reviewed folder is empty. The checkout remained clean at the requested head. The distinct equation-period/invariant bridge does not re-plan an existing roadmap, so its repairable defects warrant changes rather than rejection.

The worker's gate output is:

```text
gate EllipticCurvePeriodsAndModularParametrizations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The independently run prescribed dependency command returned:

```text
depcheck: 204 roadmaps, 1545 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Every `*Needs:*` line and supplier contract was read. This passing graph cannot account for premises with no owner, as in R02.

### Pinned declarations and resolved ownership

These are repository-relative library paths, at the pins above. A listed family was read, including its hypotheses; merely finding a name was not treated as verification.

| Object | Pinned file and lines examined | What this establishes |
|---|---|---|
| PeriodPair | `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean:59`, 78–80, 117–155 | Two real-linearly-independent periods; integral span, discrete/full lattice and basis. The structure does **not** impose positive orientation. |
| Eisenstein invariants | Same file:944, 956–959, 1074 | G is the lattice sum; g₂=60G₄ and g₃=140G₆. The differential equation excludes lattice poles. |
| Covolume | `Mathlib/Algebra/Module/ZLattice/Covolume.lean:98`, 102, 125, 170 | Positivity for full discrete lattices, measure-preserving transport, determinant and index. Index is covol(smaller subgroup)/covol(larger subgroup). |
| Variable changes | `Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:210`, 214, 218, 246 | c₄, c₆, Δ scale by u⁻⁴,u⁻⁶,u⁻¹²; j is invariant. |
| Euler coefficients | `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43`, 53, 57, 79, 84 | Minimal local equations; all four reduction factors; ideal Euler product and literal tsum. No continuation is built into LSeries. |
| Infinite places | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:108`, 240–244, 370, 474 | Conjugate embeddings define one place; real embedding and norm/signature multiplicities. |
| Heights | `Mathlib/NumberTheory/Height/NumberField.lean:111`, 140–145 | Relative product height versus degree-normalized absolute height. |
| Denominator ideal | `Mathlib/RingTheory/Ideal/Colon.lean:35`, 45–48 | Colon is an integrality condition, not the denominator's inverse. At j=0 it is the unit ideal. |
| Minimal discriminant | `TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/DiscriminantIdeal.lean:157`, 164, 235 | Actual finite-support ideal; model invariance; span of a global minimal discriminant. The span iff also requires integrality. |
| Reduced model | `TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/Reduced.lean` and `GlobalMinimalModel.lean` | Native reduced model and its uniqueness are reused; no new reduced-model carrier. |
| Isogeny differential/degree | `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean:94`, `Differential.lean:69`, 153; `Isogeny/Hom/Differential.lean:198` | Degree of the actual finite isogeny; pullback scalar; negation and multiplication signs. |
| Invariant differential | `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/InvariantDifferential.lean:156` | Unique scalar multiple of the native differential; this ties α to ψ. |
| Pairing/regulator | `TauCeti/AlgebraicGeometry/EllipticCurve/CanonicalHeight/Basic.lean:368`, 378; `MordellWeil/Regulator.lean:91`, 95, 104 | Halved polar pairing, absolute Gram determinant, empty determinant 1; finite-module hypotheses are explicit. |

The entire pinned trees were also searched for the claimed missing Faltings-height and arithmetic Tamagawa-product definitions. No native definition supplying the omitted acceptance headlines was found. The resolver's 11 leads are ten knowl identifiers and the explicitly future `AbelianVariety.faltingsHeight`, not eleven missing Lean suppliers.

Ownership was searched by objects using `roadmaps grep` across main/open heads, then the matching texts were opened with `roadmaps show`; the board packages were separately searched for periods, Stevens, elliptic units and the relevant comparisons. No second owner of this equation-indexed period library was found. The following supplier contracts were resolved; open-head copies were used for new folders, and main for existing folders.

| Supplier | Resolved sections / file witnesses | Boundary checked |
|---|---|---|
| EllipticCurves | README Layers 1–2, 4.5a–b, 6–7; particularly lines 1262–1342 | Native arithmetic, relative height/regulator; explicit integral real period and Cassels/BSD over ℚ. The general-number-field period is expressly left to a complex-analytic successor. |
| ModularForms | README Layers 3, 4, 7, 8, 10B | Petersson measure, newforms, Mellin transform, native symbols and compact-curve homology. |
| ModularCurvesPartII | README §§1.1–1.4, lines 393–486; §§7.2, 7.5–7.6; §§14.12, 14.15; §§16.2, 16.5 | Normalized lattice cubic, differential-preserving uniformization, lattice isogenies; rational Hecke pairing and geometric realization. The all-level integral elliptic-stabilizer adapter is new here. |
| EllipticCurveModularity | README R29.3–R29.6; “Elliptic coefficient summability”, lines 1860–1923; continuation at 1926 onward | Newform and quotient attachment; all-prime, all-number-field convergence already owned there; ℚ continuation. |
| ModularSymbolsPadicLFunctions | README §§0.4, 0.8, 1.2, notably lines 1231–1266 | Boundary and rational Drinfeld–Manin projector; Mellin values. Projection to period functionals must not be confused with equality in relative homology. |
| ArakelovGeometryAndAbelianHeights | README §§2.1–2.3, 2.7, 2.9, 3.1, 3.4 | Hodge metric and native relative/stable heights; the present work supplies equation-lattice formulas for them. |
| GrossZagierAndArithmeticHeights | README §§3.1, 3.5, 3.7–3.10; §3.9 begins at line 1083 | Integral differential geometry including small-prime bounds; signed cφ and its existing divisibilities; Petersson identity. No second proof of those results is planned here. |
| PeriodsAndSpecialValues | README PS.1.1, PS.1.7–PS.1.8, PS.3.3; lines 403, 618, 847 | Geometric Frobenius on H¹, ker-monodromy local factor, finite function and supplied germ; the adapter to native elliptic LSeries is distinct. |
| ArithmeticDirichletSeries | `Completed/ArithmeticDirichletSeries/README.md:148`, 193–209 | Norm fibres and EulerProductData, with infinite product in §3.3. The scalar bounds on elliptic coefficients are not attributed here. |
| FaltingsFinitenessAndIsogenyTheorems | README R28.6.5–R28.6.6 | Finite rational isogeny class and infinite-cyclic Hom used for least-degree maps. |
| NeronModelsAndSemistableAbelianVarieties | README R11.1 / §§1.1–1.11, especially 786–842 | Marked mapping property, extension of homomorphisms and differential lattice. Does not assert every bad-prime kernel is finite flat. |
| EllipticCurveModularityPartII | README §5.0b:537–546 | Existing owner of the full rational cyclic degree list; this is the missing named edge in R02. |

ComplexTori and EllipticIntegrals occur as exclusions, not as a new request to build their theories. Searches of the supplied open work also distinguished generic periods in PeriodsAndSpecialValues, height/isogeny bounds in FaltingsFinitenessAndIsogenyTheoremsPartII, and elliptic-unit plans from the present equation-lattice construction. The narrow Rubin hypothesis discussed in R02 cannot be silently promoted to a proved, general supplier. No declaration here was found with a fully qualified name colliding with a readable sibling roadmap.

### Seeded source sample

All 15 requested targets were examined. There is no additional explicit “unverified” locator flag in the README. Legal sources were requested through the source service; eight readable older knowl extractions were subsequently found in its cache when live pages returned CAPTCHA. A derived identity is reported as a derivation, not as a verbatim theorem in a source. The register IDs below match the fetch IDs (knowl IDs are their own keys).

| Seeded target | Text/locator read | Conclusion |
|---|---|---|
| 1.2 discriminant/j/model | cremona lines 2388–2420, §2.14 p.45; milne-mf Proposition 4.18 p.55, lines 2576 onward; pinned coefficient identities | c₄=12g₂, c₆=216g₃ give Δ=g₂³−27g₃² and j=1728g₂³/Δ. Ellipticity excludes zero denominator. |
| 1.3 scaling | ModularCurvesPartII §1.3, Milne §3; native variableChange identities; ec.q.period_lattice line 100 | Homothety exponents and covolume factor agree. The exact equation adapter is derived here. |
| 1.4 integration | ec.q.period_lattice line 90; ModularCurvesPartII §1.4; Milne Proposition 3.12 p.47 | The normalization dx/(2y)=dz, rather than dx/y, is essential. Silverman VI.5.1 itself remains uncertified. |
| 1.5 conjugation | Milne Proposition 3.10 p.45, lines 2083–2109, absolute lattice sums; pinned G and the explicit §1.1 argument | Termwise conjugation and reindexing prove the adapter. The roadmap lacks a direct locator attached to this derived subsection, covered by R03. |
| 2.5 global period | ec.period lines 90–114 | Arbitrary-equation defect factor exactly matches. The corrected base-change extension is an algebraic consequence, not a quotation from the knowl. |
| 3.1 convergence | EllipticCurveModularity R29.6 lines 1860–1923; native local factors | Correct earlier owner and all-number-field scope, including residue characteristics 2 and 3. |
| 3.3 continuation | cremona §2.8, pp.29–30, lines 1455–1517; EllipticCurveModularity R29.6 | Entire continuation over ℚ; the general-K assertion is a hypothesis. The convex-domain refinement is the author's definition. |
| 3.4 order/coefficient | ec.special_value line 90; PeriodsAndSpecialValues PS.3.3; native analytic order | Factorial and arithmetic center agree. Independence follows on the convex intersection; finiteness uses nonvanishing on the half-plane. |
| 3.5 regulator/torsion | ec.regulator lines 90–104; pinned pairing/regulator; EllipticCurves Layer 6 | Reg_NT=d^r Reg, and rank zero gives 1. Silverman VIII.9's printed text was unavailable; no contrary normalization was imported from it. |
| 3.7 conjectures | ec.bsdconjecture lines 90–116; ec.q.bsdconjecture lines 90–107 | Rank equality, √discriminant denominator and finite Sha match. Universal continuation assertions are explicitly conditional; they do not prove existence over arbitrary K. |
| 4.5 non-optimal Manin constant | vatsal Remark 1.8, lines 193–203; integral scalar discussion lines 118–130; native pullback law | Composition multiplies the scalar. The minimal isogeny must be specified; its sign disappears only after absolute value. The particular LMFDB knowl remains unavailable. |
| 4.9 divisibilities | ars-manin Theorems 2.3–2.7, p.619, lines 91–115; cesnavicius v3 Proposition 2.2, Lemmas 2.9–2.10, Theorem 2.11, pp.4–8, lines 140–321; abbes-ullmo Theorem A | Optimality and local conductor hypotheses retained. Česnavičius supplies the p=2 case as well. Mazur original and Manin original remain uncertified/unavailable as below. |
| 5.1 rational Faltings height | faltings §3 p.354, lines 193–219, also inspected page image; Arakelov §§2.9, 3.1 | The metric is (i/2)∫ω∧ω̄ in dimension one, hence area. For a minimal ℚ differential the finite index is 1. Relative extension to nonsemistable curves comes from the named Arakelov supplier. |
| 5.3 stable height | Arakelov §3.4; elliptic reduction identities; ec.q.faltings_height inaccessible | Derivation via 𝔧_L=𝔇_L after semistable extension and norms was checked. Direct certification of the cited knowl is unavailable. |
| 5.6 Petersson height | cremona Proposition 2.15.1 p.48, lines 2555–2568; GrossZagier §3.9; Faltings metric above | Taking logs of mA=4π²c²‖f‖² gives the exact claimed formula. All logarithms have positive arguments. |

### Adversarial mathematics table

Exact values are written exactly; decimal values recompute the displayed inputs and are not independent certifications of database records. R denotes the lattice with basis (2,3i), H the lattice with basis (2,1+3i), and A a positive minimal covolume. Each row states the quantity computed and the claimed comparison; related API clauses are separated when their tests differ. The 138 rows represent every numbered target, every acceptance headline and both mathematical findings.

| Statement / target | Instances tried | Computed left side or output | Computed right side or control | Result / change |
|---|---|---|---|---|
| Differential convention | y²=x³−x; use dx/y instead | dx/(2y) pulls back to dz | dx/y pulls back to 2dz | Correct factor 2 exclusion. |
| Short-model u=1 change | 11a1, a₁=0,a₂=−1,a₃=1 | r=1/3,s=0,t=−1/2; a₂′=a₃′=0 | a₄′=−31/3,a₆′=−2501/108 | Normalization preserves the differential. |
| 1.1 existence / g₂ | y²=x³−x | c₄/12=48/12=4 | square lattice normalized to g₂=4 | Nonzero invariant fixes scale. |
| 1.1 existence / g₃ | y²+y=x³ | c₆/216=−216/216=−1 | g₂=0,g₃=−1, Δ=−27 | Nonzero discriminant; hexagonal case retained. |
| 1.1 uniqueness, square CM | g₃=0, u=i | u⁴=1 | u⁶=−1; iΛ=Λ | Repaired exponent is necessary. |
| 1.1 uniqueness, hexagonal CM | g₂=0, u=ζ₆ | u⁶=1 | u⁴=ζ₃²≠1; ζ₆Λ=Λ | Repaired exponent is necessary. |
| 1.1 generic uniqueness | g₂g₃≠0 | u⁴=u⁶=1 implies u²=1 | u=±1 both fix Λ | No extra scaled lattice. |
| 1.1 ellipticity guard | proposed g₂=3,g₃=1 | 3³−27·1²=0 | elliptic discriminant must be nonzero | Input excluded, not an epsilon witness. |
| 1.1 discrete/full instances | basis (1,i); zero subgroup | real determinant 1; rank 2 | zero subgroup rank 0 | PeriodPair prevents zero-lattice substitution. |
| 1.1 normalized Eisenstein dictionary | ω₁=1, τ=i | E₆(i)=0, g₃=0 | g₂³−27g₃²=(2π)¹²Δ(i) | Correct g₂ weight 4, g₃ weight 6. |
| 1.2 discriminant | y²=x³−x | g₂³−27g₃²=4³=64 | −16(4(−1)³)=64 | Equal. |
| 1.2 discriminant, non-CM | 11a1 | (124/3)³−27(2501/27)²=−161051 | −11⁵=−161051 | Equal, including sign. |
| 1.2 j formula | square / hexagonal normalized models | 1728·64/64=1728; 0/(−27)=0 | j=1728; j=0 | Denominators nonzero. |
| 1.2 equation↔lattice | normalized short model of 11a1 | c₄=496,c₆=20008,Δ=−161051 | original model has same three invariants and u=1 | Correct differential-marked adapter. |
| 1.3 scale definition / composition | R, c=2 then c=3 | basis (12,18i) | scaling by 6 gives (12,18i) | Equal images. |
| 1.3 zero and identity scaling | R, c=0,1,−1 | 0; R; R | rank 0; rank 2; rank 2 | Full-lattice theorem excludes zero. |
| 1.3 model scaling headline | g₂=4,g₃=0,u=2 | new g₂=1/4, Δ=1/64 | 2⁻⁴·4=1/4; 2⁻¹²·64=1/64 | Correct inverse invariant powers. |
| 1.3 covolume headline | R, u=2 and u=i | areas 24 and 6 | 4·6=24; 1·6=6 | Correct absolute-square factor. |
| 1.4 integration image | torus ℂ/R, generators of H₁ | ∫dz=2 and 3i | image=2ℤ+3iℤ | Actual differential gives precisely R. |
| 1.5 conjugation membership | R, z=3i and z=i | 3i∈R true; i∈R false | −3i∈R true; −i∈R false | Both directions tested. |
| 1.5 conjugation area | H and its conjugate | signed determinants 6 and −6 | covolumes 6 and 6 | Absolute area required. |
| 1.5 involution | coefficient 1+i | conjugate 1−i, twice 1+i | original 1+i | Not coefficientwise identity. |
| 1.6 least real period definition | R; H; zero subgroup | infima 2,2,0 | minima 2,2; empty positive set for zero | Totalized junk distinguished. |
| 1.6 positivity / attainment | R and H | least positive=2>0 and 2 belongs | 1 fails membership in either real intersection | Positive attained generator, not arbitrary positive bound. |
| 1.6 component-count total function | Δ=64,−27,0 | 2,1,1 | geometric counts 2,1; singular case excluded | No singular geometry inferred. |
| 1.6 rectangular headline | R | basis (2,3i), least period 2 | Δ>0 shape; Ω=2·2=4 | Correct real component factor. |
| 1.6 rhombic headline | H | basis (2,1+3i), least period 2 | Δ<0 shape; Ω=1·2=2 | A half real period is not in H. |
| 1.6 real integral comparison | y²=x³−x | D(x)=4x³−4x | two branches give 2∫(D>0) dx/√D | The branch multiplicity is 2, not 1. |
| 2.1 embeddings | ℚ(i), i sent to ±i | conjugate equations | one infinite place with multiplicity 2 | No two-place double counting. |
| 2.2 local real period | R; H | 4;2 | components×least=2·2;1·2 | Positive and distinct from area. |
| 2.2 real scaling | R, u=−2 | Ω′=8 | \|−2\|·4=8; signed product −8 fails | Absolute value is essential. |
| 2.3 complex local period | R | ∫dz∧d z̄=−12i; absolute value 12 | 2·covol=12 | Corrects the knowl's unnormalized wedge display. |
| 2.3 complex scaling | R, u=1+i | new area 12, Ω′=24 | \|1+i\|²·12=24 | Degree-two archimedean weight. |
| 2.4 product scaling | ℚ(√5), u=2 | two real factors each ×2, product ×4 | \|Norm(2)\|=4 | Placewise factor 2 differs from global 4. |
| 2.4 mixed conjugation/norm | ℚ(i), u=1+i | single complex factor ×2 | Norm(1+i)=2 | Counts a conjugate pair once. |
| 2.5 definition / positivity | globally minimal equation | discriminant ratio 1, prefactor 1 | product of positive local periods >0 | No norm-zero or 0/0 input. |
| 2.5 model invariance | y²=x³+16 vs 27a3 | defect=4096, root=2, local=Ω_min/2 | 2·Ω_min/2=Ω_min | Repaired nonminimal case. |
| 2.5 opposite nonintegral scaling | minimal equation, u=2 | defect=2⁻¹², root=1/2; local=2Ω_min | (1/2)·2Ω_min=Ω_min | No unjustified prefactor≥1 for nonintegral models. |
| 2.5 globally minimal theorem | 11a1 over ℚ | \|Δ\|=N𝔇=11⁵ | global Ω=local Ω=1.2692093 | Prefactor 1. |
| 2.5 semi-global defect | exceptional norm 3, exponent k=2 | norm ratio=3²⁴ | twelfth root=9=3² | Correct exponent. |
| 2.5 identity base change | y²=x³+16, L=K=ℚ | (4096)^(1/12)·Ω_min/2 | Ω_min | Old counterexample now passes. |
| 2.5 real→complex base change | 11a1 to ℚ(i) | 2A=3.7030872 | Ω_ℚ²≈1.61089225 | Formula uses area, not real-period square. |
| 2.5 real quadratic base change | 11a1 to ℚ(√5) | 1.2692093²≈1.61089225 | two real local factors, defect 1 | Correct archimedean splitting. |
| 2.6 Néron-lattice definition | 27a3 and y²=x³+16 | reduced model the same, area A in both | raw second equation area A/4 | Native reduced model is necessary. |
| 2.6 minimal equation independence | two minimal equations, u=−1 | −Λ=Λ | same Néron lattice | Sign ambiguity harmless. |
| 2.6 globalPeriod_eq_neronLattice | 11a1; 37a1 | 1·1.2692093; 2·2.9934586 | Ω≈1.2692093;5.9869172 | Correct component factors. |
| 2.7 actual isogeny identity | [1] | α=1, index=1 | degree=1 | Actual map and differential agree. |
| 2.7 actual isogeny negation | [−1] | α=−1, −Λ=Λ, index=1 | degree=1; \|α\|=1 | Étale criterion uses absolute scalar. |
| 2.7 multiplication isogeny | [2] | α=2, [Λ:2Λ]=4 | degree=4 | Multiplier is not degree. |
| 2.7 duality | 11a1→11a2, degree 5 | α=1, dual α̂=5 | αα̂=5=degree | Correct signed composition law. |
| 2.7 covolume relation | degree 5, α=1, source area A | target area A/5 | \|1\|²A/5 | Correct inclusion/index direction. |
| 2.7 multiplier model dependence | rescale target equation by 2 | raw pullback scalar ×2 | Néron absolute multiplier still 1 | Raw and Néron scalars distinguished. |
| 3.1 convergence input | ℚ, 11a1, n=0,1,2,4 | coefficients 0,1,−2,2 | \|a₄\|=2≤3√4=6 | Uses the earlier owner's theorem. |
| 3.1 norm-fibre coefficients | ℚ(√17), n=4 | 2+4+2=8 | ideal majorant 20; rational bound 6 fails | General number field retained. |
| 3.1 inert / ramified controls | 2 in ℚ(√5) / ℚ(√2) | norm-2 coefficient 0 / −2 | inert norm-4 trace (−2)²−4=0 | Does not assume split primes. |
| 3.1 convergence boundary | s=7/4; s=3/2 | majorant exponents 5/4;1 | ζ_K(5/4) finite; ζ_K(1) divergent | Strict >3/2 retained. |
| 3.2 good Euler denominator | 11a1, p=2,s=2,T=1/4 | 1+2T+2T²=13/8 | reciprocal 8/13>0 | No zero factor. |
| 3.2 bad Euler factors | split/nonsplit/additive, T=1/4 | denominators 3/4,5/4,1 | reciprocals 4/3,4/5,1 | All reduction types kept. |
| 3.2 finite-motivic comparison | good trace −2,q=2; Steinberg | det polynomial 1+2T+2T²; degree-one 1∓T | native good/multiplicative polynomials | H¹ geometric convention agrees. |
| 3.3 continuation carrier | disk \|s−1\|<1/4 | 1 belongs; s=2 does not | half-plane inclusion false | Rejects unrelated local germs. |
| 3.3 continuation carrier | half-plane Re s>3/2 | half-plane inclusion true; 1 does not belong | one_mem false | Rejects using tsum at center. |
| 3.3 ℚ existence headline | entire modular continuation | U=ℂ contains 1 and 2 | open=true, convex=true; agreement on half-plane | Supplies a genuine nonvacuity witness. |
| 3.4 analytic rank | local model 3(s−1)² | order=2, toNat=2 | zero germ order=∞, toNat=0 | Nonzero-order theorem excludes the misleading junk value. |
| 3.4 coefficient / nonzero | same germ | second derivative=6; 6/2!=3 | first nonzero Taylor coefficient=3≠0 | Factorial is load-bearing. |
| 3.4 real coefficient | same real germ | Im(3)=0 | germ i(s−1)² would give Im=1 | Reality needs actual L-series agreement. |
| 3.4 independence of rank | restrictions of same germ to two convex domains | orders 2 and 2 | intersection contains 1 and half-plane | Correct identity-theorem domain. |
| 3.4 independence of coefficient | restrictions above | 6/2=3 on each | same Taylor germ gives 3 | Equal, not merely proportional. |
| 3.5 regulator rank zero | free module rank 0 | determinant of 0×0 matrix=1 | d⁰·1=1 | Empty determinant convention preserved. |
| 3.5 regulator rank one | d=2, relative Gram [6] | Reg_NT=6 | normalized Reg=3; 2¹·3=6 | Relative/absolute distinction. |
| 3.5 regulator rank two | d=2, normalized Gram diag(2,3) | relative Gram diag(4,6), det=24 | 2²·6=24 | Power d^r, not d. |
| 3.5 torsion order | trivial torsion; 11a1 | Nat.card=1;5 | denominators 1²=1;5²=25 | Trivial group has order 1, not 0. |
| 3.6 BSD factor | 11a1 | Ω·1·5/25=Ω/5 | L=Ω/5 | Analytic Sha=1. |
| 3.6 field discriminant factor | degree-two field D=5 | √\|D\|=√5≈2.23606798 | neither 1 nor 5 | Correct normalization. |
| 3.6 sign is not a theorem | abstract positive BSD factor B, real coefficient −B | quotient=−√\|D\| | still a real number | Definition asserts no positivity or integrality. |
| 3.7 weak BSD predicate | 11a1;37a1 | rank equalities 0=0;1=1 | with no continuation universal condition=true | Conditional status expressly recorded. |
| 3.7 strong BSD predicate | rank 0, finite Sha order 1 | asks analytic quotient=1 | quotient 2 would fail although nonzero | Exact equality, not mere finiteness. |
| 3.7 isogeny invariance over ℚ | 11a1,11a2,11a3 | all analytic ranks 0; equal L-function | BSD arithmetic quotients Ω₁/5 in each | Imported Cassels scope, not new general-K theorem. |
| 4.1 native symbol direction | {α,β} | path β→α, boundary [α]−[β] | reverse path has negative boundary and period | Source/target and sign fixed. |
| 4.1 integral comparison | level 37, 38 generators | relation ranks mod 101,2,3:33,32,32 | quotient dimensions 5,6,6 | Raw torsion cannot be ignored. |
| 4.1 torsion-free/cuspidal comparison | level 37 | relative rank 5; boundary rank 1 | absolute rank 4=2g, g=2 | Revised quotient has correct ranks. |
| 4.1 periods kill torsion | x of order 2 or 3, target ℂ additive | 2P(x)=0 or 3P(x)=0 implies P(x)=0 | ℂ has no nonzero such torsion | Integral image unchanged by quotient. |
| 4.1 newform lattice | 11a newform | basis (1.2692093,0.6346047+1.4588166i) | area≈1.8515436=area of optimal curve | Consistent with c=1. |
| 4.2 X₀-optimal definition | 11a1;11a3 | least quotient degrees 1;5 | existence of degree 1 true;false | Removes empty-universal vacuity. |
| 4.2 specified homology criterion | optimal φ followed by [2] | image index 4 | degree λ=4≠1 | Target curve optimal does not make every map optimal. |
| 4.2 universal factorization criterion | identity quotient vs degree-5 quotient | identity cannot factor nontrivially; latter factors with deg ψ=5 | 1 versus 5 | Correct existential parametrization. |
| 4.3 Γ₁-optimality | 11a3;11a1 | Γ₁-optimal flags true;false | X₀-optimal flags false;true | Distinct optimal objects. |
| 4.3 Shimura quotient | class 11a | degree E₀→E₁=5 | reverse étale map E₁→E₀ degree 5 | μ₅ versus constant dual kernel distinguished. |
| 4.4 absolute Manin constant | φ and −φ with cφ=1 | signed scalars 1 and −1 | absolute constants both 1 | Fixed sign is not asserted for every map. |
| 4.4 lattice/covolume law | c=1 and hypothetical c=2 | Λ_E=cΛ_f; area ratios 1 and 4 | c²=1 and 4 | Detects missing square. |
| 4.5 non-optimal constant | 11a1→11a2;11a1→11a3 | (d,α)=(5,1);(5,5) | constants 1;5, both integral | Constant differs from degree in first case. |
| 4.5 least-isogeny dependence | ψ vs [2]∘ψ, degree d | degrees d and 4d | scalars α and 2α | Least map required for curve invariant. |
| 4.6 modular degree | class 11a | optimal degree 1; other minima 5 | further [n] composition gives n²,5n² | Exact minimality formula. |
| 4.7 Petersson formula | 11a1, m=c=1 | mA=1.8515436 | 4π²·0.04690014728≈1.8515436 | Constants agree. |
| 4.7 Petersson formula | 37a1,m=2,c=1 | mA=14.6762654 | 4π²·0.37175414544≈14.6762654 | Degree factor retained. |
| 4.8 integral cusp forms | rational newform f and f/2 | a₁(f)=1∈ℤ | a₁(f/2)=1/2∉ℤ | Integral lattice is not all rational forms. |
| 4.8 congruence modulus | level 11, dim S₂=1 | orthogonal complement 0, a₁(f)=1 | only r=1; modular degree 1 | Boundary case yields r=1, not 0. |
| 4.8 divisibility | 54b1 | m=2,r=6; r/m=3 | m∣r true; r∣m false | Correct direction. |
| 4.8 local equality hypothesis | 54b1, p=2 and p=3 | v₂(m)=v₂(r)=1; v₃(m)=0,v₃(r)=1 | 4∤54;9∣54 | Exception occurs exactly outside the stated hypothesis. |
| 4.8 homology congruence group | m=2 | (ℤ/2)² has cardinality 4 | m²=4, not m=2 | Rank-two comparison cannot drop a copy. |
| 4.9 Mazur/ARS bounds | N=11,c=1; nonoptimal 11a3,c=5 | v_p(c)=0 optimal; 5∣c nonoptimal | 25∤44 and 25∤11 | Optimality excludes nonoptimal counterexample. |
| 4.9 local p-unit, including 2 | optimal semistable curve; p=2 | v₂(c)=0 | 2²∤N gives unit condition | Source theorem includes 2; no odd-only shortcut. |
| 4.9 semistable global theorem | conductor 11 | every v_p(N)≤1, c=1 | all v_p(c)=0 | Product of local unit statements. |
| 4.9 covolume criterion | c=1,2,3; A_E=c²A_f | A_f>A_E/4: true,false,false | 1>1/4;1>1;1>9/4 | Strict inequality and c∈ℤ>0 required. |
| 4.10 Stevens existence/lattice | class 11a, E_min=11a3 | A_min≈9.257718; indices to 11a1,11a2 are 5,25 | smaller subgroup has larger covolume | Consistent lattice/height direction. |
| 4.10 reduced-model/class invariance | start at any of 11a1,11a2,11a3 | selected reduced curve 11a3 | same isogeny class, ratio at 11a3=1 | Headline epsilon properties are genuine existence goals. |
| 4.10 local factorization control | [2] | kernel (ℤ/2)², degree 4 | cyclicity=false | Cannot apply cyclic-kernel step to every isogeny. |
| 4.10 maximality argument | hypothetical dual-étale factor degree d=2 | intermediate area=2A_max | maximality would require 2A_max≤A_max | Positive area excludes nontrivial factor. |
| 4.10 Vatsal class-field input | K=ℚ(√−23),ℓ=3,p=7 | h_K=3; (−23/3)=1; (−23/7)=−1; gcd(3,8)=1 | hypothesis accepts this field; ℓ≥5/class-number-one input rejects it | R02: contract must cover it. |
| 4.10 characteristic-ideal input | Λ=ℤ₃[[T]], modules Λ/(3),Λ/(T) | both torsion; characteristic ideals (3),(T) differ | neither equality nor unit generator follows from torsion alone | R02: missing equality/unit theorem is substantive. |
| 4.10 Ihara splitting target | degree d cover, a quadratic point over 𝔽_q² in a fibre | only d−2 points rational over 𝔽_q², plus one degree-2 point | required d distinct 𝔽_q²-points | Splitting hypothesis is stronger than étaleness. |
| 4.10 cyclic degree classification | degree 25; degree 49 | 25 in {1,…,19,21,25,27,37,43,67,163};49 not | prime-degree list alone decides neither composite case | R02: import full earlier theorem. |
| 4.10 Vatsal partial hypotheses | ℓ=7 ordinary reducible vs ℓ=3 | ℓ≥7 true vs false | theorem 1.11 only the first; no full Stevens conjecture deduced | Correct scope in stated endpoint. |
| 4.11 intrinsic invariants | 11a1 and 11a3 | (X₀,Γ₁,m,c)=(true,false,1,1);(false,true,5,5) | distinct predicates and integers | No claim about an arbitrary ordering of labels. |
| 4.12 rationality | 11a1 | L/Ω=1/5 | q=1/5∈ℚ | Correct rank-zero headline. |
| 4.12 analytic-Sha corollary | analytic and algebraic ranks both 0 | Reg=1; (1/5)·25/5=1 | rational Sha quotient 1 | Additional algebraic-rank assumption now explicit. |
| 4.12 homology convention | {0,∞} on X₀(11) | relative boundary [0]−[∞]≠0 | period functional has 5L=Ω | Read rational-cycle assertion after period projection, as in Cremona; it is not equality in relative homology. |
| 5.1 native height | 11a1,A=1.8515436 | −½log A=−0.3080098348 | displayed h≈−0.3080098 | Correct Faltings normalization. |
| 5.2 arbitrary equation | 27a3 rescaled to y²=x³+16 | −log2−½log(A/4) | −½log A | Exact cancellation. |
| 5.2 fractional Hodge ideal | 𝔲=2ℤ,a=2 | #(𝔲/(a))=1, finite log=0 | norm² scales by 4 | No undefined quotient 2ℤ/ℤ. |
| 5.2 opposite fractional Hodge ideal | 𝔲=½ℤ,a=1 | index=2, log index=log2 | log\|a\|−log N𝔲=0−log(1/2) | Finite term has correct sign. |
| 5.2 model invariance over K | degree d, u=2 | discriminant contribution +d log2 | archimedean contribution −d log2 | Sum 0 before division by d. |
| 5.2 modular-discriminant dictionary | Λ=ω₁(ℤ+τℤ) | Δ_W A⁶=(2π)¹²Δ(τ)(Im τ)⁶ | log terms differ by 12log(2π) | Cancels supplier's −12log(2π). |
| 5.3 denominator ideal definition | j=0,1728,1/2 | ideals (1),(1),(2) | a·0 and a·1728 integral for all a; a/2 integral iff 2∣a | Unit ideal, not zero ideal. |
| 5.3 divisibility headline | y²+y=x³ | 𝔧=(1),𝔇=(27) | (1)∣(27) true; reverse false | Repaired Lean direction. |
| 5.3 stable correction | 27a3 | h_st−h=−log27/12≈−0.2746530722 | −1.3211174306−(−1.0464643585) | Correct sign and denominator. |
| 5.3 semistability iff equality | multiplicative vΔ=5,vc₄=0; additive j=0 | denominator exponents 5;0 | discriminant exponents 5;3 | Equality in first, strict drop in second. |
| 5.3 geometric-j invariance | 27a1 and27a3 | −½log2.7028761−9log3/12≈−1.32111743 | −½log8.1086283−3log3/12≈−1.32111743 | Equal stable heights despite unequal relative heights. |
| 5.4 isogeny height change | [2],d=4,α=2 | ½log4−log2=0 | self-height difference 0 | Degree term and scalar cancel. |
| 5.4 opposite degree-5 maps | α=1;α=5 | +½log5≈0.804718956;−½log5 | area ratios 1/5;5 | Correct direction for étale map. |
| 5.5 Faltings-ratio definition | class 11a | indices 5,25,1 | exp(2(h−h_min))=5,25,1 | Positive integers. |
| 5.5 ratio-one iff headline | 11a3;11a1 | ratios 1;5 | reduced model equals E_min true;false | Both directions distinguished. |
| 5.5 equal areas are insufficient | 27a1 and27a4 | equal area 2.7028761; both ratios 3 | Ω differs:1.7666388 versus5.2999163 | Equality of area does not identify lattices. |
| 5.6 Petersson height | 11a1,m=c=1, norm²=.04690014728 | ½log1−log(2π√norm²)≈−.3080098348 | −½log1.8515436 | Equal. |
| 5.6 Petersson height, degree 2 | 37a1,c=1,norm²=.37175414544 | ½log2−log(2π√norm²) | −½log7.3381327 | Exact equality with the supplied inputs. |
| Worked CM field claim | y²=x³±4x over ℚ(i) | all roots of unity have u⁴=1 | required u⁴=−1 | False; R01. |
| Repaired CM field claim | same curves over ℚ(ζ₈) | ζ₈⁻⁴·4=−4, \|ζ₈\|²=1 | target coefficient −4, same area | Proposed repair passes. |
| CM real periods/heights | 32a1,64a1 | Ω≈2.6220576,3.7081494; both A≈3.4375929 | both h≈−.617385744; h_st≈−1.310532925 | Other displayed CM identities survive R01. |
| Higher-rank examples | 389a1,5077a1 | analytic ranks 2,3 | factorials 2,6; rank-zero hypothesis false | Numerical Sha values are not promoted to rationality theorems. |

### Limits of the instance checks

The table evaluates all target families and the conventions they use; it is not a proof of any admitted theorem. The level-37 matrix was independently rebuilt from its 38 projective-line generators and the two Manin relation families; ranks modulo 101, 2 and 3 are 33, 32 and 32. The rational rank 33 agrees with the five-dimensional relative homology calculation; the modular computations alone would only give a lower bound for rational rank. Arithmetic on displayed areas, norms, discriminants and heights was recomputed. Database labels and approximate periods were not independently reconstructed by numerical integration. The fully general geometric, arithmetic and analytic claims additionally depend on the source/supplier checks above.

## Not verifiable

- **silverman-aec**, *The Arithmetic of Elliptic Curves*, second edition: cited III.1, VI.1–VI.5/VI.5.1, VII.1, VIII.9, X.4 and C.16. The service classified DOI 10.1007/978-0-387-09494-6 as paywalled; the printed text was not inspected. Cremona, Milne, cached knowls and the named suppliers support several corresponding formulas, not a claim to have read this edition.
- **silverman-advanced**, Corollary V.2.3.1: DOI 10.1007/978-1-4612-0851-8 was classified paywalled. The two real-lattice shapes were checked against the cached period-lattice knowl and the explicit tests.
- **blr**, §1.2: DOI 10.1007/978-3-642-51438-8 was classified paywalled. The Néron mapping-property contract was verified in its owner; the book text was not.
- **mazur**, Corollary 4.1: DOI 10.1007/BF01390348 was classified paywalled. The statement was checked in ars-manin Theorem 2.3, but this is not certification of Mazur's original proof.
- **stevens**, Theorem 2.3 and its proof, pp.87–88: the author URL `math.bu.edu/people/ghs/papers/Stickelberger.pdf` failed certificate verification. Theorem 2.3's three-way conclusion is reproduced in readable vatsal Theorem 1.3, author p.5; that does not certify Stevens' local-factorization proof at the original locator.
- **manin**, §5: the service's DOI resolution of 10.1070/IM1972v006n01ABEH001867 timed out at MathNet. The conjecture was checked in ars-manin Conjecture 2.1; the original was not read.
- **ec.q.optimal**, **ec.q.modular_degree**, **ec.q.manin_constant**, **ec.q.faltings_height**, **ec.q.faltings_ratio**: live legal knowl requests yielded browser-check pages, and no readable copy of these five was found in the service cache. Their mathematical formulas were checked against the other cited texts and suppliers. They remain uncertified as direct knowl citations. In contrast, ec.q.period_lattice, ec.q.real_period, ec.period, ec.regulator, ec.analytic_sha_order, ec.bsdconjecture, ec.q.bsdconjecture and ec.special_value were read from the cache.
- The entire published Vatsal pagination and published ARS congruence numbering were not independently compared page-for-page with the author manuscripts. This review cites the author locators it read. No source manifest was edited, and no missing text was guessed.

## Source issues

- **Error** in ec.period at complex-place definition, unpaginated, line 102: the source says the positive complex period is the unnormalized integral of ω∧ω̄; it should be its absolute value, equal to twice the covolume; affects a stated result.
- **Misprint** in ec.period at real-place definition, unpaginated, line 96: the source says to integrate the signed differential; it should specify the absolute differential density, or the compatible orientation on each component; affects a stated result.
- **Misprint** in ec.period at global-period formula, unpaginated, line 112: the source says the denominator norm with an unmatched parenthesis; it should close the norm of the minimal discriminant ideal; affects nothing.
- **Misprint** in vatsal at Example 1.2, author p.3, line 73: the source says the level-eleven newform is η(z)η(11z); it should be η(z)²η(11z)², of weight two and leading term q; affects a stated result.
- **Error** in vatsal at prime-degree multiplier discussion, author p.4, line 129: the source says the signed multiplier is 1 or p; it should have absolute value 1 or p for independently fixed Néron differentials; affects a stated result.
- **Misprint** in vatsal at height display preceding Theorem 1.3, author p.5, lines 133–144: the source says the reciprocal-square height uses (2πi)⁻¹∫ω∧ω̄ and its inverse square is covolume; it should use (i/2)∫ω∧ω̄ for that covolume normalization; affects a stated result.
- **Misprint** in vatsal at introductory congruence-subgroup inclusion, author p.1, line 18: the source says Γ₀(N) is contained in Γ₁(N); it should say Γ₁(N) is contained in Γ₀(N); affects nothing.
- **Misprint** in ars-manin at §3 opening, printed p.620, line 120: the source says Γ is a subgroup of Γ₁(N) containing Γ₀(N); it should say Γ₁(N)⊆Γ⊆Γ₀(N); affects nothing.
- **Error** in zagier at §5 after Step 4, printed p.382, lines 567–569: the source says the congruence modulus always divides the modular degree; it should assert the reverse divisibility in general; affects a stated result.
- **Error** in cremona at §2.1.3, printed p.11, lines 251–254: the source says a real period against one nonzero real cusp form characterizes the plus eigenspace; it should quantify over every real cusp form, and likewise for the minus eigenspace; affects a stated result.

The last error has a genus-two witness: for a fixed nonzero real cusp form, its imaginary-period functional on the two-dimensional minus eigenspace has a nonzero kernel. A nonzero vector there has period 0, which is real, but is not in the plus eigenspace. The roadmap uses reality of periods, not this false fixed-form converse. None of these source defects is silently transferred into an acceptance theorem.
