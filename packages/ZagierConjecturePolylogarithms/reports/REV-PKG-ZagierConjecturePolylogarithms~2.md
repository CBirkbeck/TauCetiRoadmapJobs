# Review of ZagierConjecturePolylogarithms (package, round 2)

**Verdict:** needs changes

Thirteen findings: four P1, three P2 and six P3; seven blocking. The two Lean headlines elaborate. The defects are in the mathematical specification and supplier contracts, not the Lean signatures. No package input was changed.

## Previous findings, checked first

- **F01 — partly repaired.** The original algebraic sign defect is repaired: README line 536 now says “the cut cobracket of `Cor_∞(0,1,y)` is `u(1−y)∧u(y)`”. Lines 44 and 532 also explicitly fix the exterior-coordinate identifications and the higher-weight images. Independent exact calculations give the stated sign and co-Jacobi identities; see the table. However, the repair's period comparison at lines 488 and 496 still conflates the normalized numerical correlator with the canonical real period. R04 identifies that remaining problem with the actual normalization theorem in M20. The previous review did not test this comparison's two numerical values.
- **F02 — repaired.** README line 508 now says “the correlator `log|z₀ − z₁|` is continuous on its complement” and “there is no partial collision”. At `(0,2)` its value is `log 2`, and along `(0,t)` it tends to `−∞`; the latter path approaches the excluded full diagonal. This is consistent with M20 Theorem 11 and Lemma 29.

The repair report contains no finding marked not actionable. The findings below are independently checked, not instructions inherited from either earlier report.

## R01 (P1) — The period formula does not descend to the tensor product

**Location:** `packages/ZagierConjecturePolylogarithms/README.md:696`, “`− (1/6)log|x| d^C L₃*(y)`”.

**Claim:** The displayed expression defines the period on `B₃⊗U`.

**Witness:** Put `x=2`, let `y` vary near `1/2`, and add the expressions for `y` and `y⁻¹`. The tensor sum is zero; the form has imaginary-direction value `−i(log 2)³/6 ≠ 0`.

**Repair:** Replace the second term by `−(1/6)log|y| d^C L₃*(x)`. The corrected expression is additive in the unit argument, including inversion. Add the preceding inverse-pair test and a test varying `x` with constant `y`. This is a source error copied from GR (192), GR line 3600; citing that display does not validate the map. The same-variable differential formula in G08 line 4628 fixes the coefficients, while tensor linearity fixes which argument belongs in each factor. For the refuting inverse pair the corrected values sum to zero exactly.

## R02 (P1) — Square boundaries have twice the claimed value

**Location:** `packages/ZagierConjecturePolylogarithms/README.md:294`–297 and :344, “both sides equal … up to the cell signs”.

**Claim:** The vertex, edge and square formulas satisfy the cellular chain-map equation with the differential of line 44.

**Witness:** On the hexagon `(0,1,3,−3/11,2,12/11)`, the two commuting flips have symbols `A=[−6]₂`, `B=[−10]₂`. A valuation pairing gives `δ(A∧B)=1`; the four-edge boundary gives `±2`, never `1`.

**Repair:** Retain the displayed vertex, edge, pentagon and hexagon values, and replace the square value by `2A∧B`, choosing its orientation to agree with its four oriented boundary edges. Update the square Checks and product-cell convention accordingly. Do not change the independently checked CE differential. On this instance the corrected square differential and edge boundary both have pairing magnitude `2`, with equal signs after the orientation is fixed. This also matches the hexagon's `Λ²B₂` component: the six alternating cyclic terms pair under a shift by three, giving twice each of the three square terms. Halving only the vertex and edge would not be a compatible repair: the pentagon in GR (97) is also twice the corresponding weight-four value in GR lines 1920–1925.

The exact computation is independent of periods. Write the four vertex two-forms as `W, W+a, W+b, W+a+b`, with `a=δA`, `b=δB`. The oriented sum of the four unhalved edges is `2(B⊗a−A⊗b)`; the square differential is `A⊗b−B⊗a`. Pair the first factor through `δ₂` with `ord₇∧ord₂`, and the second with `ord₁₁∧ord₅`. Their values on `(A,B)` are respectively `(1,0)` and `(0,1)`. An orientation can change sign, not the factor two. GR itself changes from `exp W` to `W²` at GR lines 2243–2257 without changing the square coefficient at GR line 2284.

## R03 (P1) — The heptagon identity is asserted in the wrong carrier

**Location:** `packages/ZagierConjecturePolylogarithms/README.md:328`, “The seven-facet sum of a heptagon equals `Q₄` in `Raw₄(F)`.”

**Claim:** The seven displayed hexagon expressions equal the raw heptagon relation before quotienting.

**Witness:** For the ordered tuple `(0,1,3,7,11,17,23)`, the coefficient of `D₃₁(−69/8,−1/4)` in the seven-facet sum is `−1`; its coefficient in `Q₄` is `0`.

**Repair:** Delete the raw equality, including its restatement at line 322 and the raw-coefficient Check at line 333. State the facet vanishing in `L₄(F)`, and supply the reduction using the specialized single/double-symbol identities with its actual scalar and orientations. GR (36), GR lines 549–552, is a relation in the presented group, not a claim of equality of these two free-module vectors. The corrected statement must not identify distinct raw basis vectors: the example has raw support sizes 70 and 35. Retain that example as a negative control for the carrier distinction. Coordinate swaps and single-symbol inversion are quotient relations and cannot be used in `Raw₄`.

