## H01 (CBirkbeck) — applied

The unrestricted absolute/full-symbol unit comparison is replaced by the fractional ratio r_E^± in TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:123 and :1047, with the boundary correction retained in the total Kato defect at :508 and the elliptic comparison at :1086. The 11a1 Check at :1073 gives v_5(2/(5u))=−1 for a hypothetical unit u; SageSymbols line 394 confirms the exact normalized value 1/5, LMFDB11 line 482 gives c_φ=1, and the unit clause now requires the non-Eisenstein comparison with the existing period owner.

## H02 (CBirkbeck) — applied

The trivial tame branch now uses Ω_f^+ for every critical exponent, and the general η-branch uses the fixed sign η(−1), with the period-change and uniqueness interfaces updated in TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:285 and :300. For k=6,m=1 the parity product is (−1)(−1)=+1; this follows from ModularSymbolsPadicLFunctions §1.2 rather than treating the alternating display in SU line 27 as a transcription error.

## H03 (CBirkbeck) — applied

The full-function scalar assertion is replaced by K_(ω,γ,η)=v_ηu_(p,η)L_(f,η) after the explicit projection π_η, with independent v_η and the fractional Betti correction, in TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:504 and :510. The comparison consumed by §0.10 is explicitly π_1 (:539); the Check (A,B)→(A,2B) excludes a common coefficient scalar when both branches are nonzero (Kato line 5927 supplies the underlying scaling law).

## H04 (CBirkbeck) — applied

The good-differential definition now calls V'' the cohomological quotient whose (k−1)-twist is unramified, retaining the same H⁰-lattice, in TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:508. Kato line 6033 states this twist, and Kato line 6097 gives the good-differential lattice; the k=2,p=3 Check computes inertia 4⁻¹·4=1, whereas the old wording gives inertia 4 and zero invariants.

## H05 (CBirkbeck) — applied

The Kobayashi identifications and all arbitrary tame components now live over Q(μ_(p^∞)), with separate trivial-component descent to the untwisted groups over Q_∞, in TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:1548 and :1552. The §0.11 examples and §6.3 transfer (:1934) use the same towers; LLZ line 62 fixes the source’s full-tower notation, and at p=5 the averaging idempotent acts by 1 on the trivial character and 0 on the nontrivial quadratic character.

## H06 (CBirkbeck) — disputed

The numbered specifications exist as staged board suppliers: packages/KatoEulerSystems/README.md at 5fb6ef4 has §§2.2, 4.2–4.3, 5.1–5.4, 6.2–6.6, 7.2–7.9 (for example lines 734, 1231, 1415, 1711, 1887), and packages/AutomorphicCongruences/README.md at b047dd3 has §§1.11, 2.21, 3.4, 3.7–3.9, 4.3–4.6, 7.9–7.10 (lines 625, 1065, 1187, 1270, 1302, 1320, 1430, 1462, 1478, 2095, 2112); their absence from the roadmap-repository inventory does not establish absence of these owner packages. The supplied merge-order/ORDER.txt:248–250 puts both suppliers immediately before this consumer, so their releases remain merge prerequisites; their contracts and explicitly additional gaps remain owned there, with no substitute arithmetic construction added here.

## H07 (CBirkbeck) — applied

The height Check now names 11a1 and its equation y²+y=x³−x²−10x−20 instead of saying “the same model,” in TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:1282. Its coefficients give b₂=0²+4(−1)=−4 and the displayed correction changes by 1/3 if b₂ is omitted; SageSymbols line 392 independently identifies this equation.

Signature audit: all four declarations were elaborated together with `#check @name` and compared with §§0.8, 3.6 and 3.7. HasRankOneCoinvariants retains its ring, module and endomorphism binders; the unipotent theorem retains IsDomain, IsDiscreteValuationRing, square-zero and primitive-image hypotheses; the SL₂ theorem retains primality, p≥5, closedness and residual surjectivity; the Tate theorem retains primality, the unit parameter, norm bound and algebraicity hypothesis. No binders changed or disappeared, and Suggested.lean is unchanged: the repaired period, regulator and Selmer headlines still lack the arithmetic carriers named in its module docstring.

