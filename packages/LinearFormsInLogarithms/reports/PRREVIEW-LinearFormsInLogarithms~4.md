# Review of LinearFormsInLogarithms (pull request #451 at 101d589)

**Verdict:** needs changes

:robot: Independent AI review. Four findings: one P2 and three P3. The product corollary is unnecessarily restricted relative to its cited source. The supplied gate also fails on a forbidden file. No pull-request file was changed.

## R01 (P2) — Allow zero entries in the product corollary

**Location:** `TauCetiRoadmap/LinearFormsInLogarithms/README.md:994`, “when the `lᵢ` are nonzero”; `TauCetiRoadmap/LinearFormsInLogarithms/Suggested.lean:477` and `:486`.

**Claim:** The branch-free headline requires every logarithm to be nonzero, and the principal-branch headline requires every base to differ from 1. The cited source proves the more general statement requiring only one nonzero logarithm. No other owner for that generality is named. The review contract requires the general statement, rather than leaving the narrower case as the acceptance test.

**Witness:** W00 line 831 allows some zero logarithms. Take `l=(0,log 2)`, `β=(√2,√3)`: `1,√2,√3` are rationally independent; both exponential expressions equal `2^√3 ≈ 3.3219970855`. Only the universal nonzero premise fails.

**Repair:** Replace `∀ i, l i ≠ 0` by `∃ i, l i ≠ 0`. In the principal version retain `∀ i, α i ≠ 0` and replace `∀ i, α i ≠ 1` by `∃ i, α i ≠ 1`; update §7.3. Zero logarithms contribute zero and bases equal to 1 contribute 1, so deleting those indices reduces to the existing nonempty theorem, preserving independence by restriction. The displayed instance now qualifies, with witness index 1; the all-zero case still fails the new premise and has exponential 1. Both revised signatures were elaborated in a scratch copy. The assumptions `[Nonempty ι]` may then be dropped as redundant.

## R02 (P3) — Remove the file rejected by the supplied gate

**Location:** `TauCetiRoadmap/LinearFormsInLogarithms/sources.toml:1`, “schema = \"tauceti-roadmap-sources/v1\"”; related reference at `TauCetiRoadmap/LinearFormsInLogarithms/README.md:1323`.

**Claim:** The supplied gate reports `stray-files=1` for this file. The brief explicitly makes every gate failure a finding and forbids acceptance while it fails.

**Witness:** The gate names `TauCetiRoadmap/LinearFormsInLogarithms/sources.toml` as “not a roadmap file”; all its other checks, including the targeted build, are zero.

**Repair:** Delete it; sources are the README's references. Preserve the bibliographic keys and readable/uncertified access distinctions in References, and remove the sentence that points to the deleted file. The path is the only stray-file witness, so its removal addresses this failure; rerun the gate afterwards.

This records a conflict in the supplied requirements: the previous review requested this manifest, and the generic source instructions still request one, but this head's explicit gate instruction prohibits it. Adding the manifest was a faithful repair of previous R05. This finding follows the present brief's specific gate rule; it is not a mathematical defect.

## R03 (P3) — Finish the APIs of the proof quantities

**Location:** `TauCetiRoadmap/LinearFormsInLogarithms/README.md:1126`, “the series `f_m` are defined for every `ℓ` in the disc and all `β₀`, `β`”; also §§5.1–5.3 and 8.7.

**Claim:** Previous R04 is partly repaired. There are now separate computed Checks for the frequencies, gamma factors, polynomial factors, series and E. But the definitions of those proof quantities still do not have the required prose API fact lists. Their facts remain mixed into construction paragraphs; E has three evaluations but no API.

**Witness:** §8.6 passes directly from the defining formula and its value identity to Checks; §8.7 passes from E's formula and existence argument to its three Checks. Neither has an API list for the defined objects.

**Repair:** Extract the facts already stated into per-definition API bullets, with hypotheses: linearity of `f_m` in P, its natural-number evaluation, and its derivative identity under the displayed relation; positivity and parameter monotonicity of E for `L,h≥1,G≥1`; corresponding growth and arithmetic facts for F, Γ, a, H and Λ. Keep them in the README. Preserve the numerical checks E=4,64,12,64 for the four displayed parameter choices. For the derivative identity, the k=0 one-term test gives constant coefficient ℓ on the derivative side and β₀ on the shifted-series side, equal exactly when ℓ=β₀.

## R04 (P3) — Give the independence target a mathematical locator

**Location:** `TauCetiRoadmap/LinearFormsInLogarithms/README.md:618`, “Source: none; the proof, by restriction to a line, is given below.”

**Claim:** Previous R05's missing-locator component survives for §2.3. This is a substantive theorem, used by §5.4, but neither the one-variable independence assertion nor its multivariate extension has an exact mathematical locator. Restriction to a line explains only the reduction to the one-variable assertion.

**Witness:** §2.3 states both assertions and cites only Mathlib in its Needs line. W00 line 3498, Exercise 2.5, printed p.60, is a nearby precise independence reference; its stated coefficient field must be distinguished from the complex-coefficient variant here.

**Repair:** Cite that precise reference as a related result, explicitly identify the complex-coefficient variant, and complete the stated elementary route: isolate one frequency c₀ by applying the product of `(D-c)^(deg Q_c+1)` over the other frequencies. Those terms vanish, while the surviving polynomial has nonzero leading coefficient because each `c₀-c≠0`; then use the indicated generic line. For the test `1-exp(i z)`, applying `D-i` leaves `-i≠0`, so the complex-frequency case is covered. Do not present the source's real zero-count lemma as already proving the general complex assertion.

## Verified sound

### Previous findings checked first

