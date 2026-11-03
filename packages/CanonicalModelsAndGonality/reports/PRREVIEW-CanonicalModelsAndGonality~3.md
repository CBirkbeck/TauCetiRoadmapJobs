# Review of CanonicalModelsAndGonality (pull request #1726 at 51f3f4d)
**Verdict:** needs changes

## R01 (P1) — The graded Hilbert input is attributed to a supplier that does not supply it

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:683`, also lines 343, 706 and 798: “Hilbert-polynomial existence for finite graded modules and the equality with the Euler characteristic of the associated sheaf are the projective cohomology inputs of SchemeAndStackFoundations §2.6.”

**Claim:** that cited section supplies the graded-module theorem and the graded-module/sheaf comparison needed by §§2.3 and 2.7.

**Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:3437` supplies cohomology and Serre vanishing, not those graded comparisons. Their explicit owner is `TauCetiRoadmap/GroebnerGeometry/README.md:350` and `:370` (G4).

**Repair:** import GroebnerGeometry G4's eventual Hilbert polynomial and graded sheafification/global-section comparison in Scope, Exact supplier contracts and the affected Needs lines. Retain SchemeAndStackFoundations §2.6 for Serre vanishing and §3.3 for singular-curve Riemann–Roch. Do not recreate the generic graded-module theory here. This repairs the stated route on the cuspidal cubic: the image ring has eventual function `3m`, its normalized section ring has `3m+1`, and their quotient has constant polynomial `1`. G4 supplies precisely the comparison needed to preserve that difference. GroebnerGeometry is on main, so this repair introduces no upward dependency.

This is the brief's supplier-drift case: a needed theorem is described as supplied at a section that does not state it. Mathlib's similarly named `Polynomial.hilbertPoly` does not fill the gap; `Mathlib/RingTheory/Polynomial/HilbertPoly.lean:19` treats rational power series, and line 39 lists graded-module Hilbert polynomials as future work.

## R02 (P2) — Require base-point-freeness in the closed-immersion criterion

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:1843`: “For `[PerfectField k]`: `IsVeryAmple D ↔` the morphism `φ` of the complete model of `|D|` is a closed immersion”.

**Claim:** an embedding defined by the complete coordinate tuple detects very ampleness of the original divisor, including a divisor with a fixed part.

**Witness:** On a smooth plane quartic over ℂ, take `D=K+P`. Riemann–Roch gives `ℓ(D)=ℓ(K)=3`. The coordinate map is the canonical embedding, but `P` is a base point; `D` is not very ample.

**Repair:** state the equivalence for `IsBasePointFree D`, with the associated morphism explicitly defined on that domain, or put base-point-freeness in the right-hand conjunction. Add `K+P` as a negative Check. Section 2.1's model divisor removes the fixed part, so it is `K` here, not `K+P`. The repaired implication excludes this example because `ℓ(D−P)=3` does not drop, while retaining the canonical embedding for `K`. The elliptic tests still distinguish `2O` (base-point-free, degree-two map) and `3O` (embedding). The base-point hypothesis is also explicit in Fulton, Exercise 8.33(b), printed p.110 (fulton-curves line 4249).

## R03 (P3) — Remove the genus-two boundary theorem from the acceptance file

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/Suggested.lean:92`, `gonality_eq_two_of_genus_eq_two`: “every function field of genus two has gonality two”.

**Claim:** this boundary specialization belongs among the headline acceptance statements.

**Witness:** It repeats §1.1's genus-two Check and §1.3(d). On `y²=x⁶+1`, genus `2` gives the bound `2g−2=2`, while gonality one would force genus zero.

**Repair:** delete it from `Suggested.lean` and remove its backticked declaration-name claim from the README; keep the mathematical statement and Check in the README. This is the brief's explicit boundary-case/padding rule, not a mathematical objection. The general gonality bound and rationality characterization remain the acceptance statements.

## Verified sound

**Previous review, checked first.** All five findings at head 6999a59 are repaired. The following quotes are from the new head, not assumptions inherited from that review.

| Previous finding | New passage and result |
|---|---|
| R01, imperfect-field pole criterion | README:574: “for `[PerfectField k]` and `g ≥ 2`”. The inseparable example at line 583 is now a negative Check. Repaired: for `𝔽₂(a), y²=x⁵+a`, genus is 2 and the pole order is 2, but the degree-two extension is inseparable; perfectness excludes it. |
| R02, missing descent headlines | README:1457 names `isBielliptic_iff_of_six_le_genus` and the hyperelliptic fixed-field criterion; Suggested:569 and :580 state them. Repaired. Both signatures retain perfectness, the algebraic closure, exact constants and the compositum law. |
| R03, unnecessary characteristic restriction | Suggested:532, :540, :549 now carry the perfect/algebraically closed hypotheses without `h2`. Repaired. The tame-different statements at :514 and :523 still retain `(2 : k) ≠ 0`. |
| R04, Hurwitz wrapper and theorem-dependent data | README:1377 calls the quotient formula an instance of the pinned Hurwitz theorem. The wrapper is absent. Suggested:257 uses an existential test, a witness in the true branch and `0` otherwise. Repaired: the value of arithmetic genus no longer chooses from a sorried theorem. |
| R05, supplier bookkeeping | README:118 now names only `rationalPointsClosure_cosets`; the excluded effective-Diophantine material is outside the supplier list; line 339 says “AlgebraicTopology Stage 2, item 7”; lines 897–899 separately handle characteristic two through AlgebraicCurves Layer 10. Repaired. |

All abbreviated README/Suggested locations in this report refer to `TauCetiRoadmap/CanonicalModelsAndGonality/`.

**Scope, gate and elaboration.** I read the normative Writing a roadmap checklist and CONTRIBUTING, the complete target README and Lean file, and the main-branch AlgebraicCurves and JacobianChallenge roadmaps for shape and ownership. The target has 61 numbered subsections. The diff outside this folder is empty, and the worktree remains unchanged. The worker's gate at the specified head passes every scanner and the targeted build: `build=0`, `depcheck=0`, `stray-files=0`, `outside-folder=0`, final `OK`. My independent dependency command returned:

    depcheck: 204 roadmaps, 1641 edges, 0 problem(s)

There is no UPWARD or CYCLE line. Every Needs line was read. In particular, §2.7 precedes local delta theory; §3.9's low-genus calculations can precede general Petri; §8.7 takes the modular comparison isomorphism as a hypothesis rather than importing its later consumer.

