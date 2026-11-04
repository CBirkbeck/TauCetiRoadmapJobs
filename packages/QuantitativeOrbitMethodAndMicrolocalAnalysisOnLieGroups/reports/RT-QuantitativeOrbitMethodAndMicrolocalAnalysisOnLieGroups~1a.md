<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2145#issuecomment-6441565510 -->
Red team round 1 pass a (codex) of c263049

Verdict: needs_changes

1. **F01** (P3) Infinite dimension does not exclude smoothing identities

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:310: “The identity is not smoothing on an infinite-dimensional representation”.

   **Claim:** Infinite-dimensionality forces unbounded Nelson powers.

   **Witness:** Let G = ℝ act trivially on ℓ²(ℕ). Then dπ = 0, Δ = I, every Sobolev norm is the Hilbert norm, and ΔᴺIΔᴺ = I has norm 1 for all N.

   **Exact repair:** Replace the Check by: “On the regular representation of ℝ, the identity is not smoothing: its Fourier multiplier 1 fails H⁰ → H² boundedness. On an infinite-dimensional trivial representation, Δ = I and the identity is smoothing.” The latter gives norm 1; the former has norm ratios 1+t² → ∞.

2. **F02** (P1) Relative-character trace formula uses the wrong representation

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:816: “H_σ(v₁ ⊗ v̄₂) = tr σ(f)”.

   **Claim:** With f(s) = ⟨π(s)v₁,v₂⟩, the trace in σ equals the relative character defined at line 814.

   **Witness:** For SO(3) ⊃ SO(2), take a unit weight-one vector in spin 1 and σ(θ)=e^{iθ}. The defining integral is ∫e^{iθ}e^{−iθ}=1; tr σ(f)=∫e^{2iθ}=0 (probability Haar).

   **Exact repair:** Replace the bullet by: “On rank-one operators, H_σ(v₁ ⊗ v̄₂) = tr σ̄(f) = tr σ(f∘inv), where f(s)=⟨π(s)v₁,v₂⟩∈F_Ξ(H).” Both repaired traces equal 1 in the witness. Use the same contragredient in the proof of §4.6.

3. **F03** (P1) Relative characters are not H × H invariant

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:818: “H_σ is H × H-invariant”.

   **Claim:** The functional is invariant under independent left and right H actions.

   **Witness:** In R02's weight-one example, T is the rank-one projection and H_σ(T)=1. Left multiplication by π(θ) gives H_σ(π(θ)T)=e^{iθ}; at θ=π this is −1.

   **Exact repair:** Replace that bullet by: “H_σ is invariant under conjugation by H. On smoothing operators it factors through an H × H-equivariant map to Ψ^{−∞}(σ), followed by trace; trace is invariant under the diagonal conjugation action.” Conjugation fixes T in the witness and preserves value 1.

4. **F04** (P1) Localized symbol normalization includes the order weight twice

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:377: “a = Σ_ω ⟨ω⟩^m a_ω” and “(a_ω)_h^∨(x) = ⟨ω⟩^m …”.

   **Claim:** The normalized order-zero pieces still carry the order-m factor in their Fourier transform and moment bounds.

   **Witness:** Let m=−2, h=1, ω=R and a_ω(ξ)=φ((ξ−R)/⟨R⟩), φ≠0 fixed. Then ‖(a_ω)^∨‖₁=‖φ^∨‖₁>0, while line 380 bounds it by O(⟨R⟩⁻²)→0.

   **Exact repair:** Keep a=Σ⟨ω⟩^m a_ω and replace the displayed transform by “(a_ω)_h^∨(x)=e^{−ωx/h}Aⁿφ_ω^∨(Ax)”. Replace its moment bound by “∫|x|ʳ|(a_ω)_h^∨|≪A^{−r}”. State that the weighted summand ⟨ω⟩^m a_ω has the additional factor ⟨ω⟩^m. At r=0 the repaired bound is constant in R, as computed.

5. **F05** (P2) The Plancherel proof drops the positivity-producing square

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:775: “the positive operator Op_h(⟨ξ⟩^{−N})”.

   **Claim:** Quantizing this positive symbol with an arbitrary allowed cutoff gives a positive operator.

   **Witness:** nv21 line 5410 uses Op_h(b)². On ℝ, b=(1+ξ²)⁻ᴺ has positive inverse transform; an even cutoff concentrated where cos(tx)<0, with a sufficiently narrow plateau at zero, gives a negative scalar on e^{itx}.

   **Exact repair:** Replace the integral proof by: “Put b=⟨ξ⟩^{−N} and T_π=Op_h(b)*Op_h(b). This positive operator is π(f*∗f); compare it with a sufficiently negative power of Δ_h using §1.12, then apply Plancherel to f*∗f.” In the character example the resulting scalar is the absolute square of the former negative scalar and is nonnegative. The source explicitly takes this square.

6. **F06** (P2) The K-Casimir needs an invariant metric

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:759: “κ acts on each irreducible K-type τ by a scalar”.

   **Claim:** The sum of squares in the chosen basis is central without specifying an Ad(K)-invariant inner product.

   **Witness:** In the standard SO(3) representation, replace rotation basis (X₁,X₂,X₃) by (2X₁,X₂,X₃). Then 1−ΣX² is diag(3,6,6), so its Lth power is not scalar on this irreducible K-type.

   **Exact repair:** Start §4.1: “Choose an Ad(K)-invariant positive definite inner product on 𝔨, and let B(𝔨) be orthonormal for it.” With the unrescaled rotation basis the example gives 3ᴸI. Retain the arbitrary basis of the Nelson operator separately, using equivalence of Sobolev norms.

7. **F07** (P1) The approximate inverse has the wrong Sobolev exponent

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:736: “an approximate inverse of Δ_h^{N} from ⟨ξ⟩^{−N}”.

   **Claim:** An order −N symbol inverts an operator of order 2N.

   **Witness:** For G=ℝ, frequency t=1/h and N=2, Δ_hᴺ=4 and ⟨ht⟩⁻ᴺ=1/2. Their product is 2, not 1+O(h), as h→0.

   **Exact repair:** Replace “Δ_h^{N}” by “Δ_h^{N/2}” in this sentence. At the same frequency the product becomes 2·(1/2)=1; the subsequent trace bound already uses Δ_h^{−N/2}.

