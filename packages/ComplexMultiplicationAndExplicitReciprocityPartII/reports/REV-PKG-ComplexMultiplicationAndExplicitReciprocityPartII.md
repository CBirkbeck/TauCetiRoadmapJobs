<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1113#issuecomment-6382655672 -->
Review (claude) of 408c5d5

Verdict: needs changes

1. **F01** (P1) 21 declared gaps have supplier `none`

   - **Location.** `packages/ComplexMultiplicationAndExplicitReciprocityPartII/design/plan.json`, top-level `gaps`, records `G-Colmez` … `G-ErratumEdition` (the first 21 entries). They have only `id, title, detail, neededBy, resolution`, with no `slug`, `supplier`, `section` or `needs`. `grep "gap:G-" README.md` finds nothing.
   - **Claim.** The brief lists all 21 as declared gaps with supplier `none`. The intake would announce them as unowned prerequisites.
   - **Witness.** Every one of them already has an owner, either a target in this README or a named supplier gap. So the records are stale design-stage proof gates, not real gaps:

   | Record | Owner already in the package |
   | --- | --- |
   | G-Colmez | §0.2 (the component-period adapter is part of that target) |
   | G-AbsoluteHodge | AutomorphicBundles §§B1.2–B1.3 with §2.4 here |
   | G-Metric | §3.6 |
   | G-IntegralReflex | §3.7 ("the integral filtered comparison is part of this target") |
   | G-OrthogonalAdapter | §4.1 |
   | G-GSpin | §4.2 |
   | G-Armitage | gap:narrow-cm-norm-different (ClassFieldTheory Layer 13) |
   | G-Borcherds | §4.5 |
   | G-Classical | §4.6 |
   | G-CMHodge | ArakelovGeometryAndAbelianHeights §4.8 with §5.2 here |
   | G-CMKisin | FiniteFlatGroupsAndIntegralPadicHodgeTheory Layer R07.4 with §6.2 here |
   | G-RamifiedComponent | gap:ramified-component-determinants with §6.4 here |
   | G-QuaternionOrders | gap:embedded-quaternion-orders |
   | G-IntegralKS | gap:ramified-quaternionic-bridge with §7.3 here |
   | G-YZKernels | gap:unprojected-colmez-kernels with §8.1 here |
   | G-Adjunction | GrossZagierAndArithmeticHeights §7.78 (see R02) |
   | G-HeckeUniform | AnalyticNumberTheoryPartI §2.31f (endpoint bounds `|H(1)|+|H(1)|⁻¹+|H′(1)|≤C max(1,Q)^a` for every base field of bounded degree) and §2.45 |
   | G-TorusIndex | §12.3 |
   | G-TorusOrbit | gap:quantitative-cm-torus-orbit, plus PELModuli §§M6.1, M6.10 |
   | G-PeriodReduction | gap:quantitative-siegel-hermitian-reduction with §13.3 here |
   | G-ErratumEdition | no prerequisite: this is an edition-collation note. The README already records the edition under References |

   - **Repair.** Retire the 21 records from `gaps` (owned here or by the named slug above). Where a supplier owns the work, give the record that supplier and section instead. The package stage may only add gaps to `plan.json`, so this change needs the plan's maintainer. No README text changes. Test: after the change, every entry in `gaps` has a named supplier, and the same slug appears in a README `What … must provide (gap:…)` sentence. The 11 remaining slugs already satisfy this (lines 60–140).

2. **F02** (P2) §8.2 restates GrossZagierAndArithmeticHeights §7.78, and its gap asks for what that roadmap states

   - **Location.** README line 905 (§8.2): "For the same datum and the same i₀, i₀(P,P)/e=−h_L(P_U). Prove arithmetic adjunction on the actual integral curve model…". Line 140: "What GrossZagierAndArithmeticHeights must provide (gap:ramified-colmez-adjunction): Export the modified arithmetic projection and adjunction formulas…". Also line 845 (§7.2), which describes the E×-fixed CM point and its E^ab orbit again.
   - **Claim.** The Yuan–Zhang adjunction identity (Y Theorem 9.3) is planned here as a new target. The supplier is asked to "export" it.
   - **Witness.** `packages/GrossZagierAndArithmeticHeights/README.md` at head b5527a0, line 4085 (§7.78, "Arithmetic adjunction for the CM point") states "For compact §7.2 data, i0(P,P)/[OE*:OF*]=−h_LU(P)". It does so under (Q) and (Q′) (line 80), and (Q′) is exactly the datum of §7.1 here. Its §§2.14 (line 939), 7.33 (line 3343) and 7.67 (line 3882) give the residue-normalized line with elliptic index e, the archimedean constant and the finite lattice identity. Its §0a.4 (line 205) constructs `quaternionCMPoint` and its Artin action.
   - **Repair.**
     1. Delete §8.2 as a local target. Add one Scope sentence: "The arithmetic adjunction identity i₀(P,P)/e=−h_L(P_U) is stated by GrossZagierAndArithmeticHeights §7.78."
     2. In §8.3's *Needs:* (line 919), replace "§8.2 arithmetic adjunction for the cm point" by "GrossZagierAndArithmeticHeights §7.78".
     3. Remove the gap:ramified-colmez-adjunction sentence (line 140) and its tags at lines 901, 909 and 927. Cite "GrossZagierAndArithmeticHeights §§2.14, 7.28, 7.78" instead.
     4. In §7.2, cite GrossZagierAndArithmeticHeights §0a.4 (`quaternionCMPoint`) for the CM point and its Galois action.
     5. The étaleness gap on Y p. 633 is a gap in the supplier's proof. It is recorded under Source issues below, not re-planned here.

     Tested on the instance: §8.1 (i₀/e=ℓ(0)+½log(d_E/F/d_𝔹)) combined with GZ §7.78 still gives h_L=−ℓ(0)+½log(d_𝔹/d_E/F), so §8.3 and §9.1 are unchanged. Note, not a separate finding: before keeping gap:unprojected-colmez-kernels, compare it with GZ §7.65 (line 3858, full local decomposition of the height series in the Colmez setting) and §7.77 (line 4071, the analytic–arithmetic difference is a finite pseudo-theta sum). Narrow the gap to whatever those two sections lack.

