<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/999#issuecomment-6430980412 -->
Red team round 1 pass a (codex) of 83b8a2b

Verdict: needs_changes

1. **F01** (P1) The Fontaine–Laffaille supplier has the opposite realization convention

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:449`, also 403, 453, 613–617 and 707: “For v | p, R_v is the framed Fontaine–Laffaille deformation ring ... τ-weights {0, …, n − 1}”.

   **Claim:** LocalGaloisDeformationRings §§1.6 and 1.13 directly supply the positive-weight local problem used throughout the roadmap.

   **Witness:** `TauCetiRoadmap/LocalGaloisDeformationRings/README.md:1405` realizes jump i with weight −i. Its explicit check at 1422 distinguishes O⊕O(ε⁻¹), weights {0,−1}, from its dual, weights {0,1}. At p=5 their inertia characters ε̄³ and ε̄ differ.

   **Exact repair text:** Add to §1.2: “Define D_v⁺(A) by requiring the dual lift r_A∨ to satisfy LocalGaloisDeformationRings §1.6 with labelled jumps 0,…,n−1 and determinant ξ⁻¹. Dualize the chosen frame as well. Duality gives an involutive equivalence of these deformation problems, preserving coefficient change, representability and formal smoothness; transport §1.13 through this equivalence. Throughout this roadmap D_v and R_v mean this positive-weight problem and its representing ring.” Use this definition in §§1.1, 1.7 and 2.2, and explicitly identify it with PadicHodgeTheory §6.1’s contravariant convention.

   **Repair test:** At p=5, dualizing O⊕O(ε) gives O⊕O(ε⁻¹), with jumps {0,1} in the cited supplier. Dualizing back restores weights {0,1} and determinant ε. The dimension count is unchanged.

2. **F02** (P1) Ordinary operator colimits do not remove topologically nilpotent factors

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:1116`: “the colimit C_t = lim t^k C is a perfect direct summand computing the localized homology”.

   **Claim:** An integral perfect complex can be localized to its finite selected Hecke summand by the ordinary direct limit of powers of the separating operator.

   **Witness:** Set Δ=1, C=O[0], t=ϖ. Then colim(C,t)=E[0], whereas lim t^(k!)=0. E is not finite over O. IntegralHeckeAndGaloisDeterminants §2.3 requires actual complementary nilpotence; completeness gives only topological nilpotence here.

   **Exact repair text:** Replace the colimit step by: “For the actual lifted endomorphism t of the perfect S_N-complex C, form the factorial-power idempotent e in the finite complete O-algebra O[t] inside End_D(S_N)(C). Split e in the category of perfect S_N-complexes. This selected direct summand has the required localized homology and compatible coefficient base changes. An ordinary integral telescope is not used.” Cite IntegralHeckeAndGaloisDeterminants §2.3 for factorial powers and IntegralHeckeAndGaloisDeterminants §2.2 for specified idempotent summands and DerivedModuleAlgebra §1.E.0 for closure of perfect complexes under retracts. Keep the already supplied localized arithmetic perfect model as the starting object.

   **Repair test:** For t=ϖ on O, e=0 and the selected summand is 0; for t=diag(1,ϖ) on O², e=diag(1,0) and the selected summand is O. The original colimit instead gives E and O⊕E. This also corrects the source error in CG18 Lemma 7.3.


3. **F03** (P3) Several line and page locators point away from the cited argument

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:281`, 325, 701, 886, 1096 and 1497; also the KT17 locator in `packages/AutomorphyLiftingBeyondTaylorWiles/sources.toml`.

   **Claim:** The accompanying line numbers and page ranges locate the specified projector, dévissage, Conjecture B discussion and derived comparison.

   **Witness:** CG18 line 3819 is p.391, not pp.394–395; dévissage is CG18 lines 4741–4743. CGH20 line 71 is p.2. KT17's comparison proof continues at line 1931, p.42, and Proposition 6.26 concludes at line 1984, p.43.

   **Exact repair text:** In §0.3 cite “CG18 §7.1, p.394, line 3926”; in §0.4 cite “CG18 §7.1, pp.394–395, lines 3926–3962”. In §2.1 point its p.3 discussion to “CGH20 lines 84–93”. In §2.6 use “CG18 §9.3, p.415, lines 4741–4743”. In §3.7 use “KT17 Lemma 6.25(4), statement p.41 and proof pp.41–42, lines 1904–1906 and 1931–1935”. Change the KT17 reference and manifest range to “§6.6, Lemma 6.25 and Proposition 6.26, pp.40–43”.

   **Repair test:** The replacement intervals contain the actual factorial projector, coefficient induction and derived-invariants comparison; the last interval now includes all three conclusions of Proposition 6.26. No mathematical claim changes.

4. **F04** (P3) The range Check silently discards groupoid cohomology above the manifold dimension

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:783`: “(a) asks vanishing in degrees 0 and 3 only.”

   **Claim:** For imaginary quadratic F and n=2, clause (a) has only those two vanishing requirements.

   **Witness:** Clause (a), line 753, also requires H⁴=0 because 4∉[1,2]. The conventions retain p-torsion stabilizers. H⁴(C₃,𝔽₃)=𝔽₃, whereas the coarse point has H⁴=0; dimension alone cannot remove this requirement.

   **Exact repair text:** “For imaginary quadratic F and n=2, clause (a) requires vanishing in every degree outside {1,2}. After applying the localized orbifold range contract under its non-Eisenstein, Galois-type and big-image hypotheses, this reduces to degrees 0 and 3.” Give the analogous qualification to the ℚ, n=2 Check immediately above it.

   **Repair test:** In degree 4 the repaired clause still requires zero. Under the separately supplied ambient-range theorem, H⁴=0 is already known, so the remaining tests are exactly H⁰=H³=0. The C₃ stabilizer control no longer gets discarded by a dimension argument.