## R04 (P1) — Numerical Hodge correlators and canonical periods are conflated

**Location:** `packages/ZagierConjecturePolylogarithms/README.md:492`, “the result is the canonical real period of §3.7”; also :488, :496 and :696.

**Claim:** The same period is both `L₂(z)/2` and `(2πi)⁻²L₂(z)/2` on the realized single symbol.

**Witness:** At `z=i`, line 696 gives `D(i)/2 ≈ 0.4579828`; lines 488/496 give `−D(i)/(8π²) ≈ −0.01160084`. M20 Theorem 6(a), M20 line 627, explicitly inserts `(2πi)⁻ⁿ`.

**Repair:** Distinguish Malkin's numerical correlator from the canonical scalar period. If keeping the Check from M20, define its normalized tree integral with M20's Green-function and integration factors and state `p(Cor^Hod)=(2πi)^m Cor^H_M20`. Use `p`, with the separately specified Deligne Tate-coordinate conversion, in §§5.1–6.3. Alternatively rescale the numerical correlator throughout and change its low-weight Checks. At weight two multiplication by `(2πi)²` changes `−D(i)/(8π²)` to `D(i)/2`, exactly the required test. At weight one M20 line 139 gives `log|z₀−z₁|/(2πi)`, whereas §3.7 gives `log|z₀−z₁|`. The integral described in line 492 uses unscaled Green functions but borrows a value from the scaled convention; both the definition and its comparison must be fixed.

## R05 (P2) — Decorated-flag foundations have two owners

**Location:** `packages/ZagierConjecturePolylogarithms/README.md:12`, :571 and :603, claiming generic decorated flags and their general acyclic resolution as new constructions.

**Claim:** This package owns the general flag carrier, acyclicity and resolution comparison, not merely the weight-four adapter.

**Witness:** Open PR #1424, `TauCetiRoadmap/Polylogarithms/README.md:400`, already specifies decorated flags, their acyclic generic resolution, quotient-configuration sums and `stabilizedConfigurationComparison`; its line 406 specifies naturality and stabilization.

**Repair:** Import that carrier, acyclicity and comparison from Polylogarithms §3.4. Keep here the cutoff-four quotient and its adapter, with the new sign/degree comparison stated precisely. Reconcile Scope, supplier contracts and §§4.2–4.4 so the generic foundations have one earlier owner. If the earlier specification needs a more general flag-length interface, declare the precise extension as a supplier contract, rather than rebuild the same resolution. On `N=1`, both current plans cone a tuple by a nonzero vector; one imported contracting homotopy gives exactly the same zero reduced homology. The weight-four cutoff is a genuine addition; the general resolution is not.

## R06 (P2) — Tannakian theory is cited in the wrong supplier layer

**Location:** `packages/ZagierConjecturePolylogarithms/README.md:104`, “Layer 3: Tannakian categories and their fundamental groups”; also :24, :476 and :548.

**Claim:** MotivesAndAlgebraicCycles Layer 3 supplies neutral Tannakian reconstruction.

**Witness:** Open PR #1313, `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:470`, calls Layer 3 numerical motives and semisimplicity. Neutral fibers and reconstruction are §§6.1–6.2, lines 1116 and 1130, with functoriality in §6.3.

**Repair:** Replace these Layer 3 citations by §§6.1–6.3 at that head. Retain Layer 4 for geometric motives. Resolve each consumed operation separately; numerical-motive semisimplicity is not the reconstruction theorem for arbitrary mixed Tate categories. The replacement supplies the required group of tensor automorphisms: on the identity fiber of finite-dimensional vector spaces it reconstructs the trivial group, rather than assuming a motive-specific category.

## R07 (P3) — The pinned-library inventory incorrectly excludes Hodge structures

**Location:** `packages/ZagierConjecturePolylogarithms/README.md:54`, “No … Hodge structure … exists at the pins”; :58 says nothing from Tau Ceti is directly consumed.

**Claim:** Linear Hodge data and strictness must only be taken as planned roadmap inputs.

**Witness:** `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72` defines `TauCeti.Hodge.MixedHodgeStructure`; `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110` proves `MixedHodgeStructure.Hom.range_inf_F_eq_map_F` at the pinned commit.

**Repair:** Correct the inventory and name those actual native inputs under From Tau Ceti and the HodgeStructures deferral. Keep framed Hodge–Tate coalgebras, good variations, correlators and their periods as new targets: those are not supplied by the cited native structure. The native fields include bounded weight/Hodge filtrations and purity of graded pieces; they do not include a variation or a period map. Suggested.lean needs no gratuitous Hodge import, because its two headlines use none of these carriers.

## R08 (P2) — The scissors coproduct lacks its degree-one interface

**Location:** `packages/ZagierConjecturePolylogarithms/README.md:741` and :747, “`a₁` by the determinant letter” and “`δ₂∘a₂ = (a₁∧a₁)∘ν` on `A₂`”.

**Claim:** The coproduct and comparison maps in weights two and three are fully specified.

**Witness:** Only `A₂,A₃` and the source `ν:A₃→…` are introduced. The next equation applies `ν` to `A₂`. G00 line 178 defines `A₁` via a four-point cross-ratio, not one unspecified determinant.

