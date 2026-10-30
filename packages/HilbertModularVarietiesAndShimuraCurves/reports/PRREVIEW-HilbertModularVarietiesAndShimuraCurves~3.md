# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 6084533)

**Verdict:** accepted

🤖 Independent AI review. No findings: 0 P1, 0 P2, 0 P3. This folder is ready for human final approval; this is not an approval or merge.

Incremental re-review of 56 changed lines since c3d1070: 28 insertions and 28 deletions in TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md. Suggested.lean is unchanged. The repairs, affected statements, source locators and suppliers were checked; unchanged evidence is attributed to [r2]. Below, README means this folder's README.

[r2]: PRREVIEW-HilbertModularVarietiesAndShimuraCurves~2.md

## Previous findings

- R01 — repaired: README:2463, 2473 routes the tower through §R18.5.20's module identification, §R18.5.15 and the torsion levels of §R18.5.4; the PELModuli M2 uniformisation attribution is gone.
- R02 — repaired: README:4330 places basic PEL uniformisation in §§R18.5.12a–c and its consumption in §R18.5.13, consistently with the Summary and supplier contract.
- R03 — repaired: README:802, 812, 857, 1952, 2966, 3009, 3039–3041 and 3738 replace the seven catalogue residues with mathematical prose, an explicit square-class Check, and the three Taylor–Wiles subtargets.
- R04 — repaired: README:114, 2393, 2435 links the actual §4.2 and §4.14 headings; weighted graphs, Hecke families and both torsion interfaces occur in those sections.
- R05 — repaired: Taylor, KRZ20 v2 and NT16 locators now match. The retained Car86a ranges are also correct: r2 misread the page boundaries; §0.5 is on p.410 and §0.11 on p.412.

## Verified sound

**Validation.** Read the repository's README and CONTRIBUTING guidance and the ModularCurves and StableReduction roadmaps on main for form. Confirmed head 60845339b4de9532f655190050c8cbc9205618e1; the outside-folder diff is empty. No tracked worktree file was changed.

The worker's gate passes every rule, including build. An independent scanner gate passes every rule; the separately rerun targeted build reports “Build completed successfully (8976 jobs).” Direct lake env lean elaboration of this folder's Suggested.lean exits 0 with no output or warnings. No Lean process remains running.

The required dependency command returned exactly:

    depcheck: 208 roadmaps, 1497 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. Every changed Needs line and its surrounding proof route was read. A supplementary explicit-link check gives 196 targets, 412 inter-target edges and no inter-target cycle. A coarse self-link in §R18.5.18 is its later torsion-realization paragraph consuming the earlier character-lattice theorem, not a cyclic proof. No supplier was moved or supplier gap introduced.

The repairs preserve division-prime and dyadic scope. They introduce no computational algorithm, copied source passage, sorry'd data, route-specific restriction, competing generic construction or set_option. The tower retains small tame levels, actual universal modules and equivariance, division-uniformizer levels, and rigid generic fibres at higher levels.

**Headline acceptance test.** The README's end theorems are Čerednik–Drinfeld uniformisation (§R18.5.15), residual and integral saturated Ihara (§§R18.4.32–33), definite Ihara (§R18.3.8), and paired torsion twists with local points (§§H6.2–8). Deep inputs include formal Drinfeld quotients (§§R18.5.7, 11), basic PEL uniformisation (§R18.5.12c), the compatible tower (§R18.5.21), weak patching (§R18.4.29), regular-base flatness (§R18.4.30), and the local-point input (§H6.5).

The unchanged 53-line Lean file has one import Mathlib, one module docstring and an empty namespace. Its docstring names these groups and their missing arithmetic carriers. The pins remain Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Searching both pins for PEL, Shimura-curve and special formal-module objects yields no carrier making the changed tower theorem statable; generic schemes and double cosets do not supply its moduli or level structures. The other, unchanged headline assessments are carried from r2. There are 0 declarations to compare with elaborated signatures, 0 applicable #check @name probes, 0 one-tactic probes and 0 padding declarations.

**Eight pinned declarations opened for the affected statements.** Paths are within the indicated pinned libraries.