5. **F05** (P3) Repeated and definitional Checks are counted as separate tests

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:309` and 319; 811 and 819; 851 and 859; 853 and 861; 882 and 884.

   **Claim:** These pairs are separate discriminating Checks of the projector, auxiliary comparison, hypothesis bundle and coefficient induction.

   **Witness:** Both projector rows compute (m_Q,e_Q)=(m,1) at Q=∅. Both comparison rows compute id. The two disk rows compute (H⁰_integral,H⁰_residual)=(0,k). The bundle repeats the identical empty-set and classical cases.

   **Exact repair text:** Keep one discriminating version of each repeated test: merge 167/175, 173/177, 217/223, 309/319, 425/437, 427/439, 429/441, 473/483, 479/481, 539/547, 729/739, 811/819, 813/821, 851/859, 853/861, 882/884, 1136/1142 and 1182/1192. Keep the explicit reflected-degree counterexample at 1196 in place of its repetitions at 1184 and 1186. Remove the bundle-projection tautology at 857. Add this discriminating bundle Check: “For T=k[ε]/ε² with M_top=k and M_inter=T, a scalar discrepancy ε has actions 0 and ε respectively; agreement on the top cover therefore does not satisfy ConjB's all-intermediate-level clause.” Keep the existing classical positive and Eisenstein negative controls.

   **Repair test:** The new control distinguishes the required simultaneous action from a top-cover-only replacement: the latter accepts ε, while the required equality rejects it because ε·1=ε≠0 on M_inter. Repeated values no longer inflate the Check count.

6. **F06** (P1) Determinant descent forgets the chosen real component

   **Location:** `packages/AutomorphyLiftingBeyondTaylorWiles/README.md:943`, 955, 967 and 982, against the K∞⁰ convention at 21. In particular: “Ĥ_a has determinant classes {1,−1}, so Φ_a=C₂”.

   **Claim:** The indicated full PGL₂ arithmetic groups and their C₂-invariants compute the component cohomology for the roadmap's connected-maximal-compact convention.

   **Witness:** For F=ℚ, maximal K and k=𝔽₃, Y is PSL₂(ℤ)∖ℍ with H²=k. The negative-determinant involution acts by −1 on H²(C₃,k); full PGL₂(ℤ) group cohomology therefore has H²=0.

   **Exact repair text:** “Choose a connected component ℋ⁺ of G(ℝ)/K∞⁰. In every component stabilizer and in Ĥ_a, impose the real-component condition explicitly: intersect with the subgroup of PGL₂(F) having positive determinant at every real place. Retain that condition in all conjugation and level maps. Define the determinant quotient from these restricted groups. Over ℚ at maximal finite level, the component group is PSL₂(ℤ), its determinant quotient is trivial, and the same holds for the vertex/edge quotients in §3.2.” Replace Checks 955 and 982 accordingly; the PGL₂(ℤ)/PSL₂(ℤ)=C₂ example can remain only as a separately labelled abstract group example. Explicitly adapt ArithmeticLocallySymmetricSpaces ALS.0.7's full-maximal-compact component formula before using it for K∞⁰.

   **Repair test:** PSL₂(ℤ)=C₂*C₃ gives H²(−,𝔽₃)=H²(C₃,𝔽₃)=𝔽₃. The corrected determinant quotient is 1, so its invariants remain 𝔽₃. Without the correction, determinant −1 conjugates the order-three generator to its inverse up to inner conjugation, giving invariants 0. Over imaginary quadratic fields there is no real-component restriction, so this repair leaves those calculations intact.

## Verified sound

Read all 1,497 README lines and all 54 Suggested.lean lines. The README has 43 numbered target sections; its bold labels mark Checks and references rather than additional named targets. Suggested.lean contains **0 declarations**, **0 section variables**, **0 instances**, **0 admitted data definitions** and **0 padding theorems**. Thus there are no elaborated signatures to compare and no signature elaboration was run. The file has the single required import and the required namespace and module explanation.

The source audit covers the 64 statement/proof locator entries recorded in the source inventory, using the three supplied legal text extractions. The page/line discrepancies are R03. All 238 bullets under explicit Checks labels, together with the additional local/coordinate controls, were read; the 77 computed statement/control rows below record the positive, negative and boundary controls actually evaluated rather than treating a source citation as a test. Repeated Checks are R05.

The supplier audit resolved 133 specifically numbered section locators at the current copies. The substantive comparisons included local/global deformation conventions, duality, the numerical presentation, groupoid finiteness/perfectness, cohomology-action patching, character-ring components, principal-series blocks, determinant kernels and spectral support. R01, R02 and R06 identify the mismatches found. The eleven declared gaps occur with the same slugs in the README and design plan, name suppliers and give their hypotheses. Their unimplemented conclusions are treated as conditional inputs, not missing-dependency findings.

The mechanical dependency check returned:

```text
depcheck: 56 roadmaps, 658 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The git diff against origin/main contains changes only within `packages/AutomorphyLiftingBeyondTaylorWiles/`. No package source, design, manifest or merge-order file was edited during this review; only this report and scratch notes were written. No Lean build or GitHub write was run.