Citation and ownership audit: the main content checkout is 4aeb1cc1; the public roadmap index identifies its snapshot as bfaaff1 and reports only the two staged names above as unresolved. The cited supplier sections were located in main, the indexed open heads (including the supplied sibling checkouts), or the two indexed board heads; object searches through main, open roadmaps, board packages and the pinned libraries leave the absolute/full-symbol comparison with GrossZagierAndArithmeticHeights and the generic symbol lattice with ModularSymbolsPadicLFunctions. Projection, weighting, restriction/corestriction and Tate orthogonality use the existing completed-group-algebra, measure and cohomology suppliers; no later supplier or duplicate fully qualified Lean declaration was introduced.

The pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Mathlib/RepresentationTheory/Invariants.lean:73 defines invariants by ∀g, ρ(g)v=v, without continuity or finite dimension; Mathlib/RepresentationTheory/Continuous/Basic.lean:54 bundles a homomorphism into continuous linear maps, without group-variable continuity. TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/Specialization.lean:70 defines the actual evaluated Tate curve, with nonsingularity at :96 and its discriminant norm at :110; its bodies, and the native quotient/SL₂ APIs, support the unchanged acceptance statements rather than supplying their deep conclusions.

Source verification uses the legal cached extracts: SU line 1063 for the Betti lattice; Kato lines 5902, 5927, 6024, 6085 for interpolation, scaling, filtration and good differentials; Skinner line 978 and note 8 at line 1009 for the optimal X₁ comparison; Colmez lines 179 and 331 for the Néron distribution and rational parametrization; LLZ lines 62, 2096, 2255, 2313 for the tower, kernels and actual Coleman images; and SW line 728 for the sigma expansion. SageSymbols was fetched through the sources service solely to verify the review’s exact curve example, and its metadata is recorded in the permitted scratch sources.toml; no new work was added to the roadmap’s citations or its read-only source ledger. No missing-source request is outstanding; the settled uncertified and waived sources were not reopened.

