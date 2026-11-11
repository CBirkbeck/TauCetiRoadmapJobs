<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13172#issuecomment-6784264503 -->
Review (codex) of afda91a

Verdict: needs_changes

1. **F01** (P2) Supply the global theta prerequisite before using the global spin transfer

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:423`, also lines 726 and 736. The first passage says: “Compare the global functional equations of the spin L-function of Σ and of the standard L-function of SpinLift(Σ) (§2.3)”.

   **Claim.** The globalizations used in §§2.4, 5.2 and 5.3 admit the global spin transfer of §2.3. But §2.3, line 407, requires a **nonzero cuspidal global similitude theta lift to PGSO₈**. §1.6 supplies a globally generic cuspidal representation with specified components, not that additional conclusion. The local nonvanishing of §2.2 does not itself establish global nonvanishing or cuspidality. The only explicit global classical-theta target, §8.1, concerns the particular totally real globalization of §1.7; it does not cover §2.4's totally complex globalization or the different globalizations of §5.2–§5.3.

   **Witness.** GS lines 771–773 establish nonzero global theta and then use the Steinberg place to kill the lower lift, obtaining cuspidality before the transfer. README line 407 retains that prerequisite; line 423 does not discharge it.

   **Exact repair.** Before the first use in §2.4, state and prove the needed reusable consequence: for a globally generic cuspidal Σ of PGSp₆ over a number field, with a Steinberg component, the split PGSO₈ similitude lift is nonzero and cuspidal. Give its route and Needs explicitly: generic global Arthur parameter; nonzero local lifts at every place; boundary nonvanishing of the standard isobaric L-function at 1; the already declared `pgsp6-similitude-rallis` contract; and vanishing of the PGO₆ lift at the Steinberg place plus first occurrence. Cite the relevant real/complex local matching when applying it at infinity. Use this result in §§2.4, 5.2 and 5.3, and adjust Layer 2's dependencies. This can be added to §2.3 without renumbering. The existing contract is owned and sufficient in scope; do not introduce another owner or cite the later §8.1 as if it covered these globalizations.

   **Repair test.** At the Steinberg place the standard parameter is Sym⁶, with invariant-vector dimension 0. A parameter factoring through Spin₆ has vector representation 1 ⊕ Λ²φ and invariant-vector dimension at least 1. Thus the lower lift is excluded. With the other Rallis premises stated, upper nonvanishing and first-occurrence cuspidality are available before forming the GL₈ transfer. The repaired cancellation then really has two functional equations, R_u R_w R_σ = 1 and R_u R_w R_σ² = 1, giving R_σ = 1. This is a different omission from the previous review's auxiliary-place finding, which was repaired.

2. **F02** (P3) The unramified Check needs a conductor-zero additive character

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:427`: “both sides equal the ratio of the unramified spin factors at 1 − s and s by construction”.

   **Claim.** For an unramified representation the gamma factor is the L-factor ratio, although the standing ψ in line 26 is an arbitrary nontrivial unitary additive character. The epsilon factor is omitted. Line 429 correctly states the nontrivial change under ψ → ψ_a, so the two Checks disagree.

   **Witness.** At F = ℚ₅, trivial spin Satake class and s = 2, the ratio is (6/25)⁸. Replacing a conductor-zero ψ₀ by ψ₅(x) = ψ₀(5x) changes gamma to 5⁻¹²(6/25)⁸; the L-ratio is unchanged.

   **Exact repair.** Qualify the first Check by requiring ψ to have conductor O_F and using its self-dual measure; write the ratio as L(1 − s, SpinLift(σ)∨)/L(s, SpinLift(σ)). For arbitrary ψ retain epsilon, or explicitly refer to the scaling Check. Keep the theorem for every nontrivial ψ. Include the scaled-character instance above as a negative control.

   **Repair test.** For ψ₀, each of the eight trivial Tate factors at s = 2 is (1 − 5⁻²)/(1 − 5) = −6/25, and epsilon is 1. For ψ₅, epsilon gains |5|₅^(8(2 − 1/2)) = 5⁻¹². Both versions now agree with line 429. The supplier already records this distinction: open PR #924, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:922` (conductor-zero Check), with the character-change rule in AL.1.3.1 immediately above. No supplier change is needed.