8. **F08** (P2) A statable part of the joint-fibre headline is omitted

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:938: “The unrestricted map … is surjective, including over unstable pairs”; Suggested.lean:188,209.

   **Claim:** The acceptance file covers the headline of §5.3, but its two fibre theorems both assume coprimality.

   **Witness:** In GL₂⊃GL₁ take y=0 and z=0. The joint fibre contains x=0, while gcd(X²,X)=X. Both the carrier and invariant-equality predicate already occur in Suggested.lean; the existing theorem cannot apply.

   **Exact repair:** Add two headline theorems asserting F.Nonempty for exactly the F defined in the orthogonal and unitary torsor statements, with the same field, dimension and skew-symmetry hypotheses but without hyz. Name them in README §5.3 and the module docstring. Keep the stronger torsor theorems. The new unitary theorem covers x=y=z=0.

9. **F09** (P2) The character gap repeats an earlier supplier's theorem

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:129: “What AutomorphicSpectralTheory must provide (gap:harish-chandra-characters)”.

   **Claim:** Trace-class convolution and the locally integrable Harish-Chandra character have no existing roadmap owner.

   **Witness:** TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:745–760, §2.3(a)–(b), already supplies both, for finite-length admissible real reductive representations, including the irreducible unitary case used here.

   **Exact repair:** Import trace-class convolution, character integration and analyticity on the strongly regular set from EndoscopicTransferAndUnitaryTraceComparison §2.3. Remove those clauses from gap:harish-chandra-characters in both README and design/plan.json; retain only a precisely stated extension to any additional regular semisimple points if that distinction is needed. The U(1) character e^{imθ} is already covered in the supplier's Check, with trace and density both e^{imθ}.

10. **F10** (P2) The local spinor gap requests already implemented cases

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:91: “all square classes when V is isotropic … positive class alone … definite”.

   **Claim:** These cases still need to be supplied.

   **Witness:** TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Isotropic.lean:56 proves isotropic surjectivity over any field with invertible 2. Spin/Real/SpinorNorm.lean:103,127,153 proves the positive definite, negative definite and indefinite real cases.

   **Exact repair:** Cite these pinned declarations and OrthogonalSpinGroups §2F for its existing ℚ_p cases. Restrict gap:local-spinor-images, identically in README and design/plan.json, to the remaining anisotropic cases over finite extensions of ℚ_p not covered by that supplier, including the binary norm subgroup. On the real hyperbolic plane the existing theorem gives both square classes; on a definite plane it gives just 1. Neither belongs in the gap.

11. **F11** (P1) Automorphic multiplicity is included twice

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:1464: “counted with multiplicity, L(Π, Σ) as in §9.1”; also line 1438.

   **Claim:** The sum counts each occurrence of Σ although §9.1 has already aggregated all copies into P_Σ and L(Π,Σ).

   **Witness:** Take two orthogonal copies with squared projection 1 onto each and local factors normalized to 1. Section 9.1 gives P_Σ=L=2. Counting this Σ twice gives 4, whereas Parseval gives 1+1=2.

   **Exact repair:** In §§9.2–9.5 sum once over each isomorphism class Σ when using the aggregate P_Σ and L of §9.1. Say explicitly that automorphic multiplicity is already included in those coefficients. The Weyl upper bound may still count constituents with multiplicity. The repaired sum in the witness is 2.

12. **F12** (P2) Fixing the auxiliary operator can leave the coefficient undefined

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:1406: “For the fixed Π and auxiliary T′ … define L(Π, Σ)”.

   **Claim:** This definition supplies L for every auxiliary weight allowed in §9.5.

   **Witness:** At a compact SO(2) auxiliary factor let σ′ have weight 1 and let trace-one T′ project onto weight 0. Then H_{σ′}(T′)=0 and P_Σ(T)=0 for every T, so 0=L·0 determines no L.

   **Exact repair:** Define the period functional first on operators T⊗S′ with S′ variable. For locally distinguished Σ, define L as its scalar multiple of the nonzero tensor product H_σ⊗H_{σ′}; set L=0 when this period functional vanishes. Only then specialize S′=T′. The witness now determines L using a weight-one projector, while the weight-zero specialization remains the valid equality 0=0.

13. **F13** (P3) Several stated Checks do not discriminate the asserted property

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:32,338,411,697,1491.

   **Claim:** The Gaussian detects the Fourier sign; nonzero Lie bracket forces C₁(a,b)≠0; only Schwartz a can give a mixed symbol; every dyadic orbit shell has mass comparable to Aᵈ; every fixed compact representation has empty scaled limit.

   **Witness:** An even Gaussian has identical forward/inverse transforms; C₁(a,a)=0; 1·1=1 is a symbol; a sphere has zero mass outside its radius; a U(1) character has d=0 and δ_{hm}→δ₀, mass 1.

   **Exact repair:** Replace the five Checks respectively by: (1) the shifted Gaussian b(η)=exp(−π(η−1)²), whose transforms at x=1/4 are −i exp(−π/16) and +i exp(−π/16); (2) Heisenberg coordinate symbols with C₁(ξ(X),ξ(Y))=ξ([X,Y])/2; (3) for a=1 on ℝ² and b(ξ₁)=exp(−ξ₁²) from a proper subspace, a transverse escape leaves ∂₁b nonzero, violating S⁰ decay; (4) the shell upper bound O(Aᵈ), which allows empty shells; (5) the empty compact limit when d>0, and the point limit of mass 1 for compact tori. These replacements give the displayed values on the separating examples.

14. **F14** (P3) The source version note incorrectly identifies theorem numbering

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/sources.toml:12: “arXiv v3 has the same section, lemma and equation numbering as the published version”.

   **Claim:** Either version can resolve the README's numbered theorem locators unchanged.

   **Witness:** The fetched arXiv v3 identifies itself on nv21 (arXiv) line 44; its §26 limit-state theorem is Theorem 19, while the published locator is Theorem 26.4. Many arXiv lemmas are unnumbered.

   **Exact repair:** Replace version_note by: “All numbered theorem and lemma locators and printed pages in this roadmap refer to the published Acta Mathematica version. arXiv:1805.07750v3 has different theorem/lemma numbering and must not be substituted without a locator map.” Resolve Theorem 26.4 against the published PDF.

