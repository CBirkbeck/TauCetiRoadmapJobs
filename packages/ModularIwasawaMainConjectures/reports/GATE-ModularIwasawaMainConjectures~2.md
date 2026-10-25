## H01 (CBirkbeck) — applied

At TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:79, the false (Div H)^∨≃Tor M is replaced by (Div H)^∨≃M/Tor M and (H/Div H)^∨≃Tor M, and §3.8 consumes the free and finite cotorsion terms separately at line 1339, retaining component/local errors and Schneider’s good-reduction-above-p hypothesis for the whole-module identification. The distinction follows from src18 line 142, src18 line 167, src18 line 267 and src18 line 506; multiplicative local comparisons remain explicit targets rather than an extension silently attributed to Schneider.

## H02 (CBirkbeck) — applied

At TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:95 and line 1005, untwisted augmentation is replaced by the typed T_cc=T(f)(k/2) comparison, including the full-tower semilinear twist, original tame component ω^(−k/2), original evaluation κ^(−k/2), twisted Betti factor, fundamental line, zeta morphism, finite local condition and derived control; §5.4(2), line 1699, preserves both specialization cases using the required central-critical arithmetic endpoint. FW line 1241 and FW line 4044 support the twisted period and Selmer statements; TauCetiRoadmap/ModularIwasawaMainConjectures/Suggested.lean:29 records the missing modular carriers without substituting an abstract assertion.

## H03 (CBirkbeck) — applied

At TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:45, line 107 and §1.3, line 823, both source divisibilities now retain L_SU,h=c_h^+L_h, separately for f and its quadratic twist, and the full-symbol integral equality requires the named OrdinaryBettiSymbolUnit(h). The same correction is propagated through §1.5 (u_p/c_f^+ is the detected unit), the Hida source-period congruence, §1.7, §3.2 and downstream uses; SU line 1063, Skinner line 495, Skinner line 585 and Skinner line 697 fix the actual source normalization and do not establish an all-weight full-symbol unit comparison.

## H04 (CBirkbeck) — applied

At TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:597, line 663 and line 1561, ε(p)=1 is explicit in the LLZ nonvanishing, ordinary comparison, signed-equivalence and first-coordinate surjectivity packages, while the signed definitions continue to use the actual Frobenius and matrix for arbitrary nebentypus. LLZ line 760 states the source restriction, LLZ line 1804 and LLZ line 2524 give the affected results, and PadicHodgeRegulators §9.28 retains the distinction between its general matrix theorem and scalar specialization; the trivial-character applications retain their range.

## H05 (CBirkbeck) — applied differently

At TauCetiRoadmap/ModularIwasawaMainConjectures/README.md:9 and line 57, every numbered KatoEulerSystems and AutomorphicCongruences interface, including both whole base packages, is now explicitly a proposed contract conditional on publication and supply, with the direction KatoEulerSystems → AutomorphicCongruences → ModularIwasawaMainConjectures stated. The specifications at packages/KatoEulerSystems/README.md (5fb6ef4) and packages/AutomorphicCongruences/README.md (b047dd3) exist and their cited sections were inspected, but neither is a published supplier roadmap in the repository inventory; their publication and their inclusion in the public dependency/merge-order description remain prerequisites for the worker, since this job authorizes no supplier publication or PR-description edit.

## Source and ownership record

The repairs use the existing source keys and legal cached texts; no new source or manifest edit is needed. In particular:

| Source | Resolved evidence |
| --- | --- |
| src18 | line 142: torsion/divisible-quotient notation; line 167: good reduction above p; line 244: compact cohomology and pairing; line 267: degree-two duality; line 502: finite cotorsion calculation |
| FW | line 1241: critical twist range and twisted Betti/de Rham factors; line 1283: fundamental line; line 4044: rank-zero converse and its two cases |
| SU | line 1063: Betti period definition; line 1074: actual integral eigenlattice |
| Skinner | line 495: interpolation convention; line 533: period reference; line 585: ordinary equality; line 596: rank-one-quotient substitute; line 697: source-period Hida interpolation; line 709: ideal congruence; line 978: elliptic Betti/Néron comparison |
| LLZ | line 760: ε(p)=1; line 804: numerical assumptions; line 1804: surjectivity range; line 2477: continuation of the standing modular conventions; line 2524: signed nonvanishing and comparison |

Object searches covered main, the open-roadmap inventory and supplied sibling heads, the board specifications and the two pinned libraries. ArithmeticGaloisDuality D7.6 owns generic duality but not the corrected integral flat contract; ModularSymbolsPadicLFunctions §§0.4, 0.6, 0.8 and 1.1 own the boundary/coefficient-dual/period lattices and supply a rational comparison, not an all-weight integral splitting; PadicHodgeRegulators §§9.12, 9.26, 9.28–9.30 own the general Coleman coordinates, matrix and images; PhiGammaModulesAndIwasawaCohomology §§6.2–6.3 owns their Wach domains. The central-critical modular adapter and the transport of arithmetic endpoints remain here; their generic maps and arithmetic proofs remain with the named earlier owners. No construction moves from a later roadmap, and no Lean declaration takes another readable roadmap’s fully qualified name.

