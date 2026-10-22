## H01 (CBirkbeck) — applied

The representative catalogue → eleven headline theorems and four necessary real-bodied definitions in `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean:62`; the acceptance test includes the full integer-family Stoll theorem, the full affine-line orbit-intersection theorem, algebraic Legendre torsion specialization, and both common-torsion bounds. The Stoll and orbit-intersection statements replace their former x²+1 and diagonal specializations at lines 85 and 132, agreeing with `TauCetiRoadmap/ArithmeticDynamics/README.md:8089` and §6.84.

## H02 (CBirkbeck) — applied

The “representative signatures” disclaimer → an explicit headline inventory and a theorem-by-theorem account of missing carriers in `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean:4`, including polarized arithmetic varieties, dynatomic projective models and Jacobians, analytic dynamical measures, adelic pairings, preimage towers and quasi-projective varieties. No abstract Tate-limit or power-map substitute remains; the README retains the full general targets and their hypotheses.

## H03 (CBirkbeck) — applied

Forty-seven former named declarations and all nineteen value or boundary examples are removed from `TauCetiRoadmap/ArithmeticDynamics/Suggested.lean`; each of its eleven remaining theorems ends with `sorry`, and its four definitions have real bodies needed by those theorems. The removed orbit API, generic Tate-limit laws, Morton-coordinate identities, height conversions and Check assertions remain mathematical development in the README, without an acceptance-test declaration claim.

## H04 (CBirkbeck) — applied

The local API and Check declaration labels → prose throughout `TauCetiRoadmap/ArithmeticDynamics/README.md` (1,115 labels converted), with the acceptance inventory at line 776 and the native projection and torsion statements in §§6.57, 6.87, 6.111 and 6.112. Every acceptance declaration is named there, no deleted declaration remains backticked as a local declaration, and the generic Legendre model, discriminant and j-invariant are assigned to their existing suppliers in Scope and the contract at line 120.

# Verification record

The four findings follow the four distinct requirements of the single review, in their original order. It contains no question requiring an answer and no suspicious request to execute an external instruction.

**Sources and mathematical scope.** The following locators were read in legal cached or legally fetched texts; no source passage was copied. Existing reference keys were reused, and no source manifest outside the two authorized roadmap files was edited.

| Acceptance statement | Evidence |
|---|---|
| Rational three-cycle uniqueness | morton92 line 137, Theorem 3, printed p. 346; morton92 line 835 and line 848, elliptic reduction, printed pp. 362–364. |
| No rational four-cycle | morton98 line 177, Theorem 4, printed p. 93. |
| No rational five-cycle | fps95 line 68, Theorem 1, arXiv v1 p. 2. |
| Stoll integer families | stoll-1992-quadratic-iterates, Section 3 theorem; the citation remains waived, cited by locator alone. All three families are retained, rather than only a=1. |
| Ritt classification | ghioca-tucker-zieve-2008 line 678, Proposition 6.3, arXiv v2 p. 17. Positive composition index and the monomial case s=0 are retained. |
| Product-of-orbits affine-line intersection | ghioca-tucker-zieve-2008 line 94, Theorem 1.5, arXiv v2 p. 3. The hypothesis counts distinct pairs in the product of the two orbits, without synchronizing their indices. |
| Polynomial-line return times | ghioca-tucker-zieve-2008 line 83, Theorem 1.4, arXiv v2 pp. 2–3; README §6.90 separates finite orbits, finitely many distinct hits and periodic-line returns to obtain the stated progression form. |
| Whole-field integral embedding | cassels-embedding-1976 line 17, Theorem I, pp. 193–194; its unit conclusion for nonzero marks implies the integral conclusion after omitting zero marks, whose norm is zero. |
| Algebraic Legendre torsion specialization | dwy-2014-v3 line 61, Theorem 1.2, p. 2; dwy-2014-v3 line 1144, §6.5, pp. 28–29. Taking equal constant marks gives infinitude; the defining nonconstant algebraic relations keep the parameters algebraic. |
| Uniform common Legendre torsion | demarco-krieger-ye-2020 line 89, Theorem 1.4, arXiv v2 p. 3. |
| Standard projections and three common branch values | demarco-krieger-ye-2020 line 66 and line 1905, definition and Corollary 8.2, arXiv v2 pp. 2, 44–45. An invertible projective coordinate change after the x-quotient represents every standard projection on a Weierstrass model. |

