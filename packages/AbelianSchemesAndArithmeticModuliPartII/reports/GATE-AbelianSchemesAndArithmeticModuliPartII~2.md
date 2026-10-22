# Human review response

Commit: `e2d97c3a` (reviewed head `55aa646`). The two independent points in review finding 5 are H05 and H06; review findings 6–8 are H07–H09.

## H01 (CBirkbeck) — applied differently

The invariant-only existence route → prescribed-slope CM types, polarized realization, power effectivity and Weil-restriction descent in `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:2508`, consumed by F3.2 and F3.11 (TateHonda line 152, TateHonda line 172, TateHonda line 221, TateHonda line 253, TateHonda line 291).
The suggested ComplexMultiplicationAndExplicitReciprocity §2.1 supplier is later in the merge order (139 versus 101), so its CM-type existence substep moves down to F3.1b using the parent's A5.1–A5.3; the later polarized classification remains there, while ShimuraVarieties §§5.5–5.8 and parent A6.32–A6.33 supply the other generic constructions.

## H02 (CBirkbeck) — applied

B2.4's independent algebraization of all integral Hodge homomorphisms → consumption of ShimuraVarieties §5.2 `TauCeti.Shimura.weight_one_algebraization`, with its exact smooth finite-type complex-base contract at `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:269`.
B2.4 now constructs the invariant Hodge subvariation and its constant-abelian-variety/trace adapter, identifying the inclusion on homology and the generic fibre up to isogeny (`TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1239`; Deligne line 1377, Deligne line 1698).

## H03 (CBirkbeck) — applied differently

The overlapping smooth constant-rank construction → LieGroupoidsPoisson G0.1's early normal-form, tangent-kernel and level-fibre contract; B2.10 owns precisely the finite C^k and real-analytic extension, its comparison after forgetting regularity, and the Betti real/complex chart adapter (`TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1367`).
The stronger result is not attributed to the smooth supplier: its proof route retains the original regularity through pinned `ContDiffAt.toOpenPartialHomeomorph` and `ContDiffAt.to_localInverse` and an invertible derivative minor; rank-jump, rank-zero and real-dimension Checks distinguish the hypotheses.

## H04 (CBirkbeck) — applied

B2.11's metric convexity and generic good-cover construction → SmoothBundlesConnections B6.0, with DifferentialGeometry 12.1 metric existence and ComplexManifolds Milestone 1 realification explicitly consumed (`TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1406`).
The retained surface adapter gives holomorphic-chart subordination, relative compactness and bounded simply connected intersection images, then uses ConformalMapping L3 for disc charts; B2.24 consumes this adapter rather than reconstructing the generic cover.

## H05 (CBirkbeck) — applied

Ambiguous rational-monodromy semisimplicity → separate representation semisimplicity and semisimplicity of the connected algebraic-monodromy group in B2.4, retaining smooth proper geometric origin and citing Deligne Corollary 4.2.9(a), printed p.48 (Deligne line 1610).
B2.17 and B2.24 now consume that group theorem (`TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1541`, `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1667`); the cyclic matrix with characteristic polynomial X²−3X+1 is the explicit torus counterexample to the weaker prerequisite.

## H06 (CBirkbeck) — applied

B2.8's single Theorem 3 reference → Theorem 1, p.250, for the general characteristic-zero alternative and Theorem 3, p.251, for the dense semisimple-group assertion (`TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1346`).
The bibliography records both locators under the existing Tits key, retaining its settled `uncertified` status without claiming to have read the paywalled text.

## H07 (CBirkbeck) — applied

The supplier's purported arbitrary-module comparison → an explicit P0.5 construction from DerivedModuleAlgebra §0.DP.2's Roby representability; its free-module equivalence remains that supplier's export (`TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:175`, `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:484`).
The tensor-valued polynomial law is constructed under every scalar extension and then factored through permutation invariants, without asserting that invariants commute with arbitrary base change or that the comparison is invertible for arbitrary modules (Roby line 1526, Roby line 2226).

## H08 (CBirkbeck) — applied