No supplied repair report marks a finding “not actionable in this package”. The previous review was read before the full pass; its conclusions were treated as claims to recheck.

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01: module warning | Suggested.lean:1, “module” | Repaired. Direct elaboration has only 73 sorry warnings; supplied build=0. |
| R02: packing hypotheses | README:280, “`r i > 0` for every `i`, `0 < ε ≤ c`”; :282, strict separation | Repaired. The singleton ε=5,c=1 counterexample is excluded; {-1,1}, ε=c=1 has separation 2>1 and count 2≤16. |
| R03: document structure | README:3 “Summary”; :28 “Scope and ownership”; :209 “Exact supplier contracts”; :304 “How to read the build” | Repaired. Nine Layer headings, nine Examples, nine Dependencies; topic-level Needs lines present. |
| R04: APIs and Checks | README:1207 “For G=1, L=2 and h=1, E=…12”; :1134–1158 separate Checks | Partly repaired. The requested evaluations and separate Check blocks are present; API lists still need R03. |
| R05: source registration and locators | Seven entries in sources.toml; README:376 names the binary sum/product inputs, :385 the interchange inputs; :618 still “Source: none” | Registration and several locators repaired. R04 records the remaining independence locator; R02 records the contradictory gate rule. |

### Scope, signatures, gate and headline inventory

Read the entire 1,407-line README and 705-line Lean file, including all 76 declarations: three real-bodied definitions and 73 admitted theorems. No sorry-valued data, free Prop stand-ins, set_option, admitted examples, computational algorithms, circular theorem hypotheses, or route-specific good-prime restriction was found. The odd-prime restriction belongs to the exp(p) example; the general p-adic theorem includes p=2 on its strict disc. The target worktree and outside-folder diff are clean. Head: `101d5891076a3193ba2f462b5611a896d1b00945`.

The pins are Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Direct `lake env lean` on Suggested.lean passed with 73 sorry warnings and no others. A scratch copy with `#check @name` for every one of the 76 declarations also passed. I compared the elaborated types to their README statements and section contexts. The two flagged omissions are deliberate `omit [CompleteSpace L]` clauses at lines 511 and 541: a radius and a formal coefficient bound do not require summation in L. Completeness remains on exponential values, isometry, injectivity and series evaluation. No binder repair was needed.

Each of the 73 sorried theorems was tested in a scratch copy for closure by one bare `simp`, `rfl`, or `infer_instance`: 73 fallbacks, zero closures, zero errors. Inspection of the corresponding native objects did not identify a one-library-lemma exact replacement. Probe instrumentation adds unused-tactic warnings only to that copy. This is a padding screen, not a proof of the admitted theorems.

Headline inventory: multi-index reconstruction/uniqueness and Taylor calculus (§§0.3–0.4); Cauchy, Taylor remainder and Cartesian Schwarz (§§1.4–1.6); exponential-polynomial independence (§2.3); Liouville, Thue–Siegel and the number-field Siegel constant (§§3.1–3.5); auxiliary-function existence (§4.1); Schneider–Lang (§5.7); its two specializations, Hermite–Lindemann and Gelfond–Schneider (§§6.1–6.4); Baker's basis and affine forms and corollaries (§§7.1–7.3); ultrametric zero estimates and Hermite bounds (§§8.3,8.5); p-adic Baker (§8.10), and the named transcendental constants. All are statable and represented. The missing generality is R01, not a missing carrier. Proof steps §§5.1–5.6 and 8.6–8.9 appropriately remain in the README.

The supplied full gate is:

```text
gate LinearFormsInLogarithms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=1 dirty=0 outside-folder=0 source-material=0 build=0 FAIL
```

The independently rerun prescribed dependency check returned:

```text
depcheck: 205 roadmaps, 1554 edges, 0 problem(s)
```

All Needs lines and supplier passages were read. There are no roadmap supplier edges or declared gaps here, no UPWARD/CYCLE/moved output, and no prerequisite imported from an unnamed later roadmap. The proof quantities in §5.6 are explicitly dependencies on definitions of §§5.1–5.3, not on proving the Liouville estimate first.

### Native declarations and ownership

The two main-branch shape examples read were DiophantineApproximationAndTranscendence and Completed/EffectiveBounds. Searches by object used `roadmaps grep` and `roadmaps show`, the pinned libraries, the board packages and the supplied relevant open heads. Objects included Taylor coefficients, exponential polynomials, Schneider–Lang, Baker–Brumer, house/denominator bounds, Siegel, Hermite interpolation, the exponential disc, Gauss norms and Weierstrass division. The 55 citation-tool leads are this roadmap's proposed target names/provenance names, not evidence of missing suppliers. No duplicate fully qualified declaration was found.

Resolved ownership and cross-roadmap citations:

- `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:112` on main has the supplier table importing these targets. At :140 it explicitly retains the broader rank version of §6.1, separate degree/frequency budgets and exp(πα) generalization. Its §§3.2–3.3,3.5–3.8,5.6 support the stated boundaries for Lindemann–Weierstrass, effective bounds and conditional/algebraic independence. Its height-based Siegel theorem at :1874 bounds projective H₂ of a kernel vector, whereas §3.5 here bounds houses of integral coordinates using the pinned house theorem. These are distinct interfaces.
- `TauCetiRoadmap/LocalFieldsRamification/README.md:393` at the supplied open head, Layer 1 “Deep units in mixed characteristic”, owns local exp/log and their inverse maps for (p−1)i>e. It is a scope boundary, not a supplier. For an unramified degree-two extension at p=3, its normalized absolute value of 3 is 1/9, while the norm of a normed Q₃-algebra is 1/3. The distinction in this README is necessary.
- `Completed/AdicSpaces/README.md:237`, §0.5, owns restricted series and Weierstrass division/preparation. The completed main-branch roadmap resolves the named ownership; this proof uses the native Tau Ceti division theorem.
- `TauCetiRoadmap/EllipticCurves/README.md:164` explicitly excludes proving integral-point finiteness because the Diophantine input is absent.
- `TauCetiRoadmap/GenericDoublePointInterpolation/README.md:1416` at the supplied open head gives first-jet ranks, not arbitrary-order ultrametric coefficient bounds. `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:929` constructs complex Hermite interpolation for Runge approximation, without this nonarchimedean bound. Neither duplicates §8.5's quantitative result.
- The index search confirms the GL2ModularityLifting and IntegralIwasawaTheory consumer references. Their open-head files are not supplied in this brief, so ownership against those full open pull requests was not checked; neither is used as a supplier.

