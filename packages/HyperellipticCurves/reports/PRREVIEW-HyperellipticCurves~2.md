# Review of HyperellipticCurves (pull request #1707 at fb03bd1)

**Verdict:** needs changes

## R01 (P1) — Primitive Igusa–Clebsch vectors do not classify geometric points

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:369` and `:851`: “a primitive integral representative … is unique up to the sign”.

**Claim:** Removing the largest integral weighted power makes the stored I-vector a function of the geometric Igusa point.

**Witness:** For `C_a: y²+y=a x⁵`, `a=1,2`, the geometric points coincide. The I-vectors are `(0,0,0,12800000)` and `(0,0,0,819200000)`; division by maximal weighted powers `d=20,40` gives `(0,0,0,4)` and `(0,0,0,8)`.

**Repair:** Distinguish rational weighted-scaling orbits from rational points of the weighted projective scheme. Claim primitive-vector invariance only under rational weighted scaling; use the projective point or absolute invariants for geometric classification. Delete the geometric-dependence claim for the stored vector. Add the two curves as a negative control: both have absolute invariants `(0,0,0)`, but their primitive I-vectors remain different.

Here `I₁₀=2¹²·5⁵·a⁶`. The other three invariants vanish: the order-five coordinate symmetry forces invariants of those weights to vanish. The curves become isomorphic by scaling x by a fifth root. The normalization rule gives `20⁵·4=12800000` and `40⁵·8=819200000`; neither 4 nor 8 contains a nontrivial fifth power. This defect survives the separate, correct repair concerning `J(W_min)`.

## R02 (P2) — Root-factorization recognition loses the characteristic-two cover

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:920`: “recognition of `Aut(C)` from the factorisation of `4f + h²`”.

**Claim:** The recognition step following the all-characteristic classification uses branch-root permutations without an odd-characteristic restriction.

**Witness:** In characteristic two, both `y²+y=x⁵` and `y²+y=x⁵+x³` have `4f+h²=1`. For a primitive fifth root ζ, `x↦ζx` lifts on the first; on the second its obstruction is `(ζ³−1)x³`, not an Artin–Schreier coboundary.

**Repair:** Retain recognition in every characteristic, but split its inputs. Away from two use the branch permutation with the lift equations; in characteristic two use the Artin–Schreier cover and its lift condition `B²+B=F∘A−F`. A rational B with polynomial coboundary has no finite poles and is polynomial; a nonconstant polynomial coboundary has even degree. Thus the displayed cubic is excluded, while the zero obstruction for the first curve is accepted. Branch-root permutations alone cannot distinguish them.

## R03 (P2) — Liu's minimal-regular-model tables exclude residue characteristic two

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1091`: “over a complete discrete valuation ring with algebraically closed residue field”. Also `:1073`, “the minimal extension”.

**Claim:** These are given as the hypotheses for Liu 1994's tables, within an any-residue-characteristic section.

**Witness:** `liu1994models` lines 47–56, printed p. 138, requires henselian R, algebraically closed residue field **of characteristic different from two**, before defining its smallest stable-reduction extension. Completion does not remove residue characteristic two.

**Repair:** State the table theorem with that characteristic hypothesis, and distinguish it from Liu 1993's all-characteristic stable-type criterion. Define the geometric stable type using any extension giving stable reduction; reserve the smallest-extension assertion for its stated strict-local setting. Use the named general suppliers for the characteristic-two model theory rather than applying these tables there. A complete trait with residue field `F̄₂` must fail the table theorem's guard; `F̄₃((t))` passes it. Incorporate the author's table corrections when stating the individual rows.

## R04 (P2) — The genus-two table drops the residue-cardinality qualification

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1320`: “the table of invariants … `v(Δ_min)` (Table 8)”.

**Claim:** The complete table, including its minimal-discriminant column and model representatives, is promised for all odd residue fields.

**Witness:** DDMM Theorem 18.8, p. 78, `ddmm` lines 4081–4086, makes the minimal-discriminant column conditional on `|k|>5`; existence of a listed integral representative has the same qualification. Theorem 18.7(2), line 3774, also requires it.

**Repair:** Separate the unconditional reduction types and other invariant columns from the `|k|>5` assertions. Keep the general minimal-discriminant problem in §3.3; do not infer its small-residue-field values from this table. Explicit checks must make the table's discriminant guard false at q=3,5 and true at q=7. The later local-constancy paragraph already includes its separate cardinality guard; it does not qualify this earlier table assertion.

## R05 (P2) — Meromorphic continuation is weaker than the named conjectures

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1476`: “The hypothesis the knowls … state is `SerreC9 J 1`”.

**Claim:** The meromorphic continuation predicate is identified with both Hasse–Weil and paramodularity, and suffices for the stated analytic-rank interpretation.

**Witness:** `PeriodsAndSpecialValues` PS.1.8 permits meromorphic continuation. `lmfdb-hasse_weil_conjecture` line 90 excludes poles in the critical strip. `lmfdb-paramodular_conjecture` line 90 asserts a paramodular-form correspondence, with an endomorphism hypothesis. These are different statements.

**Repair:** Keep SerreC9 as the precisely named weaker input. For analytic rank add holomorphy at 1, and for the claimed Hasse–Weil predicate retain its no-poles condition. State modularity as a sufficient theorem/predicate with its actual hypotheses, not an equivalent name for SerreC9. The test germ `(s−1)⁻²` is nonzero, meromorphic and symmetric under `s↦2−s`, but has order −2; the added holomorphy condition rejects it. This is a test of the logical interface, not a claimed counterexample arising from a Jacobian.

## R06 (P2) — Local solvability is still specified as an algorithm

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1437`: “prove the hyperelliptic decision procedure”; `:1441`, “finite search … with `m` bounded explicitly”.

**Claim:** The target includes an executable search and computable exceptional-place set, with no actual bound on m.

**Witness:** Section 5.5(c) supplies neither the function bounding m nor a theorem locator for it. For genus two, the good-prime criterion separately gives the explicit threshold `p>16`; the general finite-search claim has no corresponding statement.

**Repair:** Remove the decision procedure, executable search and computability promises. Keep the mathematical real-place criterion, Hensel lifting, and finiteness of obstructed places, importing the existing local-solubility predicate. If a quantitative approximation theorem is needed, state its exact quantifiers, bound, hypotheses and source as mathematics. The retained criterion proves solubility at a good prime 17, since `18−4√17>1`, and rejects the real model `y²=−x⁶−1`.