**Repair:** Define or explicitly identify `A₁(F)≃U(F)`, with `a₁⟨l₀,l₁;m₀,m₁⟩=u(r(l₀,l₁,m₀,m₁))`, and state the coproduct components in both degrees two and three, with the admissibility conditions and their defining projection formula (G00 §2, G00 lines 179–190). Include coassociativity/descent and three discriminating Checks. At `(∞,0;1,2)` the corrected `a₁` is `u(2)`; multiplying a homogeneous lift by 3 leaves that value unchanged, whereas an individual determinant gains `u(3)`. This supplies the missing target of the `a₂` square and the inputs of §5.6.

## R09 (P3) — Removing relations cannot obstruct a map that already descends

**Location:** `packages/ZagierConjecturePolylogarithms/README.md:625` and :753, the two negative controls about omitting dual additivity.

**Claim:** Omitting a relation makes the cobracket or coproduct undefined, and the coproduct of a dual-additivity relation is nonzero in its target.

**Witness:** If `f:V/(R+S)→W` exists, `f∘q:V/R→W` exists. In this package `δ̃π₈p=R₇³p²=0`; line 753's nonzero relation image would instead prevent descent to `Aₙ` itself.

**Repair:** Replace both Checks by actual relation-cancellation tests. In §4.5 check the two orders of projection cancel in `p²`. In §5.5 expand a dual-additivity relation under the specified coproduct and check its image is zero after the target relations. Do not assert strict enlargement without a separating class. The refuting abstract example `V=ℚ²`, `R=0`, `S=ℚe₂`, `f([ae₁+be₂])=a` gives well-defined maps on both quotients and `f(S)=0`.

## R10 (P3) — The wrong-sign residual is twice its actual value

**Location:** `packages/ZagierConjecturePolylogarithms/README.md:678`, “With `+1/84` the sum is `(3/7)X`”.

**Claim:** Changing just the sign of `R₇²` produces that residual.

**Witness:** The preceding two terms become `(3/28)X+(9/84)X=(3/14)X`, not `(3/7)X`.

**Repair:** Replace `3/7` by `3/14`. With the published sign the sum is `3/28−9/84=0`; with the wrong sign and test value `X=14`, it is `3`, not `6`. The intended negative control remains nonzero.

## R11 (P3) — Zero-period columns do not refute every-family rationality

**Location:** `packages/ZagierConjecturePolylogarithms/README.md:874`, “would make the every-family statement false for families mixing such sums with genuine cycles”.

**Claim:** Accepting zero-period noncycles causes the asserted determinant failure.

**Witness:** A zero-period column makes the determinant zero, hence `q=0`. Adding such a column to a genuine column leaves every matrix entry unchanged. Neither operation falsifies the rationality conclusion.

**Repair:** Keep the useful distinction `[2]` is not a cycle although `L₄(2)=0`, and delete the claimed consequence about determinant rationality. If only one embedding is intended, specify it and give a different all-embedding counterexample; do not conflate that with a zero period vector. The valid repaired Check compares the nonzero obstruction `7ζ(3)/8` with zero period, without claiming a false determinant.

## R12 (P3) — Two other Checks fail their claimed discrimination

**Location:** `packages/ZagierConjecturePolylogarithms/README.md:178` and :567, “in `Raw₃(F)` the two are distinct” and “one-based signs reverse one of them”.

**Claim:** The raw symmetry Check has no diagonal exception, and changing the base of both face indices breaks mixed cancellation.

**Witness:** At `x=y=2`, both raw vectors are `D₂₁(2,2)`. Replacing both `∂,p` by `−∂,−p` leaves `∂p+p∂` unchanged: both length-two compositions acquire `(+1)`.

**Repair:** Require `x≠y` in the raw-distinctness Check, using `(2,3)` as the separating example. Replace the indexing Check with an explicit pair of face orders carrying coefficients `+1,−1`; state that zero-based `(-1)^i` equals one-based `(-1)^{s−1}` for `s=i+1`. A uniform global sign is not a counterexample to anticommutation. Both repaired tests have the claimed values.

## R13 (P3) — Several definitions lack their required API and individual Checks

**Location:** `packages/ZagierConjecturePolylogarithms/README.md:492`, :654, :721 and :854–874.

**Claim:** Every definition has its API and at least three discriminating Checks.

**Witness:** §§3.9, 4.7 and 5.3 have no API fact list. §6.4 introduces eight definitions but its five Checks concern mainly determinants and cycles; none tests `trilogCyclic` or the natural-weight integral's exceptional branches individually.

**Repair:** Supply API fact lists for the named constructions and three discriminating Checks for each definition, sharing a test only where it actually computes that object's behavior. For the simple restatements use small nontrivial values, denominator/admissibility exclusions and a wrong-model comparison; keep them in README, not Suggested.lean. For example, `polylog 0 1=0` is a totalized junk value, `polylog 1 3=−log 2−πi` fixes the cut side, and the disc coefficient of weight two is `1/k²`; the three tests examine different parts of the definition. Add the scissors API from R08 at the same time.

## Verified sound

**Scope of the pass.** All 47 numbered sections were read, including every Needs line and every Check. Untouched claims were inherited from the previous review only when it recorded computed values, explicitly marked “prior computed row” below. The repaired conventions and §§3.1, 3.3–3.4, 3.8–3.10, 3.12–3.13 and the Layer 3 example were checked again. All 15 seeded targets were read against their cached sources. Previously uncomputed scissors and residue/Chern passages were opened, including G00 and the G93 OCR scan. No source fetch or manifest change was needed; all six cited works have manifest entries. No locator is flagged unverified in README or sources.toml.