### Native carriers and ownership

The pinned declarations inspected are Mathlib's `Field.absoluteGaloisGroup` (FieldTheory/AbsoluteGaloisGroup.lean:42), `Representation` (RepresentationTheory/Basic.lean:48), `IsHeckeTriple`, `HeckeCoset`, `HeckeRing` (NumberTheory/HeckeRing/Defs.lean:75, 157, 189), `Module.support_eq_zeroLocus` (RingTheory/Support.lean:216), `Monoid.PushoutI` (GroupTheory/PushoutI.lean:60), `groupCohomology.coindIso` (RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:58), and Tau Ceti's `TauCeti.MonoidAlgebra.augmentation` (Algebra/MonoidAlgebra/Exactness.lean:115). In particular `Representation` carries no continuity hypothesis; support equals the annihilator zero locus under finite generation; augmentation sends a basis singleton with coefficient a to a. These agree with the supplier contract.

Object searches were run through the roadmap CLI and across main, Completed, board packages and the supplied open checkouts. The local character rings are owned by LocalGaloisDeformationRings §2.15; generic support and patching by DeformationAndDerivedPatchingAlgebra; derived local-block comparison by SmoothRepresentationsOfLocalGroups SR.5.3; arithmetic complexes by ArithmeticLocallySymmetricSpaces. The reviewed package cites those owners and specializes their objects. Its arbitrary-number-field component calculations and all-intermediate-level paired arithmetic data have additional content beyond the CM-only lifting route. The stronger Res PGLₙ endpoint is explicitly distinguished from ModularityAndLanglandsExtensions §§2.7–2.8. No new fully qualified Lean name is declared here, so no Lean-name collision is possible.

### Headline inventory and statability

| README headline | Suggested.lean treatment | Pin-level obstacle |
|---|---|---|
| §1.3 corrected character/unipotent local-ring comparison | Named in module docstring | Arithmetic deformation rings and completed products |
| §1.6 numerical coincidence and auxiliary sets | Named | Relative Selmer groups, image detector and representing rings |
| §3.5 rank-two level comparison | Named | Arithmetic quotient cohomology, levels and selected ideals |
| §3.6 GLₙ distinct-root comparison | Named | Arithmetic smooth tower and block comparison |
| §3.7 PGLₙ descent | Named | Central descent and arithmetic derived invariants |
| §§4.2, 5.1 simultaneous patching and depth | Named | Actual arithmetic finite-cutoff data and actions |
| §§5.2–5.4 near faithfulness | Named | Minimal global ring acting on lowest-degree arithmetic cohomology |
| §5.5 R=T and freeness | Named | Arithmetic Hecke/deformation rings and their module |
| §5.6 cuspidal recognition | Named | Automorphic representations and arithmetic eigenspaces |
| §§5.7–5.8 support-to-eigenclass lifting | Named | Deformation point and the geometric action |
| §§5.9–5.10 applications | Named | Same arithmetic and automorphic carriers |

The corresponding carrier searches found algebraic representations, complexes and support, but not these arithmetic objects at the pins. Replacing them by an arbitrary complex or a free automorphy predicate would not state the headlines. No absent, presently statable headline or one-tactic padding declaration was found.

### Declaration context ledger

| File/section | Declarations | Variable and instance context | Computed audit result |
|---|---:|---|---|
| Suggested.lean, entire namespace | 0 | None | Required signatures to elaborate = 0; admitted theorems = 0; sorry'd data = 0; name collisions = 0 |

### Computed statement ledger

Here **S** denotes the standing context: n≥2, p>n, p unramified in F, a nonzero mixed-characteristic complete DVR O with finite residue field, nonempty framing set T, and the stated residual/deformation hypotheses where required. **B** adds the specified Conjecture B clauses; **G** adds exactly the declared supplier contracts, not their conclusions without hypotheses. Rows marked “conditional” validate the displayed calculation and implication, not a proof of an unimplemented supplier theorem. Definitions and their plausible wrong models are tested in the same rows.