3. **F03** (P2) An untwisted spin-factor identity does not supply the local-converse hypotheses

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:434`: “or §2.4 with the local converse of the gln-generic-local-converse contract”.

   **Claim.** §2.4 gives an alternative proof of quadratic twisting of SpinLift through the GL₈ local converse theorem. The contract in line 66 requires equality after every irreducible GL_r twist, r ≤ 8. §2.4 supplies only the standard, untwisted degree-eight gamma identity. The Shahidi contract in line 82 supplies quadratic character twisting, not PGSp₆ spin × GL_r factors and their comparisons. Changing ψ does not supply those missing twists.

   **Witness.** README line 66 quantifies over all GL_r twists. For r = 2 the required tensor parameter has dimension 16; §2.4 compares only degree-eight standard factors. No such degree-sixteen comparison occurs in that statement or its supplier contract.

   **Exact repair.** Delete the alternative beginning “or §2.4 with the local converse…”. Retain the stated route through §2.1's spinor-norm pullback, the classical similitude twisting rule, and the GL₈ twisting compatibility of EndoscopicTransferAndUnitaryTraceComparison §10.30. Remove §2.4 from this target's Needs if the retained route does not use it. This does not remove the local-converse contract, which is still needed for the genuine G₂ × GL_r characterization in §3.13. An alternative larger repair would have to own and prove every missing twisted comparison, not merely cite the converse.

   **Repair test.** A quadratic χ multiplies the eight spin eigenvalues by χ, leaves the vector parameter unchanged, and χ² = 1 makes the twice-twisted lift the original lift. The retained theta/spinor-norm route supplies precisely this transformation and then the GL₈ identification. The failed alternative would have to produce rank-16, rank-24, … tensor-factor identities from a rank-eight identity, which it does not. GS lines 808–810 instead use a global quadratic twist and strong multiplicity one; the cited source does not justify the proposed local-converse shortcut.

4. **F04** (P3) Name the spin-detection headline in the unstatable list

   **Location.** `packages/LocalLanglandsCorrespondenceForG2/README.md:3` explicitly includes “spin detection” among the comparison headlines. `packages/LocalLanglandsCorrespondenceForG2/Suggested.lean:33–36` names only “standard injectivity and quadratic-twist rigidity” in its parameter-comparison entry.

   **Claim.** The module docstring inventories the unstatable headlines. The spin-detection theorem of §0.3—characterizing discrete Spin₇ parameters with a spin L-pole as the diamond G₂ image, with component-group comparison—is neither stated nor named there. It is a different result from standard injectivity and quadratic rigidity.

   **Witness.** README §0.3, line 170, states the spin-pole criterion and component-group comparison. The module docstring names §§0.4–0.5 but contains no spin-detection or spin-pole entry. The summary explicitly calls spin detection a result being built.

   **Exact repair.** Extend the parameter-comparison docstring entry to name §0.3's spin-detection theorem (and its §0.2 discrete A₂-detection input). Explain that the actual local-parameter carriers, dual inclusions, component groups and associated L-factors are missing at the pins. Do not add a placeholder Lean theorem. This completes the remaining instance of the earlier R11 inventory pattern; its specifically requested new entries were otherwise supplied.

   **Repair test.** The inventory must distinguish the principal case, whose spin parameter 1 ⊕ Sym⁶ has one invariant line, from the subregular case, whose 2·1 ⊕ 2Sym² has two and is not discrete in Spin₇. Naming only injectivity of a parameter map does not describe that pole/discreteness theorem. The existing computed rows for §§0.2–0.3 remain the mathematical controls; only the docstring needs editing.

Four findings: two P2 and two P3. Ten previous findings are repaired; the headline-inventory finding is partly repaired. The other findings concern prerequisites and normalization in Layer 2. No implementation file was changed. The original Lean file elaborates, and neither of its two admitted headline theorems is padding.

## Verified sound

### Previous findings, checked before the new pass

All references below are to `packages/LocalLanglandsCorrespondenceForG2/README.md` unless another file is named. The quotations are repaired package wording, not source passages. None of the previous repair report's findings was marked not actionable.

| Previous finding | Repaired passage and verification | Status |
|---|---|---|
| R01, uncontrolled auxiliary place | Line 337: “if k has an archimedean place outside S, Π can be taken spherical at every finite place outside S ∪ {w}”. Lines 423 and 430 use the same k, Ψ, u, w and δ for one and two copies of σ. The products now divide to R_σ = 1. | Repaired, conditional on the explicitly strengthened Poincaré contract. New R01 concerns the separate theta prerequisite. |
| R02, missing statable Griess theorem | Line 122 defines “the subgroup of the invertible ℂ-linear maps of 𝕆”; line 134 states `griess_conjugacy`. `Suggested.lean:72,89,106` contains the two real definitions and the theorem on native octonions. | Repaired. Signatures and negative controls checked below. |
| R03, quaternion globalization scope | Line 316: “a finite place z ∉ S … spherical at every finite place outside S ∪ {z}”. The same sentence allows finite and real prescriptions. | Repaired. Allowed exceptional-place count is 1, not 0; compact real duals provide isolation. |
| R04, real genericity/isolation | Line 337 assumes “a ψ_v-generic square-integrable representation … that is isolated”; line 339 uses max(C,C′). Line 93 declares the real-isolation contract. | Repaired. Wrong-sign D_k has Whittaker dimension 0; the selected sign has dimension 1, independently of k. |
| R05, universal irreducibility premise | Line 628: “The density-one set of §2.43 is nonempty”. Lines 61, 103 and 621 import the universal statement and discharge AG2.6's rank-seven premise. | Repaired. MLE §2.43 at its head supplies every eligible CM form, not merely the chosen Π. |
| R06, source-driven organization | Line 3 now describes construction “by transporting parameters through the exceptional theta correspondences … the triality spin transfer … and comparisons”. | Repaired. Mathematical layer names and their dependencies determine the order. No remaining assertion that the roadmap follows a source was found. |
| R07, untwisted Whittaker contract | Line 304 uses “functions with f(ng) = ψ_v(n) f(g)”; line 92 also fixes σ at w and specifies the selected spectrum. | Repaired. ψ_v(n) = −1 gives −1, versus +1 on the untwisted quotient. Plan and README agree. |
| R08, native triality path | Line 48 names `TauCeti/Algebra/Lie/D4/Tripled/Triality/Basic.lean`. | Repaired. Both named declarations exist there at lines 155 and 197. |
| R09, local Steinberg versus Hodge regularity | Line 952: “A finite-place local parameter is a different object … and is allowed”. | Repaired. Local principal weights have 0 twice; the chosen global Hodge weights are ±10, ±7, ±4, ±1. KS's three hypotheses remain present. |
| R10, weak-containment counterexample | Line 308: “the multiplicity of St is 1 and its multiplicity among the trivial summands is 0”. | Repaired. This refutes the subsequence inference, not the isolated-summand theorem. The additional L²(ℝ) Check correctly has no invariant vector. |
| R11, omitted unstatable headlines | `Suggested.lean:37–59` names Chenevier descent, globalizations, spin transfer, Kret–Shin parameters, exceptional spin identity and weak correspondence, with missing carriers. | Partly repaired. The specifically requested entries were added, but the summary-to-docstring inventory still omits spin detection; see R04. No stand-in declarations were added. |

The stronger no-extra-finite-place assertion is declared as a supplier obligation, not certified here as a theorem proved by ILM for arbitrary split groups. ILM lines 959–983 and 995–998 explain the archimedean separating-function arrangement in its metaplectic setting, with spherical functions at odd-residue places. The package accurately distinguishes that evidence from its more general contract, including residue characteristic 2.

### Principles, scope, shape and all-target pass

I read all 75 numbered targets in Layers 0–10, their API bullets, Checks, Needs and layer dependencies, together with the four package files and the design's gap list. I used the previous review's computed rows only for unchanged statements; changed statements and previously uncomputed claims were inspected again. The report table below is limited to the requested sample, headlines, repairs and findings; it is not a per-target catalogue.

The roadmap is a new consumer of ExceptionalThetaCorrespondencesForG2, not a replacement for that supplier. No good-prime reduction is substituted for the correspondence: F has characteristic zero, but residue characteristics 2 and 3 remain in scope; the p = 3 qualification concerns the known enhancement result, not a dropped field. The main/open ownership searches found no existing roadmap whose entire direction this package re-plans. No computational algorithm, copied source passage, process identifier, machine path, HTML anchor or source-chapter layer name was found in the roadmap text. Mathematical uses of “packet” are standard vocabulary here. Main-roadmap forms were compared with ClassFieldTheory, SpinRepresentations and GlobalQuadraticForms.

Every layer has Examples and Dependencies. All 18 numbered blocks that introduce objects with “Define” have API statements and at least three Check bullets; §0.0 treats both kept octonion definitions separately. The Checks discriminate such alternatives as scalar maps, octonion conjugation, an isotypic space instead of the detected multiplicity space, raw instead of fixed-split component groups, and loss of monodromy. R02 is the incorrect normalization Check found in this pass. Theorem targets carry locators and explicit standing or local hypotheses. R01 and R03 identify proof-route inputs not justified by their Needs. No additional source-order or coarse dependency-cycle defect was found.

### Seeded locator verification

The following fifteen targets were checked against the actual cached texts, including hypotheses and the cited page/theorem. Source lines are extraction line numbers, not repository paths. The original Griess article is the only settled unread source; its status is recorded below.

| Target | Source and what it supports |
|---|---|
| 0.2 Detection of discrete A₂ parameters | GS Lemma 2.4(i), pp.9–10, lines 396–431: the discrete criterion, duality quotient, and centralizers. Non-self-dual μ₃ and self-dual S₃ are distinguished. The source's later overbroad order-three sentence is not propagated. |
| 0.3 Spin detection of G₂ parameters | GS Lemma 2.4(ii), p.9, lines 407–414: discrete Spin₇ parameters, spin detection, and the quotient by the central μ₂. The discreteness assumption is essential to the invariant-line test. |
| 0.10 Chenevier's G₂-valued Galois lift | C Theorem 6.4 and Corollary 6.5, printed pp.148–149, lines 2176–2198, proof lines 2199–2239: totally real, cuspidal GL₇, algebraic regular infinity type, almost-all Satake condition, continuous semisimple G₂ lift and conjugacy uniqueness. |
| 1.1 Spectrum detected by a quaternion period | GS §10.2, p.28, lines 1167–1178: totally definite octonions, quaternion subgroup, and the orthogonal complement of the zero-period representation subspaces. The multiplicity-space formulation is preserved. |
| 2.3 Global isobaric spin transfer | GS §4.3, pp.17–18, lines 737–747: globally generic version with nonzero cuspidal orthogonal theta lift and local compatibility. The package's broader cuspidal transfer uses the explicitly imported Arthur transfer, rather than pretending the source's sentence proves the nongeneric case. The prerequisite is retained in §2.3 but omitted by the consumers in R01. |
| 3.4 Agreement of the two descriptions | GS §3.2, p.11, lines 462–475; HD Theorem 8.5, pp.27–28, lines 1017–1042, and Theorem 15.2, pp.52–53, lines 2021–2031. The split-E₆ and E₇ lifts have the stated common parameter; the outer signs and tempered Siegel branch are not erased. |
| 3.9 Rank-seven standard lift | GS §3.4, p.13, lines 548–578: the division branch rec(JL(τ)) ⊕ 1 ⊕ rec(JL(τ))∨ and the heart branch agree with v ∘ L. This is rank seven, not the rank-eight spin transfer. |
| 4.4 Subregular fibre | GS Proposition 3.2, p.14, lines 603–608 explicitly includes bijectivity for the subregular SL₂ at p = 3; HD Theorem 8.5, pp.27–28, lines 1033–1038 identifies the split Steinberg extensions. Together with the division lift supplied by ExceptionalThetaCorrespondencesForG2 Layer 5, this gives the three S₃ labels. |
| 5.1 Kret–Shin parameters of generic discrete series | GS §5.2, p.20, lines 839–861: the joint q- and s-projections and the separate existence assertion. The package defines a set before proving nonemptiness or uniqueness. |
| 6.1 Surjectivity onto diamond discrete parameters | GS Proposition 6.1 and proof, pp.21–22, lines 889–918: bounded lift, spin pole, exceptional lift and untwisting. The route still depends on §2.4, hence on R01's repair. |
| 7.3 Partial PGSp₆ correspondence on diamond orbits | GS Theorem 9.1(i), p.26, lines 1083–1097: quadratic-character orbits with chosen representatives and matching stabilizers, not free orbits; enhancements use the central quotient. |
| 8.2 Kret–Shin parameters of discrete heart representations | GS Theorem 12.3, p.36, lines 1512–1536, and conclusion p.38, lines 1591–1595; KS Proposition 13.1(4), pp.60–61 of the cited text, lines 2962–3006. Steinberg, cohomological and spin-regular hypotheses are all retained. The repaired weight Check agrees with the proof. |
| 9.2 Lower-tower parameter formula | GS §§12.2–12.3, pp.35–36, lines 1490–1528: vector 1 ⊕ Λ²φ_τ and spin φ_τ ⊕ φ_τ∨. The lower inner form is transferred by Jacquet–Langlands, not treated as an unrelated GL₄ parameter. |
| 10.7 Constancy on lower-tower Xu packets | GS proof of Theorem 12.7(ii), p.39, lines 1644–1647 states this case but leaves its verification to the reader. The package explicitly owns the verification using the supplied lower-tower tables and twist data; the source is not evidence of a written proof. |
| 10.8 Reduction to discrete data | The same GS locator, lines 1644–1647, states the reduction without the detailed proper-Levi argument. The package makes that argument a target and imports all seven proper-Levi tables and the Xu induction input. No assertion that GS contains those tables is made. |

All twelve cited works have manifest entries: eleven readable cached texts and Griess marked uncertified. No duplicate source key or newly missing text was needed. The source cautions in the package were checked where used: HKT's invariant spinor must be nonisotropic; GS's intermediate generic spin-lift representation need only be tempered; the totally real extension of the GS20 converse is a declared gap; Shin's weight-sequence result is separate from mere existence of discrete series at infinity.

### Computed adversarial table

These computations test statements and exclude wrong models; they do not purport to prove the deep correspondences. Degenerations outside the stated universe, such as q = 1 or a positive-characteristic local field F, do not count as counterexamples to this characteristic-zero roadmap. Residue characteristics 2 and 3, nontrivial monodromy, nongeneric representations and nonfree quadratic-character actions are included.

| Statement | Instances tried | Values computed on the two sides or wrong-model control | Result / change |
|---|---|---|---|
| §0.0 octonionAut | Identity, 2·id, conjugation; two upper Zorn basis vectors u₁,u₂ | Identity preserves the product. For 2·id at 1·1: 2 versus 4. Conjugation sends u₁u₂ to lower −e₃, while conj(u₁)conj(u₂) is lower +e₃. | Real body accepts automorphisms and excludes rescaling and the anti-automorphism. |
| §0.0 octonionRep and Griess headline | Trivial Γ; C₅ with SL₃ torus t = diag(ζ,ζ,ζ³) and t² | Trivial actions have conjugator 1. On v, ζ-multiplicity is 2 for t and 1 for t²; adding the scalar line keeps 2 versus 1. Principal representation on octonions has dimension 1+7 = 8. | Intertwining is not automatic; the native eight-dimensional formulation retains the seven-dimensional statement. |
| §0.1 branching and conventions | SL₃ torus diag(2,3,1/6); central −1 in Spin₇ | Vector spectrum {1,2,3,1/6,1/2,1/3,6}, determinant 1; spin adds one 1. Central −1 has vector trace 7 and spin trace −8. | Distinguishes vector from spin, dual from duplicate standard summand. |
| Sample §0.2 | τ = Sym² of SL₂; nontrivial cubic χ·Sym²; principal Sym⁶ | A₂ vector = 1 ⊕ 2Sym², dimension 7, invariant multiplicity 1, pole order 1 at 0. Self-dual centralizer S₃ has 3 irreducibles and order 6; non-self-dual cubic case has μ₃. Principal vector has invariant multiplicity 0 and no pole at 0. | Detection and both centralizers agree. Trivial parameter has pole order 7 but is excluded by discreteness. |
| Sample §0.3 | Principal and subregular SL₂ | Principal spin = 1 ⊕ Sym⁶: dimension 8, invariants 1, raw centralizer μ₂, fixed-split quotient 1. Subregular spin = 2·1 ⊕ 2Sym²: invariants 2. | Subregular Spin₇ parameter is not discrete, so it does not refute the discrete criterion. |
| §§0.4–0.5 injectivity and rigidity | A₂ dual pair; nontrivial central character χ | 1 ⊕ τ ⊕ τ∨ is unchanged by τ ↔ τ∨. qχ = 1, while sχ = χ Id₈. For φ = 1 and χ nontrivial, invariant dimensions are 8 versus 0 after spin twisting. | q alone is insufficient; the spin equality is a substantive rigidity hypothesis. |
| §§0.6–0.7 weak equivalence | Principal unipotent and identity; central signs | Spin Jordan sizes (7,1) versus eight 1s, despite equal trace 8. Central signs have vector trace 7 on both sides but spin traces 8 and −8. | Both full representations, with monodromy, are required. |
| §0.8 Spin₇ unacceptability headline | Γ = (ℤ/4)², weights (1,0),(1,2),(0,1),(2,1), η = (0,2) | Weight sum (4,4) = 0 mod 4, so determinant 1. ηV weights {(1,2),(1,0),(0,3),(2,3)} equal neither V nor V∨. For every (x,y), one of x,y,x+y is even. | CG Example 1's elementwise condition holds while the global conjugacy alternatives fail. Compact-to-complex conjugacy descent preserves the obstruction. |
| Sample §0.10; §0.9 | Principal seven-dimensional representation; S₃ finite quotient for density | Sym⁶ has dimension 7, determinant 1, weights −6,−4,−2,0,2,4,6, one zero. S₃ class densities are 1/6,3/6,2/6, summing to 1. | Regularity and dense Frobenius information are real inputs; one selected conjugacy class would not suffice. |
| Sample §1.1; §1.2 | V ⊕ V, functional p(x)+p(y) | On diagonal (v,v), value 2p(v); on anti-diagonal (v,−v), value 0. Nonzero scalar rescaling preserves the kernel. | Detected space is the diagonal multiplicity copy, not the full isotypic space. |
| Repaired §1.3 | Whittaker ψ(n)=−1; empty S | f(n)=−1 versus +1 for untwisted functions. G(k_∅)=1 and the constant function gives the one-dimensional trivial action. Allowed extra finite-place counts are 1 in (a),(b), 0 in (b′). | Twisted space, fixed σ and free archimedean place are retained. |
| Repaired §1.3 weak containment | St ⊕ ⨁1; regular L²(ℝ) | St multiplicity 1 in the whole sum, 0 among the trivial terms. L²(ℝ) invariant dimension 0, versus dimension 1 for the weakly contained trivial representation. | Closure/occurrence distinction is correct; no subsequence conclusion remains. |
| Repaired §§1.4–1.6 | Wrong-sign D_k; compact real factor; rank-one Steinberg | Whittaker dimensions 0 versus 1 for the two signs, even when k−1 grows. Compact real irreducibles are isolated. Split ranks of G₂, PGSp₆ are 2,3 versus excluded rank-one isolation claim. | Genericity and isolation are explicit; exceptional finite place carried in (i). |
| §1.7 and repaired real contracts | t=1 and t=0 in λ_t=t(8,4,2) | Sum 14t is even; simple pairings 4t,2t,2t grow. h₁=(11,6,3) gives ±10,±7,±4,±1; h₀=(3,2,1) gives 0 twice. | Root-lattice and spin-regularity conditions discriminate the boundary. |
| §2.1 triality maps | Centre μ₂² of Spin₈ | Three distinct nontrivial order-two kernels; their permutation has cube 1. Restriction dimensions are 1+7 and 8, respectively. | Three quotient maps are not one repeated vector map. |
| Sample §2.3 | Cuspidal exceptional lift with spin transfer 1 ⊞ A | Total rank 1+7=8, number of isobaric summands 2 versus 1 required for cuspidality of the GL₈ transfer. | Correctly allows an isobaric noncuspidal transfer. Cuspidality of the orthogonal theta lift remains a separate premise. |
| R01, §§2.4,5.2,5.3 | Steinberg local component versus a Spin₆ factorization | dim(Sym⁶)^SL₂ = 0, while dim(1 ⊕ Λ²φ)^SL₂ ≥ 1. With Rallis's other premises, lower lift 0 gives cuspidal upper lift. | Insert this global prerequisite before using §2.3. |
| Repaired §2.4 cancellation | One versus two copies; uncontrolled-place countermodel | R_uR_wR_σ=1 and R_uR_wR_σ²=1 give R_σ=1. With extra places, R_σ=2, R_z₁=1/2, R_z₂=1/4 satisfy both equations. | Previous repair removes those places; R01 is still needed to obtain the equations. |
| R02, §2.4 unramified normalization | F=ℚ₅, spin Satake 1⁸, s=2, ψ₀ and ψ₅ | L-ratio = ((1−5⁻²)/(1−5))⁸=(6/25)⁸. Gamma for ψ₅ is 5⁻¹² times that value, not the same ratio. | Add conductor-zero qualification or retain epsilon. |
| §2.4 Steinberg Check | Principal SL₂ in Spin₇ | Spin weights 6,4,2,0,0,−2,−4,−6 = weights(1 ⊕ Sym⁶). Sym⁷ instead has weights 7,5,3,1,−1,−3,−5,−7. | Lift is 1 × St₇, not St₈. |
| R03, §2.5 | Quadratic χ; rank-two converse twist | χ²=1 preserves the vector data and twice-twisting restores all 8 spin eigenvalues. GL₂ tensor twist has dimension 8·2=16, versus the available untwisted degree 8. | Delete the unsupported converse alternative; theta twisting supplies the theorem. |
| Sample §3.4 | τ=St_PGL₃; unramified torus diag(2,3,1/6) | Both theta descriptions give vector 1 ⊕ 2Sym², dimension 7 and N rank 4; spin 2·1 ⊕ 2Sym² has dimension 8. Torus standard spectrum is the seven-element list above on both routes. | Agreement retains duality and the nondiscrete Siegel partner. |
| §§3.2,3.5–3.7 | Trivial and Steinberg G₂ at q=5 | Semisimple WD eigenvalues both 5⁻³,…,5³; N ranks 0 and 6. Arithmetic norm is 1/5, inverse convention ω is 5; χ(ϖ)=2 becomes 1/2 under geometric reciprocity and 2 after dual transport. | Semisimplification alone fails; stated convention and N distinguish the inputs. |
| Sample §3.9 | A₂ branch τ=St_PGL₃ | Rank 3+1+3=7, determinant 1; two Sym² blocks give N rank 2+2=4. Spin rank is 8, not 7. | Rank-seven lift is correctly distinct from SpinLift. |
| §§3.10–3.13 gamma characterization | Rank-r tensor twist; two maximal Levis | Dimensions 7r; determinant contribution det(τ)^7. Levi decompositions have dimensions 2+2+1+1+1=7 and 2+2+3=7. Principal versus trivial N ranks are 6 and 0. | This characterization actually supplies all twists and retains monodromy, unlike R03's alternative. |
| §3.14 theta characterization | Spade duality and heart standard comparison | τ,τ∨ give one G₂ class; injective v gives one class from a fixed heart parameter; two disjoint theta loci have union Irr(G₂). | Unique unenhanced map follows without putting the conclusion into a hypothesis. |
| Repaired §3.15 global compatibility | Universal rank-seven irreducibility premise | Empty set of primes has density 0; supplier sets have density 1 and hence at least one prime for every eligible CM form. WD monodromy remains rank 6 in the Steinberg test. | Universal premise now supplied; no coefficient-prime exception introduced. |
| §§4.1–4.3 and enhancement headline | Opposite cubic algebras; p=3 missing division lifts | −1/3 = 2/3 mod ℤ. Non-self-dual fibre sizes can be 1,2,3, with 3 labels; the map is injective toward the labels. | Opposite/dual convention and the p=3 qualification are correct. |
| Sample §4.4 | Subregular parameter, including p=3 | Three S₃ irreducibles of dimensions 1,1,2; squares sum 6. Standard two-dimensional character on a 3-cycle has trace ζ+ζ⁻¹=−1. The fibre has three members. | Full subregular fibre survives p=3; μ₃ would give the wrong enhancement data. |
| Sample §5.1 | Steinberg; a central twist changing spin data | q-image Sym⁶ has dimension 7, s-image 1 ⊕ Sym⁶ dimension 8. A spin-changing χ leaves q fixed but changes the second membership equality. | KS is a genuine jointly constrained set, not arbitrary chosen data. |
| §§5.4–5.6 exceptional spin headline | Principal and subregular G₂ discrete series | Principal spin invariants 1, subregular spin invariants 2; dimensions 1+7=8 and 1+1+3+3=8. | Generic intermediate PGSp₆ representation is tempered; discreteness is required only on the diamond branch. |
| Sample §6.1 | Bounded supercuspidal diamond parameter; principal diamond | s∘i=1⊕v contributes a factor L(s,1), giving a pole at 0. Principal case has invariant multiplicity 1; its nontrivial SL₂ part is treated separately by the explicit tables. | Spin-pole and discrete-series cases are not conflated. Depends on repaired §2.4. |
| §§6.2–6.7 and §7.1 headline | Principal singleton; nonfree quadratic action; A₂ at p=3 | Principal packet size 1; quadratic orbit size [X:Stab], not automatically #X. One-in-all-in gives membership 1 for every member of the chosen Xu packet. A₂ fibre size ≤3 versus 3 labels at p=3. | Correct finite fibres, distinguished whole packet and qualified enhancement. |
| §7.2 HKT headline | Generic versus nongeneric member | Whittaker dimensions 1 versus 0. Nontrivial SL₂ in a parameter lies outside the supercuspidal parameter locus used here. | No extension of the generic supercuspidal theorem to arbitrary nongeneric supercuspidals. |
| Sample §7.3 | Principal diamond basepoint; stabilizers | Raw Spin₇ centre has order 2, quotient enhancement group is trivial at the principal point. For an orbit X/H its size is [X:H]; H=X gives 1, not #X. | Central quotient and matching stabilizers are retained. |
| Sample §8.2 | Principal Hodge cocharacter; chosen spin-regular Hodge cocharacter | Principal spin weights have multiplicity 2 at 0; h=(11,6,3) has eight distinct weights. A putative isobaric decomposition 1+7 would give two Galois summands, contradicting the irreducible rank-eight representation. | Global Hodge test is separate from the allowed finite Steinberg parameter; irreducibility forces one cuspidal summand. |
| Sample §9.2 | φ_τ=Sym³ of SL₂ | Λ²Sym³=Sym⁴⊕1, dimension 5+1=6; qhφ = 1⊕1⊕Sym⁴ has dimension 7; shφ = Sym³⊕Sym³ has dimension 8. | Lower-tower formula keeps both the extra vector line and the dual spin summand. |
| §§9.3–10.2 weak correspondence headline | All proper standard Levis; principal and trivial parameters | Proper Levi subsets: 2³−1=7. Principal centralizer modulo centre is finite; trivial parameter centralizer has dimension 21. q has kernel order 2. | No omitted proper-Levi family; discreteness and boundedness descend to the weak class. |
| §§10.3–10.5 twists and surjectivity | φ_τ with eigenvalues 2,3,5,1/30; χ=−1 | Λ² eigenvalues {6,10,1/15,15,1/10,1/6} are unchanged by χ²=1; eight spin eigenvalues are negated. Twisting twice gives the original parameter. | Vector equality alone is insufficient; quadratic untwisting gives the desired weak class. |
| Sample §10.7 | Lower-tower φ_τ and φ_τ∨; central twist | φ_τ⊕φ_τ∨ is unchanged by duality (same eight entries), but a nontrivial central twist negates all entries in the preceding example while Λ² stays fixed. | The lower-tower twist/stabilizer table is necessary; q-only constancy would not prove this target. |
| Sample §10.8 | Seven proper Levis; Siegel induction of St_PGL₃ | Count 7. Both relevant Siegel constituents have spin parameter 2·1 ⊕ 2Sym² of dimension 8, N rank 4; torus induction supplies a singleton parameter formula. | Reduction must use all-Levi tables and keep N; the target explicitly assigns that work. |
| §10.9 weak-fibre headline | Diamond image versus CG unacceptability pair | Diamond spin parameter has one invariant line and rigidity returns one conjugacy class in the specified fibre. CG gives two nonconjugate classes with one weak class elsewhere. | Singleton assertion is restricted to the diamond image; general fibres are unions of Xu packets, not conjugacy classes. |

### Lean, headline coverage and padding

The original `Suggested.lean` was elaborated from the content checkout with the prescribed `lake env lean` invocation. Exit code 0; the only diagnostics were `declaration uses 'sorry'` at lines 106 and 125. The imported octonion object file already existed; no build or dependency update was needed. A separate scratch copy with `#check @` for all five declarations also elaborated. No section binder disappeared. Both semisimplicity hypotheses, the intertwiner, group instance, finite-group instance and all conclusion quantifiers have the intended scopes.