**Principles and organization.** This is explicitly a Part II of Polylogarithms, with a genuine weight-four scope. No route-specific prime restriction, copied source passage, executable mathematical algorithm, sorry'd data, `set_option`, or prohibited supplier was found. The mathematical dependencies explain the layer order; it does not follow the paper's chapter sequence. The raw-formula forward reference from Layer 2 to §3.1 is separated from its later descent, so it does not itself create a proof cycle. R05 is the ownership exception. No permission, publishing or external write was performed.

**Acceptance file.** `lake env lean` was run on the absolute package file from the specified content checkout. It exited 0 with exactly two warnings, at Suggested.lean lines 123 and 132, both `declaration uses sorry`. There are eight real-bodied definitions and two sorried theorems. No data declaration uses sorry. There is exactly one `import Mathlib`, one module docstring, the correct namespace and declaration docstrings, and no padding examples or API lemmas.

A scratch copy replaced both proofs with a one-tactic probe using `rfl`, `infer_instance`, `simp`, and `exact riemannZeta_four` as alternatives. Neither theorem closed: the existence goal remained, and the rational-field zeta lemma did not have the every-family goal's type. The near-match file's other candidates are logarithm series, ordinary zeta values, embedding matrices and unit regulators, not either all-number-field weight-four theorem. No padding finding is warranted. A second scratch copy appended `#check @name` for all ten declarations and elaborated successfully. The types retain the field/number-field instances, the family and its cycle hypothesis exactly as needed; the universal relation test ranges over `V : Type u` containing the actual quotient. No lost binder or generality mismatch was found.

**Headlines.** Both end theorems named in the Summary are present: `zagier_four_exists` has `q≠0`, and `zagier_four_everyFamily` allows `q=0`. The module docstring names the non-statable extension/descent/cluster theorem, motivic realization/base-point/depth and every-cycle period results, collision continuity, Grassmannian/Chern comparison, and the K-theory/regulator comparison. Plain mixed Hodge structures now exist, but the framed coalgebra, good variations, motivic groupoid, explicit Bloch groups and higher K-theory carriers still do not follow from them. R07 corrects the inventory without demanding a stand-in headline. All ten own ASCII declaration names occur in README and are declared in Suggested.lean; no same fully qualified declaration was found elsewhere.

### Adversarial calculations