| Statement and context | Instances tried | Computed values on the two sides / wrong model | Result and change |
|---|---|---|---|
| Conventions: PGL degree formula, S | n=2 over ℚ, imaginary quadratic, real quadratic; n=3 over ℚ | (d,q₀,ℓ₀)=(2,1,0),(3,1,1),(4,2,0),(5,2,1); in each case 2q₀+ℓ₀=d | Correct |
| Conventions: inadmissible boundaries | n=0,1; p=2; zero ring; equal characteristic; ramified F at p | n≥2 rejects 0,1; p>n rejects 2; O/ϖ=k a field rejects the zero ring; O⊂E finite over ℚₚ rejects equal characteristic; unramified hypothesis rejects ramification | Excluded, not silently evaluated |
| Conventions: arithmetic Frobenius and shift | n=2, norm 7, trace 3 | Arithmetic polynomial X²−3X+7; inverse has trace 3/7, determinant 1/7; normalized roots have product 1 and multiplying each by √7 gives determinant 7 | Correct; geometric normalization fails |
| Conventions: balanced oddness | n=2, k=𝔽₃, identity and diag(−1,1) | Identity eigendimensions (2,0), trace −1; diagonal eigendimensions (1,1), trace 0 | Balanced condition separates them |
| §0.1 local system and dual | χ(g)=ζₚ, χ=1; wrong same-character dual | χχ⁻¹=1, while χ²=ζₚ²≠1; χ reduces to 1 modulo ϖ | Correct |
| §0.1 pullback versus pushforward | C₃ acting by i↦i+1, f=δ₀ | Pullback vector (0,0,1); pushforward (0,1,0); pairing with δ₂ gives 1 versus 0 | Direction is discriminating |
| §0.2 unnormalized Hecke polynomial | n=3, norm 2, Satake roots 2,3,1/6 | T₁=31/3,T₂=41/3; polynomial coefficients (1,−31/3,82/3,−8); inverse-root system gives (1,−41/3,62/3,−8) | Correct q-powers and adjoint distinction |
| §0.2 same test modulo coefficients | Previous polynomial mod 25 and mod 5 | Mod 25: (1,23,19,17) versus (1,3,4,17); mod 5 both (1,3,4,2) | A residual-only test would miss the distinction |
| §0.2 determinant-one deck quotient | Block diag(a,B), scalar c; n=3 | det(B)a^(1−n) gains factor c^(n−1)c^(1−n)=1; diag(u,1,1) maps to u⁻² | Correct PGL coordinate |
| §0.3 simultaneous image | T=k[ε]/ε², M_top=k, M_inter=T | ε acts 0 on M_top but ε·1=ε≠0 on M_inter; ε²=0; degree-p cor∘res=p=0 | Top-cover image cannot replace simultaneous image |
| §0.3 coefficient dependence | O --ϖ→ O, degrees 0,1 | Integral (H⁰,H¹)=(0,k); mod ϖᵃ both groups have size card(k), for every a≥1 | Correct reason to retain every coefficient |
| §0.3 level-one control | ℚ,n=2,p>3,Q=R=∅ | Positive-degree cohomology of C₂*C₃ vanishes; H⁰=O/ϖᵃ, T_λ=1+λ | First Check's p>3 restriction is material |
| §0.4 factorial projector | k=𝔽₇, α=2, β=4, V=diag(2,4,1) | V−4 has residues (−2,0,−3); factorial limit diag(1,0,1), selected α-factor diag(1,0,0) | Correct eigenvalue condition; e need not equal the selected factor |
| §0.4 repeated root and empty set | P=(X−α)²; Q=∅ | Q_x(α)=0, selected-root projector kills α; empty product=1 and m_Q=m | Correct boundaries; repeated Check removed by R05 |
| §0.5 residual coefficients and adjoint | χ≡1 mod ϖ, χ(g)=ζₚ | Residual rank-one actions both 1; integral dual action ζₚ⁻¹, pairing 1 | Correct, no integral equality of χ and 1 asserted |
| §0.6 minimal Serre condition | Zero localized residual cohomology versus a one-dimensional class | Required lowest nonzero space has dimension 0 versus 1; zero class fails modularity datum | Nonzero requirement matters |
| §1.1 determinant and oddness | n=2,p=3, real conjugation | ξ(c)=−1; diag(−1,1) determinant −1; identity determinant 1 and unbalanced eigendimensions | Correct standing exclusions |
| §1.1 big-image boundary | Trivial residual subgroup, n≥2 | H⁰(ad⁰) has dimension n²−1>0; bigness fails | Trivial group excluded; no vacuous detector |
| §1.1 auxiliary characters | n=2,p=5, exponents 0,1 with mean 3 mod 5; n=3,p=5, exponents 0,1,2 with mean 1 | Adjusted exponents (2,3), sum 0; (4,0,1), sum 0. Wrong subtraction of n times mean in rank 3 gives (1,2,3), sum 1 | Correct determinant-one choice |
| §1.2 Fontaine–Laffaille problem | O⊕O(ε), n=2,p=5 | Desired weights {0,1}; cited covariant supplier realizes {0,−1}; residual nontrivial characters ε̄ versus ε̄³ | R01 |
| §1.2 smooth dimension | n=2, [F_v:ℚₚ]=2 | Relative dimension n²−1+f·n(n−1)/2=3+2=5; total dimension 6 | Correct once R01 is transported |
| §1.2 literal character-polynomial quotient | p=3,q=7, A=ℤ₃[[X]][a]/(a²,6a), Φ=diag(1+X,7/(1+X)), Σ=diag(1+a,1−a) | det Φ=7, det Σ=1, charpoly Σ=(Z−1)², Σ⁷=Σ; a[(1+X)−7/(1+X)] is nonzero and killed by 6 | Correct warning that the literal quotient need not be O-flat |
| §1.3 generic components versus torsion | Previous A; invert 3 | a becomes 0 after inverting 3, but a mod 3 is nonzero | Characteristic-zero minimal-prime assertion does not assert flatness |
| §1.3 residual comparison | χ_i≡1 mod ϖ | ∏(Z−χ_i) reduces to (Z−1)ⁿ on both sides | Correct literal residual-ring identification |
| §1.4 two-scalar nonsemisimple condition | n=3,k=𝔽₇, Frobenius diag(4,J₂(3)) | determinant 4·9=1; centralizer End dimension 1+2=3, ad⁰ dimension 2; unramified tangent 2 plus scalar-inertia direction 1 gives 3 | Extra tangent contribution 1, conditional on declared gap |
| §1.4 deck/inertia coordinate | n=3,p=5, Δ=C₅ | 1−n=3 mod 5; inverse exponent 2; (d³)²=d⁶=d. Omitting inverse gives d³≠d | Correct |
| §1.4 augmentation | θ=η=1, determinant relation θη^(n−1)=1 | Both sides 1, inertia trivial; augmented two-scalar problem is unramified | Correct, G |
| §1.5 framing | n=2, card(T)=1,2; attempted T=∅ | j=4·1−1=3, 4·2−1=7; empty T would give −1 and is excluded | Correct integer-first convention |
| §1.6 generator coincidence | n=2, imaginary quadratic, q=3,t=1; real quadratic,q=3,t=1 | Imaginary g=q+t−4=0,j=3,dim=1+q+j−1=6; real g=q+t−3=1,j=3,dim=7 | Both local dimension plus g and patched dimension agree |
| §1.6 auxiliary sets | q=0 only if relevant dual Selmer dimension 0; N≥1 | Empty set has size 0 and kills a zero-dimensional group; one-dimensional dual Selmer requires q≥1 | Quantifiers exclude impossible empty selection |
| §1.7 lift has type | v∉p∪R, trivial inertia; regular unipotent inertia J₂(1) | Unramified inertia 1; J₂(1)−1 has rank 1 and square 0; its characteristic polynomial is (X−1)² | Away-p translation correct; p-adic translation requires R01 |
| §1.8 GL₁ defect | ℚ, imaginary quadratic, real quadratic | r₁+r₂−1=0,0,1; Selmer minus dual dimensions=0,0,−1 | Correct using the supplier's U_Q including K∞ |
| §1.8 unramified ring | Class p-part trivial or C₃, O=ℤ₃ | Ring O or O[C₃], O-ranks 1 or 3; modulo 3, t³−1=(t−1)³ | Correct; no extra free component parameter |
| §2.1 Galois normalization | n=2, norm 2,k=𝔽₇ | Required determinant 2; inverse/geometric convention gives 1/2=4 | Wrong normalization rejected |
| §2.1 residual versus completed action | T=k[ε]/ε² | ε maps to 0 in residue k but is nonzero in T | Residual reconstruction does not assert honest local compatibility |
| §2.2 all-level diamond clause | Same T,M_top,M_inter as §0.3 | Discrepancy ε is invisible on top and nonzero on intermediate; p·id=0 gives no injection | Correct strengthened hypothesis |
| §2.2 empty Q | Q=∅, R arbitrary | Clauses (2),(6) have zero places; clauses (1),(3) remain | Correct empty-set reduction |
| §2.3 range | Imaginary quadratic n=2; ℚ n=3; CM quartic n=2 | Allowed degrees {1,2}; {2,3}; {2,3,4}; respectively (d,q₀,ℓ₀)=(3,1,1),(5,2,1),(6,2,2) | Correct formulas; R04 for high-degree Check |
| §2.3 Eisenstein negative control | Level-one trivial coefficient class | H⁰ dimension 1, but 0∉[q₀,q₀+ℓ₀] | Vanishing condition fails as claimed |
| §2.4 selected-factor comparison | Q=∅; rank-two old space with two distinct roots | Empty composite=id; old dimension 2, selected eigenspace dimension 1 | Projection is essential; R05 duplicate removed |
| §2.5 conjunction | Boolean clause vectors (1,1,1,1), (1,1,0,1) | Full conjunction 1 versus 0; omission of vanishing gives 1 in both | No converse without range hypothesis; R05 improves test |
| §2.6 coefficient induction | 0→k→O/ϖ²→k→0; maps compatible in all degrees | Lengths 1,2,1; disk residual H⁰=k versus integral H⁰=0 | Exact induction valid in all degrees; isolated-degree shortcut fails |
| §2.7 surjection and diamonds | n=3, Δ=C₅; scalar relation at every coefficient | Deck d³ corresponds to θ(d); inverse exponent recovers θ(d²) for d; augmentation sends each d to 1 | Correct ring coordinate, conditional on B |
| §2.8 small-rank dual degrees | n=3/ℚ, d=5; n=2/CM quartic,d=6 | Duals of H⁰,H¹ lie in degrees (5,4) and (6,5), leaving {2,3} and {2,3,4} | Correct use of d−i, conditional on range/H¹ gaps |
| §3.1 determinant kernel | Γ=h PSL₂(ℤ)h⁻¹, h=diag(2,1); A=[[1,2],[0,1]], γ=[[1,0],[1/2,1]] | detΓ=1 so kernel=Γ; γAγ⁻¹=[[0,2],[−1/2,2]]∉PSL₂(ℤ), so Γ∩PSL₂(ℤ) is not normal | Correct replacement for source's false kernel |
| §§3.1–3.2 real-component descent | ℚ, maximal finite level, k=𝔽₃ | K∞⁰ quotient: H²(PSL₂(ℤ),k)=k; full determinant C₂-invariants: k^{−1}=0 | R06; retain the positive real component |
| §3.1 finite quotient invariants | C₂ swaps k², k=𝔽₃; k=𝔽₂ | Average of (1,0) is (2,2), fixed; at p=2 averaging denominator 0 and H¹(C₂,k)=k | Correct odd-p restriction |
| §3.2 nonprincipal auxiliary prime | F=ℚ(√−5), x=(7,3+√−5) | Norm x=7; a²+5b²=7 has no integer solution; both adjacent-vertex indices=8 | Local tree works without a global generator |
| §3.3 squared translation | Tree valence q+1, q=7 | Distance-two vertex sum has q(q+1)=56 terms; terminal-edge translate has q²=49 terms | Coarse degree is not the chain-map scalar |
| §3.4 chain-map and normalization | Oriented edge v₁→v₀; F(v₁)=A₁(v₁)−qv₁, F(v₀)=A₂(v₀)−qA₁(v₀)+v₀ | Augmentations both 1; boundary equals A₂(v₀)+v₀−A₁(v₁)−qA₁(v₀)+qv₁. At q=7 mod 9, 49=4 but normalized q⁻²=7 | Correct scalar/degree distinction |
| §3.4 Laurent roots | Norm 7, p=3, roots i,−i in 𝔽₉ | Product=1; both squares=−1=2≠1 | Square-root criterion works without roots in 𝔽₃ |
| §3.5 Gram determinant | q=29,p=7, roots 2,4; repeated root 1 | (q+1)²−(2+4)²=4−36=3 mod 7; α²−1=3; repeated root gives 0 | Unit criterion and selected localization correct |
| §3.6 tower invariants | U=ℤₚ, trivial k; continuous coinduced C_cts(U,k) | Trivial module H⁰=k,H¹=k; coinduced H⁰=k,Hⁱ=0 for i>0 | Invariants alone cannot replace derived comparison |
| §3.6 admissibility/blocks | n=3,p=7, residual roots 1,2,4 versus 1,1,1 | Product=1 in both; Q(1)=3≠0 for first, 0 for second | Simple-root condition is genuinely additional |
| §3.7 central descent | Central Cₚ with k coefficients | H⁰(Cₚ,k)=k and H¹(Cₚ,k)=k; deleting center removes the latter | Correct retention of derived central contribution |
| §3.7 iterated block hypotheses | Q={x,y} | Pairs (x,∅),(x,{y}),(y,∅),(y,{x}): 4 conditions versus 2 minimal-level conditions | Correct quantifier order |
| §4.1 localization | C=O[0], t=ϖ; C=O²[0],t=diag(1,ϖ) | Telescopes E and O⊕E; factorial summands 0 and O | R02 |
| §4.1 minimal complexes | O --1→ O versus O --ϖ→ O | First is contractible, minimal ranks (0,0); second has residual differential 0, minimal ranks (1,1) | Correct residual-amplitude test |
| §4.1 ghost action | C=k[0]⊕k[1] over O | Ext¹_O(k,k)=k gives a nonzero off-diagonal derived endomorphism with square 0 and zero action on cohomology | Correct distinction between cohomology and derived actions |
| §4.2 reflected grading | q₀=ℓ₀=1 | T⁰=H²∨, T¹=H¹∨; source formula H^(i−ℓ₀)∨ instead gives 0,H⁰∨ | Corrected grading |
| §4.2 nonzero residual model | Minimal modularity provides dim H^{q₀}>0 | Top residual rank positive; zero complex would have rank 0 and depth conclusions unavailable | Nonzero hypothesis retained |
| §4.3 framing-quotient comparison | Maps (X,Z)↦(x,z) and (x+z²,z) | At z=0 they agree; modulo ϖ their X-values differ by z²≠0 | Correct need for framed residual linearity |
| §4.3 top cohomology base change | Two-term complex with final cokernel | coker(d)⊗A=coker(d⊗A); for kernel of O --ϖ→ O, reduction changes 0 to k | Correct restriction to top cohomology |
| §4.4 mixed coefficient quotients | O[[z]]/(ϖ²,z²,ϖz) | Underlying O-module O/ϖ²⊕kz; quotient by z can create a lower cohomology group | All finite modules/framing quotients are needed |
| §4.4 cutoff indexing | Original datum M≥N≥0; N=0 | Scalar map still comes from φ_M; φ₀ is not among supplied maps | Corrected indexing retained |
| §5.1 depth/concentration | S=O[[x]], P=[S --x→ S], ℓ₀=1 | H⁰=0,H¹=S/(x), dimS=2, depth=1=2−1, projective dimension 1 | Correct codimension calculation with nonzero complex |
| §5.2 near faithfulness versus faithfulness | A=O[ε]/ε², M=O=A/(ε) | Ann(M)=(ε)≠0, Ann(M)²=0; support is all Spec A | Correct nilpotent-kernel conclusion |
| §5.3 component transfer | A=O[[x,y]]/(xy), M=A/(x) | ϖ is regular on M, but support V(x) misses generic point of V(y) | O-torsion-freeness alone is insufficient; component hypothesis retained |
| §5.3 special-fibre linearity | Same framed maps as §4.3 | Equal after augmentation, unequal modulo ϖ before augmentation | Paired-patching gap is needed, not a redundant supply |
| §5.4 global near faithfulness | A=O[ε]/ε²→O with nonzero module O | Kernel (ε) is nilpotent, not zero; every prime contains ε | Correct distinction from R=T |
| §5.5 smooth R=T and freeness | Regular local R, M=R^a | a>0 gives Ann(M)=0; a=0 gives Ann(M)=R | Nonzero residual modularity excludes false zero-rank conclusion |
| §5.6 residual Speh obstruction | Speh(σ,2), rank σ=2, norm 1 mod p | Residual roots a,a,b,b; every multiplicity≥2, so no simple eigenvalue | Contradicts big-image detector at the chosen Frobenius |
| §5.6 proper support | Isobaric decomposition n=n₁+n₂, n₁,n₂>0 | Residual semisimplification has invariant subspace dimension n₁, strictly between 0 and n | Absolute irreducibility excludes it; boundary/residual alternative is G |
| §5.7 lowest-degree eigenclass | A class only in degree q₀+1 | Total cohomology dimension 1, lowest-degree dimension 0 | Correct need for an actual q₀-class |
| §5.8 support at a point | R=O[[X]], x_r:R→O′, X↦0, O′ finite proper over O | R/ker(x_r)=O, not O′; fraction image E⊂E′. A finite module with full support has nonzero fibre by Nakayama | Correct field enlargement, no false surjectivity to O′ |
| §5.9 imaginary quadratic count | F=ℚ(i), n=2,R=∅,q=3, p=5 or 7 | p=5: t=2,g=1; p=7: t=1,g=0; ℓ₀=q₀=1 | Correct specialization of the Conjecture B route |
| §5.10 defect zero | n=2, F totally real degree d=1,2 | ℓ₀=0,q₀=d; complex has a single degree; generator count g=q+t−1−d | Correct; arbitrary-rank p=2 claim is not made |