| README headline family | Acceptance-test treatment |
|---|---|
| Griess conjugacy, §0.0 | `griess_conjugacy`, line 106, using the two native octonion definitions. |
| Spin₇ unacceptability, §0.8 | `spin7_not_acceptable`, line 125, using the native quadratic form and spin group. |
| Parameter comparisons, §§0.2–0.7 | Docstring names standard injectivity and quadratic rigidity and their missing carriers; the statable group-theoretic core is Griess. The spin-detection headline is not named: R04. |
| Chenevier descent, §§0.9–0.10 | Docstring line 37: automorphic representations, Satake parameters and associated Galois representations missing. |
| Period/Whittaker/regular-weight globalizations, §§1.4–1.7 | Docstring line 40: adelic representation spaces, periods, Fell topology and local discrete series missing. |
| Spin transfer and gamma comparison, §§2.2–2.5 | Docstring line 46: smooth representations, classical theta, Arthur and local factors missing. |
| G₂ parameter map, theta/gamma characterizations, standard lift, A₂ enhancements, §§3–4 and 7.1 | Main LLC entry, supplemented by the gamma and parameter-comparison entries: smooth G₂ category and L-parameter carriers missing. |
| Kret–Shin, exceptional spin identity, diamond fibres, §§5–6 and 8.2 | Docstring lines 50–55: Spin₇ parameters, GSpin Galois representations, theta and Xu packets missing. |
| HKT generic supercuspidals, §7.2 | Docstring line 29: same carriers and Whittaker genericity missing. |
| Partial enhanced PGSp₆, §7.3 | Docstring line 53: actual representations, classical theta and Xu packets missing. |
| Weak PGSp₆ and its fibres, §§9–10 | Docstring line 56: same missing carriers; no placeholder quotient or free predicate substituted. |
| All-places global–local compatibility, §3.15 | Docstring line 59: actual automorphic and attached Galois representations missing. |