**Native carriers and ownership.** Mathlib was checked at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching the manifest pins. `Function.minimalPeriod` in `Mathlib/Dynamics/PeriodicPts/Defs.lean:245` gives zero for a nonperiodic point; `Polynomial.Gal` in `Mathlib/FieldTheory/PolynomialGaloisGroup.lean:56` is the splitting-field automorphism group and has a finite-type instance. Neither definition supplies a rooted preimage tree.

`WeierstrassCurve.Affine.Point` in `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:477` contains infinity and nonsingular affine points; it does not assume that the model is elliptic. Its `xRep` at line 887 is (1,0) at infinity and (x,1) at an affine point; the new projection specializes this native map instead of defining another point carrier. `Matrix.GeneralLinearGroup` in `Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:42` supplies invertibility, and `Algebra.EssFiniteType` in `Mathlib/RingTheory/EssentialFiniteness.lean:40`, together with `IntermediateField.fg_top_iff` in `Mathlib/FieldTheory/IntermediateField/Adjoin/Algebra.lean:92`, expresses finite field generation without imposing finite algebra generation.

The existing scheme rational-map quotient in `Mathlib/AlgebraicGeometry/Birational/RationalMap.lean:374` is not the degree-indexed, everywhere-defined projective-line action needed by the dynamical height targets. Object and operation searches at the pins found no corresponding dynatomic projective models, Berkovich dynamical projective-line measures, adelic dynamical pairing, preimage-tree action or quasi-projective-variety carrier; their absence is stated in the module docstring instead of encoded by free predicates.

Ownership was searched by object on main (`0ed44854ba705f0561f1c53fd46a84208d9a91a5`), the board packages, and the supplied open checkouts for ComputationalNumberTheory, ConformalMappingPartII, EffectiveClassNumbers, AbelianSchemesAndArithmeticModuliPartII, GanGrossPrasadUnitaryGroups, SelmerIwasawaCohomologyPartII, QSeriesPartitionsAndMockModularForms, K3SurfacesAndSymplecticBoundedness, CohomologyComparisonsPartII, ColemanIntegrationPartII, QWittVectors and ErdosProgressionPowers. The new dynamical projection and torsion endpoints have no competing owner there; HeightsRationalPointsAndObstructionsPartII's design explicitly consumes the ArithmeticDynamics common-torsion theorem.

ModularCurves §4C owns the universal Legendre family. MordellLawrenceVenkatesh §6.4 already owns its native coefficient model and the declarations `legendreCurve`, `legendreCurve.Δ_eq` and `legendreCurve.j_eq`; those exact declarations and their hypotheses were read at its open head. The new acceptance definition only specializes the five existing coefficients inside a torsion-image set. The board's EllipticLegendreCharacterInterfaces design also discusses that model; no new supplier dependence on that design is introduced. ErdosProgressionPowers §2.1 still attributes the model and discriminant to ArithmeticDynamics §6.35; its read-only text was not edited, and this roadmap now directs those objects to their existing owner. No declaration here uses another roadmap's fully qualified name, and no notion was moved to a later supplier.

The cross-roadmap resolution found no unresolved citation. The final dependency-direction output is:

```text
depcheck: 13 roadmaps, 101 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

**Elaborated signatures.** A scratch file containing every final declaration and `#check @name` for all fifteen declarations elaborated successfully under the defaults. Each elaborated type was compared with the corresponding README statement: characteristic zero remains in both polynomial-orbit theorems; finite field generation, the prime bound and all marks remain in Lech–Cassels; algebraicity and both excluded branch marks remain in torsion specialization; all five Legendre exclusions remain in its uniform bound; and both ellipticity instances and the exact three-branch-value condition remain in the general uniform bound. The original suspect `tateLimit` height variable was shadowed by the explicit height argument rather than a lost mathematical hypothesis; that generic definition is removed, and no required binder is missing from the final declarations.

