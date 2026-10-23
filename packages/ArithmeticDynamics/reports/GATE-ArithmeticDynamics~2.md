# Human-review response: ArithmeticDynamics

## H01 (CBirkbeck) — applied

The closure criterion in `TauCetiRoadmap/ArithmeticDynamics/README.md:5148` now says n=m or n=mr, retaining the separate exact-period-n multiplier-one boundary case. The Checks compute Φ*₁=Φ*₂=0 and Φ*₃=1 at (c,z)=(−3/4,−1/2), agreeing with gao-ou line 59 and gao-ou line 62, Theorem 2.1.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:7284` constructs the level/root-set equivalence under q_n≠0 before comparing actions under splitting; the general tree action still allows every polynomial. The zero-polynomial, nonzero-constant, n=0 and inseparable Checks distinguish the carriers, and §5.11 now distinguishes the necessary nonzero guard from the sufficient positive-degree condition (`Mathlib/Algebra/Polynomial/Roots.lean:644`, `Mathlib/FieldTheory/PolynomialGaloisGroup.lean:207`).

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:4209` and its API allow a compact connected accumulation set at potential zero; landing is asserted only when the radial limit exists. The Cremer Check has two distinct accumulation points p and −p, agreeing with kiwi-cremer-1995 line 45 and kiwi-cremer-1995 line 114, §§1–2, pp.2–3.

## H04 (CBirkbeck) — applied differently

New §6.106a in `TauCetiRoadmap/ArithmeticDynamics/README.md:9882` proves μ_s=μ_t iff s=t by recovering the fourth branch value from the affine density C_t/|z(z−1)(z−t)|; §6.107 explicitly consumes it after energy nondegeneracy. The proof can identify this density directly using the explicit degree-four map and the existing balanced-measure characterization; demarco-krieger-ye-2020 line 380 supplies the branch-density argument, while Proposition 2.2 supplies only equality of measures.

## H05 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:154` imports HeightsRationalPointsAndObstructions §0.18 and its six named interfaces; duplicate generic existence, bound, scaling, uniqueness and telescoping-estimate sections are deleted, and every use follows the supplier's argument order φ,α,h. Section 1.1 retains only the series/normalized-iterate comparison and refinements, including the finite-orbit case without a global error bound, and the dynamical adapters retain their original generality (call-silverman-1993 line 218, Proposition 1.2, p.169).

## H06 (CBirkbeck) — applied

`TauCetiRoadmap/ArithmeticDynamics/README.md:158` imports HeightsRationalPointsAndObstructions §§5.17a–f for general projective arithmetic intersections, adelic carriers, normalized heights, Bouche–Tian, Hilbert–Samuel and minima; the duplicate §4.2 is deleted and all its consumers cite that owner. Section 4.3 retains Yuan's arithmetic Siu/adelic perturbation theorem, and §4.11 uses its section-lattice/Minkowski argument for the perturbed integrable metric, preserving all-place equidistribution and quasi-projective completion without a reverse dependency on the supplier's archimedean abelian proof (yuan2008 line 364, yuan2008 line 1406 and yuan2008 line 1467).

## H07 (CBirkbeck) — answered