The few definitions are genuine bodies on pinned carriers, used by the two headlines. All five own backticked names in the README resolve to these declarations. There is one `import Mathlib` followed by the one Tau Ceti module used. There is no admitted data, free condition field, `set_option`, `lemma`, admitted example or substitute headline.

I tried `simp`, `rfl` and `infer_instance` separately on **both** admitted theorem bodies in scratch copies: six failures, with their existential/conjugacy goals still unsolved. I also compared the library-near-match candidates at the pins for the “exact one lemma” possibility. Group conjugacy lemmas do not conjugate two homomorphisms; semisimple-module facts do not force the conjugator to preserve octonion multiplication; quadratic-form equivalences do not produce an unacceptable pair. Neither target mirrors a README Check or handles only a boundary case. No padding finding remains.

### Pinned library audit

Pins inspected: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. These are the content manifest pins, not newer web documentation.

| Pinned file and line | Declaration/content opened and comparison |
|---|---|
| `Mathlib/RepresentationTheory/Semisimple.lean:34` | `Representation.IsSemisimpleRepresentation` is complementedness of the subrepresentation lattice. It does not assume Γ finite and does not assert G₂-conjugacy. |
| `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean:62,293,385` | Lipschitz construction, `spinGroup` and group instance. Native algebraic group of Clifford elements; no smooth-representation or LLC structure. |
| `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:1408,1415` | `QuadraticMap.weightedSumSquares` and its evaluation: sum w_i x_i². Seven weights 1 give the actual nondegenerate complex form, not arbitrary Prop-valued data. |
| `Mathlib/Algebra/Group/Conj.lean:32,84` | `IsConj` and its existential conjugator interpretation. Elementwise quantifier order is distinct from one common conjugator. |
| `Mathlib/Data/Matrix/Diagonal.lean:50` | `Matrix.diagonal` on a finite indexed carrier; used only for Checks here. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140,158` | Characteristic polynomial and `Matrix.charpoly_diagonal`, product of linear factors. |
| `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean:115,119` | Degree and monicity; degree statement carries the nontrivial-ring condition, satisfied by ℂ. |
| `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:80` | `Matrix.det_diagonal`; the seven torus entries multiply to 1. |
| `TauCeti/Algebra/Octonion/Basic.lean:143,233,279,305` | Native Zorn carrier, module, multiplication and nonassociative ring. The multiplication signs give the conjugation negative control above. |
| `TauCeti/Algebra/Octonion/Basic.lean:336,354,365,537,551,831,861` | `conj`, `conj_mul`, trace, multiplicative norm, norm quadratic form, imaginary kernel and rank-seven theorem. Rank hypotheses hold over ℂ. These do not already prove Griess. |
| `TauCeti/Algebra/Lie/D4/Tripled/Triality/Basic.lean:155,161,197` | Integral triality automorphism, root action and cube identity. The package's comparison with the three rational central quotients is additional, not a restatement of the native automorphism. |
| `TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean:91,181,235` | Local Weil construction and degree, using powers of arithmetic Frobenius. This is not a native G₂-valued Weil–Deligne parameter or smooth G₂ category. |

Object searches included octonion automorphisms and their representations, Spin₇ elementwise versus global conjugacy, Weil–Deligne and L-parameters, smooth representations, triality, spin transfer, relative isolation and weak containment. The pinned near matches do not supply the two headlines. No fully qualified declaration name collides with a readable supplier's `Suggested.lean`.

### Supplier, ownership and order audit

I read the board package index before making absence claims, read the supplied overlap snapshot, and used `roadmaps grep`, `roadmaps show` and `roadmaps resolve` against the supplied index. The resolver reports no unresolved roadmap/name lead. Its library scan was unavailable on its host, so that result was not used instead of the direct pinned inspection above. A fresh `roadmaps overlaps` lookup cannot locate this unpublished package on main or in an open pull request; the supplied overlap snapshot is the applicable evidence, not that failed lookup.

The snapshot reports no competing head changing this roadmap, dropped cited ids, or revision-only ids. The following current-head comparisons were made; the PR numbers identify the reviewed heads in this report, not proposed citations in the roadmap.

| Supplier and evidence | Resolved objects and ownership boundary |
|---|---|
| #1736, `TauCetiRoadmap/ExceptionalThetaCorrespondencesForG2/README.md:130,247,268,295,318` | §§0.1, 0.6–0.9 own octonion G₂, dual inclusions, complex parameters, component groups and proper-Levi models. The two simple octonion definitions here only make the Griess acceptance test statable. |
| Same file, lines 456,471,1005–1117,1216,1366–1488 | Unipotent labels, division Howe/nonvanishing, opposite algebras, outer signs, p=2 exception, split-E₆ table, dichotomy, E₇ lift tables, trichotomy, spin pole and depth-zero example. §1.9's partial labels explicitly leave the full LLC to this consumer, so §4.4 does not duplicate an already constructed full fibre. |
| Same file, lines 1514–1588 and 1614–1716 | Quaternion stabilizers, relative embeddings, Steinberg/compact-real periods, and global exceptional nonvanishing/cuspidality/genericity/real matching. These are imported, not reconstructed here. Global **classical** theta required in R01 is a different object. |
| #1180, `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md:1488–1494` | §2.43 supplies the universal extremely regular irreducibility input. This is an available new-roadmap head, not an unacknowledged revision-only section of a main roadmap. |
| Same file, lines 1792,1850,2015,2047,2081–2106,2253 | §§3.5,3.8,3.15,3.17,3.19,3.27: GSp₄, local/global Arthur, Xu packets and multiplicity, including self-twist stabilizers and induction. The package preserves this supplier's trace-formula assumptions. |
| #999, `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:504,1872,1893,3597,4125,4208,4224` | §1.13, §§4.7a–4.8, §§10.1,10.26,10.30,10.31: inner-form normalization, JL, full WD parameters, twists, factors and inner forms. Local-converse contract is additional; a global converse elsewhere is not a duplicate. |
| #1063, `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:786,1026,1108,1116,1714,1722` | §§3.10,3.34,3.41,3.42,6.13,6.14: first occurrence, local similitudes and towers, Rallis and its hypotheses. The explicit all-Levi tables, complex matching and similitude global extension remain precisely declared supplements. |
| #924, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:922,949,1007,1430,1571,2278` | Tate normalization, local constants, AL.3 factors/functional equations/isobaric transfer/boundary nonvanishing, AL.4 unramified factors. R02's omitted epsilon is already visible in this supplier. |
| #1756, `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactorsPartII/README.md:16,1060` | Scope and Layer 6 generalized local factors. The spin contract extends the same construction requested by ExceptionalThetaCorrespondencesForG2; it does not create a second spin-factor owner. |
| #1688, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:1916,2045,2205,2571,2875,4763` | SR.2.1–2.3, SR.3.1,3.3, SR.5.2: induction, Jacquet, genericity, classification and reciprocity inversion. |
| #1815, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroupsPartII/README.md:99,422,542–606,867,893,1015,1027` | Finite-product Fell duals, SRU.1.1,1.7–1.10,3.8,3.10,4.7,4.8. The isolated-summand statement is a closure statement; Steinberg isolation has split rank at least two. General real isolation is not silently imported from these p-adic results. |
| #1037, `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md:416,446,644,662` | §§2.4–2.5 and4.2–4.3: real modules/parameters and cuspidal/Whittaker realizations. Poincaré weak containment and the two regular-real bounds are declared additions, not claims these lines already prove them. |
| #925, `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:3148,3176,3196` | §§6.16,6.18,6.19: trace formula, pseudo-coefficients and Euler–Poincaré functions. Shin's density/weight-sequence theorem remains a gap on this owner. |
| #1006, `TauCetiRoadmap/AutomorphicGaloisRepresentationsPartII/README.md:1263,1818,2149,2453,3226` | AG2.2,5,6, its universal irreducibility premise and totally real descent. Kret–Shin GSpin construction is the declared additional contract, not a GL_n theorem renamed. |
| Main `TauCetiRoadmap/ClassFieldTheory/README.md:1054,1576`; `TauCetiRoadmap/ReductiveGroups/README.md:3029` | Local invariants/Weil groups in Layers 5,9; Chevalley–Demazure groups in Layer 9. |
| Main `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:665,777,839,969`; `Completed/OrthogonalSpinGroups/README.md:408,610` | Fundamental/spin representations, Spin₆ comparison, triality, spinor arithmetic. The F-rational quotient comparison of §2.1 remains the consumer's adapter. |
| Main `Completed/Chebotarev/README.md:410`; `TauCetiRoadmap/GlobalQuadraticForms/README.md:693,833,1066` | Density, Hasse/isometry/classification inputs. The quaternion/octet globalization uses these algebraic-form inputs, not a second proof of their general theory. |
| #1758, `TauCetiRoadmap/TwistedAutomorphicDescents/README.md:7–14`; #1404, `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:11–20` | Closest overlap leads own orthogonal descent/Bessel constructions and unitary relative periods, respectively. Neither owns G₂ LLC, the PGSp₆ spin transfer, or the octonion conjugacy theorem. |

