# Polylogarithms repair report

Finding numbers are local to their review: the first ten sections answer r1a; the next six answer r1b. The missing-manifest gate and r1a F05 are settled together. Reviews were treated as claims, and all mathematical decisions and edits were made without delegation.

## F01 (P3) — applied

**Review r1a.** Rational approximation algorithms, termination, complexity and `PolylogDiagnostic` → uniform Fourier bounds and Kummer reduction only. Deleted the computational interfaces and their dependent prose. Exact regulator formulas and the completed-unit rank statements remain in §§2.5 and 6.1. The retained analytic identity is supported by Z07, equation (2), pp.10–11.

## F02 (P1) — applied

**Review r1a.** Reversed integral kernel Check → `[w]` belongs to the strict-exterior kernel because `1-w=w⁻¹`. Its antisymmetric boundary is a potentially nonzero diagonal; for ℚ(√−3), the sixth-root torsion summand detects its exact order two. Hence `2[w]` lies in both kernels. K3BlochGroups §3.1 distinguishes these two tensor quotients.

## F03 (P2) — applied

**Review r1a.** README-only every-family headline → `zagier_three_everyFamily` with an arbitrary family, its actual `IsCycle3` hypotheses, all infinite places and a possibly zero rational scalar. The signature uses existing carriers. Section 3.8 retains its all-configuration lifting obligation, supported by G95 line 3478 through line 3485, rather than inferring it from existence.

## F04 (P3) — applied differently

**Review r1a.** Added proved mirrors for the Fourier cutoffs, constant-function failure, raw cyclic expansions, prime-unit independence, rescalings, collisions, zero columns and obstruction square, combining related assertions. Added named boundary targets for both Lobachevsky values, both cycle nonexamples and all three derivatives. The negative cycle targets require quotient/valuation or analytic descent, so are honest theorem targets rather than admitted examples.

## F05 (P3) — applied

**Review r1a; also the package gate.** Missing source record → `packages/Polylogarithms/sources.toml`, with all nineteen works, complete bibliographic fields, exact editions, locators, section mappings and service-produced access metadata. Every record is certified. Added BOR77 to the bibliography. Schneider was fetched from a legal institutional seminar copy after the original resolver failed; no source remains missing.

## F06 (P1) — applied differently

**Review r1a.** Moved the general primitive adapter into §2.2, the geometric presentation before configuration maps, and conditional transfer after its §4.7 homotopy input. Moved the normalized dictionary and abstract support cones before Green forms; retained the Green/Wang comparison in §5.9. The complete configuration chain comparison now follows Gale duality. Updated consumers and local dependencies without changing layer ownership.

## F07 (P2) — applied

**Review r1a.** Composite closedness → separate ∂- and bar∂-closedness on every resolved divisor restriction, exactly the condition at BUR line 3095, Lemma 4.5, pp.80–81. Added the nonconstant coefficient example showing why the composite equation is weaker, with a constant coefficient as the positive control.

## F08 (P2) — applied

**Review r1a.** Characteristic-zero algebraic cubic construction → arbitrary algebraically closed characteristic, retaining arrangement domains and multiplicities. Analytic comparisons remain over ℂ. Added smooth cubics in characteristics two and three; smoothness checks the gradient on the cubic. G04 line 2793 and line 2840 impose no characteristic-zero restriction. The explicit-presentation descent obligation remains separate.

## F09 (P1) — applied differently

**Review r1a.** Implicit arbitrary-curve rigidity → the named, independent `ellipticFiveTermDescent` obligation for chord, associativity and Steinberg relations in the explicit quotient, with three Checks. Analytic comparison concerns the constructed family-compatible maps. G04 line 2387 and line 2887 use the broader quotient; Proposition 6.1, p.53, does not prove its identification for arbitrary fields. No general presentation isomorphism is assumed.

## F10 (P1) — applied

**Review r1a.** Forward Hurewicz map alone → a natural rational primitive isomorphism in §2.2, including its inverse, plus the connected Hopf-algebra primitive projection and invariance of the primitive Borel pairing. Section 3.8 explicitly projects a homology lift and applies the inverse. WEI4 line 493 through line 503 gives the general primitive identification; no finite-dimensional duality is imposed.