The four named inputs are prerequisite roadmaps absent from main: HeightsRationalPointsAndObstructions (#1017, `82cf8af9`, §0.18, RP.0/RP.4 and §§5.17a–f), EffectiveDiophantineMethods (#1046, `5499fdb5`, ED.0/ED.3/ED.4), InverseGaloisAndArithmeticFundamentalGroups (#850, `740b9cc6`, IG.2) and MordellLawrenceVenkatesh (#1231, `73dc3e86`, §6.4). The PR description must list them as prerequisites preceding ArithmeticDynamics, alongside its other earlier suppliers; this correction is reported for the worker because PR-text edits are outside this job's authorized files.

## H08 (CBirkbeck) — applied

The Check in `TauCetiRoadmap/ArithmeticDynamics/README.md:9980` replaces B≥34 by 34≤16B and keeps the independent B≥3 common-image bound. At B=3 these read 34≤48 and 3≤3; demarco-krieger-ye-2020 line 1988, §9.3, p.47, explicitly uses 16 times the projected-torsion bound.

## H09 (CBirkbeck) — applied

The general-dimensional part of §2.5(7) now follows its carrier in §4.1a, `TauCetiRoadmap/ArithmeticDynamics/README.md:5535`, with local measures, uniform convergence, model-function density and the comparison to the supplier's global probability measures. Section 4.11 now names §4.1 for X_v^an, §4.1a for general measures/density, and the exact global projective suppliers; the P¹ theory remains in Layer 2 (chambert-loir-2006 line 193 and line 254; yuan2008 line 1546 and line 1551).

## H10 (CBirkbeck) — answered

The discussion's “creating a target issue in another repository” and login/template-permission directions are historical, out-of-scope instructions, not mathematical prerequisites. No issue, login, access request or external write was performed; no roadmap edit is needed for this observation.

### Ownership, citations and signature verification

Object searches covered main, board packages, the indexed open-roadmap inventory and all 25 specified sibling roadmap folders; the shared height constructions have the owner recorded in H05–H06. The Legendre parameter-recovery result is specific to this roadmap's equilibrium measures, and §4.1a relocates the existing local construction, including metrics without a global adelic origin; neither creates a competing generic projective adelic carrier. No later supplier was added and no supplier declaration was redeclared in `Suggested.lean`.

Cross-roadmap resolution against main `a07e202` and the indexed heads found no missing citation or roadmap Lean name. The changed supplier contracts were read in the actual heads identified above; main HeightsAndUnits and AlgebraicCurves supplied the prose/ownership comparison. Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` match the manifest pins; Mathlib's root-set definition, nonzero membership condition and restriction-action theorem were checked directly at those pins. The resolver's external-library scan was unavailable, so its absence of findings is not used as evidence about the pins.

A scratch file containing `#check @name` for each of the 15 declarations elaborated successfully, and each full type was compared with its README statement: no hypothesis, carrier or generality mismatch was found and no Lean signature changed. In particular both ellipticity instances, both period-three hypotheses, the Stoll integer-family restriction, the degree/line/infinite-intersection hypotheses, the essentially finite-type field hypothesis, algebraicity/smoothness exclusions and the explicit finiteness conjuncts are present.

The legal source records for Gao–Ou, Kiwi, DeMarco–Krieger–Ye, Yuan and Chambert-Loir are retained in the job's scratch source manifest for worker ingestion; the allowed repository edit set excludes `sources.toml`. Call–Silverman uses its supplied cached record, and settled waived sources were not reopened; no missing source remains for these repairs.

### Adversarial mathematics record

This table covers the added or mathematically affected statements, the imported normalizations and all 15 retained Lean declarations; computations test the statements but do not replace proofs of the admitted theorems. Unchanged deep statements outside the repairs are not represented as newly re-proved.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| §3.70 closure, n=m | c=−3/4,z=−1/2,m=1,r=2,n=1 | f(z)=−1/2=z; multiplier −1; Φ*₁=0; n=m=1 while mr=2 | Old criterion false | Add n=m |
| §3.70 lower-period closure | Same c,z,n=2 and 3 | Φ*₂=0, Φ*₃=1; mr=2 | Exactly the period-two extension, not period three | Explicit positive/negative Checks |
| §3.70 multiplier-one boundary | c=1/4,z=1/2,n=1 | f(z)=1/2; derivative 1; Φ*₁=0 | On closure, outside open locus | Preserve distinct case |
| §5.16 general action and homomorphism | ℝ⊂ℂ, f=0,α=0; σ=conjugation | Level one=ℂ; σ(i)=−i; σ²(i)=i | General action exists | Keep unrestricted construction |
| §5.16 carrier equivalence | f=0,α=0,n=1 versus α=1 | First: level=ℂ, rootSet(0)=∅; second: q=−1 and both carriers ∅ | Splitting alone fails; nonzero constant allowed | Nonzero guard |
| §5.16 action comparison | f=X²,α=1,n=2 | q=X⁴−1; i and −i are roots; conjugation gives −i on both sides | Transport agrees | Construct equivalence first |
| §§5.11/5.16 degree versus nonzero | f=0,α=1,n=1 | natDegree f=0, q=−1≠0; level=rootSet=∅ | Positive degree is sufficient, not necessary | Propagate correct guard |
| §5.16 n=0 and inseparability | q₀=X−α; characteristic p,f=X^p,α=0 | q₀ level={α}; X^p level=rootSet={0}, despite degree p | No separability needed for equivalence | Explicit edge Checks |
| §3.18 normalized rays | c=0,d=2,angles 0 and 1/2 | φ(z)=z; endpoints 1 and −1; squaring sends both to 1 | Normalization and map direction agree | Landing conditional |
| §3.18 obstruction | c=2,d=2,critical point 0 | 0→2→6→38; escape | Global exterior isomorphism excluded | Retain obstruction |
| §3.18 nonlanding accumulation | Source Cremer fixed point p=λ/2,c=p−p² | f(p)=f(−p)=p; p≠−p, so cluster set has ≥2 points | Universal landing false | Allow accumulation continuum |
| §6.106a density and integrability | t=2,z=2+u; t=3 near z=2 | abs(u)ρ₂(2+u)→C₂/2; abs(u)ρ₃(2+u)→0; ∫₀^ε r⁻¹r dr=ε | Measures distinguish fourth branch | New intermediate |
| §6.106a balanced-measure identity | t=2,z=3 | f=49/24,f′=−35/144,p=6; (f′)²p=1225/3456=4p(f) | Pullback factor 4 | Direct identification on sphere |
| §6.106a sphere/degenerate charts | Infinity, and t=0 or 1 at repeated root | At infinity reciprocal density has order abs(w)⁻¹; repeated-root density has order abs(u)⁻² with ∫dr/r=∞ | Smoothness and chart conditions essential | Explicit exclusions |
| §6.106a parameter injectivity, both directions | s=t=2; s=3,t=−2 | Equal parameters give equal densities; j(3)=j(−2)=21952/9 but branch sets differ at 3 and −2 | Equality is in fixed coordinate, not moduli | Recover actual parameter |
| §6.107 zero energy | s=t=2; s=2,t=3 | E∞(2,2)=0; branch coefficient C₂/2 versus 0 forces μ₂≠μ₃ and E∞(2,3)>0 | Energy needs injectivity to recover diagonal | Add explicit dependency |
| §1.1 finite telescoping identity | φ=id,h=1,α=2,n=0,1,2,3 | Partial sums and normalized iterates both 1,1/2,1/4,1/8 | Identity includes empty sum | Series adapter |
| §1.1 comparison without global bound | Successor with h(n)=n², plus an adjoined fixed P of height 1 | Error −n²+2n+1 is unbounded; at P both sequences 2⁻ⁿ→0 | Pointwise comparison still applies | Keep finite-orbit generality |
| §1.1 scalar refinement | φ(x)=2x,h=x,α=2,P=1,c=−2 | Original limit 1; scaled limit −2=c·1; new error 0 | Negative scalar allowed | Retain refinement |
| §1.1 iteration refinement | Same φ,h,P; k=1 and 2 | Normalized sequences 2ⁿ/2ⁿ=1 and 4ⁿ/4ⁿ=1 | Iteration leaves value 1 | Retain refinement |
| §1.1 iterate error bound | φ=id,h=1,α=2,C=1,k=2 | One-step error 1; iterated error abs(1−4)=3=C(1+2) | Full geometric-sum constant | Explicit bound |
| §1.1 positivity and forbidden α | h=x or −x at P=1; successor h(n)=n,α=1 | Limits 1 and −1; at α=1 normalized terms 0,1,2 diverge | Positivity needs h≥0; convergence hypothesis matters | Explicit negative Check |
| Supplier §0.18 convergence/error | φ=id,h=1,α=2,C=1 | Limit 0; distance abs(0−1)=1=C/(α−1); tail at m=2 is 1/4 | Sharp bound | Import, delete duplicate target |
| Supplier §0.18 scaling/uniqueness | φ(x)=2x,h=x,α=2 | ĥ(2)=2=2ĥ(1); g=x+1 has g(2)=3≠4=2g(1) | Bounded perturbation alone is insufficient for uniqueness | Import scaling and uniqueness |
| Supplier §0.18 bounded perturbations | h=x and h′=x+3,φ(x)=2x | Normalized terms at P=1: 1 and 1+3/2ⁿ, both→1 | Same limiting function | Import congr_bounded |
| §1.5 preperiodic vanishing | f=z²−2,P=−2 | Orbit −2,2,2; normalized heights eventually h(2)/2ⁿ→0 | No global bounded-error assumption needed | Use series adapter, not limUnder body |
| §1.12 bounded preperiodic height | f=z²−2,P=2,C=2log2,α=2 | ĥ(2)=0; h(2)=log2≤2log2=C/(α−1) | Supplied error bound suffices | Replace local duplicate citation |
| §1.14 zero height/Northcott | Finite invariant set {−2,2}; versus successor on ℕ,h=0 | First orbit size 2; second orbit infinite although Tate value 0 | Northcott condition excludes wandering zero-height example | Preserve hypotheses |
| §1.16 semiconjugacy | φ(x)=2x,ψ(y)=2y,π(x)=3x,h=x,k(y)=y/3 | At x=1, k(π(1))=1=h(1); both Tate values 1 | Map direction and height condition agree | Supplier-based proof |
| §1.17 polarized height adapter | z↦z² on ℙ¹,point 2 | h(4)=2log2; h(2^(2ⁿ))/2ⁿ=log2 | Canonical value log2 | Preserve dynamical endpoint |
| §1.18 elliptic normalization | Torsion (0,0) on t=2; general [2] scaling | [2]P=O, heights 0; for any native height H, ĥ_[2],x=H and ĥ_(O)=H/2 over ℚ | Factor two retained | Reorder supplied arguments |
| §1.19 relative-height adapter | Power map and [2:1] over ℚ(i) | Relative logarithmic height 2log2; normalized iterates all 2log2 | Relative height retained | Supplier Tate definition |
| §1.20 absolute-height adapter | Same point and map | Absolute normalized iterates all log2 | No duplicate generic limit | Supplier Tate definition |
| §1.23 Néron–Tate comparison | Torsion point; scaling at m=2 | Height 0 on torsion; multiplier m²=4 on both sides | Néron–Tate supplied, dynamical comparison retained | Supplier uniqueness |
| §1.24 absolute/relative ratio | [2:1] over ℚ and ℚ(i) | (log2)/1=log2 and (2log2)/2=log2 | Extension normalization consistent | Preserve ratio |
| §1.26 real eigenclass | η=−O(1),φ=z²,point 2 | Height −log2; after φ, −log4=2(−log2) | No unjustified positivity for nonample class | Keep general eigenclass |
| §1.27 two ℙ¹ heights | φ=z²,point 2 and infinity | Both constructions log2 at 2 and 0 at ∞ | Same native object and normalization | Supplier uniqueness |
| Absolute adelic intersection convention | Standard ℙ¹ metric, all archimedean norms scaled by e⁻¹ | I=0→2; h(P)=0→1; h(X)=I/2=1 | Dimension factor and absolute degree fixed | Convention witness |
| Imported model intersection action | Vertical prime 2 with multiplicity 1 and 2 | Degrees log2 and 2log2; metric twist c gives c·deg | Additivity includes multiplicities | One projective owner |
| Imported adelic cycle normalization | Point, double cycle, zero cycle | Point height h; double cycle 2I/(2(n+1)deg)=h; zero has denominator 0 | Zero cycle excluded | Consume §5.17b |
| Imported probability normalization | O(1),O(2),trivial bundle on ℙ¹ | Curvature masses 1,2,0; O(2) normalized mass 2/2=1; 0/0 has no probability meaning | Positive degree required | Preserve supplier guard |
| Imported positive-bundle density | ℙ¹,O(n),unitary basis and volume doubled | Integral B_n=n+1; unitary change same B_n; volume doubling gives B_n/2 | Normalized curvature-volume hypothesis retained | Consume §5.17c |
| Imported Hilbert–Samuel convention | ℙ¹ with constant metric shift c=1 | Rank n+1; χ shift n(n+1); leading coefficient 1=I/2 with I=2 | Arithmetic dimension 2 and factorial 2 fixed | Consume §5.17d |
| Imported minima | Constant shifted point/standard ℙ¹ | Point: e₁=h=1; shifted ℙ¹: all minima 1 and h=1 | Both inequalities equalities in test | Consume §5.17f |
| §4.3 arithmetic Siu | Spec ℤ,degrees 2 and 1; surface L=M,I=2 | Curve leading 2−1=1; surface bound (2−2·2)/2=−1 while difference leading 0 | Lower bound need not be equality | Retain additional theorem |
| §4.3 adelic perturbation | ℙ¹,constant test f=1,ε=1/10 | Height shift 1/10; intersection shift 1/5; leading χ shift (1/5)/2=1/10 | First variation agrees | State exact perturbation form |
| §4.1a local curvature/continuity | Standard O(1),O(2),trivial metrics | Measures δ_G,2δ_G,0; constant metric perturbations have unchanged local curvature | Mass and uniform-limit tests agree | Move after carrier |
| §4.1a model functions, refinement, pullback | Constants 1 and 2; any model refinement and analytic map | 1+2=3 before/after refinement; pullback of 1 is 1; ∫1·2δ_G=2 | Function identity is independent of model | Explicit carrier and API |
| §4.1a degenerate dimension/semipositivity | A C_v-point; O(−1) on ℙ¹ | Dimension-zero mass 1; degree −1 cannot be a positive measure mass | No unconditional probability or negative positive mass | Explicit Checks |
| §4.11 perturbed-metric lower bound | Constant test f=−1, ε=1/10 on standard ℙ¹ | h_ε(X)=−1/10; weighted log sup of the usual coordinate section of O(N) is N/10=−N·h_ε(X); normalized section bound gives −1/10 | Requires the section-norm bound, not positivity of arithmetic height | Use Siu plus Minkowski, retain integrable perturbations |
| §4.11 semipositivity of perturbations | f=−abs(z)² on a disc, standard O(1) metric; ε=1/10,r=1/4 | Δf=−2/π times area; local curvature mass −2εr²=−1/80<0 | Perturbed metric need not be semipositive | Explicit negative-control Check and Siu/Minkowski route |
| §4.11 general equidistribution | Roots of unity on ℙ¹; torsion in B×{0}⊊B×B | Limits circle probability versus Haar_B×δ₀, not Haar_(B×B) | General carrier and genericity matter | Correct dependencies |
| §4.39 local/global comparison | Standard metrics and constant shift c=1 | Standard·standard=0; changing one factor adds 1; changing both gives self-intersection 2 | Local pairing equals supplied normalized global I | Replace deleted §4.2 citation |
| §6.111 genus-two comparison | Common images 0,1,∞; genus-two 34-point example | N≥3; 34≤16B; B=3 yields 34≤48 | Old lower bound unjustified | Restore factor 16 |
| forwardOrbit | Constant zero at x=1; identity at x=1 | Orbits {1,0} and {1}; n=0 contributes starting point 1 | Definition matches README | No signature change |
| noRationalFourCycle | c=0,x=0; c=−1,x=0 | Minimal periods 1 and 2, both ≠4 | Edge cases agree | No signature change |
| noRationalFiveCycle | Same c,x | Minimal periods 1 and 2, both ≠5 | Edge cases agree | No signature change |
| atMostOneRationalThreeCycle | c=−29/16,x=5/4,y=−1/4 or −7/4 | Cycle 5/4→−1/4→−7/4→5/4; conclusions are second/third alternatives | Both period hypotheses retained | No signature change |
| stoll_integer_family_card_gal | a=1,n=0,1,2 | X: group order 1; X²+1:2; second iterate binary group order 8; RHS 1,2,8 | n=0 subtraction gives 0, not negative exponent | No signature change |
| IsFiniteUnionAP | Empty finset; (step,offset)=(0,5),(1,0) | Sets ∅,{5},ℕ | Empty and singleton return sets represented | No signature change |
| rittCommonIterate | F=z³,G=−z³,n=2; quadratic comparison | At z=2 both cubic iterates 512; γ^(1+3)=1; quadratic iterates 16,−16 and γ^(1+2)=−1 | Both directions/support s=0 consistent | No signature change |
| ellipticStandardProjection | Identity, swap, 2·identity on x=2 and O | 2/1=2; 1/2; 4/2=2; O→∞ or 0 under swap | Column/ratio convention retained | No signature change |
| legendreTorsionImages | t=0,1,2,3; O and (0,0) | Discriminants 0,0,64,576; O→∞ and nonzero two-torsion→0 | Singular models are excluded from smooth theorems | No signature change |
| polynomialOrbits_meetingLine | F=G=z²,x=y=2,line y=x | Distinct pairs (2,2),(4,4),(16,16); n=1 gives z²=z² | Infinite-intersection/degree hypotheses remain | No signature change |
| lechIntegralAssembly | L=ℚ,s={0,1/6},N=3,p=5 | 5>3; 5-adic norms 0 and 1 | Marks need not generate and may include zero | No signature change |
| legendreTorsionSpecializations_infinite | a=2,t=4 | y²=−4; x(2P)=0; next x-coordinate ∞; discriminant 2304 | One explicit admissible torsion fibre; infinitude remains the source theorem | No signature change |
| polynomialLine_returnTimes | F=G=0,(x,y)=(1,2); lines x=1,0,3 | Return sets {0},{1,2,…},∅ | Constants and finite exceptions included | No signature change |
| uniformLegendreCommonTorsion | t₁=2,t₂=3 versus t₁=t₂=2 | First common branch set size 3; equal fibres have at least 4^m/2 projected 2^m-torsion images→∞ | Distinctness and explicit finiteness essential | No signature change |
| uniformThreeBranchCommonTorsion | E₂,E₃ with identity projections; E₂ twice | Branch-intersection cardinal 3 versus 4; second torsion intersection infinite | Exactly-three condition excludes infinite equal-fibre case | No signature change |

### Validation

Commit: `fdc28f5`, changing only `TauCetiRoadmap/ArithmeticDynamics/README.md`; `Suggested.lean` remains unchanged. The worktree is clean and nothing was pushed or posted.

Mechanical signature elaboration: exit 0, all 15 declarations.

`lake build TauCetiRoadmap.ArithmeticDynamics.Suggested`: exit 0, eleven expected admitted-theorem warnings; exact final line:

```text
Build completed successfully (8976 jobs).
```

Dependency direction output:

```text
depcheck: 26 roadmaps, 227 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurs for ArithmeticDynamics.

Final gate summary (after commit):

```text
gate ArithmeticDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
