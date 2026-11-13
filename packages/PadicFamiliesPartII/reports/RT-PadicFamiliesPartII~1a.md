<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12987#issuecomment-6857735787 -->
Red team round 1 pass a (codex) of 5ee4ae5

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P1) The negative-weight input to doubling has no owner

   **Location:** packages/PadicFamiliesPartII/README.md:883: “then `Zg = βg` and Corollary 5.4.5 forces `g = 0`”.

   **Claim:** The first case of §5.7 follows from its listed inputs.

   **Witness:** BCGP21 lines 5895–5898, 5906–5909 and 5953–5958 supply three additional results: Hasse commutation, divisor factorization, and nonzero-Z-eigenvalue vanishing. §§5.1–5.6 state none of them. At p=3, the divided form has determinant weight 0.

   **Exact repair text:** Add a target before §5.7: “On the mixed-level special fibre, Z and U_Iw commute with multiplication by Ha_w. If l_w ≤ 0, the normalized Klingen correspondence factors through the ideal of the rank-one divisor. Consequently a global section g of ω^κ with Zg=βg and β≠0 vanishes (BCGP21 Proposition 5.4.2, Proposition 5.4.3 and Corollary 5.4.5, pp. 121–122). Prove the last assertion by dividing out the finite order of vanishing along the divisor and applying the factorization.” Add this target to §5.7's Needs. Keep the stronger §5.9 vanishing outside scope.

   **Retest:** For f=Ha_w g in scalar weight two, l_w(g)=3−p≤0 for every permitted p≥3; at p=3 it is 0, and at p=5 it is −2. Commutation gives Zg=βg, and the newly owned theorem applies.

2. **F02** (P1) The doubling theorems use the spherical carrier for mixed-level operators

   **Location:** packages/PadicFamiliesPartII/README.md:881, 895, 909; compare :650 and :710. The source of doubling is written `H⁰(X_{G₁,1}^I, ω²(−D))`.

   **Claim:** U_Kli and U_{w,2} act on the displayed source, and it restricts to the mixed-level ordinary open.

   **Witness:** §4.4 defines X_{G₁,1}^I at spherical level; §4.6 distinguishes X_{G₁,1,mix}^I. BCGP21 lines 5791–5805 instead define the doubling source at K_p(I), with Klingen/Iwahori level. At p=3 an ordinary spherical point has four multiplicative Klingen lines.

   **Exact repair text:** In the Layer 5 standing hypotheses add: “Write X^I_{1,mix}=X_{G₁,1,mix}^I for the selected mixed-level special fibre of §§4.1 and 4.6, and X^{I,=w2}_{1,mix} for its w-ordinary open. All global section spaces and restriction maps in §§5.7–5.9 use these mixed-level spaces.” Replace X_{G₁,1}^I by X^I_{1,mix} in §§5.7–5.9 and use the newly defined ordinary-open notation throughout those sections.

   **Retest:** With F=ℚ, I={p}, p=3, the source now remembers one of the four lines; both Klingen operators and the restriction to its ordinary open have the claimed domains. No spherical-to-mixed isomorphism in scalar weight two is assumed.

3. **F03** (P2) Rational slope blocks are asserted perfect over the integral model

   **Location:** packages/PadicFamiliesPartII/README.md:981: “its finite nonzero slope blocks are perfect over A”.

   **Claim:** The slope blocks of the rational analytic complex are perfect over the normal admissible O_Cp-algebra A of §6.1.

   **Witness:** §6.1, lines 933–945, puts the projective Banach complex over A[1/p]. A nonzero one-dimensional slope-zero block at A=O_Cp is Cp; Cp is not a finite O_Cp-module and hence not perfect there in degree zero.

   **Exact repair text:** Replace the conclusion by “its finite nonzero slope blocks are perfect over A[1/p]”. Any integral lattice theorem must be a separate target with its own hypotheses.

   **Retest:** The block Cp[0], with U=1, has rank one over A[1/p]=Cp; its elements p^(−n) have unbounded denominators over A, so the original integral assertion fails and the repaired rational assertion holds.

4. **F04** (P2) Definite PEL factors and zero-dimensional data have no classicality statement

   **Location:** packages/PadicFamiliesPartII/README.md:346, :458: “terminal entries … l_{i,j,b_i}”; “This holds for every datum”.

   **Claim:** The slope region and the two routes of §2.8 cover every datum allowed by §1's hypotheses.

   **Witness:** Take a CM elliptic PEL datum of type A, signature (0,1), and a split prime p. Then a=0, n=0, δ=0, dim X=0, but k_{j,a}=k_{j,0} does not exist. Neither dimension route applies.

   **Exact repair text:** “For type A put J={i : a_i b_i>0}; impose the terminal-weight inequalities only at i∈J. A definite factor has its distinguished degree fixed at the multiplicative endpoint and needs no continuation inequality. If the symmetric domain has dimension zero, the Shimura variety is finite and proper and classicality follows directly from proper GAGA. The positive-dimensional factors are treated by §§2.2–2.9.” Formulate the terminal weights and minima only on J; treat a rank-zero type-C factor by the same empty-coordinate convention. Add the CM elliptic datum as a Check.

   **Retest:** For (a,b)=(0,1), J is empty, the degree box is {0}, there is no nonexistent terminal coordinate, and GAGA supplies the conclusion. This preserves the promised generality instead of excluding definite data.

5. **F05** (P2) The fundamental-class gap omits the dimension hypothesis

   **Location:** packages/PadicFamiliesPartII/README.md:164; packages/PadicFamiliesPartII/design/plan.json, gap:lci-fundamental-class: “For a proper lci morphism between normal flat lci ℤ_p-schemes”.

   **Claim:** These hypotheses specify the unshifted determinant fundamental class p*O→p!O used in the correspondences.

   **Witness:** P20 lines 713–735 require equal pure relative dimensions and a smooth open with codimension-two complement. For P¹_Zp→Spec Zp the relative dimensions are 1 and 0; p!O=ω[1], not an invertible sheaf in degree zero.

   **Exact repair text:** Replace the gap needs, in both places, by: “For a proper morphism f:X→Y between normal flat lci ℤ_p-schemes of the same pure relative dimension, with a smooth open V⊂X of complement codimension at least two mapping to a smooth open of Y, supply the determinant fundamental class f*O_Y→f!O_Y, its agreement with finite-flat trace where both apply, its compatibility with the generic and ordinary restrictions used in the Hecke correspondences, and extension of divisibilities between the resulting invertible lattices across codimension-two subsets (P20 §4.2.1–§4.2.3, p. 17).”

   **Retest:** The projection P¹_Zp→Spec Zp is excluded; equal-dimensional isogeny correspondences have f!O_Y=ω_X⊗f*ω_Y⁻¹ in degree zero and the determinant of df has the required type.