## F01 (P2) — applied differently

**Review r1b.** Implicit cubical convention → `δ=-∂_M` and the supplier's `J_q=(-1)^q` on cycles and both total complexes. Corrected the proposed degree-one witness: the supplied boundary is `∂⁰-∂∞`. Also distinguished the two normalization subcomplexes via their common degenerate quotient. BFT line 81 through line 90 fixes its convention; MotivicEtaleKTheory §§4.2,12.2 fixes the supplier's.

## F02 (P3) — applied

**Review r1b.** Nonexistent `singleValued_inversion` → `singleValued_inv`; specified agreement for natural indices at least two, including the endpoint branches. Verified the supplier signature at `TauCetiRoadmap/PolylogarithmFunctions/Suggested.lean:426` and its integer-indexed `polylog`. This changes a supplier locator, not a public declaration of this package.

## F03 (P3) — applied differently

**Review r1b.** Design labels → actual supplier sections and names, including MotivesAndAlgebraicCycles §4.14. Imported K3BlochGroups §4.21's existing rational-function rigidity and presentation equality instead of planning them again. Borel and universal Deligne exports are recorded as supplier gaps, not invented declarations. Removed the claim that linear Hodge structures supply geometric Deligne theory; supplier availability and placement require external action.

## F04 (P3) — applied

**Review r1b.** Three elementary admitted statements → direct proofs. `cycleLift_iff` now needs only `C,D,E,p,a,x,y,hx`; the unused `J,b,q,hsquare,hy` are deleted. The commuting-square assumptions remain in `cycleLift_of_injective`. `normalizedPeriod_empty` uses `Matrix.det_fin_zero`. The README gives the same generality, and the one-dimensional counterexample tests the injectivity boundary.

## F05 (P3) — applied

**Review r1b.** Wrong equation (15) locator → the unnumbered coefficient generating function and value on printed p.3. G00 line 143 records the coefficient; line 326 is equation (15), concerning other forms; line 767 through line 771 gives Proposition 4.1 and equation (28). The differential and its coefficient are unchanged.

## F06 (P3) — applied

**Review r1b.** Deleted the trailing catalogue of future names. Easy headlines and boundary assertions now have signatures; targets requiring constructed quotients or complexes remain in the README. The cycle-predicate docstrings explain their individual quotient comparison targets, without restoring a catalogue. All public Lean declaration names occur in the README.

## Gate failure and checks

The listed gate failure, **missing sources.toml**, is cleared: the manifest has schema `tauceti-roadmap-sources/v1`, nineteen distinct work keys, every mandatory bibliographic field, precise version notes, locators, section mappings and certified service access records. The service fetched every cited work. The temporary Schneider request is resolved; there are no unresolved reference requests. BOR77's displayed formula in Remark 6.3 was also read in the rendered legal PDF, since the text extraction omits mathematical displays; its index is `m=n-1`.

- Elaboration of `packages/Polylogarithms/Suggested.lean` using `lake env lean` from the pinned content checkout: **exit 0**, exactly **17** expected admitted-theorem warnings, no errors and no other warnings. The file has one `import Mathlib`, 542 lines, 18 real-bodied definitions, 20 theorems and 24 proved examples. No `TauCeti.*` imports are used, so no prerequisite object build was needed.
- A separate scratch elaboration with `#check @name` for `zagier_three_everyFamily`, `cycleLift_iff`, `cycleLift_of_injective` and `singleValued_three_derivative_one`: **exit 0**. The every-family cycle hypothesis, number-field binders, sufficient lifting square/injectivity hypotheses and endpoint `HasFDerivAt` statement all survive elaboration. The scratch file's package prefix equals the final Lean file.
- Required dependency command with `--movable`: **exit 0**, with exactly this output and no UPWARD, CYCLE or moved line:

```text
depcheck: 14 roadmaps, 110 edges, 0 problem(s)
```

- Source validation: **exit 0**, `packages/Polylogarithms/sources.toml: 0 problem(s)`.
- Worker package text scanner with the configured pins, sibling readmes and supplied merge order, together with its required-file, source-manifest and gap-reference checks: **exit 0**; every text-gate count is zero and the package problem list is empty.
- README/public-Lean-name agreement: no missing names. `git diff --check`: **exit 0**. No machine paths occur in the deliverables.