3. **F03** (P2) gap:polarized-cm-bounded-descent asks PELModuli for what PELModuli already states

   - **Location.** README line 100: "A polarized maximal-CM g-fold with coarse field F_A admits a model with all CM endomorphisms and full 3-torsion over degree at most 2·3^(4g²) above F_A, and dimension-bounded rigid level makes the torus orbit inject…". Tags at lines 1005, 1025, 1033, 1069, 1089 and 1107.
   - **Claim.** The bounded descent and the level-forgetting bound are presented as missing from PELModuli. The second clause is a separate statement, which makes the gap compound.
   - **Witness.** `TauCetiRoadmap/PELModuli/README.md` at open head e6a4fe8, §M6.8 `boundedFieldOfDefinition` states this exactly: a polarized model over F′=F_m(ζ₃), every geometric endomorphism descends to it, and [F′:F]≤2·3^{4g²}. Here F_m is the field of moduli of the pair with a marked A[3]-basis. §M6.10 `rigidifyingExtension` gives [K′:K]≤[H:H′], and §M6.1 gives finite étale level-forgetting. Torus-orbit injectivity is already inside gap:quantitative-cm-torus-orbit ("after a dimension-bounded rigid level change", line 94).
   - **Repair.** Delete the gap at line 100. Replace "PELModuli §§M2.1–M2.3, M6.2 (gap:polarized-cm-bounded-descent)" in those Needs lines by "PELModuli §§M6.1, M6.8, M6.10". If §11.1 needs the marked A[3]-basis to be rational over F′, keep only a one-clause gap: "state in §M6.8 that the model over F′ carries its marked A[3]-basis". Tested: for g=1, §M6.8 gives 2·3⁴=162, the value of the §11.1 Check.

4. **F04** (P2) gap:class-norm-index asks for what IntegralIwasawaTheory §3.4 states

   - **Location.** README line 110: "For every finite number-field extension L/K, prove [Cl(K):Nm_L/K Cl(L)]≤[L:K] by identifying the cokernel with the unramified class-field intersection…". Tags at lines 1089 and 1099.
   - **Claim.** The class-group norm cokernel bound is asked of ClassFieldTheory as a new statement.
   - **Witness.** `TauCetiRoadmap/IntegralIwasawaTheory/README.md` at open head 5d2ed25, line 495, `classNorm_cokernel`: for finite F′/F, the norm on class groups at F′F_n/F_n has cokernel Gal((F′F_n∩H(F_n))/F_n), of order dividing [F′:F]. Its Conventions fix an arbitrary number field. The case n=0 is the gap. IntegralIwasawaTheory is line 31 of `merge-order/ORDER.txt`, before this roadmap.
   - **Repair.** Add "From TauCetiRoadmap.IntegralIwasawaTheory: §3.4 `classNorm_cokernel` (case n=0)". Cite it in §12.4 and §12.5 in place of "ClassFieldTheory Layer 13 (gap:class-norm-index)". Delete line 110 (and the slug from `plan.json`, through its maintainer). Image-size monotonicity under a following homomorphism is elementary. Tested: L=E* gives index 1≤1, and L the normal closure gives index ≤[L:E*]≤(2h)!, as §12.2 uses.

5. **F05** (P3) Gap tags in *Needs:* lines do not match the targets that use the contracts

   - **Location and witness.**
     - The tag "(gap:quantitative-cm-torus-orbit)" appears on targets that never count an orbit: §1.1 line 267 (torus construction), §1.2 line 291, §1.3 line 301, §7.2 line 865 and §12.3 line 1079, and on the Layer 1/7 Dependencies (lines 354, 891). The gap (line 94) is an orbit inequality, used only in §12.4.
     - "(gap:quantitative-siegel-hermitian-reduction)" at §13.2 (line 1129): that target uses only successive minima (GeometryOfNumbersAndQuadraticArithmetic §§1.2, 1.5).
     - Conversely, the declared gap is missing where it is used:
       - §4.4 (line 665) uses the narrow norm identity (line 663) but cites "ClassFieldTheory Layer 13" without gap:narrow-cm-norm-different;
       - §7.3 (line 873) uses "the ramified bridge contract" without gap:ramified-quaternionic-bridge;
       - §12.1 (line 1059) uses "the full-order discriminant contract" without gap:etale-order-discriminant.
   - **Repair.** Drop the two spurious tags at the lines listed. Add `(gap:narrow-cm-norm-different)` after "ClassFieldTheory Layer 13" on line 665. Add `HilbertModularVarietiesAndShimuraCurves §§R18.2.17–R18.2.18 (gap:ramified-quaternionic-bridge)` on line 873. Add `(gap:etale-order-discriminant)` after "GlobalNumberFields Layer 11" on line 1059. Mirror these changes in the Layer Dependencies. Test: then every Needs tag names a gap whose `needs` sentence the target's statement or route actually uses.