## Not verifiable

- The eleven named supplier gaps are declared contracts. This pass checks their placement, hypotheses and use, not the existence of proofs of their requested theorems. In particular, torsion-stabilizer perfectness and duality are not inferred from the unlocalized manifold theorems, and the paired action comparison is not inferred from an augmentation-only comparison.
- CGH20 was checked in the explicitly cited arXiv v1 text. The optional crosswalk to published appendix numbers A.2–A.4 was not certified against a published-layout copy. The mathematical locators used in the audit are the v1 theorem, lemma and page numbers. No additional work or missing source key was invented for the same paper.
- The sources service also checked the published CG18 correction (Inventiones Mathematicae 227 (2022), pp.855–856). It resolved only to a paywalled publisher and returned `uncertified`. Its contents and the correspondence between its corrections and the errors listed below were not guessed.
- No claims of full formal proof or Lean elaboration are made: this is a source, signature and counterexample audit, and the submitted Lean file has no declarations. The abstract analytic, arithmetic-cohomological and deformation carriers are still planned library work.
- Ownership was searched at the supplied open checkout folders and through the requested roadmap index for named suppliers. Open work outside those supplied folders was not independently audited for ownership. No claim is made about unpublished manuscripts or future supplier revisions.

## Source issues

- **Error** in CG18 at Lemma 6.2, printed p.385 (CG18 line 3581): the source says the codimension bound applies to every perfect complex in the stated range; it should be restricted to nonzero complexes, since the zero complex has no first nonzero cohomology; affects a stated result.
- **Error** in CG18 at Theorem 6.3, printed pp.386–387 (CG18 lines 3613–3616): the source says an arbitrary module H and possibly zero residual complex suffice; it should be restricted to finite complete H and a nonzero residual model; H=E/O has all H/ϖⁿ=0 but H≠0; affects a stated result.
- **Misprint** in CG18 at Theorem 6.3(d), printed p.386 (CG18 line 3636): the source says the relevant kernel is ker φ_N, including N=0; it should be ker φ_M, indexed by the original datum, since φ₀ was never supplied; affects the proof.
- **Error** in CG18 at Theorem 6.3 proof, printed p.388 (CG18 line 3694): the source says cohomology commutes with every indicated framing quotient; it should be justified using coefficient-natural actions on all finite coefficient modules; I=(z²,ϖz) creates H⁰=kz in the disk O--ϖ→O; affects the proof.
- **Misprint** in CG18 at Lemma 7.2 proof, printed p.393 (CG18 lines 3878–3880): the source says the complex correspondence passes through K″ and then K′; it should be K′ followed by K″, matching the preceding homology correspondence; affects the proof.
- **Error** in CG18 at Lemma 7.3, printed p.393 (CG18 lines 3896–3901): the source says ordinary operator colimits discard topologically nilpotent factors and remain perfect; it should be formulated using the factorial idempotent summand or actual complementary nilpotence; colim(O,ϖ)=E; affects a stated result.
- **Error** in CG18 at Lemma 7.4, printed p.394 (CG18 lines 3913–3916): the source says the ordinary cohomology range bounds minimal free-complex length; it should be a bound using derived residual-fibre amplitude; O--ϖ→O has one integral cohomology degree but requires two free terms; affects a stated result.
- **Misprint** in CG18 at §8.2, printed p.402 (CG18 line 4215): the source says the dual-Selmer denominator uses the trivial coefficient F_p; it should be μ_p, the Tate dual appearing in the subsequent calculation; affects the proof.
- **Error** in CG18 at §8.2, printed p.403 (CG18 line 4262): the source says components form the exponent-pⁿ quotient of the ray class group; it should be an extension retaining the ordinary class-group quotient; for Q=∅, F=ℚ(√−23), p=5, components include C₃; affects a stated result.
- **Misprint** in CG18 at §8.4, printed p.405 (CG18 lines 4341–4343): the source says the defect uses rank over ℝ; it should be absolute ranks of complexified real Lie algebras; split real ranks give 1 instead of 0 for SL₂(ℝ)/SO₂; affects a stated result.
- **Error** in CG18 at §8.4, printed p.406 (CG18 lines 4370–4374): the source says trace in {−1,0,1} ensures the displayed real-place adjoint dimensions in every odd characteristic; it should be a balanced-eigenspace-multiplicity condition; identity on 𝔽₃² has trace −1 and three adjoint invariants, not one; affects a stated result.
- **Error** in CG18 at Lemma 8.2(1), printed pp.407–408 (CG18 lines 4440–4442): the source says the literal inertia-characteristic-polynomial rings are coefficient-torsion-free; it should be a statement distinguishing literal rings from their coefficient-flat quotients; the square-zero q=7,p=3 example in the ledger has nonzero coefficient torsion; affects a stated result.
- **Error** in CG18 at Lemma 8.2(3), printed p.408 (CG18 line 4448): the source says the character-deformed spectrum is irreducible under the stated unramified residual hypothesis; it should be restricted to trivial residual local representations for this component assertion; distinct residual Frobenius lines allow distinct assignments of distinct inertia characters; affects a stated result.
- **Misprint** in CG18 at Remark 9.3, printed p.415 (CG18 lines 4749–4751): the source says the additional vanishing degree dual to H¹ is q₀−1; it should be d−1; for PGL₃/ℚ this is 4, whereas q₀−1=1; affects a stated result.
- **Misprint** in CG18 at Lemma 9.6 proof, printed p.416 (CG18 line 4794): the source says the displayed Gram determinant is T_x²−(q+1)²; it should be (q+1)²−T_x²; the unit test is unchanged by the sign; affects nothing.
- **Error** in CG18 at Lemma 9.6 proof, printed p.417 (CG18 line 4823): the source says Γ∩PSL₂(O_F) is a normal subgroup of the conjugated component group; it should be the kernel of determinant squareclass; the conjugated PSL₂(ℤ) matrix example in the ledger disproves normality; affects the proof.
- **Misprint** in CG18 at Lemma 9.6 proof, printed p.418 (CG18 line 4845): the source says Hⁱ⁻¹ of the amalgam precedes the degree-i vertex groups; it should be Hⁱ of the amalgam, preceded by Hⁱ⁻¹ of the edge group; affects the proof.
- **Error** in CG18 at Lemma 9.6 proof, printed p.418 (CG18 lines 4862–4865): the source says the compatible unnormalized amalgam action has scalar q² and normalized scalar 1; it should be augmentation scalar 1 and normalized scalar q⁻² for the stated oriented-chain correspondence; affects the proof.
- **Misprint** in CG18 at Lemma 9.6 proof, printed p.418 (CG18 line 4873): the source says ordinary powers converge to the selected projectors; it should be factorial powers; a unit of residue −2 in 𝔽₇ has nonconstant ordinary powers; affects the proof.
- **Error** in CG18 at Lemma 9.12 proof, printed p.421 (CG18 line 4965): the source says the Weyl-permuted induced constituents differ from π; it should be an argument recognizing their isomorphism to π and separately proving injectivity of the selected adjunction component; affects the proof.
- **Misprint** in CG18 at Remark 9.15, printed p.422 (CG18 line 5002): the source says the principal local congruence subgroup at x∤p is pro-p; it should be pro-ℓ for the residue characteristic ℓ of x; affects the proof.
- **Error** in CG18 at §9.5, printed p.426 (CG18 line 5159): the source says dual cohomology with χ coefficients is homology with χ coefficients; it should be χ⁻¹ with adjoint Hecke action; ζₚ·ζₚ⁻¹=1 but ζₚ²≠1; affects the proof.
- **Misprint** in CG18 at Theorem 9.19 proof, printed p.426 (CG18 line 5186): the source says the residual model has term H^(i−ℓ₀)∨; it should be H^(q₀+ℓ₀−i)∨; for q₀=ℓ₀=1 its top is H¹∨, not H⁰∨; affects the proof.
- **Misprint** in CG18 at Theorem 9.19 proof, printed p.427 (CG18 lines 5212–5214): the source says the action on levels based on Q_M comes from the deformation ring for Q_N; it should be Q_M, retaining N only for the smaller deck quotient; affects the proof.
- **Misprint** in CGH20 at §4, preprint p.8 (CGH20 lines 318–320): the source says the density-one and large-image assertions concern Theorem 3.2; it should be Theorem 1.1, the abelian-surface result; affects nothing.
- **Misprint** in KT17 at Lemma 6.25(5), preprint p.41 (KT17 line 1908): the source says the good-prime index v lies outside S∪{v}; it should be v outside S∪{w}, with w the fixed auxiliary place; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "83b8a2bf11f6e07490e57b93b3ec13b48c75f679", "job": "RT-AutomorphyLiftingBeyondTaylorWiles~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