| Declaration | File:line at the pin | Contract checked |
| --- | --- | --- |
| NumberField.units_sq_index_eq | TauCeti/NumberTheory/NumberField/Units/ElementaryTwoQuotient.lean:84 | Square-class index is 2^(rank+1), not finiteness of the unit group. |
| NumberField.unitsMulEquivTorsionProdMultiplicative | TauCeti/NumberTheory/NumberField/Units/Dirichlet.lean:82 | Unit group decomposes into torsion and a free abelian group. |
| QuaternionAlgebra.normForm_coe | TauCeti/Algebra/Quaternion/NormForm.lean:120 | Central norm is r², giving valuation two for a scalar uniformizer. |
| MvPolynomial.eval₂Hom | Mathlib/Algebra/MvPolynomial/Eval.lean:158 | Native polynomial evaluation; relations must still vanish to descend. |
| RingHom.ker_isMaximal_of_surjective | Mathlib/RingTheory/Ideal/Maps.lean:851 | Surjectivity to a division ring is an explicit argument. |
| DoubleCoset.Quotient | Mathlib/GroupTheory/DoubleCoset.lean:79 | Setoid quotient of a group; no analytic or arithmetic moduli structure. |
| groupCohomology.H1ofAutOnUnitsUnique | Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:107 | Hilbert 90 for the automorphism action of a finite-dimensional field extension. |
| groupCohomology.exists_div_of_norm_eq_one | Mathlib/RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:134 | Finite cyclic Galois extension, specified generator and norm-one element imply y/g(y)=x for a unit y. |

**Suppliers and ownership.** Used roadmaps show, roadmaps grep and the citation resolver at the indexed heads and main; also searched board-package READMEs for the affected objects. The resolver reports no missing cross-roadmap citation. Its library-name check was unavailable, so the pinned checks above were done directly. The worker's three library-name leads are planned supplier declarations: SheafDerived.isoSingular and FrankeInput occur in ArithmeticLocallySymmetricSpaces ALS.F.3 and ALS.5b.4 (README.md:824, :4378); CanonicalModel.minimal_defined_over_reflex occurs in ShimuraVarieties §8.18 (README.md:2622). They are not represented as declarations at the pins.

| Consumer | Supplier citation resolved | Outcome |
| --- | --- | --- |
| §§R18.5.12–13 | PELModuli M0.5 (README.md:630), M0.9 (:790), M1.2 (:1608), M1.7 (:1824), M3.2 (:2801), M4.3 (:3246) | Data, moduli, Hasse inputs and canonical models exist. Good-prime M2 is no longer credited with division-prime uniformisation. The actual auxiliary bad-prime model stays in §§12a–c. |
| Graph and torsion comparisons | NeronModelsAndSemistableAbelianVarieties §4.2 (README.md:2027), weighted graph (:2147), Hecke family (:2189), §4.14 (:2690), Jacobian realization (:2777), two-place datum (:2791) | Replacement fragments are actual heading anchors. Thickness, adjoints, common torsion module and residue-characteristic exclusions agree. |
| Drinfeld modules and formal geometry | FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1–R07.2; AdicSpacesPartIII F0.7–F0.8 (README.md:3272, :3525), R2.2–R2.6 (:4356 onward) | Supplies generic formal/BT carriers and formal geometry, not quaternionic uniformisation. |
| Definite graph | QuaternionicModularForms §§0.1–0.3, 3.1 (README.md:190, :232, :267, :792); AdelicAlgebraicGroups §§4.2, 4.4 (:4149, :4632); GL2AutomorphicRepresentationsAndTransfer R17.1.5 (:1427) | Existing class sets, Hecke action, split-place approximation and exchanged invariants retain ownership. |
| Residual eigen-ideal | AutomorphicFormsOnReductiveGroups §7.3, universal eigensystems and galoisAnemicEigenSystem (README.md:886–902) | The relation-kernel inclusion is the supplier's hypothesis; evaluation alone does not attach an automorphic representation. |
| Characters and real types | SmoothRepresentationsOfLocalGroups SR.0.4 (README.md:801); GL2AutomorphicRepresentationsAndTransfer R16.2.13, R16.4.5, R16.6.3 (:859, :1128, :1274) | Imports general character/weight theory; retains the local division-character specialization. |
| Taylor–Wiles Check | This README §R18.4.20 (:3689–3742), SelmerIwasawaCohomology Layer 2, GlobalGaloisDeformations §§3.3–3.7, LocalGaloisDeformationRings §§1.1, 1.15–1.16, ArithmeticGaloisDuality R02.4.4 | All three named local subtargets precede the selection theorem. No unramified-field theorem is substituted for ramified F. |

No new generic object is introduced by the diff. Open-roadmap searches locate the same owners; HilbertModularVarietiesAndShimuraCurvesPartII remains a consumer. Board-package first-level Drinfeld-cover material in PadicLocalLanglandsForGL2QpPartII consumes this tower and constructs a semistable model, outside this roadmap's all-level integral assertions. The empty Lean namespace has no declaration-name collision.