## Adversarial mathematics pass

“Target” below means a library proof obligation, not a completed Lean proof. Each row includes the associated elementary API identities and their standing hypotheses; definitions on future carriers remain README targets. The tables record mathematical checks independently of elaboration.

| Statement or definition | Instances tried | Result and change |
| --- | --- | --- |
| Analytic conventions; `polylog`, `singleValued`, `blochWigner` | Weights 0,1,2,3; 0,1,−1; lower boundary at 2 | Bernoulli sign and lower-cut convention agree. Supplier agreement is scoped to natural weights ≥2. |
| Symbol and endpoint conventions | 0,1,∞; torsion unit −1; weight 1 versus odd weight 3 | Unit one is zero, but odd-weight symbol `[1]₃` is retained. Rational coefficients kill torsion units only. |
| Cross-ratio and orientation | `(∞,0,1,i)`; first-two swap; one infinity | Values `i,−i` and the signed volume convention agree. |
| Alternation and shifts | Two swapped vertices; source degrees 2 and 3 | Unnormalized alternation and alternating residue component signs agree with `d[-1]=-d`. |
| Borel and determinant normalization | ℚ; ℚ(i); ℚ(√2); weights 2,3,4 | Powers of π and square-root discriminant survive; empty determinant is one. |
| §2.1 descent, embedding regulator | ℚ target dimension zero; ℚ(i) and conjugation; sixth root | Rational descent is unchanged. Corrected which integral kernel contains the sixth-root symbol. |
| §2.2 measurable cocycle | Normalized tuple; repeated point; five generic points | Degenerate value zero is not a continuous representative claim. Alternation and cocycle relation use the five-term identity. |
| §2.2 primitive identification, inverse, rank filtration | Zero ring; degree 1 over ℚ; finite-rank stabilization | Positive K-groups and positive stable primitives are zero in the zero-ring case. The unit class two survives and returns under the inverse. |
| §2.2 primitive projection and pairing | Primitive element; product of classes of two and three; degree zero | Product has a nonzero reduced coproduct and projects to zero. Primitive classes and their Borel pairing are fixed. |
| §2.3 trace calibration | Matrix-unit triple and first-two reversal | Alternating trace −3, half trace −3/2 and Φ-value 1/2; reversal negates them. Full regulator calibration remains a target. |
| §2.4 metric and Möbius model | Translation; positive diagonal matrix; inversion axis; conjugation | Density, positive height and orientation behave as stated; the height term in the denominator is necessary. |
| §2.4 ideal region and exhaustion | `z=i`; height 1 and 1/10; real fourth vertex | Region membership differs at the two heights. Real degeneration avoids the circumcenter division. |
| §2.4 cusp volume and signed volume | Cutoffs H and 2H; omitted open ball; reversed orientation | Tail quarters when height doubles. Missing a ball violates exhaustion; orientation reversal changes only the signed value. |
| §2.4 Lobachevsky definition and identities | 0, π/2, π; `z=i`; regular ideal tetrahedron | Factor two gives the zero period integral. Half/full-period boundary assertions are named Lean targets. |
| §2.5 `circlePartial`, uniform tail, Kummer identity | N=3,6 at i; unit point 1; real z; `(1+i)/2` | Proved values 8/9 and 209/225; uniform tail remains meaningful at 1. No approximation algorithm remains. |
| §3.1 `trilogCyclic`, `TrilogRelationFunction`, explicit quotient | `(1,1,1)`; `(2,2,2)`; inversion at 2; endpoint 1 | Proved raw expansions retain endpoint and negative quarter coefficient. Identity function fails inversion; admissible specialization is explicit. |
| §3.2 `unitVector` | 0,1; prime units 2,3,5; inverse unit | Endpoint test passes; prime valuations prove independence in the native tensor carrier, ruling out the zero definition. |
| §3.2 `FiveTermFunction` | Zero and constant-one functions | Proved positive and negative tests; raw relation hypotheses exclude forbidden denominators. |
| §3.2 low-weight complexes and `IsCycle3` | Zero; `[1]`; `[3]`; `[3]₂⊗u(5)` | Repeated wedge gives square zero. `[3]` has a nonzero universal boundary; added `not_isCycle3_single_three`. |
| §3.2 `IsCycle4` | `[1]`; `[2]+[1/2]`; `[2]` | First two positive cases are proved; `[2]` is detected by the trilogarithm and ord₂. Added named negative target. |
| §3.3 exterior and weight-three residues | `t∧2∧3`; units only; uniformizer 2t; odd pole; residue characteristic two | Uniformizer-first sign agrees with rational exterior residue and the inverse tame convention. No reduction of nonunits as units is used. |
| §3.4 configurations and Bigrassmannian | Rank zero; repeated vector; deletion/projection twice | Genericity excludes repeated vectors. Deleted indices start at zero; the two directions have the required alternating signs. |
| §3.5 geometric presentation and triangle parameter | Triangle parameters 2 and 1; four collinear or coincident points | Endpoint η maps to `[1]₃`, not zero; determinant order is correct and survives nonzero rescaling. |
| §3.5 `projectedCrossRatio` | Moment curve; last-two swap; doubled first vector | Proved values 6/5 and 5/6; the first-vector rescaling keeps 6/5. |
| §3.5 `tripleRatio` | Moment curve; generic endpoint tuple; doubled first vector | Proved values 10/9 and 1; rescaling keeps 10/9. Endpoint one is allowed. |
| §3.5 signed configuration maps | Steinberg wedge; middle map under independent rescaling; triangle endpoint | Lower signs and factor eighteen are kept. Middle map is not projectively invariant; full projected square belongs after duality. |
| §3.6 Gale duality and full chain comparison | `(I,B)` and `(-Bᵀ,I)`; double dual; seven-point deletion | Duality reverses the top class. Complete chain comparison now consumes the earlier maps and proved duality in this order. |
| §3.6 top cohomology and transfer | Steinberg triple; genuine Milnor symbol; extension of degree d | Steinberg image is killed. Transfer after restriction multiplies by d, not d³. |
| §3.7 configuration K-maps and Borel class | Rank two; GL₃→GL₄; `[1]`, `[−1]` | Rank-two vanishing does not identify rank and Adams filtrations. Nonzero endpoint period fixes the zero-map and π² controls. |
| §3.8 existence, cycle lifting, image containment, both Lean headlines | ℚ; ℚ(i); zero or duplicate columns; rational basis change | Existence needs nonzero scalar; every-family permits zero. Containment now uses projection and inverse primitive identification. |
| §4.1 inductive groups and specialization | Constant family; pole `1/t`; nonrational residue field | Projective specialization gives infinity at a pole. Arbitrary raw differences are not relations. |
| §4.2 higher complex, inversion and presentation maps | n=1,2,3,4; `[1]`; `[3]₂`; adjoining t | No weight-zero carrier. Supplier owns rational-function rigidity; arbitrary-curve rigidity is not inferred. |
| §4.3 analytic cycle evaluation and constancy | Constant family; pole; raw `[t]₃`; endpoint-corrected three-term relation | Only actual kernel families have constant periods. No general classification of all functional equations is assumed. |
| §4.4 `periodMatrix`, `normalizedPeriod`, three Zagier assertions | Empty size; positive size with zero column; doubled column; row conjugation | Proved native zero-column and empty cases. Zero column requires positive size; odd/even row parity agrees. |
| §4.5 explicit raw weight-four kernel | `[1]`; `[2]`; inversion pair; totally real field | Kernel differs from its exterior-boundary shadow. `[2]` remains a named negative target; no weight-four theorem is claimed here. |
| §4.6 obstruction and both lifting theorems | Zero spaces; p=a=id on ℚ with q=b=0 | Only zero lifts to an a-cycle in the counterexample. Proved criterion needs no square; the sufficient criterion needs injective q. |
| §4.7 empty determinant rationality | ℚ at weights 2,4; ℚ(√2) at weight 2; odd weight 3 | Factors 6,90,24 agree. Odd-weight determinant is not empty. BOR77 rendered formula confirms the normalization. |
| §4.7 polynomial-place homotopy and conditional transfers | Constant complex; linear place; `t²+1`; identity extension; tower | Nonrational residue fields and finite support are retained. Infinity is excluded. Transfer retains homotopy and tower-coherence hypotheses. |
| §5.1 test-form LF spaces and currents | Empty manifold; escaping bumps; Dirac derivative; degrees outside [0,m] | LF topology differs from compact-open topology; duality sign and out-of-range zero spaces agree. No product of arbitrary currents is supplied. |
| §5.2 LF cycle integration, resolutions, Poincaré–Lelong | Point; double component; nodal curve; degree-two finite map; `z^r` | Multiplicity and proper degree are retained. Resolution is degree one; logarithmic divisor current has the stated sign. |
| §5.2 normalized current dictionary | One-form versus two-form; point versus codimension zero; `-log|z|` | Koszul sign and Tate normalization are independent; top differential gives the negative divisor current. |
| §5.2 abstract support models | Empty/full support; nested supports; two applications of the simple differential | Cone direction, shift and signs agree. Construction uses semipurity and restriction, without Green representatives. |
| §5.3 admissible loci, relative families and incidence | Zero degree; double hyperplane; colliding points; nonreduced base; projection center | Multiplicities survive base change; support alone is insufficient. Forbidden face and projection-center cases are excluded. |
| `collidingPointCycle` | Zero over ℚ; separated points over ℚ; one over ZMod 2 | Proved collision retains coefficient two in ℕ, including characteristic two. No geometric h-descent claim is extended to that characteristic. |
| §5.3 logarithmic Green representatives | Smooth coefficient; separately nonclosed coefficient with composite derivative zero; punctured disc | Repaired separate closedness. Critical Green degree includes the cycle-current correction; nonintegrable power poles are excluded. |
| §5.4 r forms, variety residues and dictionary | m=1,2,3; repeated entries; constant norm one; `z∧c` | Arity, codimension shift, i² sign and residue conversion agree. Dictionary precedes simplex chain maps. |
| §5.5 raw Deligne and simplex regulator | Weight one; simplex degree 0 and 1; conjugate cycle pair | Top operator and exceptional degree-zero-cycle formula are retained. Number-field real descent uses all embeddings. |
| §5.7 Wang forms and boundary currents | m=0,1,2; ratio one; first zero/infinity faces | `T₁=-log|f|` has boundary `-δ₀+δ∞`. Cubical and simplex face counts differ. |
| §5.8 cubical regulator and orientation transport | Cube degrees 0,1,2; degenerate cube; both normalized subcomplexes | `J₀=1`, `J₁=-1`. Supplied one-chain regulator is positive log; δ-model formula is negative log. Common quotient compares normalizations. |
| §5.9 Green/Wang comparison and Beilinson regulator | m=0; principal divisor; critical and subcritical degree | Principal Green term cancels its cycle current. Cone construction is earlier; comparison uses J on every supplied source model. |
| §5.10 mixed forms and regulators | Each axis; (1,1); cube degree one; coordinate scale −1 | Cube-first sign and total differential agree. Scalar −1 has zero logarithmic jet; arbitrary norm-changing scale does not. |
| §5.11 parameter-space forms and resolved incidence | p=0; p=q−1; doubled fibre; node; singular stratum | Degrees and period factors agree. Ordinary current pullback is restricted to the stated smooth/transverse maps. |
| §5.12 Green classes and Arakelov cones | Principal pair; Spec ℂ; point on ℙ¹; shifted versus unshifted cone | Principal class cancels and degree is correct. Top smooth forms are quotiented before forming the specified cone. |
| §5.13 curve fibre and `etaJet` | Zero residue map; ramified symbol; `η(z,c)`; jets at 1 and i | Full homotopy fibre retains its shifted summand. Tame sign and Steinberg exactness agree; both jet examples are proved. |
| §5.14 Chow dilogarithm and reciprocity triangles | `(1-t)∧t∧(t-a)`; constant factor; a=3; nonproper curve | Value D(a) fixes the integral sign. Nonzero exterior residue rules out a Bloch-kernel-valued homotopy. Analytic comparison concerns constructed maps. |
| §5.15 rational and algebraic-number curves | Auxiliary point change; collision outside good locus; cover degree d; several complex embeddings | Five-term independence is retained; descent divides by d rationally and uses every Borel component. |
| §5.16 elliptic line construction and explicit adapter | Line swap/rescaling; tangent multiplicity; chord with y=0; associativity; characteristics 2,3 | General-position domains and the external minus sign are retained. Explicit five-term descent is a separate target, not a consequence of arbitrary-curve rigidity. |
| §5.17 weight-three curve regulator and higher reciprocity | g=f; constant g of nonunit norm; five-term sum; ramified K₄ class | Radial correction and degree-two sign are necessary. Higher reciprocity and coherent transfers remain conditional. |
| §5.18 lattice adapter, elliptic kernel and pairing | Zero/nonzero character; repeated last points; translation; scale two; zero frequency | Orthogonality, antisymmetry and factor 1/32 agree. Zero frequencies are excluded; logarithmic products still require the common regularization target. |
| §6.1 completed units and p-adic matrix | ℚ; imaginary quadratic; inert prime; totally real quadratic; p=2; quadratic unit at 7 | Rank-zero minors are one. Columns are all embeddings, not primes. Torsion and logarithm depth hypotheses survive. |
| §6.2 differential and all four derivative values | 1/2,2,−1,i; radial/angular vectors; endpoint 1 | Values and signs agree. Added three easy signatures; at one the statement is `HasFDerivAt`, not merely a totalized fderiv value. |