All twelve gap slugs occur in both the plan and README, with a named earlier supplier. Each asks for a specified result/API and hypotheses: global spin-pole converse; generic GL_n local converse; all-proper-Levi similitude tables and twists; complex theta matching; similitude Rallis; Shahidi spin factors; relative generic isolation; Poincaré weak containment with both local spaces and level alternatives; regular-real unitarity; regular-real isolation and a generic member; Plancherel density along growing weights; Kret–Shin GSpin representations and spin irreducibility. The scopes were compared with the supplied owner statements. None asks for the already native spin group, triality automorphism, local Weil group or a second exceptional theta theory. Related clauses specify the API needed for one construction rather than unrelated extra projects. Their absence today is not a finding. R01 concerns **using** a declared contract at the required place, not its ownership or eventual fulfillment.

The prescribed dependency check returned exactly:

```text
depcheck: 236 roadmaps, 2147 edges, 0 problem(s)
```

There were no UPWARD, CYCLE or moved lines. Every Needs line was read. The source-following and upward-supply patterns from earlier rounds were searched for elsewhere; no further instance was found. The library and supplier objects are imported at their earlier owners; the mathematical comparisons specific to this correspondence remain here.

## Not verifiable

- Griess, *Basic conjugacy theorems for G₂*, Theorem 1: original text remains settled as uncertified/paywalled. I did not request it again. HKT line 913 and C line 2239 attest its use; that is not a claim to have read the original proof.
- The twelve declared supplier contracts are not proved by this package or certified merely by related source citations. In particular, ILM's metaplectic Poincaré arrangement is not itself the full general-group, all-residue-characteristic statement, and GS20's stated global converse is over ℚ. Acceptance after repairs would remain conditional on the declared contracts.
- GS's lower-tower constancy and nondiscrete reduction at lines 1644–1647 have no detailed proof there. Their proposed inputs and explicit cases were checked; the missing proof is work assigned to the targets, not text that was silently supplied by the citation.
- Indirect references owned solely by suppliers, such as Arthur's book and the Xu papers, were not independently re-fetched. Their current roadmap statements and hypotheses were resolved above.
- Ownership against every open pull request listed without a relevant supplied file/head was not checked individually. The indexed object searches, supplied overlap facts, readable supplier heads, five closest scopes and board-package index were checked. No missing-source request was added.

