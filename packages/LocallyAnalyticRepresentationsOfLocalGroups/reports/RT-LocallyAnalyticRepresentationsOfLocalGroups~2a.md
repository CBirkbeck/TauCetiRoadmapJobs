<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13169#issuecomment-6862861908 -->
Red team round 2 pass a (codex) of 4756c29

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) The definition of PS_1 fails for n = 1

   **Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:1357`, “with socle π_alg(φ, h) and cosocle ⊕_(i,σ) C(w, s_(i,σ))”.

   **Claim:** This describes PS_1 throughout the standing range n ≥ 1.

   **Witness:** For n = 1, PS = π_alg is a nonzero character, whose cosocle is itself. The displayed sum is 0. The preimage definition and the Check at README:1371 instead give PS_1 = π_alg.

   **Exact repair:** “Define PS_1(w(φ), h) as the preimage of soc(PS(w(φ), h)/π_alg(φ, h)). Its socle is π_alg; for n ≥ 2 its cosocle is ⊕_(i,σ) C(w, s_(i,σ)). For n = 1 it is π_alg, with cosocle π_alg.”

   **Retest:** For n = 1 the preimage of 0 in PS/π_alg = 0 is the whole character; both socle and cosocle have dimension 1. For n = 2 the original two-layer description is unchanged. DING25 lines 1525–1529 contain the same unqualified wording; use the preimage formulation when extending to rank one.


2. **F02** (P3) The correction of Ding's constituent notation cites the wrong equation

   **Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:1739`, “Ding, (3.28) and Remark 3.17: C(w, s_(i,σ))”.

   **Claim:** Equation (3.28) is the location of the wrongly typed first argument of C.

   **Witness:** DING25 line 1984, equation (3.32), contains C(w(φ), s_(i,σ)); lines 1859–1872, equation (3.28), instead give a compatibility diagram for the parabolic extension maps.

   **Exact repair:** Replace “Ding, (3.28) and Remark 3.17” in the Source corrections bullet with “Ding, (3.32) and Remark 3.17”.

   **Retest:** Both corrected locators, DING25 lines 1984 and 1989, contain the permutation/character-tuple mismatch being corrected; (3.28) remains correctly cited in §9.6.