I ran `lake env lean` on the original Suggested module: exit 0, with only the expected 50 sorry warnings. A scratch copy tested every admitted theorem with `rfl`, `simp` and `infer_instance`, requiring each attempted tactic to close the goal. It also elaborated all 67 `#check @name` signatures. The copy still had 50 admitted declarations: none closed through those probes. Reading the pinned statements found no direct single-library-theorem replacement for the remaining signatures. R03 is independently padding under the boundary-case rule. No missing section binder was found in the 67 elaborated types; no signature was changed.

The file has one Mathlib import and individual Tau Ceti imports, real definitions on native carriers, no `set_option` and no admitted data value. The canonical model's coordinates are the actual basis elements; its generation proof does not supply arbitrary coordinate data. Its model law excludes a degree-two pencil that generates only a proper rational subfield. The integer arithmetic-genus and delta definitions avoid natural-subtraction truncation.

**Headline inventory.** The README's end results are: gonality and its finite-map/constant-field laws; model Hilbert polynomials and arithmetic genus; canonical embedding and the canonical image conic; Max Noether and Petri; plane genus and local singularity corrections; Clifford equality; Castelnuovo–Severi consequences; Thom–Porteous and Brill–Noether existence; quotient, bielliptic and cyclic-trigonal criteria and descent; Frey's criterion and isolated-point finiteness; Li–Yau and Abramovich; scheme-model comparisons and good reduction. Suggested states the function-field headlines on existing fields, places, divisors, submodules, polynomial ideals and fixed fields. Its docstring explicitly names the missing canonical-section-ring, local-normalization/conductor, degeneracy-locus/Chow, Picard/symmetric-power, analytic quotient/Laplacian and regular-model comparison interfaces. It supplies no scalar or free-predicate substitute for those results. The restored descent statements, the pointless-conic gonality-four theorem and trigonal uniqueness are present. No additional missing statable headline was identified.

**Seeded source sample.** All fifteen requested targets were inspected. No additional locator was explicitly labelled unverified in the README. “Uncertified” below means the precise cited text was not read; an alternative mathematical check is identified separately. Publisher pagination is not inferred from preprint pagination.

| Target | Text and locator examined | Outcome |
|---|---|---|
| 1.6 finite maps | Poonen Appendix A, Proposition A.1(vi)–(vii), author version pp.8–9; poonen line 336 and line 371 | Both inequality directions occur. The characteristic-polynomial argument includes multiplicities, so it does not silently assume a separable finite map. The roadmap's divisor-norm formulation was checked separately with residue degrees. |
| 1.7 extensions | Poonen A.1(i)–(ii), p.8; poonen line 328 and line 340 | Extension decreases gonality; algebraically closed base gives equality. The source's curve convention is geometric; the more general field-tower inequality in Suggested was independently checked by the basis-span argument. |
| 2.4 base points/very ampleness | Hartshorne IV.3.1: uncertified. Fulton Exercise 8.33(b),(e), p.110; fulton-curves line 4242 | Fulton explicitly removes base points before defining the morphism and gives the high-degree embedding route. The finite-extension length-two definition was tested on elliptic curves and nonsplit conic covers below. The exact Hartshorne locator remains uncertified. |
| 2.6 coordinate expressions | Fulton §4.2, pp.46–47; fulton-curves line 1881 and line 1893 | Equal-degree fractions and nonzero denominator are exactly the projective function-field construction. Cross-multiplication follows in the quotient domain; map direction is contravariant. |
| 3.3 canonical field/model | Saint-Donat Proposition (1.5), p.160; saint-donat line 158 | Supports the canonical embedding and terminology over an algebraically closed field. Independence of the ratio field follows by cancelling the common multiplier; basis independence was checked directly. Hartshorne's cited pages remain uncertified. |
| 3.4 Noether | Saint-Donat Proposition (1.5), p.160; saint-donat line 159 | Very ample iff nonhyperelliptic, with the doubled-point argument at line 166. Characteristic two is allowed. The perfect-field descent and the pin's separate characteristic-two input were checked. |
| 3.8 Enriques–Babbage/Petri | Saint-Donat (4.7), pp.172–173; (4.11)–(4.13), pp.174–175; saint-donat line 669, line 727, line 759 | Supports quadrics with trigonal/plane-quintic exceptions, cubics for genus at least four, and the genus-three quartic exception. The roadmap avoids the introductory theorem's genus-three error. |
| 4.3 smooth plane curves | Fulton projective Nullstellensatz, §4.2 p.46; fulton-curves line 1863; AlgebraicCurves Layer 10 | The irrelevant-ideal criterion follows from the affine radical theorem. The equation remains among the generators when the characteristic divides its degree. The plane genus input is supplied rather than re-owned. |
| 4.7 hyperelliptic plane model | AlgebraicCurves Layer 10, squarefree hyperelliptic equation; §4.2 degree–genus identity | This is a derived calculation, not a separately located theorem in Fulton. Direct homogenization gives multiplicities 2g and 2g−1; arithmetic genus minus g gives 2g² and 2g²−2g. Values for g=2,3 are below. |
| 5.1 Clifford equality | Hartshorne IV.5.4: uncertified. Saint-Donat (1.4)–(1.5.4), pp.158–160; saint-donat line 108 and line 148 | Independently confirms the equality classification over an algebraically closed field. The strict degree bounds exclude the trivial and canonical line bundles; perfect-field descent preserves degree and section dimension. |
| 7.5 isolated finiteness | Bourdon–Ejder–Liu–Odumodu–Viray Theorem 4.2(2), p.11, proof p.14; belov line 488 and line 628 | Number-field hypothesis and finiteness of all isolated points are present. The roadmap's bounded-degree conclusion follows. Its proof uses injectivity only for ℙ¹-isolated points, as required. |
| 8.5 finite area | Abramovich §1.6, preprint p.3; abramovich line 109; Yang–Yau pp.58–60, yang-yau line 112 | Abramovich explicitly extends the inequality to the singular finite-area metric using the clipped spectral bottom. The roadmap's logarithmic cutoffs and correction of the mean supply its more explicit compact-support passage. |
| 8.7 transfer | Abramovich §1.1, preprint p.2; Poonen A.1(ii), p.8 | Algebraically closed extension preserves gonality. Combined with the stipulated meromorphic-field isomorphism, the transfer to ℚ̄ is valid. No claim that the later modular-curve dictionary has already been built is needed. |
| 9.1 closed immersions | Hartshorne IV.3.1: uncertified; Fulton Exercise 8.33(b), p.110 | The missing base-point hypothesis is exposed by R02. The canonical and degree-at-least-2g+1 applications do have base-point-freeness. |
| 9.2 normalization | Hartshorne I.5.1: uncertified; SchemeAndStackFoundations §0.30 and §4.4's finite-normalization sequence | For an integral projective plane curve, delta zero means the finite normalization quotient vanishes; normal one-dimensional local rings are regular. Perfectness is necessary for the further equivalence with smoothness. |