The repository citation resolver still reports the two proposed owners absent from its main/open index, exactly as the README now states. Main at cbb46c8 differs from the resolver’s c44faf6 only in OptimalTransport status/progress files, so its roadmap specifications coincide; the inspected public owner heads include ModularSymbolsPadicLFunctions 62f31bc, ArithmeticGaloisDuality 09ad340 and PadicHodgeRegulators 1a3728e. This check includes ownership against the supplied open pull requests, rather than treating the board inventory as a published dependency graph.

Mathlib was inspected at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Mathlib/RepresentationTheory/Invariants.lean:73 defines fixed vectors by their action, without continuity or finite-dimensionality, while Mathlib/RepresentationTheory/Continuous/Basic.lean:54 bundles continuous operators without continuity in the group variable; the roadmap carries the latter separately. Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56 excludes fields and requires a local domain; TauCeti/AlgebraicGeometry/EllipticCurve/TateCurve/Specialization.lean:70 supplies the native Tate curve used in the acceptance theorem. The generic Tate-twist, finite two-descent Selmer and modular-symbol carriers do not supply the missing modular Iwasawa complexes, zeta morphisms or integral signed period comparisons.

## Elaborated signatures

A scratch copy of the final acceptance file was elaborated once with #check @name for all four declarations, and each elaborated type was compared with its README statement. No binder was dropped and no signature changed: HasRankOneCoinvariants keeps its ring/module instances; hasRankOneCoinvariants_of_unipotent keeps the domain, DVR, square-zero and primitive-image hypotheses; sl2Zp_closedSubgroup_eq_top keeps primality, p≥5, closedness and reduction-surjectivity; tateParameter_transcendental_of_isAlgebraic_j keeps primality, the unit parameter, strict norm bound and algebraic j hypothesis. Suggested.lean changed only its account of the unavailable headline carriers.

## Adversarial mathematics pass