**Sources.** Ten relevant works were fetched through the sources service from arXiv, Numdam, an author page or the publisher's open archive. No repository manifest or source text was written. Tay06's initially unresolved publisher-host classification was resolved by fetching its open publisher copy; no new missing-text request remains.

| Source | Locator and extraction witness read | Conclusion |
| --- | --- | --- |
| BHW23 | Lemma 8.2, p.1765, lines 2179–2199; Proposition 8.4, p.1766, lines 2203–2209 | Scalar changes match H3.3. Finiteness is supported; the additional torsor assertion is distinguished from the nonfree coarse action. |
| BC91 | Definition (8.1), p.107, line 3773; Part III Theorem (5.2), pp.140–141, lines 5091–5103; §5.3.1, pp.141–142, lines 5131–5155 | Height-four framed modules, universal-module compatibility and strict displacement >2 are present. |
| BZ22 | (6.2)–(6.5), pp.40–41, lines 2131–2166; Proposition 6.2 and (6.15), p.43, lines 2247–2271; (6.34), p.47, lines 2459–2464; Theorem 6.7/Corollary 6.8, pp.49–50, lines 2559–2588 | Actual p-divisible groups, the basic quotient, Weil datum and maximal-level theorem supply the route. |
| KRZ20 v2 | Proposition 7.1.11, pp.117–118, lines 6009–6042; Lemma 7.3.1, p.122, lines 6251–6271; Proposition 7.3.2, p.123, lines 6295–6299 | All corrected pages agree; rational multipliers are not silently substituted for BZ's F-valued multipliers. |
| CDN20 | §5.2.1, pp.40–41, lines 1597–1611; Proposition 5.4/Remark 5.5, p.43, lines 1689–1707 | Division-place hypotheses and simultaneous variation of n and U match. |
| Tay06 | Lemma 1.1/Corollary 1.2, p.738, lines 392–407; Lemma 1.3, pp.740–741, lines 569–610 | Corrected pages include the norm quotient and dual realization; the stronger base-change statement keeps its isotropy hypotheses. |
| Car86a | §0.4, pp.409–410, lines 44–59; §0.5, p.410, line 60; Theorem A, pp.410–411, line 86; §0.10, pp.411–412, lines 129–143; §0.11, p.412, lines 154–167 | r2's proposed changes to §0.5 and §0.11 were mistaken. Printed headers at lines 50, 90, 134 fix the page boundaries. |
| NT16 | Proposition 3.7, pp.31–32, lines 1412–1429 | Assumptions start on p.31; part (3) on p.32 identifies inverse-double-coset adjoints. |
| KW09 | §7, pp.57–58, lines 2640–2685 | Full division factors have quotient order two; the coefficient action uses ψ⁻¹. |
| MS19 | Lemma 4.10, p.24, lines 1146–1161; framing dimension, p.23, lines 1130–1132 | Image exceptions, distinct roots, cardinality and dimension formula are correctly named in the repaired Check. |

The brief supplies repeated sample labels without section identifiers. This incremental review retains r2's explicit S01–S15 assignment instead of silently drawing a fresh full sample. S02 (R18.5.4), S05 (R18.5.15), S06 (R18.5.13) and S12 (R18.5.12c) intersect the repairs or their dependencies and were reopened above. S01 H2.1, S03 H2.3, S04 R18.4.29, S07 H6.2, S08 R18.4.32, S09 R18.3.8, S10 R18.4.19, S11 R18.4.12, S13 H4.19, S14 R18.4.30 and S15 H6.5 retain r2's source evidence. The labels alone do not identify a different “Finite-level specialization” target. No newly flagged unverified locator occurs in the changed text.