`u(p)` is abbreviated by `p` in rational-unit exterior expressions. Values are exact unless marked approximate. A prior computed row is reused only for an unchanged statement, not as evidence for a changed normalization.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| §1.1 raw tags and cross-ratios | `S₃(2),D₂₁(2,2)`; standard infinity tuples | distinct basis vectors; `s(∞,1,0,x)=r(∞,0,1,x)=x`, whereas `s(∞,0,1,x)=1−x` | agrees |
| §1.1 six-point sign | `(0,1,2,3,4,5)` | numerator `1`, denominator `5`, `Z=1/5` | prior computed row retained |
| §1.2 specialization | orders `(1,0),(0,1),(−2,−2),(−2,−1)` | weight four: `S₄(v₀),−S₄(u₀),3S₄(u₀/v₀),0`; weight three: `−S₃(v₀),−S₃(u₀),2S₃(u₀/v₀),0` | matches GR (26); equal-pole δ coefficients `2+1=3` |
| §1.3 raw versus quotient symmetry | `x=y=2`; `x=2,y=3` | raw difference `0`; at unequal arguments the two basis coefficients are `+1,−1`, quotient difference `0` | R12 |
| §1.4 presentation | `x=−1,y=1` in the specialization | `D₃₁(−1,1)=−2S₄(2)+S₄(−1)` on both quotient descriptions | prior computed row retained |
| §§1.5–1.6 | `(x,y)=(2,3)` and `x=tu` | inverse `[1/2]+[2/3]+[3/2]+[2]−[4/3]−[1]`; specialized δ `−[v₀]₂⊗u(v₀)` | agrees; algebraic specialization gap remains declared |
| §2.1 cells | `m=0,1,2,3` | cell counts `(1)`, `(2,1)`, `(5,5,1)`, `(14,21,9,1)`; Euler values all `1` | agrees with GR pp.20–21 |
| §2.2 flip | minors `2,3,1,1` as in README | `X=6`, other Plücker product `7`; both sides `7∧6≠0` | prior computed row retained |
| §§2.3–2.5 square | explicit rational hexagon in R02 | `δL²` pairing `1`; `L³d` pairing `−2` or `2` | R02; corrected square gives magnitude `2` |
| §2.4 rotation | a six-tuple and its one/two rotations | cyclic coefficient sequence `(1,−1,1,−1,1,−1)` becomes its negative / itself | rotation rule correct |
| §2.4 seven facets | tuple in R03, coefficient of `D₃₁(−69/8,−1/4)` | `−1` versus `0`; raw support `70` versus `35` | R03 |
| Conventions / §3.1 CE sign | `x=3,y=5`; apply δ₂ to the B₂ factor | with `e=2∧3`, `f=2∧5`, tensor contribution `2f⊗e−2e⊗f`; wedge contribution `2e⊗f−2f⊗e`; sum `0`; reversed wedge rule gives `4f⊗e−4e⊗f≠0` | repaired sign is correct |
| §§3.2–3.3 cycles and extension | `[1]`, `[2]`, `[x]+[x⁻¹]`, `D₃₁(3,5)` | obstruction `0`, `7ζ(3)/8`, `0`; `δ₂₂D₃₁(3,5)=[3]₂∧[5]₂`, image `2e∧f≠0` | agrees; no kernel-as-definition shortcut |
| §3.3 quasi-isomorphism | quotient of explicit inclusion | quotient terms `Λ²B₂ → Λ²B₂`, map identity; both cohomology groups `0` | agrees with GR (44) |
| §3.4 reduced words | two punctures; length two pure word | before pure quotient one generator, after quotient `0`; length three pure shuffle coefficient `2`, hence class `0` over ℚ | agrees |
| §3.4 cut order and co-Jacobi | lengths 3,4,5 and `(0,0,x,1,y)` | respectively `3,8,15,15` cuts; exact formal double differential has `0` nonzero terms in all cases; length-three reversal gives negative | independently recomputed |
| §3.5 special derivations | three punctures, `ad X₁`; two punctures | `D(X_a)=−[X₁,X₂]≠0`; two-puncture positive derivation space `0` | prior computed row retained |
| §3.6 framed objects | Kummer at `−1`; split extension; Tate identity | rational weight-one class `0`; indecomposable extension class `0`; weight-zero framed identity `1` | distinguishes unit from positive indecomposables |
| §3.7 period/rigidity | Kummer at `2,3`; two-step weight `m=2` | periods `log 2≠log 3` for nonconstant weight one; `F⁻¹ℚ(2)=0`, so period derivative `0` in weight two | rigidity range correct |
| §3.7 ω₃ | swap/repeat inputs | coefficient `1/6`; a transposition gives `−ω₃`, repetition `0` | exterior sign agrees |
| §§3.8,3.13 weight two | `y=3` | cut `(1−3)∧3=2∧3`; symbol boundary `2∧3`; opposite sign `−2∧3` | F01 algebraic part repaired |
| §§3.8–3.9 period comparison | `z=i` and weight-one pair `(0,2)` | `D(i)/2` versus `−D(i)/(8π²)`; `log 2` versus `log 2/(2πi)` | R04 |
| §3.10 collision | `(0,t)` and `(0,1,1+t)` | weight one `log|t|→−∞` on excluded diagonal; weight two partial-collision `D(1+t)→D(1)=0` | F02 repaired |
| §3.11 base point | empty/full replacement sets | empty coefficient `+1`; full pure word of length ≥3 equals `0` | prior computed row retained |
| §3.12 depth threshold | lengths `3,4,5` | weights `2,3,4`; repeated length-three class `0` but `D(i)≠0`; weight-four two stated generator families | threshold agrees; no reduction asserted at length 3 |
| §3.13 higher single cuts | `(0,0,1,y)`, `(0,0,0,1,y)` | surviving expressions `Cor(0,1,y)∧u(y)` and `Cor(0,0,1,y)∧u(y)`; pure shuffle coefficients `2,3` kill other relevant factors | signs agree with `a∧b↦a⊗b` |
| §3.13 double weight-two factor | `(0,0,3,1,5)` | `(2,2)` cut `−[3]₂∧[5]₂`; coordinate conversion gives `+[3]₂∧[5]₂` | repaired negative exterior identification correct |
| §3.13 constant extension | ℚ in weights 3 and 4 | primitive ranks `1,0`; period `L₃*(1)=3ζ(3)/8≠0` | constants cannot be killed uniformly in odd weight |
| §4.1 quotient | degrees 4,5; mixed global sign | `BC₄=0`, `BC₅=C₅(4)`; `(-∂)(-p)+(-p)(-∂)=∂p+p∂=0` | quotient correct; indexing Check R12 |
| §4.2 flags | two first lines `ℚe₁,ℚe₁` in ℚ²; `ℚe₁,ℚe₂`; change lift `e₂→e₂+3e₁` | sum ranks `1<2`, `2=2`; quotient decoration difference `0` | genericity correct; ownership R05 |
| §4.3 adapter | `N=4`, `p=0`, degree `m≥5`; `aᵢ=p` | one summand `a=0`, same vector class; largest decoration index `p+1` | weight-four specialization correct |
| §4.4 resolution | `N=1`; `N=2,F₂` | augmented cone contraction; exactly `3` lines in `F₂²`, no fourth generic line | prior computed row retained; import general construction |
| §4.5 projectivization | scale one of eight vectors by 2 over ℚ; projection boundary | same projective class, different simultaneous-GL vector class; `δ̃π₈p=0` | definition correct; claimed obstruction R09 |
| §§4.6–4.8 lower coefficients | three formal coefficients `a₁,a₂,a₃` | `(-3/2−1)a₁+(2−2)a₂+(3+1−4)a₃=−5a₁/2` | first square's coefficient calculation correct |
| §4.7 symbolic modules | `b₂(2,6),b₂(3,7)`; triple constant | dimensions `10,55` (prior computed row); three-term image `[1]₃≠0`, but δ₃ image `0` | quotient by constant needed as stated |
| §4.8 degree eight | prior independent two-configuration period evaluation | `X≈−60.7015`; projected alternation `/X=−9`; contributions `−6.50373,+6.50373`, sum ≈0 | unchanged prior computed row retained |
| §4.8 wrong sign | coefficient arithmetic alone | `3/28−9/84=0`; `3/28+9/84=3/14`, not `3/7` | R10 |
| §5.1 scalar calibration | `z=i,2,2+i` | `5L₄(i)/16`; `0`; `L₄*(2+i)≈0.146294` versus `5L₄(2+i)/16≈0.139391` | scalar formula correct; tensor formula R01 |
| §5.1 tensor map | `x=2`, inverse pair at `y=1/2` | tensor input `0`, bad output `−i log³2/6≈−0.05550411i`; corrected output `0` | R01 |
| §5.2 cycle correction | `[x]+[x⁻¹]`, `[1]` | `D(x)log²|x|−D(x)log²|x|=0`; `0·0=0` | prior computed row retained |
| §§5.3–5.4 residues | `t₁∧t₂∧u∧w`; codimension 1 and 4 | iterated values `ū∧w̄` and `−ū∧w̄`; total degrees `3,8`; `dd^C log|t|=2πi δ₀` | degree/sign conventions agree |
| §5.5 scissors | four-point degree-one test; forgetting a relation | `a₁(∞,0;1,2)=u2` invariant under lift rescaling; quotient-map example R09 has `f(e₂)=0` | R08–R09 |
| §5.6 normalization | replace `r₃` by `T₃=3r₃` | `(1/6)a′₃=(1/18)(3a′₃)`; wrong `1/2` coefficient is nine times `1/18` | matches G00; prior normalization calculation retained |
| §5.7 symbol/segment | weight four, first segment | symbol determinants `1234,2345,3456,4567`; first varied coordinate `a₁₁`, not nonexistent `a₁₀` | prior computed row retained |
| §5.8 correction | wedge part of R₇³ and δD₃₁ | coefficient `−3/28` and symbol-wedge coefficient `+1`; chosen correction cancels | prior computed row retained |
| §§5.9–5.10 residues/Chern class | codimension 3; `U(3),U(4)` | unit term degree `1+6=7`; primitive degree-seven ranks `0,1` | G93 locators support transgression/nonvanishing |
| §§6.1–6.2 | `i=1,4`; rank zero; determinant exponent | `K₇→H¹`, `K₄→H⁴`; totally real source `0`; `3r₂+(r₂−4N)=−4(r₁+r₂)` | degree/exponent correct |
| §6.3 every-cycle periods | zero, inverse-pair cycles | period vectors `0`, `0`; realization δ values `0`, `0`, so primitive containment applies | route uses declared mixed-Tate contract; normalization must be repaired |
| §6.4 existence | ℚ; ℚ(i) with `[i]` | empty det `1`, `Z₄=π⁴=90ζ(4)`; torsion unit gives cycle, `L₄(i)=β(4)`, `Z₄=π⁴β(4)/2=45ζ_{ℚ(i)}(4)` up to embedding sign | headlines correct on these separating cases |
| §6.4 every family | zero column; `[i]+[−i]` | determinants `0`, `0`, with `q=0`; adding a zero period vector changes determinant by `0` | headline permits this; Check R11 |
| §6.5 presentation square | `[x]`; inductive `[1]` | both composites `[x]₃^ind⊗u(x)`; `2[1]₄^ind=0`, rational class and period `0` | prior computed row retained; no unconditional lifting claimed |