15. **F15** (P2) Localization changes distance in the quotient to distance from a fibre

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:588,833: “distance at least h^δ … from the joint locus”.

   **Claim:** Ambient distance from the exact fibre supplies the invariant-coordinate lower bound required by the division proof.

   **Witness:** nv21 lines 2992–2994 instead require separation in invariant coordinates. For q(x)=x² and x=h^δ, distance from q⁻¹(0) is h^δ, but the invariant difference is h^{2δ}<h^δ. The stated proof's implication fails.

   **Exact repair:** Replace the separation hypothesis in §§2.7 and 4.6 by: “For every ξ in supp a, either dist([ξ],hλ_π)≥h^δ or dist([ξ|_𝔥],hλ_σ)≥h^δ, using the fixed quotient coordinates of §2.1.” Do not identify this with ambient distance. In the quadratic example the repaired hypothesis rejects x=h^δ and accepts x=h^{δ/2}; it now supplies exactly the divisor lower bound used by §2.6.

16. **F16** (P1) The p-adic Ξ-test-space extension has no coefficient-bound input

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:792,795: “converges absolutely, by §4.1”.

   **Claim:** Section 4.1 and gap:tempered-xi-bounds justify the statement over every characteristic-zero local field.

   **Witness:** Section 4.1 starts “F … archimedean”; the gap at line 131 specifies real groups. GanGrossPrasadUnitaryGroups/README.md:123 requests bounds with additional logarithmic powers, which do not imply integrability against the unweighted F_Ξ seminorm.

   **Exact repair:** Declare, in README and plan.json, a gap owned by AutomorphicSpectralTheory's local estimates extension: “For a reductive group over a nonarchimedean characteristic-zero local field, a special maximal compact K, tempered unitary π, and K-finite u,v, |⟨π(g)u,v⟩|≤Ξ_G(g)√(dim Ku·dim Kv)‖u‖‖v‖.” Cite it in §§4.3–4.4. At a fixed compact-open stage the resulting constant is finite, so ∫|f·coefficient|≤C∫|f|Ξ. A bound containing log^d alone would leave the extra factor uncontrolled.

17. **F17** (P1) Hilbert–Mumford is used without an owner

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:880: “By the Hilbert–Mumford criterion”.

   **Claim:** The inputs in §5.2 provide the equivalence between affine stability and the one-parameter-subgroup criterion.

   **Witness:** The listed inputs at line 882 supply Fourier quotients, Witt extension and matrix polynomial carriers, not Hilbert–Mumford. CountingBundlesAndHallAlgebrasOfCurves/README.md:103 also requests a GIT extension; it is not an implemented general criterion for this SO action.

   **Exact repair:** Declare gap:affine-hilbert-mumford, supplier AlgebraicModuliForArithmeticGeometry, section “reductive character GIT extension”, identically in README and plan.json: “For a reductive algebraic group over an algebraically closed field of characteristic zero acting linearly on a finite-dimensional vector space, an orbit is closed with finite stabilizer iff no nontrivial cocharacter has a limit on the point at zero.” Cite that contract in §5.2. For G_m acting with weights ±1, both coordinates nonzero give no such limit and trivial stabilizer; (1,0) has a limit and is unstable.

18. **F18** (P2) Sphericity alone does not prove moment-map surjectivity

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:942: “is spherical … so the moment map … surjects onto the invariant quotient”.

   **Claim:** Having an open Borel orbit is sufficient for this implication.

   **Witness:** For SL₂ acting on P¹, a Borel has an open orbit, but T*P¹ maps to the nilpotent cone: the invariant determinant is always 0, not every scalar. nv21 lines 3766–3773 use a simply transitive Borel orbit.

   **Exact repair:** Add the needed geometric target before §5.3: “For a GGP pair, H acts with an open orbit and trivial stabilizer on the flag variety of G×H; equivalently a Borel of G×H acts simply transitively on an open subset of (G×H)/diag H.” Cite NV21 Lemma 13.3. Explain that the cotangent moment map above such a point surjects onto 𝔟*, hence onto the invariant quotient by Chevalley restriction. Name these prerequisites in §5.3. The P¹ counterexample is excluded because its Borel stabilizer is positive dimensional. This roadmap owns the GGP-specific open-orbit theorem; the source citation alone was not a planned input.

19. **F19** (P1) Algebraic volume forms cannot be imported from real integration theory

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:973: “DifferentialGeometry Layer 5 (top forms and densities)”.

   **Claim:** This supplier provides the form and determinant-sequence infrastructure of §5.4 over arbitrary algebraically closed characteristic-zero k.

   **Witness:** TauCetiRoadmap/DifferentialGeometry/README.md:511–534 defines integration and densities on real smooth manifolds. The §5.4 example k=ℚ̄, Y=A², Z=A¹ needs algebraic cotangent sheaves and det(Ω¹), not those real carriers.

   **Exact repair:** Import algebraic gauge forms and their local measures from AdelicAlgebraicGroups §2.4, and determinant lines from AlgebraicVectorBundles. Declare gap:smooth-cotangent-determinant, supplier SchemeAndStackFoundations, section “smooth morphisms and differentials”: “For a smooth morphism f:Y→Z of smooth finite-type k-varieties, the exact sequence 0→f*Ω¹_Z→Ω¹_Y→Ω¹_{Y/Z}→0 induces the determinant-line isomorphism, compatible with base change and composition, with the stated factor-order sign.” Record the same contract in plan.json. Keep DifferentialGeometry for the real interface. In A²→A¹ this yields (dx∧dy)/dy=dx over ℚ̄ without a real topology.

20. **F20** (P2) The adelic quotient need not have a single lattice component

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:1272: “[G] … ≅ X at level K”.

   **Claim:** One Γ quotient accounts for every finite-level adelic component and its full Tamagawa volume.

   **Witness:** For anisotropic U(⟨1,−3⟩) over ℚ(i)/ℚ, take R={∞,2,3} and determinant level 1 modulo 13. The norm-one determinant torus has at least 12/4=3 level components, detected by (𝔽₁₃×)/(ℤ[i]×).

   **Exact repair:** Replace the single-component identification by “[G]/K is the finite disjoint union of Γ_j\(G×G′), indexed by G(F)\G(𝔸_f^R)/K; use the full union with its induced Tamagawa measure.” Define the representation realization and operator states on this full quotient, or explicitly sum the component formulas. In the witness three determinant classes survive; one lattice quotient omits the other two. Preserve total volume τ(G). The source explicitly assumes G(F)G_RK=G(𝔸) at nv21 line 6522; that assumption is absent here.