## Source issues

- **Gap** in GS at Proposition 4.1(i), proof, pp.18–19: the source says Proposition 10.7 permits spherical components at every unprescribed finite place; it should be a strengthened globalization or an argument controlling the permitted extra factor; affects the proof.
- **Error** in GS at Main Theorem (vi), p.4: the source says the intermediate PGSp₆ representation is generic discrete series; it should be generic tempered, including the Siegel-induced partners; affects a stated result.
- **Error** in GS at Proposition 3.2, proof, p.14: the source says the discrete A₂ centralizer always has order three; it should be μ₃ in the non-self-dual case and S₃ in the self-dual case; affects the proof.
- **Gap** in GS at Lemma 8.3, proof, p.25: the source says the cited spin-pole converse applies over its totally real field; it should be a justified totally real extension of GS20 Theorem 1.1, whose statement is over ℚ; affects the proof.
- **Gap** in HKT at Lemma 4.6, proof, p.21: the source says stabilizers of nonzero spinors are G₂; it should be stabilizers of nonisotropic spinors, with complete reducibility used to find a nonisotropic invariant vector; affects the proof.
- **Misprint** in Shin at Theorem 5.8, proof, author PDF p.27: the source says Proposition 4.12 supplies the limit; it should be Corollary 4.12; affects nothing.
- **Misprint** in GS at Main Theorem (ix), p.4: the source says the gamma factor closes before the tensor product; it should be the gamma factor of the tensor product with φ_τ, as in §3.4; affects nothing.
- **Misprint** in GS at §1.2, p.5: the source says the globalization appendices are sections 9 and 11 and misspells Griess; it should be sections 10 and 11, and Griess; affects nothing.
- **Misprint** in GS at §3.1, p.10: the source says Theorem 2.1(i) supplies the theta dichotomy; it should be Theorem 2.1(ii); affects nothing.
- **Misprint** in GS at §3.3, p.11: the source says the totally definite octonion algebra is over the local field F; it should be over the totally real number field k; affects nothing.
- **Misprint** in GS at §4.4, p.19: the source says the functional-equation comparison concerns representations of G₂(F); it should be PGSp₆(F); affects nothing.
- **Gap** in GS at Theorem 9.1(ii), p.27: the source says enhanced PGSp₆ compatibility applies to every irreducible G₂ representation; it should be restricted to the diamond discrete range where that enhanced correspondence has been constructed; affects a stated result.
- **Gap** in GS at Lemma 10.1, proof, p.27: the source says vanishing of open-orbit coefficients implies Howe rank exactly two; it should be rank at most two, with lower ranks excluded separately; affects the proof.
- **Error** in GS at Proposition 11.6, p.33: the source says weak containment in an indexed sum gives convergence along a subsequence of summands; it should be membership in their Fell closure, allowing an isolated summand to occur only once; affects a stated result.
- **Gap** in GS at Lemma 12.4, proof, p.37: the source says Shin Theorem 5.8 gives spin-regular archimedean weights; it should be Corollary 4.12 applied along a specified growing spin-regular weight sequence; affects the proof.
- **Misprint** in KS at §13, paragraph before Proposition 13.1, p.60: the source says characters of signs +1 and −1 are respectively totally odd and even; it should be totally even and odd, respectively; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "afda91a8a3288a416dd4e38cbd42dcc01ef3d439", "job": "REV-PKG-LocalLanglandsCorrespondenceForG2~3", "model": "gpt-6-astra", "worker": "chris-4"} -->