B2.24's reference to B3's mixed Kuga input → B2.6's general semirational block-counting theorem (`TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/README.md:1667`).
B3.1 retains the later mixed-Kuga application, so the general counting input no longer points from B2 to B3.

## H09 (CBirkbeck) — answered

The no-other-author-dependency claim is false: ComplexComparisonPartII's exact contracts consume SmoothBundlesConnections B1.5, CharacteristicClasses C1.2 and TopologicalSheafCohomology TS3.1–TS3.3/TS3.7, while FiniteFlatGroupsAndIntegralPadicHodgeTheory names PurityOfBranchLocus §§2.1–2.2.
For the worker's PR-description correction, replace that claim with “The named supplier sections and their transitive prerequisites are dependencies, including the early SmoothBundlesConnections and LieGroupoidsPoisson contracts; these section dependencies do not import the suppliers' later applications”; PR text was outside the permitted edit set.

**Ownership and citation verification.**

Main was `c786ee0`; Mathlib was `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The supplied open-folder heads were ComputationalNumberTheory `8444931`, ConformalMappingPartII `552db86`, EffectiveClassNumbers `323dd36`, GanGrossPrasadUnitaryGroups `d603998`, SelmerIwasawaCohomologyPartII `8b21886`, QSeriesPartitionsAndMockModularForms `3f9c890`, K3SurfacesAndSymplecticBoundedness `bf90a62`, CohomologyComparisonsPartII `ad62fb0`, ColemanIntegrationPartII `821d050`, QWittVectors `fee71b6`, ErdosProgressionPowers `e3c95fb` and ArithmeticDynamics `afd0ce3`. Object searches covered those twelve folders, the open-roadmap/main index and the board's packages; no additional owner of the added finite-field effectivity constructions or the finite/analytic constant-rank extension was found. The ownership move in H01 concerns CM-type existence, not the later lattice-orbit classification.

The cross-roadmap resolver reports no unresolved roadmap citations. The nine supplied name leads are supplier targets, not pinned-library claims: parent A3.9/A4.3, GeometryOfNumbersAndQuadraticArithmetic §2.7, SchemeAndStackFoundations §§1.18/4.15 on main, AlgebraicModuliForArithmeticGeometry §5.2, and JacobianChallengePartII §§2.6/7.2 contain the cited names. New supplier contracts were read at their indexed heads, except existing main roadmaps, whose main versions govern. The direct contracts and the transitive examples in H09 are section-level dependencies, not an assertion that whole-roadmap applications must precede this roadmap.

Pinned native facts were checked directly: `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` stores the group scheme, properness and geometric integrality, and `Basic.lean:118` uses topological Krull dimension. `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:55` defines isogenies by finite and surjective underlying scheme maps; it imposes no separability condition. `Mathlib/Analysis/Calculus/InverseFunctionTheorem/ContDiff.lean:31` and `:66` retain the same nonzero order for the local inverse, and `Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean:138` supplies the integral norm-one root-of-unity criterion. These existing facts are consumed, not new targets.

**Elaborated signatures.**

All seven `#check @name` requests were collected in one scratch file and elaborated together through the named build, then compared with F2.2, F6.0, F6.2, F6.4 and F6.5. The resultant theorem retains the domain/DVR, irreducible uniformizer, density, monicity and nonzero-resultant hypotheses; all three geometric carriers retain `[Field k]`; the polynomial bound retains q≥2 and g≥1; the asymptotic retains `[Field k] [Finite k]`; and the isomorphism count retains `[Fact p.Prime]`. No binder changed or disappeared, so `TauCetiRoadmap/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean` is unchanged. The scratch checks were removed from the acceptance file after elaboration.

**Adversarial mathematics record.**

Rows cover the changed mathematical statements and their conventions/API laws, plus all seven acceptance declarations; negative controls are labelled explicitly. Computations test the statements, not their unproved general conclusions.