21. **F21** (P1) NilpotentOrbits N2 does not supply the regular-quotient differential

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:679: “NilpotentOrbits N2 (regular elements and the differential of the quotient)”.

   **Claim:** This section supplies submersivity of the adjoint quotient at every regular element.

   **Witness:** TauCetiRoadmap/NilpotentOrbits/README.md:159–184 supplies nilpotent triples and regular nilpotents; it imports the finite regular export from FormalConnectionsOpers F4.3. A regular semisimple diagonal matrix is outside that nilpotent statement.

   **Exact repair:** Cite FormalConnectionsOpers F4.3's principal slice, regular-orbit and differential theorem (README.md:599–617). Add the real-form adapter: complexification detects surjectivity of the real differential, with central affine factors retained. For sl₂, q(a,b,c)=a²+bc has differential (2a,c,b), nonzero at diag(1,−1); this regular semisimple point is now covered.

22. **F22** (P2) The Taylor estimate is stated for the phase instead of its exponential

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:363: “{x,y}ζ − Σ … (degree-j part)”.

   **Claim:** This is the remainder estimate for the coefficients used in §§1.2 and 1.5.

   **Witness:** nv21 lines 1783–1789 estimate Ω=exp({x,y}ζ). On the Heisenberg algebra the phase has just its degree-one term z; its J=2 remainder is 0, while Ω−1−z=e^z−1−z is nonzero.

   **Exact repair:** State (ii) for “Ω(x,y,ζ)−Σ_{j<J}Ω_j(x,y,ζ), where Ω=exp({x,y}ζ) and Ω_j collects monomials with |α|+|β|−|γ|=j”. Retain the ζ-derivative estimate and the corrected ρ calculation. At z=iε the repaired remainder is −ε²/2+O(ε³), matching O(ρ²), and includes the quadratic exponential term needed in the star product.

23. **F23** (P3) Additional boundary Checks omit their necessary conditions

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:450,915,1350,1363.

   **Claim:** Every displayed signed dyadic sum has growing Fourier L¹ norm; block conjugation permits arbitrary c; every Spin(p,q) mentioned is a simply connected semisimple cover; the full GL₃ Jordan centralizer has a>0.

   **Witness:** All-plus telescopes to two dilates, with bounded Fourier L¹ norm; c=0 makes the singular matrix inverse zero; Spin(1,1)≅G_m is a torus; −I centralizes the Jordan block but has a=−1.

   **Exact repair:**

   - At line 450 replace the unsupported growth claim by this uniformity Check: “For a direct sum of characters, inactive-cutoff quantization is diagonal with entries a(iht_j); its norm is sup_j |a(iht_j)|, independent of repetitions.” For the counterexample take an even bump ψ=1 near zero and φ(ξ)=ψ(ξ/2)−ψ(ξ): the all-plus dyadic sum is ψ(2^{−K−1}ξ)−ψ(ξ/2), whose Fourier L¹ norm is at most 2‖ψ∨‖₁ for every K.
   - At line 915 require c≠0, or take c∈k×. At c=0, a=d=1 and off-diagonal entries 0, the actual conjugation expression is 0 while the displayed answer is diag(1,1); the repaired Check excludes it.
   - At line 1350 require p+q≥3 for the assertion about the simply connected semisimple Spin cover. State separately that SO(1,1) and Spin(1,1) are split tori and the degree-two map is not a universal algebraically simply connected cover.
   - At line 1363 say “identity component of the centralizer” for a>0; the full centralizer has a≠0. Then −I lies in the full group and outside its identity component, as required.

24. **F24** (P3) The mixed-pair definition has fewer than three Checks

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/README.md:405,409–413: “for admissible pairs”.

   **Claim:** The definition of admissible mixed symbol pairs has the required discriminating Checks.

   **Witness:** Section 1.6 has exactly two Check bullets; its first is false as written (R13). Neither evaluates the case of two proper subalgebras whose sum is the whole algebra.

   **Exact repair:** After correcting R13, add: “For the two coordinate axes in the abelian algebra ℝ², take a(ξ₁)=exp(−ξ₁²) and b(ξ₂)=exp(−ξ₂²). Both orders are −∞ and the leading product exp(−ξ₁²−ξ₂²) is Schwartz on ℝ²; replacing either factor by 1 loses Schwartz decay along that axis.” At (R,0) the two products are exp(−R²) and 1, respectively. Keep this Check in README only.

25. **F25** (P3) The not-statable inventory omits Layer 4's headline theorems

   **Location:** packages/QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups/Suggested.lean:32–57: “Headline theorems that are not statable at the pins”.

   **Claim:** The inventory names the headline results omitted from the acceptance file.

   **Witness:** README §§4.2, 4.4 and 4.6 promise uniform Plancherel summability, extended Plancherel and relative Plancherel disintegration. None is named in that inventory, although Layer 4 appears explicitly in the summary.

   **Exact repair:** Add a module-docstring bullet: “Uniform Plancherel–Sobolev summability (§4.2), Plancherel for Ξ-integrable functions (§4.4), and relative Plancherel disintegration (§4.6) are not statable at the pins: they need the reductive tempered dual and its Plancherel measure, the Nelson Sobolev scale, Hilbert-space trace ideals and local relative characters.” Add no substitute theorem. On compact H the identity Σσ dim(σ)·tr(T|π[σ])/dim(σ)=tr(T) still checks the intended normalization; it does not supply the absent general carriers.

## Computed adversarial audit

All 1,509 README lines and all 222 Suggested.lean lines were read. The following are computations and negative controls, not substitutes for proofs of the general theorems. Sections not involving rings have no zero-ring or residue-characteristic instance; the algebraic theorems explicitly assume characteristic-zero fields, so zero rings, characteristic 2 and inseparable extensions do not satisfy their hypotheses. Finite groups below test normalizations of general harmonic-analysis constructions; they are not asserted to be connected reductive algebraic groups.

The signature comparison used the worker's supplied elaborated types for all 11 declarations. No Lean command or build was run. There are no section `variable` blocks in the file: the contexts below are explicit declaration binders. The sole local instance is `LieGroup.minSmoothnessThree`.