The table covers every changed mathematical interface, its propagated uses, and the four acceptance declarations; computations are mathematical counterchecks, not proofs of the admitted headline theorems.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Differential/cohomological period convention | m=0,1; P=−2πiΩ | (−2πi)Ω=P; (−2πi)²Ω=(−2πi)P | Both denominator conventions agree | Retain the convention separately for each lattice |
| Absolute versus full-symbol periods | 11a1, p=5, c_φ=1; hypothetical P_f=uΩ_E, v_5(u)=0 | Absolute ratio has valuation 0; normalized full plus-symbol value is 2/(5u), valuation −1 | The claimed unrestricted unit comparison is false | Retain r_E=P_f/P_abs and the boundary index |
| Fractional correction direction | P_abs=Ω_E, r_E=1/5 | P_f=Ω_E/5; L_f=5L/Ω_E; (P_f/Ω_E)L_f=L/Ω_E | Rational rescaling has the stated direction | Keep the nonunit instead of cancelling it |
| Non-Eisenstein weight-two period comparison | 11a1 at p=7 versus p=5 | v_7(2/5)=0; v_5(2/5)=−1; residual 7-representation irreducible, residual 5-representation has a stable line | The boundary exclusion applies only to the first instance | State the exact irreducible-residual supplier clause |
| Optimal absolute period relation | c_φ=1, u=1; c_φ=5, u=1 | Ω_E/P_abs=1 and 5 respectively | Manin unitness controls the absolute ratio only | Use P_abs in the homology argument |
| Curve period and isogeny factors | r_E=1/5,c_φ=1,u=1; prime-to-7 period factor 5 | P_f/Ω_E=1/5; v_7(5)=0 while v_5(5)=1 | No general isogeny-class integral equality | Retain both the lattice and period factors |
| Trivial-branch interpolation sign | k=6,m=0,1,3; finite parity (−1)^m | 1·1=1; (−1)(−1)=1; (−1)(−1)=1 | All use the plus period | Replace alternating signs by a fixed plus sign |
| General tame-branch sign | η even or odd, m=0,1 | η(−1)(−1)^m(−1)^m=η(−1): +1,+1 or −1,−1 | The sign is fixed on a tame branch | State the same character-parity rule for L_(f,η) |
| Tame-weighted pushforward | μ=δ_1−δ_(−1), p=3; μ=δ_1 | Trivial branch: 1−1=0; odd branch: 1−(−1)=2; for δ_1 both are 1 | Distinguishes the two projections and a nonzero measure | Give the weighting by η explicitly |
| Period-change interface | P^+ fixed, P^−→2P^−; then P^+→2P^+ | Even-branch multiplier 1, odd-branch multiplier 1/2; second change gives even multiplier 1/2 | Independent period choices respect uniqueness | State the component-dependent unit law |
| Fixed-branch uniqueness compatibility | Above minus-period change at m=0 and m=1 | Both evaluations of L_f remain A and B, rather than A and B/2 | No conflict with finite-order uniqueness | Propagate the fixed sign through the comparison |
| Betti-to-symbol ratio c_f^± | (P_f,P_SU)=(5,1),(1,5),(1,1) | c_f=5,1/5,1; valuations at 5 are 1,−1,0 | Rational comparison does not imply a unit | Add c_f^± as an explicit fractional factor |
| Generator independence of the fractional ratio | P_f→2P_f, P_SU→3P_SU at p=5 | c_f→(2/3)c_f, with v_5(2/3)=0 | The principal fractional ideal is unchanged | Specify generator independence only up to units |
| Projection π_η:Λ_L(G∞)→Λ_L | Δ=C_2, δ²=1, η(δ)=±1 | π_η(δ²)=1=(±1)²; π_+(e_+)=1, π_+(e_-)=0 | Ring projection selects one tame component | Insert π_η after the fixed character dictionary |
| Kato/canonical baseline comparison | ε=1, c_f=5, L_(f,η)=2 | K=10=c_f L; replacing c_f by 1 would give 2 | The Betti correction cannot be omitted | Replace ±L by ε_ηc_f L_(f,η) |
| Good-differential lattice | k=2,p=3, κ(g)=4 on inertia | True quotient twist: 4⁻¹·4=1; falsely unramified quotient twist: 1·4=4; (4−1)x=3x=0 forces x=0 over L | The wrong quotient has no nonzero invariants | Say V''(k−1), rather than V'', is unramified |
| De Rham factor d_p | f=ω_B; f=ϖω_B; ω_B→2ω_B | d=1,ϖ,d/2; d changes by a unit under the last operation | Goodness fixes a lattice, not a chosen basis | Keep d separate from the symbol correction |
| Total component defect u_(p,η)=d_pc_f^sign | (d,c)=(1,ϖ),(ϖ⁻¹,ϖ),(1,1) | u=ϖ,1,1 respectively | Either factor alone can give the wrong unit test | Define the total defect as their product |
| Independent good-pair scales | a=1,b^+=1,b^−=2; nonzero values A=B=1 | New values (1,2); a common scalar would need v=1 and v=2 | A full-function coefficient scalar is impossible | Use independent v_η on projected branches |
| General scaling | a=2,b^+=3, with period P and value L/P | New period 2P/3; new value 3L/(2P)=(3/2)(L/P) | Direction is a⁻¹b | Preserve the sign-dependent scaling law |
| Good-pair homothety | a=b^+=b^−=ϖ | a⁻¹b=ϖ⁻¹ϖ=1 on both branches | Full function unchanged | Retain the homothety theorem |
| Independence from the common lattice scale | T_B→5T_B and γ_SU→5γ_SU | d→d/5; c_f→5c_f; dc_f→dc_f | Total defect is unchanged | Retain both factors in its definition |
| Good-pair comparison | c=5,d=7,w=2,w^+=3,w^−=4 at p=11 | ω scale=10/7; Betti scales=15,20; ratios 21/2,14 equal d·(3/2),d·(4/2) | c cancels; signed units remain different | State v_η=ε_ηw⁻¹w^sign |
| Projected KMC/ordinary length identity | Lengths H¹/Z=2,H²=3, middle=5 | Exactness gives length X=5−2+3=6; X−middle=1=H²−(H¹/Z) | Both equalities hold together exactly when the difference is 0 | Use K_(ω,γ,1) in the analytic term |
| Detection of a unit defect | R=O[[X]], L_f=X,u=ϖ, then u=1 | (ϖX)≠(X) at (ϖ), lengths 1 versus 0; for u=1 the ideals coincide | Cancellation needs L_f≠0 | Preserve the nonvanishing hypothesis and branch |
| Elliptic analytic rescaling | P_f/Ω_E=1/5,L_f=5A; ratio a unit at p=7 | (1/5)(5A)=A; v_7(1/5)=0 | Rational equality survives a nonunit ratio | Keep the exact ratio in the elliptic function |
| Elliptic defect interpretation | d=1,c_f=1/5; d=5,c_f=1/5 | u=1/5 and 1; the full-symbol/Néron ratio has the same respective classes | Optimality alone cannot supply unitness | Propagate the total defect into §3.2 and the hypothesis table |
| Full cyclotomic signed comparison | E=14a1,p=5; Δ=C_4 | [Q(μ_5):Q]=4; full signed dual has four tame summands, Γ-dual only the trivial one | The ambient actions differ | Use the full tower on both sides of §4.5 |
| Trivial tame descent | Δ=C_4, δ acts as 1 or −1 on a rank-one Z_5-module | e_1=(1+δ+δ²+δ³)/4 acts by 1 or 0; cor∘res=4, a unit | Only the trivial component descends untwisted | Add the separate descent theorem and local-condition compatibility |
| Nontrivial tame coefficient twist | Δ=C_2, δ acts as −1; η(δ)=−1 | On A⊗η⁻¹ the action is (−1)(−1)=1; without the twist it stays −1 and has zero invariants | Nontrivial components require twisted coefficients | Keep them over the full tower or twist before descent |
| Corrected signed image quotient | I=XR,z=X²; a=5 | I/Rz≅R/(X); 5I/R(5z)≅R/(X); ambient R/R(5X²) has an extra factor 5 | Fractional multiplication preserves actual image quotients | Keep the integral corrected comparison on the full tower |
| Trivial-component Coleman images | p=5; I_2=(Σδ,X) over Δ=C_4 | η=1 gives (4,X)=Λ; nontrivial η gives (0,X)=(X) | Both images are Λ only on the trivial component | Use X^(1,1),X^(2,1) in §6.3 |
| Height-model Check | 14a1: a_1=1; 11a1: a_1=0,a_2=−1 | b_2(11a1)=0²+4(−1)=−4; (−E_2)/12−(−4−E_2)/12=1/3 | The stated coefficients belong to 11a1 | Name its equation explicitly |
| HasRankOneCoinvariants | σ=1 on O², on O, on 0; O nonzero | Cokernels O²,O,0 respectively, ranks 2,1,0 | The predicate accepts exactly the free rank-one quotient | No Lean change |
| hasRankOneCoinvariants_of_unipotent | N=[[0,a],[0,0]]; a=1,ϖ,0 over Z_p and F_2[[t]] | N²=0 in all cases; cokernels O, O⊕O/(ϖ), O²; primitive-image condition holds only for a=1 | The theorem excludes torsion and identity cases; equal characteristic is allowed | No Lean change |
| sl2Zp_closedSubgroup_eq_top | p=5,H=SL₂(Z_5); kernel of reduction; p=3 quaternion example | Residual orders 120 and 1 respectively; at p=3 a proper finite closed subgroup has residual order 24=|SL₂(F_3)| | Surjectivity and p≥5 are necessary for this statement | No Lean change |
| tateParameter_transcendental_of_isAlgebraic_j | p=2,q=2,4; p=3,q=3; q=0,1 | Norms 1/2,1/4,1/3; Waldschmidt forces transcendental j for these algebraic q; q=0 is not a unit, q=1 has norm 1 | Algebraic q cannot satisfy the algebraic-j hypothesis; excluded endpoints do not enter | No Lean change |

Commit: 3d4e19f8, changing only TauCetiRoadmap/ModularIwasawaMainConjectures/README.md; no push.

Build command: `lake build TauCetiRoadmap.ModularIwasawaMainConjectures.Suggested`.
Exit 0, with the three expected `sorry` warnings at Suggested.lean:47, :59 and :69:

```text
Build completed successfully (8983 jobs).
```

Dependency output, with no UPWARD or CYCLE line:

```text
depcheck: 48 roadmaps, 554 edges, 0 problem(s)
```

Final gate exited 0:

```text
gate ModularIwasawaMainConjectures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