3. **F03** (P2) Two different compact-type notions are used without definitions

   **Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:650`, “V is Fréchet of compact type if and only if V^∨ is LS of compact type”.

   **Claim:** The earlier classical compact-type convention supplies the predicates in this equivalence and in the flatness target. It does not: that convention concerns inductive limits of Banach spaces.

   **Witness:** BCGP25 lines 958–975 define three distinct predicates. E^ℕ is an inverse limit of finite-dimensional Banach spaces with compact transitions; its dual is ⊕_ℕ E. E^ℕ is not a classical compact-type LB space.

   **Exact repair:** Add before §3.1(ii): “For Smith spaces, call a map f : V → W trace class if some g : E → V^∨ ⊗_(E_■) W gives f = (ev ⊗ id) ∘ (id ⊗ g). An LS space is of compact type if it admits an injective Smith presentation with trace-class transitions. A Fréchet space is of compact type if it admits a Banach inverse-limit presentation with compact transition maps. These are distinct presentation conditions; the former agrees with classical LB compact type, and the latter with nuclear Fréchet spaces over E. Prove these comparisons (BCGP25 Definitions 2.2.10, 2.2.12 and Proposition 2.2.13; RJRC22 Corollary 3.38).” Qualify the abbreviated API equivalence by “Fréchet” and “LS” on its two sides.

   **Retest / Checks to add:** “E has both presentations with finite-dimensional identity transitions. E^ℕ = lim E^n has compact projections and dual ⊕E = colim E^n with trace-class inclusions. The identity of c_0(ℕ,E) is not compact (the unit vectors remain distance 1 apart); its Banach/Smith duality alone does not assert compact type.” These distinguish the two limit directions and exclude treating every Banach or Smith space as compact type.

4. **F04** (P1) The parabolic embedding needs a comparison of extension classes

   **Location:** `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:1526`, “because both have socle π_alg and the constituents of π_(F_P)/π_alg occur once in π_1/π_alg”.

   **Claim:** Matching the socle and these multiplicities suffices to extend the fixed inclusion of the socle to an embedding π_(F_P) → π_1.

   **Witness:** For the quiver with two arrows 1 → 2, dimension-(1,1) representations with arrow pairs (1,0) and (0,1) have identical simple socle and quotient, each once, but no embedding extending their socle identity.

   **Exact repair:** Replace the quoted inference by: “For each C ∈ S_(F_P), let E_C be its inverse image in π_(F_P). Prove that E_C, with its marked copy of A = π_alg, is isomorphic to the inverse image of C in PS_1(w(φ),h) for a compatible refinement w. For an internal block, take the corresponding length-two subrepresentation of the block principal series, induce with the other blocks' algebraic socles, and use the embedding into the full principal series in Ding's proof of Lemma 3.10. For a block boundary, use the length-two parabolic Verma quotient and Orlik–Strauch transitivity, as in the proof of BH20 Proposition 5.9. These identifications give maps E_C → π_1 agreeing on A. Their sum gives π_(F_P) → π_1; its kernel is zero because A is essential. Any two such maps differ by a map from ⊕ C to π_1, which is zero.” Add §§4.5, 6.2–6.3 and 8.7 to the proof inputs. Keep §8.9's opposite Ext group omitted only with this explicit construction.

   **Retest:** For GL_3 and blocks (2,1), the labels {1}, {2}, {1,2} are covered by the two compatible refinements; the first two use block extensions and the third the boundary extension. The map has length 1+3d_L and zero kernel. In the quiver counterexample the newly required marked-extension isomorphism fails: commuting with the first arrow forces the socle map to be zero. DING25 lines 1782–1786 and BH20 lines 1244–1252 supply the two concrete constructions, rather than the invalid multiplicity inference.

## Verification of the round-1 findings

Here a/Fxx and b/Fxx mean the corresponding finding in the two round-1 reports. The following are separate decisions on all sixteen findings, not acceptance of the repair report's assertions. Locations without a prefix refer to `packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md`.

| Earlier finding | Status and repaired passage | Witness at this head |
|---|---|---|
| a/F01, missing weak-null signature | **Partly repaired; remainder settled, not re-raised.** Suggested.lean:55: “The general locally convex inputs of Layer 0 … are README targets, not headlines.” | The explanatory omission is repaired. The theorem remains absent. The repair's classification as a supporting input to §2.3, rather than an acceptance headline, is consistent with the headline-only rule. In c_0, e_n pairs to 1 with the all-ones functional; p^n e_n has norm p^−n → 0. |
| a/F02, duplicate supplier gaps | **Repaired.** README:77: “§1.4: for a Fréchet–Stein algebra A … independence … Theorems A and B”; “§1.5 … the Banach algebras D_r … and D_(<r)”. | LocallyAnalyticDistributionsPartII §§1.4–1.5 at its supplied head contain these targets. Both superseded gap slugs are absent from README and plan.json. H = 1 gives A = E and finite-dimensional modules; the radius clauses now keep rational noetherian radii. |
| a/F03, GL topology locator | **Repaired.** README:99: “RG2.0.3 (*general-linear-points-homeomorphism*)”. | `TauCetiRoadmap/ReductiveGroupsPartII/README.md:746` is that target, inside RG2.0.3. The contract, §0.1 and Layer 0 dependencies agree. |
| a/F04, undefined block character space | **Repaired.** §8.1(v): “Hom_(P,g′)(T(L), E) … ψ − Σ_j ψ_j ∘ det_j is smooth”. | DING25 lines 859–861. For GL_3 over ℚ_p: B gives dimension 6, G gives 4, blocks (2,1) give 5; log(t_1t_2) belongs and log(t_1) does not. §9.6 now uses that domain. |
| a/F05, unowned Mahler exactness | **Repaired.** §2.3: “Mahler-analytic stages”; the target includes flatness, dual base change, exactness and the shifted comparison. | CD14 lines 1799–1829; the supplier §2.5 owns the definition, not these results. For p = 2, a ↦ 3^a has stage 1 equal to 0 and stage 2 equal to E. Both s_1 at p = 2 and p = 3 lie strictly between 1/p and 1. No exact equality of analytic radii is asserted. |
| a/F06, evaluation equivariance | **Repaired.** §7.3: “induced U(g)-linear map”. | EMJ2 lines 80–111 and 186. For diag(p,1), the cutoff 1_(ℤ_p) becomes 1_(pℤ_p), so no P-equivariance was restored accidentally. |
| a/F07, locally L-analytic enveloping injection | **Repaired.** §0.4(iv): “U(g ⊗_F E) ↪ D_F(H, E)”. | ST02 lines 343–401 construct the local-field map; the roadmap supplies its PBW argument instead of attributing it to the ℚ_p-only supplier. For L = ℚ_p(√p), the distinguished tangent vector pairs to 1 with z, the other embedding's vector to 0. |
| a/F08, omitted Layer 4 docstring | **Repaired.** Suggested.lean:32: “Layer 4: the highest-weight theory … the parabolic categories O^p_alg … restricted BGG duality … Kostant homology”. | All six Layer 4 targets are covered by this bullet's description. The native Verma API's nondegenerate-Killing hypothesis excludes gl_n; no declaration with a fake category-O carrier was added. |
| b/F01, locally L-analytic enveloping injection | **Repaired.** Same repaired passage in §0.4(iv), separately checked for this duplicate finding. | The ℚ_p enveloping map followed by the L-analytic quotient kills the unwanted embedding summands; its kernel is not declared zero. The factored L-map pairs x^k with z^k to k!, including p = 2. |
| b/F02, highest-weight supplier drift | **Repaired.** README:61–65 names the pinned Tau Ceti declarations; README:115 retains “LieHighestWeight … §9.1 … §9.2”. | Native files have the stated algebraically closed / triangularisable hypotheses. Main's LieHighestWeight §§9.1–9.2 supply reductive reconstruction and U(g)'s central tensor factor. The source of the general central-semisimplicity extension is explicit base change, not an overstatement of the pinned theorem. |
| b/F03, noncompact regular representation | **Repaired.** §0.5 Check: “For compact G”. | EM17 line 3463 has this hypothesis. On ℚ_p the displayed functions supported on p^−m+p^mℤ_p give coordinate orbit functions 1_(p^mℤ_p); no fixed p^Nℤ_p works for all m. |
| b/F04, density from faithful flatness | **Repaired.** README:85: “the density of the Dirac span is LocallyAnalyticDistributionsPartII §1.1”. | That supplier explicitly includes density. E → E⟨T⟩ is faithfully flat but its constant image is closed and proper, so the repaired separation of the two inputs matters. |
| b/F05, Ext-character cycle | **Repaired.** §1.9 gives the isomorphism directly; §5.3 says “by 1.9 (iii)”. | Multiplication of the two upper unipotent matrices adds a(s)+a(t); a change of splitting leaves a unchanged. For ℚ_p^× both sides have basis valuation, logarithm and dimension 2. The backward §1.9 → §5.3 proof dependency is gone. |
| b/F06, wrong name for the map into PS | **Repaired.** §8.11: “the composite of (3.10) with the push-forward along PS_1 ↪ PS”. | DING25 lines 1641–1649. For GL_2(ℚ_p), its target has dimension 4; ζ_w's ambient π_1 target has dimension 5. These are no longer identified. |
| b/F07, connectedness for central action | **Repaired.** §1.10: “split connected reductive over L”. | Reflection in O_2 takes the Lie generator x to −x, so x need not commute with that component. The connected hypothesis excludes this example; the added Ad-invariance argument covers all G(L), not only a small compact subgroup. |
| b/F08, tautological algebraic lifting | **Repaired.** §4.2(iii): “every finite-dimensional 𝔩_P-stable, respectively 𝔭-stable, subspace … carries a unique algebraic action”. | OS15 lines 342–353. The standard sl_2 module lifts for SL_2's lattice ℤϖ, and not for PGL_2's lattice 2ℤϖ. The revised target is a lifting theorem, not the former definition restated. |

The four new findings above are not re-raises of the settled weak-null signature dispute. No new false statement was found in the Mahler-stage repair or in the field-of-analyticity repair.

## Adversarial calculation record

The standing coefficient field is a finite extension of ℚ_p, containing all embeddings of L. Thus the zero ring, equal-characteristic fields, inseparable extensions, q = 1 and arbitrary residue rings are outside the quantified domain, not zero-denominator counterexamples. The analytic-group theorems allow dimension zero; the GL_n extension theorems use n ≥ 1; the endpoint theorems explicitly use n ≥ 2. Characteristic 2 is excluded, but residue characteristic 2 is not. All factorials used in PBW pairings remain nonzero at p = 2. Finite-dimensional smooth factors, strictness, connectedness and compactness are retained where the rows below use them.

### Suggested.lean inventory and acceptance headlines

| Declarations | Section / variables / instances | Signature comparison and one-tactic probe |
|---|---|---|
| None (63 lines read) | One namespace; no sections, variable declarations, definitions, instances or theorems | There is no own declaration to elaborate with `#check @name`, and no padding declaration to delete. No Lean process was run. The single import is Mathlib. |

The acceptance headlines are the admissible-representation/coadmissible-module anti-equivalence and Ext¹ comparison (Layers 0–1); strong LA-acyclicity (2); solid smooth representations and the derived-analytic comparison (3); split highest-weight/category-O, BGG and Kostant theory (4); the spectral sequence and Orlik–Strauch results (5–6); the two adjunctions (7); the ζ isomorphisms, Ext dimension, parabolic compatibility and embedding decomposition (8–10). All are named in the module docstring. The missing representation, distribution, solid-coefficient, category-O and Jacquet carriers prevent stating these headlines at the pins with only a few simple definitions. Supporting general linear/topological facts are not counted as substitute headlines. The native declarations cited in the supplier contract are not new declarations of this roadmap.

### Conventions