6. **F06** (P3) Uniform constants quantified after the field in §§10.2–10.3

   - **Location.** Line 963: "For each primitive maximal-order CM type (E,Φ), every A … and every ε>0 admit B … degree≥c_g,ε D_E^(1/4−ε)". Line 973: "For all maximal-order CM types, including imprimitive ones, every g≥1 and ε>0 admit C_g,ε>0 with h_Falt(E,Φ)≤C_g,ε D_E^ε".
   - **Witness.** Read literally, each constant may depend on (E,Φ). For a fixed E both statements are then trivial (choose c small or C large). §11.2 needs constants depending only on g and ε. Compare §10.1, line 953, which quantifies correctly.
   - **Repair.** Line 963: "For every g≥1 and ε>0 there is c_g,ε>0 such that for every primitive maximal-order CM type (E,Φ) with [E:ℚ]=2g and every A in its class there is B in that class with every complex isogeny A→B of degree≥c_g,ε D_E^(1/4−ε)." Line 973: "For every g≥1 and ε>0 there is C_g,ε>0 such that h_Falt(E,Φ)≤C_g,ε D_E^ε for every maximal-order CM pair with [E:ℚ]=2g."

7. **F07** (P3) Garbled sentences and symbol clashes

   - **Location / repair.**
     - Line 809: the stray sentence "7 is explicitly excluded." Delete it.
     - Line 807: "its ramified comparison comparison". Change to "its ramified comparison".
     - Line 881: the fragment "an arbitrary isogenous A cannot replace the quaternionic family." starts in lower case. Capitalize it.
     - Line 795: the kernel is named "ℚ". Rename it Q (the source's name).
     - Line 607: "B(x,y)=ℚ(x+y)−ℚ(x)−ℚ(y)". Change to "B(x,y)=Q(x+y)−Q(x)−Q(y)".
     - Line 623: "ℚ(x,y)=−x²−y²". Change to "Q(x,y)=−x²−y²".
     - Line 495: "Its length is invariant under replacing B by an invertible B-module M". Change to "Its length depends on M only through its isomorphism class, so it equals the length for M=B".
     - Line 815: "At a split prime". Change to "At a finite place where 𝔹 splits".
     - Line 1157: the process word "replanned". Change to "no Jacobian or isogeny-counting theorem is used".
   - **Witness.** The quoted text at those lines. ℚ also denotes the rationals throughout.

8. **F08** (P3) A vacuous Check in §0.4

   - **Location.** Line 228: "For the zero class function both linear maps vanish, irrespective of whether the predicate holds."
   - **Witness.** This holds for every pair of linear maps, so it rejects no wrong definition.
   - **Repair.** Replace it with: "On the C₆ quotient of ℚ(ζ₇) the class function (0,1,1,0,−1,−1) lies in CM⁰ but not in H_CM, so IndividualColmez says nothing about it. A definition quantified over all of CM⁰ would need a value of ht there that no total height fixes." The other two Checks stay.

9. **F09** (P3) §4.2 bundles five theorems under one *Needs:* line

   - **Location.** Lines 605–633. One subsection constructs the GSpin integral model, Kuga–Satake realization, special divisors, theta Green functions and Borcherds sections. It also proves A Theorem 4.8.1 (support), A Theorem 6.4.2 (big-CM degree), A Theorem 8.3.4 (Hodge height) and A Proposition 9.5.1 (the averaged comparison), all under one Needs line (line 633).
   - **Witness.** Line 633 serves all five statements, yet the support statement needs only MetaplecticAutomorphicForms and the Borcherds input, while the big-CM degree needs §2.3 and §0.3. This is the "one Needs line covering several theorems" defect.
   - **Repair.** Split §4.2 into five subsections, each with its own locator and Needs:
     - GSpin data and special divisors (A §§4.1–4.6, pp. 431–452);
     - Borcherds section and vertical support (A Theorem 4.8.1, pp. 454–455);
     - big-CM arithmetic degree (A Theorem 6.4.2, p. 474);
     - Hodge-height identity (A Theorem 8.3.4, p. 508);
     - the averaged-height comparison (A Proposition 9.5.1, pp. 522–523).

     Keep the existing API and Checks with the subsection each one tests.

Files reviewed: `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md` (1226 lines), `Suggested.lean` (55 lines), `metadata.toml`, `sources.toml` (9 entries), with `design/plan.json` for the gap list. Nine findings: one P1, three P2, five P3. The mathematics checks out well: every formula I recomputed agrees across layers and with the sources, and the seeded sample verifies. The blocking findings are about ownership and the gap list, not about false mathematics.

## Adversarial pass (one row per statement)

| Statement | Instances tried | Values computed (README side / independent or source side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conv.: metrics | ℂ/(ℤ+iℤ) | \|∫dz∧dz̄\|=2. Squared norms 2, 1, 1/π. h_Falt−h_Fal=−½log2=−0.347; h_YZ−h_Falt=½log2π=0.919. Arakelov §2.7 gives h_un=h_Fal−(g/2)log2 | holds | none |
| Conv.: Artin | ℚ₅, u=2 | Lubin–Tate action 2⁻¹≡3 mod 5. LubinTate LT.2 gives χ(Art(π^r u))=u⁻¹. Geometric convention gives 2 | holds | none |
| Conv.: normalized degree | degree-2 base change; [F:ℚ]=2 | a/d→2a/2d=a/d; the wrong denominator gives a/(2d) | holds | none |
| Conv.: D_E=D_F²d_E/F | ℚ(i); ℚ(√3,i) | 4=1·4; 144=12²·1 | holds | none |
| 0.1 CM⁰, a⁰, H_CM | C₂×S₃ type; C₆; constant 1 | Overlaps (6,2,2) and (0,4,4) (script); class averages 10/3+8/3=6=\|Φ\|; a⁰(c)=0. C₆: f(σ)+f(cσ)=0 for all σ, while f(r)=1≠f(r⁵)=−1. 1(c)=1, so 1∉H_CM | holds | none |
| 0.2 linearity on H_CM | ev_c | ev_c(a⁰)=0 for all generators, ev_c(1)=1, so ht+t·ev_c has the same heights. Confirms uniqueness only on H_CM (A Thm 9.1.5 overclaims; see Source issues) | holds | none |
| 0.3 average character | d=1, 2, 3 at σ=1 | LHS (1/2d)·2^d·d=2^(d−1); RHS 2^(d−2)(1+d/d)=2^(d−1). Z̃ gives −(d/2)log2π−ℓ(0)/2−log(D_E/D_F)/4 = A Prop. 9.3.1 | holds | none |
| 0.4 predicate | f(x,y)=x, g=y on ℚ² | Agree at (1,1) only. Generator equality ⇔ span equality by linearity | holds | R08 |
| 1.1 torus | d=1, 2, 3 | Kernel of diagonal: μ₁; N(−1)=(−1)²=1 gives μ₂; dim T=2d−(d−1)=d+1=4 at d=3; one-embedding vector has pair sums (1,0,…), not constant | holds | none |
| 1.2 compact level | E_v=F_v(√ϖ) | [√ϖ]²=[ϖ]=1 in E×/F×; v_E(√ϖ)=1, while v_E(O_E×F×)⊂2ℤ, so the class is excluded | holds | none |
| 1.3 étale models | ℚ(i), K₀ versus (1+2Ô)× | Class field of conductor 1 (h=1) is unramified at (1+i); the conductor-2 level is ramified, and no assertion is made there | holds | none |
| 1.4 total reflex | ℚ(i,√2); d=3 | Orbit sizes (2,2) (script), so E♯≅ℚ(i)×ℚ(√−2) with dimension 2. d=3: 8 types, \|Φ♯\|=4 | holds | none |
| 1.5 integral families | d=1, H=E, O_E | CM elliptic curve with T_ℓ=O_E⊗ℤ_ℓ; Tr(ξxȳ) of discriminant m² gives degree m. A Prop. 3.4.1, p. 419 | holds | none |
| 1.6 coefficient 1/(2d) | σ=1, d=3 | a⁰_(E♯,Φ♯)(1)=4=(1/6)·8·3. The 2^(−d) version gives 3≠4. A Cor. 9.3.3, p. 512 | holds | none |
| 2.1 crystalline | ℚ(i), p=5 split | Lubin–Tate character (HT 1) ⊕ unramified (HT 0), both crystalline. Printed Λ_{p,y} is a misprint | holds | none |
| 2.2 Breuil–Kisin | E_q=ℚ_p, E(u)=u−p, rank 1 | φ*M/u has rank 1 over W; φ*M/E(u) has rank 1 over O_y with the Fil jump; M/E(u)M fails the twist | holds | none |
| 2.3 bundles/crystals | level over ℚ₃(ζ₃), e=2 | Filtered bundle global; the F-crystal is not asserted off the étale locus | holds | none |
| 2.4 tensor torsor | d=1, ℚ(i), D={2} | T=Res_E G_m; tensors = the E-action; E-frames form a T-torsor over Y[1/2] | holds | none |
| 2.5 Hecke/torus actions | H₀=E, t=2, ½ | [2] is integral, ½ is a quasi-isogeny only | holds | none |
| 2.6 standard line | ℚ(i) | f₁²=1, Q₀(f₁)=1; f_i²=i·(−i)=1 versus i²=−1; z=(1,i): B(z,z̄)=4, printed sign −4 | holds | none |
| 2.7 tautological crystal | ℚ(i), p=5 | (2+i): Lubin–Tate, slope 1; (2−i): Fr⊗1, slope 0 | holds | none |
| 2.8 supersingularity | p=3 inert, 5 split | Slopes ½,½ versus 0,1; invariant ranks 2 versus 0. A Props. 3.6.1–3.6.2 | holds | none |
| 3.1 determinant section | d=1, 3; k[ε] | Exponent r=1 and 4 (not 8); diag(π,1,1,1) gives det π, length 1; ε is a zero divisor, so not Cartier. (9.4.3) | holds | none |
| 3.2 partition quotient | A×A; A[√π], p odd | (C×0)+(0×C), so 0; (x−√π)+(x+√π)∋2√π, so C/(2√π), length 1 for C=B | holds | none |
| 3.3 partition length | ℤ₃[π], π²=3, singleton | cross=v(2π)=1; ½v(disc 12)=1; within=0; 1=1−0−0. Printed Lemma 9.4.4: 0+0−1=−1 | holds | none |
| 3.4 conductor functional | trivial; tame quadratic; digit map | 0; 1; tail bound (p−1)/(2p−1)<1, so injective with infinite image | holds | none |
| 3.5 conductor values | ℚ₃(√3) | μ(a_ηη)=v(2π)/2=½ each; (2/2)(½+½)=1=length. Printed sign gives −1 | holds | none |
| 3.6 metrized determinant | r=1; unit 3+2√2 | \|∫η\|=2π; periods scale by 5.83 and 0.17 with product 1; deĝ(det)/deg=2^d d log2π (=2log2π at d=1) | holds | none |
| 3.7 local comparison | d=2, p split in F | Fibres 2^(d−d_𝔭)=2; length 2^(d−2)v_q(d_F) = (9.4.9) | holds | none |
| 3.8 total reflex height | solve det=Δ+rω₀−2Ω♯ | Σh=2^(d−2)(log D_F+deĝω₀/deg)−2^(d−1)d log2π, so mean = deĝω₀/(4deg)+log D_F/4−(d/2)log2π = A Thm 9.4.2 | holds | none |
| 4.1 adapter | (9.5.3) at ξ=−p², E_v/ℚ_p unramified | Maximal O_E-stable lattice p⁻¹O_E,v versus printed ξO_E,v=p²O_E,v. Filtered-line identity (9.5.1) kept | holds | none |
| 4.2 Hodge height | Λ'/Λ(0); negative plane; f=0 | Γ_ℝ'/Γ_ℝ(1)=−½log(4πe^γ). 3.8+4.1+4.2 give −ℓ(0)/2−log(D_E/D_F)/4−(d/2)log2π; z=(1,i): B=−4, norm 4; c_f(0,0)=0 inadmissible. A Thm 8.3.4, Thm 4.8.1 | holds | R09 |
| 4.3 auxiliary data | d=1, ξ=−1; d=2; ξ≫0 | Signatures (0,2), (2,2), (2d,0). Def. 5.3.3 p. 460 matches; trace is Tr_F/ℚ (printed Tr_E/ℚ doubles it) | holds | none |
| 4.4 good data | F=ℚ(√3), E=F(i) | d_E/F=1; d=2 even; Cl⁺(F)=ℤ/2 and E is its narrow Hilbert class field; (2√3) has a mixed-sign generator, so χ=−1=(−1)^1 | holds | R05 |
| 4.5 prime elimination | a log2+b log3=0 | 2^m3^n=1 forces m=n=0; n⋄=2d≥3 needs d≥2 (Thm 9.5.5 proof) | holds | none |
| 4.6 d=1 | ℚ(i) | ℓ(1)=0.24561 (Lerch), ℓ(0)=0.78319, h_YZ=−0.73817 (Deligne's known value for j=1728), h_Falt=−1.65711 | holds | none |
| 5.1 component invariance | g=1 | R_Φ=O_E and d_Φ=1, so h(Φ,τ)=h(Φ), consistent with 5.2 | holds | none |
| 5.2 decomposition | g=1; all types | Correction 0 at g=1; type average −¼log d_F. Y Thm 2.3 and Cor. 2.6 proof | holds | none |
| 5.3 nearby types | g=1, 2, 3 | (2,1), (4,4), (8,12) (script) | holds | none |
| 5.4 nearby average | general g | g·2^g pairs (Φ,τ), g·2^(g−1) edges; Σh(Φ,τ)=2Σh_near, so 2^(1−g)Σh_near = Y Cor. 2.6 | holds | none |
| 6.1 graph datum | δ=1; ℤ/3 | Kernel 0; graph has 3 points versus 9 for the full product | holds | none |
| 6.2 torsion mod δ | ℚ(i) | i−(−i)=2i∈(2)=δ; (ℤ[i]/2)×={1,i} extend as scalars | holds | none |
| 6.3 self-duality | ℚ(i) | a−ā∈δ, so conjugation is trivial on O_E/δ. YE display (5), p. 10 | holds | none |
| 6.4 nearby identity | YE Thm 1; ℚ_p(√p), ℚ₂(√2) | Statement matches YE p. 2; raw quotients O_L/(2√p) of length 1, and v(2√2)=3 | holds | none |
| 6.5 quaternionic kernel | division and split places | Λ₀=Λ₁+Λ₂ gives 0; Λ₀=O+Oj+O(ϖ−ϖ̄)⁻¹(1−j), YE p. 3 | holds | R07 |
| 7.1 datum | g=1, 2, 3, 4 | g+\|S\| = 3, 3, 3, 5: odd and ≥3 | holds | none |
| 7.2 CM-point height | z=i, 1+i; [F:ℚ]=2 | ‖dz‖=2 at both (Y p. 536, Thm 4.7(3) p. 567); ℚ-denominator scales by ½ | holds | R02 |
| 7.3 Hodge lines | O_B versus O_E tangent | Ranks 1 versus 2; N_U=L_U²(−d_𝔹), Y p. 538, Prop. 5.7 | holds | R05 |
| 7.4 quaternionic average | with 8.3 | h_L/2−¼log(d_𝔹D_F) = −ℓ/2−¼log(d_E/F D_F), and d_E/F D_F=D_E/D_F. Y Thm 1.6 | holds | none |
| 8.1 self-intersection | Y Thm 9.1 p. 625 | Statement and e=[O_E×:O_F×] match | holds | none |
| 8.2 adjunction | GZ §7.78 | Identical identity already stated by a supplier | duplicate | R02 |
| 8.3 point height | 8.1+8.2 | h_L=−ℓ+½log(d_𝔹/d_E/F) = Y Thm 1.7 | holds | none |
| 9.1 averaged Colmez | Route A versus Route Y | Both give −ℓ(0)/2−log(D_E/D_F)/4−(g/2)log2π = A Thm A, Y Thm 1.1 + (g/2)log2π | holds | none |
| 10.1 class numbers | ℚ(i), ℚ(√−3), ℚ(√−23) | h⁻ = 1, 1, 3 (D = 4, 3, 23); R_E/R_F=2^(g−1)/Q_E (Mathlib line 438); 5 one-tactic probes fail | holds | none |
| 10.2 distant isogenies | X² versus X^(1+ε) count | X≈D^(1/8) versus D^(1/4−ε) | holds | R06 |
| 10.3 individual bound | FE; heights (−1,3), b=−1 | ℓ(0)+ℓ(1)=−log f+g(log2π+γ), so mean = log f/4+ℓ(1)/2−gγ/2−g log2π (ANT-I §2.44); h₂≤3 | holds | R06 |
| 11.1 common field | g=1; ℚ(i,√2) unit | 162 and 26244; (1+√2)^8=577+408√2 ≡1 mod 3, uū=u²≠1 (script) | holds | R03 |
| 11.2 exponent budget | κ=2, δ=1/16 | δκ=1/8<a=3/16<1/4; εκ=1/16<a | holds | none |
| 11.3 primitive orbit | g=1 | [ℚ(j):ℚ]=h(O_E)≫D^(1/2−ε), consistent with δ_1 | holds | none |
| 12.1 center order | ℤ+2ℤ[i]; A₀ⁿ | J=2, D=16=2²·4; Z(M_n(End A₀))=Z(End A₀) | holds | R05 |
| 12.2 reciprocity image | h=1 | U_F⁺/N U_E trivial; [ker r:H]≤2^(h−1)≤2^h; [L:E*]≤2 | holds | R04 |
| 12.3 compact index | imaginary quadratic of conductor f | J=f and I≍f^(1±ε), so J≤I^c with c=2 (statement level only) | holds | R05 |
| 12.4 reduction | #S≤ω(J) | B^#S≥c_η J^(−η)≥c(I P)^(−η′) | holds | none |
| 12.5 every CM point | g=1 | D_x=f²D_E, orbit h(O_f)≫D_x^(1/2−ε). T Thm 5.2 | holds | none |
| 13.1 coordinate degree | g=1, 2; generic sextic | 2(2g)! = 4, 48; reflex orbit 8>6 (script) | holds | none |
| 13.2 bounded basis | ℤ[i]; e_R=2, g=2 | Covolume 2⁻¹√4=1 (PT prints 4); [J:e_R J]=16 | holds | R05 |
| 13.3 Siegel reduction | Z=iI_g | h₀=max(1,1)=1 | holds | none |
| 13.4 lift height | i, 2i | H_abs = 1, 2 (M(X²+4)=4, degree 2) | holds | none |
| 13.5 finiteness | degree d, H≤B | DAT §0.3 count ≤ d(2⌊B⌋+1)^(d+1) | holds | none |
| Lean `relative_class_number_growth` | `#check @` and 5 probes | Type identical to README §10.1; C quantified before E; simp, norm_num, positivity, `exact ⟨1,…⟩` and aesop all fail | holds | none |

## Verified sound

- **Seeded source sample.** All 15 targets checked against the text at their locators:
  - 0.4: A Conj. 9.1.6 p. 510 (A line 5067); C Thm 0.3 p. 631 and Conj. 0.4 p. 632 (C lines 268, 309).
  - 1.5: A Prop. 3.4.1 pp. 419–420.
  - 2.8: A Props. 3.6.1–3.6.2, Lemma 3.6.3, pp. 430–431.
  - 3.2: A Lemma 9.4.4, p. 517.
  - 4.1: A Prop. 9.5.1 and (9.5.1), pp. 522–523.
  - 4.5: A Thms 9.5.5–9.5.6, pp. 525–526.
  - 6.4: YE Thm 1 p. 2 and §3 pp. 10–11.
  - 7.2: Y §1.2 pp. 536–537 and Thm 4.7 p. 567.
  - 7.3: Y Props. 5.3–5.4, Cor. 5.5, Prop. 5.7, pp. 574–577.
  - 10.3: T Cor. 3.3, pp. 383–384.
  - 11.1: T Lemma 4.1 and Thm 4.2 proof, pp. 384–385.
  - 11.3: T Thm 1.2 p. 379 and Thm 4.2 p. 385.
  - 12.2: T §5 p. 386.
  - 12.5: T Thm 5.2 p. 385; PT14 Conj. 7.1 p. 673.
  - 13.4: PT Thm 3.1, preprint p. 3; T §6.2 p. 387.

  Each locator, page and hypothesis set matches, and the README's corrections of the source are right. The author flagged no locator as unverified.
- **Further source lines read.** A Thm A p. 392; Def. 5.3.3 p. 460; Thm 4.8.1 pp. 454–455; Thm 8.3.4 p. 508; Prop. 9.3.1 p. 511; Cor. 9.3.3, Thm 9.4.2, Lemma 9.4.3, Prop. 9.4.5, (9.4.9)–(9.4.13). Y Thms 1.1, 1.6, 1.7, 2.3, Cor. 2.6, Thm 9.1. YE Prop. 6. MZ §5.4 p. 667. PT Lemmas 3.2–3.3.
- **Library declarations opened at the pins.**
  - Mathlib, `NumberTheory/NumberField/CMField.lean`: lines 69 (`IsCMField`), 136/141 (`complexConj` with `[Algebra.IsIntegral ℚ K]`), 163, 372, 438 (R_E/R_F=2^rank/Q).
  - Mathlib, `NumberTheory/NumberField/ClassNumber.lean`: lines 64, 69, 77.
  - Mathlib: `maximalRealSubfield` at `InfinitePlace/TotallyRealComplex.lean:125`; `discr_ne_zero` at `Discriminant/Defs.lean:41`.
  - Tau Ceti: `NumberField.card_ideal_absNorm_le` at `TauCeti/NumberTheory/EffectiveBounds/IdealCount/Basic.lean:399`; `NumberField.abs_discr_le_of_basis_isIntegral` at `TauCeti/NumberTheory/EffectiveBounds/Discriminant/Basic.lean:61`.
  - All 12 exist as cited.
- **Cross-roadmap citations resolved.** 26 suppliers, about 70 section citations, all present at main or their open heads:
  - ComplexMultiplicationAndExplicitReciprocity §§0.1–0.2, 2.1–2.3, Layers 4–5;
  - ShimuraVarieties §§4.1–4.6, 5.1–5.11, 6.1–6.2, 8.1–8.6; ShimuraData Layers 1, 3;
  - ReductiveGroups Layer 4 (main); ReductiveGroupsPartII §RG2.0a.2;
  - AbelianSchemesAndArithmeticModuli §§A4.1, A4.3, A4.CR.7.2, A5.1–A5.7, A6.22, A6.25, A6.37–A6.38;
  - ArakelovGeometryAndAbelianHeights §§1.3, 1.11, 1.13–1.14, 2.1, 2.7, 2.10, 3.4–3.5, 4.6–4.8, 6.5 (normalizations of §2.7 agree with the README's Conventions; §4.7 assumes local freeness, as the README says);
  - AnalyticNumberTheoryPartI §§2.2, 2.31d–f, 2.32, 2.44–2.46, 3.27;
  - AutomorphicLFunctionsAndLocalFactors Layer AL.1 "CM quadratic completion…" (W=1 and the Λ of §4.2);
  - AutomorphicBundles §§B1.1–B1.3, Layer B2, §B4.10;
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.2.15–16, R07.2.20, Layer R07.4;
  - LubinTateFormalModulesAndQuasiCanonicalLifts LT.2, both named items (board design);
  - NeronModelsAndSemistableAbelianVarieties §§1.5, 5.1–5.2;
  - PELModuli §§M2.1–M2.3, M3.9, Layer M5, M6.2, M6.9;
  - FaltingsFinitenessAndIsogenyTheoremsPartII QI.5 "Geometric isogeny estimate" (board design; statement matches);
  - ClassFieldTheory Layer 13 and GlobalNumberFields Layer 11 (main);
  - GeometryOfNumbersAndQuadraticArithmetic §§0.1–0.3, 1.2, 1.5, 2.2, 2.7–2.9;
  - HilbertModularVarietiesAndShimuraCurves Layer R18.1, §§R18.2.12–R18.2.18 (R18.2.17–18 assume F_v/ℚ_p unramified, as the README says), Layer R18.5;
  - GrossZagierAndArithmeticHeights §§0.1, 0.5, 0.9–0.11, 2.1, 2.9, 2.14, 6.5–6.8, 6.25, 7.28 (board package at b5527a0). The resolver's "found nowhere" line for it is a false positive;
  - MetaplecticAutomorphicForms Layers 4–7;
  - HeightsRationalPointsAndObstructions §§0.11–0.13, 0.16;
  - DiophantineApproximationAndTranscendence §§0.2–0.3 (bounded-degree Northcott);
  - CyclotomicClassGroupsAndStickelberger §3.4 (abelian only, as stated);
  - AdelicAlgebraicGroups §AA.2.4 (Artin factors, inside its §2.4).
- **Declared supplier gaps.** Six of the eleven named gaps are precise and not provided elsewhere: ramified-component-determinants, quantitative-cm-torus-orbit, narrow-cm-norm-different, etale-order-discriminant, quantitative-siegel-hermitian-reduction (no Siegel-reduction owner found by object search), and ramified-quaternionic-bridge. embedded-quaternion-orders is also legitimate: GrossZagierAndArithmeticHeights §0a.3 covers only F=ℚ level orders. unprojected-colmez-kernels is kept, with the comparison note in R02. The remaining three gaps (polarized-cm-bounded-descent, class-norm-index, ramified-colmez-adjunction) are R03, R04 and R02.
- **Supplier order.** `tauceti-roadmap gate --depcheck … --movable`, exact output:

```text
moved: ComplexMultiplicationAndExplicitReciprocityPartII moved in the merge order from #229 to #230, right after its last supplier AutomorphicBundles; checked as moved (the worker moves it there when it submits)
depcheck: 33 roadmaps, 306 edges, 0 problem(s)
```

  There is no UPWARD or CYCLE line.
- **Ownership and duplication by object.** `roadmaps grep` over main and the 336 open heads, plus the board's package READMEs and designs, for these objects: CM relative class number, Colmez class functions and heights, total reflex, GSpin/Kuga–Satake/Borcherds/Kudla, orthogonal Shimura varieties, Siegel reduction, class-group norm cokernels, optimal embeddings and André–Oort orbit bounds. Beyond R02–R04 there is no other owner. The ownership note on the GSpin route (README line 11) is correct: GrossZagierAndArithmeticHeightsPartII treats unitary Kudla–Rapoport cycles only. The pinned Mathlib and Tau Ceti trees contain no CM type, CM height, Colmez functional or relative class-number theorem; Tau Ceti's `ComplexConjugation/CMField.lean` has conjugation lemmas only.
- **Lean form.** `lake env lean packages/ComplexMultiplicationAndExplicitReciprocityPartII/Suggested.lean`, run from the content checkout: exit 0, and the only message is `45:8: warning: declaration uses sorry`. No TauCeti import, so nothing needed building. A scratch copy with `#check @…relative_class_number_growth` prints a type identical to README §10.1; nothing changed relative to the README. There are no defs or instances, so no binders can drop.
- **Headlines and padding.** README headlines:
  - not statable at the pins, and named in the module docstring: CM height linearity; integral realizations; total reflex determinant; orthogonal route; nearby/quaternionic route; averaged Colmez; distant isogenies and individual heights; orbit bounds; lift heights and finiteness;
  - statable: relative class-number growth, which is stated.

  No padding: the one theorem is a uniform Brauer–Siegel-type estimate, and five one-tactic probes fail. The file has a single `import Mathlib`, no `set_option`, no sorry'd data and the required docstring form.
- **Shape.** 14 layers, each ending with Examples and Dependencies. All 65 targets carry a locator and a *Needs:* line. 15 definition or construction sections carry an API list and at least 3 Checks. No LaTeX delimiters, no process words except line 1157 (R07). metadata.toml and sources.toml are well formed: 9 certified entries, one key per work. No new source was fetched and the manifest is unchanged.

## Not verifiable

- Primary proofs cited inside sources were not read: Colmez's monomial period relations behind C Thm 0.3; Blasius' p-adic comparison and Kisin (2010) Cor. 1.4.3 (A pp. 426–427); Armitage (1967) Thm 3 (A Lemma 9.5.4); Vignéras Ch. II Thm 3.2 (YE p. 3); Bruinier (2016) Thm 1.1 (A Thm 9.5.6); Masser–Wüstholz; Shimura's main theorem (T §5). The README treats them as supplier or own-proof obligations, not as read.
- The journal erratum (Annals 198 (2023), 867–878) was not compared with the 18 December 2022 author revision that YE uses. T12 and PT are cited at preprint pagination only.
- T12 Lemmas 7.2–7.5 (§12.3) and PT Lemmas 3.4–3.7 (§13.3) were checked at statement and setup level only.
- C is an OCR of an image scan. The displayed formulas of Thm 0.3(i)–(ii) are garbled in the extraction (C lines 288–300), so the exact component-period normalization could not be read character by character. The statement-level reading above is unaffected.
- Suppliers' own proofs (GrossZagierAndArithmeticHeights, AnalyticNumberTheoryPartI, PELModuli §M6.8) were not checked beyond their statements.

## Source issues

- **Error** in A at Theorem 9.1.5, p. 510: the source says total heights determine a unique linear functional ht on all of CM⁰; it should be unique only on the span of the a⁰ (all vanish at c), or normalized by Colmez's component periods; affects a stated result.
- **Error** in A at §3.2, p. 416: the source calls K₀ a maximal compact subgroup of T(A_f); it should say compact open, since a ramified uniformizer class is compact yet outside K₀; affects nothing.
- **Error** in A at §3.2, equation (3.2.2), p. 417: the source writes the cokernel as a direct sum over p|p of local norm quotients; it should be one quotient of ℚ_p× by the product of all local norm groups; affects a stated result.
- **Misprint** in A at Proposition 3.5.2, p. 422: the source names the crystalline representation by an undefined lattice symbol; it should be the given lattice N_p at y with p inverted; affects nothing.
- **Misprint** in A at Proposition 3.6.1(1), p. 430: the source says the prime is not split in F; it should say not split in E, as the proof uses; affects nothing.
- **Misprint** in A at §9.4, p. 514: the source gives the ω₀ squared norm as minus the bilinear value, negative for the positive definite Q₀; it should be plus that value; affects nothing.
- **Error** in A at Lemma 9.4.3, p. 516: the source says every generator has absolute period (2π)^(−dim A); it should be (2π)^(dim A) for the trace-one class, rescaled by \|σ(u)\| for a unit multiple; affects the proof.
- **Error** in A at Lemma 9.4.4 and (9.4.6), p. 517: the source's length equals minus the cross-pair sum (ℤ₃[√3] singleton gives −1); it should be the cross-pair sum, half discriminant minus within-part sums; affects a stated result.
- **Error** in A at Proposition 9.4.5, p. 519: the source puts the factor −e_P/2 before the two conductor values; it should be +e_P/2 (ℚ₃(√3) singleton has length 1); affects a stated result.
- **Error** in A at equation (9.5.3), p. 523: the source equates the maximal O_E-stable lattice with ξ·d_F⁻¹·L₀; for ξ=−p² at an unramified place it is p⁻¹O_E, not p²O_E; affects the proof.
- **Misprint** in A at §9.5, p. 524: the source uses the trace from E to ℚ in the auxiliary pairing; it should be the trace from F to ℚ, as in Lemma 9.5.3; affects nothing.
- **Error** in T at §2.2, p. 382: the source says the regulators of E and its real subfield coincide; their ratio is 2^(g−1)/Q_E with Q_E equal to 1 or 2; affects nothing.
- **Misprint** in T at the proof of Corollary 3.3, pp. 383–384: the source calls the uniform height lower bound positive; it is negative in general, and the argument works for any real bound; affects nothing.
- **Gap** in T at Lemma 4.1, p. 384: the source states it for unpolarized A, but level-3 rigidity needs a polarization (unit (1+√2)^8 of ℚ(i,√2) is ≡1 mod 3); it should be stated for polarized A; affects the proof.
- **Error** in T at §5, p. 386: the source equates [ℚ(A):ℚ] with \|Cl(K*)\|/\|H\|; Shimura's theorem gives the degree over the reflex field, which differs by bounded factors; affects nothing.
- **Error** in T at §6.2, p. 387: the source bounds the degree of the lifted CM point by 2g; a generic sextic CM type has reflex degree 8; it should be a bound depending only on g; affects nothing.
- **Misprint** in PT at the proof of Lemma 3.3, preprint p. 4: the source gives the covolume of ψ(I) as Disc(O_K)[O_K:I]; it should be 2^(−g)\|Disc O_K\|^(1/2)[O_K:I] (ℤ[i] gives 1); affects nothing.
- **Gap** in YE at the proof of Proposition 6, p. 10: the source asserts that the τ-contracted differential modules are locally free, hence exact; at a ramified prime the contraction can be O_L/(2√p); affects the proof.
- **Misprint** in YE at the proof of Theorem 1, p. 11: the source writes the Hom target as A₂[π]; it should be A₂[δ_π], matching the source module; affects nothing.
- **Gap** in Y at §9.2, p. 633: the source calls the level projection étale to make P′ a section, while P′ has multiplicity e in the pull-back; the section claim needs another argument; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "408c5d5", "job": "REV-PKG-ComplexMultiplicationAndExplicitReciprocityPartII", "model": "opus", "worker": "fable-rev56"} -->