**Recomputed adversarial rows.** Dimension substitutions test identities, not existence of an arbitrary global representation. Division-level sizes count geometric level torsors before arithmetic stabilizer quotients.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| H3.3 scalar construction and API, README:802, 812 | η=3+2√2; 1; −1 | η²=17+12√2, η⁻¹=3−2√2, ηη⁻¹=1; tame diagram yields μ, dual diagram ηα; 1 leaves data fixed, −1 fails positivity | Correct; actual automorphism and level maps named |
| H3.3 non-scalar stabilizer | F=ℚ(√3), N=7, S²=3I, f=i(7I+4S) | f†f=97I+56S; det f=−1; f² mod 7=−48I=I, trace 0; η≡−1 mod 7, so η∉S₇ despite a fixed marked point | Correct negative control; see Source issues |
| H3.5 Check, README:857 | F=ℚ(√2), P=1, M=0; F=ℚ | U≅C₂×ℤ gives 4=2² square classes; P/P² has 1; U₀={1}, Δ(0)=⟨(1+√2)²⟩ infinite; over ℚ, Δ(M) has 1 element | Correct; M>0 needed |
| R18.5.9 Check, README:1952 | Translations 3n, 2n; constant move by 3 | Minimal displacements 3>2 and 2≤2; constant move sends 0→3 at identity and 0→6 after two moves | Correct; identity-axiom failure explicit |
| R18.5.12 changed Needs | Labels (0,0), (1,1), (1,0) | Differences 0,0,1; sums 0,2,1, hence (1,0) fails parity; Weil step (0,0)→(1,1) | Correct; M0–M1 supplies PEL data |
| R18.5.12b locator | Multiplier 3+2√2; u=−1 in positive factor | Conjugates 3±2√2>0, norm 9−8=1, multiplier irrational; d*d>0 excludes −1 | Mathematics unchanged; v2 pp.117–118 verified |
| R18.5.12c locator | Two Frobenius steps | ρ→Fρ→F^(τ)Fρ equals two-step Frobenius; corrected labels (0,0)→(1,1)→(2,2), not (−2,−2) | Correct; pp.122–123 and BZ (6.15) |
| R18.5.13 changed Needs | Kernel (2,½); x=−1 over ℚ(i) | 2·½=1; y=i gives y/conj(y)=−1, norm x=1 | Correct; uniformisation from 12c, canonical comparison from M4 |
| R18.5.15 changed Needs | Discriminant-6 B/ℚ at 2; M₂(ℚ) | inv∞=0, inv₂=½ for B; inv₂=0 excludes split algebra; swap gives definite algebra ramified at 3 and ∞ | Correct division-prime scope |
| Néron §4.2 anchors, README:114, 2393 | Loop thickness 3; empty graph | H₁=ℤ, Gram [3], cokernel ℤ/3; empty case H₁=0, cokernel 0; 3(−a)(−b)=3ab | Correct; generic owner resolved |
| R18.5.17a dependent incidence | q=2, dart e:x→y | a_*Ue=2y=2b_*e; b_*Ue=T(y)−x after deleting the reverse dart | Correct |
| Néron §4.14 anchors, README:114, 2435 | Split Tate factor v(q)=ℓ, residue char≠ℓ | X=ℤ, Gram [ℓ], Φ[ℓ]=ℤ/ℓ; toric order ℓ, inertia-invariant torsion order ℓ², quotient order ℓ | Correct; common global module retained |
| R18.5.18 Frobenius | q=2, ℓ=7, lattice F=−1 | 2(f∘F⁻¹) gives −2=5 mod 7; omitting cyclotomic factor gives 6 | Correct supplier convention |
| R18.5.20 module/levels | Division algebra over ℚ₂, n=1,2,3 | ν_D(π)=2; 1+πO_D=1+Π²O_D; unit-quotient orders 3,12,48; using π at level 1 gives 12 instead of 3 | Correct; odd levels kept |
| R18.5.21 route, README:2463, 2473 | Discriminant-6 curve at 2, restrictions 3→2→1 | Same Πⁿ-torsion trivializations on both sides; degrees 4·4=16=48/3; restriction twice equals restriction modulo Π | Repaired; no PEL M2 uniformisation or cycle |
| R18.3.15 factorisation, README:2966 | ℤ[T]→𝔽₇, T↦1; I=(T−1) or (T) | T−1↦0 permits descent, T↦1 prevents it; q=3, det=6 gives S=5·6=2 and qS=6 | Correct relation-kernel hypothesis |
| R18.3.17 API, README:3009 | r=½, ν(g)=1, ν(h)=−2; central π | τ(gh)=(½)⁻¹=2=(½)·4; τ(π)=¼, inverse character gives 4 | Correct actual character law |
| R18.3.18 restriction | ψ(Nrd Π)=9 over ℤ₂, r=±⅓ | On compact units value 1; on central π both 1/9=ψ(π)⁻¹; translation values ±3 square to 9 | Correct |
| R18.3.18 sign operations | 0,1,2 selected places | Counts 1,2,4; each flip squares to 1; both orders of two flips take (+,+) to (−,−) | Correct identity/involution/commutation |
| R18.3.18 reduction | ±⅓∈ℤ₂× | Both reduce to 1 mod 2; difference 2/3≠0 integrally; ±1 squares to 1≠1/9 | Correct; same coefficients |
| R18.3.20 locator | k=2,4, m=0, scalar 2 | Dimensions 1,3; scalar action 1,4; dual action 1,¼ | Correct dual in Tay06 Hom realization |
| R18.3.21 locator | Weight-two constant norm function | Constant 1 spans one-dimensional norm branch; image in quotient by norm forms is 0 | Correct; Tay06 pp.740–741 |
| R18.3.23 locator | C₂ sign lattice over ℤ₂; C₃ | C₂ integral invariants 0, residual invariants dimension 1, liftable image 0; C₃ averaging uses the unit 1/3 | Correct; Corollary 1.2 p.738 retains stronger hypotheses |
| R18.4.3 locator | (T,S)=(1,2) over 𝔽₇ | S⁻¹=4, adjoint (4,4)≠(1,2) | Correct inverse-coset normalization |
| R18.4.20 Check | Dual Selmer basis e₁,e₂; #Σ=2,r=2,g=3 | Independent detections give kernel dimensions 2→1→0; repeating e₁ leaves 1; j=7, local dim=7, infinite dim=7+3=10=r+j+1 | Correct; three subtargets named; dimensional substitution only |
| Scope note, README:4330 | Division-prime supply chain | 12a,12b→12c→13; PEL M2 uniformisation targets consumed: 0 | Correct ownership, agreeing with Summary |