Additional source checks: Voight–Zureick-Brown v4 (2.3.2), printed p.14 (voight-zureick-brown line 771), keeps the characteristic-two linear term and gives weights 1,1,3; §2.7, pp.20–21 (line 1044 and line 1069), treats the higher-genus hyperelliptic ring. Abramovich–Harris Lemma 1, printed p.231 (abramovich-harris line 191), supplies the doubled-divisor dimension argument used in Frey's route; its translation to an arithmetic point is handled in §7.4. Ogg Theorem 2 and its table (ogg line 107) give the listed hyperelliptic levels 41,47,59,71 and genera 3,4,5,6. Derickx–van Hoeij Table 1 (derickx-vanhoeij line 43) gives arithmetic gonality 4 at level 17; this table alone does not certify the separate geometric canonical-model assertion.

The readable LMFDB knowls agree with the recorded distinctions: lmfdb-knowls line 90 defines gonality by function-field degree; lmfdb-ag.gonality_geom line 90 specifies the algebraic closure; lmfdb-ag.canonical_model line 90 specifies the nonhyperelliptic canonical embedding; lmfdb-ag.plane_model line 90 specifies birational plane models; lmfdb-ag.cyclic_trigonal line 90 uses a subgroup, not a chosen generator; lmfdb-modcurve.gonality line 90 uses the component's canonical field. The hyperelliptic and bielliptic knowls need the qualifications recorded under Source issues.