6. **F06** (P3) A worked weight violates the layer's parity condition

   **Location:** packages/PadicFamiliesPartII/README.md:1022: “Weight `(5, 2)` … this is the first k”.

   **Claim:** This is an instance of the standing Hilbert weight hypotheses.

   **Witness:** §4 requires k_v≡l_v mod 2. Here 5−2=3 is odd, so the claimed instance is excluded. The first admitted difference ≥3 is 4.

   **Exact repair text:** “Weight (6,2), with k=4 and r=2: the geometric threshold is 5 and the all-degree BGG threshold is 2. Their minimum is 2>0. Under the standing parity condition, k=4 is the first admissible difference for which both bounds contain slope zero.”

   **Retest:** 6≡2 mod 2; 6+2−3=5 and 6−2−2=2. The preceding permissible difference k=2 gives the strict bound s<0 and still excludes slope zero.

7. **F07** (P1) The solid representation supplier does not supply the categories used here

   **Location:** packages/PadicFamiliesPartII/README.md:232–233, :1111: “used for T⁺(ℚ_p)” and “λ-smooth … λ∈X*(T)_E”.

   **Claim:** LocallyAnalyticRepresentationsOfLocalGroups §§3.4–3.5 supply both the positive-monoid category and infinitesimal λ-smoothness for arbitrary E-valued weights.

   **Witness:** packages/LocallyAnalyticRepresentationsOfLocalGroups/README.md:630, :647 require a group and a global E-valued character, respectively. diag(p,1)∈T⁺ has no inverse there. For E=ℚ₃, differential λ=1/3 cannot extend to an E-valued character of ℤ₃×.

   **Exact repair text:** Add matching plan/README gaps to this earlier supplier: “gap:solid-positive-monoid: §3.4 — Supply the solidification of the condensed monoid algebra E[T⁺(ℚ_p)], its solid module category, and base change along T⁺→T for the positive torus monoids of BCGP25 §4.6.46.” “gap:infinitesimal-lambda-smooth: §3.5 — For λ∈X*(T)⊗E, supply the category of locally analytic solid B(ℚ_p)-representations on which 𝔟 acts by λ, its derived category, restriction and unipotent invariants; identify it with character-twisted smooth representations when a global character with differential λ exists (BCGP25 §4.1, p. 68).” Cite these gaps in §7.1b and §7.3 instead of claiming the existing sections already provide the extensions.

   **Retest:** For T=ℚ₃×, a character to ℚ₃× has logχ(4)∈3ℤ₃, but differential 1/3 would require logχ(4)=log(4)/3, of valuation zero. The infinitesimal definition makes sense without such a character. The monoid algebra also permits the noninvertible action U=0 used in §7.1b's Check.

8. **F08** (P2) The local Artinian algebra claim fails for the zero subspace

   **Location:** packages/PadicFamiliesPartII/README.md:909: “Let M be a finite-dimensional subspace … the algebra E … is local Artinian”.

   **Claim:** The algebra generated in End(M) is local, including every allowed M.

   **Witness:** Set M=0, p=3, α=1, β=2. Both nilpotence hypotheses hold. End(M) is the zero ring, which has no maximal ideal; it is not local. BCGP21 lines 6547–6552 likewise omit M≠0.

   **Exact repair text:** “For M=0 all refinement maps are the unique zero maps and the claimed decomposition and injections are immediate. For the local-Artinian-algebra construction assume M≠0.” Apply the local algebra and residue-root assertions only in this second case.

   **Retest:** The zero case no longer invokes a nonexistent maximal ideal. For a nonzero common generalized eigenspace, the generated algebra has residue field F̄_p, with residual roots 1 and 2 distinct at p=3, so Hensel lifting applies.

9. **F09** (P3) The proposed non-de-Rham negative control cannot have the stated planes

   **Location:** packages/PadicFamiliesPartII/README.md:1351: “an extension of the two potentially unramified planes with nonzero nilpotent Sen operator”.

   **Claim:** This describes a non-de-Rham ordinary local representation in the setting of §8.6.

   **Witness:** BCGP25 lines 5068–5079 give precisely the two-plane extension criterion for de Rhamness in this ordinary setting and its semisimple Sen operator. The proposed counterexample therefore contradicts its own specified planes.

   **Exact repair text:** “A same-weight non-Hodge–Tate block can have nonzero nilpotent Sen operator: for U(g)=[[1,log χ_cyc(g)],[0,1]], Θ_U=[[0,1],[0,0]]. Thus the split symplectic representation U(−1)⊕U∨(−2), at w=0, has repeated Sen values −1 and −2 with nonzero nilpotent parts and is not de Rham. Its twisted planes are not potentially unramified.” Label this a local negative control, not a claimed global automorphic example.

   **Retest:** Θ has blocks −I+N and −2I−Nᵗ, with N²=0 and N≠0. The scalar lists still match §7.8, while semisimplicity fails; the false potentially-unramified assertion is removed.

10. **F10** (P3) The general algebraic coefficient is called a line bundle

   **Location:** packages/PadicFamiliesPartII/README.md:941: “the line bundle ω^κ(−D)”.

   **Claim:** The geometric coefficient is a line bundle at arbitrary dominant algebraic κ.

   **Witness:** With F=ℚ and κ=(4,2), its fibre is Sym²(E²)⊗det², of dimension 3, whereas a line has dimension 1. This same rank distinction is correctly used in §5.4's Check.

   **Exact repair text:** Replace “the line bundle ω^κ(−D)” by “the finite-rank algebraic vector bundle ω^κ(−D), of rank ∏_v(k_v−l_v+1), a line bundle at scalar weights”.

   **Retest:** The ranks are 3 at (4,2) and 1 at (2,2); the contrast with the infinite-rank analytic coefficient holds in both cases.

11. **F11** (P2) Full-torus duality drops the transported action on the second factor

   **Location:** packages/PadicFamiliesPartII/README.md:1427: “perfect Λ-bilinear pairing”; :1378: “actions are inherited”.

   **Claim:** The two modules defined in §9.1, with their inherited full-torus Λ-actions, pair Λ-bilinearly with the stated transposed torus action.

   **Witness:** packages/HigherHidaAndColemanTheory/README.md:721 explicitly transports the second Λ-action and makes t adjoint to w₀(t⁻¹). For central z=4I at p=3, these are z and z⁻¹, distinct group-like elements of Λ.

   **Exact repair text:** “Put τ([t])=[w₀(t⁻¹)] on Λ. The perfect pairing is 𝓜_w ⊗_Λ τ*𝓜_{w*} → Λ, equivalently a τ-sesquilinear pairing on the inherited modules. Here τ* transports the scalar action by τ. Its arithmetic fibres pair the corresponding dual characters, including the inverted central character, and interpolate the supplied Serre duality.” State the central coordinate of κ∨ as well as its two semisimple coordinates in the last Check.

   **Retest:** On inherited modules, adjointness gives P(zx,y)=P(x,z⁻¹y). Ordinary bilinearity would force ([z]−[z⁻¹])P(x,y)=0; this is incompatible with a nonzero perfect pairing on the pro-3 component. Transporting the second action identifies precisely those two scalars. At trivial central character the twist specializes to the identity.