| Lean declaration; README section | Actual variable/instance context | Instances and computed values | Result / change |
|---|---|---|---|
| IsQuantizationCutoff, line 77; §0.5 | E real inner-product normed group; U:Set E; χ:E→ℝ; no finite dimension required | E=0,U=univ: χ=1 satisfies all six clauses; χ=0 fails near-zero equality 0=1; χ=2 fails 2≤1; U=∅ fails {0}⊆∅ | Definition determines the cutoff; no lost hypothesis |
| quantize, line 87; §0.5 | E finite-dimensional real inner-product Borel space; G group, T2, smooth LieGroup modeled on E; V complete complex Hilbert; π:ContRepresentation; arbitrary χ,b,v | E=0 gives χ(0)b(0)v; χ=0 gives 0; on ℝ with π_t and inactive cutoff the scalar is b(t/(2π)); zero V gives 0 | Real body; nonintegrable total-function behavior is explicitly disclaimed in README |
| exists_norm_quantize_le, line 103; §1.9 | Same E,G, plus Borel G and right-invariant Haar existence; 0≤δ<1/2; U, then χ, then C,N, then V:Type u, π unitary and strongly continuous, h,b,M,v | Zero symbol: 0≤CM‖v‖ with j=0 forcing M≥0; E=0,b=2,‖v‖=1: 2≤CM with M≥2; V=0: 0≤0; δ=1/2 excluded | Quantifier order makes C,N independent of π,h,b; substantial theorem, no one-tactic proof |
| IsZariskiClosedMatrixSet, line 122; §5.2 | k:Field; arbitrary index n; S:Set(Matrix n n k) | Zero ideal gives all matrices; unit ideal gives ∅; in one coordinate over ℂ, {0} is V(X), while ℂ\{0} is not closed | Native zero-locus predicate; not sorry'd data |
| ggpBlock, line 130; §5.2 | k:Field; ι:Type with DecidableEq; h:Matrix ι ι k; no finiteness required | ι=∅ yields [1]; h=[2] yields diag(2,1); h=0 yields diag(0,1), not the zero matrix | Fixes the distinguished line as promised |
| ggpSpectralPolynomial, line 137; §5.2 | k:Field; n finite, DecidableEq; arbitrary square matrix x | Size 0 gives 1; skew size 1 gives X/X=1; [[0,a],[-a,0]] gives X²+a²; skew size 3 gives (X(X²+s))/X=X²+s | Forced-root removal used only on skew matrices in theorems; no division-by-zero issue |
| InvariantlyEquivalent, line 146; §5.3 | k:Field; n finite, DecidableEq; A,Γ sets of matrices; x,y matrices | Γ={1}: coordinate polynomials force x=y; GL₂: nilpotent Jordan block and 0 both have charpoly X², so equivalent; SO₂: aJ and −aJ distinguished by entry polynomial when a≠0 | Predicate retains Pfaffian information absent from charpoly |
| isStable_iff_isCoprime_orthogonal, line 159; §5.2 | k algebraically closed characteristic-zero field; finite decidable ι; xᵀ=−x | ι=0: orbit/stabilizer singletons, gcd(1,1)=1; ι=1: SO₁ trivial, gcd(X²+a²,1)=1; ι=2: resultant vanishes exactly when b²+c²=0; x=0 has infinite SO₂ stabilizer and noncoprime X²,X² | Both directions survive low ranks; proof input R17 |
| isStable_iff_isCoprime_unitary, line 172; §5.2 | Same k,ι; arbitrary x; GL action uses actual inverse | ι=0: singleton fibre and gcd(X−a,1)=1; GL₂: q_x(a)=−bc; bc=1 gives closed hyperbola and stabilizer 1; b=1,c=0 gives nonclosed orbit and common root a; b=c=0 gives infinite stabilizer | Both directions tested; no truncation or star/conjugation mismatch |
| stableFibre_isTorsor_orthogonal, line 188; §5.3 | Same k,ι; y,z skew; coprime spectral polynomials | SO₂⊃SO₁: Pfaffian pins x=y and h=1; SO₃⊃SO₂: b²+c²=s≠0, writing u=b+ic gives u·v=s and unique torus multiplier u′/u; s=0 excluded | Kept theorem is sound on these controls; unrestricted existence missing, R08 |
| stableFibre_isTorsor_unitary, line 209; §5.3 | Same k,ι; y,z arbitrary; coprime charpolys | GL₁⊃GL₀: x=y, unique empty matrix; GL₂⊃GL₁: bc=p≠0, unique h=b′/b; y=z=0 gives p=0 and is excluded although x=0 exists | Kept theorem is substantial; missing unrestricted existence, R08 |

Representative README computations follow. These are finite-instance controls, not proofs of the general assertions. Source anchors refer to the recovered published nv21 extraction; R14 separately identifies the arXiv witness.