| Statement | Instance and computed values on the two sides | Result / change |
|---|---|---|
| 1, fields and norms | L/ℚ_p totally ramified quadratic: d = 2, f = 1, |ϖ|_L = p^−1; unramified quadratic: d = f = 2, |p|_L = p^−2. For L = ℚ_p(√p), x⊗1 maps to (√p,−√p). | Distinguishes degree from residue degree and both embeddings. |
| 2, analyticity | On L = ℚ_p(√p), id has derivatives (1,0); conjugation has (0,1). | ℚ_p-analytic does not imply analyticity for the specified L-embedding. |
| 3, contragredient | χ(g) = a on a line gives gλ = a^−1λ; χ·χ^−1 = 1. | Inversion is retained. |
| 4, Ext variance | An extension 0 → V₂ → X → V₁ → 0 dualizes to 0 → V₁′ → X′ → V₂′ → 0. | Arguments reverse exactly once. |
| 5, Hecke and Jacquet | diag(p,1) contracts ℤ_p to pℤ_p: index p, δ_B = p^−1; on the trivial representation p^−1·p = 1. | Averaging and modulus agree, including p = 2. |
| 6, weights/permutations | n = 3, w = (123): w(φ) = (φ₃,φ₁,φ₂); first-coordinate additive character moves to the second. With λ = (1,1), s·λ = (0,2). | Inverse-image labelling and the positive inducing weight agree. |
| 7, twists | n = 2: θ = (0,−1), η = (1,|·|), δ_B = (|·|,|·|^−1). For L = ℚ_p, ε(p) = p·p^−1 = 1. | No square root of q is required. |
| 8, solid coefficients | M = 1 gives E_■[M] = E_■, not E with discrete topology. A sequence p^n tends to 0 in E, but not eventually to 0. | Changing the group topology does not discretize E. |
| 9, endpoints | n = 2 gives block sizes (1,1); n = 1 would give a zero block and is excluded. | No natural-subtraction junk case is used. |

### Targets and defining constructions

Each numbered subsection is inventoried below; the additional Mahler subtarget is separate. “Retain” means the displayed computation supplies no counterexample, not that the deep theorem has been re-proved here. The computations cover the section's definitions, signs and boundary cases together with its stated comparisons. S01–S04 qualify the affected rows.

