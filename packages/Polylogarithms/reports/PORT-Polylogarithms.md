# Polylogarithms port report

- Branch: `roadmap/polylogarithms`.
- Head: `4696a1a07b88021687c890c11f5a14095986e7c1`.
- Commit: `Polylogarithms: roadmap (README, Suggested.lean, metadata)`.
- Base verified: clean checkout at `a07e202`.
- Changed repository files: `TauCetiRoadmap/Polylogarithms/README.md`, `TauCetiRoadmap/Polylogarithms/Suggested.lean`, `TauCetiRoadmap/Polylogarithms/metadata.toml` only.
- The repository worktree is clean. Nothing was pushed and no pull request, issue or comment was created or edited.

The build and push gate pass. **Supplier verification remains incomplete:** K3BlochGroups has no readable accepted content in the supplied package or indexed content heads; BorelRegulators and MotivicEtaleKTheory remain the accepted package's explicit external contracts. The unrestricted H-space contract also exceeds its supplier's readable statement. These are material limitations, not assertions that the gate checked their mathematics. The accepted ownership decisions were preserved rather than inventing replacement supplier declarations.

## Validation

The required module build exited 0. Exact outcome line:

```text
Build completed successfully (8976 jobs).
```

There are **9 warnings**, all declaration-uses-sorry warnings; there are **0 other warnings** and **0 errors**. The final build rebuilt the module after the explicit real-shape branch was added to the region definition. The file has 15 real-bodied definitions, 9 admitted headline theorems and one substantive proved example. It has a single `import Mathlib`, no Tau Ceti import, no admitted data and no option override.

Exact push-gate summary, on the committed clean tree:

```text
gate Polylogarithms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate's content checks passed before committing, but its clean-tree check rejects both staged and unstaged changes. Consequently the required commit was made before the final successful gate run. The tooling and merge order were not changed.

Exact separate dependency-check output:

```text
depcheck: 21 roadmaps, 176 edges, 0 problem(s)
```

Exit 0, with no UPWARD, CYCLE or moved line. `git diff --cached --check` passed before the commit; the committed diff contains only the three target files. Metadata matches the one-key form on main: `topic = "math.NT"`.

## Draft pull request body

Build a general library of explicit polylogarithmic regulators, from Bloch–Wigner descent and ideal hyperbolic volume through the trilogarithmic complex and the weight-three Zagier determinant theorem. Develop inductive Bloch groups, cycle-obstruction comparisons, logarithmic current and higher Chow regulators, low-weight reciprocity and elliptic Fourier pairings, with period, residue and current conventions fixed by explicit examples. The weight-four theorem belongs to Polylogarithms, Part II; general motivic and higher-reciprocity assertions retain their conjectural status.

Prepared with Codex (GPT-6), including mathematical self-review and Lean signature checks. The supplier-availability limitations in this report need resolution before the dependencies can be represented as verified.

## Dependencies that are open roadmaps

The following are new roadmap folders at the indexed heads, rather than progress or revision pull requests:

- PolylogarithmFunctions — §§4.5, 4.8, 5.2, 5.4, 5.7 and 7.2; head `860558b`.
- GeneralAlgebraicKTheory — §§3.12–3.14; head `e0552fe`.
- StableHomotopyKTheory — §§3.37 and 4.14; head `00bfbf7`; the unrestricted extension remains an unmet contract.
- K2SymbolsBrauer — §§5.4, 7.2, 8.2–8.3, 9.5, 9.11–9.16, 10.5, 10.9, 10.24, 10.29–10.30, 11.3 and 11.5; head `d13a6dc`.
- SchemeKTheoryOperations — §§3.3, 4.5, 5.1–5.2 and Layer 6; head `88dbd5a`.
- ArithmeticKTheory — §§3.3–3.4; head `4573db5`.
- AlgebraicModuliForArithmeticGeometry — §1.6 and Layer 9, especially §9.7; head `0b84954`.
- ComplexComparisonPartII — §§C−1.1 and C5.4; head `2d50a88`.
- KTheoryFiniteLocalFields — §3.0a; head `afe02e8`.
- MotivesAndAlgebraicCycles — §§4.8a and 4.14; head `936433f`.
- IntegralIwasawaTheory — §§2.2 and 4.1–4.4; head `ee1450e`.
- ColemanIntegration — L0.F and L0.15–L0.18; head `ae078af`.

DifferentialGeometry, ComplexKahlerGeometry, GeometricCurrents, GeometricTopology, SchemeAndStackFoundations and AlgebraicVectorBundles were read on main, not at revision-pull-request versions. HodgeStructures occurs as a boundary explaining the distinction between linear Hodge structures and Deligne complexes, not as a replacement for the universal regulator contract. K3BlochGroups is earlier in the supplied merge order but cannot be certified as a readable open content roadmap. BorelRegulators and MotivicEtaleKTheory are not verified open roadmap dependencies.

## Content retained and editorial changes

The full package text was ported, preserving every layer, detailed formula, exact mathematical hypothesis, source locator and worked example except the ownership duplicate described below. Named API catalogues were expanded into prose bullets expressing their actual facts. Paragraph-form Checks were split into individual bullets. Native-carrier definitions and their domains received explicit API descriptions. The references now describe their editions directly, without referring to a source manifest absent from the target folder.

The accepted non-blocking notes were checked against the supplied package: the triangle construction references point to §3.5; its Checks now sit there; the K3 boundary is described by its mathematical source and target rather than a nonexistent `blochBoundary` export; the Lobachevsky integral cites MIL, not an unrelated passage; GR §7.1 cites (129)–(134); and the two admitted Lobachevsky boundary values remain README Checks. Those repairs were already present in the accepted package except for the placement of the triangle Checks.

## Lean to README and supplier replacements

- Deleted `circlePartial` and `circlePartial_error` from `Suggested.lean`. PolylogarithmFunctions §7.2 already requests the uniform closed-disc bound and the weight-two Fourier bound, with its complete hypotheses. This is the same mathematical object; parametrizing the circle by a unit complex number instead of a real angle does not create another ownership target. Scope and ownership records that supply. The finite sums and values 8/9 and 209/225 remain Checks in §2.5, which retains the distinct Kummer identity.
- No other admitted theorem or necessary definition was deleted. The prime-valuation independence example remains because it meaningfully tests the native rational-unit carrier. No new API lemmas or Check-mirroring declarations were added.
- The package already delegates the exact trilogarithm differential and the Steinberg one-form to PolylogarithmFunctions, completed-unit maps and the rank criterion to IntegralIwasawaTheory, current carriers and Poincaré–Lelong to ComplexComparisonPartII/GeometricCurrents, and relative-cycle pullback to MotivesAndAlgebraicCycles. These ownership repairs were preserved and their readable contracts checked again.
- ColemanIntegration L2.Fb also has an integral pre-Bloch carrier and antisymmetric boundary. It does not supply the cited indecomposable-K₃, rigidity or presentation-comparison contracts. Replacing the unavailable K3 supplier by that subsection alone would leave a mathematical gap and introduce the need to audit the rest of Coleman's build. No such replacement was claimed.
- No target was moved from a later roadmap into this one. The weight-four theorem and its construction remain downstream.

## Ownership sweep

Used the roadmap index list, object-based grep and show commands against the indexed open heads and main. Searches covered pre-Bloch and Bloch quotients, antisymmetric versus exterior boundaries, rational-function rigidity, Suslin comparison, primitive Hurewicz and rank filtrations, Borel regulators, Deligne regulators and complexes, Chow-cycle incidence, LF currents and Poincaré–Lelong, trilogarithm relations/configurations, Lobachevsky and Kummer formulas, elliptic kernel/character normalization, and Leopoldt matrices. Board-package matches were also searched and the supplied sibling checkouts were included in the comparison. No helpers were used.

The genuine duplicate found was the Fourier bound in PolylogarithmFunctions §7.2. The other intersections are the accepted supplier boundaries recorded above. Ordinary Fourier theory is supplied; §5.18 owns the explicit complex-lattice area/character adapter and its singular regulator pairing. Ordinary intersection and relative-cycle operations are supplied; §5.3 owns the admissible Chow-form/tautological-incidence adapter. Current theory is supplied; §§5.2–5.10 own its BFT normalization and explicit regulator comparison. These variants have different stated conclusions, rather than renamed copies of their suppliers.

No declaration in `Suggested.lean` has the fully qualified name of a declaration in another readable roadmap; all 24 named declarations are under `TauCetiRoadmap.Polylogarithms`. No root roadmap list or manifest was changed.

## Final mathematical and signature review

Read the whole README again after expanding its APIs, then checked its changes against the retained Lean statements. Fixes made during this pass:

1. **Real ideal shapes:** the README said the circumcenter formula was not used when Im z=0, but the real-bodied definition still used totalized division. `idealRegion` now returns the empty set on real shapes before forming the circumcenter. The signed volume is therefore zero at 0, 1 and every real shape, with no geometric denominator outside its domain. The nonreal headline signatures are unchanged.
2. **Green codimension:** made p≥1 explicit in both logarithmic Green representatives and the Green Chow presentation; otherwise the promised `(p−1,p−1)` Green degree would include a negative case without a convention. Made n≥1 explicit for the Arakelov complex.
3. **Raw determinant domains:** stated that the raw matrix accepts any index type, whereas its normalized determinant requires a number field and a finite decidable square index type. The arithmetic assertions use exactly dₙ≤N rows; an arbitrary larger index type cannot justify replacing natural subtraction by integer subtraction.
4. **Ordinary differential:** replaced an unspecified “indicated projection” in §5.4 by the exact coefficientwise real projection for odd m and i times the imaginary projection for even m on the common unit locus. This is distinct from the separately retained current/Deligne dictionary obligation.
5. **Proof-route dependencies:** removed the group-cocycle subsection from the ideal-volume theorem's Needs line; its statement and geometric route use the coordinate construction, integrability and Lobachevsky formula, without group cohomology.
6. **Notation and citations:** repaired fragmented inline code spans in the complex, residue, Green and mixed-regulator formulas; expanded ambiguous “Layer 4 and §§9.1,12.2” references to MotivicEtaleKTheory; removed future API suffixes from code spans; and removed the absent-manifest assertion from References.

Elaborated one scratch file containing `#check @name` for **all 24 named declarations** after the final Lean edit, by importing the built module. It exited 0. Every elaborated type was compared with its README statement. No section binder disappeared and no binder repair was needed. In particular the two lattice instances, the number-field instances, the equivalence selecting all infinite places, every cycle hypothesis, the totally-real instance, n≥2 and Even n are present. The changed real-shape definition has the same type; the deleted Fourier pair accounts exactly for the change from 26 to 24 declarations. The remaining 9 headline signatures are the angle formula, finite volume, signed-volume equality, Kummer identity, complete weight-three functional relations, weight-three existence and every-family rationality, totally-real even-weight existence, and elliptic absolute convergence.