| Statement | Instances tried | Computed values | Result | Change |
| --- | --- | --- | --- | --- |
| P0.5 arbitrary-module comparison | M=0, n=0,1; R=F₂, M=R, n=2 | unit: 1→1; positive degree of 0: 0→0; γ₁(e)²: 0γ₂(e)→0; γ₂(e)→e⊗e with coefficient 1 | Pass | Construct map here via tensor-valued polynomial law |
| P0.5 naturality | R=ℤ, M=ℤ/2, f=2; degree n=1,2 | Γⁿ(f)(γ_n(1))=0, 0; tensor f^⊗n likewise 0,0; R=0: both units 0 | Pass | No free-module hypothesis on map |
| P0.5 shuffle multiplication and free equivalence | rank 2, degrees (1,1); rank 1, degrees (1,2) | γ₁(x)γ₁(y)→x⊗y+y⊗x, coefficients (1,1); γ₁(e)γ₂(e)→3e⊗e⊗e on both sides | Pass | Invertibility remains free-module export |
| B2.4 fixed part and finite cover | constant elliptic family; monodromy −I; double cover | invariants of I: rank 2; ker(−I−I)=ker(−2I): rank 0; (−I)²=I: rank 2 | Pass | Retain cover-specific invariant Hodge subvariation |
| B2.4 abelian trace adapter | constant E and zero family; maps [2] and (1/2)I | dim T=1 and 0; H₁([2])=2I; denominator of (1/2)I is 2, hence quasi-Hom only | Pass | Import algebraization; construct only fixed-part adapter |
| B2.4 representation and connected-group semisimplicity | cyclic group generated by A=((2,1),(1,1)); trivial geometric family | A²=((5, 3), (3, 2)), tr A=3, det A=1; eigenvalues (3±√5)/2; closure dimension 1, derived-group dimension 0; geometric constant-family G⁰ dimension 0 | Pass | Add geometric connected-group theorem and torus negative control |
| B2.8 / B2.17 Tits inputs | cyclic torus; trivial group; noncommuting unipotents | cyclic commutator=I; G=1 dimension 0 excluded; UV=((5, 2), (2, 1)), VU=((1, 2), (2, 5)) | Pass | Distinguish Theorems 1 and 3; consume group semisimplicity |
| B2.10 finite C^k / analytic normal form | projection ℝ²→ℝ²; constant ℝ²→ℝ; identity ℝ²→ℝ² | r=1,0,2; m−r=1,2,0; projection tangent kernel span(0,1), constant kernel ℝ², identity kernel 0 | Pass | Smooth theorem imported; stronger extension and comparison assigned here |
| B2.10 constant-neighbourhood hypothesis | f(x)=x² at x=0,1 | df=2x: ranks 0 and 1; no constant-rank neighbourhood at 0; its fibre {0} has dimension 0, not 1 | Pass | Add rank-jump negative control |
| B2.10 real/complex chart adapter | z=x+iy; f(z)=Re z | dim_ℝ ℂ=2; derivative matrix [1,0] rank 1; ker dimension 1 | Pass | No holomorphicity assumption on Betti map |
| B2.11 good-cover contraction | Euclidean discs centred at 0 and 1 of radius 1; q=1/2; z=1/2+i/2; t=0,1/2,1 | H=q, 1/2+i/4, z; squared distances to both centres are 1/4,5/16,1/2, all <1; empty intersection has 0 points | Pass | Import convex cover and contraction; retain surface adapter |
| B2.11 bounded disc consequence | nonempty good intersection; annulus 1<∣z∣<2; compact surface | intersection π₁=0 versus annulus π₁=ℤ; bounded nonempty open image ≠ℂ; finite cover can have 1,2,… members while each open disc is noncompact | Pass | Use ConformalMapping L3; contractibility required |
| B2.24 semirational prerequisite | Z={0}×[0,1]; γ(t)=(0,t) | π₁γ(0)=π₁γ(1)=0, height 1; π₂γ endpoints 0 and 1; B2.6 precedes B3.1 | Pass | Remove B2→B3 reference |
| F3.1a slope/type definition | π=2+i,q=5; π=√2,q=2; π=±2,q=4 | ([L_w:ℚ_p],λ,n_w)=(1,1,1),(1,0,0); (4,1/2,2); (2,1/2,1); each n_w/[L_w:ℚ_p]=λ | Pass | Include real and ramified p=2 cases |
| F3.1a conjugate pairing and integrality | split (λ,1−λ)=(1,0); self-conjugate slope 1/2 with degrees 2 and 1 | 1+0=1; 1+1=2; degree 1 would require n=1/2∉ℤ; ord_v(q)>0 since q=p^a, a≥1 | Pass | Require integral counts and pair embeddings at self-conjugate places |
| F3.1b Riemann form 1j | L=ℚ(i), I=ℤ[i], Φ={id} | (E(i,1),E(1,i))=(2, -2); determinant=4; E(ix,x) at x=1 is 2, at x=0 is 0 | Pass | Choose Tr(ξ x̄y), matching parent E(Jx,x)>0 |
| F3.1b Riemann form (-0-1j) | L=ℚ(i), I=ℤ[i], Φ={id} | (E(i,1),E(1,i))=(-2, 2); determinant=4; E(ix,x) at x=1 is -2, at x=0 is 0 | Negative control | Choose Tr(ξ x̄y), matching parent E(Jx,x)>0 |
| F3.1b Riemann form 2j | L=ℚ(i), I=ℤ[i], Φ={id} | (E(i,1),E(1,i))=(4, -4); determinant=16; E(ix,x) at x=1 is 4, at x=0 is 0 | Pass | Choose Tr(ξ x̄y), matching parent E(Jx,x)>0 |
| F3.1b CM action and Rosati | x=1,y=i,α=i | E(i,i)=0=E(1,−i·i); type dimension 1; action i²=−1; scalar ℚ alone has degree 1<2dim A | Pass | Full O_L action retained; no simplicity or principal hypothesis |
| F3.1c root-of-unity correction | q=q₀=4,π=2,π₀=−2,a=b=1 | ζ=-1, ζ²=1; π₀²=4=π²=4; q₀²=16=q² | Pass | Kill the unit root, not only its ideal |
| F3.1c unequal residue exponents | q=2,a=1; q₀=4,b=2; π=√2,π₀=2 | ζ=2/(√2)²=1; N=2; π₀=π²=2; residue cardinality 4=2² | Pass | Use base extension at and N=bt |
| F3.1c arithmetic Frobenius slopes | π=2+i,q=5 at its prime and its conjugate prime | ord(π)/ord(5)=(1,0); inverse gives (−1,0), excluded; q=1 would give denominator 0 but is outside q≥2 | Pass | Retain all p, normalized valuations and nonzero denominators |
| F3.1d induced Frobenius polynomial | N=2,q=2,P_B(T)=T²−T+4; T=0,1,2 | det(TI−shift) and P_B(T²): [(0, 4, 4), (1, 4, 4), (2, 16, 16)]; P_B(T)² coefficients ascending=[16, -8, 9, -2, 1], cubic coefficient −2 | Pass | Derive composition T↦T^N from induced Tate module |
| F3.1d effectivity and boundary cases | N=1; π=√2,B/F₄ with P_B=(T−2)²; B=0 | P_B(T¹)=P_B(T); (T²−2)² at √2 is 0, constant term 4=2²; P_0=1 has 0 roots | Pass | Extract a simple factor; zero variety cannot witness effectivity |
| F3.2 / F3.11 Honda–Tate multiplicity | q=4,π=±2; q=2,π=√2 | [F:ℚ]=1,2; Brauer index e=2 in both cases; 2dim A=[F:ℚ]e=2,4, hence dimensions 1,2 | Pass | Existence precedes determination of the index |
| resultantRecognition (F2.2) | O=ℤ₃,φ=id; P=Q=1; P=T,Q=T−1,ψ=T−3 | Res(1,ψ)=1, valuation 0=0; Res(T,T−3)=−3, valuation 1; Res(T−1,T−3)=−2, valuation 0; hypotheses separate P≠Q | Pass | No Lean change; nonzero-resultant exclusions and DVR binders retained |
| AbelianVarietiesOfDimension (F6.0) | zero variety; elliptic curve | dim 0=(0:WithBot ℕ∞); dim E=1, so E excluded from dimension-0 subtype | Pass | Native dimension subtype unchanged |
| AbelianIsogenyClasses (F6.0) | zero variety; [p] on elliptic curve in characteristic p | zero object contributes 1 class; [p] has degree p² and is finite surjective, including inseparable case | Pass | Quot relation uses native finite-surjective isogenies |
| AbelianIsomorphismClasses (F6.0) | identity on E; [2] on E | id degree 1, [2] degree 4; isogeny existence alone does not witness an isomorphism | Pass | Native k-isomorphism quotient unchanged |
| weilPolynomialCount (F6.2), q=2 | g=1, all integer traces | [-2, -1, 0, 1, 2]: count 5 ≤ 5√2=7.071068; q=2,g=2 repeated-root (T²+2)² coefficients (1,0,4,0,4) | Pass | Polynomial set and inequality unchanged |
| weilPolynomialCount (F6.2), q=3 | g=1, all integer traces | [-3, -2, -1, 0, 1, 2, 3]: count 7 ≤ 5√3=8.660254; q=2,g=2 repeated-root (T²+2)² coefficients (1,0,4,0,4) | Pass | Polynomial set and inequality unchanged |
| isogenyClassAsymptotic (F6.5) | g=0; fixed field F₂ | log 1/0=0 by total division; target limit log(2)/4=0.17328679513998632; [Finite k] implies q≥2 | Pass | Explicit finiteness, field and finite-field binders retained |
| isomorphismClassCount (F6.4) | g=0; p=2; p=1 | log B(2,0)=log 1=0; p=2 accepted by prime instance; p=1 excluded since 1 is not prime | Pass | Fixed-prime O(g²) and explicit finiteness unchanged |