The cited [Gelfond–Schneider Mathlib submission](https://github.com/leanprover-community/mathlib4/pull/42911) displays the same principal-branch signature. Its proof/axiom claims were not independently certified. The Zhao submission could not be read; neither future merge is assumed.

The following native declarations were opened at the pins (paths below are relative to the respective library repositories). The 28 library #checks in Suggested.lean also elaborate.

| Native file and line | Declaration/contract inspected |
|---|---|
| `Mathlib/Analysis/Analytic/Uniqueness.lean:92` | `HasFPowerSeriesAt.apply_eq_zero` gives zero diagonal homogeneous terms, not uniqueness of arbitrary nonsymmetric multilinear maps. Polynomial coefficient extraction supplies the extra step. |
| `Mathlib/Analysis/Analytic/OfScalars.lean:132` | `ofScalarsSum` is a formal-series sum, with the tsum identity at :134; it does not assert convergence for arbitrary coefficients. |
| `Mathlib/Analysis/Analytic/Order.lean:48` | `analyticOrderAt` gives zero for a nonanalytic germ, infinity for a locally zero analytic germ. Thus the positive-order premise in §1.3 excludes the nonanalytic junk case. |
| `Mathlib/Analysis/Complex/RemovableSingularity.lean:59` | `differentiableOn_dslope` is a one-complex-variable equivalence on a neighborhood. The joint coordinate/general-field extension is owned here. |
| `Mathlib/Analysis/Complex/Schwarz.lean:145` | `dist_le_mul_div_pow_of_mapsTo_ball_of_isLittleO` bounds the difference from f(c); positive order implies f(c)=0. T=0 is the original bound. |
| `Mathlib/Analysis/Complex/Liouville.lean:42` | `norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le` requires positive radius, DiffContOnCl and a complete value space. Multi-index extraction is additional work here. |
| `Mathlib/Analysis/Normed/Ring/InfiniteSum.lean:45`, :70, :152 | Binary absolute convergence, tsum multiplication and Cauchy product. §0.1 states the finite dependent-family extension. |
| `Mathlib/Analysis/Normed/Algebra/Exponential.lean:107`, :127, :437 | expSeries uses inverse factorials; exp is a total sum for Q-algebras; its functional equation requires convergence-ball membership and completeness. |
| `Mathlib/NumberTheory/NumberField/House.lean:38`, :45, :54, :60, :69, :74, :88, :93, :100 | House is the canonical-embedding norm; sum/product/power/integer bounds and the field-norm inequality. The pinned product theorem indexes a set of elements, not an arbitrary repeated indexed family. |
| `Mathlib/NumberTheory/NumberField/House.lean:311`, :348 | The Siegel constant is private; the public theorem requires a nonzero matrix, positive row count and more columns than rows. §3.5 handles the zero matrix separately and bounds the exponent by 1. |
| `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:612` | `finiteDimensional_adjoin` requires finite S and integral/algebraic generators. |
| `Mathlib/RingTheory/Discriminant.lean:127`, :143 | Basis discriminant nonvanishing and square of the embedding determinant, with separability and finite-dimensional assumptions. Number fields meet them. |
| `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:882` | `spectralNorm.normedAlgebra` uses the algebraic-extension spectral norm, not an arbitrary preassigned normalized local absolute value. |
| `TauCeti/NumberTheory/GeometryOfNumbers/Doubling.lean:186` | Packing needs positive polyradii, 0<ε≤c and strict separation; the repaired contract matches. |
| `TauCeti/RingTheory/PowerSeries/GaussNorm.lean:449` | `gaussNorm_mul_of_isRestricted` requires positive radius and both factors restricted. |
| `TauCeti/RingTheory/PowerSeries/Weierstrass/Division.lean:369` | `IsDistinguished.exists_mul_add_eq` requires completeness, a unit distinguished coefficient, positive radius and restricted series. The monic product ∏(X−a)^S in §8.3 meets these requirements at 1<r′<r. |
| `TauCeti/Analysis/Analytic/OfScalars.lean:115`, :131 | Scalar composition and complex derivative-at-zero bridges; these do not already give the many-zero ultrametric bound. |

### Seeded source sample

All 15 prescribed targets were inspected. Eight use explicitly identified native inputs or an original derivation rather than a book locator; the table distinguishes verification of those inputs from certification of the new theorem. W00 was fetched through the sources service from the author's legal copy, with printed numbering matching the citation. There are no additional explicit “unverified” flags in the README. The six settled uncertified works were not reopened or renamed.

| Sample target | Text/locator checked | Outcome |
|---|---|---|
| 0.5 Division by a coordinate | Mathlib RemovableSingularity:59; native analytic-order factorization | One-variable input verified; two analytic germs are assumed off the hyperplane. The joint/general-field extension is this roadmap's target. |
| 1.3 Schwarz | Mathlib Schwarz:145 and Order:48 | Difference/order formulation and T=0 case match the stated bridge. |
| 1.4 Cauchy | Mathlib Liouville:42 | One-variable estimate verified. The finite (k+1)-root character average supplies coefficient extraction; no unsupported multivariate integral is assumed. |
| 2.3 Independence | README:618–626; W00 line 3498, Exercise 2.5, p.60 | Mathematics checked by differential operators and a generic line; locator defect R04. |
| 3.2 Sizes | Mathlib House:45–100 | Integer scaling and sum/product bounds give the displayed exponents and lower bound. |
| 3.5 Siegel constant | Mathlib House:311,348 | Exact nonzero-matrix and dimension assumptions read; existential constant and zero-matrix case are legitimate variants. |
| 4.1 Proposition 4.10 | W00 lines 6867–6880, pp.131–132; proof lines 7043–7107 | Constants and counts agree. Source assumes entire functions and positive U,V; target explicitly uses local series. The proof inequalities depend on W and remain valid for real U,V. At W=12 the replacement factor 1+T≤18 is below exp(4)/2≈27.299. |
| 5.3 Liouville | W00 lines 7135–7150, §4.6 step 2, (4.14), p.137 | Source is a derivative logarithmic lower bound with implicit constants. Target is the explicitly derived house/coefficient variant; M^M bounds the factorial, including 0^0=1. |
| 6.1 Homogeneous specialization | W00 lines 6187–6192, Corollary 4.3, p.118 | Source uses rational rank; the narrower independent-family interface is explicitly paired with the broader main-roadmap consumer. |
| 6.2 Algebraic-coordinate specialization | W00 lines 6196–6202, Corollary 4.4, p.118 | Algebraic x, rational independence, complex basis, and algebraic first coordinates match. Lean keeps NeZero d. |
| 6.3 Hermite–Lindemann | W00 line 6202 and README's derivation from 6.2 | d=1 gives the result; x≠0 excludes exp(0)=1. The claimed Zhao names remain a provenance limitation. |
| 7.3 Corollaries | W00 lines 828–835, p.4 | Affine exponential and nonzero linear-form conclusions supported; source's “not all zero” generality gives R01. Baker's exact numbering remains uncertified. |
| 8.3 Many zeros | Tau Ceti GaussNorm:449 and Division:369 | Native inputs verified. At r′<r the weighted coefficients tend to zero; monic factors have Gauss norms 1 and r′. Characteristic zero is retained for ordinary-derivative multiplicity. |
| 8.6 Diagonal auxiliary function | README:1118–1158; Baker75, Chapter 2 | Formula/value/derivative identities checked directly. Baker text unavailable; exact source locator uncertified. |
| 8.10 p-adic Baker | Brumer67, pp.121–124; Baker75, Chapter 2; KaratarakisPadic lines 45–51,74–130 | The readable author-code signature includes the constant term and disc hypotheses. This does not certify the inaccessible historical texts or all imported proofs. |

### Adversarial values

These are explicit consistency tests of every Lean declaration and the additional README definitions, proof steps, APIs and conventions. They are not numerical proofs of transcendence. T/A denote the transcendental/algebraic alternatives from the cited theorems. “Retain” means that instance reveals no false statement; R01 still requires the stronger generality. Scalar parameter tests are distinguished from realizations of the contradictory analytic hypotheses in Layer 5.

| Statement (Suggested.lean line) | Instance | Values on the two sides / rejected model | Result; change |
|---|---|---|---|
| mvCoeff (76) | p₂(u,v)=u₀v₁; then u₀v₀ | Mixed coefficient 1=1+0; repeated coefficient 1, not 2; constant series 3 has coefficient 3 | Retain |
| apply_eq_sum_mvCoeff (83) | p₂ as above,z=(2,3); empty coordinate type,k=2 | 6=1·2·3; empty type gives 0=0 in degree 2 and c=c in degree 0 | Retain |
| hasSum_mvCoeff (91) | f(z)=1/(1−z), one coordinate,z=1/2 | Σ(1/2)^k=2=f(1/2); weighted norm sum=2 | Retain |
| exists_hasFPowerSeriesOnBall_tsum (100) | c_k=2^(−k),r=1,z=1/2 | Normal sum=2; function sum=4/3; extracted coefficients 1,1/2,1/4 | Retain |
| mvCoeff_eq_zero_of_eventuallyEq_zero (108) | f=0; contrast f=z² | Zero coefficients all 0; z² has coefficient 1 at 2 and fails local-zero premise | Retain |
| mvTaylorCoeff (116) | f=z²,x=3; nonanalytic f=1+conj z at 0 | Coefficients 9,6,1; nonanalytic coefficients 0, including constant 0≠f(0)=1 | Retain |
| mvTaylorCoeff_eq (120) | f=(3+z)² at 0 | Chosen and explicit series both have (9,6,1) | Retain |
| mvTaylorCoeff_add (126) | f=z²,g=3z at x=1,degree 1 | 5=2+3 | Retain |
| mvTaylorCoeff_const_smul (132) | c=3,f=z²,x=1,degree 1; c=0, f nonanalytic | 6=3·2; 0=0·0 | Retain |
| EventuallyEq.mvTaylorCoeff_eq (137) | g=z² near 0, changed to 7 outside unit disc | Both degree-two coefficients 1; outside change does not enter the germ | Retain |
| mvTaylorCoeff_comp_add_right (142) | f=z²,x=1,y=2,degree 1 | Coefficient of (z+2)² at 1 is 6; coefficient of z² at 3 is 6 | Retain |
| prod_factorial_smul_mvTaylorCoeff (148) | f=z₀²z₁,α=(2,1); characteristic 2 | 2!1!·1=2; in characteristic 2 both derivative and factorial product are 0 | Retain |
| factorial_smul_mvTaylorCoeff_of_unique (157) | f=z³,x=0,k=3 | 3!·1=6; in characteristic 3 both are 0, while coefficient remains 1 | Retain |
| mvTaylorCoeff_smul (164) | f=1+z,g=1−z,x=0,degree 2 | −1=1·0+1·(−1)+0·1 | Retain |
| exists_hasSum_mvTaylorCoeff (172) | f=1/(1−z),x=0,ρ=1/2,y=1/4 | Normal sum=2; reconstructed value=4/3 | Retain |
| mvTaylorCoeff_eq_of_hasSum (181) | c=(1,2,1,0,…),f=(1+z)² | Expansion at z=1/2 gives 9/4; recovered coefficients exactly 1,2,1 | Retain |
| mvTaylorCoeff_comp_eq_zero (190) | G=z₀²,A(u,v)=(u+v,v) | Degree 1 coefficients 0 stay 0; degree 2 becomes (1,2,1), showing rectangular vanishing is not preserved | Retain |
| analyticAt_dslope_update (198) | f(z)=z²,ζ=1 | Quotient z+1 off diagonal; value at 1 is 2=f′(1) | Retain |
| isLittleO_sub_pow_sub_one (211) | g=z²,T=2,z₀=0 | Ratio \|z\|²/\|z\|=\|z\|→0; T=0 excluded | Retain |
| Complex Schwarz (218) | g=z²,ρ=2,M=4,T=2,w=1; T=0,g=1 | 1≤4(1/2)²=1; 1≤1 | Retain |
| norm_mvCoeff_mul_pow_le (229) | f=z₀²z₁,ρ=1,R=2,M=8 | Coefficient norm·ρ³=1≤8; empty coordinates reduce to \|c\|≤M | Retain |
| norm_sub_partialSum_le (236) | f=z²,R=2,M=4,T=2,z=1; T=0 | 1≤3·4/4=3; 1≤4 | Retain |
| Cartesian Schwarz (246) | n=1,E={0},m=2,r=1,R=5,f=z²,M=25; S=0 | 1≤(15/5)²·25=225; S=0 gives original bound multiplied by n | Retain |
| exp-monomial coefficients (265) | f=z²exp(3z),at 0,orders 1,2,3 | Formula gives 0,1,3; the 0 from choose(2,3) kills truncated-subtraction junk | Retain |
| exp-polynomial independence (272) | Q₀+Q₁exp z with Q₀=1,Q₁=−1; empty T | At 0 gives 0, at log2 gives −1, so global-zero fails; empty conclusion vacuous | Retain |
| archimedean Liouville (288) | K=Q,α=2,D=1; α=1/2 nonintegral | 1≤2·2⁰=2; removing integrality would give 1≤1/2 | Retain |
| scaled Liouville (295) | K=Q,δ=2,a=1,α=1/2,H=1 | 1≤2·(1/2)·1⁰=1; δ=0 excluded | Retain |
| real Thue–Siegel (302) | u=(1,1),X=1,ℓ=2,U=2 | 2<4; ξ=(1,−1) gives 0≤1; no unknowns would require ℓ^m<1, impossible | Retain |
| complex Thue–Siegel (309) | u=(1,1),U=log2,V=−log4,X=1 | (1+√2/2)²≈2.914≤4; ξ=(1,−1) gives 0≤4 | Retain |
| number-field Siegel (320) | K=Q, matrix [1,1],A=1; zero matrix | ξ=(1,−1), product 0, house 1≤2C; zero matrix admits (1,0) | Retain |
| auxiliary function (335) | n=1,N=1,U=11,V=0,R/r=e,L=576,all φ=0 | W=12; count 576≤576; coefficient vector e₁ has size 1≤e and function 0≤1 | Retain |
| Schneider–Lang (353) | n=d₀=d₁=1,x=y=1; n=0 | First coordinate 1 is A; exponential e is T. For n=0 the strict dimension bound forces a nonempty independent family in zero space, impossible | Retain |
| homogeneous criterion (368) | n=1,x=(1,√2),y=log2 | Exponentials 2 and 2^√2≈2.665144; first A, second T. Zero y would fail span=top | Retain |
| algebraic-coordinate criterion (376) | d=1,x=y=1 | exp(1)=e≈2.718282, T; d=0 excluded by NeZero | Retain |
| transcendental_of_isAlgebraic_exp (385) | x=πi; x=0 negative control | exp(πi)=−1 is A and πi is T; exp0=1 but 0 is A, excluded | Retain |
| transcendental_exp (391) | a=1; a=0 negative control | exp1≈2.718282 is T; exp0=1 is A and a≠0 fails | Retain |
| transcendental_log (397) | u=2; u=0 or 1 | log2≈0.693147 is T; total log0=log1=0, excluded by log u≠0 | Retain |
| transcendental_exp_mul (403) | x=log2,b=√2; b=1/2 negative control | exp(√2log2)≈2.665144 is T; exp((log4)/2)=2 is A, irrationality fails | Retain |
| principal Gelfond–Schneider (409) | α=−1,β=−i; α=1 negative control | (−1)^(−i)=expπ≈23.140693; 1^(−i)=1 excluded | Retain |
| quotient alternative (416) | y=log4,x=log2; y=log2,x=log3 | First quotient 2 is rational; second ≈0.630930 is T. x=0 excluded | Retain |
| Baker basis form (429) | K=Q,β=1,l=0; l=log2 | 0 algebraic gives l=0; log2 is not algebraic, so latter fails hsum | Retain |
| Baker affine independence (437) | l=(log2,log3),zero coefficients; dependent (log2,log4) | First relation 0=0 gives zeros; dependent coefficients (2,−1) give 0 with nonzero coefficients and fail independence | Retain |
| Baker finite-set form (444) | s empty; s singleton,l=log2 | Empty relation β₀=0, conclusion β₀=0; singleton nonzero coefficient gives nonzero logarithmic form | Retain |
| Baker add_sum_mul_ne_zero (452) | β₀=1,l=log2,β=1; no logs | 1+log2≈1.693147≠0; empty sum gives 1≠0 | Retain |
| Baker transcendental_sum_mul (460) | l=(log2,log4),β=(1,1); β=(2,−1) | First sum 3log2≈2.079442 is T; second is 0, excluded by hΛ | Retain |
| Baker exponential affine form (467) | β₀=1,l=log2,β=1; β₀=0 negative control | exp(1+log2)=2e≈5.436564; at β₀=0 gives 2 and hypothesis fails | Retain |
| Baker branch-free product (476) | l=2πi,β=√2 | exp l=1; exp(βl)≈−0.858216+0.513288i≠1; principal 1^√2=1 | Retain; generalize as R01 |
| Baker principal product (485) | α=(2,3),β=(√2,√3); dependent β=(√2,−√2),α=(2,2) | First product≈17.869770; second product=1 and independence of (1,β) fails | Retain |
| Padic integer bound (503) | p=3,n=9; n=2; n=0 | 9·1/9=1; 2·1=2≥1; zero gives 0<1 and is excluded | Retain |
| PadicExp radius (513) | p=2,3 | ρ₂=1/2; ρ₃=1/√3≈0.577350; factorial estimate gives these lower radii | Retain |
| PadicExp exp_add (518) | p=3,x=y=3 | norms 1/3<ρ; exp6=(exp3)². At x=y=0: 1=1·1 | Retain |
| PadicExp norm_exp_sub_one (524) | p=3,x=3; x=0; p=2,x=4 | Norms 1/3=1/3; 0=0; 1/4=1/4 | Retain |
| PadicExp injOn_exp (529) | p=3,x=0,y=3 | exp0=1, distance from exp3 is 1/3≠0; equal inputs give distance 0 | Retain |
| exp-polynomial sum (534) | Q=X,ψ=3,x=1 in Q₃ | Sum=exp3, whose norm is 1; ψ=0,x=2 gives polynomial value 2 | Retain |
| exp-polynomial coefficient bound (545) | Q=1,ψ=3,r=1,M=1 in Q₃ | First coefficient norms 1,1/3,1/9≤1; at r=0 only constant term survives | Retain |
| integral norm bound (555) | Q₃,x=3; x=1/3 negative control | 1/3≤1; 3>1 but 1/3 not integral. In a trivially normed field nonzero norms are 1 | Retain |
| ultrametric Liouville (560) | K=Q,x=3,H=3,D=1; δ=3,x=1/3,H=1 | 3·1/3=1; denominator case 1·3=3≥1. Wrong exponent D−1 would give 1/3<1 | Retain |
| ultrametric Schwarz (569) | f=z²,r=1,M=1,T=2,z=3 in Q₃ | 1/9≤(1/3)²=1/9; at z=0:0≤0 | Retain |
| many-zero coefficient bound (587) | f=(X−1)(X−2),A={1,2},S=1,r=3,M=9 in Q₃ | Norms (1,1/3,1)≤9/3²=1; weighted norms (1,1,9)≤9 | Retain |
| many-zero value bound (597) | Same f, x=0; empty A | Norm f(0)=norm2=1≤1; empty A yields M rather than a fictitious gain | Retain |
| Hermite interpolation (610) | σ=(0,1),S=1,r=0,s=0,ϱ=1; singleton σ=0,s=2 in Q₂ | W=1−X has values (1,0), coefficient norms≤1; X²/2 has second derivative 1 and coefficient norm 2=norm(1/2!) | Retain |
| expDerivFactor (621) | c=2,P=X,m=0,1,3; c=0,P=X³,m=2 | X;1+2X;12+8X;6X. Zero ring yields zero operator | Retain |
| expDerivFactor_eq_sum (626) | c=2,P=X²,m=2 | 4X²+8X+2 on both sides; characteristic 2 gives 0 on both sides | Retain |
| natDegree_expDerivFactor_le (632) | c=2,P=X²,m=2; P=0 | 2≤2; natDegree0=0≤0, no subtraction error | Retain |
| norm_coeff_expDerivFactor_le (638) | Q₃,c=3,P=X,m=1,B=1 | 1+3X has norms 1,1/3; bound max(1,1/3)·1=1 | Retain |
| formal exp-polynomial derivative (644) | Q=X,ψ=2,m=1 | D(Xexp2X)=(1+2X)exp2X; constant and linear coefficients 1,4 on each side | Retain |
| p-adic Baker affine independence (655) | Empty family; off-disc singleton ℓ=1,β₀=−1,β=1 | Empty relation is β₀=0; off-disc exp1=0 is algebraic and −1+1=0 would contradict conclusion, but norm1=1≥ρ excludes it | Retain |
| p-adic linear-form transcendence (664) | ℓ=log₃4,β=1,β₀=0; β=0 | Nonzero form has norm 1/3; zero coefficient gives algebraic β₀ and violates hne | Retain |
| transcendental_exp_prime (673) | p=3 versus p=2 | 1/3<1/√3; 1/2=ρ₂. At n=2^j terms 2^n/n! have norm 1/2 and do not tend to zero | Retain |
| transcendental_e (683) | a=1 | a≠0; exp1≈2.718282, versus exp0=1 | Retain |
| transcendental_pi (687) | x=πi | exp x=−1; (−i)x=π≈3.141593 | Retain |
| transcendental_exp_pi (690) | principal log(−1)=πi | (−i)(πi)=π; expπ≈23.140693 | Retain |
| transcendental_two_cpow_sqrt_two (693) | principal positive base | exp(√2log2)≈2.665144; exponent 1/2 instead gives √2, algebraic | Retain |
| transcendental_log_two (696) | principal real log | exp(log2)=2; log2≈0.693147≠0 | Retain |
| transcendental_log_two_div_log_three (699) | log2/log3 | ≈0.630930; equality to a/b would force 2^b=3^a; prime exponents force a=b=0, forbidden denominator | Retain |
| transcendental_pi_add_log_two (703) | coefficients −i,1 on logarithms πi,log2 | (−i)πi+log2=π+log2≈3.834740≠0 | Retain |

### Additional README statements, proof steps and conventions

These additional rows cover the sampled proof steps, proof quantities confined to the README, the supplier counterexample, and API/check computations not covered by a separate declaration above.

| Statement | Instances tried | Values on each side | Result; change |
|---|---|---|---|
| Packing contract, README 280 | One coordinate, singleton, c=1,ε=5; then {-1,1},c=ε=1 | 1>16/25; repaired premise 5≤1 false. Valid example: separation 2>1 and count 2≤16 | Repaired contract excludes the invalid instance. |
| Box convention | r=(1,2),c=3,z=(3,6); equal radii r=(1,1) | Bounds 3≤3 and 6≤6; equal-radius box has sup norm≤3 | Body matches; positive radii matter in packing. |
| 0.1 finite products of sums | Families (1,2),(3,4); empty outer/inner family | Product sum 3+4+6+8=21=(1+2)(3+4); empty outer=1; empty inner=0 | Retain. |
| 0.2 sum of power series | g_j(z)=z^j/2^j,r=1 | Double coefficient norm sum=2; at z=1/2, sum and reconstructed series both 4/3 | Retain; complete value space. |
| 0.3 zero/additive/scalar coefficient API | Mixed coefficient 1 of u₀v₁ | Zero coefficient 0; sum of two copies 2=1+1; scalar 3 gives 3=3·1 | Retain. |
| 0.4 constant coefficient/constant function | f=z²,x=3; f=7 | Constant coefficient 9=f(3); constant-function coefficients (7,0,0,…) | Retain. |
| 0.4 subtraction/finite sums | f=z²,g=3z at x=1,degree 1 | Difference −1=2−3; sum of three copies of z² has coefficient 6=2+2+2 | Retain. |
| 0.4 monomial API | f=z₀²z₁ at 0 | Coefficient at (2,1)=1; at (1,2) and (0,0)=0 | Retain; not a separate admitted example. |
| 0.5 coordinate division | f=z² at 0,m=2 | Quotient 1, f(z)=z²·1; derivatives below 2 vanish, second derivative=2 | Retain. |
| 1.1 coordinate maximum | f=z₀z₁,R=2 | Boundary supremum=4; interior norm≤4 | Retain. |
| 1.2 polynomial quotient bounds | f=(z−1)²,g=1,r=1,R=3,M=16 | Quotient norm1≤16/(3−1)²=4; at z=−1, norm4≤16(2/2)²=16 | Retain. |
| 1.2 single-power variant | f=z²,g=1,R=3,r=1,M=9 | Quotient1≤9/9=1; inner value1≤9(1/3)²=1 | Retain; R>0 is indispensable. |
| 1.4 homogeneous terms and torus extraction | f=z²,R=2,M=4,y=1; root orders 2 and 3 | Term1≤4; two-point average of z² is1, wrong for constant coefficient0; three-point average (1+ω²+ω)/3=0 | Correct k+1 sampling. |
| 1.5 multi-index inequality | f=z²,T=2,r=1,R=2,M=4 | Actual1; low-order sum0; bound3 | Retain. |
| 1.6 finer K-bound | n=m=S=r=1,R=5,f=z,M=5 | K=2; fine bound=10; coarse bound=15; actual inner supremum1 | Retain. |
| 2.1 translated coefficient formula | f=z²exp z,at ξ=1,σ=2 | Taylor coefficient=(1/2+2+1)e=7e/2; derivative/2! gives the same | Retain. |
| 2.2 growth | z²exp z,z=1 | Actual e; bound (1+1)²e=4e | Retain. |
| 2.3 frequency distinction | Frequencies 0 and 1; repeated frequency 1 | 1−exp(log2)=−1; repeated equal exponentials cancel as exp z−exp z=0 with nonzero coefficients | Distinctness is essential. |
| 3.2 size operations | δ=2,a=b=1,α=β=1/2,H=H′=1 | Scaled product1≤1; scaled sum2≤2; scaled square1≤1; exponent c=2 gives2≤2 | Denominator exponents agree. |
| 3.3 finite data | {√2,1/2} in C | Degree of Q(√2)=2; δ=2; houses 2√2≈2.828 and1≤G=3; δ≤G | Retain. |
| 4.1 weaker interpolation constant | W=12,T=17; T≤4W/3+1 | 1+T=18≤exp4/2≈27.299; increasing W keeps the exponential ahead of 2+4W/3 | Constant 1+T still fits source proof. |
| 5.1 F and Γ | T=0; n=2,d₀=d₁=1,one selected term; n=1,d₀=0,d₁=1,T=2 | F=p₀,Γ=e^N; selected term z₀exp z₁; last F=exp2z,Γ(ρ)=3exp2ρ | Formula tests. Last two are tests of the formula outside the contradictory-data dimension conditions, not realizations of all standing hypotheses. |
| 5.2 denominator and H | All discrete parameters,δ,G=1,N=0 | a(2)=4; H(0),H(1),H(2)=8,24,64. T=0 gives a(0)=0,H(0)=e^N | Retain. |
| 5.3 Λ | Same data,D=2,M=0,1,2; D=1,M=0 | Λ=8,24,256; D=1 case Λ=δ^a; M=2 gives M^M=4≥σ!∈{1,2} | Retain. |
| 5.4 nonvanishing | x₂=2x₁, coefficient pair (1,−1) at (2,0),(0,1) | Frequencies equal2x₁; F=0 despite p≠0 | Independence excludes the wrong model. |
| 5.5 total-degree transport | n=2,M=3,S₁=1; P(u)=[u(u−1)(u−2)]², F(u,v)=P(u), y₁=(1,0),y₂=(1,1) | floor(3/2)S₁=1. Rectangular first-order derivatives vanish on old grid, but transformed mixed derivative at0=P″(0)=8 | Total-degree repair needed and present; source gap below. |
| 5.6 parameters | n=d₀=d₁=D=δ=G=1,A=A_y=B=0 | c₃=1/144,K₁=3457,S₁=60; q=1 gives N=0; q=2 gives R/r=2<e | Two small choices correctly rejected. These are scalar parameter tests; A_y=B=0 cannot be an actual nonzero-dimensional basis. |
| 5.6 large-q inequalities | Same scalar data,q=10^6 | U≈9.59410e10,N≈2.39853e10,S₀=289268151; count 1.86395e23≤3.31369e23; growth log1.49142e7<U; vanishing log5.63577e9<U; extrapolation log at S₀≈−1.39452e11<0 | For these data extrapolation log is const−29M log M, decreasing for M≥S₀. Scalar inequalities nonvacuous. |
| 7.1 embedding/trace normalization | Basis (1,√2) | Embedding determinant squared8; trace Gram matrix diag(2,4), determinant8 | Both required inversions agree. |
| 8.1 factorial / sums / boundary | Q₃,n=3; two copies of x=3; Q₂,x=2 | norm(3!)=1/3≥3^(−3/2); exp(2x)=(exp x)²; boundary terms for n=2^j have norm1/2, not→0 | Strict disc and natural-number normalization correct. |
| 8.3 characteristic-zero control | f=X³ in characteristic3 | All positive ordinary derivatives vanish, but root multiplicity at0 is only3 | CharZero in signature prevents the overclaim. |
| 8.6 frequency/gamma/polynomial/series | k=1,e=(2,3),ℓ=(3,6),β=2,β₀=5,d=2; then k=0,d=0,e=1 | ψ=24,γ=7,e_noneβ₀=10; factors X²,2X+10X²,42X²; singleton series exp(ℓX), derivative β₀exp(ℓX) agrees iff β₀=ℓ | Formulas sound; API lists still needed, R03. |
| 8.6 value and relation | k=0,ℓ=β₀=3,l=2,m=0; change β₀ to5 | exp6=(exp3)²; derivative constant coefficient3 versus5 if relation dropped | Relation is used in the correct identity. |
| 8.7 arithmetic, integrality, E and separation | k=0,L=h=1; nonintegral P=1/2,δ=1; α=1/4,δ=4,G=1,p=3 | Count4=4; E=4G^4 gives4,64 at G=1,2; A=1/2 nonintegral; separation would be1/2≤1/3 but δ≤G fails | Negative controls correct; E's additional values 12 and 64 are now in the README. |
| 8.8 admissibility and final extraction | k=0,L=h=D=G=C=1,p=3,r₀=2,S=R=0; f=X+exp3X | Final sides1536 and1 reject zero ranges. Hermite dual W=X−2X²/3+X³/9 gives functional4−6+3=1=P(1,0) | Factorial and direction correct. |
| 8.9 all parameter conditions | k=0,D=B=G=C=lmin=1,p=3,r₀=2,X=2^22,Kmax=21 | Count logs320.927<335.483; S₀/h²=1/2,R₀/h=1,2S(J+1)/S(J)=1; maximal extrapolation log ratio5.32056e−44; final logs3.46213e145<2.34359e271 | All 21 extrapolation steps evaluated. General exponent count: unknowns exceed equations by one power of X; each extrapolation gain exceeds the L·R′ exponent by one power. |
| 7.3 mixed zero/nonzero logarithms (R01) | l=(0,log 2), β=(√2,√3); principal bases (1,2) | exp(0·√2+√3 log 2)=1^√2·2^√3≈3.3219970855; universal nonzero premise false, existential premise true | Generalize both headlines; all-zero logs still give 1 and are excluded. |
| 8.6 separate frequency Checks | Q₃, l=(3,6), e=(0,0),(1,0),(0,1),(2,3) | ψ=0,3,6,24; norms 0,1/3,1/3,1/3 | Retain. |
| 8.6 gamma Checks | β=2,β₀=5; e=(2,3),(0,3),(1,0) | (γ,e_noneβ₀)=(7,10),(3,0),(2,5); wrong sign gives γ=−1 in the first | Retain. |
| 8.6 polynomial factor Checks | e=(2,3),β=2,β₀=5,l_0=6,d=2; m=(0,0),(1,0),(0,1) | X²;2X+10X²;42X²; at X=1 these are 1,12,42 | Retain. |
| 8.6 series Checks | k=0,L=1,P indicator of (0,1); then P=0 | f_0 coefficients (1,l_none,…); f_1 coefficients (β₀,β₀l_none,…); P=0 gives every coefficient 0 | Retain; organize API as R03. |
| 8.7 E Checks | k=0,(G,L,h)=(1,1,1),(2,1,1),(1,2,1),(1,1,2) | E=4,64,12,64; omitting G^a in second instance gives 16 | Computed again; repaired Checks. |
| 8.10 normalization | p=3, l=log₃4 | norm l=1/3, radius=1/√3, r₀=√3>1; norm l·r₀=1/√3 | Strict convergence gives the required radius margin. |
| 2.3 complex-frequency proof test (R04) | Q₀=1,Q_i=−1 | (D−i)(1−exp(i z))=−i, nonzero | The isolating-operator proof supplies the omitted one-variable step. |
| Source-only Exercise 2.4 negative control | K=F₂, α₁=1, a₁=X²−X | a₁≠0 as a polynomial, degree 2; F(0)=F(1)=F(2)=0, contradicting the claimed three-point bound | Source error; no roadmap target uses this positive-characteristic assertion. |


The two tables contain 76 Lean-declaration rows and 44 additional mathematical rows, plus one source-only counterexample. All 15 sampled targets, all headline statements and every mathematical finding are represented. These tests include empty index types, zero functions, ranks zero and one, characteristic 2 and 3, zero-ring polynomial identities, factorial vanishing, total-function junk values, strict p=2 convergence, coordinate versus total-degree order, branch choices, and both integral and nonintegral size inputs. Schemes, nonabelian groups and arbitrary-DVR uniformizers are not carriers of the statements reviewed here.

The tables certify the displayed computations and reveal the stated restrictions; they do not independently prove the full transcendence theorems or the whole unbounded parameter argument. The finite parameter evaluations in §§5.6 and 8.9 were recomputed numerically in logarithmic form; all 21 extrapolation inequalities were evaluated in the k=0 example. General asymptotic dominance follows the displayed degree comparisons, rather than inference from those numerical samples.

## Not verifiable

- **Baker75**, Chapter 2 Theorems 2.1–2.4, Lemmas 1–7 and §5: the manifest marks the text uncertified/no open copy. That settled status was respected. Exact numbering and the source's full hypotheses for the p-adic adaptation were not certified. W00 independently supports the complex corollaries.
- **Brumer67**, pp.121–124: settled uncertified/paywalled status; the original treatment of the constant term was not read. The README explicitly presents the constant-term argument as an adaptation of Baker's method. KaratarakisPadic lines 45–51 give the same final signature, not an independent certification of all its imported proofs.
- **BM80**, pp.283–288, **Hua82**, §17.9, **Lang66**, and **BG06**, Chapter 2: all retain settled uncertified status. The Bertrand–Masser argument reproduced in W00 lines 6242–6440 was read. Hua, Lang and Bombieri–Gubler are background/provenance references; no inaccessible theorem from them is silently treated as a supplied prerequisite.
- **KaratarakisBaker**, CriterionMain.lean at the cited commit: the sources service rejected the author's raw URL as an unrecognized document. The missing-reference record was retained. Consequently the complex provenance file map, its sorry-free claim and its exact axiom closure were not certified.
- **KaratarakisPadic**: the sources service legally retrieved Main.lean; its normalization and denominator construction were read, including lines 63–73 and 101–130. The imported proof tree was not downloaded and built, so the blanket provenance/axiom claim remains unverified.
- The Zhao Mathlib submission timed out when opened. The Gelfond–Schneider submission's displayed signature was read, but neither entire proposed formalization was audited. No unpinned theorem was used as native infrastructure.
- Ownership against open pull requests is limited to the supplied checkout files and the index search. The GL2ModularityLifting and IntegralIwasawaTheory full open-head files were not supplied and were not independently sought.

No missing text is interpreted as evidence that the corresponding mathematical claim is false. The review is complete with these limitations and is not conditional on fetching another text.

## Source issues

- **Misprint** in W00 at Lemma 4.13 proof, printed p.134 (W00 line 7001): the source says the auxiliary one-variable function at the vector z₀ has modulus |g(1)|; it should be the remainder G at z₀ has modulus |g(1)|; affects the proof.
- **Misprint** in W00 at §4.6 step 4, printed p.139 (W00 line 7219): the source says (4.14) is the upper bound and (4.16) the lower bound; it should be (4.14) is the lower bound and (4.16) the upper bound; affects nothing.
- **Gap** in W00 at §4.6 step 5, printed p.140 (W00 lines 7246–7256): the source says rectangular vanishing order transfers through the y-basis substitution; it should be total-degree vanishing transported first and coordinate order reduced by dimension; affects the proof.
- **Error** in W00 at Exercise 2.4(a), printed p.60 (W00 lines 3484–3493): the source says a nonzero exponential polynomial over any field cannot vanish on degree-sum-plus-term-count consecutive integers; it should be restricted to characteristic zero, or impose an appropriate characteristic-dependent degree range; affects a stated result.
