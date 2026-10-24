# Human-review response: HeegnerPointEulerSystems

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/HeegnerPointEulerSystems/README.md:1829` now distinguishes full local torsion h_E, ordinary-quotient invariants b_E and saturation index s_E,α: h_Es_E,α=b_E, the logarithm identity is IC=p^tbs, strict control retains h_E², and the index square at line 1874 has b₀⁴ instead of the former full-torsion fourth power. The curve y²=x³+8x+2 gives (h,b,s)=(1,5,5), hence 625 rather than 1; this corrects the identification printed at bcgs line 575 and bcgs line 711 using the separate local groups in cs line 835.

## H02 (CBirkbeck) — applied

`TauCetiRoadmap/HeegnerPointEulerSystems/README.md:1831` specifies both positive and saturated local lattices, their coefficient-induced comparison and connecting map, and line 1855 defines the control cokernel using the saturated lattice. The same defect in §8.16 was repaired at line 1587: raw product invariance becomes I_•C_•/s_•=I₀C₀/s₀, with rank one and nonzero localization explicitly assumed before transporting indices; `TauCetiRoadmap/HeegnerPointEulerSystems/Suggested.lean:25` records the missing local carriers.

## H03 (CBirkbeck) — disputed

The Gross–Zagier owner specification exists in `packages/GrossZagierAndArithmeticHeights/README.md` at board head b5527a0: §§0a.2–0a.4 specify cyclic CM pairs and canonical descent, §3.2 the Hodge class, and §§9.14, 9.20, 9.22 the root, logarithm and normalization comparisons. It is absent from content main and the indexed content pull requests, and its individual-point targets still do not discharge the additional integral-family logarithm contract; that outstanding contract is made lattice-specific at `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:127`.

## H04 (CBirkbeck) — disputed

The modular main-conjecture specification exists in `packages/ModularIwasawaMainConjectures/README.md` at board head e1ec38a, including §§0.5–0.10 and §1.3's integral ordinary theorem over its coefficient DVR. Its existence does not settle content delivery or this roadmap's stronger integral GL₂-type rank-zero/control contract, which remains unresolved; Kato's elliptic-only trivial-character comparison cannot silently supply the GL₂-type comparison.

## H05 (CBirkbeck) — disputed

The Kato specification exists in `packages/KatoEulerSystems/README.md` at board head 725fd74: §§6.6, 7.4 and 7.7 explicitly specify the elliptic lattice/period, ordinary divisibility and trivial-character control. In particular §6.6 retains the local torsion-adjusted index rather than identifying it with the reduced-curve cardinality; the specification still requires delivery to the content repository.

## H06 (CBirkbeck) — disputed

The regulator specification exists in `packages/PadicHodgeRegulators/README.md` at board head 5eff35d, with §§1.3, 1.9–1.10 and §§8.17–8.22 specifying the logarithms, integral regulator lattices and ordinary Coleman maps cited here. These are genuine owner sections, though they are absent from the indexed content inventory and do not themselves supply the additional Heegner-family reciprocity comparison.

## H07 (CBirkbeck) — disputed

The automorphic-congruence specification exists in `packages/AutomorphicCongruences/README.md` at board head 52297e2: L5a.1–L5a.3 give the two-variable equivalence, quartic restriction and factorization, and L5w.1, L5w.3, L5w.10 give the minimal-theorem, period and Hilbert-family targets. Its L5w.3 still requests the exact toric nonvanishing input from another owner, so neither content delivery nor the stronger primitive toric μ contract is claimed resolved.

## H08 (CBirkbeck) — answered

ArithmeticGaloisRepresentations §§6.4–6.4a at bef111d specify image predicates, finite-index invariance and Frattini detection, not Serre's arithmetic adelic open-image theorem. The required theorem with the base-change index remains unresolved at its owner; adding its general development here would exceed the permitted scope and duplicate that owner's direction.

## H09 (CBirkbeck) — answered

ArithmeticGaloisRepresentations at bef111d supplies no prime-uniform arithmetic scalar-image bound for the coefficient representations in §7.3; EulerSystemsAndKolyvaginSystems §4.13 at 46a6dd2 explicitly keeps those image assertions as hypotheses. This separate supplier gap remains unresolved, including its quantifier uniform in p; no image predicate or commutant comparison was substituted for it.

## H10 (CBirkbeck) — answered

SerreWeightAndLevelOptimisation §6.9 at c9bed25 supplies a q-new witness, while HilbertModularVarietiesAndShimuraCurves R18.4.24 and DefiniteIndefiniteComparison at 893083d compare characteristic-zero realizations rather than the common residual quaternionic lattices needed by Zhang. The residual coefficient-field, prescribed-type and multiplicity-one contract remains unresolved at those owners; §§4.10 and 6.7 retain it explicitly.

## H11 (CBirkbeck) — answered

EulerSystemsAndKolyvaginSystems §4.13 at the newer indexed head 46a6dd2 still explicitly supplies an annihilator bound and excludes the uniform-in-K square-index length theorem. The cardinality contract remains unresolved: (ℤ/5)³ has exponent 5 and order 125, exceeding the index-square value 25 when the index is 5 and the error constant is 1.

## H12 (CBirkbeck) — answered

GeometryOfNumbersAndQuadraticArithmetic §§4.2.4–4.2.6 at 465728d concern real Lie groups and real-time averages, so they do not specify the L/ℚ_p orbit measures, dilated compact averages or U-commensurability criterion required here. The nonarchimedean supplier extension remains unresolved; importing its real theorem or inserting a route-specific local replacement would not repair it.

## H13 (CBirkbeck) — answered

EulerSystemsAndKolyvaginSystems §§5.11–5.13 at 46a6dd2 retain p>4 for rigidity and exact length, and explicitly exclude p=3 from that rigidity theorem, consistently with the p>3 hypothesis at bcgs line 905. The characteristic-three rigidity contract remains unresolved; the p≥3 deep-prime statement at bcgs line 832 does not discharge it, and the independent Eisenstein branch has acquired no such hypothesis.

## H14 (CBirkbeck) — answered

The surjective characteristic-three integral comparison remains unresolved: bck line 28 imposes p>3, while cgls line 1500 and cgls line 1503 explicitly work after inverting p, and SelmerIwasawaCohomology §4.12 gives general comparison sequences rather than this arithmetic endpoint. The ideals (3) and (1) have lengths 1 and 0 at the height-one prime (3), but become equal after inverting 3; neither that rational statement nor SelmerIwasawaCohomologyPartII's unitary diagonal-cycle setting supplies the missing integral assertion.

## H15 (CBirkbeck) — answered

EulerSystemsCyclotomicMainConjecture at 804fe8a still specifies circular/cyclotomic units rather than the finite-character elliptic-unit/Katz input, and the nearby board design `packages/ModularIwasawaMainConjecturesPartII/design/README.md` CZ.3 explicitly retains unresolved Coleman/Katz and one-variable comparisons. The independent character, μ and lattice contract for §8b.10 therefore remains unresolved; the augmentation bound and the Heegner equality were not used to prove their own missing character input.

## H16 (CBirkbeck) — applied

`TauCetiRoadmap/HeegnerPointEulerSystems/README.md:924` and §§6.2–6.4 now cite the corrected argument at matar-nekovar line 1514 and matar-nekovar line 1531, with C4 cohomology vanishing and C5 absolute irreducibility verified from the subgroup containing SL₂ and its scalar −I. The generality p dividing D_K or N is retained, and the Sah argument reuses the pinned inner-compatible-pair theorem recorded at line 87 rather than rebuilding its cochain homotopy.

## H17 (CBirkbeck) — applied differently

`TauCetiRoadmap/HeegnerPointEulerSystems/README.md:19` now identifies SelmerIwasawaCohomology §4.28's actual family-parity interface, including common arithmetic realization, local diagram and (A1)–(A2) for each twist, and distinguishes it from the listed anticyclotomic endpoints. The neighbour's assignment of an analytic/Selmer parity equality to HE.8 remains a stale contract outside the permitted edits; no parity endpoint or proof has been invented here.

# Verification record

H08–H15 are verified outstanding findings: “answered” records their status, not a completed repair. The five absence disputes concern actual board specifications, not a claim that they have reached content main or acquired all stronger contracts; the integral family logarithm, GL₂-type rank-zero comparison, primitive toric input, content delivery and the neighbouring parity assignment still require owner-side resolution.

Ownership was checked against content main fe54001, the indexed heads of 338 content roadmap pull requests, the provided sibling checkouts and the board package heads named above. The integral evaluation of the actual Heegner family's local errors remains owned here, with generic local-condition and regulator theory imported from its existing owners; the inner-conjugation homotopy is native, and no generic replacement carrier or Lean declaration was added. No supplier was moved and no later roadmap was added as an input.

The new source was read legally as arXiv:1808.09544v2; its service metadata is saved under the single key `matar-nekovar` in `source-additions.toml`. The worker must incorporate that entry into `packages/HeegnerPointEulerSystems/sources.toml`, which is outside this job's permitted edits; no required source is unread or newly requested.

The table covers each added or changed mathematical assertion, local definition and normalization; numerical rows test the identities and counterexamples, while the stated proof routes and source exact sequences supply the general arguments.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §5.7 quadratic restriction of full image | p=3,7; full group and determinant-square subgroup | Indices 1 or 2; determinant-square subgroup orders 24 and 1008, containing SL₂ of orders 24 and 336; both contain −I | Compatible with ramified quadratic restriction | Require the image over K only to contain SL₂ |
| §5.7 absolute irreducibility | Upper/lower unipotents; diagonal subgroup | Fixed lines are span(1,0), span(0,1); intersection dimension 0; diagonal subgroup preserves two lines | Unipotents exclude a stable line over the algebraic closure | Record C5 separately from C4 |
| §5.7 C4 / inner action | p=3,5,7; p=2 negative control | −2 mod p is 1,3,5 with inverses 1,2,3; at 2 it is 0; H¹,H² are annihilated by an invertible scalar only for odd p | Sah vanishing applies with the standing odd-prime hypothesis | Cite the native inner-action theorem and corrected source |
| §§6.2–6.4 clean descent | Residual trace nonzero; zero negative control | Opposite dimension 0, same dimension 1, total dimension 1; zero bottom spans dimension 0 and fails y_K∉pE(K) | No new prime exclusion is needed | Correct proof citation throughout the chain |
| §8.16 positive-lattice transport | Identity isogeny | IC/s=5·5/5=5 on both sides | Equality | Retain saturation in each product |
| §8.16 unequal saturation indices | (I,C,s)=(5,1,1),(25,1,5) | Correct ratios 5=5; raw products 5≠25 | Old product invariance fails | Divide by the corresponding saturation index |
| §8.16 prime-to-p lattice comparison | Multiplication by 2 and by 5 at p=5 | Cokernel orders on the rank-two Tate lattice 1 and 25 | Only multiplication by 2 is an isomorphism here | Keep finite lattice defects |
| §8.35 full versus quotient invariants | E:y²=x³+8x+2, p=5 | #Ẽ=5, a₅=1; full local p-torsion order 1; b=5≠h=1 | Counterexample confirmed | Separate h and b |
| §8.35 formal-torsion obstruction | P=(1,6) modulo 25 | 2P=(7,1), 3P=(17,24), 4P=(11,14)≠(1,19)=−P | [5]P≠O; [5]E₁⊂E₂ makes this independent of the lift | Include the computed negative control |
| §8.35 unit-root normalization | X²−X+5 modulo 25 | Unit root 21, other root 5; v₅(1−21)=1, v₅(1−5)=0; v₅((1−α)(1−β))=1 | Quotient invariant order is 5 | Do not equate the unit-root factor with full torsion |
| §8.35 nonanomalous control | E:y²=x³+x at p=5 | Four points, a₅=2; (h,b,s)=(1,1,1); all correction lengths 0 | No spurious factor | Include a second actual curve |
| §8.35 positive and saturated lattices | j multiplication by 5; locκ=5 in its source | Target bottom 25; [L_sat:locκ]=25=5·[L_plus:locκ] | Rational equality does not identify integral lattices | Specify j and s |
| §8.35 torsion before saturation | (h,b,s)=(1,5,5),(5,5,1),(1,1,1) | h·s=5,5,1 equals b=5,5,1; quotient lengths before/after removing torsion are (1,1),(1,0),(0,0) | The torsion quotient changes the index | Retain full H¹ torsion and the connecting image |
| §8.35 specialization and logarithm | Lengths (t,h,b,s)=(2,0,1,1) | Positive bottom index 5³=5²·5; saturated index 5⁴=5³·5 | Both factors are necessary | Correct the H² specialization factor and saturation factor |
| §8.35 global/local index multiplication | Lengths (I,C,t,b,s)=(3,1,2,1,1) | I·C=5⁴=p^tbs=5⁴ | Equality | Use C in the saturated target |
| §8.36 full-torsion strict control | h=1,b=s=5,t=2,C=5,#Sha=25,Tam=1 | 5^(2t)=625=25·25·1; replacing h² by b² gives 15625 | Full H⁰ term must remain | Correct the lattice without globally replacing h by b |
| §8.36 every prime over N | Sha=5²,C=5,h=5; rational bad factors 5,25 both split | Exponent 2+2+2(1+2)+2=12; counting each rational prime once gives 9 | Product must run over K-primes | Retain the original control terms |
| §8.36 trivial factors and cokernel square | All factors 1; then C changes 1→5 | Cardinality 1 has length 0; square changes by 25, not 5 | Nonzero finite factors and multiplicities are correct | Preserve the square and add an anomalous test |
| §8.37 cancellation under the integral conjecture | Lengths (t,I,C,h,b,s,Sha,Tam)=(2,3,1,0,1,1,2,0) | Log 4=4; control 4=4; index square 6=2+4 | The local factor is b⁴ | Replace the full-torsion fourth power |
| §8.37 agreement when full torsion surjects | (h,b,s)=(5,5,1) | (hbs)²=625=b⁴; v₅=4 | This special case cannot justify h=b generally | Add the contrasting equality case |
| §§8.19,8.40,8.44 consistency | Split p=5, a₅=1 | Φ₀=(6−1)²=25=L_p; L_p²=625=b⁴ | Matches the corrected §8.37 | Retain the existing determinant normalization |
| §§8.32,8.41,8.43 divisibility profile | M₀=3,M∞=1,v₅(b)=1 | Twisted indices 5,3; 2(5−3)=4=2(3−1); square formula 2·5=4+2·1+4·1 | Local contribution cancels in refined divisibility | Record the consistency Check |
| Integral versus rational assertions | (3),(1) in ℤ₃⟦T⟧ | Height-one (3) lengths 1,0; after 1/3 both ideals equal (1) | Rational comparison loses the needed length | Retain the two independent characteristic-three gaps |
| Exponent versus cardinality | (ℤ/5)³; index 5 | Exponent 5, cardinality 125, square index 25 | Exponent bound does not imply square-index bound | Leave the stronger owner contract explicit |
| Parity interface | Family ranks 1,3 and 1,2 | 1≡3 mod 2; 1≢2 mod 2; no analytic order enters either computation | The cited interface concerns Selmer ranks at two points | Clarify scope without inventing an analytic parity theorem |

For the anomalous curve's compatibility with the stronger global setting, direct counting gives #E(𝔽₃)=1 and a₃=3, so the Frobenius discriminant is 2 modulo 5, a nonsquare. The discriminant is −34496=−2⁶·7²·11, with valuation one at 11; inertia therefore gives a transvection, and irreducibility together with that transvection yields SL₂(𝔽₅), then GL₂(𝔽₅) by the cyclotomic determinant. The discriminant −271 is 1 modulo 8 and has square residues 4,2,4 at 5,7,11, respectively, verifying the requested splitting restrictions; the mod-25 obstruction also gives E(K)[5]=0 at a split 5-adic place. Full residual image excludes a rational 5-isogeny, so a primitive isogeny to the optimal curve has degree prime to 5 and preserves the discrepancy.

Both configured library revisions were verified: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. `TauCeti/RepresentationTheory/Homological/ContCohomology/InnerConjugation.lean:297` requires a locally compact group, smooth discrete coefficients and the actual inner compatible pair; the finite residual image satisfies these assumptions. `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71` defines an intersection of localization kernels for supplied coefficients, without an elliptic Kummer or Heegner comparison, and the native Tate-module and Mordell–Weil theorems do not provide that comparison.

The signature audit found zero declarations in `TauCetiRoadmap/HeegnerPointEulerSystems/Suggested.lean`: consequently the set of `#check @name` obligations is empty, with no omitted binders or elaborated types to compare and no signature changes. The target build elaborated the single-import module; its docstring now explicitly includes the missing positive/saturated local lattices, and no stand-in theorem was added. The cross-roadmap resolver still reports the four content-inventory absence leads; the board specifications above explain why those leads do not establish absence of an owner specification, and pinned declarations were checked directly because that resolver did not locate the configured Lake packages.

Build command: `lake build TauCetiRoadmap.HeegnerPointEulerSystems.Suggested`.

Exact build outcome:

```text
✔ [8976/8976] Built TauCetiRoadmap.HeegnerPointEulerSystems.Suggested (2.3s)
Build completed successfully (8976 jobs).
```

Dependency-direction output:

```text
depcheck: 33 roadmaps, 305 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The first gate run reported only the two uncommitted authorized files; the final gate result after committing is recorded below.

Commit: `5a9bf062739e115916054319765c6f8f9be831ab` (not pushed).

Final gate summary (exit 0):

```text
gate HeegnerPointEulerSystems: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