| Target | Instances tried; values computed on each side | Result / change |
|---|---|---|
| 0.1 | GL₁(L): dimension d_L on each side of restriction of scalars; GL₂: 4d_L; trivial group: 0. Quadratic L splits into the two √p-eigenspaces. | Retain. |
| 0.2 | E with χ(a) = (1+p)^a has an analytic orbit equal to χ; a nonanalytic f in C(ℤ_p,E) has orbit detected by evaluation at 0 equal to f, hence is excluded; V = 0 has the zero orbit. | Retain barrelled/Hausdorff hypotheses. |
| 0.3 | Smooth character: derivative 0; x ↦ x^k: derivative at 1 is k; σ-character over quadratic L: actions (k,0). The bracket on an abelian Lie algebra is 0 on both sides. | Retain decomposition and differentiation. |
| 0.4 | H = 1 gives U(0) = D(1,E) = E; a discrete infinite group gives direct sum E[G], not product. δ_(12)δ_(23) = δ_(123) in S₃, reverse order gives δ_(132); inversion reverses products. diag(p,1) conjugates e₁₂ to p e₁₂. Local-field PBW: x^k(z^k) = k!, unwanted embedding derivative = 0. | Retain the repaired field factorization. |
| 0.5 | Trivial action: μv = μ(1)v. On a character: x acts by dχ(x). Compact regular action: δ_g f = f(·−g). Noncompact ℚ_p example gives coordinate orbit 1_(p^mℤ_p), nonanalytic on a fixed larger disc. | Repaired compactness Check is necessary. |
| 0.6 | χ-line dual is χ^−1; zero dual is 0; C^an(H,E) dual is the regular D(H,E), rank one. | Retain contragredient anti-equivalence. |
| 0.7 | For χ-line, F_1(1)(g) = χ(g); for G = ℤ, dual of product E^ℤ is direct sum E^(ℤ), whose strong dual returns E^ℤ. | Continuity route uses product topology, not false compact-type/reflexivity equivalence. |
| 0.8 | In c₀, ‖e_n‖ = 1 and the all-ones functional gives 1; ‖p^n e_n‖ = p^−n and every bounded-coefficient functional gives a sequence tending to 0; zero sequence gives 0 in both topologies. | Retain; no real/complex Schur assertion is being made. |
| 0.9 | Dimensions 2 and 3 give tensor dimension 6; characters a,b give product a(g₁)b(g₂), diagonal differential a′+b′; a zero factor gives 0. | Retain, conditional on the declared strict-tensor contract. |
| 1.1 | H = 1: coadmissible means finite-dimensional over E. For infinite discrete G, E[G] restricts to an infinite-dimensional E-module and fails coadmissibility. A character restricts to dimension 1 for every H. | Retain distinction from finite presentation over D(G). |
| 1.2 | Compact regular dual is free rank 1; zero representation fails nonzero irreducibility; an irreducible line has only closed subspaces 0 and E. | Retain separate strong-admissibility/irreducibility predicates. |
| 1.3 | A finite-dimensional χ-line is sent to χ^−1 and back to χ; for H = 1 this is ordinary finite-dimensional duality; zero goes to zero. | Retain. |
| 1.4 | Zero map V → W has kernel V, image 0 and cokernel W; identity has kernel/cokernel 0. Infinite discrete regular E[G] is finitely presented over itself but not coadmissible over E. | Retain the noncompact restriction. |
| 1.5 | Two compact regular representations give D(H₁×H₂) of rank 1 over itself. Restriction to a diagonal leaves an independent distribution variable and infinite rank; a zero factor gives 0. | External admissibility does not imply internal admissibility. |
| 1.6 | In Sym², n(t)(e₁e₂) = e₁e₂+t e₁²; a smooth vector has derivative 0. Trivial action on infinite c₀ does not give the finest topology; the one-dimensional trivial representation does. | Retain topology and finite-dimensional algebraic factors. |
| 1.7 | ℤ_p with trivial coefficients has H¹ dimension 1; ℚ_p^× has analytic additive-character dimension 2 versus smooth dimension 1; G = 1 has Ext¹_E(E,E) = 0. | Retain Ext in all distribution modules. |
| 1.8 | Upper-unipotent extension with a(g+h)=a(g)+a(h) gives group multiplication; a=0 splits; logarithm on ℚ_p^× is not smooth, valuation is. | Retain admissible-extension comparison. |
| 1.9 | On V⊕V, ε(a,b)=(0,a), ε²=0; a character deformation has (1+εa)(1+εb)=1+ε(a+b). U=0 gives no universal directions. | Repaired proof precedes §5.3. |
| 1.10 | Unequal dominant weights: central characters separate and Ext=0. A fixed-central-character trivial GL₂ example has analytic H¹=0, while unrestricted determinant characters give dimension 2. O₂ reflection sends x to −x and is excluded by connectedness. | Retain corrected low-degree comparison, not concentration. |
| 2.1 | χ(x)=x on ℚ_p^× has no globally invariant norm, but on ℤ_p^× has invariant lattice O_E. Compact regular Banach dual has Iwasawa rank 1; trivial infinite c₀ dual is not finitely generated over E. | Nonunitary representations are included correctly. |
| 2.2 | A finite-dimensional analytic character is its own ambient Banach representation; compact regular analytic vectors embed in C(H,E); zero embeds in zero. | Retain very strong admissibility. |
| 2.3 | Finite G: G₀=1, every stage is B, higher cohomology 0. Regular C(ℤ_p,E): degree 0 equals C^la, a proper subspace; higher groups vanish under §2.5. | Retain derived stages. |
| 2.3 Mahler stages | Trivial line gives E at every h. χ(a)=ζ_p^a: v_p((ζ_p−1)^k)−kr₁=0, so stage 1 is 0; at h=2 the difference tends to +∞, so stage 2 is E. For p=2, χ(a)=3^a has the same 0/E outcome. b²=0 on a unipotent E² gives all of E² at every stage. At k=p^m−1, the supplied function has v(a_k)−v(k!)=⌈√m⌉→∞ but v(a_k)−kr₁=⌈√m⌉−m→−∞. | Exactness and shifted comparison do not collapse distinct radii. |
| 2.4 | A split sequence B₁→B₁⊕B₂→B₂ gives the direct-sum long exact sequence and zero connecting maps. Dense nonclosed diagonal range on c₀ would have non-Hausdorff quotient, excluded by strictness. | Retain strict sequences. |
| 2.5 | C(G₀,E) has R⁰=C^la and Rⁱ=0 for i>0; zero gives all zero. Trivial c₀ is not admissible but lies in the tensor clause E⊗̂_ℚp c₀(ℚ_p)=c₀(E). | No admissibility inference from the tensor clause. |
| 3.1 | (c₀)^∨=(∏O_E)[1/p], excluding (p^−n); (∏E)^∨=⊕E. Finite E has dual E; identity on c₀ is noncompact as unit-vector distances are 1. | S03: specify the two compact-type predicates. |
| 3.2 | G_m-character t^k has coaction v↦v⊗T^k, and both iterated coactions give v⊗T^k⊗T^k. A nonconstant locally constant finite-order character cannot be a rigid function on a connected disc. | Coaction is stronger than a continuous point action. |
| 3.3 | Trivial group: Banach comparison is identity; an affinoid disc has Banach functions and Smith distributions. G_m has global Fréchet functions, so its distribution dual is generally LS rather than one Banach stage. | Retain stage/global distinction. |
| 3.4 | Finite M gives E[M]; M=ℤ_p gives bounded-denominator Iwasawa series, excluding ∑p^−nT^n. M=1 gives E. | Retain solidified, topological group ring. |
| 3.5 | χ(x)=x is not smooth on any open subgroup, but is locally analytic and λ-smooth in the stated sense. Trivial direct sum has every vector fixed; zero has zero invariants. | The two smoothness notions remain separate. |
| 3.6 | Finite M=M_disc gives identical actions and invariants. For ℤ_p, any smooth vector factors through some finite quotient; an analytic nonlocally-constant character does not. | Restriction does not discard the smoothness hypothesis. |
| 3.7 | M=1 gives Mod(E); a Smith free generator on a one-point set gives E. An infinite Smith generator has bounded denominators, excluding (p^−n), despite admitting all integral coordinate vectors. | Native solid generator theory is required, not ordinary discrete vector spaces. |
| 3.8 | Invariant orbit function f(g)=χ(g)v has f(1)=v; right translation yields χ(h)v, not χ(h)²v. For ℚ₂, two analytic discs give two independent idempotents, not four from double-counting cosets. | Evaluation radius and output action agree. |
| 3.9 | Regular functions on ℤ_p: H⁰=E and H¹=0 on both compared sides; finite group averaging gives higher Hⁱ=0 in characteristic zero. | Retain coefficient and analytic hypotheses. |
| 3.10 | A finite-dimensional algebraic representation integrates its Lie action; zero integrates to zero. An infinite Verma module with finest topology has no finite-dimensional invariant Banach exhaustion and is excluded. | Retain integrability condition. |
| 4.1 | gl₂: det dimension 1, Sym^k dimension k+1; abelian g: M(μ)=L(μ)=k_μ. Dot-orbit of (0,0) contains (−1,1), not (1,−1). Central matrix (0,3;1,0) over ℚ₃ splits only over ℚ₃(√3), where eigenvalues are ±√3. | Retain the field-descent route, distinct from the native triangularisable case. |
| 4.2 | SL₂ weights ±ϖ lie in ℤϖ; for PGL₂ they do not lie in 2ℤϖ. gl₂ weight (1/2,0) lies in O but not O_alg. The ℚ₃[t]/(t²−3) module has dimension 2 and zero ℚ₃-weight space. | Repaired algebraic lifting and split-weight definition discriminate. |
| 4.3 | gl₂ weight (0,2) has negative simple-coroot pairing and maximal parabolic B; dominant weight gives G. gl₃ weight (2,0,1) is integral dominant only on α₁, giving the (2,1) Levi. | Retain maximal-parabolic selection. |
| 4.4 | BGG dual preserves highest-weight label λ, while ordinary algebraic contragredient sends λ to −w₀λ; a Verma head becomes a dual-Verma socle. Zero dual is zero. | The two dualities are not identified. |
| 4.5 | Dominant gl₂ Verma has the two length-0/1 constituents once; n=1 has only its simple character. gl₃ has two simple-reflection constituents, but the (2,1) parabolic quotient retains only the α₂ boundary one. | Retain multiplicity-one and radical-layer claims. |
| 4.6 | For λ=(k,0), lower nilradical H₀ has weight (k,0), H₁ weight (−1,k+1); upper gives (0,k) and (k+1,−1). P=G has H_q=0 for q>0. | Signs agree with the declared Kostant supplier gap. |
| 5.1 | P=G: f(g)=g·f(1), so evaluation is inverse to induction. For GL₂, B\G=ℙ¹(L) is compact. In algebraic-tensor induction, f⊗w maps to f(g)⊗g w, satisfying the left covariance. | Retain unnormalised right-translation induction. |
| 5.2 | Trivial inducing character gives constants and a Steinberg quotient, so not a simple principal series. Swapping the two GL₂ entries interchanges upper/lower conventions; the central twist multiplies their characters. | Genericity/dominance cannot be discarded. |
| 5.3 | T=ℚ_p^×: Hom dimension 2, smooth part 1; T=(L^×)² with d_L=2: dimensions 6,2,4 for all/smooth/derivative directions. Rank-zero torus gives 0. | Self-Ext and additive-character dimensions agree. |
| 5.4 | For upper N of GL₂ and trivial W, H₁(n,W) has root weight (1,−1); a smooth cuspidal factor has Jacquet module 0, hence zero tensor homology. N=1 has only H₀=V. | Homology, not cohomology, gives the sign. |
| 5.5 | P=G collapses the spectral sequence to ordinary Ext. For GL₂ and inducing algebraic weight (0,2), the trivial representation's relevant homology weights (0,0),(−1,1) do not match, so the corresponding terms vanish. | Retain hypotheses on the locally algebraic input. |
| 6.1 | A Verma input of weight −λ produces inducing weight +λ; finite-dimensional simple input produces L(λ)⊗smooth induction. For a torus, the presentation kernel is zero. | Contravariance accounts for the sign. |
| 6.2 | For 0→K→M→L→0, outputs run 0→F(L)→F(M)→F(K)→0; M=0 yields 0. A length-two gl₂ module gives length-two output in the generic case. | Retain both variables' stated exactness. |
| 6.3 | For lower GL₂ unnormalised induction, reducibility ratios are 1 and |·|^−2; multiplying by the normalising modulus shifts them to |·| and |·|^−1. Ratio |·| has normalized ratio |·|², not a reducibility point. | Unnormalised convention is essential. |
| 6.4 | Smooth argument 0 makes F(M,0)=0 for different M, defeating recovery; it is excluded. Nonzero weight-0 and weight-1 torus inputs yield distinct output characters 0 and −1. | Retain nonzero and maximal-parabolic hypotheses. |
| 6.5 | Generic GL₂ principal series has two factors; GL₃ has six, each once in the tested regular case; a torus has one. | Retain finite length and socle calculation. |
| 6.6 | Product GL₂(ℚ_p)×GL₂(L), [L:ℚ_p]=2, gives 2·4=8 generic factors; replacing a factor of length 2 by length 3 gives 3·4=12. Zero factor gives zero. | Products multiply, not add, lengths. |
| 6.7 | A single simple reflection has length 1 and Ext¹ dimension 1 in the generic example; two reflections in different embeddings have total length 2 and the asserted Ext¹ is 0. | The strict inequality lg(s)>1 is necessary. |
| 7.1 | diag(p,1): index p, averaging p^−1; trivial input yields average 1, while unaveraged action would give p. P=G has N=1 and identity adjunction. | Retain δ_P twist. |
| 7.2 | Dominant GL₂ data give a proper locally algebraic closed induction inside the full principal series; an antidominant simple Verma gives the full simple induction. P=G gives U. | Distinguishes closed and full induction. |
| 7.3 | diag(p,1) sends cutoff 1_(ℤ_p) to 1_(pℤ_p), unequal at a unit; P=G evaluation is identity. A simple generalized Verma has zero kernel, so balancing is automatic there. | Repaired U(g)-linearity is correct. |
| 7.4 | For smooth input the upper Jacquet character is the lower inducing character times δ_B; zero input gives zero Hom on both sides. P=G gives ordinary Hom(U,V). | Retain balance and very strong admissibility. |
| 7.5 | Over ℚ₃ an unramified two-dimensional representation with Frobenius (0,3;1,0) has no coefficient-field eigenline; after ℚ₃(√3) it has two. Generic GL_n principal series has n! Jacquet characters; supercuspidal has none. | Correct finite-extension formulation. |
| 7.6 | U=W′πδ^−1 gives Uδ=W′π; category-O weight −s·λ becomes inducing weight +s·λ. π=0 gives zero on both sides. | Twists cancel in the claimed direction. |
| 8.1 | n=3: θ=(0,−1,−2); blocks (2,1): θ_P=(0,0,−2). At d=1, dim Hom=6 and dim Hom_(P,g′)=5; log t₁ is excluded, log(t₁t₂) included. | Repaired block-character definition works. |
| 8.2 | n=1 gives φ₁z^h₁; n=2, h=(1,0) gives λ=(1,1), hence det. Nongeneric smooth parameters can make the smooth induction reducible. | Retain genericity. |
| 8.3 | ηz^λ=z^h ε^−θ, so n=2 gives z^h ε(t₂). n=1 reduces to a character; a nonidentity Weyl element gives a non-locally-algebraic constituent. | Algebraic and smooth twists agree. |
| 8.4 | n=3 principal series has six constituents and two simple-reflection constituents above its socle; n=2 gives two. For w=(123), left multiplication by a permutation preserving {1} preserves w^−1({1})={3}. | Inverse-image labels agree with isomorphism classes. |
| 8.5 | n=2 gives 2d labels, n=3 gives 6d, n=1 gives 0. For λ=(1,1), s·λ=(0,2) has central exponent 2; the negative weight would give −2. | Retain positive induction weights. |
| 8.6 | n=2: desired H₁ weight (0,2) matches its inducing character, yielding Hom dimension 1; H₀ weight (1,1) does not. n=1 has no such constituent. | Retain T(L), not T(ℚ_p). |
| 8.7 | n=1: PS₁=π₁=π_alg is one-dimensional, actual cosocle dimension 1 versus displayed empty sum 0. n=2: length 1+2d; n=3: length 1+6d. | S01 fixes the conflicting cosocle description. |
| 8.8 | dim self-Ext=n+d and locally algebraic part=n. At n=3,d=1, unramified tuple (2,4,8) has symmetric coordinates (14,56,64); deforming first entry has tangent (2,24,64), unchanged by permuting the tuple and corresponding direction. | Correctly typed ordered-character transport. |
| 8.9 | Each simple-reflection Ext¹ has dimension 1. A nonsplit two-dimensional self-extension has one-dimensional Hom to its residual character; a split sum has dimension 2. n=1 has no C labels. | Nonsplit hypothesis is necessary. |
| 8.10 | n=1 gives Hom(L^×,E) itself. n=2,d=1: two source spaces of dimension 4 span target dimension 5, so their direct sum map has kernel dimension 3. | No injectivity of the total map is asserted. |
| 8.11 | n=2,d=1: Hom and Ext¹ into PS₁ both dimension 4; ambient Ext¹ into π₁ has dimension 5. For d=2, PS₁ dimension is 6. | The repaired map name matches its codomain. |
| 8.12 | n+(2^n−1)d gives 1+d at n=1, 5 at n=2,d=1, 10 at n=3,d=1. Restricting I to {1,…,n−1} would lose one of the two n=2 constituents. | Full subset index set is necessary. |
| 8.13 | n=2 over ℚ_p has π=π₁; n=3 has higher constituents in π/π₁ but Ext¹ remains dimension 10. n=1 both equal the character. | Higher-length Ext vanishing is the needed input. |
| 8.14 | n=2,d=1 dimensions are 2⊂3⊂4 inside 5; n=1 smooth dimension 1 versus analytic 1+d. For n=3,d=1, refinement dimension 6 is less than total 10. | Proper inclusions are not collapsed. |
| 9.1 | For n=3, blocks (2,1), w=(123), smooth tuple is (φ₃,φ₁;φ₂), singleton weight h₃; θ_P=(0,0,−2). B gives principal series, G gives π₁. | Positional index and block twist agree. |
| 9.2 | Standard (2,1) filtration gives labels {1},{2},{1,2}; {3} is absent. B gives n−1 labels per embedding; G gives 2^n−2. | Retain the socle-of-quotient clause as well as multiplicity. |
| 9.3 | For (2,1), count (2²−2)+(2¹−2)+(2−1)=3; B gives n−1, G gives 2^n−2. Kronecker extensions (1,0),(0,1) have equal layers but no marked embedding. | S04 supplies the missing extension-class comparison. |
| 9.4 | n=3,d=1, blocks (2,1): 3+2+(2+0)=7; B gives 6; G gives 10. | Dimension formula agrees with the sum of block extension dimensions, conditional on S04. |
| 9.5 | With three extensions dim A_i=1, dim B_i=2, the degree-one kernel in the tensor quotient is a direct sum of dimension 2+2+2=6; the reversed expression has dimension 4+4+4=12. For one factor the kernel is B₁, not A₁. | Corrected filtration and additive Baer construction retain one direction per factor. |
| 9.6 | Blocks (2,1), n=3,d=1: source dimensions 5+2=7, target 7. Block-central directions have dimension 3+2=5, versus all Hom dimension 6. | Restrict transition identity to Hom_(P,g′). |
| 9.7 | n=3,d=1: endpoint dimensions 7+7 minus overlap 4 give 10; n=2: 4+4−3=5. n=1 is excluded. | Endpoints and intersection dimension agree. |
| 10.1 | On a quadratic L, τ has other-embedding derivative 1 and is algebraic but not σ-analytic; τ^(1/2) has derivative 1/2 and is not algebraic. Changing the embedding by squaring changes the allowed weights from ℤ to 2ℤ. | Algebraic-group embedding is necessary data. |
| 10.2 | π_(1,σ) has length 1+(2^n−2); PS_(1,σ) has length n. For n=2,d=2, amalgamating two σ-parts over one socle gives length 1+2·2=5. | No duplicate algebraic socle. |
| 10.3 | σ self-extension dimension n+1: n=2,d=2 gives 3, while all self-extensions have dimension 4; n=1 gives 2. | Restricting one derivative embedding removes d−1 directions. |
| 10.4 | n=3: 2n=6=(n+1)+(n−1); n=1: 2=2+0. | Exact sequence and source dimension agree. |
| 10.5 | n=2,d=2: each σ-space dimension 5; after quotienting the smooth dimension 2, the two contributions total 3+3=6; adding smooth directions gives 8. | The smooth overlap is counted once. |
| 10.6 | n=3, blocks (2,1): σ-extension dimension 7; B gives 6 and G gives 10. d=1 recovers §9.6. | Parabolic σ-comparison agrees with full theory at d=1. |
| 10.7 | n=2: 4+4−3=5; n=3: 7+7−4=10 in each σ-part; n=1 excluded. | Retain endpoint hypothesis. |