### Source sample, locators actually opened

| Seeded target | Text and locator | Outcome |
| --- | --- | --- |
| 1.2 | GR (26), pp.10–11, GR lines 399–441 | Orders, signs and factors 2/3 agree. |
| 1.4 | GR Definition 1.11, (32)–(33), p.12, GR lines 505–521 | Presentation and displayed specialization agree. |
| 2.1 | GR §1.3, Figure 6, pp.20–21, GR lines 877–890 | Noncrossing faces and cell counts agree. |
| 2.2 | GR (52)–(55), pp.19–20, GR lines 828–869 | Symplectic determinant formula and flip sign agree. |
| 2.4 | GR (35)–(36), p.13, GR lines 537–552; (102), p.52, GR lines 2297–2302 | Hexagon formula agrees; raw equality overclaim is R03. |
| 3.2 | GR Definition 1.11, p.12, GR line 517; Theorem 1.14 and (44), p.16, GR lines 676–703 | Span, inclusion and quasi-isomorphism agree. |
| 3.7 | GR Theorem 8.3, (185)–(188), pp.76–77, GR lines 3520–3552; Lemma 2.7, p.33, GR lines 1438–1444 | Dg-period and rigidity statement have the stated scope. |
| 3.9 | GR §2 item 6, p.31, GR lines 1345–1386; M20 example after (16), p.18, M20 lines 889–899; Theorem 6(a), p.13, M20 line 627 | R04: two different normalizations were combined. |
| 4.1 | GR (129)–(130), pp.62–63, GR lines 2794–2866; duality (159), pp.68–69 | Row quotient and dual cutoff agree; indexing Check R12. |
| 4.2 | GR (131)–(132), p.63, GR lines 2867–2876 | Flag dimensions, quotient decorations and genericity agree; ownership R05. |
| 4.5 | GR Definition 7.5, (161)–(162), p.70, GR lines 3223–3231 | Both quotient relations occur; negative control R09 is not supported. |
| 4.8 | GR (160), p.69, GR lines 3216–3220; Theorem 7.6/Lemmas 7.7–7.9, pp.70–72; Theorem 10.15, pp.106–107, GR lines 4798–4854 | Source's separate vanishing and missing factor cannot be imported literally; package's cancellation is retained, Check corrected by R10. |
| 5.1 | GR (191)–(192), pp.77–78, GR lines 3590–3608; G08 §11.1, pp.104–105, G08 lines 4582–4628 | Scalar combination agrees; tensor formula copies the source error R01. |
| 5.5 | GR §9.3 item 1, p.91, GR lines 4150–4166; G00 §2, printed pp.4–5, G00 lines 155–190; (6), PDF p.8, G00 lines 303–317 | Group relations/a₂ formula supported; missing degree-one/coproduct interface R08 and false Check R09. |
| 6.3 | GR Theorem 1.13, (40)–(41), pp.15–16, GR lines 660–671; G08 §1.3, pp.7–8, G08 lines 294–315; GR (191) | Primitive-K-theory route supported, conditional on named contract; R04 must fix the period comparison. |