**Adversarial mathematics.** The table covers every final acceptance declaration and the additional mathematical conventions and identities introduced by the repair. Unchanged mathematical API bodies and Checks were preserved while their declaration labels were converted to prose; this is not a claim to reprove the entire inherited README.

| Statement | Instances and computed values on both sides | Result | Change |
|---|---|---|---|
| `forwardOrbit` | Identity at 0 gives {0}; successor at 0 has first terms 0,1,2; z²−1 at 1 has terms 1,0,−1,0 and orbit {1,0,−1}. | Zero iteration is included; a genuine tail is retained. | Kept real body for the product-of-orbits theorem. |
| `noRationalFourCycle` | At (c,x)=(0,0),(−1,0),(−29/16,5/4), minimal periods are respectively 1,2,3; each differs from 4. The last orbit is 5/4,−1/4,−7/4,5/4. | Fixed points, two-cycles and three-cycles are permitted. | Kept headline. |
| `noRationalFiveCycle` | The same periods 1,2,3 all differ from 5. A formal five-cycle over a quintic extension is outside the rational point carrier. | No unintended exclusion of shorter rational cycles or assertion over algebraic points. | Kept headline. |
| `atMostOneRationalThreeCycle` | With c=−29/16 and x=5/4, the possible y values 5/4,−1/4,−7/4 equal x,f(x),f²(x), respectively. At c=0,x=0,y=1 both exact-three hypotheses fail and the conclusion would fail. | All three markings are allowed; exact-period hypotheses are necessary. | Kept headline without Morton-coordinate API padding. |
| `stoll_integer_family_card_gal` | a=1,2,−8 have residues 1,2,0 mod 4 and critical triples (0,1,2),(0,2,6),(0,−8,56). At n=0 the Galois order and formula are 1=2^0; at n=1 they are 2=2^1 in each family. The level-two predicted order is 2^3=8. Excluded a=0 and a=−4 instead have rational first-level roots, giving 1≠2. | All three families and the zero level are correctly scoped; the nonsquare exclusion is material. | Replaced the a=1-only acceptance theorem by the full family statement. |
| `IsFiniteUnionAP` | Pairs {(0,3),(0,7)} give {3,7}; the empty pair set gives ∅; {(1,0)} gives ℕ; {(0,1),(2,0)} gives {1}∪2ℕ. Powers of 2 have successive gaps 1,2,4,8 rather than an eventual fixed period. | Zero-step singletons and the empty set work; a sparse infinite set does not satisfy the predicate. | Kept real body needed by line return times. |
| `rittCommonIterate` | F=−X³,G=X³,n=2 give X⁹=X⁹; β=0,γ=−1,H=X³,r=3,s=0 give γ^s=1 and γ^(1+3)=1. For −X²,X²,n=2 the iterates are −X⁴≠X⁴ and γ^(1+2)=−1≠1; at x=2 these give −16≠16. At n=1 the geometric sum is 1, forcing γ=1. | Both directions agree on positive and negative controls; s=0 is necessary for the monomial witness. | Kept the full classification. |
| `ellipticStandardProjection` | Identity sends native vectors (1,0) to ∞ and (0,1) to 0/1=0. The swap matrix sends ∞→0, 0→∞ and 2→1/2. Twice the identity sends 2 to 4/2=2. The zero matrix has determinant 0 and is outside GL₂. | Left action and numerator/denominator order are fixed; the denominator-zero branch avoids a 0/0 interpretation. | Added the native projection needed by the general torsion theorem. |
| `legendreTorsionImages` | At t=2, coefficients are (0,−3,0,2,0), Δ=64; O maps to ∞ and the order-two point (0,0) maps to 0. The four two-torsion x-values are ∞,0,1,2. At t=0,1 the discriminants are 0,0. | The set includes infinity and uses additive torsion; singular fibres are distinguished from smooth elliptic fibres. | Added the real specialization, without a duplicate generic Legendre model. |
| `polynomialOrbits_meetingLine` | F=X², G=(X−1)²/2+1, a=2,b=1, x=2,y=5 give orbit pairs (2,5),(4,9),(16,33) on v=2u+1. Both sides of G(2z+1)=2F(z)+1 are 2z²+1, taking values 1,3,9 at z=0,1,2; second iterates give 2z⁴+1 on both sides. | The full affine-line direction is correct and does not require equal time indices. | Replaced the diagonal specialization. |
| `lechIntegralAssembly` | L=ℚ,s={0,1/6},N=3,p=5 gives norms 0,1≤1; p=2 and p=3 instead give norm(1/6)=2,3. For ℚ(√2), 3²−2=7 and derivative 6≠0 mod 7 give an integral embedding into ℚ₇; mod 3 the square residues are {0,1}, excluding an embedding of √2 into ℚ₃. | The theorem chooses arbitrarily large suitable primes; it does not assert every prime works. Zero and nongenerating marks are admitted. | Kept whole-field theorem. |
| `legendreTorsionSpecializations_infinite` | For a=2, t=2 gives an order-two mark; t=4 gives doubling x-value (4−4)²/(8(2−4))=0, and t=4/3 gives (4−4/3)²/(8(2−4/3))=4/3. Thus the latter two marks have order four; Δ values are 2304 and 256/81. At a=0,1 the mark is persistently order two; t=0,1 are singular. | Concrete algebraic specializations distinguish the infinite nonbranch theorem from persistent branch marks. | Added the statable arithmetic endpoint with explicit algebraicity. |
| `polynomialLine_returnTimes` | F=G=0,x=1,y=2 and line u−v=0 give values −1,0,0,… and return set {n≥1}, represented by (step,start)=(1,1). Zero starting points give ℕ. F=G=−X,x=y=1 and line u=1 give values 1,−1,1,… and return set 2ℕ. For F=2X,G=3X,x=y=1 and v=u+1, n=0,…,4 compare 1≠2,3=3,9≠5,27≠9,81≠17. | Constants, fixed orbits, finite prefixes and positive-step progressions are all covered. | Kept full polynomial-line theorem, including constant polynomials. |
| `uniformLegendreCommonTorsion` | t₁=2,t₂=3 give branch sets {∞,0,1,2} and {∞,0,1,3}; their intersection has cardinal 3, so a valid uniform bound is at least 3. Equal parameters t₁=t₂=2 give infinitely many projected torsion points; its natural cardinal is 0, despite infinitude. | Distinctness and explicit finiteness prevent a vacuous natural-cardinality bound. | Added the full complex-parameter endpoint. |
| `uniformThreeBranchCommonTorsion` | The identity projections of E₂,E₃ have exactly 3 common branch values. Applying the swap to both gives branch sets {0,∞,1,1/2} and {0,∞,1,1/3}, still with intersection cardinal 3. Equal curves with equal projections instead have 4 common branch values and infinite common torsion. | Arbitrary projective coordinate changes are included; “exactly three” excludes the infinite-intersection case. | Added the general endpoint; both ellipticity binders are explicit. |
| Supplied Legendre coefficients, discriminant and normalization | Δ(0)=Δ(1)=0, Δ(2)=64, Δ(3)=576 and Δ(4/3)=256/81; j(−1)=j(2)=1728. Projected infinity contributes one element, rather than the affine value 0. | The local specialization agrees with the existing model and with both torsion theorems. | Generic coefficient/discriminant/j targets assigned to the existing owner; arithmetic adapters retained. |

**Build and gate.**

Commit: `afd0ce3f` — `ArithmeticDynamics: review repairs (replace API catalogue with headline acceptance theorems)`. Only the two authorized roadmap files were committed; nothing was pushed.

`lake build TauCetiRoadmap.ArithmeticDynamics.Suggested` exited 0, with eleven expected `declaration uses sorry` warnings and no errors.

```text
Build completed successfully (8976 jobs).
```

```text
gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