## Verified sound

Read counts: **1,778 README lines; 63 Suggested.lean lines; 0 Lean declarations; 86 numbered target sections and the additional Mahler target; 321 Check bullets in 86 Check blocks**. The calculation record has 87 target rows and nine convention rows. Check bullets were compared with the target and neighbouring formulas; the rows consolidate the discriminating computations rather than reproduce the Check text. This is a mathematical review, not a Lean proof of those computations.

The repair verification covers **16 earlier findings**: fifteen repaired, and the weak-null signature finding partly repaired with its remaining omission settled. The new defects are S01–S04. The remaining numerical, variance, field-of-analyticity and normalization tests in the table did not produce a counterexample.

The dependency check at this head returned exactly:

```text
depcheck: 239 roadmaps, 2175 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The seven gap slugs agree between the README contracts and `design/plan.json`: barrelled-banach-steinhaus, compact-type-tensor, kostant-split-reductive, generic-principal-series-finite-coefficients, principal-series-jacquet-finite-coefficients, finite-length-finite-coefficients and ordered-character-map. Each names a supplier and a section, and retains the relevant field and topology hypotheses. The two former Fréchet–Stein/radius gaps are gone. No currently absent statement covered by one of these contracts is reported as a new defect.

### Supplier and ownership checks

The supplier audit covers **14 named roadmaps**, with the following section-level bundles checked against main or the supplied open head. There is no fully qualified own Lean declaration that can collide with a sibling. The object searches included category O, Orlik–Strauch, weak-null/Schur phenomena, Mahler stages, solid Smith/LS spaces, locally analytic vectors, coadmissibility and the Ext constructions; searches used the indexed open-roadmap tool as well as the main and pinned trees.

| Supplier | Sections / objects resolved | Mathematical boundary checked |
|---|---|---|
| LocallyAnalyticDistributions | §§0.0, 0.2 | Locally convex lattices, strict maps, the two completed tensors, compact-type duality, Hahn–Banach, open mapping and compact-type extensions; the two extra contracts remain gaps. |
| LocallyAnalyticDistributionsPartII | §§1.1–1.5, 2.5 | Enveloping injection is ℚ_p-analytic; Dirac density is explicit; general Fréchet–Stein and rational-radius results already have an owner; Arens–Michael germs/envelope stay there. |
| NoncommutativeAndEquivariantIwasawa | §§0.1–0.3, 0.6–0.7 | Uniform groups, open-uniform subgroups, finite-index freeness, coordinates and p-valuations; at p=2 the valuation offset is 2. |
| PadicLocalLanglandsForGL2Qp | §§0.1, 2.5 | Compact analytic functions/distributions, admissibility and Banach duality are imported; §2.5 defines Mahler stages. This package owns the added stage exactness/comparison, not another definition. |
| CompletedCohomologyPartII | F.1, F.4 | Banach lattice admissibility and general analytic orbit vectors/derived resolution; the present package adds Pan's acyclicity and its solid comparison. |
| OverconvergentAutomorphicForms | §0.6 | Full character space, essential admissibility, finite slope and averaged Jacquet operators. Its diag(ϖ,1) check gives the same inverse index as Convention 5. |
| ReductiveGroupsPartII | RG2.0.2, RG2.0.3, RG2.4.2, RG2.4.4 | Analytic points, GL units topology, Iwahori factorization and compact flag quotient. |
| SmoothRepresentationsOfLocalGroups | SR.0.1–0.2, 0.4, 0d.1–0d.2, 2.1–2.3, 3.1–3.2, 3.4 | Main has the named smooth, Ext, induction, Jacquet, finite-length and Bernstein targets. SR.3's complex coefficients do not supply the finite-E statements; these are declared gaps. Normalized versus unnormalized induction is explicit. |
| ReductiveGroups | Layers 1, 2, 4, 7, §8.1 and §10B | Algebraic representations, differentials, tori/lattices, parabolics and dominant-weight algebraic representations. The actual group's lattice, not only the root system, is required. |
| RepresentationTheory/LieHighestWeight | §§9.1–9.2 | Reductive reconstruction and central symmetric/enveloping factors; implemented highest-weight results are cited directly from Tau Ceti. |
| ArithmeticLocallySymmetricSpaces | ALS.4.5 | The current Kostant target is in its Weil-restriction setting; the arbitrary split-reductive extension remains the declared gap. |
| VStackSheavesAndLisseCategories | VS2.1–VS2.2 | Solid tensor/internal Hom and p-adic E_■ coefficients. Its classical-space comparison is explicitly left to the functional-analysis consumer, so §3.1 has an owner here. |
| AdicSpacesPartIII | R3.4 | Quasi-Stein exhaustion and Theorems A/B, with dense affinoid restriction maps. |
| PadicMeasuresIwasawaAlgebras | §1.7 | Integral measures and completed group algebra, with a countable finite-quotient presentation. Compact p-adic analytic groups meet that countability condition. |

The nearest supplied heads were compared by scope: PadicHodgeParametersInLocallyAnalyticRepresentations imports this package's Layers 0–10 and owns the later comparison with Hodge parameters; ModpRepresentationsOfGL2OverLocalFields owns torsion/mod-p theory; LocallyAnalyticDistributionsPartII owns the analytic algebras already imported here. PadicLocalLanglandsForGL2Qp and CompletedCohomologyAndLocalGlobalCompatibility own their stated compact/GL₂ and arithmetic inputs, not the present general locally analytic structure theory. No second copy on content main was found. The overlap file's one entry is this roadmap's own open roadmap head; it reports no dropped cited IDs or revision-only numbering.

The head's diff has **11 files, all under `packages/LocallyAnalyticRepresentationsOfLocalGroups/`**. The package's README and Lean do not add process narratives or pull-request numbers, computational algorithms, `set_option`, admitted data, `True` placeholders or padding theorems. References to a source's “Lemma” are source locators, not Lean `lemma` declarations.

Pinned witnesses include `Mathlib/Analysis/LocallyConvex/Barrelled.lean:90` and `:192` (seminorm barrelledness and Banach–Steinhaus); `Mathlib/Topology/Algebra/Module/LocallyConvex.lean:51` (ordered-scalar locally convex predicate); `Mathlib/CategoryTheory/Abelian/Ext.lean:41`; `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45` (an algebraic direct limit, not a topologized manifold-function space); `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basis.lean:96`; `TauCeti/Algebra/Lie/HighestWeight/Verma.lean:195` and `:525`; `TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/Isomorphism.lean:106` and `:159`; and `TauCeti/Algebra/Lie/Reductive/CompleteReducibility.lean:107`. In particular the latter retains the triangularisability instance and does not itself prove the descent extension in §4.1(iii).

### Source verification and independence

**84 grouped source anchors** were inspected in the 26 accessible source files; a range such as a definition together with its immediately following construction is counted once. This count is not a claim to have checked every line of every source proof. The following ledger identifies the inspected theorem/definition anchors; source issues below distinguish errors in those texts from package defects.

| Source | Anchors inspected (count) | Evidence / comparison |
|---|---|---|
| ST02 | Lemma 2.4, Lemma 3.1, Proposition 3.2, Corollary 3.3 (4) | Lines 343–401 and 514–565: local-field enveloping map, Dirac density, separate continuity and duality. |
| ST03 | Lemma 4.8, Theorems 6.3 and 7.1 (3) | Lines 910–920, 1333–1342, 1515–1524; rational radii, coadmissibility and Banach vectors. |
| ST02B | Lemma 3.4 (1) | Lines 514–523: finite generation of the Banach dual. |
| ST01 | Proposition 3.4, Corollary 3.5 (2) | Lines 519–529 and 561–570; the source's semisimple/simply-connected setting is not silently used as a general classification. |
| EM17 | Propositions 1.1.31–1.1.32, 3.5.12, 6.2.2, 6.3.2, 6.5.9 (6) | Lines 901–931, 3463, 5898, 6094, 6696; compactness and finest topology retained. |
| EMJ1 | Theorem 0.6 (1) | Lines 152–157; coefficient-field issue recorded below. |
| EMJ2 | Definition 0.8, Lemma 0.18, Theorem 0.13, Corollaries 0.14–0.15, Proposition 2.1.2, Theorem 5.2.18 (7) | Lines 80–111, 142–152, 186, 977–990, 3268–3281; balancing, induction and finite-dimensional Jacquet arguments. |
| OS15 | §2.5, Definition 2.6, Example 2.7, Lemma 2.8 (4) | Lines 300–353; finite coefficient field and the group-dependent algebraic lattice. |
| OS10 | Theorem 3.1.3 (1) | Lines 433–445; simple enveloping input implies irreducible principal series. |
| OR19 | Theorem 1 (1) | Opening statement: locally L-analytic functor with trivial smooth argument; not blanket full faithfulness in the later ℚ_p-analytic setting. |
| BR16 | Corollary 2.7 (1) | Lines 501–510; zero smooth argument defeats recovery. |
| BR15 | Proposition 4.2, Theorem 4.3, Remark 4.4 (3) | Lines 530–540, 596–603, 650–661; smooth finite length and very strong admissibility retained. |
| BR19 | Lemma 2.1.1 (1) | Lines 405–415; extension/abstract-distribution-module comparison. |
| SCH11 | Proposition 4.7 (1) | Lines 1679–1695; central-character restriction and incorrect concentration claim distinguished. |
| DING19 | Lemma 2.26 (1) | Lines 1084–1097; the source explicitly assumes lg(s)>1 and finite-length smooth Levi input. |
| BH20 | Definition 5.7, Proposition 5.9 (2) | Lines 1216–1259; essential-socle quotient and comparison of repeated marked extensions. |
| BHS19 | Lemma 5.2.1 (1) | Lines 3716–3740; product-group adjunction with the contragredient and modulus. |
| DLB17 | Lemmes 5.9–5.10 (2) | Lines 1153–1168; matrix coefficients, duality and weak-null theorem. |
| BCGP25 | Proposition 2.2.9, Definitions 2.2.10 and 2.2.12, Proposition 2.2.13, Lemma 2.2.14, §2.2.27, Definition 3.4.2 (7) | Lines 927–999, 1096–1109, 2444–2449; the three compact-type presentations and analytic stages. |
| RJRC22 | Corollaries 3.17 and 3.38, Lemma 3.39, Theorem 3.40 (4) | Lines 784–791, 1248–1299; tensor/Hom, presentations and duality. |
| PAN22 | Theorem 2.2.3, Corollary 2.2.4 (2) | Lines 573–598; the two-stage shift and the completed tensor clause. |
| CD14 | Proposition IV.4, Théorème IV.6, Lemme IV.7, Corollaire IV.8, Proposition IV.13, Corollaire IV.14 (6) | Lines 1670–1835; Mahler-stage topology, base change and exactness. |
| CEGGPS | Lemma 3.22 (1) | Lines 1921–1930 prove the Bernstein-centre identification. They are not, by themselves, a proof of every tangent/Ext clause of the declared gap. |
| DING25 | (2.21); Proposition 3.1; Lemma 3.2; PS₁/π₁ construction; Proposition 3.3; Lemma 3.5; Propositions 3.6 and 3.8; Remark 3.9; Lemma 3.10; Propositions 3.11–3.13; Lemma 3.15; Proposition 3.16; Remark 3.17; Propositions 3.18–3.20 (19) | Lines 859–861 and 1415–2074; complete locally analytic §3.1 read, including the displayed maps, all parabolic and single-embedding formulas. |
| BZ77 | §1.8 and Theorem 4.2 with Remark (2) (2) | Lines 158–169 and 550–559; source uses normalized induction, so its ratios must be transported. |
| STACKS | Tag 079H / Theorem 11.7 (1) | Lines 730–731: functorial injective embeddings in a Grothendieck category. |

The README contains **225 explicit source-attributed citation occurrences** before the reference list, counting a citation with several theorem/equation numbers as one occurrence and including the Source corrections. DING25 accounts for **52**. The count separates ST02B's “Schneider–Teitelbaum 2002, Israel J.” citation from ST02's JAMS paper.

The prose comparison recorded eighteen passages across fourteen sources: §§0.4–0.5 against ST02; §§0.7–0.8 against DLB17; §0.9 against EM17; §2.3 against CD14; §2.5 against PAN22; §3.1 separately against BCGP25 and RJRC22; §4.2 against OS15; §6.4 against BR16; §6.7 against DING19; §7.3 against EMJ2; §7.6 against BR15; §§8.5, 8.8 and 9.5 against DING25; §8.7 against BH20. The definitions' unavoidable mathematical clauses and displayed formulas were separated from exposition. No copied exposition, table, figure, exercise list or non-pinned formalisation was identified in these comparisons.

DING25's contents (lines 17–31) organize the paper around Hodge filtrations, locally analytic representations, Hodge parameters and local-global compatibility. The roadmap omits the Hodge-parameter and arithmetic chapters, supplies ten other analytic/algebraic source families in its foundations, combines DING25 §§3.1.1–3.1.2 in Layer 8, and separates parabolic and single-embedding compatibilities in Layers 9–10. The order of those last layers is forced by §9.6's use of §8.12 and §10.6's use of §9.6. There is no one-to-one run of source chapters with the same scope throughout the roadmap. The supporting mathematical layers are not renamed source chapters.

Source independence: 18 prose passages compared with 14 sources; no copied exposition identified; largest share DING25, 52 of 225 attributed citation occurrences; contents compared with DING25: independent, with the final compatibility order forced by the stated dependencies.

## Not verifiable

- SCHN11, NFA02 and HUM08 remain **uncertified by operator decision**. Their locators are retained; no request to obtain them was made. In particular this review does not certify their printed pages or wording.
- No Lean elaboration was run under the read-only/no-build constraint. There are zero own declarations, so the requested elaborated-signature comparison has an empty domain. Library hypotheses were read at the pins, rather than inferred from a successful `sorry` build.
- The seven declared supplier contracts remain contracts, not completed library proofs. Acceptance of the corresponding future results is conditional on their delivery. CEGGPS Lemma 3.22 verifies the centre identification, not the whole requested Ext-tangent interface.
- The source-anchor ledger certifies the listed statements and relevant hypotheses; it does not certify every proof in the 26 papers. In particular the source proof defects listed below need attention when those proofs are formalized.
- The source pages checked were the cached versions named in sources.toml. Agreement of every preprint equation number with every published version was not independently certified. No inaccessible text was guessed or fetched from an unapproved host.

## Source issues

- **Misprint** in ST02 at Lemma 2.4, arXiv p. 10 (ST02 line 395): the source says the enveloping inclusion has coefficient (−1)^|n|n!; it should be +n! with the anti-involution convention at lines 357–359; x already pairs with its coordinate to +1; affects a stated result.
- **Misprint** in DLB17 at the proof of Lemme 5.9, arXiv p. 29 (DLB17 line 1162): the source says D(G) and W are Fréchet; it should be D(G) and W's strong dual; W is of compact type; affects the proof.
- **Gap** in DLB17 at Lemme 5.10, arXiv p. 29 (DLB17 lines 1167–1168): the source says weak convergence of sequences implies original-topology convergence without a proof or reference there; it should be accompanied by the nonarchimedean weak-null argument or an exact supporting reference; affects the proof.
- **Error** in OS15 at §2.5 after Example 2.7, arXiv p. 8 (OS15 lines 315–325): the source says the three displayed parabolic conditions imply membership in O over its finite coefficient field; it should be required additionally that the Cartan acts diagonalisably with coefficient-field weights; ℚ₃[t]/(t²−3) refutes the unrestricted inclusion; affects a stated result.
- **Error** in BR16 at Corollary 2.7, author's-copy p. 12 (BR16 lines 501–510): the source says isomorphic outputs recover both inputs for arbitrary finite-length smooth arguments; it should be required that the smooth arguments are nonzero, since all zero-argument outputs coincide; affects a stated result.
- **Error** in SCH11 at Proposition 4.7(2), printed p. 80 (SCH11 lines 1684–1695): the source says extensions vanish above the first nonzero smooth degree in the next two degrees; it should be a low-degree comparison with smooth Ext, which need not be concentrated in one degree; affects a stated result.
- **Error** in EMJ1 at Theorem 0.6, printed p. 778 (EMJ1 lines 152–157): the source says the inducing character can be taken over the original coefficient field; it should be allowed over a finite extension, or replaced over the original field by a finite-dimensional representation as in EMJ2 Corollary 0.14; affects a stated result.
- **Gap** in EMJ2 at the proof of Theorem 5.2.18, author's-copy p. 69 (EMJ2 lines 3271–3273): the source says a finite coefficient extension makes a finite-dimensional torus representation a direct sum of characters; it should be a filtration by characters with a justified dévissage; the nontrivial logarithmic unipotent representation never becomes diagonal; affects the proof.
- **Error** in RJRC22 at the proof of Lemma 3.39, arXiv p. 25 (RJRC22 lines 1275–1277): the source says a sum of two closed Banach subspaces is closed; it should be proved for the particular subspaces; c₀⊕0 plus graph(diag(p^n)) is not closed in c₀²; affects the proof.
- **Misprint** in BCGP25 at §2.2.27, arXiv p. 23 (BCGP25 line 1107): the source says evaluation uses the function algebra at r′ while defining the r-stage; it should be evaluation on the r-stage algebra O_(𝔾_r); affects a stated result.
- **Error** in DING25 at the paragraph after Proposition 3.1, arXiv p. 37 (DING25 lines 1504–1507): the source says the subset label is w({1,…,i}); it should be w^−1({1,…,i}), which is constant on the left cosets prescribed by Proposition 3.1(4); affects a stated result.
- **Misprint** in DING25 at (3.1), Lemma 3.2 and (3.8)–(3.9), arXiv pp. 37–41 (DING25 lines 1509–1513): the source says the inducing character has algebraic weight −s·λ; it should be +s·λ; the negative sign belongs to the category-O input; affects a stated result.
- **Misprint** in DING25 at Lemma 3.2(1), arXiv p. 37 (DING25 line 1511): the source says the Hom is over T(ℚ_p); it should be over T(K) for the local field K used throughout the section; affects a stated result.
- **Error** in DING25 at the PS₁ description preceding (3.2), arXiv p. 38 (DING25 lines 1525–1529): the source says PS₁ has cosocle the sum of simple-reflection constituents without a rank-one qualification; it should be qualified by n≥2; at n=1 the character's cosocle is itself; affects a stated result.
- **Gap** in DING25 at the proof of Proposition 3.1(2)–(3), arXiv p. 37 (DING25 lines 1501–1503): the source says Orlik's Theorem 1 supplies the socle assertions directly; it should be supplemented for ℚ_p-analytic products and nontrivial smooth arguments, beyond that theorem's locally L-analytic trivial-smooth-input scope; affects the proof.
- **Error** in DING25 at the proof of Proposition 3.3(2), arXiv pp. 39–40 (DING25 lines 1593–1601): the source says the permutation of ordered-character spaces follows the map to the Bernstein spectrum; it should be 𝒥_(w₁)=𝒥_(w₂)∘p_(w₂w₁^−1), so the domains compose; affects the proof.
- **Misprint** in DING25 at (3.12), (3.15) and (3.33), arXiv pp. 41–42, 49 (DING25 lines 1662, 1686, 1997): the source says I is a subset of {1,…,n−1}; it should be a subset of {1,…,n}, of size i; affects a stated result.
- **Misprint** in DING25 at Remark 3.9, arXiv p. 42 (DING25 lines 1692–1695): the source says ζ_w is the isomorphism with target Ext¹ into PS; it should be the composite of the PS₁-valued map with push-forward into PS; ζ_w's earlier target is π₁; affects a stated result.
- **Misprint** in DING25 at the singleton-block description before Lemma 3.10, arXiv p. 43 (DING25 line 1736): the source says the singleton block uses the block number as the weight position; it should be position n₁+⋯+n_(i−1)+1, with smooth character selected by the filtration; affects a stated result.
- **Error** in DING25 at the construction between (3.25) and (3.26), arXiv p. 46 (DING25 lines 1837–1841): the source says the kernel tensors one A-factor with the other B-factors; it should be the sum of tensors with one B-factor and all other A-factors; affects the proof.
- **Misprint** in DING25 at the last paragraph of §3.1.3, arXiv p. 47 (DING25 line 1910): the source says the endpoint inductions use P₁⁻ and P₂⁻; it should be P_(n−1)⁻ and P₁⁻, matching the displayed block sizes; affects a stated result.
- **Misprint** in DING25 at (3.32) and Remark 3.17, arXiv p. 49 (DING25 lines 1984, 1989): the source says C takes w(φ) as its first argument; it should be the permutation w, as in the definition of C(w,s); affects a stated result.

The closed-sum counterexample used above is over E=ℚ_p: T:c₀→c₀, T(x)_n=p^n x_n, is bounded and has a closed graph. Its range contains finite-support sequences and is dense. The vector (p^n)_n lies in c₀ but not in its range, since its only preimage is the constant-one sequence. Thus (c₀⊕0)+graph(T)=c₀⊕range(T) is dense and proper. This invalidates that proof step, not by itself the statement of RJRC22 Theorem 3.40.

## For the human reviewers

- SCHN11, NFA02 and HUM08 are settled uncertified sources. Their text and wording were not available for comparison; the exact locators are retained without requesting them again.
- EMJ2 and OR19 are cited as preprints/author copies, and BCGP25 as arXiv v1. The source manifests identify their legal hosts. No reused figures, tables or external formalisation were found in the package.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4756c29e6de35ffbde1fe1cce6814457475d978f", "job": "RT-LocallyAnalyticRepresentationsOfLocalGroups~2a", "model": "gpt-6-astra", "worker": "chris-8"} -->