| Target | Instances and computed values on the two sides | Result / change | Source anchor |
|---|---|---|---|
| 0.1 Imaginary dual, Fourier, density | On [0,1] at η=1/2: positive transform 2i/π, negative transform −2i/π. Zero Lie algebra: both maps c↦c. SU₂: j(0)=1, j(π)=4/π². ax+b: j(−1)/j(1)=e | Correct signs and negative control; Gaussian Check R13 | nv21 line 898 |
| 0.3 Commutator classes | Trivial action on ℓ²: θ_u(I)=0 for positive-degree u, Δ=I, all orders contain I. Character t: θ_X(T)=itT−Tit=0. Composition scalar 2·3=6 | Context allows infinite multiplicities; R01 prevents false compactness inference | nv21 line 1072 |
| 1.2 BCH coefficients | Heisenberg [X,Y]=Z: C₁(ξ(X),ξ(Y))=ξ(Z)/2; C₁ reversed=−ξ(Z)/2, commutator=ξ(Z); abelian C_j=0 for j>0; rescaling gives hξ(Z)/2 | Sign, antisymmetry and h-degree controls hold | nv21 line 1151 |
| 1.4 Planck localization | δ=0 gives radius ⟨ω⟩/2 and Fourier scale ⟨ω⟩/h; δ=1 gives scale ⟨ω⟩; m=−2,h=1 normalized bump has Fourier L¹ norm independent of ω | R04, double order weight | nv21 lines 1869,1886,1927 |
| 1.6 Mixed calculus | Two coordinate axes, Gaussian symbols: product exp(−ξ₁²−ξ₂²) is Schwartz. Full-space a=1 and proper-space b=1 give symbol 1. δ₁=0,δ₂=.9 gives h^{.1J} | R13 and R24; add the two-proper-axis Gaussian as the third definition Check | nv21 lines 1759,1766 |
| 1.9 Uniform boundedness | Zero b gives 0; E=0,b=2 gives norm 2 and seminorm 2; δ=.49 gives positive Cotlar gain .02, δ=.5 excluded; coordinate projections have strong sum I and tail norm 1 | Correct strong/norm distinction and quantifier order | nv21 line 2270 |
| 2.2 Dual/conjugate parameters | π_t*: parameter −it; conjugate π_t: −it; conjugate dual: it; trivial t=0 is fixed by both | Both signs pass | nv21 line 2771 |
| 2.7 Joint localization | G=H=ℝ, t≠s: an equivariant trace factor has L=0; q(x)=x² gives fibre distance h^δ versus invariant distance h^{2δ} | R15 | nv21 line 2987 |
| 3.1 Multiorbits and scaling | Point orbit: mass 1 and d=0; SO₃ sphere radius r: mass 2r, radius tr mass 2tr, hence pushforward=t⁻¹ω_{tO}; empty multiorbit has mass 0 | Dilation and empty-case conventions pass | nv21 line 1510 |
| 3.9 Uniform trace-ideal estimates | Rank-one projector has trace and HS norms 1; N=2,ht=1 gives Δ_hᴺ·⟨ht⟩⁻ᴺ=2; replacing exponent by N/2 gives 1 | R07 | nv21 lines 3196,3212 |
| 4.1 K-type/coefficients | SO₃,l=1: dim=3, base Casimir+1=3, L=1 gives √3<3, L=2 gives 3; trivial type κ=1; rescaled basis gives diag(3ᴸ,6ᴸ,6ᴸ) | R06 | nv21 lines 5329,5346 |
| 4.2 Plancherel Sobolev | Finite S₃,U={1}, probability Haar: 1²+1²+2²=6=vol(U)⁻¹; Haar×c gives 6/c on both sides; arbitrary even cutoff may give negative unsquared Op(b) | R05; p-adic projection normalization passes | nv21 line 5393 |
| 4.5 Relative character | SO₃⊃SO₂, weight 1 projector: H=1, wrong trσ(f)=0; left rotation by π gives −1, conjugation gives 1. Compact dimσ=2 projector gives H=1/2 | R02–R03; compact normalization itself passes | nv21 lines 4615,4661 |
| 5.2 Disjoint spectra | GL₂: resultant at block a is −bc; bc≠0 stable, bc=0 unstable. SO₂⊃SO₁: removed-root polynomial 1 makes every skew 2×2 matrix stable. SO₃: condition b²+c²≠0 | Lean controls above; R17 | nv21 lines 3645,3659,3818 |
| 5.3 Torsors/surjectivity | GL₂ stable fibre bc=p≠0 has unique multiplier b′/b; SO₂ Pfaffian gives a single point, not {±a}; unstable y=z=0 still admits x=0 | R08, R18 | nv21 lines 3754,3763 |
| 5.4 Fibral forms | Projection (x,y)↦y: (dx∧dy)/dy=dx; base 2dy gives dx/2; identity map has zero-dimensional ratio 1 | Computations pass; algebraic supplier R19 | nv21 line 4122 |
| 6.3 Intermediate/large elements | δ′<1/2 makes h^{δ′}/√h=h^{δ′−1/2}→∞; weighted Ξ tail with exponent η gives ∫_{\|s\|>h^{-M}}ΞΞ≤C h^{Mη}; choose M≥N/η | Declared polynomial-tail gaps supply exactly the required power, not just logarithmic decay | nv21 lines 5146,5190 |
| 6.4 Relative expansion | Zero symbol: H=0=fibre integral; δ=0 leading error O(h); δ=.49 gives h^.02; δ=.5 excluded; compact weight decomposition agrees with H=trace on selected weight | Exponent and zero controls pass; prerequisites inherit R02/R15 | nv21 line 4781 |
| 7.7 Uniform distinction/central approximation | One compact distinguished point: choose P_σ with H=1; an effective involution z↦z⁻¹ has fixed set {±1}, Haar mass 0; identity involution fixes entire circle, mass 1 | Removing ineffective elements is necessary; both complementary intervals retained | nv21 lines 6392,6435,6461 |
| 8.4 Nilpotent rigidity | GL₃ Jordan J: centralizer span{I,J,J²}, dimension 3 and commutative; principal SL₂ in SL₃ contains J but not J², so does not contain the full centralizer; torus: centralizer=whole Lie algebra | Full-centralizer hypothesis discriminates proper subgroup | nv21 lines 7150,7291 |
| 8.7 Component comparison | Definite real SO: spinor image {1}; indefinite: {±1}; anisotropic binary p-adic norm subgroup has index 2; unitary line diag(u,1,…) has determinant u | Gaps partly duplicate pins, R10; sign/binary exceptions retained | nv21 lines 7042–7148 |
| 9.1 Period functional | Scaling vector by 2 multiplies squared projection by 4; two copies with mass 1 each give P=2; auxiliary wrong weight gives P=H(T′)=0 and undefined scalar | R11–R12 | nv21 lines 7335–7415 |
| 9.2 Parseval/count | Two orthogonal projections each norm 1: total 2, aggregate P=2 once; zero restriction gives 0; counting both copies in an upper bound gives count 2, compatible with single-class summation | R11 distinguishes count bound from aggregate spectral sum | nv21 lines 7364–7395 |
| 9.5 Weighted asymptotic | k=0 or k′=0: both sides 0; Haar_Hq×c gives L/c and affine measure/c, both sides scale c⁻¹; two equal copies with aggregate L=2 must contribute 2, not 4 | R11–R12 and R20 affect final statement | nv21 lines 7634,7681,7697,7826 |

The headline inventory is: uniform order-zero boundedness and the rescaled composition/star-product calculus (Layer 1); spectral localization (Layer 2); Rossmann's formula, orbit continuity, orbit traces and smoothing trace bounds (Layer 3); uniform and relative Plancherel theorems (Layer 4); disjoint-spectrum stability, joint-fibre surjectivity/torsors and volume/disintegration theorems (Layer 5); stable relative trace expansion (Layer 6); positive inverse branching and allowability (Layer 7); limit states, disintegration and equidistribution (Layer 8); truncated periods and the weighted asymptotic (Layer 9). The five actual Lean theorems are substantial acceptance statements. None follows by unfolding, a boundary computation, or one pinned library lemma. The six definitions support those theorems. R08 identifies a missing statable headline, and R25 identifies an omission from the explanatory inventory. The other analytic endpoints require the missing representation, orbit, operator or automorphic carriers described in the module docstring; no proxy theorem should replace them.