**Pinned APIs opened.** Mathlib pin `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti pin `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a` were read from the manifest. The following 18 declarations/interfaces were inspected by object and with their surrounding hypotheses:

| Pin-relative file and line | Object and relevant boundary |
|---|---|
| `TauCeti/FieldTheory/FunctionField/Basic.lean:51` | `IsFunctionField` requires a transcendental element with finite extension over its rational subfield; it does not impose exact constants, perfectness or separability. |
| `TauCeti/FieldTheory/FunctionField/Divisor/ProductFormula.lean:234` | `Divisor.degree_poles` needs transcendence, not exact constants. |
| `TauCeti/FieldTheory/FunctionField/Consequences/HighDegree.lean:65` | High-degree dimension formula; exact constants and the integer degree threshold. |
| `TauCeti/FieldTheory/FunctionField/Consequences/HighDegree.lean:91` | Genus-one positive-degree dimension equals degree. |
| `TauCeti/FieldTheory/FunctionField/Consequences/Clifford.lean:320` | Clifford inequality with 0≤degree≤2g−2; arbitrary exact constants. Equality classification is new here. |
| `TauCeti/FieldTheory/FunctionField/Hyperelliptic/Basic.lean:167` | Pinned hyperelliptic iff requires characteristic different from two. |
| `TauCeti/FieldTheory/FunctionField/Hyperelliptic/Basic.lean:199` | Genus-two index-two subfield without separability; contrast the separable theorem at :207. |
| `TauCeti/FieldTheory/FunctionField/Hyperelliptic/RationalSubfield.lean:110` | Low-degree functions factor through the index-two subfield; exact constants, no perfectness. |
| `TauCeti/FieldTheory/FunctionField/Hyperelliptic/RationalSubfield.lean:154` | Uniqueness of the index-two rational subfield for g≥2. |
| `TauCeti/FieldTheory/FunctionField/ConstantExtension/RiemannRoch.lean:160` | `Divisor.dim_conorm`; the surrounding block at :54 requires finite separable constant extension. |
| `TauCeti/FieldTheory/FunctionField/ConstantExtension/Genus.lean:57` | Degree preservation and genus preservation at :69; finite separable extension assumptions at :50. |
| `TauCeti/FieldTheory/FunctionField/ConstantExtension/Degree.lean:44` | Degree over a rational subfield under finite separable constant extension. |
| `TauCeti/FieldTheory/FunctionField/Different/Hurwitz.lean:72` | Hurwitz with the different; tame specialization at :120 is a supplier, not a new theorem here. |
| `TauCeti/FieldTheory/Galois/FixedField.lean:304` | Finite subgroup gives fixed-field degree equal to its cardinality without finite ambient extension. |
| `TauCeti/FieldTheory/FunctionField/Automorphism/FixedField.lean:35` | The finite-group fixed field is again a function field. |
| `Mathlib/FieldTheory/Galois/Basic.lean:92` | Finite-group fixed-field Galois instance; contrast the finite-ambient degree theorem at :220. |
| `Mathlib/FieldTheory/RatFunc/IntermediateField.lean:162`; `Mathlib/FieldTheory/RatFunc/Luroth.lean:496` | Rational-function degree, including constant-function rank zero; Lüroth equivalence excludes the bottom intermediate field. |
| `Mathlib/RingTheory/Nullstellensatz.lean:171`; `Mathlib/RingTheory/Polynomial/HilbertPoly.lean:19` | Affine radical theorem versus the rational-series Hilbert polynomial; the latter is not the missing graded-module interface. |

Searches also examined native Weil-divisor linear systems and the projective coordinate-map interface. The function-field model tuple, its birational generation condition and its ratio field are distinct from those existing carriers. No pinned gonality/Petri/Brill–Noether theorem was found. This is an object audit, not a claim based on searching only this roadmap's proposed names.

**Cross-roadmap ownership and supply.** The eleven named supplier roadmaps were resolved, at main where the roadmap already exists, and at the provided open head for new suppliers. Relevant places inspected were:

- AlgebraicCurves Layers 5, 8, 10–12: pole numbers, constant extension and Castelnuovo–Severi, smooth plane/hyperelliptic equations, automorphisms and the regular-model dictionary. In particular Layer 10's perfect-field separability clause is present at README:1314; Layer 12 begins at :1468.
- JacobianChallenge Layers B–F, README:135 onward: coherent cohomology, symmetric powers, Picard schemes, theta and Abel–Jacobi. Its degree-d Picard objects do not require replacing rational divisor classes by actual rational divisors.
- SchemeAndStackFoundations §§0.3, 0.11, 0.19–0.21, 0.30, 2.6, 3.2–3.3, 3.6–3.7, 5.3–5.8. The high-degree Abel map at README:4958 is surjective as a scheme map, not necessarily on ground-field points. The singular-curve Euler formula is at :4735. The wrong graded-Hilbert attribution is R01.
- StableReduction Layer 0, README:343; ModularCurves §0A, README:238: models over a DVR, relative effective divisors, properness/finiteness and degrees.
- ModularForms 10A–10B, README:1052 and :1068; FuchsianOrbifolds Layers 2 and 4, README:235 and :286: effective projective index, meromorphic functions, analytic Riemann–Roch, area and compactification.
- AlgebraicTopology Stage 2 item 7, README:393: disk-boundary no-retraction, the input to the balancing argument.
- HeightsRationalPointsAndObstructions §1.7 and §5.9, README:614 and :2411: Mordell–Weil and `rationalPointsClosure_cosets`.
- MotivesAndAlgebraicCycles §§0.4–0.5, README:119 and :134: algebraic/numerical equivalence and the numerical quotient used for the Chern calculation.
- CongruenceSpectralGap §§0.2, 0.4, 0.7 and 5.3, README:172, :219, :315 and :826: maximal-domain Laplacian, Rayleigh bottom, clipping at 1/4 and the unconditional 21/100 bound.

The search used the roadmap index/grep tools, main, the supplied sibling checkouts and board package READMEs. The readable HyperellipticCurves head owns equation invariants and model transformations; GroupActionsOnRiemannSurfaces owns generating vectors and analytic actions; AdelicImagesAndModularCurves README:215 explicitly consumes this roadmap's models/gonality; QuaternionArithmetic separates the same curve-level theory from quaternionic construction. Their objects do not duplicate this function-field library. The norm of a function-field divisor in §1.6 is a place/residue-degree operation; the existing scheme line-bundle norm is a different carrier. Generic graded Hilbert theory does have an earlier owner, GroebnerGeometry G4, hence R01. No fully qualified declaration-name collision was found.

**Adversarial computations (124 rows).** Each row records actual values, not merely successful elaboration. Characteristic zero and algebraically closed constants are used unless a row says otherwise. “Keep” means no change indicated by that test; it does not certify unread source text. Rows split the main assertions and cover every numbered subsection, the sampled targets, the headline signatures and the findings.

| Statement | Instances tried | Computed values on the two sides / discriminant | Result and change |
|---|---|---|---|
| 1.1 gonality, attainment, positivity | k(t), k(s,t), algebraic F/k | k(t): minimum 1, attained by t; trdeg 2: every finite rank is 0, infimum 0; algebraic extension: empty set, infimum 0 | Keep; function-field hypothesis excludes both junk values. |
| 1.1 isomorphism invariance | t ↦ t+1 on k(t) | Generated fields both k(t); both degrees and gonalities 1 | Keep. |
| 1.2 pencil characterization | ℙ¹, D=∞; D=0 | ℓ(∞)=2 and degree 1; ℓ(0)=1. Both minima are 1 | Keep; zero divisor cannot witness a pencil. |
| 1.3(a) gonality one iff rational | k(t); elliptic function field | (gonality, genus)=(1,0) and (2,1); rational equivalence true and false respectively | Keep both directions. |
| 1.3(b) degree-one-divisor bound | ℙ¹; pointed genus two | ℓ((g+1)P)≥2; g+1=1 and 3, against gonality 1 and 2 | Keep. |
| 1.3(c) canonical bound | g=2; excluded g=1 | 2g−2=2, gonality 2; at g=1 RHS=0, gonality 2 | Keep g≥2; no truncated-subtraction extension. |
| 1.3(d) genus-two equality | y²=x⁶+1 | Upper bound 2; rationality would give g=0 rather than 2; gonality=2 | True; delete acceptance-file boundary theorem, R03. |
| 1.4 index | ℙ¹; nonsplit real conic; index-three genus-one torsor | Positive divisor-degree images ℤ, 2ℤ, 3ℤ; indices 1,2,3 | Keep; zero degree does not enter the defining infimum. |
| 1.4 genus-zero gonality | Split and nonsplit real conics | Index 1 gives gonality 1; index 2 gives gonality 2 | Keep; ground-field rationality matters. |
| 1.4 genus-one gonality | Elliptic curve; index-three torsor | ℓ(D)=deg D for positive degree; least pencil degrees 2 and 3 = max(2,index) | Keep. |
| 1.5 hyperelliptic equivalence | 𝔽₂, y²+y=x⁵; plane quartic | First: g=2, separable degree 2, both sides true. Second: g=3, gonality 3, both sides false | Keep perfectness and g≥2. |
| 1.6 divisor norm | A place over P with (e,f)=(2,1), then (1,2) | Norm of upstairs point is P, then 2P; conorm followed by norm is 2P in both cases | Keep residue degree f, not ramification e, in pushforward. |
| 1.6 lower finite-map inequality | Elliptic double cover of ℙ¹; identity | 1≤2; identity gives d≤d. Characteristic-polynomial coefficient poles are bounded by norm of poles, degree d | Keep; repeated roots do not change the pole bound. |
| 1.6 upper finite-map inequality | Same double cover; t↦t³ | 2≤2·1=2; rational source has 1≤3·1=3 | Keep multiplication direction. |
| 1.7 extension inequality | Nonsplit conic ℝ→ℂ | Gonality drops 2→1; 1≤2 | Keep; equality over arbitrary base is false. |
| 1.7 algebraically closed invariance | ℚ̄(t)→ℂ(t); smooth plane quartic | Gonalities 1=1 and 3=3; a degree-2 quartic pencil would contradict nonhyperellipticity on either side | Keep; transcendental constant extension included. |
| 1.7 compositum requirement | k(t) inside k(t,u), same constants | Span degree over k(t) is infinite, rank junk value 0; compositum is not all k(t,u) | Keep compositum and both function-field hypotheses. |
| 1.8 arithmetic point bound | ℙ¹/𝔽₂; y²+y=x⁵/𝔽₂ | 3≤1·3=3; two affine points plus infinity give 3≤2·3=6 | Keep. |
| 1.8 geometric point bound | Klein quartic/𝔽₈ | Direct projective count 24; 24≤3·9=27 and 24>2·9=18 | Keep; excludes geometric gonality 2. |
| 1.8 Frobenius proof denominator | Function z of degree d>0 over a finite extension | Degrees of σ(z) and z^q are d and qd; q≥2 makes them unequal, so σ(z)−z^q≠0; poles≤(q+1)d | Keep; q=1 is not a finite-field case. |
| 1.9 pole bound and perfect-field iff | Genus-two branch and nonbranch points | First pole numbers 2 and 3; gonality 2≤2 and 2≤3; only the branch point has 2 as pole number | Keep the stated perfect-field hypothesis. |
| 1.9 imperfect negative control | 𝔽₂(a), y²=x⁵+a | Via degree-five Kummer map to y: 2g−2=−10+8+4=2, so g=2; ord∞x=−2; unique index-two field is inseparable | Prior R01 repaired; no hyperelliptic iff here. |
| 1.10 constant-field factor | ℂ(t)/ℝ; exact k(t)/k | 2=2·1; 1=1·1 | Keep relative algebraic closure, not an arbitrary component convention. |
| 2.1 Model generation | (t,1); (x,1) on an elliptic curve | First ratios generate F, index 1; second generate k(x), index 2 | Keep; second tuple is a pencil, not a Model of the elliptic field. |
| 2.1 divisor sign and scaling | (t,1), then t(t,1) | Divisors ∞ and 2∞−[0]; degrees 1 and 1; change is −div(t)=∞−[0] | Keep the negative-divisor convention. |
| 2.1 complete versus incomplete model | (t²,t,1); (t³,t,1) | Coordinate spans have dimensions 3 and 3; ℓ(2∞)=3, ℓ(3∞)=4 | Keep; birationality alone is not completeness. |
| 2.1 zero/rank boundary | All-zero tuple; n=0 on a function field | Zero tuple violates nonzero law; one nonzero coordinate yields only ratio 1 and bottom field, not F | Keep both structural laws. |
| 2.2 homogeneous ideal | Rational line; conic (s²:st:t²) | Ideals 0 and (XZ−Y²); the nonzero conic relation has degree 2 | Keep homogeneous kernel, not unrestricted affine evaluation kernel. |
| 2.2 Hilbert functions | Line, conic, cuspidal cubic | H(m)=m+1, 2m+1, 3m for m≥1; cusp at m=1,2 has 3,6 versus normalization 4,7 | Keep. |
| 2.3 eventual polynomial existence | Line, smooth cubic, cuspidal cubic | p_a=0,1,1 from m+1,3m,3m; normalized cusp has 3m+1 | Mathematics consistent; repoint supplier, R01. |
| 2.3 genus inequality and integer delta | Same three curves | (g,p_a,δ)=(0,0,0),(1,1,0),(0,1,1); p_a−g=0,0,1 | Keep total integer definitions. |
| 2.4 base-point-free definition | D=0 on positive genus; negative-degree D | ℓ(0)=1>ℓ(−P)=0; negative degree gives 0<0 false | Keep; zero section space is excluded. |
| 2.4 very ampleness | Elliptic 2O and 3O | For E∼2O: ℓ(2O−E)=1, but required 0; for 3O and degree-2 E: ℓ=1=3−2 | Keep. |
| 2.4 doubled/geometric point condition | Canonical genus two at a ramified doubled point E=2P; pointless-conic double cover | Hyperelliptic pair leaves ℓ(K−E)=g−1 instead of g−2; after a finite splitting extension the same failure occurs | Keep finite extensions; ground-field divisors alone give the wrong predicate. |
| 2.5 2g bound | Elliptic degree 2; ℙ¹ degree 0 | ℓ(2O)=2>ℓ(O)=1; ℓ(0)=1>ℓ(−P)=0 | Keep base-point-free threshold. |
| 2.5 2g+1 bound | Elliptic degree 3; ℙ¹ degree 1 | Removing degree 2 leaves dimensions 1=3−2 and 0=2−2 | Keep perfectness for geometric descent. |
| 2.6 equality of fractions | (X,Z),(2X,2Z); (X,Z),(X+Z,Z) | Cross-products 0 and −Z²; corresponding functions t=t and t≠t+1 | Keep nonzero evaluated denominators. |
| 2.6 maps and composition | Elliptic→ℙ¹, then t↦t³ | Field embedding points from target to source; degrees 2,3, composite 6 | Keep contravariant field direction. |
| 2.7 image and normalization | Cusp; smooth cubic | Cusp h¹(image)=1, h¹(normalization)=0; cubic both 1 | Keep; Serre vanishing alone needs the G4 comparison, R01. |
| 3.1 effective canonical divisor | g=0,1,2 | Canonical degrees −2,0,2 and dimensions 0,1,2; effective representative impossible for g=0, possible for g≥1 | Keep g≥1. |
| 3.2 canonical base points | Elliptic point; genus-two point | ℓ(K−P)=0<1 and 1<2; RR gives g−1−deg(P)+ℓ(P) | Keep; no characteristic exclusion. |
| 3.3 canonical field | k(t); elliptic field; genus-four hyperelliptic; plane quartic | Ratio fields bottom, bottom, k(x) of index 2, and top of index 1 | Keep genus guard on finite-degree assertions. |
| 3.3 basis/representative independence | Multiply every section by u≠0; change basis by invertible matrix | (ua)/(ub)=a/b; invertible matrix changes span by rank g→g, zero matrix gives rank 0 | Keep nonzero denominator and basis laws. |
| 3.3 canonical Model divisor | Plane quartic with effective K | Three coordinates span L(K), no common base divisor; Model.divisor=K, degree 4=2·3−2 | Keep; htop excludes the hyperelliptic pencil. |
| 3.4 Noether equivalences | Genus two; smooth plane quartic | Genus two: very ample=false, nonhyperelliptic=false, gon≥3=false, top=false. Quartic: all four=true | Keep both directions, including characteristic-two geometric case. |
| 3.5 canonical hyperelliptic image | g=4 | Canonical degree 6; map degree 2, rational-normal image degree 3; 6=2·3 | Keep distinction between Model and canonical image. |
| 3.6 even-genus splitting | g=4 versus g=3 | Conic index divides gcd(3,2)=1 versus gcd(2,2)=2 | Keep evenness; odd genus can retain a nonsplit conic. |
| 3.7 Max Noether multiplication | Nonhyperelliptic g=4, m=1,2 | Dimensions 4=4; Sym² dimension 10 maps onto ℓ(2K)=9, kernel dimension 1 | Keep; equality means span-surjectivity, not injectivity. |
| 3.7 hyperelliptic ring | g=2, m=1,2,3; g=3, m=2 | Dimensions 2,3,5 versus binary products 2,3,4; g=3 gives 6 versus 5, requiring one degree-2 generator | Keep the separate genus-two cubic generator. |
| 3.7 characteristic-two relation | w²+v³w=u⁵v, weighted degrees (1,1,3) | All terms degree 6; derivative in w is v³≠0, while deleting the linear term gives derivative 0 | Keep characteristic-two term. |
| 3.8 quadrics count | g=4,5,6 | g(g+1)/2−3(g−1)=1,3,6, matching (g−2)(g−3)/2 | Keep. |
| 3.8 Petri exceptions | Plane quartic; trigonal g=4; plane quintic g=6 | Quartic I₂=I₃=0, needs degree 4; g=4 has one quadric and a cubic; plane quintic has six quadrics but needs cubics | Keep g≥4 and both exceptions. |
| 3.9 genus-three model | Smooth plane quartic | d=4, p_a=(3·2)/2=3, K=O(1), canonical degree 4 | Keep. |
| 3.9 genus-four model | Complete intersection (2,3) | Degree 6=2g−2; rank-4 quadric gives two rulings, rank-3 cone one | Keep geometric hypotheses. |
| 3.9 genus-five model | Complete intersection (2,2,2) | Degree 8=2g−2; three independent quadrics, gonality 4; trigonal alternative has scroll instead | Keep. |
| 4.1 plane generator | Line, conic, smooth cubic | One irreducible generator of degree 1,2,3; function-field genera 0,0,1 | Keep; height-one homogeneous prime is principal. |
| 4.2 Hilbert threshold | d=4, m=1,2 | H(1)=3 versus polynomial 4−2=2; H(2)=6=8−2 | Keep m≥d−2; one earlier degree fails. |
| 4.2 degree–genus formula | d=1,…,7, smooth; sextic genus-two model | p_a=0,0,1,3,6,10,15; sextic 2g=20−2·8=4 | Keep integer arithmetic. |
| 4.3 Jacobian predicate | G=X; G=0; cusp Y²Z−X³ | Ideals unit, zero, and one vanishing at (0:0:1); predicate true with N=0, false, false | Keep; no accidental zero-polynomial acceptance. |
| 4.3 characteristic divides degree | 𝔽₂ conic XZ+Y² | Partials Z,0,X vanish at (0:1:0), but G there is 1; including G gives no common zero | Keep G in Jacobian ideal. |
| 4.4 local delta/conductor | Cusp k[t²,t³]; node of residue degree 2 | Cusp quotient basis t: δ=1, conductor quotient dimension 2; node weighted δ=2, conductor quotient dimension 4 | Keep ground-field weighting. |
| 4.4 global delta sum | Rational cuspidal cubic | χ(image)=0, χ(normalization)=1, quotient length=1; p_a−g=1=Σδ_p | Keep. |
| 4.5 ordinary-point lower bound | Node, cusp, tacnode | All r=2; δ=1,1,2 versus r(r−1)/2=1 | Keep: equality does not characterize ordinary points. |
| 4.5 imperfect point | 𝔽₂(a), y²=x³+a at (x,y²+a) | Maximal ideal (x), multiplicity 1, delta 0; after √a, cusp multiplicity 2 and delta 1 | Keep separable-residue qualification. |
| 4.6 quadratic transformation | Smooth conic avoiding three fundamental points | Transformed degree 2·2−0−0−0=4; three nodes give p_a−δ=3−3=0 | Keep mathematical transformation theorem; no computational procedure needed. |
| 4.7 even-degree hyperelliptic plane model | g=2; g=3 | (d,r∞,p_a,δ,g)=(6,4,10,8,2),(8,6,21,18,3); δ=2g² | Keep. |
| 4.7 odd-degree hyperelliptic plane model | g=2 | d=5, r∞=3, p_a=6, δ=4=2g²−2g, genus=2 | Keep odd/even homogenizations separate. |
| 5.1 Clifford equality | g=3 hyperelliptic pencil; degree-2 divisor on nonhyperelliptic quartic | First 2ℓ=4=deg+2; second ℓ≤1, hence 2ℓ≤2<4 | Keep equality classification and strict interior degree bounds. |
| 5.1 boundary exclusions | D=0 and D=K | Equality 2=0+2 and 2g=(2g−2)+2 occurs even on nonhyperelliptic curves | Keep 0<deg D<2g−2. |
| 5.2 Castelnuovo–Severi arithmetic | (n₁,g₁,n₂,g₂)=(2,0,2,1),(2,1,2,1),(3,0,2,1),(2,0,3,0) | n₁g₁+n₂g₂+(n₁−1)(n₂−1)=3,5,4,2 | Keep compositum and separability hypotheses from supplier. |
| 5.2 low-degree factorization | g=4, y²=x⁹−1, pencil x² | Degree 2·2=4≤g, even and composite; an independent degree-3 pencil would force g≤2 | Keep; exclusion is of odd degrees, not all degrees ≤g. |
| 5.2 pointless-conic cover | g≥3 double cover of an index-2 conic | Composed pencil degree 2·2=4; degree 2 would split the conic, degree 3 would force g≤2 | Keep gonality exactly 4. |
| 5.2 bielliptic uniqueness | Two distinct elliptic involutions | Castelnuovo–Severi yields g≤2+2+1=5; g=6 violates 6≤5 | Keep g≥6, including characteristic two. |
| 5.2 trigonal uniqueness | Two distinct degree-3 pencils | Bound (3−1)²=4; g=5 contradicts 5≤4 | Keep; finite rank 3 excludes constant generators. |
| 5.3 Thom–Porteous | O→O(1) on ℙ¹; zero map | Nonzero section: one zero, degree c₁=1. Zero map: whole ℙ¹, codimension 0 instead of expected 1 | Keep expected-codimension hypothesis on class formula. |
| 5.3 nonempty determinant criterion | Isomorphism O→O; section of O(1) | Degeneracy empty and determinant c₁(O)=0; latter class degree 1≠0 forces a zero | Keep nonzero-class direction. |
| 5.4 Brill–Noether existence | g=4,r=1,d=3; g=0,r=0,d=0; g=0,r=1,d=0 | ρ=0,0,−2 respectively; allowed section dimensions ≥2,≥1; impossible third input excluded | Keep integer ρ expression. |
| 5.4 determinantal coefficient | g=4,r=1,d=3 | Coefficient (0!/2!)(1!/3!)=1/12; θ⁴ degree 4!=24, product degree 2 | Keep positive nonzero numerical class. |
| 5.4 numerical versus Chow | Elliptic Poincaré restriction at Q≠O of infinite order | Numerical degree 0; Chow class [Q]−[O] nonzero, also after rational coefficients | Keep numerical quotient; Chow equality would be false. |
| 5.4 gonality bound | g=0,…,9 | Floors (g+3)/2=1,2,2,3,3,4,4,5,5,6; rational and elliptic minima 1,2 | Keep all genera. |
| 6.1 finite fixed field | Trivial subgroup, involution, S₃ action on rational field | Fixed-field degrees 1,2,6 = subgroup cardinalities | Keep nonabelian groups; no finite ambient F/k assumption. |
| 6.2 Hurwitz | t↦t²; char-2 y²+y=x⁵ | −2=2(−2)+2; 2=2(−2)+6 | Keep different, not merely count of ramified points. |
| 6.3 tame involution fixed degree | g=2, quotient genera 0 and 1 | 2g+2−4g₀=6 and 2 | Keep; two involutions have different quotients. |
| 6.3 wild negative control | char-2 y²+y=x⁵ | One ramified point but different degree 6, not 1 | Keep tameness in fixed-point counting. |
| 6.4 bielliptic predicate | Genus-two x↦−x on y²=x⁶+1; elliptic 2-torsion translation | Quotient genera 1 and 1; first fixed degree 2, second fixed degree 0 | Definition intentionally allows genus one; LMFDB use imposes g≥2. |
| 6.4 bielliptic criterion | Tame quotient genus g₀ | 2g+2−4g₀=2g−2 iff 4g₀=4 iff g₀=1 | Keep both directions. |
| 6.4 gonality four | Bielliptic g≥5 | Upper bound 2·2=4; hyperelliptic alternative forces g≤3, trigonal alternative g≤4 | Keep g≥5 and geometric constants. |
| 6.5 cyclic subgroup descent | y³=x⁷−1 over ℚ(ζ₃) | Conjugation sends σ to σ⁻¹≠σ, but {1,σ,σ²} to itself | Keep subgroup descent distinct from generator descent. |
| 6.5 hyperelliptic descent | Perfect k, g≥2 | Stable order-two subgroup has one nonidentity element; σ⁻¹=σ. Quotient genus remains 0 after extension | Keep; nonsplit quotient need not be ℙ¹ over k. |
| 6.5 bielliptic descent | Perfect k, g=6 | Distinct involutions would give 6≤5; unique involution is fixed by descent and quotient genus stays 1 | Keep repaired headline. |
| 6.6 cyclic trigonal/Kummer | y³=x⁴−1; y³=x⁷−1 | Branch counts 5,8; 2g−2=−6+2r gives g=3,6. Subgroup order 3; quotient genus 0 | Keep char≠3 and ζ₃ for Kummer normal form. |
| 6.6 wrong cube model | y³=x³ in char≠3 | Polynomial reducible; adjoining chosen y=x gives degree 1, not 3 | Noncube requirement excludes it. |
| 6.7 signature/quotient genus | C₂ hyperelliptic g=2; rational S₃ action | 2=2(−2+6/2); −2=6(−2+1/2+1/2+2/3) | Keep orbit stabilizers and effective action. |
| 7.1 Abel map | Nonsplit real conic, degree 1; elliptic degree 0 | Pic¹(ℝ) has one point but X(ℝ) is empty; W₀ dimension 0 versus J dimension 1 | Keep scheme-surjectivity distinct from rational points. |
| 7.2 ℙ¹-parametrized definition | Rational point on ℙ¹; degree-one point on genus two; degree-two point on elliptic curve | ℓ(P)=2,1,2 respectively; predicate true,false,true | Keep nonempty linear system of dimension at least one. |
| 7.2 degree lower/upper criteria | g=2, degree 1; g=1, degree 2 | 1<gonality 2 gives ℓ=1; degree g+1=2 gives ℓ=2 | Keep. |
| 7.2 infinite-fibre argument | ℙ¹ over ℚ versus 𝔽₂ | Infinitely many degree-one places over ℚ; exactly 3 over 𝔽₂ | Keep Infinite k hypothesis. |
| 7.3 AV-parametrized/isolation | Elliptic curve of rank 1 versus rank 0 | Degree-one ℓ=1 in both; rank-one J(k) infinite gives AV-parametrized; rank-zero J(k) finite gives isolated points | Keep rank, not positive dimension, as arithmetic condition. |
| 7.3 sporadic | Rank-zero elliptic rational point; ℙ¹ rational point | Degree≤1 set finite versus infinite; sporadic true versus false | Keep ≤degree, not equality of degrees alone. |
| 7.4 Frey | X₀(37), d=2; d=0 | Infinite quadratic points and gonality 2≤4; degree≤0 set empty, infinity hypothesis false | Keep; no 0≤0 vacuous headline. |
| 7.4 doubled divisor | Degree e≤d with infinitely many distinct Abel images in a positive-rank coset | Doubled degree 2e≤2d; e=2,d=3 gives 4≤6 | Keep degree bound, not a claim of gonality exactly 2d. |
| 7.5 isolated finiteness | ℙ¹; rank-zero elliptic curve | ℙ¹ isolated count 0; elliptic degree≥2 gives ℓ≥2, leaving only finitely many rational points | Keep number-field hypothesis and all-degree finiteness. |
| 7.6 degree/rank criterion | Klein quartic gonality 3 and rank-zero J | Degree 2<3 gives ℓ=1 and no positive-rank translate, so isolated; degree 1 also satisfies 2d=2<3 | Keep; rank-zero premise distinguished from its separate database verification. |
| 7.6 simple Jacobian criterion | Simple J of dimension 3, d=2 | dim W₂≤2<3; no positive-dimensional proper abelian subvariety and W₂ cannot contain J | Keep d<g. |
| 8.1 analytic gonality | Sphere; elliptic Riemann surface; constant map | Minimum degrees 1,2; constant degree 0 is excluded | Keep holomorphic nonconstant maps. |
| 8.2 analytic/field degree | z↦z² on sphere; elliptic x-map | Holomorphic degrees 2,2 equal field degrees [ℂ(z):ℂ(z²)]=2 and [ℂ(E):ℂ(x)]=2 | Keep compactness; arbitrary meromorphic functions on a noncompact surface are not this carrier. |
| 8.3 hyperbolic area | Effective indices 1,2 | Areas π/3,2π/3; no extra SL₂ factor 2 | Keep projective image convention. |
| 8.3 spectral normalization | Model spectrum {0,21/100,1/4}; no small positive eigenvalue | Mean-zero infimum 21/100, versus unrestricted infimum 0; empty small set clips to 1/4 | Keep constants removed and threshold inserted. |
| 8.3 scaling | Metric multiplied by 2 | Area 2A, eigenvalue λ/2, product λA unchanged | Keep curvature −1 when using 21/100. |
| 8.4 Li–Yau | Unit sphere, identity map | λ₁A=2·4π=8π; energy=8π·degree=8π | Keep normalization. |
| 8.4 balancing negative control | Map constant on 90% of area | After any sphere automorphism, barycentre norm ≥0.9−0.1=0.8 | Keep finite nonconstant holomorphic map hypothesis; arbitrary continuous maps do not balance. |
| 8.5 finite-area cutoffs | Annulus ε<r<√ε | Logarithmic cutoff energy 2π/log(√ε/ε)=4π/log(1/ε)→0; cusp area omitted→0 | Keep; fixed bump removes the small mean error. |
| 8.6 spectral constants | λ=3/16,21/100,975/4096,1/4 | λ/24=1/128,7/800,325/32768,1/96 | Keep conditional/unconditional distinction. |
| 8.6 modular numerical bound | X(7), index 168; X₁(17), index 144 | (7/800)168=147/100≤3; (325/32768)144=2925/2048<4 | Keep; latter spectral constant is conditional here. |
| 8.7 transfer | Plane quartic over ℚ̄→ℂ; modular comparison hypothesis | Algebraic gonalities 3=3; analytic gonality 3; modular lower value 1.47≤3 | Keep stipulated comparison isomorphism. |
| 9.1 claimed iff | Smooth plane quartic, D=K+P | deg D=5, ℓ(D)=ℓ(D−P)=3; coordinate map closed immersion=true, very ample=false | R02: add base-point-freeness; K itself has degree 4 and both sides true. |
| 9.1 high-degree consequence | Elliptic 3O; genus-two K | First degree 3=2g+1 embeds; second degree 2<5 gives degree-two map | Keep high-degree and canonical applications after criterion repair. |
| 9.2 normalization/smoothness | Line; cusp; imperfect regular point | (δ,isomorphism)=(0,true),(1,false),(0,true locally); last has smoothness=false | Keep perfectness only for smoothness equivalence. |
| 9.3 good reduction | ℙ¹ and elliptic curve with good reduction | Special/general gonalities 1≤1, 2≤2; pole divisor degrees stay 1 and 2 | Keep smooth proper model and perfect residue field. |
| 9.4 model-type mathematics | Genus-three double cover of pointless conic | Geometric gonality 2, arithmetic gonality 4, canonical map degree 2 | Mathematics agrees with §§3.5,5.2; numeric database codes remain unverified. |
| Worked Picard curve | y³=x⁴−1 over 𝔽₇ | Direct affine count 11 plus infinity=12; 12≤3·8=24, lower bound 12/8=1.5 not sharp | Keep. |
| Worked nodal/tacnodal quartics | One node versus one tacnode | p_a=3; δ=1 gives g=2; δ=2 gives g=1; treating tacnode as node would wrongly give 2 | Keep ordinary-point condition. |
| Worked Hermitian examples | q=3,4 over 𝔽_(q²) | Counts 28,65; bounds 28/10=2.8,65/17≈3.824; integer lower gonalities 3,4 | Keep q a prime power, not q=1. |
| Worked Klein/Jacobian diagnostic | 𝔽₁₁ Klein curve and the displayed elliptic E | Direct counts #X=12, #E=8, a₁₁(E)=4; 12−3·4=0≠12 | Keep warning that J is not ℚ-isogenous to E³; rank/nonvanishing input remains uncertified. |

## Not verifiable

These are limits of source certification, not additional mathematical counterexamples. The review is complete and is not parked for a missing text.

- **Stichtenoth, Hartshorne, ACGH, Frey, Li–Yau, Forster, Serre and Selmer:** the sources service returned publisher-only/uncertified results. I did not cross a paywall. In particular the exact Hartshorne IV.3.1, IV.5.2, IV.5.4 and I.5.1 locators in the seeded sample remain uncertified, even where Saint-Donat or Fulton independently supports the mathematics. The finite-separable hypotheses of the Stichtenoth-derived pinned APIs were verified in Lean, not guessed from the book.
- **Kleiman–Laksov and Mattuck:** DOI resolution reached JSTOR landing pages without an accessible legal full text. **Kempf, Fulton Intersection Theory, Hersch and Accola:** bibliographic lookup through the sources service did not locate a readable legal copy. Their full proof/locator claims remain uncertified. The Brill–Noether and Thom–Porteous arithmetic above checks formulas and hypotheses; it is not a certification of those unread proofs.
- **Four LMFDB pages:** the sources service fetched a browser-check/reCAPTCHA response for modcurve.embedded_model, modcurve.plane_model, columns.modcurve_models.model_type and modcurve.canonical_field. Therefore I do not certify the numeric model-type mapping or every coordinate convention taken from those pages. Ten other cited knowls were readable; their relevant text was inspected.
- **Klein-quartic arithmetic example:** the point-count obstruction to a ℚ-isogeny with E³ was recomputed. Kato's Theorem 14.2(2) and Corollary 14.3(2), printed p.235 (kato line 4595 and line 4609), do supply finiteness of character parts under nonvanishing over a finite abelian extension. I did not independently certify the asserted cubic-field isogeny decomposition or the numerical nonvanishing value 0.516. Similarly, Derickx–van Hoeij's arithmetic-gonality table does not by itself certify the stated three-quadric model of X₁(17) over the algebraic closure.
- **Version/pagination:** Abramovich was read as arXiv alg-geom/9609012v1, and Poonen as the author-hosted PDF. The theorem numbers were matched, but I do not certify their journal page offsets from those PDFs. The Bourdon et al. author PDF's printed pp.11–14 and Voight–Zureick-Brown v4's printed pages are the versions used above.

Fulton was ultimately read from a university-hosted copy after the Michigan URLs failed; Saint-Donat from GDZ's scanned journal article after the guessed Numdam URL failed; Abramovich–Harris, Yang–Yau, Ogg and Kato from Numdam. All fetching went through the sources service. No source passage or source file was put in the roadmap.

## Source issues

- **Error** in saint-donat at the introductory theorem (2), printed p.157, saint-donat line 43: the source says quadrics and cubics generate the canonical ideal for every nonhyperelliptic genus at least three; it should exclude genus three, whose plane quartic requires a degree-four generator; affects a stated result; corrected in print at (4.13), printed p.175.
- **Misprint** in belov at the proof of Theorem 4.3(1), printed p.12, belov line 503: the source says the comparison divisor y′ belongs to the symmetric power of C; it should belong to the symmetric power of D; affects nothing.
- **Error** in belov at the proof of Theorem 4.2(2), printed p.14, belov line 633: the source says degree-d closed points map injectively to W_d; it should restrict this assertion to ℙ¹-isolated points, the points actually needed in the proof; affects the proof.
- **Error** in voight-zureick-brown at §2.6, printed p.19, voight-zureick-brown line 988: the source says a divisor of degree g−1 on ℙ¹ gives an embedding for g≥1; it should require g≥2; at g=1 the map is constant; affects nothing.
- **Error** in lmfdb-ag.bielliptic_curve at the definition, unpaginated, lines 90–96: the source says geometric double covers, pointed ground-field quotients and the stated fixed-point condition are interchangeable; it should separate descent and rational-point conditions and impose tameness for that fixed-point count; affects a stated result.
- **Error** in lmfdb-ag.hyperelliptic_curve at the displayed model, unpaginated, lines 96–100: the source says every hyperelliptic curve has the displayed conic/double-cover equations in ordinary ℙ³; it should use compatible weighted coordinates and retain the linear cover term in characteristic two; affects a stated result.