## Source and supplier evidence

All nineteen bibliography keys have certified legal copies and complete records in `packages/Polylogarithms/sources.toml`. The decisive fresh readings were BUR line 3092 through line 3100; G00 line 135 through line 143, line 324 through line 327 and line 765 through line 771; G04 line 2314 through line 2336, line 2383 through line 2389 and line 2793 through line 2890; G95 line 903 through line 940 and line 3474 through line 3503; WEI4 line 493 through line 503; and BFT line 81 through line 90 and line 808 through line 829. BOR77 line 590 through line 594 was checked against the displayed formula on printed p.632. No source passages were copied into the package or report.

Supplier checks used the pinned content roadmaps, the available sibling contracts and read-only supplier texts. K3BlochGroups §§3.1,4.21 and Layer 6; PolylogarithmFunctions §4.5 and its Lean `singleValued_inv`; MotivicEtaleKTheory §§4.2,9.1,12.2; MotivesAndAlgebraicCycles §4.14; BorelRegulators §§3.10,7.1; and Completed HodgeStructures' linear-only scope settle the ownership and convention findings. The general primitive adapter here concerns all unital rings and all positive degrees, whereas BorelRegulators §3.10 is the finite-type arithmetic application.

## Maintainer consequences

- No commit, push, pull-request edit, merge-order edit, pin change or change outside the authorized package files was made.
- `cycleLift_iff` has a shorter argument list. Other public Lean names were retained; new public names are the every-family headline, the two Lobachevsky boundary theorems, the two cycle negative controls and the three derivative theorems.
- The local target `weightTwo_rationalFunctionRigidity` is replaced by the named K3BlochGroups §4.21 imports. Primitive constructions live in §2.2; geometric presentations in §3.5; the complete chain comparison in §3.6; conditional transfer in §4.7; normalized/support foundations in §5.2. Consumers citing old subsection locations must use these locations.
- The rational approximation and `PolylogDiagnostic` names are deleted. Every-family rationality still requires the stated all-configuration lifting proof; the explicit elliptic construction still requires the newly isolated five-term descent proof. The broader source quotient is not substituted for the explicit target.
- The supplier exports and placement behind `gap:borel-period-contract` and `gap:universal-deligne-contract` are **not actionable in this package**. Their exact needs and owning sections are recorded under Exact supplier contracts and in the top-level `gaps` list of `packages/Polylogarithms/design/plan.json`; that file contains only this permitted list. This package cannot discharge the Borel supplier's Tamagawa input or the motivic supplier's geometric Deligne input by editing either supplier.
- This repair report is not acceptance; an independent review remains necessary.