**Source records.**

TateHonda §§3–4 was read from the legal Numdam copy; MilneJV's existing citation was checked in the author's June 12, 2021 version (MilneJV line 7, MilneJV line 1713). Tits remains settled as uncertified. No missing-text request is outstanding. The complete source records, additions and corrected Deligne/Tits locators are prepared in a scratch copy of `sources.toml`; the package manifest was outside this job's two-file edit allowance and was not modified.

| Key | Authors; title; year | Locator / cited for | Legal URL and fetch metadata |
| --- | --- | --- | --- |
| TateHonda | John Tate; Classes d’isogénie des variétés abéliennes sur un corps fini (d’après T. Honda); 1971 | §3 Lemmas 1–3; §4 Lemmas 4–6, printed pp.100–105 / F3.1a–F3.1d; F3.2 | https://numdam.org/item/SB_1968-1969__11__95_0.pdf; fetched 2026-10-22T19:03:50Z; sha256 a23d9cd18c2ccc155285428ca02f284bc546711c9eb9fe43555dd020fdd328f3; open-repository; certified |
| MilneJV | James S. Milne; Jacobian Varieties; 2021 | Theorem 12.1, p.38; §13, pp.40–44 / B4 fine curve moduli and Jacobian level rigidity | https://www.jmilne.org/math/xnotes/JVs.pdf; fetched 2026-10-22T19:03:51Z; sha256 36c3f09c7462dbbd4ae1f8b81a02bd9ff84f03c5a346351d7d5d78fc3f173486; open-repository; certified |

**Validation.**

`lake build TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII.Suggested` — exit 0:

```text
Build completed successfully (8985 jobs).
```

There were exactly the four expected warnings for admitted headline theorems, at Suggested.lean lines 59, 90, 102 and 112. The signature-check elaboration also exited 0 with the same four admitted theorems. The final worktree is clean; only the permitted README changed in commit `e2d97c3a`; nothing was pushed.

Dependency-direction output — exit 0, no UPWARD or CYCLE line:

```text
depcheck: 13 roadmaps, 101 edges, 0 problem(s)
```

Final gate — exit 0:

```text
gate AbelianSchemesAndArithmeticModuliPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