All six cached sources are legal manifest copies. G93's scan was read through its supplied OCR: printed p.190, Theorem 4.5 and (4.10)–(4.11), G93 lines 787–815; printed p.191, Theorem 4.6 and (4.13)–(4.14), G93 lines 831–860. The theorem number 4.5 is partly lost in OCR, but the location, residue equation and following 4.6 identify it. G00 Theorems 3.2–3.3 and the `a₃` formulas were read at G00 lines 446–477 and 563–574. G09's integrable symbol and the distinction between the two Grassmannian functions are retained from the previous computed row; they were not used to infer uniqueness from a symbol.

### Pins, duplication and suppliers

The content manifest pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following native declarations were opened at those pins, rather than inferred from a name search:

- `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:50`: `NumberField.dedekindZeta` is the ideal-norm L-series. `NumberField/Discriminant/Defs.lean:36`: `NumberField.discr` is the integer discriminant of an integral basis. `NumberField/InfinitePlace/Basic.lean:102`, :188, :437, :441 give the chosen embedding, complex-place predicate and signature counts.
- `Mathlib/NumberTheory/Bernoulli.lean:197` and :207 give `bernoulli` and `bernoulli_one`. `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean:232` gives `riemannZeta_four`, which is only the rational-field scalar value, not a duplicate headline. `Mathlib/Analysis/SpecialFunctions/Complex/Log.lean:30` and `Arg.lean:30` give the total logarithm and argument used in the definitions.
- `Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean:54`, `Span/Defs.lean:46`, `Quotient/Defs.lean:61` and :227, `TensorProduct/Basic.lean:122` supply linear evaluation, span, quotient projection and bilinear descent. In particular a proposed tensor map must be additive in both factors; R01 fails this native requirement.
- `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:79` and `ExteriorPower/Basic.lean:56` give the exterior power and its alternating insertion. `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:97` and :141 give empty determinant 1 and multiplicativity.
- `Mathlib/Algebra/Lie/Free.lean:121` and `Algebra/Lie/Derivation/Basic.lean:43` supply the free Lie algebra and actual derivations. `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:226` supplies group homology of a representation.
- `Mathlib/CategoryTheory/Preadditive/Projective/Resolution.lean:41` and `CategoryTheory/Abelian/Projective/Resolution.lean:92`: `ProjectiveResolution.lift` really takes two projective resolutions. It does not directly take an arbitrary acyclic flag complex. This library near-match is not a duplicate of the general comparison theorem, but Polylogarithms already plans that comparison (R05).
- `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72` and `Mixed/Strictness.lean:110` supply the existing mixed structure and strictness (R07). The frame/variation/period construction is additional mathematics, not an existing native theorem.

The roadmap/package index was read before ownership conclusions. Its three other board packages are AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory. Object searches used `roadmaps grep` across main and the indexed open heads, plus the pinned trees: correlators, decorated flags, special derivations, framed mixed Hodge–Tate structures, Grassmannian polylogarithms, scissors congruence and Stasheff complexes. The consequential overlap is R05. FukayaTheory's associahedra concern compactified disc moduli, and do not supply this arithmetic finite-cell carrier. ColemanIntegration's scope concerns p-adic iterated integrals and regulators, not these complex/motivic weight-four groups. No other same-object owner was found in the returned matches; this is a search result, not a claim that all vocabulary synonyms were exhausted.