12. **F12** (P1) The integral spherical composite already has an earlier owner

   **Location:** packages/PadicFamiliesPartII/README.md:9, :496–507: “This roadmap owns … the integral spherical genus-two operator”.

   **Claim:** §3.1 constructs the two integral factors, their divisibilities, composite and generic-fibre formula independently.

   **Witness:** TauCetiRoadmap/AlgebraicModularFormsAndSerreWeightsPartII/README.md:987–1012 already states exactly this construction as C_r, including cusp cohomology. That roadmap is at merge-order/ORDER.txt:249, before this roadmap at :256. Its variable d is this section's k.

   **Exact repair text:** Replace §3.1's construction by: “Import AlgebraicModularFormsAndSerreWeightsPartII §7.5 with (j,k)=(k+r,r), and write T=C_r. Its two integral factors, fundamental classes, boundary compatibility and rational formula are used with their actual central transport. This section records that dictionary for §§3.2–3.3.” Remove the ownership claim and duplicated proof plan. Add the earlier owner to the supplier contracts and dependency lists. Retain §3.2's rank-zero vanishing as the new target. The models and integral isogeny chain come with that owner's gap:siegel-parahoric-models; ShimuraCompactifications §§6.16–6.17 supply a characteristic-zero Klingen correspondence, not these integral models.

   **Retest:** At k=0,r=2,p=3, both constructions divide the first raw map by 3⁴ and the second by 3; the composite has generic factor 3. Under (j,k)=(2,2), these are precisely the earlier §7.5 divisibilities. Importing them preserves the integral input and removes the second owner.

13. **F13** (P3) Partial Frobenius has no three discriminating Checks

   **Location:** packages/PadicFamiliesPartII/README.md:794–798: “this is … with the stated polarization”; “degree … p²”; “marking includes … p⁻¹π”.

   **Claim:** The three bullets test the definition and its normalization in §5.2.

   **Witness:** Each repeats a clause of lines 783–792; no example computes the polarization, marking or a Hodge transition. In particular, the first bullet does not distinguish multiplying the proposed polarization by an extra p.

   **Exact repair text:** Replace these bullets by: “After R14, at F=ℚ, p=3 and x_w=3, pullback of the quotient polarization is 3λ and its degree is 1; the printed factor 27 gives degree 3⁸ and fails.” “At p=3 the ambient degree is 27 and the divisor degree is 9; a map of degree 27 on the divisor fails.” “On a tame 5-torsion marking at p=3, the marking is 2πη since 3⁻¹=2 mod 5; omitting p⁻¹ gives πη, a different marking.” Keep the general laws in the basic properties.

   **Retest:** The polarization factors are 3 versus 27, the ranks of the finite-flat algebras are 27 versus 9, and the two tame marking multipliers are 2 versus 1 in ℤ/5. All three now reject an explicit wrong construction.

14. **F14** (P1) Partial Frobenius transports the wrong polarization

   **Location:** packages/PadicFamiliesPartII/README.md:783: “polarization descended from p² x_w λ”.

   **Claim:** This quotient with this polarization defines an endomorphism of the prime-to-p polarized Hilbert–Siegel moduli.

   **Witness:** F=ℚ, p=3, x_w=3, λ principal: π=Frob has degree9. Descending 27λ produces polarization degree 27⁴/9²=3⁸, not prime to3. BCGP21 line6126 prints the same error; lines2638–2639 fix v_w(x_w)=1.

   **Exact repair text:** Replace “p² x_w λ” by “p² x_w⁻¹ λ” in §5.2. State π*λ̃=p²x_w⁻¹λ explicitly, keeping the tame marking p⁻¹πη. Add: “For F=ℚ and x_w=p, π is Frobenius of degree p² and π*λ̃=pλ, so deg λ̃=p⁴/(p²)²=1 for principal λ.” Record the correction to BCGP21 Definition 5.6.2 under Source issues. Retain Norm(x_w)³/p³ in §§5.3–5.4: it comes from the forward isogeny's Kodaira–Spencer trace, not from replacing x_w by its inverse everywhere.

   **Retest:** At p=3 the corrected pullback factor3 gives degree81/81=1. For general degree d=[F:ℚ], degπ=p^(4d−2), and Norm(p²/x_w)^4=p^(8d−4)=(degπ)². The printed multiplier instead gives p^(8d+4), leaving an unwanted polarization degree p⁸.

