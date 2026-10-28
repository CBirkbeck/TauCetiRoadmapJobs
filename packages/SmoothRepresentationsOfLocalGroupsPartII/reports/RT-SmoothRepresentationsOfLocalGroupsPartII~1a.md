<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1642#issuecomment-6435704155 -->
Red team round 1 pass a (codex) of e4d41bc

Verdict: needs_changes

1. **F01** (P1) The explicit classical classification switches group and dual types

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:1216`, “type C: 0 ≤ ν₁ ≤ ⋯ ≤ νₙ < ½; types B, D: the alternating conditions”. Also :1428.

   **Claim:** These are the type-C and type-B cases for the group G used throughout SRU.5.

   **Witness:** For G=PSp₄, ν=(0,¾) has highest-coroot value ¾<1, hence is unitary by §5.8; the displayed type-C bound rejects it. BC1 line 788 labels the **dual Hecke root system** C.

   **Exact repair text:** “In the following BC1 coordinate formulas, A, B, C, D denote the root system Φ∨ of the dual group. Thus the C formula applies to G=SO(2n+1), and the B formula applies to G=PSp(2n). Type D is self-dual.” Apply that convention explicitly in §5.29 as well. With it, PSp₄ uses B₂ and (0,¾) satisfies i=2, ¾<1−0.

2. **F02** (P1) The generic standard-module consequence loses the central exponent

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:849`, “its differential is a positive combination … of fundamental weights”; proof at :853.

   **Claim:** Every generic irreducible of any quasi-split reductive G has differential supported on Δ∖S.

   **Witness:** Take G=F× and π=|·|. It is smooth, irreducible and generic because U=1. Here P=G and Δ∖S=∅, so the displayed sum is 0, but π(ϖ)=q⁻¹≠1.

   **Exact repair text:** “The restriction of the real inducing exponent to the derived group is Σ_{α∈Δ∖S}s_αϖ_α with s_α>0; retain separately its real central component in a_G*. For unitary central character that component is zero.” For |·| the root sum remains 0 and the nonzero central component supplies q⁻¹.

3. **F03** (P2) Unitary induction need not define a point of the unitary dual

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:726`, “square-integrable and unitary-induced representations define points of Ĝ”.

   **Claim:** Unitarily induced representations themselves belong to the irreducible unitary dual.

   **Witness:** For G=P=F×, take σ=1⊕1. Normalized induction is σ, a nonzero two-dimensional unitary representation with a proper invariant line. It has no class in the irreducible dual defined in §0.6.

   **Exact repair text:** “The trivial and Steinberg representations, irreducible square-integrable representations, and irreducible constituents of admissible finite-length unitary inductions define points of Ĝ.” The witness then supplies the single constituent class [1], with multiplicity two in the induction.

4. **F04** (P2) The internal build has forward prerequisites and a classification cycle

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:1220`, “explicit output inequalities in SRU.5.29”; :1525, “Needs: SRU.5.11 and SRU.5.28”.

   **Claim:** Each proof route consumes earlier inputs in the proposed build.

   **Witness:** §5.11 needs the explicit classification output of §5.29, while §5.29 needs §5.11. Further forward edges are 3.4→3.5→3.6, 4.1/4.4/4.5→4.9, 5.3→5.4, 5.4/5.8/5.9/5.10→5.28, 7.4→7.5 and 7.11→7.12.

   **Exact repair text:** “Prove the signature comparison and explicit region theorem independently before assembling the all-type classification; §5.29 depends on §5.28 and the root data, not on §5.11.” Order the remaining named inputs before their consumers (split §4.9 into the Coxeter and contraction inputs). The edge 5.29→5.11 then disappears and the classification chain is acyclic. The roadmap-level depcheck does not detect these internal edges.