Every cited supplier was read at main or its available open head. Resolved contracts, with representative file locations (line counts exclude the tool's header):

| Supplier | Resolved objects and locations |
| --- | --- |
| PolylogarithmFunctions, main | `TauCetiRoadmap/PolylogarithmFunctions/README.md`, §§1.1, 4.2, 4.6–4.7, 5.1–5.2, 5.7: native-carrier analytic formulas, lower cut, Bernoulli normalization and five-term identity. Natural weights here specialize its integer-weight definition. |
| Polylogarithms, #1424 | `TauCetiRoadmap/Polylogarithms/README.md:137`–168 (D descent and primitive Hurewicz), :311–395 (§§3.1–3.3), :397–520 (§§3.4–3.6), :520 (§3.7), :576–716 (§§4.1–4.7), :832–1147 (cited current/regulator sections). The 22-term relation retains `[1]`; the cycle predicate is universal. The new general flag ownership matters: R05. |
| K3BlochGroups, #1430 | `TauCetiRoadmap/K3BlochGroups/README.md:581`, :608, :682, :717, :806 resolve §§3.2–3.5, 3.8. Its boundary is `x∧(1−x)`; the package explicitly uses its negative. |
| BorelRegulators, #1461 | `TauCetiRoadmap/BorelRegulators/README.md`, §§1.1, 2.2–2.3, 5.3–5.4, 6.0a, 6.2: Tate-divided coordinates, rank, rational-basis determinant, shared Chern realization and `r_Bo=−2r_Be`. In particular :663 has exponent `dₙ−Nn`, and :796 the signed comparison. |
| MotivicEtaleKTheory | `TauCetiRoadmap/MotivicEtaleKTheory/README.md:397`, :420, :650 resolve §§3.3–3.4 and 7.1. The logarithmic realization covers all smooth separated finite-type complex varieties and all algebraic morphisms; it is not restricted to proper varieties. |
| PeriodsAndSpecialValues, #1496 | `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:751`, :2084, :2189, :2210, :2230 resolve PS.3.0, PS.9.3, PS.9.8–PS.9.10. Actual scope is ℚ/ℤ and the three-punctured line; the package's broader inputs remain declared contracts. |
| MotivesAndAlgebraicCycles, #1313 | `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:555` supplies Layer 4. Layer 3 does not supply the cited Tannakian reconstruction; §§6.1–6.3 do (R06). |
| HodgeStructures, main/completed | `Completed/HodgeStructures/README.md:326` supplies L2; actual implementations are the pinned Tau Ceti modules listed above. |

The three declared gap slugs occur in both README and `design/plan.json`: `trilog-specialization-closure`, `mixed-tate-number-fields`, `punctured-line-path-torsors`. Each has a named earlier supplier and describes the necessary mathematical interface. The trilogarithm supplier's analytic `coordinateRelation_specialize` does not prove algebraic closure of its relation subgroup. PS.9.8–PS.9.10 do not already provide the whole number-field/arbitrary-puncture interfaces. These coherent supplier contracts are not reported as unowned prerequisites, and no extra gap is invented here.

The supplied overlap ledger reports no conflicting package head, dropped cited id, or revision-only cited id. Its closest roadmaps were inspected. A fresh `roadmaps overlaps ZagierConjecturePolylogarithms` could not reproduce a package-only lookup: it reported no such roadmap on main or in an open content PR. Therefore the supplied ledger, rather than that failed refresh, is the evidence for the mechanical overlap categories. Semantic supplier drift is independently recorded in R05–R06. `roadmaps resolve` found no missing citation/name, but explicitly skipped pinned-library names; the manual pin checks above are essential and found R07.

The mandated dependency command completed with:

```text
depcheck: 236 roadmaps, 2140 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All external Needs edges were compared with the available suppliers. The general flags and Tannakian locator require the repairs above; no numerical merge-order edit is requested.

## Not verifiable

- No cited publication was inaccessible. G93 was available by OCR, with the noted partial loss of the printed theorem number. No missing-reference request is needed.
- The tool's live overlap refresh does not accept this package-only roadmap name; the supplied head-based overlap ledger was used instead. No claim of a successful fresh overlap computation is made.
- The three declared supplier contracts are future library obligations. Their mathematical scope and ownership were reviewed; their implementation is not available at the pins. They are not additional findings.
- The unchanged degree-eight numerical test is explicitly inherited from the previous review's computed row. This round recomputed its coefficient arithmetic, not the 8! numerical alternation. It is not used to certify the newly changed cluster normalization, which fails independently in R02.

## Source issues

- **Error** in GR at (192), printed p.78, GR line 3600: the source places the trilogarithm derivative on the unit argument; it should place it on the symbol argument and multiply by the unit logarithm; affects a stated result.
- **Error** in GR at §4.3, (95) and (99), printed pp.50–51, GR lines 2257 and 2284: the source doubles the edge normalization while leaving the square normalization unchanged; it should give each square twice its displayed value, with compatible orientation; affects a stated result.
- **Misprint** in GR at Lemma 3.13, printed p.43, GR line 1901: the source adds the exchanged tensor term; it should subtract it, as required by the exterior square and formula (160); affects the proof.
- **Misprint** in GR at Theorem 10.15(b), (244), printed p.106, GR lines 4808–4816: the source gives an unscaled wedge with the normalized target; it should multiply the displayed target by `−84`, as computed on p.107; affects a stated result.
- **Error** in GR at Definition 2.3, printed p.29, GR line 1269: the source's weight-two symbol has the opposite cut cobracket; it should use the positive `(0,1,y)` correlator under its stated cut order; affects a stated result.
- **Error** in GR at Lemma 7.9, printed p.72, GR line 3341: the source asserts separate deletion vanishing; it should retain cancellation with the projection contribution; affects the proof.
- **Gap** in GR at Lemma 5.2(ii), printed p.54, GR lines 2423–2427: the source invokes specialization to identify presentations; it should justify closure of the coordinate-relation subgroup under the required iterated specializations; affects the proof.
- **Misprint** in GR at §1.2 item 3, printed p.14, GR line 581: the source gives coefficient one for equal poles; it should give coefficient three, as table (26) and the following cobracket computation do; affects nothing.
- **Misprint** in GR at §9.3 item 2, printed p.93, GR line 4228: the source varies first-row entry `k−1`; it should vary entry `k` for its one-based segment index; affects nothing.
- **Misprint** in GR at §9.3 item 2, printed p.93, GR line 4247: the source omits the double-symbol correction coefficient; it should include `−3/28` from the configuration formula; affects nothing.
- **Error** in GR at §9.3 item 1 and footnote 24, printed pp.91–92, GR lines 4177–4185: the source uses `1/2` with its stated triple-ratio normalization; it should use `1/18` for that normalization to recover G00's map; affects a stated result.
- **Error** in G08 at Proposition 8.4, printed p.85, G08 line 3713: the source identifies the cyclic shuffle object with special derivations without removing surviving pure length-two words; it should quotient their kernel in weight one; affects a stated result.
- **Error** in G08 at §1.3, printed p.7, G08 lines 300–302: the source's finite-rank formula includes `K₁(F)`; it should restrict the Borel rank formula to weights greater than one, since `ℚˣ⊗ℚ` has infinite rank; affects a stated result.