15. **F15** (P2) The central three layers reproduce one source's section arrangement

   **Location:** packages/PadicFamiliesPartII/README.md:9, :584, :765, :929: the ownership paragraph explicitly associates Layers 4–6 with BCGP21 §§4–6.

   **Claim:** These are the roadmap's independently organized mathematical layers.

   **Witness:** BCGP21 contents, lines55–80: Layer4↔§4; Layer5↔§5; Layer6↔§6. The scopes are partial Hida complexes, doubling, and higher Coleman comparison, in that order. §6.1 needs Layer4 but nothing in Layer5.

   **Exact repair text:** Replace this three-layer run by three target-driven groups: “Mixed-level coefficients and slope operators” (§§4.1–4.3, 6.1–6.4); “Integral ordinary control and rational comparison” (§§4.4–4.7, including 4.4a, followed by 6.5–6.7); “Weight-two trace identities and refinements” (§§5.1–5.9, including R01's negative-weight input). Keep an old-to-new section table. In the shared coefficient/comparison group cite AIP15 Propositions 7.2.3 and 7.3.1 for the BGG normalization and P20 Lemma 14.8.2 for the one-place specialization, alongside the BCGP21 locators for the Hilbert results; neither additional source is a substitute for the Hilbert theorem.

   **Retest:** §4.3 still precedes all its operator consumers; §6.4 still precedes §6.5; §§4.4a and 4.7 still precede §6.6, which precedes §6.7. Doubling still follows the mixed-level constructions and its trace identities. The unnecessary source order placing doubling between ordinary control and its rational comparison disappears.

## Verified sound

Read all 1,511 README lines and all 40 Suggested.lean lines. Declaration count: **0**. Numbered target subsections read: **65**; their API bullets, proof routes and **240 Checks** were inspected for mathematical and contextual consistency. The 72 computation rows below record the concrete tests and the places where they do not certify the geometric theorem. Direct source comparisons cover **60 named locator groups**, listed below, across all six cached works. Supplier audit: **27 contract subsections**, **77 section-excerpt comparisons**, additional checks of PadicFamilies §0a.25, PELModuli §M0.21 and LieHighestWeight Layer 3, and the earlier owner's §7.5. This is not a claim to have proved the suppliers' targets.

Suggested.lean has only the allowed Mathlib import and namespace. It has no admitted data, theorem padding, extra API declarations, `set_option`, or Lean-name collision. Each of the eight endpoint families in the summary is covered by its module docstring: §§2.8–2.9, 3.5, 4.7, 5.8, 6.7, 7.8, 8.6, 9.2–9.7. It also names the deep intermediate amplitude, spectral-sequence and Sen–Cousin results. The missing geometric/cohomological carriers preclude native statements of these headlines; an arbitrary-endomorphism companion identity is not a replacement headline.

| Suggested declaration | Section | Variables and instances | Computed type/instance test | Result |
| --- | --- | --- | --- | --- |
| None | Empty namespace | No declarations, variables or instances | 0 signatures; 0 retained implicit hypotheses; 0 elaboration requests | No Lean signature finding. A scratch `#check @name` run has no names to check; no Lean command was run. |

All nine explicitly cited pinned declarations were opened at the pins: the eight Mathlib entries in the supplier paragraph and TauCeti.VermaModule. In particular, `Module.Projective` asserts a splitting, not finite generation; `Module.End.genEigenspace` is the increasing union of kernels, not semisimplicity; the Fitting theorem retains both Artinian and Noetherian hypotheses. The pinned Verma carrier has characteristic zero, finite dimension, nondegenerate Killing form and splitting-Cartan hypotheses. These do not supply reductive BGG categories or Shimura cohomology. Mathlib/RingTheory/LocalRing/Defs.lean:30 independently confirms that the local-ring class requires nontriviality (R08).

All **15 declared gap slugs** occur in both the plan and the README's exact supplier contracts, and every supplier is named. Their absence from current suppliers is not a finding. R05 concerns a missing hypothesis in one contract; R07 concerns undeclared extensions beyond existing contracts. R12 imports an already owned construction together with its existing model contract. No gap has supplier `none`.

Ownership searches used the open-head roadmap search by objects (Kassaei continuation, negative-weight Z-vanishing, higher Coleman sheaves, Sen–Cousin, and paramodular composite correspondences), not only proposed declaration names. The closest-roadmap scopes distinguish completed/coherent interfaces from the BGG-coefficient functors and arithmetic classicality owned here. AlgebraicModularFormsAndSerreWeightsPartII is the overlap in R12. GSp4NonregularModularityLifting consumes these endpoints; it does not supply an earlier replacement for them. No second copy of this roadmap or conflicting edit was reported by the overlap input.

The checked head is 5ee4ae5d. The origin/main...HEAD stat contains nine files, all within packages/PadicFamiliesPartII. No package file was edited except this report. No git write, Lean build, or external post was made.

The prescribed dependency checker returned, on the final run:

```text
depcheck: 235 roadmaps, 2115 edges, 0 problem(s)
```

An earlier run before the additional roadmap searches returned `depcheck: 223 roadmaps, 1997 edges, 0 problem(s)`. Neither run reported UPWARD, CYCLE or moved. These checks concern the reviewed README, not an unperformed repair.

### Computed adversarial pass

The table records computations, not proofs of the geometric theorems. A zero coefficient, a formal matrix model or a dimension count tests the displayed law only; it does not construct a Shimura eigenclass. “No change” below means no defect detected by that particular test. Standing contexts: PEL = Layers 1–2's unramified A/C datum; S = Layer 3's Siegel threefold; H = Layers 4–6's split totally real datum, p>2 and even weight differences; BGG = Layer 7's characteristic-zero split setting; G4 = its genus-two specialization; Iw = Layer 9's full torus integral setting. The field and DVR hypotheses exclude zero rings and equal-characteristic coefficient DVRs in the geometric assertions. The zero ring remains allowed in §5.6. Ramified p-level PEL data and nonsplit p in H are outside the expressly stated source hypotheses; they are not silently tested as admitted instances.

| Statement / context | Instances and values on the two sides | Result; change |
| --- | --- | --- |
| Conventions, cohomological grading | E[1] has H^(−1)=E, H¹=0; E[−1] has H¹=E. E --T→ E over a field has cohomology (0,0) for T=1 and (E,E) for T=0. | Shift and derived-fibre conventions distinguish the cases; no change. |
| 1.1, PEL, degree definition | At height 1, deg(ℤ/p)=0 and deg(μ_p)=1; at p=3 the supersingular subgroup degree is 1/4, neither 0 nor 1. Matrix size m=2, reduced height 1 gives upper bound 1 versus unreduced 2. Height 0 gives degree 0. | Degree/Morita normalizations agree. Definite terminal weights subsequently fail: R04. |
| 1.2, PEL, U definition | Type C: (d,a)=(1,1),(1,2) gives n=1,3; type A (1,1,1) gives n=1. At p=3 the raw factors are 1/3,1/27,1/3. (a,b)=(0,1) gives n=0 and factor 1. | No numerical discrepancy. A unit changing x changes the polarization unless transported. |
| 1.3, PEL, monotonicity/equality | Generic ℤ/3→μ₃ has degrees 0→1, so ≥ holds and equality fails. At maximal degree 1, 1≤δ≤1 forces δ=1. At δ=1/4 an equality would force 1/4∈ℤ, false. | Rigidity excludes the nonintegral equality case; no change. |
| 1.4, PEL, uniform progress | ν=1/2,η=1/4 gives input [1/2,1], output [3/4,1]; with an increment lower bound 1/16, N=5 exceeds (ν−η)/(1/16)=4. η=ν gives N=0. A sequence of increments 1/n has infimum 0. | Closed-band/strict positivity requirements do work; no numerical change. |
| 2.1, PEL, strict slope definition | (n,c,s)=(3,4,0), ε=1/8 gives exponent −1/2; (3,3,0) gives 3ε>0; (3,4,1/2), ε=1/16 gives −1/4. Equality s=1,c=4 gives exponent 4ε>0. | Both directions of the positive-weight strict inequality agree; R04 for undefined terminal coordinates. |
| 2.2, PEL, first extension | α=2,Uf=2f: α^(−1)Uf=f and α^(−2)U²f=f; α=0 has no inverse. Height 1 reaches δ>0, not δ=0. | Eigenvalue nonvanishing and the integral wall are necessary; no change. |
| 2.3, PEL, complement count/filtration | Counts 0,1,2 give membership in V₀\V₁,V₁\V₂,V₂\V₃ respectively. On a curve dim B₂=1 whereas dim X²=2. | Coordinate maps, not the product, support finite étaleness. |
| 2.4, PEL, path identity | N=1: G+B; N=2: GG+GB+BG+BB, four words on each side. N=0, if extended, is the empty path/id, not an empty sum equal to zero. | Displayed hypothesis N≥1 excludes the latter error; no change. |
| 2.5, PEL, norm bound | p=3,n=3,c=4,s=0,ε=1/8 gives q=3^(−1/2)<1; c=3 gives q=3^(3ε)>1. Multiplying 2≥1 by c=−1 gives −2≤−1. | Sign condition is essential and present; no change. |
| 2.6, PEL, path sums | Scalar model α=1,bad=1/3,good=2/3,f=1: f_N=1−3^(−N), so successive tails have 3-adic norm growing, not contracting: this model violates the bound. Correct contracting model bad=3,good=−2 gives f_N=1−3^N and tail norm 3^(−N). bad=0 gives f_N=f₁. | Checks distinguish real-small from p-adically small. Fixed precision cannot recover all tails; no change. |
| 2.7, PEL, all-wall extension | Degree intervals of heights 1 and 2 encounter one and two integral walls respectively; at δ=0 both require the last wall. Errors bounded by 3^(−N) tend to 0, so two bounded compatible limits differ by 0. | Uniqueness computation works; the generic gluing remains a declared gap. |
| 2.8, PEL, classicality | Modular weight k=2 gives s<1 (0 admitted,1 excluded). Siegel (6,6) gives s<3; (6,3) gives s<0 and no nonnegative slope. Signature (0,1) has dimension 0 and missing k₀. | R04; positive-dimensional numerical bounds agree. |
| 2.9, dimension-one PEL | On the open modular curve the weight-zero function j has a cusp pole q^(−1), whereas a section on the compact curve has pole order ≤0. On a compact curve the boundary is empty, divisor degree 0. | The boundary extension is necessary; no replacement by open-curve Koecher. |
| 3.1, S, normalized composite | r=3 gives p^(3−r)=1; p=2 gives 2+4+8+16=30 cosets. k=0,r=2,p=3 gives divisors 81 and 3. Projection P¹_Zp→Spec Zp has relative dimension 1 and f!O=ω[1]. | R05 and R12; the latter identifies the earlier owner of the very same factors. |
| 3.2, S, rank-zero vanishing | r threshold p²+p is 6 at p=2 and 12 at p=3. On k[ε]/ε², multiplication by ε is nonzero but its square is 0, separating vanishing on the reduced fibre from vanishing on the thickening. | Nilpotence rather than immediate vanishing is correctly claimed. C is not numerically specified. |
| 3.3, S, ordinary amplitude | r=2 allows an injective H¹ map E→E² with cokernel dimension 1; r=3 claims its disappearance. A two-term complex has no H². Codimension-two Hartogs does not imply an H² injection. | Endpoint directions agree with P20 Proposition 8.2.1; no change. |
| 3.4, S, tame Hecke definition | ℓ=2 gives ℓ^(−3)=1/8, ℓ^(−6)=1/64. (1−X)^4 has coefficients 1,−4,6,−4,1 at q=1. If ℓ=p the scalars are not integral units, which the hypothesis excludes. | Normalization and good-place restriction agree. |
| 3.5, S, Euler characteristic | Λ --0→ Λ gives ranks (1,1), χ=0 while both cohomology modules are non-torsion. p=5 gives four finite-character components; p=2 has a nonsplit 2-torsion finite part. k=0 yields singular parameter (−1,0;c). | Zero χ does not imply torsion; componentwise formulation retained. |
| 4.1, H, locus/tower definition | Degree d=2 with I empty, singleton,all gives torus ranks 4,3,2. At p=3 an ordinary multiplicative plane has 4 lines, versus one line at p-rank one. | Spherical and selected mixed carriers differ: R02 in their later use. |
| 4.2, H, universal coefficient | κ=(2,2) evaluates character x^0y^0=1. κ=(4,2) has algebraic rank 3 and highest-weight quotient rank 1. F₃[C₃] has invariant dimension 1 but no splitting by averaging, since 1/3 is undefined. | Twists and prime-to-p descent hypothesis discriminate the wrong constructions. |
| 4.3, H, commuting U action | At two places, I={v₁} gives U₁,₂U₂,₁U₂,₂. Raw divisors p²·p=p³. At p=3, l=3, U_Kli−U_Iw=3Z. Valuations (−1,1) have unit product but neither is a pair of units. | Distinction between Iwahori factor integrality and Klingen Satake integrality is retained. |
| 4.4, H, fixed-weight amplitude | I empty gives [0,0]; I singleton gives [0,1]. l=2 permits H¹ injection with cokernel dimension 1; l=3 claims the full comparison. | Boundary/amplitude ranges match the source; no change. |
| 4.4a, H, Satake integrality | p=3,k=4,(α,β)=(1/3,3) gives normalized valuations (−1,1,2,4), sum 6; units give (0,0,3,3), sum 6. Integrality plus a+b=0 forces a=b=0. | The first slope, not the endpoint or product, excludes the wrong model. |
| 4.5, H, family definition | Λ=ℤ_p[[T]], complex Λ --T→ Λ has H⁰=0; fibre T=0 has H⁰=ℤ_p and H¹=ℤ_p. I empty has 0 extra cohomological degrees; I singleton has 1. | Derived tensor is essential and present. |
| 4.6a, H, covers and trace | p=3, complement size 1: cover degree 4, leading factor 3; size 2:16 versus9. Empty complement:degree1 and Tr∘ι=id, no minimum. At n=0,4−3=1∉3ℤ₃. | n≥1 and the empty-set branch prevent false congruences. |
| 4.6b, H, integral congruence/injectivity | r=2, complement size1 gives 3f∈9A ⇒ f∈3A for flat A. r=1 gives 3f∈3A for every f. Mod3 both 3 and9 act by0. Wrong normalization adds 24, valuation1, not ≥2. | Integral flat modules and r>size are necessary and stated. |
| 4.6c, H, dévissage | k[x,y]/(x²,y²) has length4; simultaneous recursion predicts (2−1)²+1=2. Single-coordinate recursion gives 2+2=4. p=3 raises l=2 to4 and preserves k−l. | One-coordinate argument fixes the source recursion. |
| 4.7, H, derived control | I empty/singleton has lengths1/2 of the perfect representatives. Over ℤ₃, a factor acting by3 has ordinary part0; on a product, factors with valuations0 and1 have total valuation1. | Product divisibility kills the kernel; no unsupported individual-factor claim. |
| 5.1, H, first-operator definition | p=3, l=1,2,3 gives U_Kli=3U_Iw+Z, U_Iw+Z, U_Iw+3Z. At l=2 both branches coincide. | Normalizations agree. |
| 5.2, H, partial Frobenius | p=3: ambient degree27, divisor degree9; x_w=3 gives printed polarization multiplier27 and degree3⁸, versus corrected multiplier3 and degree1; tame modulus5 gives p⁻¹=2. | R14 corrects the polarization; R13 supplies computed controls. |
| 5.3, H, first trace | p=3 gives γ₁:F_*L→L⊗A²; v_p(Norm(x_w)^3/p³)=3−3=0, versus3 without denominator. Cartier trace sends x²y²dx∧dy to dx∧dy, function trace is0. | The coefficient exponent, unit and dualizing trace all distinguish the wrong map. |
| 5.4, H, second trace | p=3: A^8 has inverse A^(−8); F² degree9²=81; F*δ exponent24; composite exponent1−27=−26. Rank at weight(4,2) is3 versus rank L=1. | Pushforward composition and inverse multiplier are typed correctly. |
| 5.5, H, quadratic relation | α=2,β=3 gives 4−5·2+6=0; using negative constant gives−12. Residually at p=5, α=2,β=3 remain units and give 4+1=0. | Positive constant term and opposite-root convention agree. |
| 5.6, arbitrary commutative ring/module | T=5,U=6 gives C(2,3)=(28,−2), C²(2,3)=(128,−28), diag(T)C=(140,−10), diag(U)(2,3)=(12,18): difference(0,0). T=U=0 gives C²=0; zero ring/module gives unique0 map. | No commutation needed. Native, elementary target correctly omitted from Lean. |
| 5.6, noncommuting endomorphisms | On ℚ² take T=E₁₂,U=[[1,0],[1,1]], x=e₁,y=e₂. C²(x,y)=(0,−1;0,−1), diag(T)C=(1,0;0,0), diag(U)(x,y)=(1,1;0,1), sum0. | Order diag(T)∘C is essential; no change. |
| 5.7, H, vanishing | f=Ha·g changes l=2 to3−p:0 at p=3,−2 at p=5. αβ≠0 forces restriction0 from αβ·restriction=0; β=0 does not. | Negative-weight Z-vanishing is unowned: R01; carrier R02. |
| 5.8, H, doubling injection | On one common module with Z=1, Δ(−1,1)=0 despite nonzero input. Equivariance coefficients are (T−Z)f+Ug and Tf+Ug−Zf, equal. | Different domains are indispensable: R02. The computation does not prove geometric injectivity. |
| 5.9, H, root refinements | M=0 gives End(M)=0 and 0 maximal ideals. For p=5,T=0,U=1, residual roots2,3 have difference−1, a unit; images use opposite roots3,2. Over ℤ₃ roots1,4 have difference3, not a unit. | R08 for zero M; distinct residual roots correctly exclude the last example. |
| 6.1, H, analytic/geometric definitions | p=3,n=1 allows ε≤1/2, accepts(1/4,1/8,1/16), rejects3/4. u=0 gives1+R=R containing0. Order3 character needs u>1: level1 excludes it, level2,u=3/2 admits it. κ=(2,2) gives trivial analytic character; κ=(4,2) rank3. | R10. Coefficients still differ even at scalar weight2. |
| 6.1, H, transitions | For z-pole at3^(1/8), radius exponent1/4 excludes it and exponent1/8 includes it. Thus restriction is from the larger disc to smaller, giving (1,1/4,1/8)→(2,1/2,1/4). | Direction and cofinality agree; no change. |
| 6.2, H, cubical amplitude | I sizes0,1,2 give1,2,4 vertices and complex lengths0,1,2; the unrestricted Čech maximum for4 opens is3, not2. n′=max(n,n(ε)) satisfies n′≥n(ε). | Extra cubical and level hypotheses are necessary and declared. |
| 6.3, H, compactness/perfectness | p=3 raw composite factor3^(−6)=1/729, individual3^(−3)=1/27. With A=O_Cp,U=1, a rank-one block is Cp: rank1 over A[1/p], not finite over A. | R03. |
| 6.4, H, BGG slopes | p=3,m=4, α=1 gives β=1/81 with v₃(β)=−4; reversed relation gives81 with valuation4. Reflected lower bound−3+4=1; m=3 gives0. For z^4, derivative of (3z)^4 is81·24. | Corrected intertwining direction gives the claimed exclusion. Gap3 is numerical algebra; admitted H weights have even differences. |
| 6.5, H, continuation/comparison | P=(X+1)²,U=−1: Q=−X−2, UQ(U)=1; omitting the linear coefficient gives0. Weight(2,2): geometric threshold1, all-degree−2, endpoint1. Weight(5,2) has odd difference3; (6,2) gives thresholds5 and2. | R06 for the inadmissible worked weight. |
| 6.6(1), H, Euler local constancy | [E --t→ E] has χ=0 both at t=0 (dimensions1,1) and t≠0 (0,0). | Euler constancy does not assert dimension constancy. |
| 6.6(2)–(3), H, comparisons | Analytic/geometric/family dimensions (1,2),(1,1),(1,1) give χ=−1,0,0 and satisfy both endpoint directions. Witness weights add (p−1)p^N, p-adically tending to0 but growing archimedeanly. | Localization and high-weight comparison supply equality; endpoint maps alone do not. |
| 6.7, H, one-place theorem | Let a=1,b=2: χ_s−χ_t=−3=−a−b; equality0 forces a=b=0. I empty gives b=0. l=3 gives slope threshold0, excluding0; l=4 gives1, admitting0. | Euler sign and global weight threshold agree. |
| 7.1, BGG, category/completion | For GL₂,[e₁₂,e₂₁]=diag(1,−1): ε₁ evaluates1, det evaluates0. ν−λ=1/2 is nonintegral. Standard-module Lie cohomology dimensions1+1=2. Zero module completion/dual=0. | Character-of-Levi condition is present. Global versus infinitesimal character in supplier is R07. |
| 7.1a, BGG, HCS definition | Finite fibre dim2 stays2 under duality; zero stays0; Verma fibre infinite. Twist ε₁ at diag(3,1) multiplies by3. Scalar Lie element on det has value2, horizontal dual action−2. | Dual sign and twist discriminate unchanged-action model. |
| 7.1b, BGG, HC/support/shift | d=1,length0: cusp[0,0],canonical[0,1]; length1:cusp[0,1],canonical[1,1]. V[1] is sent to a sheaf in degree1, not−1; dual of x↦(x,0) is(a,b)↦a. | Contravariant degree reversal is correct; missing supplier categories R07. |
| 7.1b, BGG, slope functors | On trivial line at p=3, normalized Hecke trace=(1/3)·3=1, slope0; raw trace3 has slope1. Eigenvalues(1,3) give finite-slope dimension2 and ordinary dimension1; (1,0) gives finite-slope dimension1. Root slope has central value0; ε₁ on diag(1/3,1/3) gives−1. | Distinguishes finite-slope, ≥0 and ordinary; monoid supplier gap R07. |
| 7.2, BGG, localization | Standard GL₂ module: H₀,H₁ weights(0,1),(2,−1), diag(2,1) values1,4; H⁰,H¹ weights(1,0),(−1,2), values2,1/2. det at λ=0 has horizontal centre−2, proposed character centre0. Trivial M has two nonzero degrees0,1. | Homology, infinitesimal character and complex-valued localization correctly separated. |
| 7.3, BGG, CC definition | Zero M gives0. Split extension gives connecting map0. Replacing λ=0 by det at t=diag(3,3) multiplies the action by9. Lie action Xf−f(X−λ(X))=λ(X)f. | B-action convention correct; supplier scope R07. |
| 7.4, BGG, completed/coherent | ℚ_p(1) has Sen value+1; its dual−1. Truncating Loc(E) with cohomology dimensions(1,1) to degree0 removes dimension1. | Entire complex required; no numerical sign discrepancy. |
| 7.5, BGG, spectral sequence | d=1, one-dimensional nilradical, trivial M has derived homology in degrees−1,0 with dimensions1,1; after contravariance degrees0,1. E₁ indices(0,1),(1,0) both abut to total degree1. | Homological versus cohomological coefficient indexing agrees. |
| 7.6, BGG, ordinary degrees | d=3,p_index=0,q=3 gives2p+q−d=0, total3. p_index=3,q=0 gives3,total3. For d=1, index(0,1) gives0. | Two different degree indices are consistent. |
| 7.7, G4, boundary vanishing | Reducible1⊕1⊕1⊕1 has polynomial(1−X)^4 and is excluded; zero localized boundary makes the support triangle 0→C→C with identity cone0. | Arithmetic vanishing is a source theorem, not inferred from this formal triangle. |
| 7.8, G4, four pieces | λ=(1,1;2) gives−2,−2,−3,−3, sum−10=−6−2·2. λ=(1,1;−2) gives0,0,−1,−1, sum−2. At central w=0 list−1,−1,−2,−2. | Sen signs and ordering agree. |
| 8.1, G4, Cousin complex | Terms in degrees2,3 become dual terms0,1 after the dimension3 shift. Semisimple dual weight of(1,1) is(2,2), since3−1=2 twice. | Degree and weight correction agree. |
| 8.2, G4, repeated block | Θ=[[-2,1],[0,−2]] gives N=[[0,1],[0,0]], N²=0,N≠0; Θ=−2I gives N=0. Subobject Ee₁ and quotient Ee₂ both have scalar−2. | Graded scalars do not imply semisimplicity; no change. |
| 8.3, G4, singular comparison | (x∂+1)x^n=(n+1)x^n≠0 in characteristic0. ((x+1)∂+1)(1/(1+x))=0. η=(0,−1;1) evaluates0 on β∨, λ=(1,1;w) evaluates−1. | Correctly isolates a source proof gap; nonzero constrained-fibre comparison is still to be proved. |
| 8.4, G4, Sen–Cousin | Multiplication of E→E by c≠0 preserves kernel0 and imageE; c=0 changes kernel toE and image to0. Jordan N above has rank1 versus semisimple rank0. | Nonzero scalar is essential and stated. |
| 8.5, G4, eigenspace exactness | E[t]/t² has t-torsion Ee_t; its projection to E is0, not surjective. Four upper bounds n=1 have sum4 and force each graded dimension1 if total4. Tuple(2,0,1,1) also sums4 but violates the separate bounds. | Balance, not mere total dimension, is used. |
| 8.6, G4, classicality | w=0 gives a=−1; semisimple block has N=0 and Cous=0. For U(g)=[[1,logχ(g)],[0,1]], Sen(U)=N≠0; U(−1)⊕U∨(−2) has blocks−I+N,−2I−Nᵗ. | R09: non-de-Rham negative control must not assert potentially unramified twisted planes. |
| 9.1, Iw, four-module definition | Lengths0,1 use cusp,2,3 canonical. Character ζ₃ versusζ₃⁻¹ differs. Unramified quadratic O overℤ_p: H⁰(ℤ_p[0]) has ℤ_p-rank1, extended O-rank1 and ℤ_p-rank2. | Inversion and scalar extension are recorded. |
| 9.2, Iw, projectivity | Length0 amplitude[0,0]; length1 starts[0,1] and needs H⁰=0. Overℤ₂[C₂] averaging would divide by2, unavailable. Zero module is finite projective, supported degree any without nonzero assertion. | Full local-ring residual criterion avoids dyadic averaging. |
| 9.3, Iw, classical fibres | ν=(0,−2) gives (5,3),(5,1),(2,−2),(0,−2) at lengths0,1,2,3. On T(ℤ_p), character λ times−λ gives1. | Four-weight dictionary and smooth twist agree with supplier. |
| 9.4, Iw, Coleman fibres | At each of the four preceding weights the cohomological degree is0,1,2,3 respectively; cusp flags are1,1,0,0. M-dominance tests κ₁−κ₂:2,4,4,2, all nonnegative. | General fibre comparison preserves support, without asserting all weights classically dominant. |
| 9.5, Iw, duality | Complementary lengths0+3=1+2=3. Dual semisimple weight of(5,3) is(0,−2). Central z=4I at p=3 has τ([z])=[z⁻¹]≠[z]. | R11: full central transport is missing despite the correct semisimple Check. |
| 9.6, Iw, tame projectivity | OverF₃[C₃], norm of coinvariant basis1 is1+g+g²≠0, giving invariant/coinvariant dimensions1,1. On trivialF₃, norm is3=0 although invariants dimension1. Δ=1 gives norm1. On F₃[S₃], norm1 is the sum of 6 distinct basis vectors, nonzero; invariants and coinvariants both have dimension1. | Projectivity, not arbitrary invariants, supplies the isomorphism. |
| 9.7, Iw, central character | p=2,r=7 gives(r−1)/2=3 odd; p=3,r=7 gives3 divisible byp and fails; r=11 gives5 prime to3. ψ₁ψ₄=ψ₂ψ₃=z⁻¹. | Prime selection by cases and symplectic similitude agree. |

### Source-locator ledger

“Compared” means the cited statement, domain, normalization and relevant surrounding text were read; it does not certify an entire proof. R14 shows why source agreement alone is insufficient. The following counts treat a named statement once, or an explicitly grouped section locator once.

| Source | Count | Compared locators and extraction anchors |
| --- | ---: | --- |
| BPS | 9 | Hypothesis 1.1.1 (line229); Proposition 3.2.1 and Corollary 3.2.2 (lines726,739); Proposition 4.2.1 (line867); Lemmas 4.4.3 and 4.4.5 (lines1060,1104); Hypothesis 4.5.1 (line1116); Theorem 5.3.1 and Remark 5.3.2 (lines1331,1353). |
| P20 | 9 | §§4.2.1–4.2.3 (line713); §7.1 and Lemma 7.1.1 (lines1698,1721); Proposition 7.4.2.2 and Lemma 7.4.2.6 (lines2262,2312); Proposition 8.2.1 (line2427); Lemma 14.8.2 (line4603); Proposition 15.1.1 and Theorem 15.2.1 (lines4844,4886). |
| BCGP21 | 22 | §3.6.3 (line2638); §5.2 (line5791); Proposition 5.4.3 and Corollary 5.4.5 (lines5906,5953); Proposition 5.6.1, Definition 5.6.2 and Proposition 5.6.3 (lines6081,6117,6143); Propositions 5.7.4 and 5.7.8 (lines6297,6396); Theorem 5.8.4, Theorem 5.8.6 and Remark 5.8.7 (lines6487,6531,6546); Theorem 6.2.6 (line7049); Propositions 6.3.6–6.3.7 (lines7157,7161); Corollary 6.4.3 (line7398); Lemma 6.5.4 and Theorem 6.5.8 (lines7499,7530); Proposition 6.6.2, Remark 6.6.3 and Theorems 6.6.4–6.6.5 (lines7926,7955,7986,8004). |
| BCGP25 | 15 | Definition 2.2.26 (line1089); §4.1 (line3086); §4.6.46 (line4205); Theorems 4.7.1, 4.7.2, 4.7.5 and Corollary 4.7.6 (lines4431,4457,4488,4496); Theorem 4.9.9 (line4711); Propositions 4.10.3 and 4.10.6 (lines4731,4770); Theorem 4.10.12 (line4816); Lemma 4.12.3 and Theorem 4.12.4 (lines5046,5080); Theorem 7.3.1 and Lemma 7.3.8 (lines7494,7662). |
| AIP15 | 3 | Proposition 2.2.2 (line329); Propositions 7.2.3 and 7.3.1 (lines1511,1527). |
| BP26 | 2 | Theorems 5.5.1–5.5.2 (lines2957,2976). |

### Expression, arrangement and reuse

Fourteen prose units were compared, including definition wording, proof routes, remarks and the Lean explanation: README §§1.2, 1.4, 2.3, 2.8, 3.1, 3.3, 4.4a, 5.2, 5.7, 6.1, 6.4, 7.4 and 9.5, and Suggested.lean's explanation of the companion identity. Anchors include BPS lines622–635, 726–734, 1060–1069 and 1331–1356; P20 lines1698–1727 and 2427; BCGP21 lines6117–6150, 6487–6516, 7150–7162 and 7955–7985; AIP15 lines1511–1541; BCGP25 lines4431–4456; BP26 lines2957–2978. No nonmathematical consecutive-word borrowing or reproduced table, figure, exercise list or dataset was identified. Formulae, conventional names and the mathematical sequence of a short argument were not counted as copied prose. No external formalization has a matching Lean declaration because this file declares none.

For the arrangement test the source-reference census counts explicit source-ID occurrences outside bibliography entries, including repeated references and the source-issues appendix: BCGP21 95, BCGP25 88, BPS 26, P20 23, AIP15 4, total236. BP26 is referenced bibliographically and through the supplier but has no explicit numbered locator in this README. BCGP21 has the largest share. Its contents at lines55–80 give the arrangement witness in R15. Dependencies force Layer4 before the two later branches, but not the source's placement of doubling between Hida control and Coleman comparison.

## Not verifiable

- No theorem was proved or elaborated. The empty Lean namespace makes the requested declaration-signature run inapplicable, and the brief prohibits builds. The concrete computations are necessary consistency tests, not a substitute for the future geometric proofs.
- Source certification is limited to the 60 locator groups recorded above and the additional passages used in findings and source-error checks. This report does not certify every remaining individual locator or every step of a source proof. All six cited works were available legally; no missing-reference request was needed.
- §8.3 expressly leaves the constrained-fibre nonvanishing argument to be established after identifying a source proof gap. The all-germs calculation is false, as computed above; this pass supplies no replacement geometric proof and makes no counterclaim to the theorem.
- Declared supplier gaps remain future contracts, not implemented library results. Their eventual constructions, compatibilities and repaired hypotheses cannot be validated by a read-only review of these target files.

## Source issues

- **Error** in BPS at Lemma 4.4.3, HAL p.24, BPS line1068: the source says the map into a k-fold product is finite étale; it should be the individual quotient coordinates that are finite étale; affects the proof.
- **Gap** in BPS at Lemma 4.4.5, HAL p.25, BPS line1104: the source says a degree lower bound gives the displayed estimate for arbitrary terminal weights; it should be applied with nonnegative terminal weights, as the later slope region ensures; affects the proof.
- **Misprint** in BCGP21 at Definition 5.6.2, p.126, BCGP21 line6126: the source says the quotient polarization descends from p²x_w times the original polarization; it should be p²/x_w times the original polarization; affects a stated result.
- **Misprint** in BCGP21 at the paragraph following Proposition 5.7.4, p.130, BCGP21 line6306: the source says the map from ω_w to ω_w^(p²) is the inverse restriction; it should be the restriction of δ itself; affects nothing.
- **Error** in BCGP21 at Remark 5.8.7, p.135, BCGP21 line6547: the source says the generated algebra is local for every finite-dimensional M; it should separate M=0 and assert locality only for nonzero M; affects a stated result.
- **Gap** in BCGP21 at Proposition 6.6.2, pp.165–166, BCGP21 line7949: the source says the witness cohomology has its cuspidal automorphic description without recording localization; it should carry the non-Eisenstein hypothesis of the invoked comparison; affects the proof.
- **Misprint** in BCGP25 at the paragraph after Definition 4.6.35, p.88: the source says applying the exact contravariant coefficient functor keeps the cohomology index i; it should use the input cohomology in degree −i; affects a stated result.
- **Misprint** in BCGP25 at Remark 4.10.7, p.107, BCGP25 line4791: the source says the degree-zero coefficient has weight (1,1); it should have weight (2,2), as the adjacent duality and four-piece formulas require; affects a stated result.
- **Gap** in BCGP25 at Proposition 3.6.15, proof, pp.66–67: the source says the overlap differential is injective on analytic germs; it should establish nonvanishing on the constrained fibre, since 1/(1+x) lies in the all-germs kernel; affects the proof.
- **Misprint** in BCGP25 at the prime choice before Lemma 7.3.8, p.167, BCGP25 line7654: the source says r is not 1 modulo p, adding a modulo-4 restriction at p=2; it should impose the modulo-p and modulo-4 restrictions in separate cases; affects the proof.
- **Misprint** in BCGP25 at Lemma 7.3.8, proof, p.167, BCGP25 line7678: the source says the group ring uses the quotient with level one over level two; it should use level two over its normal subgroup level one; affects nothing.

- **Gap** in BPS at Theorem 5.3.1, proof, HAL p.31, BPS line1338: the source says failure of dimension greater than one gives the upper half-plane; it should also separate zero-dimensional definite data, whose terminal weight coordinate may be absent; affects the proof.
- **Misprint** in BCGP21 at Corollary 6.4.3, proof, p.154, BCGP21 line7417: the source says U composed with θ equals p^m times θ composed with U; it should reverse the compositions to obtain the positive twist used immediately afterwards; affects the proof.
- **Error** in BCGP21 at §6.5.1, p.154, BCGP21 line7428: the source says torsion-module degree sums valuations truncated modulo p; it should sum untruncated valuations, giving degree 2 rather than 1 for O_K/(p²); affects a stated result.
- **Misprint** in P20 at §15.2.1, p.107, P20 line4897: the source says −λ₁≥λ₂>−λ₁, an empty interval; it should read −λ₁≥λ₂>λ₁, allowing the subsequent singular parameters (λ₁,0) with λ₁<0; affects nothing.

Source independence: 14 prose units compared with 6 sources; no wording or artifact reuse identified. Largest share BCGP21, 95 of 236 explicit source references (bibliography excluded). Contents compared with BCGP21: arrangement defect R15. The source's polarization misprint is carried into the mathematics (R14).

## For the human reviewers

- BCGP25 is cited as arXiv:2502.20645v1 in packages/PadicFamiliesPartII/README.md:1486. The cached version is a preprint; the report does not establish a later refereed publication or its licence status.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5ee4ae5d317a31d69a62bd8430dd34d673c58d8a", "job": "RT-PadicFamiliesPartII~1a", "model": "gpt-6-astra", "worker": "chris-30"} -->