**Carried-forward adversarial evidence.** The following 74 rows preserve computations for unchanged statements, each citing [r2]. Together with 26 new rows above there are 100 adversarial rows. These are row counts, not claims of proofs. The previous report described 102 statements but its table has 94 rows; this report counts actual rows.

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| H0.0 trace form and h | F=ℚ, e₁,e₂ | h(i)=[[0,1],[−1,0]] gives h(i)e₁=−e₂; ψ₀(e₁,e₂)=1; −ψ₀(e₁,h(i)e₁)=ψ₀(e₁,e₂)=1>0 | Consistent; carried from [r2] |
| H0.1 centres | real quadratic split fibre | dims 8=2·4 and 7=8−1; t₁²=t₂² gives t₂=±t₁, (1,−1) off the diagonal | Consistent; prior repair verified in r2; carried from [r2] |
| H0.3 lattice | c=2ℤ; c=O, F=ℚ(√2) | L_c=ℤ⊕½ℤ; second summand (2√2)⁻¹O≠O; diag(1,a⁻¹) sends c⁻¹d⁻¹ to (ac)⁻¹d⁻¹ | Consistent; carried from [r2] |
| H0.5 dual and stabiliser | general c | dual of O⊕c⁻¹d⁻¹ is d⁻¹-dual of each summand: c⊕d⁻¹=c·L_c; row action forces entries O,(cd)⁻¹,cd,O and unit determinant; diag(2,1) excluded | Consistent; carried from [r2] |
| H1.0 dual/torsion | b invertible, supersingular E | (b⊗A)∨=b⁻¹⊗A∨; T_p of geometric points 0 while A[p] has rank p² | Consistent; carried from [r2] |
| H1.8 pairing | O=ℤ | ẽ_m(x,y)(a)=e_m(ax,y) lands in Hom(ℤ,μ_m)=μ_m, Tr∘ẽ=e | Consistent; carried from [r2] |
| H1.9 multiplier law | β′=uβ | b′=u⁻¹b, agrees with Conventions | Consistent; carried from [r2] |
| H2.1 local model | k[T]/T², ⟨Te₁,Te₂⟩ | k-dimension 2, self-orthogonal, T-image 0 ≠ rank one free | Consistent; S01; carried from [r2] |
| H2.3 DP theorem | hypotheses vs DP94 Thm 2.2 | smooth over ℤ[1/nΔ], flat lci over ℤ[1/n], codim-2 non-smooth locus; normal fibres by Cor 2.3 | Consistent; S03; carried from [r2] |
| H2.5a polarization transport | F=ℚ, c=ℤ, b=2ℤ | c⊗b⁻²=¼ℤ; b⊗(cb⁻²)=½ℤ=b⁻¹c; using cb² gives 8ℤ | Consistent; carried from [r2] |
| H2.8 lift independence | ε=1, lifts 0 and p | ∣0∣≥∣p∣ false (empty), ∣p∣≥∣p∣ true (whole) | Consistent strict ε<1; carried from [r2] |
| H2.2a descent | Stacks 0CCJ, 07S7 | effective descent for quasi-projective V along finite locally free; free finite locally free action on quasi-projective gives scheme quotient and fppf torsor | Consistent; carried from [r2] |
| H3.2 square image | F=ℚ(√2), M=12 | ε⁸=(577,408)≡(1,0) mod 12; roots ±ε⁴=±(17,12)≡(5,0),(7,0) ∉ U_12 | Consistent; carried from [r2] |
| H3.7 narrow quotient | F=ℚ(√3) | Minkowski √12/2<2 so h=1; x²−3y²=−1 impossible mod 3 so h⁺=2 | Consistent; carried from [r2] |
| H3.8 cyclic step | O=ℤ, D cyclic of order n in A[n] | alternating pairing makes D isotropic; ∣D∣∣D^⊥∣=n² so D^⊥=D; (A/D)∨≅(A∨⊗b)/(D′)∨ with D′=A[b]/D | Consistent; carried from [r2] |
| H4.4 adjugate action | u,v unipotents mod 2; uI₂ | uv=[[2,1],[1,1]]≠vu=[[1,1],[1,2]]; adj(uI₂)=uI₂, det γ·γ gives u³ | Consistent; carried from [r2] |
| H4.8 flags | char p, C₂=E[p]⊂E[p²] | e_{p²}(x,y)=e_p(x,py)=1 on E[p]: isotropic; C₂∩E[p]=E[p] rank p², [p]C₂=0 | Consistent: flag needed; carried from [r2] |
| H4.10 non-injectivity | F=ℚ(√2), p=3, N=4 | Δ₁(4)≅ℤ/2 → Δ(4)≅ℤ/4 is the zero map (see S13) | Consistent; carried from [r2] |
| H4.18 bound | general | [A_n:B_n²]≤[A_n:A_n∩B_n]·[B_n:B_n²]≤[U:U_N]·2^g | Consistent; carried from [r2] |
| H4.19 | (i), (ii) | as in S13 | Consistent; BHW23 Lemma 8.20 false as printed; carried from [r2] |
| H5.2 cusp algebra | e=3, L=ℚ(ζ₃); e=5, H_C=±1 | L⊗ℚ(ζ₃)=L×L; ℚ(ζ₅)^{±1}=ℚ(√5) | Consistent; carried from [r2] |
| H5.4 central character | scalar t | ∏τ(t)^{k_τ+2m_τ}=∏τ(t)^w=Norm(t)^w | Consistent; carried from [r2] |
| H5.5 | F=ℚ(√10), c=(2,√10) | a²−10b²=±2 mod 5 needs a²∈{2,3}, impossible; disc 40 so 5 ramifies | Consistent; carried from [r2] |
| H6.1 Isom torsor | paired rank-2 F₃ spaces | Sp₂(F₃)=SL₂(F₃) order 24, nonabelian | Consistent; carried from [r2] |
| H6.4 real points | F=ℚ, odd ℓ | conjugation on E[ℓ] has eigenvalues 1,−1, det −1 = cyclotomic value | Consistent; carried from [r2] |
| H6.5 (C2) | λ₀ choice | π_lπ_l^c=l∈λ₀, π_l+π_l^c=1∉λ₀ so exactly one factor in λ₀; π_l=(1+√(1−4l))/2 root of X²−X+l | Consistent; carried from [r2] |
| H6.5 first Check | K=ℚ, l=3, δ of ℚ(√13) | 13≡1 mod 3 so δ∣_{G_3}=1: local shape diag(ε,1); global det=εδ≠ε | Consistent negative control; carried from [r2] |
| H6.5 l=7 Check | K=ℚ(α), α³−3α+1, p=19 | x³−3x+1 mod 7 takes values 1,6,3,5,4,6,3 (no root; 7 inert); roots 3,7,9 mod 19 (19 splits; 27−9+1=19, 343−21+1=17·19, 729−27+1=37·19); residual eigenvalues 19≡5 and 1; q_v=343≡1 mod 19; π₇³=−10−9√−3 (π₇²=(−13+3√−3)/2); √−3≡±4 mod 19 gives reductions 7 and 11 | Consistent; carried from [r2] |
| H6.5 (C6) example | ℚ(√19) | 170²−19·39²=28900−28899=1, totally positive; h=1, h⁺=2; genus field ℚ(i,√−19) | Consistent; carried from [r2] |
| H6.6–H6.7 | CM quadratic K/k | dim Res_{K/k}Y_i=2; X_i(ℝ)=Y_i(ℂ) | Consistent; carried from [r2] |
| R18.1.1a component class | B disc 6, level 1+7M₂(ℤ₇) | component group (ℤ/7)^×; idele 2 at place 2 ≡ global 1/2 at 7: c₂=4 (2·4≡1), c₂⁻¹=2, c₂²=16≡2; 2·2=4; orders of 4 and 2 mod 7 are 3 | Consistent; carried from [r2] |
| R18.1.1a norm of s | s=z_π Π⁻¹ | ord Nrd(s)=2−1=+1 | Consistent; carried from [r2] |
| R18.1.6 reflex | F=ℚ(√5), E=F(i) | Φ₁+Φ₂=τ₁+τ₂+2σ₁: weights (1,1),(2,0); stabiliser fixes σ₁ hence i: F′=E; g=1: weights (1,1), F′=ℚ | Consistent; carried from [r2] |
| R18.1.9 kernel | (z,z⁻¹), (2,2) | (z,z⁻¹)∈ kernel {(a⁻¹,a)}; (2,2)∼(4,1) nonidentity | Consistent; carried from [r2] |
| R18.5.1–2 tree | q=2 | valence 3; radius-one ball 4 vertices | Consistent; carried from [r2] |
| R18.5.2 index correction | K=ℚ₂, n=1, z=2 | CDN's U₁ removes B⁻(x,½) for x∈{0,1,∞} mod 2: ∣2−0∣=½ not <½ so the rational point 2 is retained, and B⁻(0,½)≠B⁻(2,½) although 0≡2 mod 2 (lift-dependent); with centres mod 4 and radius ½, lifts differ by ≤¼ and 2 is removed | README's correction verified; source misprint; carried from [r2] |
| R18.5.3 node charts | e=2 | xy=π′² singular total space | Consistent; carried from [r2] |
| R18.5.4 heights | [K:ℚ_p]=2 | absolute height 8=2·4; mult. by π: relative 4, absolute 4[k:F_p] | Consistent; carried from [r2] |
| R18.5.8 lattice | (1,0),(1,−1),(−1,−1) | parities 1,0,0; differences —,1,0 | Consistent; carried from [r2] |
| R18.5.11 ampleness | q=2 | dualizing degree −2+3=1>0; stability needs ≥3 special points | Consistent; carried from [r2] |
| R18.5.12a m | p=2 | m=3 unit in ℤ₂, m=2 not | Consistent; carried from [r2] |
| R18.5.14 lengths | edge of thickness m | xy=πᵐ resolves to m unit edges; cycle coefficient multiplied by m | Consistent; carried from [r2] |
| R18.2.3 ranks | F_v=ℚ_p split | H_v[p] has p⁴ points, e₁₁H_v[p] has p² | Consistent; carried from [r2] |
| R18.2.12 metric | z=i; z=1+i | ‖dz‖=2 Im z: 2 and 2, while 2∣z∣=2√2 | Consistent; carried from [r2] |
| R18.2.14 determinants | scalar a | weights a², a⁻² on det W, det W^t: product 1 | Consistent; carried from [r2] |
| R18.2.17 ramification | F=ℚ[t]/(t³−t²−3t+1), p=37 | t=30: 27000−900−90+1=26011=37·703; t=4: 64−16−12+1=37 and 3·16−8−3=37 (double root); disc 148=4·37 | Consistent; carried from [r2] |
| R18.3.1 | real quadratic F | F× quotient removes infinite central units | Consistent; carried from [r2] |
| R18.3.2 | d=2,k=4; p=2 Sym² | rank 9; Gram det ±4 | Consistent; carried from [r2] |
| R18.3.7 | F=ℚ(√3) | Cl⁺=2, Cl=1 (above) | Consistent; carried from [r2] |
| R18.3.8 one-point set | D disc 2, H maximal | class number 1; kernel contains (c,−c), norm-factoring | Consistent; S09; carried from [r2] |
| R18.3.10 | F=ℚ(√17), b=i+j | b²=−2, Nrd b=2, 17≡1 mod 8 so two dyadic places, odd valuations | Consistent; carried from [r2] |
| R18.3.12 | C₈, N=2 | C₈/C₈[2]≅C₄; C₈/2C₈≅C₂ | Consistent; carried from [r2] |
| R18.3.25 | C₈,N=2; C₂,N=2 | {0,4}⊂{0,2,4,6}; C₂∋1 nonsquare | Consistent; carried from [r2] |
| R18.3.28 | q≡1 in F₃ | roots 1,2 distinct; constant term qS | Consistent; carried from [r2] |
| R18.3.30 | γ=2, q≡1 in F₃ | roots qγ=γ=2 repeated | Consistent; carried from [r2] |
| R18.3.32 | p=3, q≡−1 | γ=±1 give the same pair {γ,−γ} | Consistent; carried from [r2] |
| R18.4.7 | q=3, trivial C_K | T=4, S=1; (X−1)(X−3)=X²−4X+3 | Consistent; carried from [r2] |
| R18.4.12 circle | u=−1 over ℤ₂; over ℂ | [ℤ₂→ℤ₂] with −2: H⁰=0, H¹=F₂; invertible over ℂ | Consistent; carried from [r2] |
| R18.4.13 | 𝔸¹, constant coefficients | H⁰=coefficients, H_c⁰=0, image 0 | Consistent; carried from [r2] |
| R18.4.14 Gram | q=2,T=3,S=2; S=1 | G(0,1)=(3/2,3); Δ=9−9=0 and G(1,−1)=0 | Consistent; carried from [r2] |
| R18.4.15 | ordering | δ†δ=((q+1)a+π₁*π₂*b, Ta+(q+1)b) with π₁*π₂*=S⁻¹T | Consistent with G; carried from [r2] |
| R18.4.17 | ×λ on O; (1,0):O→O² | nonsaturated image / saturated with cokernel O | Consistent; carried from [r2] |
| R18.4.18 | J in char 3 | J³=I, order 3 | Consistent; carried from [r2] |
| R18.4.19 dims | F_v=ℚ_l | R_v: generic 4, Krull 5; framed without det: 5 and 6 | Consistent with Kis08 (3.3.4); carried from [r2] |
| R18.4.21 | 𝔽₂, free C₂-orbit; fixed point; A=k[x,y]/(x,y)² | regular module dim 2, fixed dim 1, coinduced injective; trivial module not injective (fixed (a,a)↦2a=0); socle dim 2 | Consistent; prior repair verified in r2; carried from [r2] |
| R18.4.22 | q=11,l=5 | dims 1,11,12; 12 unit mod 5 | Consistent; carried from [r2] |
| R18.4.24b | g=2 | torus fibre dimension g−1=1 | Consistent; carried from [r2] |
| R18.4.29 | constant systems rank r | patched rank r | Consistent; S04; carried from [r2] |
| R18.4.30 thickening | A=k[[X,Y]]/(X²Y), M=A, L=(XY) | N=A/(XY), N/XN=k[[Y]]≅(XY) | Consistent; S14; carried from [r2] |
| R18.4.32 hypotheses | MS Thm 6.5; numerical image-size control at l=3 | SL₂(𝔽₃) has 3(3²−1)=24 elements, divisible by 3; the trivial image has 1, not divisible by 3; the exceptional l=5 clause remains | S08 carried from [r2]; image-size control added this round |
| R18.4.33 | (1,0):O→O² mod λⁿ | cokernel O/λⁿ free but with λ-torsion | Consistent; carried from [r2] |
| R18.4.34 | g=2,w=4 | q₀=3·2=6, a=2, degree 7, weight 7−4=3=w−1; w=2: q₀=a=0 | Consistent; carried from [r2] |
| R18.4.35 | weights | Σn_i+2Σd_i−2b | Consistent; carried from [r2] |
| R18.4.24a | Tate curve over ramified L | N_HK coefficient 1, N_p=1/e_L; WIEC §3.10 says the same | Consistent; carried from [r2] |