## R07 (P2) — Several headline formulas still have no complete statement

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1151` (“`Σ_{𝔰' ≤ 𝔰}...`”), `:1262` (“the sets `U`, `V` … defined through `ξ` and `λ̃`”), and `:1387` (“the local images have the stated orders”).

**Claim:** These refer to missing expressions rather than specifying the theorem to prove. The same problem occurs in §3.7's seven valuation clauses, §4.6's chain cases and lattice presentation, §4.10's correction E, and §5.6's r and λ_p(r).

**Witness:** For good genus two, the conductor formula needs `#(I\U)=6`, `#(I\V)=1`, correction 1, hence invariant dimension 4. Without the membership tests it permits 5 instead. Three twins give three cycle generators with one relation, not a three-element basis of rank two.

**Repair:** Supply each definition and case with its exact hypotheses and locator. For §4.9 use DDMM's proof-corrected condition `ξ_𝔰(λ̃_𝔰)=0` for V, not the erroneous parent index printed in Theorem 1.20(ii). State the homology generators and the übereven-root relation explicitly; give the full §8.5 chain cases, including the nonprincipal-root case. Define E, r, λ, and the local image orders. Checks must recover dimension 4/conductor 0 for good genus two, rank 2/root number +1 for three split twins, and `#J(Q₂)/2J(Q₂)=4·#J(Q₂)[2]` versus factor 1 at odd p. Merely adding a citation does not determine the missing expressions.

## R08 (P2) — Genus-two Newton recovery is already owned

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:1399`: the target proving the coefficients a₁ and a₂ from N₁ and N₂.

**Claim:** Section 5.3 plans the coefficient-recovery theorem again, while citing only FunctionFieldArithmetic §§5.1 and 5.3.

**Witness:** `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1888`, §5.6, already owns Newton recovery from the first g point counts and reciprocal symmetry. At g=2 it gives exactly `a₁=N₁−q−1`, `2a₂=a₁²+N₂−q²−1`.

**Repair:** Import §5.6 by name. Keep here the equation-level point-count formula, points at infinity, and the bridge identifying the imported polynomial with the Jacobian Euler factor. For q=3, N₁=6, N₂=8, the imported theorem gives `(a₁,a₂)=(2,1)` and `L(1)=19`; no new coefficient-recovery target is needed.

## R09 (P3) — Suggested.lean contains definitions and API checks unused by headlines

**Location:** `TauCetiRoadmap/HyperellipticCurves/Suggested.lean:236`, `:241`, `:246`, `:377`, `:472`, and `:528`–`:616`.

**Claim:** The acceptance test retains sample models, an unused good-reduction predicate and coordinate involution, the entire abstract-cluster API without a headline using it, and a splitting-field abbreviation without a torsion theorem.

**Witness:** No theorem uses `model3125`, `model169`, `HasGoodReduction`, `CoordChange.involution`, the cluster declarations, or `twoTorsionField`. `isSmooth_ofWeierstrass_iff` only transfers the unit-discriminant definition through `Δ_ofWeierstrass`.

**Repair:** Delete these from `Suggested.lean`; keep their mathematics and Checks in the README. Delete the minimal-discriminant accessor/specification too if no retained headline uses that accessor. Do not replace them with proved padding. All 30 admitted theorems were tried with `simp`, `rfl`, and `infer_instance` in a scratch copy; none closed directly. That negative probe does not turn unused definitions or definition-transfer API into headline results.

## R10 (P3) — Restore the required roadmap and acceptance-test shape

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:3`, `:46`, `:542`; `TauCetiRoadmap/HyperellipticCurves/Suggested.lean:13`.

**Claim:** The README lacks the required Summary, Conventions, Exact supplier contracts and How to read the build organization; layers have no closing Examples/Dependencies. Definitions such as the Igusa point lack their own API and three discriminating Checks. The module docstring groups unrepresented results as “everything after them”.

**Witness:** Section 2.3 defines the Igusa point but provides no Checks list; no `### Examples` or `### Dependencies` occurs. The docstring does not identify the missing carrier for each omitted headline, notably the semistability/reduction dictionary and Mestre obstruction.

**Repair:** Reorganize the existing material into the prescribed headings, keeping detailed contracts and adding three discriminating Checks for every definition. List each omitted headline and the carrier it needs; retain only its genuinely statable headline signatures. For the Igusa point, use a coordinate change, a quadratic twist, and R01's fifth-power-twist example, distinguishing which equality each tests. Move library-status assertions into Scope and ownership.

## R11 (P3) — Replace incorrect and nonlocating source references

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:309`, `:799`, `:542`, `:634`, `:703`, and References.

**Claim:** Liu 1994 §1 equation (1) is cited for the mixed-model discriminant, and §2.2 for the root-sum Igusa–Clebsch formulas. Several other targets give no theorem/page locator at all. References include nonportable “On disk” assertions.

**Witness:** `liu1994models` line 15 is the equation `y²=P(x)`, not the mixed-model discriminant; lines 92–114 are coefficient formulas for J-invariants. The cited root sums occur instead in `lmfdb-igusa_clebsch_invariants` lines 96–103.

**Repair:** Cite the actual supporting theorem/equation and printed page at each claim. Cite the root-sum knowl with its sum normalization, and give a valid mixed-model discriminant locator. Add exact locators to §§0.1, 0.5, 1.3 and 5.1. Remove “On disk”. Qualify the `formDiscr` docstring at Lean line 69 by n≥2 in its degree-drop cases: n=1, G=2 gives 1, not 4, as the repaired theorem already records. Unavailable texts remain unverified below; absence of access is not itself evidence that their theorem is false.

## Verified sound

The review covered the entire README and all 75 Lean declarations, rather than only the changed lines. There are 45 numbered milestones in six layers, 30 admitted theorems, and two proved degree-bound helpers. Read-only checks found no out-of-folder PR changes, no modified tracked files, no sorry-valued data, and no `set_option` in the target. No acceptance is inferred from elaboration.

The supplied push gate is passing at the reviewed head, with all counters zero, including `stray-files`, `outside-folder`, `source-material` and `build`. Its targeted module build is recorded as OK. I independently ran direct Lean elaboration and a scratch copy containing `#check @name` for all 75 declarations. Both completed successfully, with only the 30 expected sorry warnings. The signatures retain the required `IsSmooth`, irreducibility, fraction-field, DVR and Dedekind binders; no additional silently dropped binder was found. The global-minimality signature now quantifies over height-one localizations. The one-tactic probe also completed; its residual 30 sorry warnings are reported in R09.

The prescribed dependency check returned exactly:

```text
depcheck: 204 roadmaps, 1545 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. There are no declared supplier gaps. Missing placement alone was not treated as a defect. Later roadmaps named only as consumers/exclusions were not treated as suppliers.

The earlier review was checked finding by finding before the full pass. No repair report settling a finding as “not actionable in this package” was present. The following short quotations are from this head, not from sources.

| Earlier finding | Current passage and location | Disposition |
|---|---|---|
| R01 | “`hn : 2 ≤ n`”, Lean 81 | Repaired theorem; stale docstring covered by R11. |
| R02 | “geometrically regular”, README 615–627 | Repaired; imperfect-field negative control retained. |
| R03 | “In characteristic 2”, README 654–661 | Repaired; infinity quadratic used. |
| R04 | “`C'/ι ≅ ℙ¹_k`”, README 759–769 | Repaired; nonsplit twists distinguished. |
| R05 | “`Aut(C_{k^{sep}})`”, README 777–783 | Repaired. |
| R06 | “not a function of the point”, README 852–855 | Repaired for J(W_min); new I-vector error is R01. |
| R07 | “characteristic `≠ 2`”, README 870–889 | Repaired; J₈-sensitive branch retained. |
| R08 | “`(1, π^{−m}, 0)`”, README 947–958 | Repaired. |
| R09 | “need not be related”, README 974–994 | Repaired; minimal discriminant versus equation distinguished. |
| R10 | “`N_g`”, README 947–958, 1006–1025 | Repaired exponent and strengthened obstruction statement. |
| R11 | “two smooth rational curves”, README 1077 | Repaired; three nodes give genus two. |
| R12 | “does not carry the arithmetic”, README 1158–1171 | Repaired bare-versus-arithmetic picture distinction. |
| R13 | “zero representation”, README 399; prime-to-p order at 1145 | Repaired sign and character convention. |
| R14 | “cokernel”, README 1242–1245 | Repaired; invariants taken after cokernel. |
| R15 | “`3 − 1 = 2`”, README 1306 | Repaired root-number and bad-factor relation. Lattice presentation still needs R07. |
| R16 | “`c_1 c_2 ∈ K^{×2}`”, README 1326 | Repaired local-constancy hypotheses. |
| R17 | “for `g ≥ 2`”, README 1356 | Repaired theorem; unused Lean abbreviation is R09. |
| R18 | “one component”, README 1527 | Repaired sextic real-component count. |
| R19 | “over `𝔽₇`”, README 1660–1663 | Repaired rational/geometric distinction. |
| R20 | “`module`”, Lean 1 | Repaired; gate and direct elaboration pass. |
| R21 | “of positive degree”, README 1116 | Repaired polynomial-to-picture constructor. |
| R22 | “stable reduction roadmap … Layer 3”, README 742 | Repaired characteristic-two finiteness supplier. |
| R23 | “general genus-1 models … are not elliptic curves”, README 32 | Repaired scope; broad heading/docstring should match it. |
| R24 | “at every height-one prime”, README 1001; Lean 488 | Repaired quantifier. |
| R25 | “algebraically closed residue field”, README 1091 | Partly repaired; characteristic and smallest-extension issue is R03. |
| R26 | “hypothesis the knowls … state”, README 1476 | Not repaired; R05. |
| R27 | “decision procedure”, README 1437 | Not repaired; R06. |
| R28 | “defined through `ξ` and `λ̃`”, README 1263 | Partly repaired character convention; missing formulas remain R07. |
| R29 | “`a₂ =`”, README 1401 | Not repaired ownership; R08. |
| R30 | “Non-vacuity”, Lean 239 | Not repaired acceptance-test padding; R09. |
| R31 | “Prerequisites”, README 46 | Not repaired prescribed shape; R10. |
| R32 | “Liu 1994”, README 309, 799 | Not repaired locators; R11. |

The following computed adversarial rows test the conventions, all 45 milestones, the sampled targets and every mathematical finding. They are finite tests and source comparisons, not claims to have proved the general theorems. “Retain” means the tested statement survived; it does not certify inaccessible source text. Additional Lean declaration checks follow.

| Statement | Instances and computed values on the two sides | Result / change |
|---|---|---|
| 0.1 binary discriminant | `disc₁(2)=1` versus erroneous predecessor RHS 4; corrected n≥2 excludes it. `disc₂(x²−1)=4`; `disc₂(2)=0`. For `2(x²−1)`, 16=`2²·4`. | Retain corrected signatures; R11 docstring. |
| 0.2 model/two charts | `(f,h,g)=(x⁵,1,2)` has degrees (5,0)≤(6,3), infinity equation y²=0 over F₂: one point. `(−x⁴−1,0,1)` over R has zero real points. | Quartic genus one is not forced elliptic. |
| 0.3 discriminant/smoothness | `(x³−x,0,1)` has Δ=64; `(x³,1,1)` has Δ=−27. Mod 2 these are 0 and 1, respectively. `2⁸·64=16384=disc₄(4x³−4x)`. | Tests both directions of the unit criterion. |
| 0.4 function-field bridge | Over F₅(t), `y²=x⁵−t`: arithmetic genus 2, Δ=0, geometric normalization genus 0 via x−t¹⁄⁵=z²,y=z⁵. Smooth `y²+y=x⁵` over F₂ has genus 2. | Repaired regular/smooth distinction survives. |
| 0.5 elliptic bridge | The two cubics above have both native and transported discriminants 64 and −27. Negative quartic has no rational point and no image under the monic-cubic embedding. | Retain bridge only on its subcase. |
| 0.6 fixed points/infinity | In F₂, h=1,f=x⁵: G=1, finite fixed points 0, infinity fixed points 1, total 1. Over Q, x⁵−x gives three rational roots plus infinity=4. | Characteristic-two criterion survives. |
| 1.1 coordinate group/convention | Translation then dilation on x gives 2x+1; opposite order gives 2x+2. Scalar `(5I,125,0)` at g=2 gives x′=x,y′=y. | Order and scalar-kernel controls retained. |
| 1.2 action/discriminant | At g=2, simplifying `(x⁵,1)` multiplies Δ=3125 by 2²⁰, giving 3276800000. Elliptic u=2 has ratio 2⁻¹². | Correct weights and direction. |
| 1.3 isomorphisms | Identity gives both an algebra equivalence and coordinate orbit membership. For the 11-adic pair in §3.3, x=121x′,y=1331y′ gives both; integral orbit membership fails. | Field-isomorphism statement survives; do not strengthen to integral orbit. |
| 1.4 automorphisms | For x⁵−1, geometric group order 10, rational order 2; involution order 2. On x⁵−x, `(−1/x,y/x³)` squares to `(x,−y)`, hence has order 4. | Central extension need not split. |
| 1.5 twists | `x⁵−1` and `x⁵−2` over F₁₁ have 16 and 3 points, a₁=4 and −9; not a quadratic ± pair. On x⁸+1 over R, `(−1/x,y/x⁴)` squares to identity and the twisted quotient has 0 real points. | Geometric-Aut and split-quotient repairs survive. |
| 2.1 root-sum invariants | Six roots 0,…,5 give sums 3110 (15 terms), 165952 (10), 159056000 (60); averaging instead gives 3110/15,165952/10,159056000/60. | Sum convention correct; source issue below. |
| 2.2 integral J invariants | Model 169: `1·(−43)−(−33)²=−1132=4·(−283)`; I₁₀=−692224=`4096·(−169)`. Characteristic-two model has J₁₀=1. | Integral normalization survives. |
| 2.3 geometric point/primitive vector | C₁,C₂ of R01: same geometric point; normalized last entries 4 and 8, not ± equal. | Fails; R01. |
| 2.4 Igusa classification | Quadratic twists have identical projective point; x⁵−1 and x⁵−2 are geometrically isomorphic but have 16 versus 3 F₁₁-points. | Geometric, not rational, classification. Full source unavailable. |
| 2.5 absolute invariants | `(0:0:0:0:1)` and `(0:0:0:1:1)` in characteristic two both give G2=(0,0,0), but J₈/J₁₀ data differ 0 versus 1. Model 169 gives (−1/169,33/169,43/169). | Repaired characteristic qualification survives. |
| 2.6 recognition | Characteristic two family has G=1 in both cases; lift obstructions for x↦ζx are 0 and `(ζ³−1)x³≠0`. | Fails root-only recognition; R02. |
| 2.7 Mestre obstruction | Real conic X²+Y²+Z²=0 has no projective real point; X²+Y²−Z²=0 has (1:0:1). | Split/nonsplit test; full construction unverified. |
| 3.1 integrality | x⁵+π⁻¹, h=0 becomes π²x⁵+π for m=1: constant valuation −1→1. Transformation steps at g=1,2,3 are gcd(12,12)=12,gcd(20,30)=10,gcd(28,56)=28. | Repaired scaling and exponent survive. |
| 3.2 existence/minimality | At 3, model 3125 has v(Δ)=0; integral rescaling e=1/3 gives v(Δ)=20 and is not minimal. Set of candidate valuations is nonempty in N. | Well-ordering route applies. |
| 3.3 minimal discriminant/uniqueness | The §3.3 11-adic pair both have minimum 12. Reduced configurations {1,6,4} have candidate midpoints 9,8,5, none in the set; {0,1,2} has midpoint 1. | Discriminant invariant, integral-model uniqueness false and correctly removed. |
| 3.4 global/defect class | g=2 relation −2E+3D=0 yields A=E−D with 2A=D,3A=E; scalar rescaling kills both classes. g=3 needs D∈2Cl separately. Over a PID E=D=0. Ratios of global Q-discriminants are positive units ±1, hence 1. | Repaired obstruction route survives algebraic test; full source limits below. |
| 3.5 good reduction | y²+y=x⁵ has Δ=3125, residue Δ=1 at 2 and 0 at 5. Infinity is smooth at 2 in the second chart; at 5 a geometric multiple branch root is singular. | Correct two-prime control. |
| 3.6 conductors/bad primes | Model 169: v₁₃(Δ)=2 and n₁₃=2. Model 249: valuations and n at 3,83 are each 1. A stable compact-type fibre of two elliptic components has graph rank 0 although the curve fibre is nodal. | Curve/Jacobian good reduction distinguished. |
| 3.7 Liu types/tables | Two rational components with three nodes: 0+3−2+1=2. Triangle: 0+3−3+1=1. Residue characteristics 2 and 3 both pass the written complete/algebraically-closed guard, but only 3 passes Liu 1994's guard. | Type IV fixed; R03 remains. |
| 4.1 abstract pictures | Empty root set would require ∅ to be both a cluster and nonempty; contradiction. A singleton gives one cluster and no depth inequality. Positive-degree hypothesis excludes the former. | Constructor repaired. |
| 4.2 numerical vocabulary | Six roots with one twin at depth 1 and root depth 0, v(c)=0: ν(root)=0, ν(twin)=2, relative depth=1. Good quintic: ε(root)=0, λ=0, character order 1. | Sign convention survives; omitted depth expansion R07. |
| 4.3 equivalence/arithmetic data | f and 7f at 7 have the same root depths; ν(root) changes 0→1. Thus bare pictures agree but semistability tests differ. | Repaired separation retained. |
| 4.4 semistability | Good quintic with e=1,d=0,ν=0 satisfies all three conditions; 7f has ν=1 and fails. The 169 triple cluster has depth 1/3 and e=3>2. | Both negative controls rejected. |
| 4.5 potential reduction/toric rank | Good picture: rank 0. One twin: rank 1. Three twins: 3−1=2. One odd triple plus singletons: potential Jacobian rank 0 but curve potentially good=false. | Matches all tested clauses of Theorem 1.8. |
| 4.6 fibre and homology | Three twins of depth 1/2: two vertices, three edges, b₁=3−2+1=2; component formula gives 3+1−2=2. Three cycle generators obey one relation. | R07 must state presentation and cases. |
| 4.7 Galois representation | Good genus-two quintic: abelian dimension 4, toric dimension 0, total 4. Three split twins: abelian 0, toric 3−1=2, Sp₂ gives total 4. | Zero ε and übereven correction agree. |
| 4.8 Tamagawa | Pairing [2], Frobenius −1: cokernel Z/2 has 2 fixed points; taking invariant lattices first gives trivial cokernel of order 1. Pairing [3], Frobenius −1 gives 1 fixed point. Rank-zero gives order 1. | Correct repaired order of operations. |
| 4.9 conductor | Good genus 2: 6−1−1=4 invariants, n=0. One twin n=1; three twins n=2. Tame quadratic wild term=1−2+1=0. Model 169 has 4−1−1=2 invariants and n=2. | Formula values agree; R07 missing membership laws. |
| 4.10 discriminants | Worked pictures give 2 for the 169 triple at 1/3; 1 for a twin at 1/2; 5 for three twins at depths 1/2,1,1; 1 for the 277 twin. | Values agree; missing E/cases R07. |
| 4.11 deficiency | A real curve with no real points has only even-degree real divisors: at g=2, g−1=1 is impossible; at g=3, degree 2 is possible from a conjugate pair. | Genus parity discriminates; complete local criteria not stated. |
| 4.12 root number | Split loop: a₊=1,w=−1. Nonsplit loop: a₊=0,w=+1. Three split twins: a₊=2,w=+1, whereas multiplying three −1's gives −1. | Repaired relation survives. |
| 4.13 classification/constancy | At 7, f₁=49(x⁵−x+1),f₂=147(x⁵−x+1): square-class ratio 3 nonsquare, point counts 7,9, traces 1,−1. New square condition rejects pair. Table guard q>5 is false at 3,5. | Constancy repaired; table overclaim R04. |
| 5.1 two-torsion | Even-subset quotient for orbit sizes (6),(1,2,3),(1,1,1,1,2) gives dimensions 0,1,3 and orders 1,2,8. Genus-one x⁴+1: branch field degree 4, torsion field degree 1. Genus-three x⁸−2 has a nonzero complement-fixed class. | Repaired g≥2 faithfulness and odd-genus distinction. |
| 5.2 descent | With rational 2-torsion dimension d, local quotient orders at Q₂,Q₃ are 2^(d+2),2^d in genus 2. Odd-degree rational infinity makes the kernel index 1. | General theorem needs the actual local-order statements, R07. |
| 5.3 good factors | Model 169 at q=3: (N₁,N₂)=(6,8), (a₁,a₂)=(2,1), L(1)=19. At q=5: (6,12) gives (0,−7), L(1)=19. | Values agree; import general Newton recovery, R08. |
| 5.4 bad factors | Three split twins give `(1−T)³/(1−T)=(1−T)²`, degree 2, matching 4−n=2. One nonsplit loop contributes `1+T`. | Repaired quotient relation survives. |
| 5.5 local solubility | `−x⁶−1<0` for all real x and leading coefficient −1: no real points. Good q=17: `18−4√17>1`. | Mathematical criteria survive; algorithm removed by R06. |
| 5.6 conductor bounds | For g=2, r=floor(4/(p−1)): p=2,3,5,7 gives r=4,2,1,0; λ-values 8,0,0,0 give bounds 20,10,9,4. | Values agree; define parameters, R07. |
| 5.7 period/analytic quotient | Basis swap multiplies ω₁∧ω₂ by −1, absolute density by 1. Germ `(s−1)⁻²` has order −2; holomorphic germ `(s−1)²` has order 2. | Period basis independence survives; analytic hypothesis R05. |

Additional total-function controls: over the zero ring, all discriminant identities evaluate to `0=0` (including `1=0`), and the unit condition is true over its empty spectrum. Over Q, the smooth genus-zero model `y²=x` has Δ=1 and rational function field of genus 0, so the genus theorem gives `0=0` while the hyperelliptic predicate's `g≥2` guard rejects it. For n=0, the universal discriminant is 1 and natural exponents `2*n−2` and `n*(n−1)` are 0; homogeneity/covariance therefore both read `1=1`.

The declaration-level pass below records the same tests on the actual bodies/signatures. Names are relative to `TauCetiRoadmap.HyperellipticCurves`; line numbers are in `Suggested.lean`. W denotes `(f,h,g)=(x⁵,1,2)`, E the elliptic equation `y²=x³−x`. Ψ denotes six roots with one twin T={1,2} of depth 1, all other proper depth 0; Θ denotes three twins at depth 1/2. For ordinary definitions the displayed positive/negative controls evaluate their bodies; for admitted theorems they test instances, not Lean proofs.

| Declaration / line | Values computed or boundary control | Outcome |
|---|---|---|
| universalDiscr / 62 | n=0,1 gives 1; n=2 gives a₁²−4a₀a₂ | Retain |
| formDiscr / 69 | n=2,x²−1 gives 4; constant 2 gives 0 | Retain; R11 |
| formDiscr_eq_discr_of_natDegree_eq / 75 | x²−1: 4=4; constant n=0: 1=1 | Retain |
| formDiscr_eq_of_natDegree_eq_pred / 81 | n=2,2x+1: 4=2²·1; n=1,2 would give 1≠4 but is excluded | Retain |
| formDiscr_eq_zero_of_natDegree_le / 86 | n=2,2: 0=0; n=1 is excluded | Retain |
| formDiscr_C_mul / 90 | n=2,c=2,p=x²−1: 16=4·4; c=0: 0=0; n=0: 1=0⁰·1 | Retain |
| homogSubst / 97 | n=2, M=diag(2,1),p=x²−1 gives 4x²−1; M=0 gives 0 | Retain |
| natDegree_homogSubst_le / 102 | Those degrees are 2 and 0, both ≤2 | Proved degree helper |
| formDiscr_homogSubst / 115 | Same diagonal: 16=det(M)²·4; zero matrix: 0=0²·4 | Retain |
| Model / 123 | W satisfies (5,0)≤(6,3); x⁷,h=0 does not | Retain |
| Model.weierstrassForm / 137 | W gives 4x⁵+1; zero model gives 0 | Retain |
| Model.weierstrassForm_natDegree_le / 140 | W: 5≤6; zero: 0≤6 | Proved degree helper |
| Model.simplified / 153 | W maps to (4x⁵+1,0); zero maps to zero | Retain for discriminant law |
| Model.map / 157 | W over Z maps to (x⁵,1) over F₂; integer coefficient 2 maps to 0 | Retain |
| Model.universal / 165 | At g=2 has 7 f-coefficients and 4 h-coefficients; W-specialization returns x⁵,1 | Retain |
| Model.universalΔ / 177 | W-specialization gives 3125; zero specialization gives 0 | Retain; coefficient divisibility is a real theorem |
| Model.two_pow_mul_universalΔ / 183 | W: 4096·3125=12800000 | Retain |
| Model.Δ / 188 | W:3125; zero:0; E:64 | Retain |
| Model.two_pow_mul_Δ / 194 | W over Q:12800000=12800000; over F₂:0=0 although Δ=1 | Retain; identity alone does not define Δ in characteristic two |
| Model.Δ_of_h_eq_zero / 198 | E:64=16·4; zero model:0=0 | Retain |
| Model.Δ_simplified / 203 | W:3276800000=2²⁰·3125 | Retain |
| Model.Δ_map / 206 | Z→F₂:3125↦1 equals Δ of mapped W | Retain |
| Model.IsSmooth / 211 | W over F₂ true (Δ=1); zero model false (Δ=0 in a field) | Retain |
| Model.isSmooth_iff_separable / 217 | E over Q: true=true, degree3≥3; x⁵−t over F₅(t): false=false, separability fails | Retain h2; char-two W is excluded |
| Model.ofWeierstrass / 225 | E gives f=x³−x,h=0; negative quartic is outside image | Retain |
| Model.Δ_ofWeierstrass / 233 | E:64=64; y²+y=x³:−27=−27 | Retain headline bridge |
| Model.isSmooth_ofWeierstrass_iff / 236 | E/Q:true=true; singular y²=x³:false=false | Definition transfer, R09 |
| Model.model3125 / 241 | f=x⁵,h=1,Δ=3125 | Example definition, delete R09 |
| Model.model169 / 246 | Δ=−169, genus bound (5,3)≤(6,3) | Example definition, delete R09 |
| Model.equationPolynomial / 259 | W gives Y²+Y−x⁵; zero gives Y² | Retain |
| Model.FunctionField / 264 | W has extension degree2; zero model gives nonreduced quotient by Y², not a field | Irreducibility binder essential |
| Model.irreducible_equationPolynomial / 267 | W irreducible: Artin–Schreier pole order5 odd; zero Y² reducible and nonsmooth | Retain |
| Model.isFunctionField_functionField / 272 | W: transcendence degree1, degree2 over k(x); zero example lacks required irreducibility | Retain |
| Model.genus_functionField / 279 | W in char2: `(5−1)/2=2`; E in char≠2: `(3−1)/2=1` | Retain |
| Model.isHyperellipticFunctionField / 284 | W:genus2, degree2 separable; E:genus1 fails hg | Retain |
| Model.AffinePoint / 292 | W at (0,0) satisfies 0=0; at (0,1) over Q gives 2≠0 | Retain for fixed-point theorem |
| Model.involution / 301 | (0,0)↦(0,−1)↦(0,0); in F₂ swaps (0,0),(0,1) | Retain |
| Model.numRationalWeierstrassPoints / 316 | W/F₂:0+1=1; (x⁵−x,0)/Q:3+1=4 | Retain |
| Model.numRationalWeierstrassPoints_eq / 324 | x⁵−x/Q:4=3+1; W/F₂ would give 1 versus 0, excluded by h2 | Retain |
| CoordChange / 336 | identity matrix/e=1 admitted; zero matrix or e=0 rejected | Retain |
| CoordChange.act / 351 and SMul / 373 | identity fixes W; e=1/2,t=−1/2 sends W to (4x⁵+1,0) | Retain |
| CoordChange.involution / 377 | e=−1,t=−1 fixes W's coefficients, exchanges its y-points | Unused definition, R09 |
| CoordChange.Δ_smul / 385 | simplifying W:det1,e=1/2 gives factor2²⁰ and Δ3276800000 | Retain |
| CoordChange.isSmooth_smul / 390 | Same change over Q has nonzero Δ before/after; cannot use e=1/2 over F₂ | API corollary; trim with R09 |
| Model.nonempty_algEquiv_functionField_iff / 402 | Identity makes both sides true; 11-adic coordinate isomorphism makes both true despite no integral equivalence | Retain |
| Model.quadraticTwist / 413 | t=1,n=0 returns W; t=0,n=−1 returns (4f+h²,0) | Retain |
| Model.Δ_quadraticTwist / 424 | t=0,n=−1:D=4, multiplier4¹⁰=2²⁰; D=0 gives Δ0 | Retain, including degenerate quadratic algebra |
| Model.exists_smul_quadraticTwist_ofWeierstrass / 430 | t=1,n=0 gives D=1,identity; D=0 excluded | Retain bridge |
| Model.IsIntegral / 443 | W/Z true; (x⁵+1/2,0)/Z false | Retain |
| Model.IsMinimal / 450 | W/Z₃:true at valuation0; rescaling e=1/3 gives20 and false | Retain |
| Model.exists_isMinimal / 458 | W/Z₃ identity witnesses minimum0; rescaled W transforms back to0 | Retain |
| Model.exists_unit_Δ_eq_of_isMinimal / 463 | identity gives u=1,3125=1·3125; equal minima have valuation ratio0 | Retain |
| Model.isMinimal_ofWeierstrass_iff / 468 | E/Z₃ has Δ64 valuation0: both true; nonminimal integral scaling gives valuation12: both false | Retain bridge |
| Model.HasGoodReduction / 472 | W at2 true; at5 false, min v₅=5 | Unused predicate, R09 |
| Model.IsGlobalMinimal / 488 | W has v₅Δ=5<step10 and all other valuations0; minimal everywhere. Scaling e=1/3 fails at3 | Retain |
| Model.IsGlobalMinimal.isIntegral / 492 | W coefficients integral at all primes and in Z; coefficient1/2 fails at2 | Retain local/global interface |
| Model.exists_isGlobalMinimal / 496 | Over Z, W identity works; e=1/3 scaling returns to W | Retain |
| Model.Δ_eq_of_isGlobalMinimal / 503 | W and x↦x+1 have the same Δ3125; positive rational unit ratio1 | Retain |
| Model.minimalDiscriminant / 512 | W:3125; model169:−169; singular zero model has value0 | Accessor unused by headline, R09 |
| Model.minimalDiscriminant_spec / 516 | Identity minimal W gives (3125:Q)=3125 | Accessor API, R09 |
| ClusterPicture / 528 | Ψ has univ+6 singleton+1 twin=8 clusters; empty X impossible | Unused carrier, R09 |
| ClusterPicture.IsProper / 544 | T:true; {1}:false | R09 |
| ClusterPicture.children / 547 | T children={1},{2}, count2; Ψ root children=T,{3},{4},{5},{6}, count5 | R09 |
| ClusterPicture.parent / 552 | parent(T)=root; parent(root)=root junk convention | R09 |
| ClusterPicture.meet / 556 | meet({1},{2})=T; meet({1},{3})=root | R09 |
| ClusterPicture.relDepth / 561 | δ(T)=1−0=1; δ(root)=0 junk convention | R09 |
| ClusterPicture.nu / 564 | ν(T)=1+1+4·0=2; ν(root)=0 | R09 |
| ClusterPicture.IsTwin / 568 | T size2:true; root size6:false | R09 |
| ClusterPicture.IsEven / 571 | T:true; singleton:false | R09 |
| ClusterPicture.IsUbereven / 575 | Ψ root:false (odd children); Θ root:true (three even children) | R09 |
| ClusterPicture.IsCotwin / 578 | g2 root with size4 child+two singletons:true; Ψ root:false (no size4 child) | R09 |
| ClusterPicture.IsPrincipal / 583 | Ψ root:true; twin:false; root with only two size3 children:false | R09 |
| ClusterPicture.potentialToricRank / 591 | Ψ:1−0=1; Θ:3−1=2; good picture:0 | R09 |
| ClusterPicture.SemistabilityCriterion / 599 | trivial inertia, integral principal depth0,ν0:true; v(c)=1 gives ν(root)=1:false | Combinatorial half only; R09 |
| Model.twoTorsionField / 616 | x⁵−x splits over Q,degree1; genus-one x⁴+1 branch field degree4 versus Jacobian torsion field degree1 | Unused abbreviation; R09 |

There are 75 named rows above, with the anonymous SMul instance checked alongside its action. No automatic tactic closed an admitted theorem. The proved degree helpers are needed to construct retained models and transformations; they are not being counted as headline mathematics.

For the seven worked equations I independently recomputed the binary-form discriminants and I₂ by exact rational/integer arithmetic. The resulting pairs `(Δ,I₂)` were: 169 `(-169,8)`; 249 `(249,-216)`; 277 `(277,-256)`; 3125 `(3125,0)`; 2916 `(-11664,-960)`; 4096 `(-65536,-640)`; 336 `(-172032,135328)`. These agree with the stated equations, including the distinction between the curve's conductor label and its discriminant.

I counted points on both affine charts over F_p and F_(p²) for 34 good curve/prime pairs, hence 68 point counts. The table records `(p;N₁,N₂;a₁,a₂;L(1))`; coefficients were then recovered by the displayed Newton equations. This tests characteristic two as well as odd primes and the infinity contribution.

| Model | Values |
|---|---|
| 169 | (2;6,6;3,5;19), (3;6,8;2,1;19), (5;6,12;0,−7;19), (7;8,64;0,7;57), (11;12,144;0,11;133), (17;15,265;−3,−8;228) |
| 249 | (2;5,7;2,3;14), (5;6,30;0,2;28), (7;9,45;1,−2;56), (11;11,125;−1,2;112), (17;19,345;1,28;336) |
| 277 | (2;5,9;2,4;15), (3;5,11;1,1;15), (5;7,21;1,−2;30), (7;7,55;−1,3;45), (11;14,126;2,4;150), (17;22,330;4,28;390) |
| 3125 | (2;3,5;0,0;5), (3;4,10;0,0;10), (7;8,50;0,0;50), (11;13,103;1,−9;125), (17;18,290;0,0;290) |
| 2916 | (5;6,46;0,10;36), (7;4,52;−4,9;27), (11;12,166;0,22;144), (17;18,358;0,34;324) |
| 4096 | (3;4,6;0,−2;8), (5;6,6;0,−10;16), (7;8,78;0,14;64), (11;12,150;0,14;136), (17;30,286;12,70;576) |
| 336 | (5;8,42;2,10;48), (11;8,150;−4,22;96), (17;10,318;−8,46;192) |

The seeded source audit covered all 15 requested targets. No locator was explicitly labelled unverified in the README. Bibliographic access claims (“On disk”) were not taken as evidence. Sources were fetched through the sources service; no source text or source file was placed in the repository and no manifest was edited. For DDMM, the text actually read was arXiv:1808.02936v2; the theorem/page numbers below refer to that version, not a claim about every published pagination.

| Seeded target | Text and locator actually examined | Conclusion |
|---|---|---|
| 0.1 binary-form discriminant | Pinned `Polynomial.discr` and its constant/linear/quadratic formulas, plus direct specializations | Algebraic boundary tests pass after repair. No exact source locator for the general covariance theorem is supplied; R11. |
| 0.5 genus-one bridge | Pinned `WeierstrassCurve.Δ` and `VariableChange`, coefficient substitution | Δ agreement checked on the two examples and by comparing formulas. Textbook source not available; broad heading must not include quartics. |
| 1.3 coordinate isomorphisms | Pinned rational-subfield uniqueness; AlgebraicCurves Layer 12B.0; quoted Cassels–Flynn source unavailable | Genus≥2, smoothness and irreducibility are explicit in Lean. Full source theorem not certified. |
| 1.4 automorphism groups | StableReduction Layer 3 finite automorphisms; pinned restriction/kernel and finiteness declarations | All-characteristic finiteness now has an owner; geometric/rational distinction repaired. Igusa classification text not accessible. |
| 3.3 minimal discriminant | DDMM Cor. 1.24, p.8, lines 386–393; Liu 1994 introduction, pp.137–138, lines 16–19 | Unit-ratio proof and two nonequivalent minimal equations checked. Liu's uniqueness is for regular models. |
| 3.4 global models/obstruction | `liu2022` lines 17–39, 53–71 (pp.1–2); pinned elliptic global-minimal and obstruction declarations | PID existence supported; lattice/class calculation independently checked. Lockhart/Liu1994 as cited do not provide an exact locator for the newly stated general defect-class criterion. |
| 3.5 good reduction | Unit discriminant criterion tested at 2 and 5; supplier regular/Picard–Néron contracts resolved | Textbook theorem and full generality not source-certified; no contradictory instance found. |
| 4.3 picture equivalence | DDMM Thm.1.27, p.9, `ddmm` lines 423–439 | Forward isomorphism and geometric converse match; arithmetic enrichment is correctly separated. |
| 4.5 reduction/toric rank | DDMM Thm.1.8(2),(3),(5)–(8), p.4, lines 153–172 | Clauses match with odd residue characteristic and smooth curve standing assumptions. |
| 4.7 Galois representation | DDMM Thm.1.19, pp.6–7, lines 293–310; coefficient-field note 348–349 | Dimensions and corrections match. The character is Q̄_ℓ-valued; the tensor representation is realizable over Q_ℓ. Retain that distinction. |
| 4.9 conductor | DDMM Thm.1.20, p.7, lines 321–347, and proof of Thm.11.3, p.56, lines 2732–2753 | Wild term and semistable rank match. Undefined U,V need R07; parent-index source error identified below. |
| 4.12 root numbers | DDMM Thm.2.20, p.19, lines 876–882; Thm.1.14 relation, pp.5–6 | Formula uses the +1 eigenspace. Three-twin correction now agrees. General tame formula remains a target needing a complete statement. |
| 4.13 genus-two classification | DDMM Thms.18.7–18.8, pp.76–78, lines 3769–3777,4078–4100; Thm.1.29, p.10, lines 451–459 | Local constancy hypotheses repaired; table cardinality restrictions are missing, R04. Full row-by-row reconstruction not certified. |
| 5.1 two-torsion | `ps1997` §6, pp.10–11, lines 434–500, especially Prop.6.2, as an additional legal source | Ramification-point quotient agrees with the even-subset model at p=2. Faithfulness tested for six branches and failure for four. README's Mumford/Cassels–Flynn locators are not exact and their texts were unavailable. |
| 5.7 L-function/period/BSD | PeriodsAndSpecialValues PS.1.8 and PS.3.3; both LMFDB conjecture knowls, line 90; Néron supplier §1.11 | Meromorphic and holomorphic/modular statements differ, R05. Lattice rank and basis independence are consistent; no unconditional BSD claim is accepted. |

Ownership was searched by objects, using the roadmap search service, main content, the supplied open checkouts, and package READMEs: binary forms/discriminants, hyperelliptic function fields, Igusa–Clebsch invariants, Mestre conics, cluster pictures, even-subset torsion, x−T descent, coefficient recovery and periods. AlgebraicCurves explicitly leaves integral models, Igusa invariants and clusters to HyperellipticCurves (`TauCetiRoadmap/AlgebraicCurves/README.md:1334`). Thus this is a new equation-level owner, not a reason to reject the whole folder as a re-plan. Its genus-two Newton recovery overlaps an existing owner (R08). Searches found no competing fully qualified `TauCetiRoadmap.HyperellipticCurves` declaration outside this roadmap's own open checkout. Later finite-field and Sato–Tate roadmaps defer the equation-level invariants back to this one.

The resolved supplier contracts below state what was actually found; they do not certify all of each supplier's mathematics. The shape examples read on main were AlgebraicCurves, StableReduction and JacobianChallenge. File paths in the table are under `TauCetiRoadmap/<name>/README.md`, except the completed number-field roadmap.

| Supplier | Resolved sections / inspected content |
|---|---|
| AlgebraicCurves (main) | Layers 2–3 and 5–7 give normalization, divisors and ramification; Layer 10 at 1193/1313 gives model classes and the separable degree-two condition; Layer 11 at 1396 gives automorphisms; Layer 12B.0 at 1491 gives the regular model and its smooth branch. The off-pin names listed at HyperellipticCurves 511–526 were not found at the pins; consume the main roadmap's targets, not an unchecked claim of pinned availability. |
| EllipticCurves (main) | Layers 4 (793), 4.5a (905), 4.5b (1013), 5 (1154): local/global minimality, defect ideals, patching, reduction. The retained hyperelliptic variants use the monic-cubic bridge rather than replacing those objects. |
| LocalFieldsRamification (main) | Layers 0–3: valuations, local extensions, inertia/ramification filtration and different. The normalized valuation convention is v(π)=1, so tame quadratic discriminant contribution 1−2+1=0 agrees. |
| StableReduction (main) | Layers 0–8: curves, graph/nodes, stable and regular models, numerical type, stable reduction. Layer 3 at 483 supplies finite automorphisms of stable geometric fibres, including characteristic two. |
| JacobianChallenge (main) | Layers D (218), E (332), F (448): relative Picard/Jacobian, abelian variety, pointed Abel–Jacobi. The Jacobian itself has no rational-point requirement; the Abel–Jacobi map has one. |
| NeronModelsAndSemistableAbelianVarieties | §§1.8–1.11,2.2–2.3,3.1,3.5,3.8–3.9,3.13,4.1–4.7,5.0b–5.0c,5.1,5.4–5.6,6.10. In particular §2.2 distinguishes geometric/rational components; §4.7 is the lattice quotient; §5.0c/5.6 uses geometric Frobenius on H¹, dual to the homological Tate module. §1.11 supplies the differential lattice, not an already defined real-period integral. |
| RelativeJacobiansAndIntegralCurveModels | §§3.3 (664),4.1 (758),4.2 (785),4.3 (807),4.4 (827): Raynaud comparison, full-fibre reduction, torsion bounds and component lattice. The perfect-residue or quasi-section alternative remains explicit. Over Q_p the residue field is finite, and the rational component quotient has the required Lang input. |
| EffectiveDiophantineMethods | §3.23 (3868) owns the sextic x−T descent and its kernel/local-count/rank statements, with its arithmetic-input hypotheses. The odd-degree variant here is distinct. |
| HeightsRationalPointsAndObstructions | §§1.1–1.5,1.7–1.8,1.12,1.14,1.18,2.1–2.5,3.3,3.17a,3.18c,6.1: Kummer/Selmer/Sha, regulator, coverings, local solubility and parity. No second Selmer-group owner is needed. |
| PeriodsAndSpecialValues | PS.1.1 Euler product, PS.1.8 (618) meromorphic SerreC9, PS.3.3 meromorphic order/leading coefficient. These support the consumed objects but not the stronger identification in R05. |
| FunctionFieldArithmetic | §§5.1 (1726),5.3 (1807),5.4 (1838),5.6 (1888): point counts, rational zeta numerator, L(1), Newton recovery. Add §5.6 to the imports, R08. |
| SchemeAndStackFoundations (main) | §5.11, `weil_bound_via_surfaces`: smooth projective geometrically irreducible curve, bound 2g√q. This is the existing input for §5.5. |
| Completed/NumberFieldArithmetic (main) | Layer 5 at 1290, especially §5.1 at 1302: completions/local fields and local–global dictionary. |
| ArithmeticGaloisRepresentations | §2.7 (2085) local constants with character/measure/reciprocity conventions; §§3.1–3.3 conductor. The local-constant construction explicitly starts with K/Q_p finite; use its actual scope for any tame generalization. |
| ArtinRepresentations | Layer 6, finite-image local epsilon/root numbers; induction constants are part of its local-constant theory. No upward/cyclic edge was reported by depcheck. |
| EtaleCohomologyFoundations (main) | Etale-cohomology carrier and its curve interfaces are the owner named in §4.7; a more precise section citation is needed when the component-cohomology statement is fully written under R07/R10. |

Pinned declarations opened and compared by object include the following. These paths refer to library sources at the manifest pins, not to newer online versions.

| Pinned file and line | Declaration / what it provides and does not provide |
|---|---|
| `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:935` | `Polynomial.discr`; lines 939,944,959 give constant, linear and quadratic values. Constant discriminant is 1. This is the ordinary polynomial discriminant, not automatically the fixed-degree binary-form specialization. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:131` | Δ formula; line 366 `IsElliptic` is the unit-Δ condition. It does not make an arbitrary genus-one quartic an elliptic curve. |
| `Mathlib/AlgebraicGeometry/EllipticCurve/VariableChange.lean:57` | `VariableChange` and its group/action, lines 100–128; the elliptic subgroup has a marked point at infinity. |
| `TauCeti/FieldTheory/FunctionField/Hyperelliptic/Basic.lean:76` | `IsHyperellipticFunctionField`: genus≥2 and a separable degree-two rational subfield; it does not impose geometric regularity of a curve model. |
| `TauCeti/FieldTheory/FunctionField/Hyperelliptic/Genus.lean:243` | `isIntegrallyClosedIn_of_sq_eq`; line 258 genus formula; line 272 hyperellipticity. Squarefree need not mean geometrically separable over imperfect fields. |
| `TauCeti/FieldTheory/FunctionField/Hyperelliptic/RationalSubfield.lean:154` | Uniqueness of the degree-two rational subfield under its function-field, exact-constant and genus hypotheses. |
| `TauCeti/FieldTheory/FunctionField/Hyperelliptic/Finite.lean:43` | Standing `NeZero (2:k)`; branch permutation at 49, kernel at 72, finiteness at 90. This pinned finiteness route does not cover characteristic two. |
| `TauCeti/NumberTheory/ModularForms/BinaryForms.lean:71` | `binaryFormRep` for integral matrices, using the opposite monoid. The general coefficient-ring substitution is `MvPolynomial.linearSubstRep`, `TauCeti/RingTheory/MvPolynomial/LinearSubst.lean:231`; transpose/order conventions must be respected by the dehomogenization bridge. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/GlobalMinimalModel.lean:98` | `IsGlobalMinimal` quantifies over all height-one localizations; the native elliptic predicate also carries ellipticity. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169` | `quadraticTwistOf` uses trace and norm; line 239 gives the multiplier `(t²−4n)⁶`. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/ObstructionExponent.lean:85` | Divisibility by 12 and, at 94, the twelve-times-obstruction identity. This fixes the g=1 normalization. |

The headline inventory is: characteristic-free discriminant and smoothness; genus/function-field dictionary; coordinate-isomorphism theorem; finite automorphisms and twists; Igusa classification and Mestre obstruction; local/global minimal models and obstruction; Liu reduction dictionary; cluster semistability, good reduction, special fibre, Galois representation and numerical invariants; genus-two reduction classification and local constancy; Jacobian two-torsion/descent; equation-to-Euler-factor bridge; local solubility and conductor bounds; local-factor/period/BSD-quotient interfaces. The Lean file states the first discriminant, function-field, isomorphism, twist and minimal-model bridges. The Igusa/Mestre, geometric reduction, Jacobian and analytic statements are not replaced by arbitrary Prop parameters, which is appropriate. But the docstring must enumerate them and identify their missing native constructions rather than saying “everything after them” (R10). No independently established additional statable headline omission is asserted as a finding here; the unused abstract carriers are not substitutes for those results (R09).

Legal texts used include [DDMM v2](https://arxiv.org/abs/1808.02936v2), [Liu 1993](https://www.math.u-bordeaux.fr/~qliu/articles/courbes_stables_genre2.pdf), [Liu 1994 models](https://www.math.u-bordeaux.fr/~qliu/articles/mini_reg_model.pdf) and [author errata](https://www.math.u-bordeaux.fr/~qliu/articles/errata-g2-3.pdf), [Liu global equations v3](https://arxiv.org/abs/2109.07318v3), [Poonen–Schaefer](https://math.mit.edu/~poonen/papers/descent.pdf), [Cardona–Quer v1](https://arxiv.org/abs/math/0207015v1), and the individually named LMFDB knowls. Source IDs and line locators above refer to the service's extractions of these versions.

## Not verifiable

These are limits of this review, not additional mathematical counterexamples. The review is complete as a needs-changes report; it is not waiting for a source response.

- `igusa1960`, *Arithmetic Variety of Moduli for Genus Two*, DOI 10.2307/1970233, §§3,8: the service reached JSTOR metadata but no readable legal full text. The complete characteristic-dependent automorphism classification and integral moduli construction are not certified. The characteristic-two distinction and R02's lift obstruction were checked independently.
- `lockhart1994`, *On the Discriminant of a Hyperelliptic Curve*, DOI 10.2307/2154650: JSTOR landing page only. The source's exact definitions/hypotheses and any claimed global-minimality theorem were not guessed.
- `bolza1887`, *On Binary Sextics with Linear Transformations into Themselves*, DOI 10.2307/2369402: JSTOR metadata only. No legal full text was available through the service.
- `casselsflynn`, *Prolegomena to a Middlebrow Arithmetic of Curves of Genus 2*, DOI 10.1017/CBO9780511526084: Cambridge landing page only; no chapter text read. Coordinate-isomorphism and torsion claims therefore lack verification against that cited book.
- `mumford1984`, *Tata Lectures on Theta II*: no legal full text resolved. The two-torsion description was compared instead with the accessible Poonen–Schaefer §6, without pretending this certifies the missing Mumford locator.
- `liu2002`, *Algebraic Geometry and Arithmetic Curves*: OUP access returned HTTP 403. The precise book locator behind the general good-reduction assertion was not verified.
- `silverman2009`, *The Arithmetic of Elliptic Curves*: no legal full text resolved. The native elliptic discriminant/coordinate-change declarations were inspected directly instead.
- `stoll2001`, DOI 10.4064/aa98-3-4: the publisher endpoint returned HTTP 502. Its descent implementation was not read or used as an instruction, and no algorithm was imported into the review.
- The service classified `mestre1991`, `schaefer1995`, `namikawaueno`, `blr1990` and `stichtenoth2009` as uncertified/paywalled. Their locators remain citations without full-text certification; they were not added as new missing-text requests.
- The legal PDFs for Liu 1993, Liu's conductor paper and Brumer–Kramer were accessible, but parts of their displayed formulas are damaged or absent in the extraction. I checked the readable hypotheses, the stable-type description and the independently computed numerical bounds; I do not certify every extracted exponent or every table entry. The author's Liu 1994 errata were also read. A complete corrected table is still a specification task under R03/R07.
- The new Dedekind-domain defect-class converse has a coherent lattice/class argument as tested above, but the README does not supply a source locator for that exact general theorem. `liu2022` confirms the need to distinguish the projective-bundle and Weierstrass-class obstructions; it is not being substituted silently for the cited source.
- Claims explicitly marked as stored database values—full automorphism/Galois-group identifications, torsion groups, the analytic period/BSD numerical data, and all bad Euler factors—were not all reconstructed independently. The exact discriminants, 68 point counts, sampled cluster formulas, quadratic cofactor signs and torsion boundary cases were checked as recorded above. No clean bill of health is claimed for the uncomputed database assertions.
- No source manifest was present in the reviewed folder. Legal alternatives successfully fetched for Liu, Poonen–Schaefer and Brumer–Kramer were removed from the scratch missing-text list. All remaining failed texts were collected in one `needs-references.toml`, using the same source IDs. No source or source extraction was committed to the PR.

## Source issues

- **Misprint** in lmfdb-igusa_clebsch_invariants at normalization paragraph, unpaginated HTML (line 92): the source says odd-weight sign normalization uses powers of minus i; it should be powers of minus one; affects a stated result.
- **Error** in lmfdb-igusa_clebsch_invariants at root-sum paragraph, unpaginated HTML (line 103): the source says to average the distinct orbit expressions; it should be to sum them, without dividing by orbit size; affects a stated result.
- **Gap** in cardonaquer at proof of Lemma 1, p. 4 (line 133): the source says its final representative handles all j₁=j₂=0; it should be split further at j₃=0 and use (0,0,0,1) there; affects the proof.
- **Misprint** in ddmm at Theorem 1.20(ii), p. 7 (lines 339–340), and Theorem 11.3: the source says V tests the parent cluster's character denominator; it should test the cluster itself, as the proof does at line 2744; affects a stated result.

The following further source corrections are explicitly reported in `liu1994errata` lines 7–21; the full table reconstruction is not certified here.

- **Error** in liu1994models at Proposition 4.2.1(b), p. 143: the source says the case has the printed ramification/regularity conditions; it should require ramified ω and regular inverse image; affects a stated result.
- **Misprint** in liu1994models at Proposition 4.3.1(d), p. 144: the source says the final valuation condition uses the printed A-invariant monomial; it should use a₀⁻²⁰A₅⁶J₂⁻⁵; affects a stated result.
- **Misprint** in liu1994models at equation (4), p. 145: the source says one quarter of d_K; it should be one half of d_K; affects a stated result.
- **Gap** in liu1994models at §5.1 lemma, p. 149: the source says the lemma holds without a positivity condition on b₆; it should assume v(b₆)>0; affects a stated result.
- **Gap** in liu1994models at §5.2 lemma, p. 151: the source says the lemma holds without a positivity condition on c₆; it should assume v(c₆)>0; affects a stated result.
- **Error** in liu1994models at line 7, p. 156: the source says the displayed normalization can be imposed; it should be θ₀(S)=1/3, v(b₆)=3 and v(b₅)≥3; affects the proof.
- **Error** in liu1994models at Table 2.2, n=2,r=1, p. 159: the source says the IIa−b entry is determined symmetrically by d₁,d₂; it should retain ordered equation-dependent e₁,e₂ because IIa−b is not symmetric; affects a stated result.
- **Misprint** in liu1994models at Table 2.3, rows 4–5, p. 159: the source says the displayed assignments of e₁ and e₂; it should interchange them; affects a stated result.
- **Misprint** in liu1994models at Table 3.2, first row, p. 162: the source says the type is labelled [2I₀−(r−1)]; it should use [2I₀−r] under the author's corrected convention; affects a stated result.
- **Error** in liu1994models at Table 3.4, p. 163: the source says the entries use d₁ and q as printed; it should replace both throughout by d₁/n; affects a stated result.