## Verified sound

Read 11 Lean declarations (6 real definitions, 5 admitted headline theorems), 75 numbered README targets and all 21 bold statement/convention labels. Inspected all 224 explicit Check bullets; the tables retain all 11 declaration rows and 24 sampled README rows, while the findings retain their refuting instances. These finite-instance checks are not proofs of the general assertions. The supplied elaborated signatures were compared with all 11 README counterparts: no lost section binder was found. The statements use characteristic-zero algebraically closed fields where required, preserve the trivial-star orthogonal convention, and keep strong continuity explicit.

Examined 75 primary target-to-source locator associations in the published nv21 text, plus both cited rallis-schiffmann theorem locators; representative anchors remain in the table. These counts do not certify every secondary citation: five works remain settled as uncertified below. The published nv21 PDF was legally available and its extraction was recovered; the original cached text stub was not treated as the source. The arXiv numbering is different (R14). No source text was copied into the report.

Checked the 20 cross-roadmap supplier-contract subsections and both pinned-library subsections. Nineteen cross-roadmap subsections could be resolved against accessible main/open-head files; the SmoothRepresentationsOfLocalGroupsPartII subsection could only be compared with its accepted design.

Object searches covered main active/completed roadmaps, board packages, supplied open heads and pinned libraries. Additional relevant owners located and read were EndoscopicTransferAndUnitaryTraceComparison §2.3, FormalConnectionsOpers F4.3, and AlgebraicVectorBundles' exterior/determinant constructions. No collision was found for the 11 fully qualified Lean names. The group-specific uniform calculus, GGP invariant theory and relative asymptotics are distinct from the generic imported operators, symplectic reduction and algebraic invariant-theory infrastructure. Ownership defects found are R09–R10, R16–R19 and R21; no additional duplication is inferred merely from related subject matter.

Pinned definitions specifically checked include ContRepresentation (Mathlib/RepresentationTheory/Continuous/Basic.lean:54), IsUnitary (TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean:52), mulInvariantExp and lieExp (TauCeti/Geometry/Lie/Exponential/Basic.lean:55,139), SchwartzMap.fourierTransformCLM (Mathlib/Analysis/Distribution/SchwartzSpace/Fourier.lean:51), the Riesz integral identity and Bochner norm bound, MvPolynomial.zeroLocus, and the trivial-star Matrix.specialOrthogonalGroup (Mathlib/LinearAlgebra/UnitaryGroup.lean:293–321). The trace files found at the pins implement finite-dimensional trace, not the Hilbert trace-class construction used by the omitted analytic headlines.

All 21 declared gap slugs occur both in design/plan.json and under README's exact supplier contracts, with named suppliers. No supplier is `none`. Declared absence itself is not reported as a defect. R09 and R10 concern redundant requested content; R16–R19 identify inputs not covered by the present contracts.

The required dependency check returned:

```text
CYCLE among: CStarAlgebras, HilbertModules, OperatorKTheory, OperatorTheory
CYCLE among: AlgebraicKTheory, GrothendieckEulerForms
CYCLE among: ModularCurves, SchemeAndStackFoundations
CYCLE among: HomotopySpheres, TangentialBordism
depcheck: 149 roadmaps, 1022 edges, 4 problem(s)
```

Exit status was 1. These are ambient graph cycles: no line names QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, and there is no UPWARD line for it. They are not package findings. Neither the merge order nor the checker was changed.

The read-only diff against origin/main contained 10 files, all within the package folder (2,397 insertions and 98 deletions). The checked head was c263049. Suggested.lean has one Mathlib import and two existing, used TauCeti imports, no `set_option`, no `lemma`, no sorry-valued data, no admitted examples and no padding. No Lean build, source-file edit, git write or external post was performed by this pass.

## Not verifiable

- rossmann78, main theorem and Lemma C: settled uncertified/paywalled source, cited by locator only. Its text was not requested again.
- kostant78, Theorem 6.7.2: settled uncertified/paywalled source; the nv21 use was inspected, not the primary proof.
- barbasch-vogan80, character asymptotics and wavefront/Gelfand–Kirillov statement: settled uncertified/paywalled source. The manifest's descriptive locator could not be checked against its text.
- rangarao72, main local-integrability theorem: settled uncertified/paywalled source. The nv21 reference is visible; the primary theorem was not read.
- kostant63, Theorem 5.3: settled uncertified/paywalled source. The nv21 application was inspected; the primary proof was not read.
- SmoothRepresentationsOfLocalGroupsPartII's final package/head: the accessible board record contains its accepted design, including SRU.0.6 and SRU.2.7, but no current package README was available through the supplied checkouts/index. The design supports the citation; final-head drift remains unverified.
- Fresh Lean elaboration was prohibited. The comparison uses the provided elaborated signatures, not a new build or a claim to have re-elaborated them.
- Ownership against open work without an accessible supplied head was not checked. No missing-citation verdict rests on such an unavailable copy. The explicit supplier gaps remain conditions on eventual implementation, not assertions that their theorems are already formalized.

No unresolved new source request remains: the published nv21 text and rallis-schiffmann were readable; the other five source statuses were settled by the operator.

## Source issues