5. **F05** (P2) Weak-star compactness is statable on the pinned carriers

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/Suggested.lean:12`, “Weak-star compactness needs the integrated positive-type embedding”. README target §1.4.

   **Claim:** No acceptance signature can state this headline with native carriers and simple definitions.

   **Witness:** The pinned `Lp`, Bochner integral, function-space topology and `IsCompact` already express the image under all L¹ test integrals. This is exactly the weak-star topology used in §1.4, without constructing a new dual carrier.

   **Exact repair text:** Replace the unstatability claim with the following headline and register its name in README §1.4:

   ```lean
   /-- The positive-type subunit ball is compact in its L¹-test topology. -/
   theorem isCompact_positiveTypeSubunit_integrals
       {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
       [T2Space G] [LocallyCompactSpace G] [SecondCountableTopology G]
       [MeasurableSpace G] [BorelSpace G]
       (μ : Measure G) [μ.IsHaarMeasure] :
       IsCompact ((fun φ : G → ℂ =>
         fun f : Lp ℂ 1 μ => ∫ g, f g * φ g ∂μ) ''
         {φ | Continuous φ ∧ IsPositiveType φ ∧ (φ 1).re ≤ 1}) := by
     sorry
   ```

   For the trivial group with Haar mass a>0, this is the compact segment of functions f↦a·f(e)·t, 0≤t≤1. On the circle, the characters z↦zⁿ have test integrals tending to zero, which is included by the subunit bound. This is the full stated compactness assertion, not a boundary-case substitute. The proposed signature has been checked by reading the pinned types, not by running Lean.

6. **F06** (P2) A nonminimal splitting extension gives the wrong automorphism order

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:1539`, “split over an unramified extension … of degree d”; “automorphism τ … of order d ∈ {2, 3}”.

   **Claim:** The degree of any chosen unramified splitting extension equals the order of the pinned Frobenius action.

   **Witness:** Quasi-split nonsplit PSU₃ splits over the unramified quadratic extension and therefore also over the unramified extension of degree four. For the latter d=4, whereas its diagram automorphism still has order two.

   **Exact repair text:** “Let d be the least degree of an unramified extension splitting G, and choose the unramified extension k′/k of degree d. Then the pinned Frobenius action τ has order d∈{2,3}.” Apply this convention to the repeated hypotheses in §§6.1–6.3. For PSU₃ it fixes d=2 regardless of other splitting extensions.

7. **F07** (P1) The generic constituent count uses unowned general multiplicity one

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:839`, “a constituent count of one gives uniqueness”.

   **Claim:** The cited smooth suppliers and heredity give a one-dimensional Whittaker space for every irreducible generic Levi representation.

   **Witness:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:2208` restricts `whittakerCoinvariants_one_dimensional` to complex GL₂. For a G₂ Levi equal to G₂, heredity only says dim Hom_U(σ,ψ)=dim Hom_U(σ,ψ); it supplies no bound of one.

   **Exact repair text:** Add before §3.7: “For every quasi-split connected reductive group M over a characteristic-zero nonarchimedean local field, every nondegenerate Whittaker datum (U_M,ψ_M), and every irreducible admissible complex σ, dim Hom_{U_M}(σ,ψ_M)≤1; it equals one exactly when σ is ψ_M-generic.” Give the general multiplicity-one proof and primary locator, or declare this exact supplier gap. Then cite it separately from heredity. For P=G₂, genericity and the bound now give dimension one; heredity alone remains the identity.

8. **F08** (P1) The standard-module proof imports an unowned analytic theorem

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:853`, “prove holomorphy of the local coefficient … with Heiermann–Muić this gives the standard module conjecture”.

   **Claim:** The stated Needs supply the proof of the standard-module theorem.

   **Witness:** HO lines 74–105 require the meromorphic Shahidi local coefficient, its negative-chamber holomorphy, and a separate implication to irreducibility. The Needs at README:859 supply only heredity and Langlands classification; neither constructs or bounds that function.

   **Exact repair text:** Add explicit prior targets: “Construct the meromorphic local coefficient for quasi-split G/F in characteristic zero and irreducible generic tempered τ, with the fixed Whittaker and intertwining normalizations; prove its negative-chamber holomorphy (HO Theorem 1.1); prove that this holomorphy implies genericity of the Langlands quotient exactly when its standard module is irreducible (the implication used in HO Corollary 1.2).” Give each its own Needs and exact primary locator, or declare named supplier gaps. Include the central direction correction of R02. In the torus case the coefficient is 1 and the standard module is already irreducible; the G₂/E₈ cases require the newly owned analytic assertions.

9. **F09** (P2) The isolation proof applies an almost-simple theorem to a general Levi

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:1001`, “barbasch-moy-genericity for M”.

   **Claim:** §4.3 applies to every proper Levi encountered in §4.7.

   **Witness:** In G=PGL₄, the Levi of block type (2,2) has a one-dimensional split center and derived type A₁×A₁. It is not the split almost-simple G required at README:937 and :939.

   **Exact repair text:** “State and prove the Whittaker/sign and finite-Steinberg K-type comparison for every split connected reductive group, retaining its center, full root datum and the compatible Whittaker datum of R21; include the finite-length occurrence consequence.” Use that general statement in §4.7 and add the (2,2) Levi as a Check: its finite sign type is the tensor of the two rank-one sign types, each of multiplicity one. This covers the actual induction step without treating M as almost simple.

10. **F10** (P3) Three exceptional-type source lines point to different statements

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:1306`, :1318 and :1342; “CH26 line 858”, “CH26 line 865”, “CH26 line 881”.

   **Claim:** These lines locate respectively the G₂, F₄ and E₇ half-integral calculations.

   **Witness:** CH26 lines 858, 865 and 881 lie in the earlier general alcove discussion. The actual sections begin at CH26 lines 1060 (G₂), 1072 (F₄), and 1111 (E₇).

   **Exact repair text:** Replace those parenthetical locators by “CH26 §6.7, PDF p.22, CH26 line 1060”; “CH26 §6.8, PDF p.22, CH26 line 1072”; and “CH26 §6.10, PDF pp.23–24, CH26 line 1111”. The repaired passages give respectively highest-coroot values 1, 1 and ½ for the remaining nonzero candidates, matching the targets.

11. **F11** (P3) Several Checks repeat laws, and extraneous points have only one discriminating Check

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:1788–1789`, “the central point … is not extraneous”; “the definition requires geometricity”. Also :180, :281, :340, :427, :549 and :1054.

   **Claim:** These are discriminating instance Checks of the defined objects.

   **Witness:** The last two §7.9 bullets merely negate conjuncts of its definition, leaving one numerical instance. The other listed bullets repeat inverse, coefficient-comparison, representative-independence, reflexivity, limit/cluster inclusion, or polar-decomposition uniqueness laws without an instance.

   **Exact repair text:** Move the general laws to API prose and replace the affected Checks with these computations:

   - §0.1: “For C₄ acting on ℂ by χ(g)=i, the intertwiner T(z)=iz has inverse −iz and their composite sends 1 to 1.”
   - §0.4: “For that C₄ character at g, c(χ,1)=i, the opposite-slot coefficient is −i, and its value at g⁻¹ is i.”
   - §0.6: “For the C₂ trivial representation, vectors 1 and i both give coefficient (1,1), whereas the sign representation gives (1,−1).”
   - §1.1: “The zero representation is weakly contained in every π using n=0; a unit-vector coefficient cannot be approximated by the zero representation on {e} with ε=½, since the error is 1.”
   - §1.7: “An alternating sequence of the two C₂ characters has no limit and has both characters as cluster points; a constant sequence has its single character as both.”
   - §5.1: “At q=2, diag(−2,−½) has compact factor −I and positive factor diag(2,½); deleting the compact factor changes the Satake parameter.”
   - §7.9: “For Sp₆ and partition (2,2,2), the central vector (½,½,½) is geometric and unitary but not extraneous: its squared distance from itself is zero.”
   - §7.9: “For PGL₂, ν=¼ω has root pairing ¼, so its generic spherical representation is unitary but not adjoint-half-integral, hence not extraneous.”

   Together with the existing Sp₆ vector (0,½,1), these give three distinct §7.9 outcomes and exclude the plausible wrong definitions that omit either inequality with the central point or geometricity.

12. **F12** (P1) The L¹ duality supplier on main has only finite-measure scope

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:101`, “Apply it to the σ-finite regular left Haar space”.

   **Claim:** BanachSpaceTheory B5 already supplies the required σ-finite L¹/L∞ duality.

   **Witness:** On main, `TauCetiRoadmap/BanachSpaceTheory/README.md:257` scopes B5 to finite measure spaces; its duality at :336 has no σ-finite extension. Counting Haar measure on ℤ has μ(ℤ)=∞ and fails that supplier hypothesis.

   **Exact repair text:** Declare “What BanachSpaceTheory must provide (gap:sigma-finite-l1-duality): Supply the isometric complex-linear identification (Lp ℂ 1 μ)*≃Lp ℂ ∞ μ by the bilinear integral pairing for every σ-finite measure μ, with its norm and weak-star evaluation laws.” Add the matching named-supplier entry in the plan's gaps. For ℤ this supplies ℓ¹*≃ℓ∞ despite infinite total mass. The open revision of BanachSpaceTheory does explicitly add σ-finite scope, but the brief forbids consuming a revision of an existing roadmap instead of its main version; recording the gap makes the dependency honest.

13. **F13** (P3) The Hilbert-sum locator presupposes the construction it is cited for

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:190`, “BHV, Exercise F.6.4”.

   **Claim:** This locates the coordinatewise Hilbert-sum construction and continuity assertion.

   **Witness:** BHV line 16976 is the weak-containment/closure exercise, already assuming Hilbert sums. The actual Hilbert-sum definition and coordinatewise action occur at BHV lines 11742–11761, Definition A.1.6, printed p.310.

   **Exact repair text:** “BHV, Definition A.1.6 and its preceding Hilbert-sum construction, printed p.310, PDF p.319; BHV line 11742.” Retain F.6.4 for §1.8. The located formula gives zero for the empty index set and the original action for a singleton, as required.

14. **F14** (P2) The torus positive-part construction already has an earlier owner

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:1043`, “Polar decomposition is … coordinatewise”; API at :1047–1048.

   **Claim:** This roadmap constructs the unique compact/positive torus decomposition and its Weyl equivariance.

   **Witness:** `packages/LieHighestWeightPartII/design/README.md:708–743`, N5/positive-real-part, already owns r(s), u(s), uniqueness by character values, and Weyl equivariance. For diag(i,−i), that target gives r(s)=1 and u(s)=s.

   **Exact repair text:** “Consume LieHighestWeightPartII N5/positive-real-part. Define only the q-dependent coordinate ν=(log q)⁻¹ log r(s), with q≥2, and its Satake/chamber specialization.” Add that exact target to §5.1 Needs and remove the duplicate construction proof. For diag(i,−i), the imported positive part still gives ν=0 and compact part s; for diag(2,½) at q=2 it gives ν=(1,−1).

15. **F15** (P2) The Aubert–Jacquet comparison leaves its conjugating Weyl element unspecified

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:1617`, “for the conjugate subset J′ = w_J(J)”; the API repeats it at :1629.

   **Claim:** The displayed comparison has a defined source Levi, target Levi and conjugation direction.

   **Witness:** Ban02 lines 254–256 use the longest w with w⁻¹(J)>0 and the Levi w⁻¹(M_J). In A₂ with J={α₁}, w=s₂s₁ gives w⁻¹(J)={α₂}, whereas w(J)={−α₁−α₂}, not a simple subset.

   **Exact repair text:** “Let w be the longest element of {x∈W : x⁻¹(J)⊂Φ⁺}, and put J′=w⁻¹(J). Then r_{P_J}D_G=Ad(w)D_{M_{J′}}r_{P_{J′}}, where Ad(w) transports representations from M_{J′} to M_J.” Apply it in the API as well. The A₂ witness now uses M_{α₂}→M_{α₁}, and the displayed composition is typed.

16. **F16** (P3) The isogeny extension needs Reeder's Hecke theorem, not his ramified group theorem

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:1692`, “Reeder 2002 in general”; its CH26 §8.1 locator points to CH26 line 1315.

   **Claim:** The cited extension removes the isogeny restriction without adding a residue-characteristic restriction.

   **Witness:** Re02 lines 18–27 and 37–40 retain connected center and a restriction on p in Theorem 1. The unrestricted-root-datum affine-Hecke classification is Theorem 2, Re02 lines 71–75, with q not a root of unity.

   **Exact repair text:** “For arbitrary isogeny the affine-Hecke extension is Reeder, Theorem 2, printed p.102 (Re02 line 71); combine it with the supplied Iwahori equivalence. Here q≥2 is not a root of unity. Reeder's Theorem 1 is the different ramified-principal-series group theorem.” Use primary locators KL87 Theorem 7.12 and Re02 Theorem 2 alongside CH26. At q=2 and arbitrary root datum the repaired citation applies; no restriction to large residue characteristic is introduced. The present adjoint theorem itself does not require this extension.

17. **F17** (P3) The source manifest omits cited primary and waived works

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/sources.toml:4–327`, the nineteen source entries; README:853, :1692 and :1836.

   **Claim:** Every cited work has one source-manifest entry with its access status and exact locator.

   **Witness:** There are no entries for KL87, Re02, HM07, BM89 or BM93, although those works are named in the proof routes. The seven source keys explicitly waived in the brief are also absent from the manifest.

   **Exact repair text:** “Add source entries using the existing waived keys BM94, KS71, Mi73, Rodier81, Steinberg68, Borel79 and Ber74, retaining status waived. Add KL87 (Theorem 7.12) and HM07 (the standard-module implication) as uncertified; add Re02 (Theorem 2, p.102) and BM93 (Theorem 8.1, pp.633–634) from the publisher-open copies, and BM89 (Theorems 1.1–1.2, p.19) from the institutional copy.” Use the sources service metadata and precise cited-for targets. The review's service requests obtained Re02, BM89 and BM93 legally and resolved KL87/HM07 only to paywalls; no new request for a waived work is needed. Cite BM89 only for real infinitesimal character and use BM93 for the reduction from general compact part; BM89 lines 21–29 explicitly retain the real hypothesis.

18. **F18** (P2) The single-family-member headline is absent from the acceptance test

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:508`, “each a normalised coefficient of a single πᵢ”; `Suggested.lean:144` only quantifies one π.

   **Claim:** The Lean signature tests the family version asserted in §1.6 and used in the closure theorem.

   **Witness:** The Lean conclusion chooses a vector in one previously supplied representation. Applied to a Hilbert sum it still chooses a vector of that sum, not an index i. The stronger conclusion is statable with existing dependent Hilbert-space families.

   **Exact repair text:** Add a family version on native `ContRepresentation` carriers: for a family πᵢ on Hᵢ, assume each is unitary and strongly continuous and that every σ-coefficient is approximable on compact Q by finite sums Σ_j c(π_{a_j},z_j). For irreducible σ conclude, for every unit v, compact Q and ε>0, `∃ i, ∃ w : Hᵢ, ‖w‖=1 ∧ ∀ g∈Q, ‖c(σ,v)(g)−c(πᵢ,w)(g)‖<ε`. This is the family's coefficient definition of weak containment, using no Hilbert-sum carrier. Keep the same lcsc and completeness hypotheses. Register the new Lean name in §1.6. For C₂ and σ=sgn, family {1,sgn}, it must choose sgn when Q=C₂ and ε<2; for the reducible regular σ and v=δ_e neither family member works for ε<1. Those values distinguish the headline from the already stated single-representation version.

19. **F19** (P1) Springer layer H does not supply the claimed convolution theory

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:129`, “H, convolution and its homological conventions”; the ownership paragraph at :15 makes the same claim.

   **Claim:** Homological convolution is an established input from SpringerResolutionAndCharacteristicCycles H, separate from the declared coherent K-theory gap.

   **Witness:** `packages/SpringerResolutionAndCharacteristicCycles/design/README.md:1058` makes H the D-module holonomicity layer. Convolution appears at :1418–1419 only as an input to its own BR-input gap; :1783–1785 explicitly says it is not back-chained to established nodes.

   **Exact repair text:** “Consume SpringerResolutionAndCharacteristicCycles S/steinberg-variety and S/steinberg-components for the reduced variety and its components. The convolution, affine-Hecke identification and fixed-point standard-module inputs are requested through gap:steinberg-equivariant-k-theory.” Remove the claim that H already supplies homological convolution from Scope and ownership as well. This preserves the already declared gap, rather than reporting its absence as a defect. For the point case, H gives D-module duality of vector spaces, whereas the requested K-theory convolution has representation-ring coefficients; these are different inputs.

20. **F20** (P3) The module docstring omits several unstatable deep targets

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/Suggested.lean:11–25`, the list introduced by “The following headlines are not statable”.

   **Claim:** The acceptance file accounts by name for the roadmap's unstatable headline theorems.

   **Witness:** README §§3.7–3.8 and §§4.1–4.4 state general Rodier heredity, the standard-module theorem, finite Steinberg/sign comparison and Rodier's constituent theorem. None is named in the docstring; naming their later generic-limit/isolation applications does not identify them.

   **Exact repair text:** Add: “Rodier heredity and the generic standard-module theorem need the general Whittaker and normalized parabolic functors. General finite Steinberg irreducibility/degree, the Whittaker/sign comparison and Rodier's Steinberg-series constituent/exponent theorem need the finite reductive flag/Hecke and p-adic Jacquet carriers.” Retain the imported native GL₂ specialization rather than adding it as padding: at q=2 its degree is already 2, while the general SL₃ degree 2³=8 remains a different construction. No weakened substitute is requested.

21. **F21** (P1) Genericity for some Whittaker datum does not imply the fixed-K sign type

   **Location:** `packages/SmoothRepresentationsOfLocalGroupsPartII/README.md:937`, “π is generic iff … π^I contains the sign character”. Genericity there means existence for some generic character.

   **Claim:** For every split almost-simple isogeny, genericity detects the Steinberg type of the one fixed hyperspecial K.

   **Witness:** Over ℚ₃, take SL₂ and the K-spherical constituent π₁ of induction of the unramified quadratic character. LR07 lines 667–679 and 772–777 give genericity and dim π₁^K=dim π₁^I=1. T_s acts by 3, not −1.

   **Exact repair text:** “Fix a pinning and a K-compatible Whittaker character ψ_K whose restriction to each simple root subgroup is trivial on its maximal-ideal points and nontrivial on its integral points. State ψ_K-genericity iff the finite-Hecke sign occurs iff st_K occurs. For genericity with respect to an arbitrary Whittaker datum, transport K, I and the sign type under the corresponding adjoint-torus conjugation. At a fixed K retain only st_K-occurrence ⇒ genericity for some datum.” State the anti-spherical Gelfand–Graev comparison with these conductor conventions, and carry the fixed datum through heredity, generic limits and §4.7. Combine with the reductive-Levi generalization in R09; do not restrict the roadmap to adjoint groups or odd primes.

   For the witness, with ψ trivial on ℤ₃, π₁ is ψ-generic but has sign multiplicity zero. For ψ₃(x)=ψ(3x), the other constituent π₂ is generic and has sign multiplicity one for the original K; ψ₃ is torus-conjugate to the character of conductor 3ℤ₃ used in the repaired convention. Transporting to the other hyperspecial subgroup exchanges these roles. Thus the repaired statement distinguishes the two constituents instead of asserting the false converse. The primary reference is Lansky–Raghuram, *Conductors and newforms for SL(2)*, Proposition 3.2.12 and Corollary 3.2.13, printed pp.139–141, read from the publisher-open copy.

## Verified sound

Read all 1883 README lines and all 159 Lean lines. The inventory is 89 numbered mathematical target blocks and 12 Lean declarations (six definitions and six admitted theorems). There are 99 explicitly labelled bullet Checks; all were evaluated, including the nondiscriminating ones identified in R11. The sampled tables below retain computed instances and values; the full per-target ledger is omitted. Cases involving a zero coefficient ring, inseparable coefficient extension, nonreduced scheme or out-of-range polynomial index do not instantiate these complex-Hilbert/local-field statements; q=1 is explicitly excluded, and q=2,3 are retained.

Compared all 12 worker-supplied elaborated signatures with their source and README contexts. None loses a needed section binder. No Lean command was run. Each theorem was also checked against the one-tactic/padding test by reading the definitions and pinned APIs: none of the six is a one-library-lemma restatement, Check, or boundary-case theorem. The six definitions are used by those theorems. All imports exist; there is one `import Mathlib`, no `set_option`, no sorry'd data, no `lemma`, and no fully qualified name collision in the available roadmap Lean files. The head's diff is confined to this package. No computational-algorithm target or process/PR-number narrative was found in README or Lean.

Thirty-six explicitly named native supplier declarations were located at the pins. In particular `Matrix.PosSemidef` accepts arbitrary indices and tests finitely supported vectors; `ContRepresentation` supplies bounded operators but does not assert continuity of the group-variable orbit; Tau Ceti's `IsUnitary` supplies inner-product preservation but not strong continuity; its additive GNS representation assumes an additive commutative group. Mathlib's extreme-points theorem for an algebraic convex hull does not prove the closed-hull Milman converse. The nonabelian GNS translation theorem and Milman theorem therefore remain legitimate targets.

The mechanical dependency check, run read-only with the required arguments, returned:

```text
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. R04 concerns target-level dependencies that this check does not inspect. Citation resolution returned no missing roadmap names or backticked names; its output explicitly says it did not check library names because its host lacks pinned Lake packages, so the separate 36-declaration pin audit above was necessary.

All nine declared gap slugs occur in both README and the plan with named suppliers. Their absence from current supplier texts was not counted as a defect. The existing repair's compact-center/Bernstein-unramified distinction remains settled: the PGL₂ determinant-parity character is nontrivial on an order-two compact subgroup and is not in Ψ(G).

### Sampled adversarial instances

The six theorem rows retain their variable and instance contexts. G carries a Group instance; “topological group” includes `IsTopologicalGroup`. Complex spaces carry `NormedAddCommGroup` and `InnerProductSpace ℂ`, with completeness stated where required. The README sample retains computed values from every layer. “Pass” means the listed instance agrees with the target, not that the future theorem has been formally proved. Standing hypotheses remain in force unless a negative control explicitly leaves them.

| Declaration / section | Variable and instance context | Instances and computed values | Result / change |
|---|---|---|---|
| exists_gnsRep / 0 | Topological group; φ continuous positive; native complete Kolmogorov space | φ=0: dimension 0, all features 0. φ=1: dimension 1, all features equal. For δ_e on S₃: dimension 6, π(g)δ_a=δ_ga and (ga)⁻¹(gb)=a⁻¹b. | Existential identifies the actual translation action; no stand-in. |
| mem_extremePoints_positiveTypeOne_iff / 0 | Same G, φ(1)=1; π unitary/strong and specified on all native features | C₂ t=±1: kernels rank 1, extreme=true, irreducible=true. t=0: kernel rank 2, midpoint of ±1, extreme=false, irreducible=false. | Both directions and action-identification hypothesis agree. |
| extremePoints_closure_convexHull_subset_closure / 1 | Real Hausdorff locally convex topological module; compact closed hull | Empty F: both sides empty. F={0,½,1}: extreme set {0,1}⊂F. ℓ² basis without compactness: averages have norm 1/√n→0, but every basis vector has distance 1 from 0. | Compact hypothesis matters; not pinned algebraic-hull padding. |
| godement / 1 | lcsc Hausdorff topological group, Borel, Haar μ; φ∈Lp ℂ ∞ μ | S₃ counting Haar, φ=1, f=δ_a+iδ_b: integral 2, imaginary part 0. φ=−1,f=δ_e: −1. Rescale Haar by a>0: quadratic integral scales by a². | Both implications pass; modular convention is compatible. |
| raikov / 1 | Same G, μ; arbitrary filter l; continuous φᵢ,ψ in positiveTypeOne | Trivial G: both convergences to 1. Circle χ_n: integrals→0 but χ_n(e)=1, so 0 is excluded by hψ. Bottom filter: both Tendsto assertions true. | No missing proper-filter binder; normalization is essential. |
| exists_coeff_approx_of_weaklyContainedIn / 1 | lcsc Hausdorff G; H,H′ complete; σ,π unitary/strong; σ nonzero irreducible; weak containment; unit v; compact Q; ε>0 | C₂ σ=sgn, π=1⊕sgn: choose w=(0,1), norm 1, error 0. Empty Q still requires and admits this unit w. π=0 makes weak containment impossible by error 1 at e. | The typed theorem passes; family version missing (R18). |

| Target | Instances tried and values computed on the two sides | Result / change |
|---|---|---|
| 0.4 Coefficients | Trivial v=2 gives 4=norm(v)². C₄ unit character gives i versus opposite-slot −i; inversion gives i. Off-diagonal trivial vectors −1,1 give −1, failing positivity. | Pass; R11 makes the comparison Check concrete. |
| 0.8 Smooth vectors/projectors | Conductor 2^n: e_{ℤ₂}=0, e_{2^nℤ₂}=1. Infinite conductor vector has norm²=π²/6 but no open stabilizer. S₃ standard isotypic projection has eigenvalue 1 with d=2, versus ½ if d omitted. | Pass; distinguishes missing dimension factor. |
| 1.4 Weak-star compactness | Trivial group P≤1=[0,1], extreme set {0,1}; P₁={1}. Circle χ_n has L¹ pairings→0 and identity value 1, showing P₁ need not be weak-star closed. | Pass; statable headline R05 and supplier R12. |
| 1.9 Gan–Savin closure | C₂ sequence π₁=sgn, π_n=1 for n≥2: direct sum contains sgn, set closure includes sgn, but no strictly increasing subsequence converges to sgn. | Corrected closure statement passes; original subsequence version fails. |
| 2.5 Completion | Finite-dimensional V completes to itself. Finitely supported ℤ functions complete to ℓ². Distinct-conductor ℤ_p sum has finite K-fixed dimensions and smooth completion=V; infinite trivial sum has completion-fixed space ℓ²≠finite support. | Pass; admissibility cannot be omitted. |
| 3.6 K-types persist | Normalized S₃ standard projector has eigenvalue 1 on the standard and 0 on the other irreducibles. Rank-one spherical complementary series have dim K-fixed=1 but limiting St has dim 0. | Correct one-way implication. |
| 3.8 Standard modules | GL₂ exponents ±¼ give irreducible generic induction; ±½ endpoint has nongeneric quotient 1. Torus abs· has no roots but nonzero real exponent and value q⁻¹ at ϖ. | R02, R08. |
| 4.3 Generic/sign criterion | Trivial representation finite-Hecke type is trivial, no sign; St has sign once. An irreducible rank-one principal series has sign once. For SL₂(ℚ₃), the unramified-quadratic spherical constituent is generic, dim I=dim K=1, T_s=3, sign multiplicity 0. | False converse at stated scope (R21); Levi extension R09. |
| 4.6 Steinberg-series unitarity | A₂ intermediate exponent ρ+wρ=α₁ takes value q⁰=1 on −mω₂∨; St exponent 2ρ takes q^(−2m)→0. At q=2,m=1 these are 1 and ¼. | Modulus factor passes; intermediate constituents excluded. |
| 5.11 All-type classification | In dual type B₂, (0,¾) meets the alternating i=2 inequality ¾<1. In group type C₂, the currently labelled C bound instead says ¾<½, false. | R01; classification cycle R04. |
| 5.27 Noncentral G₂ witness | Positive-coroot values are −1,√q,−√q,√q,−√q,−q. For q=2 or 3 none equals q or q⁻¹. Removing the sign makes the highest value q. Root pairings remain half-integral. | Correct counterexample to unrestricted source claim. |
| 6.1 Fixed dual/companion | PSU₃: fixed dual SO₃, companion SL₂. PSU₄: fixed dual Sp₄, companion SO₅. Triality order 3 gives G₂. A quartic splitting extension of PSU₃ has degree 4 but τ still has order 2. | R06; isogeny retention passes. |
| 7.1 Aubert operator | Torus D=id. GL₂ D[1]=[St], D[St]=[1], D[supercuspidal]=−[supercuspidal]. Rank two supercuspidal sign is +1. A₂ J={α₁} exposes w versus w⁻¹ direction. | Global sign passes; Weyl transport R15. |
| 7.9 Extraneous points | Sp₆ central vector (½,½,½) has norm²¾; extra (0,½,1) has norm²5/4, hence not Weyl conjugate. PGL₂ ν=¼ω is unitary but root value ¼ is not half-integral. | Definition coherent; only one existing discriminating Check (R11). |
| 7.12 E₈ extra-region exclusion | Half-integer lattice: ν₁+ν₄<1⇒ν₄≤½, hence ν₂+ν₄≤1 contradicts >1. Quarter coset: ν₁≥¼⇒ν₄<¾⇒ν₄≤¼, hence ν₂+ν₄≤½. Samples (½)^4 and (¼,¾,¾,¾) violate bounds by 1=1 and 3/2>1. | Pass; strict inequalities and zero retained. |

### Headline acceptance audit

The six stated headlines are nonabelian GNS, pure positive type iff irreducible, Milman's converse, Godement, Raikov, and single-representation coefficient approximation. Weak-star compactness and the family-member conclusion are statable but missing (R05, R18). The unstatable deep targets are Fell closure/isolation; unitary admissibility and smooth/unitary dual comparison; character/generic limits; Rodier heredity and standard modules; finite Steinberg/sign and constituent theorems; Howe–Moore; spherical unitary and half-integral classification; nonsplit transfer; Aubert/semisimple compatibility; Kazhdan–Lusztig classification; and central/complementary-series/extra-point results. R20 identifies the docstring omissions. Their missing carriers are the actual smooth, Whittaker, parabolic, Fell-dual, finite-flag/Hecke, enhanced Springer and local-parameter constructions. Root-coordinate inequalities alone would not test those representation-theoretic conclusions.

### Supplier and ownership audit

Checked 14 named supplier contracts, plus two explicit ownership-boundary citations, against their current main text, new-roadmap head, or supplied board design. The nine matching gap contracts were checked separately. Existing-roadmap revisions were not substituted for main. Searches used object words as well as identifiers: positive kernels/GNS, Hilbert sums, unitary dual/Fell topology, L¹ duality, compact isotypic projectors, Whittaker multiplicity, finite Steinberg, torus positive part, triple centralizers, and Steinberg convolution.

| Supplier / boundary | Resolved current section and outcome |
|---|---|
| SmoothRepresentationsOfLocalGroups | SR.0–SR.5.3 names resolve. SR.2.3 multiplicity one is GL₂ only (R07); SR.3.3 has tempered support, SR.3.4 has nonsplit connected-Iwahori data. Its topology extension remains the declared gap. |
| ReductiveGroupsPartII | RG2.0 rational-point topology; RG2.3 hyperspecial models/quotients; RG2.4.4 Cartan/Iwasawa; RG2.5.1–2 dual data/pinning. Retains residue characteristic two. |
| ReductiveGroups on main | Layers 2 and 7: adjoint action, roots/parabolics and Bruhat structure. No second construction of these objects is needed here. |
| NoncompactQuantumSymmetry | M0a; M0; Shared group C*-algebra and weak-support comparisons. The dim τ projector convention agrees: S₃ standard eigenvalue 1. Finite-product Fell comparison is the declared extra contract. |
| OperatorTheory/PolarDecomposition on main | Part B PD-B24–34 and PD-B36 give rectangular polar factors and uniqueness; for 2id the factor is id, not 2id. |
| BanachSpaceTheory on main | B5 exists but has finite-measure duality scope; R12 records the σ-finite gap. |
| OperatorAlgebraDynamics on main | D1–D2 full group C*-algebra/integrated unitary representation scope; the positive L¹-functional GNS comparison is explicitly requested as a gap. |
| CStarAlgebras | C2 supplies abstract irreducible/pure-state/GNS objects; the PI dimension bound and bounded-trace character-limit results remain the two declared gaps. |
| RepresentationTheory/LieHighestWeight on main | Layers 0, 2, 4: finite-dimensional sl₂/weights/highest weights. h has integral eigenvalues, hence h/2 has half-integral eigenvalues. |
| LieHighestWeightPartII board design | N0–N3 and N5 exist. N5 already owns positive part (R14). Semantic orbit tables and graded open-orbit theorem are covered by the declared gap, not inferred from profiles. |
| SpringerResolutionAndCharacteristicCycles board design | S supplies Springer/reduced Steinberg geometry. H has different scope (R19); coherent K-theory convolution remains the declared gap. |
| EndoscopicTransferAndUnitaryTraceComparison | §2.16 has characteristic-zero distribution characters, regular representatives and independence. Continuity of the induced-character pullback remains the declared gap. |
| ExcursionOperatorsAndSpectralActionPartII board design | SC3/very stability and SC4/atomic-fs-parameter exist. The latter identifies parameter classes on an atomic support; it is not already the all-local-field cuspidal-support compatibility requested by the gap. |
| AutomorphicSpectralTheory | §7.0b states finite-place GLₙ unitary classification/Speh blocks in characteristic zero. SRU.5's Hecke argument supplies its own function-field extension; the GLₙ classification is not rebuilt. |
| HilbertModules ownership boundary | H5 constructs the abstract C*-algebra pure-state quotient and kernel topology. It is a different realization from the group-positive-function quotient. |
| FactorRigidity ownership boundary | R1 defines correspondence coefficient/Fell topology on M–N bimodules. These carriers are not group unitary representations. |

The supplied open sibling checkouts and board packages were searched by the same objects and by the proposed Lean namespace. Besides R14, hits concerned already cited owners, consumers, or distinct carriers (for example K-theoretic Steinberg groups). No fully qualified declaration collision was found. Open work for which the brief supplied neither files nor a needed named supplier was not independently inspected.

Key native witnesses are `Mathlib/RepresentationTheory/Continuous/Basic.lean:54`, `Mathlib/LinearAlgebra/Matrix/PosDef.lean:62`, `Mathlib/Analysis/Convex/Extreme.lean:293`, `TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean:125`, `TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean:52`, `TauCeti/RepresentationTheory/Continuous/MatrixCoefficient.lean:73`, and `TauCeti/Analysis/PositiveDefinite/AddGroup.lean:140`. Their bodies respectively store bounded action data; Hermitian positivity on finitely supported vectors; the algebraic-hull inclusion; the existing Hilbert space; preservation of inner products; a coefficient requiring operator-norm continuity; and the additive difference kernel. None supplies the omitted group-variable continuity or nonabelian GNS action implicitly.

### Source locator audit

Inspected all 19 cached works in the manifest and four additional primary works obtained through the sources service: BM89, BM93, Re02 and LR07. Inventoried and read 95 distinct explicit cached source-line locators (including the continued “and line” references). The following 30 locator groups record checked locations and their scope; finding a passage does not certify a false assertion in it. R10, R13 and R16 record failed support/locator claims. The preprint versions stated by the manifest were used; their page numbers are not silently identified with later journal pagination.

| Source | Located text and verification |
|---|---|
| BHV | A.1.1/A.1.7, printed pp.307/310, BHV lines 11667/11764: strong action and irreducibility; source omits nonzero in the latter. |
| BHV | A.1.6, printed p.310, BHV line 11742: Hilbert sum, including arbitrary index sets. |
| BHV | C.4.1–2, BHV line 14301: kernel positivity and coefficient estimates; adapted to the second-linear convention. |
| BHV | C.4.10, BHV line 14433: cyclic GNS construction. Native Hilbert carrier replaces only its construction, not the group action. |
| BHV | C.5.2, BHV line 14570: normalized pure positive type iff irreducible. |
| BHV | C.5.3–6, BHV lines 14634/14642/14653/14690: integrated positivity, compact subunit ball, extreme points and Raikov. Local-null conventions are harmless under the roadmap's σ-finiteness. |
| BHV | F.1.1/F.1.4/F.2.1/F.6.4, BHV lines 16025/16155/16321/16976: finite coefficient sums, single coefficient, Fell neighborhoods and closure. |
| BHV | C.6.10, BHV line 14923: circle characters show the normalized slice is not weak-star closed. |
| Cas95 | §2.1 and §2.3, Cas95 lines 744/760/858/964/969: averaging, admissibility/completion comparisons and characters. |
| Cas80 | §3 Theorem 3.1 and Proposition 3.5, printed pp.397/401, Cas80 line 432: locations found; extraction does not preserve all formula symbols reliably. Kato's criterion was independently read. |
| HO | Theorem 1.1 and Corollary 1.2, HO lines 88/103: holomorphy and standard-module implication, with characteristic-zero quasi-split scope (R08). |
| BC1 | §§1.2–1.3, 3.2–3.4 and 7.2, BC1 lines 43/91/761/784/2191: real/compact reduction and explicit region tables; B/C are dual-Hecke types (R01). |
| BC3 | Theorems 1.3.1/1.4.1 and Corollary 6.2.6, BC3 lines 124/1272: unitary reduction and nonsplit real-character comparison. |
| Aub95 | Definition 1.5/Theorem 1.7, Theorem 2.3 and Corollary 3.9, Aub95 lines 107/265/423: operator, GLₙ comparison and irreducibility with sign; exactness proof uses the erratum. |
| Aub96 | Theorem, printed p.4687, Aub96 line 27: replacement exactness proof, not a new sign convention. |
| CCLTV | Introduction, CCLTV line 18: historical semisimple Howe–Moore statement; not a proof of the roadmap's all-characteristic version. |
| GI18 | Appendix A, proof of A.2, GI18 lines 1289 and 1446–1454: weak containment and relative isolation force occurrence; does not assert absolute isolation of every square-integrable representation. |
| CIK71 | §4, Lemma 4.3/Theorem 4.4 and following examples, printed pp.94–95, CIK71 line 502: finite-Hecke sign and degree. General alternating construction remains a target here. |
| BCP | §5.2, printed p.53, BCP line 2694: signature constancy/bounded regions. The printed alcove definition has the simple-root misprint recorded below. |
| La24 | Definition 4.2/Theorem 4.3, p.18, La24 line 790: central-character-preserving Iwahori–Matsumoto convention and Aubert comparison. |
| Ban02 | Theorem 3.1, printed p.678, Ban02 line 246: global sign, induction and conjugated Jacquet comparison; R15 fixes the unspecified Weyl transport. |
| CiF4 | Theorem 3.1 and §3.2 B₃ row, pp.10–11/14, CiF4 lines 427/584: unitary involution and corrected F₄ parameter. |
| GS23 | Appendix B §§11.1–11.2, published pp.31–33, GS23 lines 1277/1306/1319/1357/1364/1398/1425: limit/isolation and closure claims; projector/subsequence errors are listed below. |
| Ber92 | Proposition 22 and unramified-character/finite-type passages, Ber92 lines 1281/2853/2861/2887/2934: G° uses all compact subgroups and controls Bernstein unramified twists. |
| Kato81 | Theorem 2.2, Kato81 line 229: singular principal-series criterion retains the Weyl stabilizer condition. |
| CH26 | §§6–8, CH26 lines 775–1459: Satake conventions, individual half-integral lists, nonsplit table and complementary-series tables; corrections and restricted compact sector checked in the adversarial pass. |
| BM89 | Theorems 1.1–1.2, printed p.19, BM89 lines 21/38: real infinitesimal character and connected-center hypotheses are explicit. |
| BM93 | Theorem 8.1, printed p.634, BM93 line 973: reduction to real infinitesimal character used for the general compact part. |
| Re02 | Theorem 2, printed p.102, Re02 line 71: affine-Hecke classification for arbitrary root datum, q not a root of unity; distinguish Theorem 1. |
| LR07 | Proposition 3.2.12 and Corollary 3.2.13, printed pp.139–141, LR07 lines 667/772: the unramified-quadratic SL₂ packet has two generic constituents for different Whittaker data, each with one-dimensional Iwahori invariants. |

The additional legal copies are [BM89, institutional copy](https://www.math.utah.edu/~ptrapa/math-library/barbasch/barbasch-moy-criterion-Invent-1989.pdf), [BM93, publisher open archive](https://www.ams.org/journals/jams/1993-06-03/S0894-0347-1993-1186959-0/S0894-0347-1993-1186959-0.pdf), and [Re02, publisher open archive](https://www.ams.org/journals/ert/2002-006-04/S1088-4165-02-00167-X/S1088-4165-02-00167-X.pdf). Also read [LR07, publisher open archive](https://msp.org/pjm/2007/231-1/pjm-v231-n1-p08-s.pdf), Lansky–Raghuram, 2007, DOI 10.2140/pjm.2007.231.127, for the SL₂ negative control. Each was fetched through the sources service. Resolved initial requests for these works have been removed from the scratch missing-reference list.

## Not verifiable

- No fresh Lean elaboration or build was run, as required by the read-only brief. Binder conclusions use the supplied 12 elaborated signatures and pinned source bodies. The proposed R05 signature and R18 family extension still require the repair worker's elaboration check.
- BM94, KS71, Mi73, Rodier81, Steinberg68, Borel79 and Ber74 are the seven settled waived sources. Their full texts were not read or requested. The exact primary proof steps they cover remain uncertified; their absence is not a package finding.
- KL87 Theorem 7.12 and HM07's standard-module implication resolved through the sources service only to paywalled sources. They remain cited by locator, uncertified. The primary Howe–Moore paper likewise was not obtained; the accessible CCLTV/GS23 passages are secondary statements, while §4.9 explicitly owns the contraction proof.
- Cas80's extracted formula typography is damaged. Its locations were checked, but no claim is made to have certified every exponent symbol from that extraction alone; Rodier's primary statement is waived, and the finite-rank exponents in the table were computed independently.
- The supplier gaps are future contracts, not implemented or independently proved libraries. Conditional uses of the PI theorem, bounded-trace limit theorem, induced-character continuity, tempered topology, finite-product dual topology, all-field parameter compatibility, triple/orbit tables, integrated GNS and coherent K-theory cannot be proof-certified by this package review.
- Exceptional-region inequalities and orbit-table consequences were checked against the accessible text and the displayed instances. This review does not re-prove all exceptional Weyl-type signature tables or semantic Bala–Carter identifications; the stated supplier gaps and §5.28 carry that work.
- Ownership against unprovided, uninspected open-roadmap files is not certified. The supplied sibling checkouts, main, board packages and the current named suppliers were searched; absence of hits there is not a claim about inaccessible work.

## Source issues

- **Misprint** in GS23 at proof of Proposition 11.3, printed p.32, GS23 line 1361: the source says the volume-normalized conjugate character is an isotypic projector; it should be multiplied by dim τ, giving eigenvalue one instead of 1/dim τ; affects the proof.
- **Error** in GS23 at Proposition 11.6, printed p.33, GS23 line 1398: the source says weak containment in a sequence's sum forces a subsequence limit; it should be membership in the closure of its set of classes; affects a stated result.
- **Misprint** in Ban02 at Theorem 3.1(6), printed p.678, Ban02 line 259: the source says D_G preserves irreducible representations without a sign; it should be irreducible up to sign, as its supercuspidal formula already shows; affects a stated result.
- **Misprint** in Ban02 at proof of Lemma 3.2, printed p.678, Ban02 line 268: the source says the final Hom summand again has target V₁; it should be target Vₙ; affects nothing.
- **Gap** in Aub95 at Proposition 3.2 and proof of Theorem 3.6, printed pp.2186–2188, Aub95 line 329: the source says the intersection identity proves the duality complex exact; it should be replaced by the filtration proof without assuming Proposition 3.2; affects the proof; corrected in print at Aub96, Theorem and proof, pp.4687–4690, Aub96 line 27.
- **Misprint** in CH26 at §6 following (6.2), printed p.17, CH26 line 807: the source says dominant ν gives the spherical quotient of X(ν); it should be the spherical subrepresentation, equivalently the quotient of X(−ν), for its χ_s convention; affects a stated result.
- **Error** in CH26 at Corollary 6.32(1), printed p.25, CH26 line 1192: the source says the generic geometric-unitary temperedness test allows arbitrary compact part; it should be restricted to real or central compact part, with centralizer reduction otherwise; affects a stated result.
- **Misprint** in CH26 at §7 and the order of τ, printed pp.25–26, CH26 line 1211: the source says the chosen splitting degree gives the order of τ; it should be the least unramified splitting degree; affects a stated result.
- **Misprint** in CH26 at §8.1, printed p.27, CH26 line 1315: the source says Reeder Theorem 1 removes the isogeny restriction; it should cite Reeder Theorem 2 for the affine-Hecke statement; affects the proof.
- **Error** in CH26 at Theorem 8.5, printed pp.28–29, CH26 line 1359: the source says the extraneous-point list is exhaustive for unrestricted compact part; it should retain the real or central compact restriction, since the noncentral G₂ zero-orbit example is omitted; affects a stated result.
- **Misprint** in CH26 at Theorem 8.5(3), printed p.29, CH26 line 1384: the source says the F₄ B₃ parameter includes an additional ω₂; it should be ω₁+½ω₃+½ω₄, of squared norm 15/2 rather than 39/2; affects a stated result.
- **Misprint** in CH26 at proof of Theorem 8.5, case (2), printed p.29, CH26 line 1422: the source says surviving orthogonal factors have odd block size j; it should be even j, the odd symplectic factors having just been eliminated; affects the proof.
- **Misprint** in CH26 at §8.3 after (8.8), printed p.30, CH26 lines 1454–1456: the source says the two coordinate lattices become ℤ+½ and ℤ+¼; it should be ½ℤ and ¼+½ℤ, retaining zero in the first case; affects the proof.
- **Misprint** in BCP at §5.2, (5.2.3), printed p.53, BCP line 2709: the source says the fundamental alcove tests only simple roots; it should test all positive coroots, equivalently the highest coroot in the dominant chamber; affects a stated result.
- **Misprint** in BHV at Definition A.1.7, printed p.310, BHV line 11764: the source says absence of proper nontrivial invariant subspaces defines irreducibility; it should also require a nonzero Hilbert space; affects a stated result.
- **Misprint** in BHV at proof of Theorem C.5.5(i), printed p.385, BHV line 14662: the source says both endpoint values equal one even for t=0 or t=1; it should first dispose of these endpoints and assume 0<t<1; affects the proof.
- **Misprint** in BHV at final sentence of Theorem C.5.5(ii), printed p.386, BHV line 14686: the source says every normalized positive function is in the closure of the extreme points; it should say the closure of their convex hull; affects the proof.
- **Misprint** in BC1 at §1.2 following (1.2.2), printed p.2, BC1 line 78: the source says X*(H) consists of homomorphisms from F× to H; it should be X_*(H), the cocharacter lattice; affects nothing.
- **Misprint** in Ber92 at Proposition 23(2), printed p.40, Ber92 line 1291: the source says every parabolic is conjugate to exactly one minimal parabolic; it should be exactly one standard parabolic; affects a stated result.
- **Misprint** in Ber92 at Lemma 18, printed p.39, Ber92 line 1268: the source says matrix coefficients of nonisomorphic matrix coefficients are independent; it should say coefficient spaces of pairwise nonisomorphic irreducible representations form a direct sum; affects a stated result.
- **Misprint** in LR07 at proof of Proposition 3.2.12, printed p.140, LR07 line 742: the source says π₁ has norm-supported Fourier transforms and π₂ nonnorm-supported ones; it should exchange those labels, as the spherical-vector calculation on p.141 does; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "e4d41bc7290cd3554d54e61db3d68b3351b432a5", "job": "RT-SmoothRepresentationsOfLocalGroupsPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