## Not verifiable

- The unchanged limitations of [r2] remain: Dim05 (H5.2, Theorem 8.6(iv), p.548) was unavailable from the Lille author host; Kur79 (R18.5.14, pp.285–289) from the Tokyo repository; KL05 (H3.8, §§1.9–1.10) was served as unrecognised DVI. These are outside this incremental re-review and were not freshly fetched or certified.
- PRR23 §1.4.2, pp.31–33, remains a paywalled locator-only citation from r2. Changed multiplicativity/sign formulas were checked directly from the valuation definition and the ℤ₂ examples; the book text was not read.
- Conrad's published MSRI pagination remains outside this incremental verification. KRZ20 v1 pages are no longer needed because the README cites v2.
- Exact seeded target identities cannot be recovered from repeated generic labels alone. The retained sample and reopened targets are identified above; this is not a new full review.

## Source issues

The first item was verified against the source and H3.3's explicit fixed-point example this round. The remaining three are carried from r2's source-issues record for unchanged passages.

- **Error** in BHW23 at Proposition 8.4, printed p.1766: the source says the positive-unit coarse quotient is a finite étale Δ(N)-torsor; it should be a torsor on the free locus, since the ℚ(√3), N=7 example has a nontrivial stabilizer; affects a stated result.
- **Error** in BHW23 at Lemma 8.20 and proof, printed p.1775: the source says connected level groups inject into Δ(N) and eventually equal their inverse limit; it should be eventual stabilization of the inverse limit's images, with injectivity failing for ℚ(√2), p=3, N=4; affects a stated result.
- **Error** in MS19 at Theorem 6.8 proof, internal p.35: the source says the definite reduced-norm quotient uses F×; it should be the totally positive subgroup F₊×, the reduced-norm image of the definite algebra; affects the proof.
- **Misprint** in CDN20 at §1.2, p.12: the source says radius-|ϖ|ⁿ open balls are centered at lifts modulo ϖⁿ; it should be centers modulo ϖⁿ⁺¹ for this strict-radius convention, excluding lift dependence and retained rational points; affects nothing.