- **Misprint** in nv21 at §2.5 and the proof of Proposition 8.7, pp. 28,62 (nv21 line 2303): the source says the unscaled operator composition equals a rescaled star product; it should be the rescaled operators on both inputs and the output; affects the proof.
- **Misprint** in nv21 at the estimate following Definition 4.3, p. 34 (nv21 line 1249): the source says the symbol weight has exponent m−α for a multi-index α; it should be m−∣α∣; affects a stated result.
- **Misprint** in nv21 at equation (6.1), p. 42 (nv21 line 1539): the source says the test function lives on the Lie algebra; it should be a test function on the imaginary dual containing the orbit; affects a stated result.
- **Misprint** in nv21 at §6.2 after Theorem 6.1, p. 43 (nv21 lines 1597–1598): the source says d is the maximal orbit dimension and regular orbits have dimension 2d; it should be half the maximal orbit dimension; affects a stated result.
- **Error** in nv21 at Lemma 7.6, equation (7.4), p. 49 (nv21 line 1796): the source says ζ-differentiation retains ρʲ after extracting (∣x∣∣y∣)^{∣δ∣}; it should be ρ^{j−∣δ∣} at that intermediate step, then the final O(ρʲ) bound; affects the proof.
- **Error** in nv21 at Lemma 7.8, p. 50 (nv21 lines 1847–1855): the source says a weighted fixed Laplacian preserves the exponential and transfers unchanged under integration by parts; it should be a phase-adapted first-order operator and its formal adjoint; affects the proof.
- **Error** in nv21 at equation (7.10), p. 51 (nv21 line 1881): the source says the localized Fourier moment is bounded by A^{−n} for arbitrary symbol order m; it should be bounded by ⟨ω⟩ᵐA^{−n}, or use normalized order-zero pieces; affects a stated result.
- **Gap** in nv21 at Lemma 7.11 and Proposition 8.7, pp. 51,61 (nv21 lines 1886,2272–2276): the source says the partition lemma assumes δ>0, then uses its construction for δ=0; it should be stated and verified also at δ=0; affects the proof.
- **Error** in nv21 at Lemma 7.14, p. 56 (nv21 lines 2088–2095): the source says the Fourier-cutoff expansion has coefficients (−h)ʲ; it should be hʲ under the paper's convention (∂a)∨=x a∨; affects a stated result.
- **Error** in nv21 at Lemma 8.1, equation (8.3), p. 57 (nv21 lines 2140–2141): the source says the rescaled differentiated Fourier bound has prefactor h^{−dim g}; it should be h^{−dim g−∣α∣}; affects a stated result.
- **Error** in nv21 at Lemma 8.10, p. 62 (nv21 lines 2298–2299): the source says Cotlar row bounds imply operator-norm convergence of the infinite sum; it should be strong convergence with the same norm bound, as coordinate projections show; affects a stated result.
- **Error** in nv21 at §8.7, p. 63 (nv21 line 2338): the source says quantization of ⟨ξ⟩^{2N} equals Δᴺ for every N; it should be the PBW preimage of Δᴺ, allowing lower-order noncommutative corrections; affects the proof.
- **Error** in nv21 at §8.8.6, p. 69 (nv21 line 2569): the source says right division by p=z^{s+2k} uses coefficients b⋆ᵣq; it should be q₀=b/p and qⱼ=−p⁻¹Σ_{r=1}^j Cᵣ(q_{j−r},p); affects the proof.
- **Misprint** in nv21 at Lemma 10.1, p. 79 (nv21 line 2927): the source says the second inverse coefficient contains a positive C₁(q,b₁) contribution; it should be b₂=−(C₂(q,b₀)+C₁(q,b₁))/q; affects the proof.
- **Misprint** in nv21 at equations (10.11)–(10.14), pp. 81–82 (nv21 lines 3006,3017): the source says the ambient-group invariant coordinate is centered at λ_σ; it should be centered at λ_π, leaving λ_σ for the subgroup coordinate; affects the proof.
- **Error** in nv21 at equation (18.6), p. 122 (nv21 line 4661): the source says the rank-one relative character is tr σ(f) with the displayed coefficient f; it should be tr σ̄(f), equivalently tr σ(f∘inv); affects the proof.
- **Error** in nv21 at Lemma 19.5, equations (19.21)–(19.22), pp. 130–131 (nv21 lines 5039–5064): the source says the narrow auxiliary symbol has unit mass and omits the orbit-trace prefactor; it should be mass h^{dim S} together with h^{−d_M}; these cancel since d_M=dim S; affects the proof.
- **Misprint** in nv21 at Appendix A, p. 136 (nv21 line 5310): the source says the integrand defining π(f) contains π(f) itself; it should be π(g)f(g); affects a stated result.
- **Error** in nv21 at Appendix A.1, p. 136 (nv21 lines 5320–5325): the source says a positive multiple of the K-Casimir has positive invertible spectrum and sufficient summability; it should be a sufficiently high power of one plus the positive K-Casimir; affects the proof.
- **Misprint** in nv21 at the proof of Lemma A.3, p. 139 (nv21 line 5411): the source says Op(⟨ξ⟩^{−N})² is trace-comparable to Δ^{−2N}; it should be comparable at order −2N to Δ^{−N}; affects the proof.
- **Error** in nv21 at the example after Lemma 24.10, p. 166 (nv21 lines 6468–6474): the source says the displayed polynomial obeys the required approximation bounds; it should be replaced by a polynomial approximating a cutoff on both complementary intervals; affects nothing.
- **Misprint** in nv21 at Lemma 26.3, p. 176 (nv21 line 6837): the source says the k-input operator-state map is linear on the product space; it should be k-multilinear; affects a stated result.
- **Misprint** in nv21 at Theorem 26.5, equation (26.7), p. 178 (nv21 line 6922): the source says the map from an orbit to probability measures is linear; it should be weakly continuous and equivariant, with linearity belonging to its extension on test functions; affects a stated result.
- **Gap** in nv21 at the proof of Lemma 27.3, p. 182 (nv21 lines 7120–7124): the source says the local spinor images used for the orthogonal component comparison are surjective; it should be qualified by definite real and anisotropic binary norm images, with the resulting component-character obstruction handled; affects the proof.
- **Misprint** in nv21 at the proof of Lemma 27.10, p. 185 (nv21 line 7262): the source says s≤g after the complementary dimension argument; it should be g≤s; affects the proof.
- **Misprint** in nv21 at §29.3, p. 191 (nv21 line 7526): the source says the first Cauchy–Schwarz square factor is tr(T₁*T₂); it should be tr(T₁*T₁); affects the proof.
- **Error** in rallis-schiffmann at the proof of Theorem 17.1, p. 83 (rallis-schiffmann lines 3391–3393): the source says a nonzero skew-adjoint commuting endomorphism exists on every nonzero orthogonal complement; it should be qualified because a one-dimensional orthogonal complement has zero special-orthogonal Lie algebra; affects the proof; corrected in print at nv21 Lemma 14.8 and Remark 14.9, footnote 5, p. 100.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c2630494e03998a5e411f83a818aec26cb78e30a", "job": "RT-QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