The module docstring still identifies the nonstatable descent/Borel, configuration, current/Deligne, reciprocity and elliptic-pairing headlines and the missing carriers. It gives no weakened substitute for them.

## Pinned-library evidence

Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both dependency checkouts were checked against `lake-manifest.json`.

| Object | Exact source at the pin | Scope verified |
| --- | --- | --- |
| Continuous logarithm | `TauCeti/Analysis/Complex/ContinuousLog/Basic.lean:161` | Definition is `∃ h, ContinuousOn h S ∧ EqOn (fun x => Complex.exp (h x)) g S`; it does not assume that S is open or simply connected. Nonvanishing is proved at line 172. |
| Valuation-unit reduction | `TauCeti/FieldTheory/FunctionField/Place/Residue.lean:113` | `residueUnit` requires a nonzero field unit and a proof its order is zero. It cannot reduce a pole by totalization. |
| Finite divisor support | `TauCeti/FieldTheory/FunctionField/Place/Zeros.lean:461` | `finite_setOf_ord_ne_zero` requires the function-field instance. Principal-divisor and product-formula files give the weighted degree-zero input. |
| Local logarithm | `TauCeti/NumberTheory/LocalField/Logarithm.lean:97` | Principal-unit series over every finite p-adic extension; depth-isometry and injectivity at lines 256 and 285 retain the strict ramification inequality. |
| Riemannian volume | `TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Volume.lean:76` | The native measure is supplied; the coordinate ideal regions and cusp estimates remain local targets. |
| Algebraic cycles | `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44` | The raw carrier is finite-support coefficients on scheme points; its weighted map is at line 70. Equidimensionality, relative specialization and arbitrary-base cycle pullback are additional supplier conditions, not fields of this abbreviation. |
| Infinite places | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:102` | Selected embedding; real/complex counts at lines 437 and 441, total cardinality at line 447 and signature at line 475. |
| Discriminant | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:41` | Nonzero discriminant justifies the square-root denominator for number fields. |
| Dedekind zeta | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49` | Native zeta function, without a Borel special-value comparison. |
| Full lattice | `Mathlib/Algebra/Module/ZLattice/Basic.lean:433` | The class requires a discrete submodule and full real span; neither a rank-one subgroup nor the zero subgroup qualifies in ℂ. |
| Positive covolume | `Mathlib/Algebra/Module/ZLattice/Covolume.lean:72` | Covolume is the real value of additive covolume; positivity at line 98 uses the full discrete lattice and Haar measure hypotheses. |
| Logarithmic sine integrals | `Mathlib/Analysis/SpecialFunctions/Integrals/Log.lean:46` | Half-period and full-period integrals at lines 46 and 85 give the boundary Checks; they are not new acceptance targets. |

Object searches of both pinned source trees found no polylogarithm/Bloch-group/explicit Deligne-regulator carriers implementing the missing headline comparisons. A file named DeligneSplitting concerns mixed Hodge splitting, and Gamma/Deligne concerns the gamma function; neither is the required Deligne cohomology complex. No foreign formalization was copied or executed.

## Source and citation limits

The accepted package's exact editions and printed locators were retained. Reopened primary sources G04, G94, GR, BFT, D96 and WEI4. Relevant text anchors include G04 line 779 (ordinary differential), G04 line 834 (current integrability), G04 line 917 (resolution proof), G94 line 1916 (projected squares), G94 line 2042 (Gale matrix), WEI4 line 625 (unrestricted rational primitive statement), BFT line 1993 (regulator comparison), and G04 line 3643 (rational-line reciprocity with six-torsion qualification). The source PDFs are linked in the README. The author scan G95 and the Z90 scan do not expose a text layer through the browser; the inherited fine-grained scan locators were not all independently recertified. The exact configuration arithmetic below was independently recomputed, rather than inferred from those locators.

The citation resolver reports exactly the same three missing-roadmap leads: MotivicEtaleKTheory §4.2, K3BlochGroups Layer 3 and BorelRegulators Layers 3–5. It reports no missing own Lean names. Its final note says it did not search external pinned names on its host, so library claims were checked directly in this worktree's dependency sources instead.

No suspicious task-directed instruction was followed. A generic fetched project page included `lake exe cache get`; it was treated as document data, and that command was not run. No downloaded code, credential, network shell, GitHub write or proxy change was used.

## Unresolved

- **K3BlochGroups content:** `packages/K3BlochGroups/` contains reports and `sources.toml`, but no `README.md` or `Suggested.lean`. The index at main `a07e202` and the permitted open heads has no K3BlochGroups content roadmap. Its reports are evidence of a review, not a substitute for reading its accepted statements. The names `preBloch`, `k3ind_rationalFunctionField`, `bloch_rationalFunctionField`, specialization and rational-curve presentation equality therefore remain unverified supplier citations. A request for the missing read-only location was sent through the user-input channel; no location was supplied during this run.
- **BorelRegulators and MotivicEtaleKTheory:** neither is a readable roadmap on main or the indexed open heads, and neither has an accepted content package at the supplied location. Their accepted `borel-period-contract` and `universal-deligne-contract` remain explicit requirements. The source theorems do not themselves provide Lean carriers or a verified roadmap section. The push gate does not detect these missing supplier bodies.
- **StableHomotopyKTheory §3.37:** the actual section assumes finite-type rational homology. The all-unital-ring primitive comparison in §2.2 still needs the accepted unrestricted extension, since ℚ has infinitely many independent prime classes in degree one. The contract is retained and not misreported as supplied by the narrower theorem.
- The accepted all-configuration cycle-lifting, exact Borel calibration, raw/normalized regulator dictionary, elliptic explicit-five-term descent and common logarithmic regularization remain substantive formalization targets. None was replaced by a free predicate or an assumed conclusion. The general motivic, homotopy, higher-reciprocity and elliptic special-value assertions remain conjectural where specified.
- A passing elaboration and gate are not a certification of the admitted theorems, the unavailable supplier contracts, or every inherited PDF locator. The worker should not describe those unresolved items as verified.

## Adversarial statement table

The table records computed instances and their results, including negative controls. “Consistent” means that the listed instances agree with the statement, not that the target theorem has been proved. Exact arithmetic used rational determinants, prime-valuation vectors and exterior products; all 720 permutations of the nonconic triple-ratio witness were evaluated. The analytic numbers are numerical checks: the region quadrature and the Bloch–Wigner integral were computed independently; the small residuals of the real trilogarithm relation include the truncation error of the numerical ζ(3). Other entries are direct algebraic, degree, divisor, local-coordinate and sign calculations. Conjectural or unavailable comparisons are labelled as such.

| Statement | Instances tried | Computed values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: rational units | ℚ, torsion −1, prime 2 | u(−1)=0; ord₂u(2)=1, so u(2)≠0 | consistent | retained |
| Conventions: endpoint symbols | weights 2,3,4 at 0,1,∞ | [0]=[∞]=0; L₃(1)=ζ(3)≠0; 2[1]₄=0 | consistent | retained |
| Conventions: principal branch | Li₁(2), approaches to negative log axis | −Log(−1)=−πi on the cut; upper/lower logarithm limits differ by 2πi | consistent | retained lower value |
| Conventions: Bernoulli parity | n=2,3; z=1,−1 | L₂(1)=L₂(−1)=0; L₃(1)=ζ(3), L₃(−1)=−3ζ(3)/4 | consistent | retained |
| Conventions: shift | adjacent source degrees 2,3 | residue signs +1,−1; shifted differential is −d | consistent | retained |
| Conventions: alternation | 3 and 6 alternating inputs | Alt₃trace=−3; Alt₆M=720M, not M | consistent | retained |
| Conventions: cubical orientation | q=0,1,2 | J=(1,−1,1); at q=1 δJ₁=∂⁰−∂∞=J₀∂M | consistent | unverified external model remains explicit |
| Conventions: cross-ratio | (∞,0,1,i), (0,∞,1,i) | r=i,−i; D-values G,−G | consistent | retained |
| Conventions: row counts | ℚ, ℚ(i), ℚ(√2), n=2,3 | d=(0,1),(1,1),(0,2); e=(2,0),(2,3),(4,0) | consistent | retained |
| Conventions: discriminant denominator | ℚ, ℚ(i), ℚ(√2) | √∣disc∣=1,2,√8, each nonzero | consistent | retained |
| polylog definition | n=0,1,2; z=0,−1,1 | Li₀(−1)=−1/2; Li₁(−1)=−log2; Li₂(−1)=−π²/12; Li₂(1)=π²/6 | consistent | retained simple definition |
| singleValued definition | weights 0,1,2,3 | weight 0 empty sum=0; L₁(−1)=−log2; L₂(−1)=0; L₃(−1)=−3ζ(3)/4 | consistent | only n≥2 has asserted supplier comparison |
| blochWigner definition | 0,1,−1,i,−i | 0,0,0,G,−G; G≈0.915965594177219 | consistent | retained |
| Continuous-log supplier | g=1, g=0 on nonempty set | exp0=1 supplies witness; exp h=0 has no solution | consistent | pin read directly |
| Residue-unit supplier | ordt on t,2,t·(2/t) | 2 reduces to 2; t has ord1 and is excluded; unit parts multiply 1·2=2 | consistent | pin read directly |
| Local-log supplier | p=2, i=1 versus i=2 on ℚ₂ | strict bound 1<1 fails, 1<2 holds; log(−1)=0 | consistent | retained strict depth bound |
| 2.1 blochWignerDesc | zero and [i] over ℂ | linear value 0 and G; zero functional would give 0 at [i] | consistent | prose API expanded |
| 2.1 descent on symbols | [i], doubled symbol | D(i)=G, D(2[i])=2G | consistent | prose API expanded |
| 2.1 field-map naturality | ℚ(i) identity and conjugation | G and −G; repeated conjugation returns G | consistent | retained |
| 2.1 weightTwoRegulator | ℚ and ℚ(i) | ℝ⁰ unique zero map; one complex row G | consistent | retained |
| 2.1 exterior/antisymmetric distinction | w=(1+√−3)/2 | w∧w⁻¹=0; antisymmetric diagonal −w⊗w has order2; doubled boundary0 | consistent | retained |
| 2.2 blochWignerCocycle | (∞,0,1,i), repeated vertex | G and 0; first transposition gives −G | consistent | prose API expanded |
| 2.2 GL₂ invariance | z↦z+1 then z↦−1/z | cross-ratio i remains i under either matrix; both D-values G | consistent | retained |
| 2.2 deletion cocycle | five distinct projective points | five-term period sum0; repeated-point convention0 | consistent | retained |
| 2.2 measurable/continuous comparison | degenerating (∞,0,1,it), t→0 | D(it)→0, but cross-ratio of a coincident tuple is not defined geometrically | consistent | no continuity claim for all representatives |
| 2.2 primitive Hurewicz | zero ring, ℚ in degree1 | 0→0; prime2 maps to valuation vector (1,0,0,…) | consistent | unrestricted supplier obligation retained |
| 2.2 inverse Hurewicz | degree1 prime2 | inverse(forward u2)=u2, ord₂=1 | consistent | retained |
| 2.2 Hurewicz naturality | ℚ→ℚ(t), prime2 | constant unit remains2; its prime-valuation detector remains1 | consistent | retained |
| 2.2 rank filtration | j=1, m=0,1 | GL₀ contributes0; GL₁ contains the class2 with ord₂1 | consistent | retained |
| 2.2 primitive projection | primitive a and product ab, degree1 independent a,b | projection(a)=a; Δ(ab) has a⊗b−b⊗a; projection(ab)=0 | consistent | prose API expanded |
| 2.2 primitive Borel pairing | primitive a, decomposable ab | pairings <borel,a> retained; primitive cohomology pairs with ab as0 | consistent | retained |
| 2.3 alternating trace | E12,E21,E22 and swapped pair | −3,+3; half traces −3/2,+3/2 | consistent | retained |
| 2.3 invariant trace coordinate | Φ₃=−Alt/6 | 1/2,−1/2; claimed source value1 is not −3/2 | consistent | calibration obligation retained |
| 2.3 period conversion | weight2 one complex row | π²G/2=3ζℚ(i)(2); omitting π² gives 3/π² | consistent | retained |
| 2.4 hyperbolic metric | vertical heights1,2 and h→0 | length log2 and ∫dh/h=∞; flat metric would give length1 | consistent | prose API expanded |
| 2.4 Christoffel/curvature | at h=1 | Γ³₁₁=1, Γ¹₁₃=−1; sectional curvature−1 | consistent | retained |
| 2.4 volume density | scaling by a=2 | dilation scale4 in each real coordinate; Jacobian64, density factor1/64 | consistent | retained |
| 2.4 Möbius action | identity, translation, inversion at (0,1) | identity unchanged; translation shifts w; inversion J=1 gives (0,1) | consistent | retained |
| 2.4 ideal boundary | vertical (w,h), h→0 | boundary point w; inversion over axis has J=h²>0 for h>0 | consistent | retained |
| 2.4 idealRegion | z=i, w=(1+i)/4, h=1,1/10 | R²=1/2; h²+∣w−c∣²=9/8 and 27/200; inclusion yes,no | consistent | retained |
| 2.4 real idealRegion | z=0,1,2 | region=∅ in all three cases; no division by 2Im z | corrected | added explicit real-shape branch |
| 2.4 normalization | (∞,0,1,i), swap first two | shape i versus −i; unsigned volume G both, signed G versus−G | consistent | retained |
| 2.4 truncation compactness | z=i, n=1,2 | K₁⊆K₂; heights≥1 and≥1/2; excluded h=0 | consistent | retained |
| 2.4 truncation exhaustion | fixed (w,h)=(0,2) | belongs to K₂, and every larger K; n=0 has no geometric role | consistent | positive indices explicit |
| 2.4 boundary-null target | one vertical face and hemisphere | faces have real dimension2 in dimension3; volume0 | consistent | retained |
| 2.4 idealRegion_finiteVolume | infinity cusp of i, area1/2 | ∫H∞ (1/2)h⁻³dh=1/(4H²)<∞ | consistent | retained headline |
| 2.4 cusp tail | H=1,2 for area1/2 | 1/4 and1/16; doubling quarters tail | consistent | retained |
| 2.4 truncation convergence | increasing exhaustion and one omitted open ball | union gives full integral; omitted ball has strictly positive lost integral | consistent | retained exact union hypothesis |
| 2.4 signedIdealVolume | z=i,−i,2 | numerical G≈0.915965592277, −G,0 | consistent | real-shape guard explicit |
| 2.4 volume permutation | first transposition at shape i | G→−G; absolute values both G | consistent | retained |
| 2.4 lobachevsky definition | 0,π/2,π,π/4 | 0,0,0,G/2; using log∣sin∣ would give πlog2 over a period | consistent | retained |
| 2.4 Lobachevsky reflection | θ=π/4,3π/4 | Λ(π/4)=G/2, Λ(3π/4)=−G/2 | consistent | retained |
| 2.4 Lobachevsky duplication | θ=π/4 | left Λ(π/2)=0; right 2(G/2)+2(−G/2)=0 | consistent | retained |
| 2.4 Lobachevsky Fourier series | θ=π/4 | (1/2)(1−1/9+1/25−…)=G/2 | consistent | retained |
| 2.4 blochWigner_lobachevsky | z=i | D(i)≈0.915965594177; Λ(π/2)+2Λ(π/4)≈0.915965594165 | consistent numerically | retained headline |
| 2.4 idealTetrahedron_volume | z=i | independent region quadrature0.915965592277 versus D(i)0.915965594177 | consistent numerically | retained headline |
| 2.5 Fourier-bound duplicate | N=3,6 at i | S₃=8/9; S₆=209/225; tails bounded by1/3,1/6 | ownership duplicate | definition and theorem deleted from Lean |
| 2.5 blochWigner_kummer | i,(1+i)/2,0.3+0.8i,2 | left/right G/G, G/G,0.995026887744/0.995026887744,0/0 | consistent numerically | retained headline |
| 2.5 Kummer denominator domain | z=0,1 versus i | u/conj u undefined geometrically at0,1; at i args(−1,i,i), norms1 | consistent | retained exclusions |
| 3.1 trilogGroup | [0],[1],[-1] | periods0,ζ3,−3ζ3/4; [1] cannot be zero | consistent | prose API expanded |
| 3.1 trilogCyclic | b=x, a=b=c=1 | one block1+1+1+1−1−1−1−1=0 | consistent | retained simple definition |
| 3.1 coordinateRelation | (1,1,1) | raw 3[1]+4[−1]; analytic 3ζ3−3ζ3=0 | consistent | retained |
| 3.1 coordinateRelation at two | (2,2,2) | coefficients [3,3/4,2,1/2,−2,3/2,1/4,1,−8]=(3,3,3,3,3,−3,−3,−3,1) | consistent | retained |
| 3.1 coordinate cobracket | (1,1,1) | u(1)=u(−1)=0, so every tensor term0 | consistent | retained proof target |
| 3.1 specialization target | (1,1,1) nongeneric admissible | generic analytic relation tends to 3ζ3+4(−3ζ3/4)=0, not raw zero | consistent | retained explicit target |
| 3.1 inversion relation | x=2,1/2 | L₃(2)/ζ3=L₃(1/2)/ζ3≈0.875000000036 | consistent numerically | retained |
| 3.1 three-term relation | x=2 | 7ζ3/8−3ζ3/4+7ζ3/8=ζ3 | consistent | retained |
| 3.1 TrilogRelationFunction | zero function, identity on ℚ | zero passes all equations0=0; identity fails inversion2≠1/2 | consistent | retained |
| 3.1 singleValued_three_relations | triples(1,1,1),(2,2,2),(3,3,3) | residuals0,1.50e−10,1.50e−10 using truncated ζ3 | consistent numerically | retained headline |
| 3.1 quotient functoriality | identity and ℚ→ℚ(i) | symbol[1] sent to[1]; period ζ3 on both embeddings | consistent | retained |
| 3.2 polylogComplex | weights1,2,3 | one termU; δ₂[3]=u2∧u3; d²[3]₃=u2∧u3∧u3=0 | consistent | retained |
| 3.2 first cohomology | degrees1 and0 | no incoming degree0 term; boundaries into degree1 are0, so H¹=kerδ | consistent | retained |
| 3.2 unitVector | 0,1,2 and2·3 | 0,0,u2; valuation vectors u6=(1,1)=u2+u3 | consistent | retained |
| 3.2 FiveTermFunction | zero and nonzero constant | endpoints0,0 pass; constant1 has b0=b1=1≠0 | consistent | retained |
| 3.2 five-term nonexample | indicator of2, x=2,y=3 | five arguments2,3,3/2,3/4,1/2; alternating value1≠0 | consistent | retained |
| 3.2 IsCycle3 | zero,[1],[3] | zero tensor0; [1] usesu1=0; [3] detected by (u2∧u3)⊗u3≠0 | consistent | retained |
| 3.2 cycle predicate equivalence | [1] and[3] | quotient δ₃[1]=0, δ₃[3] has nonzero valuation detector1 | consistent both directions | retained universal quotient route |
| 3.2 weight-four predicate | [1],[2] | boundary0 versus L₃(2)ord₂2=7ζ3/8≠0 | consistent | retained in README |
| 3.2 independent prime example | prime2,3,5; ord₂,ord₃,ord₅ | 3×3 identity matrix; all three coefficient equations force0 | consistent; Lean proof builds | retained sole example |
| 3.3 resExterior | ordt on t∧2∧3 and2∧3∧5 | 2∧3 and0; same values with uniformizer2t | consistent | retained |
| 3.3 residue-unit decomposition | t and2/t | unit parts1 and2, product2; killing both nonunits would give wrong0 | consistent | retained |
| 3.3 integral tame comparison | t∧u andt∧t | exteriorū and0; tameū⁻¹ and−1; rational torsion sign0 | consistent | retained |
| 3.3 weight-three tensor residue | [3]₂⊗t, [t]₂⊗2 | [3]₂ and0; taking d then residue givesu2∧u3 | consistent | retained |
| 3.3 ramification naturality | t=s² | valuation2 on s; residue multiplied by e=2 versus base valuation1 | consistent | retained |
| 3.3 shift signs | degrees2,3 | components+res and−res; dtarget=−d makes cochain square commute | consistent | retained |
| 3.4 genericVectorConfig | rank1 tuples(1,2),(1,3), tuple(0,1) | first ratios2 and3 distinguish orbits; zero vector has minor0 | consistent | retained |
| 3.4 generic deletion | moment parameters1,2,3,5 | Vandermonde triples nonzero; deleting5 leaves nonzero minors | consistent | retained |
| 3.4 generic projection | quotient by v1 in rank3 moment tuple | projected 2×2 minors equal corresponding nonzero 3×3 minors | consistent | retained |
| 3.4 deletion square | delete indices0 and1 | coefficients +1 and−1 on same remaining tuple, sum0 | consistent | retained |
| 3.4 projection square | project independent vectors0 and1 | same double quotient with opposite signs+1,−1 | consistent | retained |
| 3.4 deletion-projection anticommutator | delete0/project1 in two orders | coefficients+1,−1; sum0 | consistent | retained |
| 3.4 Bigrassmannian quotient | m=3,4 | BC₃=0; BC₄=C₄(3); row2 image killed in quotient | consistent | retained |
| 3.4 stabilized comparison | add one unused basis vector | all determinant ratios from original subspace unchanged, e.g.6/5 remains6/5 | consistent | retained resolution target |
| 3.5 geometricTrilogGroup | coincident tuple, elementaryT(1) | coincident class0; T(1) periodζ3≠0 | consistent | retained |
| 3.5 triangleSymbol | z=2 and1 | four determinants(2,−2,2,−1),(1,−1,1,−1); ratios2,1 | consistent | moved Checks to defining section |
| 3.5 triangle endpoints | 0,1,∞ | 0,η,0; M₃η=[1]₃ with periodζ3 | consistent | retained |
| 3.5 trianglePrime | z=1 | −η−2·0+η=0 | consistent | retained |
| 3.5 geometric comparison inverse | T(2),η | M₃T(2)=[2], M₃η=[1]; inverse returns T(2),η | consistent | retained |
| 3.5 auxiliary reduction sign | a placed last versus first | moving across5 entries multiplies by−1; final coefficients−(−1)^i versus+(−1)^i | consistent | retained |
| 3.5 projected ratio | moment tuple1,2,3,5,7 | 6/5; swapping last two gives5/6 | consistent exact arithmetic | retained |
| 3.5 triple ratio | moment six-tuple and nonconic six-tuple | 10/9 and1; all20 nonconic minors nonzero | consistent exact arithmetic | retained |
| 3.5 exteriorConfigurationMap | four listed integer vectors | 18u5∧u67∧u197; alternative2Alt would give−12u5∧u67∧u197 | consistent exact arithmetic | retained |
| 3.5 middleConfigurationMap | moment five-tuple | δr₅=36u2∧u3∧u5; independently scaled first vector changes determinant units | consistent exact arithmetic | retained |
| 3.5 geometricConfigurationMap | T(2),T(1) | 18[2],18[1]; corresponding periods18·7ζ3/8,18ζ3 | consistent | retained |
| 3.5 lower scalar identity | Alt₄ versus f₀ | −3·Alt₄=18f₀, hence Alt₄=−6f₀ | consistent exact arithmetic | retained |
| 3.5 middle scalar identity | one pivot and remaining3 indices | 3!=6 contributions; 6/(1/3)=18 | consistent | retained |
| 3.5 deletion squares | moment boundary; six-tuple iterated coefficient | δr₅ coefficient36; δ₂⊗id(r₅∂) coefficient−60 | consistent exact arithmetic | retained |
| 3.5 unscaled raw triple check | all720 permutations | Alt₆[T] iterated coefficient300 versus required−60; (−1/5)·300=−60 | consistent necessary test | no quotient equality asserted |
| 3.5 projected lower squares | two common pivots swapped | unchanged summand with sign−1, paired sum0 | consistent | retained |
| 3.5 GL₃/volume-form invariance | simultaneous scalar2 | projected and triple ratios have equal numerator/denominator degree; ratios6/5,10/9 unchanged | consistent | retained |
| 3.6 Gale duality | rank2 tuple(1,0),(0,1),(1,2),(1,3) | dual rows(−1,−1),(−2,−3),(1,0),(0,1); original times dual transpose=0 matrix | consistent | retained |
| 3.6 double duality | matrix(I,B) | dual(−Bᵀ,I); kernel of that recovers columns of(I,B) with chosen signs | consistent | retained |
| 3.6 duality sign | T(1) | M₃T(1)= [1]≠0; dual maps to−[1], not+[1] | consistent | retained |
| 3.6 projected top square | seven-point dual deletion | alternating seven-term sum0, so r₆p=0 | consistent | retained proof obligation |
| 3.6 steinbergBoundaryImage | x=3,y=5 | boundaryu2∧u3∧u5 is a displayed Steinberg generator; its Milnor quotient0 | consistent | retained |
| 3.6 top cohomology Milnor quotient | t∧a∧b overℚ(a,b)(t) | iterated residue detects non-torsionb; Steinberg wedges map0 | consistent | retained |
| 3.6 topCohomologyTransfer | degree2 extension, nonzero base symbolξ | Nresξ=2ξ; factorwise norms would give8ξ | consistent | retained |
| 3.6 suslinTopComparison | Steinberg triple | both associated-graded Milnor image and quotient image0 | consistent example; comparison unproved | retained exact scalar target |
| 3.7 configurationHomologyMap | GL₂ source and stabilization GL₃→GL₄ | GL₂ image0; same GL₃ class keeps its normalized image18M₃ | consistent | retained |
| 3.7 rank filtration factorization | class in rank2; rank3 elementary class | first maps0; top elementary image18[2] before passing to a genuine homology class | consistent domain distinction | retained |
| 3.7 trilogarithmDescent | [1],[-1] | ζ3,−3ζ3/4; combination3[1]+4[−1] period0 | consistent | retained |
| 3.7 configurationBorelClass | endpoint normalization | 18η has period18ζ3, not0 | consistent normalization test | retained nonvanishing target |
| 3.7 rationalRegulatorCalibration_three | ℚ and general(r₁,r₂) | π² times π⁻²ζ3=ζ3; (−2r₁−5r₂)+2(r₁+r₂)=−3r₂ | consistent | retained |
| 3.8 zagier_three_exists | ℚ,ℚ(i) | Z₃([1])=ζ3 andπ³ζ3/2=16ζℚ(i)(3), nonzero | consistent | retained headline |
| 3.8 cycleLifting_three | zero cycle, endpoint period | zero homology class lifts0; [1] demands nonzero periodζ3 | consistent test; full lifting unproved | retained explicit all-configuration target |
| 3.8 regulatorImageContainment_three | zero, doubled endpoint | period0,2ζ3; both inℚ-spanζ3 | consistent | retained stronger period-image target |
| 3.8 zagier_three_everyFamily | zero family, doubled endpoint, repeated columns | q=0,2,0 respectively | consistent | retained headline |
| 4.1 higherBlochGroup | weights1,3,4 | U; [1]₃ periodζ3; [1]₄=0 rationally | consistent | prose API expanded |
| 4.1 projective specialization | 1/t at0 and constant2 | ∞→zero symbol; constant2→[2] at both0,1 | consistent | retained |
| 4.1 relation specialization | constant kernel family[1]₃ | sp₁−sp₀=[1]−[1]=0 | consistent | retained general residue-field obligation |
| 4.1 quotient differential | zero,one symbol | δ0=0; δ₃[1]=[1]₂⊗u1=0 | consistent | retained |
| 4.2 higher-symbol inversion | weight1 at2, weight3 at1, weight4 at1 | correct1+(−1)=0 at weight1; odd[1]−[1]=0; even2[1]=0 | consistent | retained n≥2 in higher sign |
| 4.2 higherPolylogComplex | weights1,2,3 | lengths1,2,3; repeated final unit makes d²[3]=0 | consistent | retained |
| 4.2 specialization chain maps | [3]₂⊗t at ordt | res[d tensor]=u2∧u3; d[res tensor]=u2∧u3 before shift | consistent | retained |
| 4.2 explicit-to-inductive weight2 | [3] | boundaries matchu2∧u3 after negative supplier conversion | consistent | unreadable presentation supplier recorded |
| 4.2 explicit-to-inductive weight3 | [1],coordinate relation111 | [1] maps[1]; 3[1]+4[−1] relation maps0 | consistent | retained surjection only |
| 4.2 motivic comparison conjecture | weight1 and top Milnor term | units agree in weight1; Steinberg generator vanishes in top quotient0 | compatible test, not proof | conjectural status retained |
| 4.3 cycleEvaluation | constant[1]₃ versus raw[t]₃ | first valueζ3; second varies, e.g. L₃(1/2)=7ζ3/8≠ζ3 | consistent | retained kernel hypothesis |
| 4.3 cycleConstancy | constant endpoint and normalized three-term relation | ζ3 constant; normalized relation0 at2 and1/2 | consistent | retained all-cycle obligation |
| 4.3 higherBlochPeriod | [0],[∞],[1]₃ | 0,0,ζ3; pole specialization agrees with0 | consistent | retained |
| 4.4 periodMatrix | ℚ, c=[1],2[1],0 | one-by-one entriesζ3,2ζ3,0 | consistent | generality stated explicitly |
| 4.4 normalizedPeriod | ℚ and Fin0 versus proper weight3 row | empty determinant1 givesπ³; proper one-row valueζ3 | consistent | prescribed row use explicit |
| 4.4 determinant natural subtraction | indexcard3 versus fielddegree1 | 1−3 inℕ=0; intended d≤N excludes this arithmetic misuse | consistent domain audit | README restricts arithmetic assertions |
| 4.4 rational existence proposition | ℚ weight3 [1] andzero | q=1 works for[1]; no nonzeroq works forzero | consistent | retained |
| 4.4 every-family proposition | zero, doubled column | q=0 and2; no inverse formulation forzero | consistent | retained |
| 4.4 regulator-compatible comparison | zero class and rational basis | 0 calibrates0 but gives determinant0; a rational basis gives nonzero regulator determinant | consistent | retained basis hypothesis |
| 4.4 calibration exponent | general N,d,n | d−nN+(n−1)d=−n(N−d); at n3,N2,d1 gives−3 | consistent exact algebra | retained |
| 4.4 rational column change | A=diag(2,3), singular diag(1,0) | determinants6 and0 multiply original determinant by6 and0 | consistent | retained |
| 4.4 row conjugation | weights2,3 at i | D(−i)=−G; L₃(−i)=L₃(i) | consistent | retained |
| 4.5 explicitRawCycleFour | [1],[2],[2]+[1/2] | boundaries0,7ζ3/8 under detector,0 by inversion and unit cancellation | consistent | prose API expanded |
| 4.5 universal kernel equivalence | [1],[2] | all tests give0 at[1]; descended L₃⊗ord₂ test nonzero at[2] | consistent both directions | retained |
| 4.5 inductive inclusion | zero andinverse pair | image boundary0 in both presentations | consistent | no reverse inclusion asserted |
| 4.6 obstruction quotient definition | C=D=E=ℚ, J=0, p=a=id | T=ℚ,H=0,ω(1)=1 mod0 | consistent | retained |
| 4.6 lift independence | C=ℚ²,p(x,y)=x,a(x,y)=y, q=b=0 | lifts(1,0),(1,1) differ by(0,1), H=ℚ; obstruction class0 both | consistent | retained |
| 4.6 obstruction zero iff cycle lift | previous square andid/id/zero square | first cycle1 lifts(1,0) witha0; second cycle1 hasa1 andω1≠0 | consistent both directions | retained |
| 4.6 image and kernel of cycle map | p projection, a second projection | ker a={(x,0)} maps isomorphically toℚ; ker p∩ker a=0 | consistent | retained |
| 4.6 injective target criterion | q=id, b=p=id, a=id | only cycle0; lift0 hasa0; droppingq-injectivity permits counterexampleω1=1 | consistent | retained |
| 4.6 weightThree_inductiveCycleLift | endpoint[1]₃ | lift[1] hasδ0 and periodζ3 in both presentations | consistent | retained |
| 4.7 zagierExistence_totallyRealEven | ℚ atn2,4; ℚ(√2) atn2 | Z₂=6ζ2,Z₄=90ζ4,Z₂(ℚ√2)=24ζℚ√2(2) | consistent | retained headline |
| 4.7 finite-polynomial residue | p=t−a, p=t²+1 | residue fieldsℚ,ℚ(i); constants have residues0 at both | consistent | retained nonrational summands |
| 4.7 finite support/constant quotient | constant symbol anduniformizer t−a | constant residues0; uniformizer has exactly one finite simple zero | consistent | retained |
| 4.7 homotopy conjecture | finite versusprojective indexing | t has finite valuation+1 at0; adding∞ adds−1, giving a new reciprocity relation | compatible test, not proof | conjectural status retained |
| 4.7 conditionalComplexTransfer | identity, degree2, towerdegrees2and3 | 1·ξ,2ξ,6ξ versus3·2ξ; factorwise triple norm would give8ξ in degree2 | consistent | retained coherence assumptions |
| 5.1 degree-current adapter | m=2,q=−1,0,2,3 | zero,dual top forms,dual functions,zero; no natural-subtraction junk | consistent | prose API expanded |
| 5.1 current differential | q=0 smoothfunctionx online | −[x](dφ)=∫φdx=[dx](φ); derivative Diracφ is−φ′(0) | consistent | retained |
| 5.1 test topology | translated bumpφn andempty manifold | LF sequence not convergent; compact-open seminorms eventually0; empty testspace0 | consistent | retained |
| 5.2 analyticCycleCurrent_resolution | nodal curve, doubled line, degree2 finite map | branchesT₁+T₂; double2T; degree2 pushforward2T≠T | consistent | retained degree-one hypothesis |
| 5.2 currentResolution_deRham | star-shapedchart degrees0,1 | closed degree0 constantsℝ retained; derivative dx=d(x), positive class0 | consistent | retained |
| 5.2 currentResolution_dolbeault | polydisc degrees0,1 | bar∂z=0 retains holomorphicz; bar∂bar z=dbar z makes that positive class0 | consistent | retained |
| 5.2 Poincaré–Lelong conversion | f=z², f=1, f=0 | 2δ0,0, excluded nonintegrablelog0 | consistent | imported supplier |
| 5.2 BFT normalized cycle | curvepoint andcodim0 curve | pointfactor1; wholecurvefactor(2πi)⁻¹ | consistent | retained |
| 5.2 BFT pairing sign | ordinarydegrees1,2 inreal dimension2 | Koszul factors−1,+1 | consistent | retained |
| 5.2 BFT differential | −log∣z∣ oncurve | topoperator2bar∂∂ andfactor(2πi)⁻¹ give−δ0 | consistent | retained |
| 5.2 Deligne degree convention | p=2,k=3,4 | ordinarydegrees2,4; uniform k−1 would wronglygive3 attop | consistent | retained |
| 5.2 supported regulator cone | empty andfull support | Cone(id)[−1] acyclic; Cone(C→0)[−1]=C | consistent | retained |
| 5.2 support naturality | Z₁⊆Z₂⊆X | forget(Z₁,Z₂) thenforget(Z₂,X) equalsforget(Z₁,X); onzero all maps0 | consistent | retained |
| 5.2 auxiliary double complex | bidegrees r=0,1 | cube signs+δ,−δ; mixed cross terms cancel+1−1=0 | consistent | retained |
| 5.2 simple comparison complex | applyd twice to(a₁,0,0) | last components dg₁a₁−g₁da₁=0 and−dρa₁+ρda₁=0 | consistent | retained |
| 5.2 cycle/base inclusions | (0,clZ,0),(0,0,α) | d sends these to(0,dclZ,0),(0,0,dα); closedcycles give0 | consistent | retained |
| 5.3 admissibleChowLocus | zero cycle, face-containedcomponent | zero admissible, containedcomponent violates proper dimension | consistent | prose API expanded |
| 5.3 degree-e family | finiteflat x²=t | length2 everyfiber; at0 fundamentalcycle2[0] | consistent | retained |
| 5.3 arbitrary-base specialization | t=s² thens=0 | [s]+[−s]→2[0], equal to directfiber | consistent | retained |
| 5.3 characteristic diagnostic | finitepointsum s=1 inℚ andchar2 | [1]+[−1] distinct overℚ; 2[1] inchar2 | consistent | no extension of geometric characteristic0 theorem |
| 5.3 tautologicalChowCycle | [H],2[H],degree0 | ChowdivisorsF,F²,unitform1; incidence[H],2[H],0 | consistent | retained multiplicities |
| 5.3 admissibleIncidenceCycle base change | collidingpoints family | geometricfiber2[0], not reduced[0] | consistent | retained |
| 5.3 face adapter | proper doublecomponent versuscontainedcomponent | properintersection2(Z·H); containedcase excluded; r0 properface empty0 | consistent | retained |
| 5.3 vertex adapter | degree2 projection versuscenter point | weightedpushforward2[image]; centerpoint outside domain | consistent | retained |
| 5.3 logarithmic Green form | p1,Z=[0], g=−log∣z∣ | offsupportcurvature0; ddᶜg+δ0=0; wrong+log gives2δ0 | consistent | p≥1 made explicit |
| 5.3 Green coefficient closedness | α=(z₁+bar z₁)i dz₂∧dbar z₂ | ∂bar∂α=0 but∂α=i dz₁∧dz₂∧dbar z₂≠0; bar∂α≠0 | consistent | retained separate closedness |
| 5.3 logarithmicCurrent_integrable | log r versus r⁻² ondisc | ∫₀ε r∣log r∣dr finite; ∫₀ε dr/r divergent | consistent | retained |
| 5.3 Green pullback | identity versusmapintosupport | identitypreservesg; value g(0)=+∞ excludesordinarypullback | consistent | retained transverse domain |
| 5.4 rForm definition | m=1,2,3 | r₀=log∣f∣; r₁=iη; r₂ coefficients1/6,−1/2 | consistent | retained |
| 5.4 rForm alternation | f=f in firsttwoentries | permutation sign−1 fixes input; 2r=0 overℝ, hence r=0 | consistent | retained |
| 5.4 rForm multiplicativity | f₁=2·3, allotherjetsfixed | log6=log2+log3; derivativesofconstants0 | consistent | retained |
| 5.4 rCurrent resolution/degree | m1,c1; doubledcycle | degree0+2=2; current2T notT | consistent | retained |
| 5.4 varietyExteriorResidue | ordz onz∧c andnodebranches | residuec; normalization givesbothbranchterms ratherthanone | consistent | retained |
| 5.4 Deligne dictionary | r₁(z,c)=−ilog∣c∣dargz | dη=−2πlog∣c∣δ0; normalizedtopd[−log∣z∣]=−δ0 | consistent | retained explicit sign target |
| 5.5 goncharovDeligneComplex | weight1 | degree1functions→degree2closed(1,1)currents; 2bar∂∂log∣z∣=2πiδ0 | consistent | retained |
| 5.5 raw comparison | weight1 localunit f=1 | log∣1∣=0 inbothmodels; divisor0 | consistent example; quasi-isomorphism unproved | retained |
| 5.5 simplexRForm | i=1, coordinate z/λ | arity1 giveslog∣z/λ∣; transpositiongivesnegative | consistent | retained |
| 5.5 rawChowRegulator | cube/simplexdegreei0,i1 | cycle(2πi)^n[Y]; positivei1 degree2n−2 current, not2n−1 | consistent | retained |
| 5.5 raw resolution/chain map | principaldivisor f=z | lastdifferentiallog∣z∣=2πiδ0 agreeswithcyclefactor2πi | consistent | retained dictionary obligation |
| 5.5 real descent | conjugatecyclepair | T+barT invariant; unpairedT neednot equalbarT | consistent | retained |
| 5.7 wangForm | m0,1,2 | 1,u,u(∂v−bar∂v)−v(∂u−bar∂u) | consistent | prose API expanded |
| 5.7 Wang differential | m2 | du•v−dv•u; repeatedu givesdu•u−du•u=0 | consistent | retained |
| 5.7 r/Wang identification | m1,m2 atnegativeloginputs | T₁=−r₀; T₂=+r₁ | consistent | retained |
| 5.7 Wm/Gm boundary | m1,m2 | cube−δ0+δ∞; m2 cube4faces, simplex3faces | consistent | retained |
| 5.7 degeneracy | coordinate1 versusconstant2 | log∣1∣=0 andalljets0, form0; log2≠0, notautomatic0 | consistent | retained |
| 5.8 cubicalRegulator | m0, pointunit a=2 atp1,m1 | δZ; δ-model−log2; suppliedmodel+log2 afterJ₁ | consistent | retained |
| 5.8 normalization comparison | degree0 anddegeneratecoordinate1 | bothinclusionsandJ₀ identity; degenerateimage0 inbothquotients | consistent | retained |
| 5.8 resolution independence | birationaldegree1 versusdegree2 | pushforwardT versus2T, soonlydegree1resolution preservesvalue | consistent | retained |
| 5.8 regulator degree | p1,m0,1,2 | degrees2,1,0 | consistent | retained |
| 5.9 integrationComparison | m0,W₀=1 | φ(α)=[α]; composingbaseinclusion returns[α] oncohomology | consistent | retained |
| 5.9 logarithmic Green/Wang identity | m0 critical; r1,r2 subcritical | d[g]=[ω]−δZ; signs+1,−1 respectively | consistent | retained |
| 5.9 comparison ψ | cycle,base,principalGreenpair | ψ(0,clZ,0)=PcZ; ψ(0,0,α)=φα; negativeGreentermcancelsδdiv | consistent | retained |
| 5.9 universal regulator comparison | unit2 onprovidedsource | PcJ(2)=+log2 versusuniversalunitlog+log2 | consistent normalization test | unverified universal supplier recorded |
| 5.10 mixedWangForm | axes(0,0),(n,0),(0,m) | 1,Wn,Gm; degrees2p,2p−n,2p−m | consistent | retained |
| 5.10 mixed boundary signs | n=0,1 atsimplexfacei0 | +1,−1; at(1,1) differentialδ−∂ squares0 byanticommutation | consistent | retained |
| 5.10 mixedRegulator | p2,n1,m1 | degree4−1−1=2, not3 | consistent | retained |
| 5.10 axis agreement | coordinatechangez₀↦−z₀ | log∣−f∣−log∣f∣=0, dlogratio0; normalizeformsunchanged | consistent | retained |
| 5.11 chowPolylogForm degree | (p,q)=(0,1),(1,2),(0,2) | degrees0,0,1; arities1,3,2 | consistent | retained |
| 5.11 Chow period factor | p1,q2 | i⁻¹(2πi)⁻¹∫r₂=−∫r₂/(2π)=P₂ | consistent | retained |
| 5.11 face period compatibility | p1→p0 | (2πi)⁻¹·2πi=1 | consistent | retained |
| 5.11 resolvedIncidenceRegulator | 2Y,nodalY,twopointcollision | 2T, Tbranch1+Tbranch2,2f(0) atregularscalarvalue | consistent | retained |
| 5.11 smooth base change | identitysubmersionversusstratuminclusion | identitycurrentT preserved; singularsupport pullback notdefined byordinarydistributionoperation | consistent | retained |
| 5.11 real analyticity domain | smooth transversecyclefamily versussingulartwo-pointcollision | gooddegree-onefamily givesanalyticlog∣f∣ off0; collisionrequirescurrentmodel withmultiplicity2 | consistent domain test | retained |
| 5.11 torus/hyperplane invariance | topdegreep=q−1; lowerp0,q2 | topordinarydegree0; lowerdegree1 canchangebyhyperplane, so blanketinvariancewouldoverclaim | consistent degree test | retained separate targets |
| 5.12 greenChowClass | p1,principalpairandpointonℙ¹ | principalcurvature0; pointcurvatureintegral1, so nonzerounderlyingdegree | consistent | p≥1 explicit |
| 5.12 Green class atpoint | Specℂ,p1 | cycles0; everyconstantg equals−log a for a=exp(−g), quotient0 | consistent | retained |
| 5.12 arakelovMotivicComplex | Cone(P)[−1] | degree0pairwithcycleandGreencomponents; unshiftedconemovesthepairby1 | consistent | weightn≥1 explicit |
| 5.12 higherArakelovChow | closedtopformω | modifiedDelignequotientkillsω beforecone; unmodifiedcone retainsit | consistent | retained |
| 5.12 Gersten Green graph | principalpairdivf,−log∣f∣ | graphcurvatureδdiv−δdiv=0 | consistent degree-zero test | nofullquasi-isomorphism claimed |
| 5.13 curvePolylogComplex | zeroresidue mapC→D | fiberC⊕D[−1], notC; adjacentboundarysummandD[−1] survives | consistent | retained |
| 5.13 unramified restriction | η(z,2) | dη=−2πlog2δ0≠0, so ramifiedclassnotclosed | consistent | retained |
| 5.13 finite pullback | z=s² | localdivisororder2; residueandδmassdouble | consistent | retained |
| 5.13 eta definition | f2,g=e^it atπ/2 | η=log2dt; swappedη=−log2dt | consistent | retained |
| 5.13 eta bilinearity | f=2·3,g=e^it | η=log6dt=(log2+log3)dt | consistent | retained |
| 5.13 eta closedness | punctureddisc f=z,g=2 | dargz closedoff0; derivative0 there versusmass−2πlog2δ0 globally | consistent | retained |
| 5.13 eta current/tame equation | f=z,g=2 att0 | tame=1/2; 2πlog(1/2)=−2πlog2, matchingcurrent | consistent | retained |
| 5.13 Steinberg current identity | z=i,v=1 | η(i,1−i)[1]=log√2=dD(i)[1] | consistent | analyticidentity supplied, currentextension retained |
| 5.13 integral Weil product | f=t,g=t−a att0,a,∞ | unsigned−a,a⁻¹,1 product−1; signed∞factor−1 givesproduct1 | consistent | retained |
| 5.13 curveEtaRegulator | unramifiedzerosymbolandprincipalSteinberg | zero→0; SteinbergcurrentexactdD givescohomology0 | consistent | retained |
| 5.13 Chern comparison sign | ch₂,₂ andc₂,₂ | ch=−c; cuprep iη, twoconventiontransports yielddisplayed+η | consistent sign bookkeeping | universal map unverified |
| 5.14 chowDilog definition | Steinbergtripleat a=i | P₂=D(i)=G; integralr₂=−2πG | consistent | retained |
| 5.14 alternating/multiplicative law | repeatedentryand2ξ | P₂(f∧f∧g)=0; P₂(2ξ)=2P₂ξ | consistent | retained |
| 5.14 constant-factor vanishing | c=2,propercurve | integratedvalue0 althoughlocalterm log2·dargf∧dargg canbenonzero | consistent | retained |
| 5.14 Steinberg evaluation | (1−t)∧t∧(t−a), a=i,3 | D(i)=G,D(3)=0; infinitycontribution0 | consistent | retained |
| 5.14 rho₂ current identity | integrateonpropercurve | 0=2πD(a)+∫r₂; solvinggivesP₂=D(a) | consistent | retained |
| 5.14 StrongReciprocityHomotopy | ℙ¹ triple t∧(t−1)∧(t−3) | Res=3∧(−2)=−u2∧u3≠0; zerohomotopywouldgive0 | consistent | retained pre-Bloch target |
| 5.14 first triangle | precedingtriple | δh=−u2∧u3=Res, so targetkernelwouldfail | consistent required value | retained |
| 5.14 second triangle | Steinbergtensor(1−t)∧t∧(t−i) | analyticperiodofh isG, agreeingwithspecializedsymbolat i | consistent normalization test | retained separate triangle target |
| 5.14 Suslin consequence | classRes=δh in cokerδ | [δh]=0 bydefinitionofcokernel | consistent | retained |
| 5.14 analytic reciprocity | constructedrationalcurvemap, a=i | D(h)=G=P₂; arbitraryzero mapgives0≠G | consistent | retained construction hypothesis |
| 5.15 rationalCurveReciprocity | (0,1,a,∞), a=i | r=i/(i−1)=(1−i)/2, D=−G; swappingfirsttwogives+G | consistent | retained |
| 5.15 auxiliary-point independence | allowednewauxiliarypoint | change isfive-termcycle, periodsum0; auxpointinsupportexcluded | consistent | retained |
| 5.15 integral ambiguity | 6-torsionc, rationalization | 6c=0; c⊗1=0 inrationalgroup | consistent | retained integral/rational distinction |
| 5.15 family expression | constantfamilyf=t,g=t−i | parameterderivative0, constantperiodG | consistent | retained local good locus |
| 5.15 algebraicCurveReciprocity | degree2coverandidentitycover | pushpull2ξ, thenrationaldivisionby2 returnsξ; identityreturnsξ | consistent | retained all-embedding comparison |
| 5.16 elliptic line formula | transpositionofL₁,L₂ | leftwedge−ξ; rightsignedsum−h(ξ) | consistent | retained |
| 5.16 line rescaling | l₁↦2l₁ | constantfactor2 wedgeiskilled; linepointsunchanged | consistent | retained |
| 5.16 chord divisor | y=0 andgeneralx,y | (x)+(0)−(x)−(0)=0; generalgroup-sumx+y−(x+y)−0=0 | consistent | retained |
| 5.16 ellipticFiveTermDescent | identitychordandassociativity | identitylinevalue0; twoassociativitydivisorsboth(x)+(y)+(z)−(x+y+z)−2(0) | consistent divisor test, not quotient proof | retained explicit quotient obligation |
| 5.16 tangent specialization | doubleintersection | 2[P] contributes2symbols, notone | consistent | retained |
| 5.16 characteristic-two cubic | Y²Z+YZ²=X³ | gradient(X²,Z²,Y²); commonzeroonly(0,0,0), excludedprojectively | consistent | retained everycharacteristic |
| 5.16 characteristic-three cubic | Y²Z=X³−XZ² | gradient(Z²,−YZ,Y²−XZ); Z=0,Y=0 forcesX=0 oncurve | consistent | retained everycharacteristic |
| 5.16 plane-curve integral | P₂=−∫r₂/(2π), ∫r₂=2πS | P₂=−S=hE; signmatchesexternalminus | consistent | retained |
| 5.16 line normalization domain | l₀=x,l₁=y,l₂=z | (y+z)/x notidentically1 ongeneralcubic | consistent negative control | retained separate hypothesis |
| 5.17 rho₂ five-term descent | five-termrelationanditsboundary | Dsum0, αsum0; bothparts0, notmerelyDpart | consistent | retained |
| 5.17 rho₂ diagonal | f=1/2,v1 | ρ₂=−4log²2/3≈−0.6406040186; −dL₃ samevalue | consistent | retained |
| 5.17 rho₂ constant second factor | g=2,f=1/2,v1 | α(1−f,f)=−4log2; ρ₂=4log²2/3≠0 | consistent | retained correctionterm |
| 5.17 curveWeightThreeRegulator | generator[f]₃ anddiagonalboundary | degree-two component−ρ₂ atδ[f]₃ equals+dL₃(f) | consistent | retained declared sign |
| 5.17 curveWeightThreeChern | zeroK₄classandramifiedclass | zero→0; nonzeroresidue remainsnonzeroaftercomparison, so cannotbeunramified | consistent restriction test | retained cohomology target only |
| 5.17 generalized reciprocity conjecture | weight2signedtame,weight3 a3 triple | product1; nonzero−u2∧u3 demandsnonzerohomotopy | compatible tests, not higher-weight proof | conjectural status retained |
| 5.18 ellipticTorusFourierAdapter | squarelatticefrequencies0,1 | integrals1 and∫₀¹exp(2πiy)dy=0 | consistent | prose API expanded |
| 5.18 ellipticCharacter | γ1,z0,i/4; γi,z1/4 | 1,i,−i, eachnorm1; oppositesignswapsi,−i | consistent | retained |
| 5.18 character periodicity | z=i/4 andz+i atγ1 | exponentsπi/2 and5πi/2; bothi | consistent | retained |
| 5.18 character derivative | γ1,z0 onhorizontalandverticaltangents | ∂χ=πdz; bar∂χ=−πdbarz; sum horizontal0, vertical2πi | consistent | retained |
| 5.18 area convention | orientedbasis1,i | dz∧dbarz=−2idx∧dy; A1 andμdxdy give−2iAμ | consistent | retained |
| 5.18 ellipticTrilogSummand | triad(1,i,−1−i), allpoints0 | (−1+2i)/2, norm√5/2; swappinglastfrequenciesnegates | consistent | retained |
| 5.18 zero-frequency domain | (0,1,−1) | denominator0; indexpredicate rejectsγ₁=0 | consistent | retained all three exclusions |
| 5.18 ellipticTrilogKernel_summable | dyadiclevelj=1,2,3 | (j+1)2⁻j =1,3/4,1/2; fullseries∑(j+1)2⁻j finite | consistent convergence majorant | retained headline |
| 5.18 kernel diagonal/swap | x=y=z andlasttwoequal | pairedcoefficients(−1+2i)/2 and(1−2i)/2 sum0; K(x,y,y)=0 | consistent | retained |
| 5.18 kernel simultaneous translation | γ₁+γ₂+γ₃=0 | multiplicativefactorχ₀(a)=1 | consistent | retained |
| 5.18 kernel scaling | λ2 andλi | coefficients1/32 and−i; A scales4 and1 | consistent | retained |
| 5.18 curve holomorphic pairing | −1fromDterm and−1/3correction | −1−1/3=−4/3 | consistent | retained holomorphic/antiholomorphic restriction |
| 5.18 ellipticLog Fourier coefficient | A1,γ1,oneunitdivisorcoefficient | −1/(2π); zero-frequencydenominator0 isexcluded | consistent normalization test | retained |
| 5.18 finite Fourier pairing | A1,nonzerotriad | three−1/(2π) coefficients, derivativeπ, area−2i yieldi/(4π²) beforeantisymmetrization | consistent | retained exactconstant |
| 5.18 rho₂ Fourier pairing | multiplypreviousfactorby−4/3 | i/(4π²)·(−4/3)=−i/(3π²) | consistent | retained |
| 5.18 common regularization | λ2 scalingofwholepairing | A³×64 timeskernel/32 yieldsfactor2, matchingdbarz×2 | consistent necessary check, not limiting proof | analytic domination target retained |
| 5.18 elliptic Beilinson conjecture | zero versusrank-spanningcyclefamily | zerofamilyperiod0; conjecturalnonzerodeterminantneedsnonzerorank/periodhypotheses | compatible test, not proof | conjectural status retained |
| 6.1 completed localization/log map | ℚ, imaginaryquadratic, p2torsion−1 | rank0,rank0; log(−1)=0 andtorsiondiesoverℚ₂ | consistent | imported supplier |
| 6.1 transpose matrix | quadraticrow(a,−a) | deletionminors−a,a; transposesuppliercolumn(a,−a)ᵀ | consistent | retained only adapter |
| 6.1 all embeddings | oneinertprimeoflocaldegree3,unitrank1 | threeembeddingcolumnsallowrank1; notonecolumnwithglobalembeddinglabel | consistent | retained |
| 6.1 basis change | unimodularmatrixdet−1 | allfullminorsnegated, nonvanishingunchanged | consistent | imported supplier |
| 6.1 scalar-regulator domain | ℚ andtotallyrealquadratic | ℚemptyminor1; quadratic(a,−a) hasrowsum0 andscalar±a | consistent | retained totallyreal/CM restriction |
| 6.1 exact7-adicexample | 10²,11⁶ modulo49 | 2,15=1+14; firstlogtermvaluation1, termn≥2 valuation≥2 | consistent exact arithmetic | retained |
| 6.1 logarithm kernel domain | unit−1 versusnonunitp | bothlog0; −1torsion, p nottorsion, so unitrestrictionnecessary | consistent | retained |
| 6.1 abelian consequence | ℚandℚ(i) | unitrank0,defect0,emptyminor1 | consistent | imported IntegralIwasawaTheory §4.4 |
| 6.2 supplied differential | z1/2,2,−1; v1 | 4log²2/3≈0.6406040186, −log²2/3≈−0.1601510046,0 | consistent | retained only regulator compatibility |
| 6.2 circle radial/angular | z=i,v=i andv=−1 | Re(v/z),Im(v/z) give radial0, angular−G | consistent | retained |
| 6.2 endpointderivative | z=1 andh→0 | L₃(1)=ζ3; ∣h∣log²∣h∣→0, derivative0 | consistent | imported supplier |
| 6.2 inversion tangent | z2,v1 maps tangent−1/4 athalf | (4log²2/3)(−1/4)=−log²2/3 | consistent | retained |
| 6.2 conjugation | (i,−1) and(−i,−1) | Dsignandangularsignbothflip; derivative−G both | consistent | retained |
| 5.4 ordinary differential identity | m1,f=z atz2; m2,f=z,g=z−1 oncurve | dlog∣z∣[1]=1/2=Re(dz/z)[1]; m2 holomorphicwedge0=dr₁ offdivisors | consistent | spelled out parity projections |

The table has 304 rows. There are no proof-search or implementation artifacts in the roadmap folder.


Pull request: #1424 (roadmap/polylogarithms at 4696a1a)