Here R=O[[X]], ϖ is a uniformizer, and lengths are taken at the indicated height-one prime. Algebraic models test the comparison laws; they do not assert the existence of a newform with arbitrarily prescribed period ratios. Each changed mathematical assertion and each retained Lean declaration is covered below.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Flat duality: (Div H)^∨=M/Tor M | H=ℚ_p/ℤ_p; H=ℤ/p²; H=(ℚ_p/ℤ_p)⊕ℤ/p | Respectively ℤ_p=ℤ_p; 0=0; ℤ_p=ℤ_p; old Tor M would give 0, ℤ/p², ℤ/p | Pass; old identification fails | Free quotient replaces torsion subgroup |
| Flat duality: (H/Div H)^∨=Tor M | Same three groups | Respectively 0=0; ℤ/p²=ℤ/p²; ℤ/p=ℤ/p | Pass | Correct finite cotorsion term |
| Whole compact dual H^∨=M in Schneider's range | H=(ℚ_p/ℤ_p)⊕ℤ/p | H^∨=ℤ_p⊕ℤ/p; quotient has rank 1, torsion order p | Pass | Good reduction above p retained from src18 line 167; multiplicative local terms separate |
| Component/finite errors in §3.8 | Multiplication by p on ℤ_p; A=0 | Kernel 0, cokernel ℤ/p of order p; zero variety gives H=M=0 | Pass | Finite error is not an isomorphism; zero case retained |
| Source versus full-symbol interpolation | P_f=cP_SU, common numerator A | A/P_SU=c(A/P_f); c=ϖ yields ϖX versus X, c=2 yields 2X versus X | Pass | Define L_SU and retain c |
| Source versus full-symbol Néron transport | P_f=2P_SU, P_SU=3Ω_E | (P_f/Ω_E)L_f=6L_f=(P_SU/Ω_E)L_SU=3·2L_f | Pass | Both elliptic formulas explicit |
| OrdinaryBettiSymbolUnit | c=ϖ, 2, ϖ⁻¹ | v_ϖ(c)=1,0,−1; ideal shifts +1,0,−1 when functions are integral | Pass | Exact unit hypothesis defined |
| Betti comparison commutes with depletion | L_f=X, E=1−2X, c=ϖ; Σ empty | L_SU^Σ=ϖX(1−2X)=cL_f^Σ; empty product gives ϖX | Pass | Same scalar for every Σ |
| Independent quadratic-twist scalar | L_f=L_fK=X; c_f=ϖ, c_fK=1 | Source product ϖX²; uncorrected product X²; lengths at (ϖ) are 1 and 0 | Pass | Both factors retained |
| Kato source-period inclusions in §1.3 | Ch(f)=Ch(fK)=(ϖX); both source functions ϖX | Individual inclusions are equalities; product is (ϖ²X²)=(ϖ²X²) | Pass | Imported upper bounds use source periods |
| Automorphic reverse product in §1.3 | Same model, both c=ϖ | Correct reverse ideal (ϖ²X²); uncorrected ideal (X²) has length 0 rather than 2 at (ϖ) | Pass | Reverse bound uses source periods |
| Product assembly at height one | Kato lengths a≤A, b≤B and reverse A+B≤a+b; (a,b,A,B)=(1,2,1,2) | 3≤3; strict A=2 gives 4≤3, false | Pass | Assemble before period transport |
| §1.3 corrected equality and full-symbol iff | Ch=(ϖX), L_f=X, c=ϖ; c=2 | Correct ideals (ϖX)=(ϖX); full-symbol ideal (X) differs; unit case (2X)=(X) | Pass | Full-symbol result conditional, rational result unchanged |
| §1.5 KMC versus source ordinary equality | u=c=ϖ, L_f=X; u=1,c=ϖ | First gives (uL_f)=(cL_f)=(ϖX), u/c=1; second gives (X)≠(ϖX), u/c=ϖ⁻¹ | Pass both directions | Compare u/c, not u alone |
| §1.5 rational consequence | u=c=ϖ in R[1/ϖ] | (ϖX)=(X); μ shifts disappear | Pass | Integral and rational conclusions separated |
| Hida source-period congruence | L_SU,f=L_SU,f_m=ϖX; c_f=ϖ,c_f_m=1 | Source ideals coincide modulo p^m; full-symbol ideals (X,p^m) and (ϖX,p^m) differ | Pass | Separate source-period output |
| Hida full-symbol conditional congruence | C_0=C_m=O; C_0=O,C_m=(ϖ) | Unit case corrected ideals equal uncorrected ideals; nonunit case X versus ϖX differs by μ=1 | Pass | Unit condition moved into assertion (c) itself |
| Multiplicative source assembly | All approximant source functions ϖX, Ch_m=(ϖX) | Every congruence gives (ϖX,p^m); intersection over m gives (ϖX), not (X) | Pass | §1.7 retains c_f and uses source congruences |
| Multiplicative trivial zero after transport | α=1; α=−1 | Source/full values both 0 when α=1; Euler factor 2 when α=−1, unchanged by nonzero c | Pass | No change to reduction-type range |
| Irreducible elliptic Betti/full-symbol unit | P_f/Ω_E=2, P_SU/Ω_E=3 at p=7 | c=2/3, v_7(c)=0; both Néron expressions equal | Pass | Two comparisons distinguished; no all-weight inference |
| Central-critical lattice determinant | k=2, κ(g)=4 | Untwisted det=1/4; det(T(f)(1))=4^(−1+2)=4 | Pass | T_cc introduced explicitly |
| Central-critical discrete quotient | Rank-one model T=ℤ_p⊂ℚ_p, twist r | A_cc=ℚ_p/ℤ_p as group, action multiplied by κ^r; κ=4,r=1 gives action 4 rather than 1 | Pass | Coefficients, not just group carriers, transported |
| Full-tower twist equivariance | κ(g)=4, r=0,1,2 | κ^r·tw_r([g]⁻¹) coefficient is 1, 4·1/4=1, 16·1/16=1 | Pass | tw_r-semilinear map with named source/target |
| Tame-component transport | p=5, δ=−1; r=1,2 | Old tame evaluations −1 and 1, respectively; untwisted augmentation gives 1 in both | Pass | ω^(−r) component required |
| Γ evaluation before transport | p=5, κ(γ)=6; r=1,2 | Evaluations 1/6 and 1/36, versus augmentation 1 | Pass | κ^(−r) rather than unshifted augmentation |
| Twisted Betti factor | r=1,2 | O(r−1) conjugation signs +1,−1; factors select T^+,T^−; old O(−1) selects T^− in both | Pass | T(f)(r−1)^+ retained |
| Central fundamental line and zeta transport | H¹=Re, H²=R/(X), z=Xe | Zeta and H² divisors both 1, inverse-line divisor 1−1=0 | Pass | Equality required on C_cc with its Betti factor |
| Central specialization, vanishing case | H¹=Re, z=Xe, H²=R/(X) | z mod X=0; both ideals (X); H²/X=O has rank 1 | Pass | First corank case uses twisted control |
| Central specialization, nonvanishing case | H¹=Re, z=e, H²=0 | z mod X=e≠0; both ideals (1); degree-two rank 0 | Pass | Reciprocity, separately required, places e in H¹_f |
| Central nonzero-value direction | Finite discrete Selmer ℤ/p² versus a nonzero ℚ_p-vector line | Discrete coranks 0 and 1 for ℤ/p² and ℚ_p/ℤ_p; ℚ_p has infinite cardinality | Pass | Finiteness remains a discrete Selmer claim |
| Ordinary rank-zero vanishing and period scalar | E=11a1,p=7, α mod 7=5 | α⁻¹=3 mod 7; (1−α⁻¹)²/5=5 mod 7≠0; multiplying by any nonzero c preserves zero/nonzero over ℚ_p | Pass | Proof cites source Betti equality |
| General signed definition versus LLZ theorem range | p=5,k=2,a_p=0, ε(p)=±1 | Frobenius trace 0 in both; determinants +5 and −5 | Pass | Definitions retain actual matrices; theorem requires ε(p)=1 |
| Signed orthogonal local condition | Pairing on O², ker Col₁=Oe₂; ker=0 | Annihilator is Oe₁ in the first model, full O² in the second | Pass | General definition retained |
| LLZ ordinary source comparison | ε(p)=1, multiplier ū=2 at odd p | L_α=2L_2; (2L_2)=(L_2) rationally; determinant εp^(k−1) unchanged | Pass | ε(p)=1 explicit in ordinary comparison |
| LLZ exact-sequence/nonvanishing package | I=XR,L=X², H¹/Z=R/(X), H²=0 | I/(L)=R/(X), both characteristic lengths 1; replacing I by R gives length 2 | Pass | Source hypothesis restored; image term retained |
| LLZ §0.13 integral/rational distinction | Same model scaled by ϖ | Integral quotient can gain length 1 at (ϖ); after inversion that length is 0 | Pass | (E) and rational alternative retained with ε(p)=1 |
| LLZ §4.4 numerical hypotheses | p=5,k=2,a_p=0 | (B) index set empty; v_p(0)=∞>0; 5≥1; determinant is still ±5 according to ε | Pass | Numerical tests do not replace ε(p)=1 |
| LLZ first-coordinate image witness | p=5,k=2,a_p=0, trivial component | 2·2=4·1=4 at vector (1,2); ρ(1,2)=0; ρ(1,0)=4≠0 | Pass | Matrix and nebentypus retained |
| LLZ elliptic integral images | p=5, trivial/nontrivial η | Σδ projects to 4 or 0; Im Col₂ is R or XR respectively | Pass | Integral image computation unchanged |
| Trivial-nebentypus applications | 14a1,p=5; 11a1,p=7 | ε(p)=1 in both; a_5=0 and a_7=−2; hence restored hypothesis holds | Pass | Applications retain their range |
| HasRankOneCoinvariants | u=[[1,1],[0,1]], u=1, u=[[1,ϖ],[0,1]] | Quotients O, O², O⊕O/(ϖ); truth values true,false,false over a DVR | Pass | Lean definition unchanged |
| hasRankOneCoinvariants_of_unipotent | O=ℤ₂,ℤ₃,𝔽₂[[t]]; standard u | N²=0 and image=Oe₁ primitive; cokernel O in all three | Pass | Explicit DVR/domain/primitive-image binders retained |
| Unipotent negative controls | Identity; upper-right ϖ; g=[[1,1],[ϖ,1+ϖ]] | Identity has N=0; second image⊂ϖO²; third det(g−1)=−ϖ≠0 | Pass | Each excluded by the required hypothesis |
| sl2Zp_closedSubgroup_eq_top | H=SL₂(ℤ₅), H=1; p=3 quaternion control | Reduction orders 120 and 1; at p=3 quaternion image order 24=3(3²−1) but subgroup finite | Pass | Closedness and p≥5 retained |
| tateParameter_transcendental_of_isAlgebraic_j | q=p at p=2,3; q=0,1 | Norms 1/2,1/3; algebraic q forces transcendental j by cited theorem, so hj fails; 0 excluded by units, 1 by strict norm bound | Pass | Every prime retained, no stand-in added |

## Validation

Commit: e954663f — ModularIwasawaMainConjectures: review repairs (flat duality, central twists, period scalars, LLZ hypotheses, supplier status).

Dependency-check output:

```text
depcheck: 48 roadmaps, 552 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The worktree is clean and nothing was pushed.

Build command: lake build TauCetiRoadmap.ModularIwasawaMainConjectures.Suggested.

Exact build outcome: Build completed successfully (8983 jobs). Exit status 0; the three headline theorems emit only their expected declaration-uses-sorry warnings at Suggested.lean lines 50, 62 and 72.

Final gate summary (exit status 0):

```text
gate ModularIwasawaMainConjectures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
