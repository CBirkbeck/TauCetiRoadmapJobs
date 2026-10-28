<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2153#issuecomment-6440738962 -->
Red team round 1 pass a (codex) of 84e8f65

Verdict: needs_changes

1. **F01** (P1) Local duality drops strict henselianity

   **Location:** `packages/PurityForFlatCohomology/README.md:672`, “local duality: for bounded constructible K”.

   **Claim:** For every excellent regular local R, supported cohomology is dual to the geometric closed-point stalk of the indicated internal dual.

   **Witness:** R = 𝔽₂, ℓ = 3, K = ℤ/3, i = 1: H¹(R,K) = ℤ/3, whereas H⁻¹(RHom(K,ℤ/3)) at a geometric point is 0. CS24 line 1364 first assumes strictly henselian R.

   **Exact repair:** “(c) If R is strictly henselian, for a bounded constructible complex K of ℤ/ℓ-modules, Hᶦ_𝔪(R,K) is dual to the geometric closed-point stalk of H⁻ᶦ(Rℋom(K,μ_ℓ^{⊗d}[2d])).” Add the finite-field calculation as a negative-control Check. The offending finite field is excluded; over its separable closure both degree-one sides are 0. Keep (b) at its stated generality.

2. **F02** (P1) The animated support triangle discards the animation

   **Location:** `packages/PurityForFlatCohomology/README.md:992`, “RΓ(Spec(π_0 A) ∖ Z, G)”.

   **Claim:** The third term of the support triangle is ordinary cohomology of the classical open subscheme of Spec π₀(A).

   **Witness:** A = k ⊕ k[1], G = 𝔾_a, Z = ∅: the displayed fibre is fib(A → k) = k[1], with H⁻¹ = k; empty-support cohomology is 0. CS24 lines 2291–2296 retain the animated open U_A.

   **Exact repair:** “Put U = Spec π₀(A) ∖ Z. Define RΓ(U_A,G) as the derived limit of RΓ(A′,G) over animated fppf A-algebras A′ whose classical spectra map into U. The support triangle is RΓ_Z(A,G) → RΓ(A,G) → RΓ(U_A,G).” For Z = ∅ this becomes fib(A → A) = 0; for discrete A it recovers §0.2.

3. **F03** (P1) The torsor action isomorphism has the wrong source

   **Location:** `packages/PurityForFlatCohomology/README.md:1632`, “Hom(𝒪_G ⊗ 𝒪_Y, 𝒪_Y) ≅ Hom(𝒪_Y, 𝒪_Y)”.

   **Claim:** The action identifies the displayed two Hom modules, supplying Auslander's endomorphism criterion.

   **Witness:** For the trivial torsor Y = G = (ℤ/2)_k, their k-dimensions are 8 and 4. CS24 lines 3689–3700 use Hom(𝒪_G,𝒪_Y), whose dimension is 4.

   **Exact repair:** “The torsor coaction a : 𝒪_Y → 𝒪_G ⊗ 𝒪_Y induces Hom(𝒪_G,𝒪_Y) ≅ Hom(𝒪_Y,𝒪_Y), sending f to multiplication composed with (f ⊗ id) ∘ a. Since 𝒪_G is free of rank r over the local base, its source is 𝒪_Y^{⊕r}.” Add the trivial rank-two torsor Check: both corrected sides have rank 4; the deleted tensor factor would give rank 8.

4. **F04** (P1) The parafactoriality induction uses injectivity in the wrong direction

   **Location:** `packages/PurityForFlatCohomology/README.md:1697`, “give injectivity of Pic(U_{R′}) → Pic(U_R) and, by induction … parafactoriality”.

   **Claim:** Vanishing of Pic(U_{R′}) and this injection imply vanishing of Pic(U_R).

   **Witness:** The injection 0 → ℤ has zero source and nonzero target. SGA2 lines 3830–3852 use XI Lemma 3.17's isomorphism, including its additional depth and parafactoriality conditions; XI Lemma 3.16 gives only the inadequate injection.

   **Exact repair:** “Establish the hypersurface Picard isomorphism of SGA 2 XI Lemma 3.17 for X = U_{R′}, Y = U_R: R′ is complete along (f), the closed-point depth conditions (a), (c) hold, depth(R′/f) ≥ 4, and local rings at closed points of X outside Y are parafactorial. Build its Lef/Leff, infinitesimal lifting and algebraization inputs here, with the cited SGA 2 X §2 and XI §§1–3 locators. Induction supplies the outside-Y condition and Pic(U_{R′}) = 0; the isomorphism gives Pic(U_R) = 0.” Correct the source's XI 3.17(e) to ‘outside Y’. For a four-dimensional hypersurface this gives 0 ≅ 0; an injection 0 → ℤ no longer discharges the target.


5. **F05** (P1) The coherent-extension supplier does not supply coherent pushforward

   **Location:** `packages/PurityForFlatCohomology/README.md:228`, “coherent_extension (coherence of j_*F across closed subsets of depth ≥ 2)”; used at line 1630.

   **Claim:** SchemeAndStackFoundations §0.4 supplies coherence of the open pushforward of a coherent sheaf under a depth condition on the base.

   **Witness:** On X = Spec k[x,y], remove the origin and take F supported on the punctured y-axis. Then Γ(X,j_*F) = k[y,y⁻¹], not finite over k[x,y], although depth at the origin is 2.

   **Exact repair:** “SchemeAndStackFoundations §0.4 coherent_extension supplies an unspecified coherent extension. Its §0.6 reflexive_extension_of_depth supplies coherent reflexive j_*F for coherent reflexive F when the complement has local depth at least two.” In §7.3 cite §0.6 reflexive_extension_of_depth and explicitly use that the torsor algebra is finite locally free, hence reflexive, on the open. The supplier statements are at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:616` and `:715`. The counterexample F is not reflexive and is excluded by the corrected contract.

6. **F06** (P3) The Artin–Schreier Check confuses a sheaf cokernel with a sectionwise cokernel

   **Location:** `packages/PurityForFlatCohomology/README.md:877`, “the étale ℰxt¹ is A/(φ − 1)A”.

   **Claim:** The étale extension sheaf evaluated at Spec A is the sectionwise Artin–Schreier quotient.

   **Witness:** For A = 𝔽_p, A/(φ−1)A = 𝔽_p. The étale cokernel sheaf is 0: every Artin–Schreier equation acquires a root étale-locally. CS24 lines 1519–1533 explicitly sheafify the extension presheaf.

   **Exact repair:** “For G = ℤ/p over Spec A, G(A) = ker(φ−1 : A → A), and H¹_fppf(A,ℤ/p) = A/(φ−1)A; the étale sheafification of this quotient presheaf, hence the displayed ℰxt¹, is zero. For A = 𝔽_p the presheaf value is 𝔽_p but its sheafification is zero; for A = 𝔽̄_p both are zero.”

7. **F07** (P3) The valuation-ring Check omits the nonzerodivisor condition

   **Location:** `packages/PurityForFlatCohomology/README.md:1349`, “(𝕄(μ_p)[1/[a^♭]])^{V=1} = μ_p(K)”.

   **Claim:** The localized fixed points equal the points over all fraction-field factors for every a allowed by §5.7.

   **Witness:** Take one factor A = 𝒪_C with characteristic-zero fraction field C, and a = 0. The left side is 0 because its localization is the zero module; μ_p(C) ≅ ℤ/p is nonzero.

   **Exact repair:** “For G = μ_p and a a nonzerodivisor, (𝕄(μ_p)[1/[a^♭]])^{V=1} ≅ μ_p(K) = ∏ᵢ μ_p(K_i). If a = 0, the fixed-point module and G(A[1/a]) are both zero.” The two cases now give ℤ/p ≅ ℤ/p and 0 ≅ 0 respectively.

8. **F08** (P2) A claimed missing pinned grading already exists

   **Location:** `packages/PurityForFlatCohomology/Suggested.lean:40`, “there is no grading on the quotient of a polynomial ring by a homogeneous ideal”.

   **Claim:** The global complete-intersection Picard theorem cannot be stated because its quotient grading and Proj carrier are unavailable.

   **Witness:** `TauCeti/RingTheory/GradedAlgebra/Homogeneous/Quotient.lean:88` defines `TauCeti.GradedAlgebra.gradedAlgebraQuotientPiece`; its degree-i submodule is the image of the original degree-i piece. It applies to homogeneous polynomial ideals, including the zero ideal.

   **Exact repair:** Replace this exclusion by: “The homogeneous quotient grading is supplied by TauCeti.GradedAlgebra.gradedAlgebraQuotientPiece. The full distinguished-generator statement of §7.9 still needs the twisting line bundle 𝒪_X(1) on this Proj and its class in LineBundleClass, which are not supplied at the pins.” Add the existing grading to the pinned supplier contract. For I = 0 and for I = (x₀x₃−x₁x₂), the carrier obstruction asserted by the old sentence disappears; the distinguished twisting-class obstruction remains.

9. **F09** (P2) Three deep, statable results are missing from the acceptance test

   **Location:** `packages/PurityForFlatCohomology/README.md:1306`, `:1603`, `:1642`: Katz descent, Auslander freeness, and regular-local factoriality. `Suggested.lean:16` begins its exclusion list without any of these results.

   **Claim:** The file contains the headline theorems statable at the pins, and identifies those that are not statable.

   **Witness:** All three use native carriers: `Module.IsReflexive` (`Mathlib/LinearAlgebra/Dual/Defs.lean:212`), `IsRegularLocalRing` (`Mathlib/RingTheory/RegularLocalRing/Defs.lean:51`), finite modules, semilinear maps, bases, `frobenius`, `Module.Free`, and `UniqueFactorizationMonoid`. No corresponding theorem was found at the pins.

   **Exact repair:** Add these headline signatures in Layers 5 and 7, with mathematical docstrings, and list the three names in the README. The fixed-basis formulation is equivalent to Katz's scalar-extension isomorphism: a fixed linear combination has all coefficients in the prime field.

   ```lean
   universe v

   theorem frobenius_fixed_basis (p : ℕ) [Fact p.Prime]
       (K : Type u) [Field K] [CharP K p] [IsAlgClosed K]
       (M : Type v) [AddCommGroup M] [Module K M] [FiniteDimensional K M]
       (F : M →ₛₗ[frobenius K p] M) (hF : Function.Bijective F) :
       ∃ b : Basis (Fin (Module.finrank K M)) K M, ∀ i, F (b i) = b i := by
     sorry

   theorem auslander_free (R : Type u) (M : Type v) [CommRing R]
       [IsRegularLocalRing R] [AddCommGroup M] [Module R M]
       [Module.Finite R M] [Module.IsReflexive R M]
       (r : ℕ) (h : Nonempty ((M →ₗ[R] M) ≃ₗ[R] (Fin r → M))) :
       Module.Free R M := by
     sorry

   theorem regularLocal_factorial (R : Type u) [CommRing R]
       [IsRegularLocalRing R] : UniqueFactorizationMonoid R := by
     sorry
   ```

   For Katz, rank zero gives the empty basis; in rank one F=cφ has a fixed basis vector λ with λ^(p−1)=c⁻¹, including p=2. For M = Rⁿ and r = n, both sides of the equivalence have rank n² and M is free; M = 0 also satisfies the conclusion. A field and a DVR satisfy the factorial conclusion; k⟦x,y,z⟧/(xz−y²) is excluded by regularity. No executable elaboration was run in this read-only pass; these use the inspected native signatures.

10. **F10** (P2) The degree-one torsion proof invokes parafactoriality in dimension three

   **Location:** `packages/PurityForFlatCohomology/README.md:1903`, “(b) injectivity from (a)”.

   **Claim:** Part (a), which assumes geometric parafactoriality, supplies injectivity in both cases of (b).

   **Witness:** R = ℂ⟦x,y,z,w⟧/(xy−zw) has dimension 3 and Pic(U_R) = ℤ, so (b)'s degree-one hypotheses hold but (a)'s do not. CS24 line 3859 instead uses Hartogs for degree one.

   **Exact repair:** “In (b), degree-one injectivity follows from §0.5(b), applied to the affine torsor of trivializations: a torsor trivial on X∖Z is trivial on X. For degree two, use (a), whose hypotheses follow from §7.6 or regularity.” For the three-dimensional node the corrected degree-one argument applies because depth R = 3; it does not assert the false vanishing Pic(U_R) = 0.

11. **F11** (P3) A singular plane cubic refutes the Picard Check

   **Location:** `packages/PurityForFlatCohomology/README.md:1768`, “A plane cubic curve over k̄ has infinite … tors”.

   **Claim:** Every plane cubic over an algebraically closed field has infinite torsion in Pic(X)/ℤ[𝒪(1)].

   **Witness:** The cuspidal cubic y²z = x³ over ℂ has Pic⁰(X) ≅ (ℂ,+), with no nonzero torsion. Since deg 𝒪(1) = 3, the quotient's torsion is ℤ/3, not infinite.

   **Exact repair:** “A smooth plane cubic over an algebraically closed field has infinite (Pic(X)/ℤ[𝒪(1)])_tors; the dimension hypothesis cannot be reduced to one. For the cuspidal cubic over ℂ the torsion subgroup is instead ℤ/3.” CS24 lines 3758–3763 use an elliptic curve, which includes smoothness. The repaired positive Check has infinitely many prime-to-characteristic torsion points; the cusp is a negative control.

12. **F12** (P3) The product-module negative Check allows zero factors

   **Location:** `packages/PurityForFlatCohomology/README.md:1287`, “for infinite I and M = ⊕ᵢ Rᵢ … is not surjective”.

   **Claim:** An infinite index set alone makes the direct-sum-to-product map nonsurjective.

   **Witness:** Take I = ℕ and Rᵢ = 0 for all i. The map is 0 → 0, hence surjective. With only R₀ = 𝔽₂ nonzero it is the identity of 𝔽₂.

   **Exact repair:** “Take I = ℕ and Rᵢ = 𝔽₂ for every i. Then M = ⊕ᵢ 𝔽₂ → ∏ᵢ 𝔽₂ misses the vector (1,1,…), showing why finite presentation is needed.” The repaired witness has genuinely infinite support.

13. **F13** (P3) The pro-fppf definition has only two discriminating Checks

   **Location:** `packages/PurityForFlatCohomology/README.md:916`, “A pro-fppf cover is an fpqc cover”.

   **Claim:** This third Check supplies independent coverage of the site's definition.

   **Witness:** It repeats the API bullet at line 907 and also holds for the wrong topology consisting of all fpqc covers. Only the preceding two Checks distinguish examples.

   **Exact repair:** Replace the third Check by: “The singleton family Spec 0 → Spec ℤ is pro-ppf but not a pro-fppf cover: its image is empty and ℤ → 0 is not faithfully flat. The identity Spec ℤ → Spec ℤ is a cover, including over the zero ring.” Together with the two retained Checks, this tests faithful coverage, perfection, and nontrivial local solvability.

14. **F14** (P2) The algebraization signature leaves its removed locus unbound

   **Location:** `packages/PurityForFlatCohomology/README.md:741`, “dim A − dim V(𝔞) > d + 2 in Stacks Situation 0EHC”.

   **Claim:** Part (b) is a quantified theorem about the already defined punctured spectrum U, but 𝔞 has never been bound or related to U.

   **Witness:** For A = k⟦x₁,x₂,x₃,x₄⟧ and d = 1, 𝔞 = 𝔪 gives 4−0 > 3; 𝔞 = 0 gives 4−4 ≤ 3. STACKS line 2258 of Algebraization fixes U using 𝔞.

   **Exact repair:** “Set X = Spec A, Z = {𝔪} = V(𝔞) with 𝔞 = 𝔪, and U = X∖Z. Assume I ⊂ 𝔪. In (a), closures of associated points are taken in X. In (b) the dimension inequality is dim A > d+2.” Retain the remaining hypotheses. The four-dimensional example now unambiguously reads 4 > 3; the three-dimensional example reads 3 ≯ 3. Alternatively state the general 0EHC setup with I ⊂ 𝔞 and redefine U = Spec A∖V(𝔞) throughout.

15. **F15** (P3) The ordinary Čech terms are not perfectoid

   **Location:** `packages/PurityForFlatCohomology/README.md:1082`, “the Čech nerve … from perfectoid terms”.

   **Claim:** The ordinary Čech nerve of ℤ_p → B = ℤ_p[p^{1/p^∞}]^∧ has perfectoid terms.

   **Witness:** In B⊗_{ℤ_p}B, the sums Σ_{i≤n}pⁱb_i⊗b_i, b_i=p^{1/pⁱ}, are p-adic Cauchy. Their coefficient matrix has infinite-rank limit; an algebraic tensor has finite-rank matrix. Thus this term is not p-adically complete.

   **Exact repair:** “For G = μ_p, take the termwise derived p-adic completion of the Čech nerve of ℤ_p → ℤ_p[p^{1/p^∞}]^∧. Its terms are perfectoid, and the supported descent statement computes RΓ_(p)(ℤ_p,μ_p), as in §6.2.” The partial sums above have a limit in the completed tensor product. For verification of the witness, use the compatible integral bases of ℤ_p[p^{1/pⁿ}]: distinct fractional valuations give continuous coefficient projections λ_i:B→ℤ_p with λ_i(b_j)=δ_ij. Applying λ_i⊗λ_j gives the diagonal matrix diag(p,p²,…). Every finite sum of pure tensors gives a finite-rank matrix over ℚ_p.

16. **F16** (P3) The pinned cohomology API's input and output universes are interchanged

   **Location:** `packages/PurityForFlatCohomology/README.md:187` and `Suggested.lean:23`, “takes values in abelian groups of the universe of the site's morphisms”.

   **Claim:** The codomain universe of cohomologyPresheaf is fixed to the site's morphism universe.

   **Witness:** `Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:78` takes F : Sheaf J AddCommGrpCat.{v}, but returns Cᵒᵖ ⥤ AddCommGrpCat.{w′}; v and w′ are separate universe parameters. The coefficient universe, not the output universe, is constrained.

   **Exact repair:** In both places write: “cohomologyPresheaf requires its input sheaf to take values in AddCommGrpCat.{v}, where v is the site's morphism universe, together with HasSheafify at that coefficient universe. Its output takes values in AddCommGrpCat.{w′}, the Ext universe.” This matches the pinned signature both when w′=v and when w′>v; the intended sheafification obstruction remains an input-side obstruction.

17. **F17** (P2) The exclusion list omits several named deep theorems

   **Location:** `packages/PurityForFlatCohomology/Suggested.lean:16`, “The following headline theorems are not statable”; compare README lines 9–10 and Layers 2–3.

   **Claim:** The module identifies the nonstatable headline theorems and their missing carriers.

   **Witness:** The README summary explicitly promises the crystalline key formula, animated deformation theory, p-adic continuity and excision. The exclusion bullets name none of these; they name the distinct perfectoid key formula and arc descent.

   **Exact repair:** Add: “The crystalline key formula over perfect schemes (§2.4) lacks the crystalline Dieudonné sheaf, the pro-fppf site and supported-cohomology comparison. The animated deformation triangle (§3.3), p-adic continuity (§3.4), excision (§3.5) and descent modulo p (§3.6) lack animated group points and their fppf cohomology.” These are exclusions only, with no substitute theorem. The missing-carrier explanation distinguishes discrete Fp's Artin–Schreier complex from the animated Fp⊕Fp[1] calculation, whose μ_p cohomology gains a nonzero H⁰.

## Verified sound

Coverage: all 2,404 README lines and all 157 Suggested.lean lines were read. The completed audit covered **9 Lean declarations** (5 definitions/structures and 4 theorems), **77 numbered targets**, **57 separate API targets**, **9 conventions**, **5 bold worked examples**, and **247 individual Checks** with computed witnesses. Selected computations are retained below. All 247 Check identifiers were reconciled against the README; none is missing. Failed computations are identified above rather than counted as sound mathematics. The source audit resolved **95 explicit locators across 21 readable works**: **89 were text-verifiable**, while **6 have extraction limitations** listed below. **16 supplier-contract groups** were checked against their current files; five declared gaps were checked separately.

The four existing Lean theorems retain the README's hypotheses and generality. All nine supplied elaborated signatures were compared with their declaration bodies and README contexts; none lost a section binder. No new elaboration or Lean build was run. No existing declaration satisfies the padding probe: the four admitted theorems are deep, and the five real definitions are used by them. There is one Mathlib import and one used, existing Tau Ceti import; no sorry'd data, `set_option`, `lemma`, admitted example, placeholder proposition, or conclusion hidden inside a hypothesis was found.

The mathematical probes include zero rings/modules/groups, empty supports/covers, ranks 0 and 1, fields and DVRs, p=2 and p=3, mixed and equal characteristic, nilpotent and animated square-zero thickenings, non-CI and nonregular rings, disconnected bases, constant and nonétale groups, a nonabelian S₃ torsor, inseparable root towers, negative virtual dimension, and both directions of the stated equivalences. Residue signs were tested at order 3, where negation is visible. Inapplicable probes such as q=1 induction normalizations or polynomial-degree junk introduce no object in this package.

The pins match the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Native definitions inspected include regular local rings, weak regular sequences, ideal generator counts, adic completion, finite étale pullback, sheaf cohomology, reflexivity, finite-flat affine groups, Cartier duality, and line-bundle classes. The quotient grading discrepancy is R08; the cohomology-universe discrepancy is R16.

The headline audit found four stated results: Zariski–Nagata full faithfulness/connectedness and equivalence (§1.8), and local Picard torsionfreeness and vanishing (§§7.6–7.7). The absent statable results are R09. The remaining headlines are étale-depth bounds and finite-flat purity; crystalline/prismatic key formulas; perfectoid purity and arc descent; animated deformation, continuity, excision and descent; torsor/gerbe purity; global complete-intersection Picard theory; Brauer purity and residue descriptions; and multiplicative-type/torus purity. Their missing-carrier explanations are present except as identified in R08 and R17.

### Supplier and ownership audit

`roadmaps grep` was used by object, in addition to direct reads of main, the board packages and the supplied sibling checkouts. Searches included supported fppf cohomology, animated flat cohomology, virtual dimension, parafactoriality, finite-flat Dieudonné theory, regular-local factoriality, Brauer purity and residues. An exact-namespace search found no duplicate of this package's nine fully qualified declaration names in the indexed main/open roadmaps. Ownership assigned here is the extension beyond existing local punctured spectra, field-based multiplicative type, and existing topological/derived/site foundations; the preceding supplier objects remain imported. Previously settled downstream duplication and gap-schema findings in `packages/PurityForFlatCohomology/reports/FIX-PKG-PurityForFlatCohomology~2.md` were not re-raised.

| Supplier contract group | Current section/target evidence and result |
|---|---|
| SchemeAndStackFoundations | §§0.4,0.6,0.9,0.12–0.14,0.17,0.24,1.15,1.18,2.1–2.3,2.7,2.9–2.11,2.15,2.22,3.4,4.7–4.8 found. Coherent extension versus coherent pushforward is R05 (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:616`, `:715`). |
| LocalPurity | §§1.1,1.3,2.1–2.2 contain the local carrier, completion comparison, regular-local purity and global extension targets cited here. The semilocal extension remains this package's contribution. |
| ModularCurves | Layer 4D supplies strict henselization/completion and preservation of dimension/regularity, beginning near `TauCetiRoadmap/ModularCurves/README.md:1130`. |
| EtaleCohomologyFoundations | F.0.2 finite étale Galois category and F.5 duality found (`README.md:200`, `:1179` in that roadmap). F.5 is not being silently used as duality for arbitrary excellent regular local rings; that extension is §1.4 here. |
| LefschetzPencilsAndVanishingCycles | §0.10's absolute purity target is at `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:851`: regular pairs, invertible coefficients, twist −c and shift −2c. |
| PurityOfBranchLocus | §0.3 supplies Auslander–Buchsbaum, regular localization and maximal-CM freeness. It does not supply the extra endomorphism criterion; §7.2 correctly owns its proof. |
| DerivedDeRhamCohomology | Current §§0.19,0.21,1.10 contain `cohenFactorization`, `absoluteCompleteIntersection`, and `ordinaryFlatnessFromCompleteFlatness`. The three stronger CI facts are declared gaps, not falsely claimed existing declarations. |
| DerivedModuleAlgebra | §§0.K.1,0.4,0.25,1.5,1.7 contain the stated Koszul, cotangent, derived-completion and complete-flatness inputs. Bounded torsion is retained where classical completion is used. |
| EnhancedDerivedSheaves | E5:animation.1–4 supplies the animated carriers and their module/deformation foundations, beginning at `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1896`. |
| PerfectoidSpaces | P1.16–P1.18, P1.24–P1.25, P3.7, P4.15.2, P4.15.4, P7.16a, P7.17 match the Fontaine/prism, integral perfectoid, André-cover and regular-tower inputs. |
| PerfectoidQuotients | Current §§0.1,0.2,0.6 contain the completed tensor/root quotient, `integralPerfectoid_pi_iff`, and completed étale-henselization targets. These names were checked at the current head, not inferred from the citation resolver. |
| PerfectoidQuotientsPartII | Accepted board design supplies Q5.2,Q5.4,Q6.3–Q6.7,Q7.1,Q7.3,Q10.1 (`packages/PerfectoidQuotientsPartII/design/README.md:109`, `:249`, `:765`). The citation resolver's absence from main/open-roadmap folders is not an absent supplier. |
| PrismaticCohomology | Current §2.0 contains `FormalArc.PerfectoidBasis`, `FormalArc.coverByValuations`, arc descent, completion comparison and valuation-basis inputs. |
| PrismaticCohomologyPartII | Layer 4 is the named owner of the declared perfectoid prismatic Dieudonné contract. Its present absence is accepted conditionally. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | R07.1.40,R07.1.41,R07.2.8 provide local Raynaud embedding, bounded-torsion p-complete faithfully flat descent, and contravariant Dieudonné theory over perfect fields. Cartier duality accounts for the covariance here. |
| ArithmeticGaloisDuality | R02.2.4 supplies the complete-field Witt/residue exact sequence. Only its kernel/exactness is imported; Convention 8 fixes this package's sign. Arithmetic Frobenius 1/3 versus geometric Frobenius 2/3 distinguishes them. |

All five gap slugs occur in both `packages/PurityForFlatCohomology/design/plan.json` and the README's supplier contracts: `prismatic-dieudonne-perfectoid`, `complete-intersection-presentations`, `flat-local-complete-intersection`, `ci-defect-additivity`, `regular-tower-tilt`. Each names an earlier supplier and a section. The Dieudonné equivalence and its normalizations form one classification interface; the remaining gaps specify distinct CI or tilt consequences. No pinned implementation or already-stated earlier target supplying those full contracts was found. Acceptance of their future implementations is conditional, not a finding.

The initial required dependency check returned:

```text
depcheck: 56 roadmaps, 654 edges, 0 problem(s)
```

The final repeat inspected a larger graph and returned the following output, with exit status 1:

```text
CYCLE among: CStarAlgebras, HilbertModules, OperatorKTheory, OperatorTheory
CYCLE among: AlgebraicKTheory, GrothendieckEulerForms
CYCLE among: ModularCurves, SchemeAndStackFoundations
CYCLE among: HomotopySpheres, TangentialBordism
depcheck: 149 roadmaps, 1022 edges, 4 problem(s)
```

No UPWARD line was reported and none of the four cyclic components contains PurityForFlatCohomology. They consist entirely of existing external roadmaps, including the upstream ModularCurves/SchemeAndStackFoundations pair. These are wider-graph failures, not cycles created by this package; the final whole-graph gate did not pass. No tool or merge-order file was changed. The read-only PR diffstat contains only `packages/PurityForFlatCohomology/`; no scope violation was found. The README contains no pull-request numbers or process instructions, and no computational algorithm is planned.

### Source-locator audit

Counts below count the listed theorem/section/tag identifiers, not every repeated citation. Additional proof passages supporting the findings and errata were also read. All references below are paraphrases or locators, not copied passages.

| Source | Count | Locators resolved; extraction evidence |
|---|---:|---|
| CS24 | 19 | 3.2.4 (line 1381), 3.3.1 (1418), 4.1.8 (1567), 4.2.10 (1778), 5.2.8 (2356), 5.3.5 (2444), 5.4.4 (2816), 5.5.1 (2849), 6.1.1 (3430), 6.1.2 (3459), 6.2.3 (3491), 6.2.4 (3540), 6.2.7 (3566), 7.1.2 (3630), 7.1.3 (3664), 7.2.1 (3707), 7.2.5 (3765), 7.2.8 (3828), 7.2.9 (3871). The regular-field error is already corrected by the package. |
| C19 | 14 | Theorems 1.1–1.4,5.3,6.1,6.2; Lemma 2.1; Propositions 2.2–2.3; Corollary 2.4; Remarks 6.3–6.4; Appendix A. Anchors: C19 lines 111,130,147,172,464,493,520,537,551,566. |
| SGA2 | 11 | XIV 5.2–5.6 (SGA2 lines 7393–7488); X 3.4 (3390); XI 3.1,3.2,3.6,3.13 (3604,3610,3636,3754); XII 3.7 (4319). XI 3.12–3.17's proof inputs were additionally read for R04. |
| SGA1 | 2 | V 6.9–6.10, SGA1 lines 4650–4680; direction from fully faithful finite-cover functor to surjection on fundamental groups agrees. |
| BC22 | 1 | Lemma 2.3.2, BC22 line 1126; supported local-to-global spectral sequence. |
| ILO14 | 4 | XV 1.2.4 (ILO14 line 10362), XVI 3.1.1 (11520), XVII 0.2 = arXiv 0.9 (12220), XVIII-A 2.2 (16269). Version-number change is recorded, not drift. |
| ALB23 | 1 | Published Theorem 5.4 = arXiv Theorem 5.1.4, ALB23 line 3145; contravariant classification becomes covariant after Cartier duality. |
| BS22 | 3 | Theorem 7.14, Remark 8.9, Proposition 8.10; BS22 lines 2391,2610,2619. |
| EGA44 | 6 | 21.13.6,21.13.7,21.13.8,21.13.9,21.13.10,21.13.12.1; EGA44 lines 12966,13005,13007,13020,13115,13184. |
| Gro66 | 5 | Lemmas 1.1,1.6,1.9, Proposition 1.4, Corollary 1.8; Gro66 lines 101,150,166,129,161. Locator and prose verified; several displays are absent, so these five are conservatively partial. |
| Poo17 | 4 | Proposition 6.8.1, Warning 6.8.2, Theorem 6.8.3, Warning 6.8.4; Poo17 lines 8091–8156. Imperfect-residue p-primary exception preserved. |
| Kat73 | 1 | Proposition 4.1.1 and its field-case argument; Kat73 lines 2304–2345. |
| CTS87 | 4 | §0.5, Definition 1.2, Theorem 2.2(ii), Lemma 2.4; CTS87 lines 295,378,505,605. The last has a missing displayed formula; its use is corroborated by C19 line 548. |
| dJ02 | 1 | Theorem 1.1, dJ02 lines 8–15; quasi-compact separated scheme with an ample line bundle, equality with torsion H². |
| Ces15 | 1 | Lemma B.14, Ces15 lines 1330–1339. |
| Lau13 | 1 | Corollary 6.5, Lau13 lines 1304–1320. |
| Beg80 | 1 | Proposition 2.2.1, Beg80 lines 724–792; smooth resolution of finite-flat coefficients. |
| Koh72 | 1 | Theorem A, Koh72 line 28; three-generator construction used for depth/virtual-dimension separation. |
| EGA2 | 2 | Definition 4.5.3 and Proposition 7.1.7, EGA2 lines 3207,5519. |
| EGA42 | 2 | Theorem 5.10.5 and Corollary 6.1.2, EGA42 lines 4597,5471. |
| STACKS | 11 | 07DV (Algebra line 7566), 07C3 (14640), 052U (12231); 0913 (More on Algebra line 3484); 09Q1,09Q7 (Divided Power Algebra lines 941,1042); 0DX9 (Local Cohomology line 224); 0DXR,0EHC,0EJP (Algebraization lines 1678,2258,3399); 023M (Descent line 305). Missing chapters were fetched through the legal sources service, reusing the STACKS key. |

### Lean declaration computations

All nine elaborated signatures supplied with the job were compared with the actual declaration bodies and README. There is no section-variable block: every required instance is an explicit binder. `u` is arbitrary; `CohenPresentation R : Type (u+1)` stores its ring in `Type u`. No erased hypothesis was detected. The four existing theorems are deep results, not padding. The five definitions have real bodies and are needed by those theorems.

| Declaration; section; variable/instance context | Instances tried | Computed values on the two sides | Result/change |
|---|---|---|---|
| `puncturedSpectrum`; §0.1; R : Type u, CommRing R | Field; DVR; k×k; zero ring; ℤ outside intended use | Field: V(J)=Spec, complement ∅; DVR: V(J)={m}, complement Spec K; product: two closed points removed, ∅; zero: Spec=∅, dimension ⊥; ℤ: J=0 and complement ∅ despite nonmaximal prime (0) | Body agrees with stated semilocal use; general-ring junk is explicitly unused |
| `CohenPresentation`; §1.1; CommRing R, IsLocalRing R | k; k⟦x⟧; node; non-Noetherian rank-one valuation ring m=m² | k→k has kernel0, source dimension0; k⟦x,y⟧→k⟦x⟧ has kernel(y), dimensions2→1; node identity has nonregular source and is rejected; valuation completion=k, presentation k→k | Real data, surjectivity included, regularity cannot disappear |
| `IsCompleteIntersection`; §1.1; same context | Field; node; k⟦x,y⟧/(x,y)²; nondiscrete valuation ring | Empty sequence gives true for field; (xy) gives true; three relations of height2 give false; valuation completion gives true outside Noetherian use | No false Noetherian consequence; weak regularity plus proper kernel excludes a unit relation |
| `virtualDimension`; §1.1; same context | k; k⟦x⟧ in two presentations; square-zero quotient; valuation ring | 0−0=0; 1−0=2−1=1; 2−3=−1 versus dimension0; valuation completion gives0; empty presentation set would give sInf∅=0 | Integer subtraction is correct; no natural-number truncation |
| `finiteEtalePullback`; §1.8; X,Y : Scheme.{u}, f : Y→X | Identity; empty Y; degree-two finite étale cover | id* returns original cover; empty pullback sends both id and transposition to the unique map; degree-two cover retains rank 2 under nonempty field extension | Native pullback body, no sorry or unbound instances |
| `zariskiNagata_full_faithful_connected`; §1.8; local Noetherian R, 2≤vdim | Regular surface; nodal curve; field | Surface vdim 2: U connected and restrictions of morphisms unique; node vdim 1: U has two components; field vdim0: U empty and two cover endomorphisms collapse | Boundary cases failing conclusions are excluded |
| `zariskiNagata_isEquivalence`; §1.8; local Noetherian R, 3≤vdim | Three-dimensional node; complex A₁ surface; field | Node vdim 3: finite étale extension equivalence; A₁ vdim 2: nontrivial double cover on U versus no such cover on strictly local Spec R; field0 fails threshold | Threshold3 agrees with README |
| `localPicard_torsion_eq_one`; §7.7; local Noetherian CI, 3≤dim, x∈LineBundleClass(U), finite order x | Three-dimensional node; elliptic cone surface; x=1 | Node Pic=ℤ, finite order means x=0 additively (=1 multiplicatively); elliptic cone dim 2 has nonzero torsion and is excluded; identity has order1 and conclusion1=1 | No missing instance; multiplicative notation correct |
| `localPicard_subsingleton`; §§7.6–7.7; local Noetherian R, (CI∧dim≥4)∨regular | Field; DVR; four-dimensional CI; three-dimensional node | Field Pic(∅)=0; DVR Pic(K)=0; CI dimension4 Pic(U)=0; node dimension3 Pic(U)=ℤ and fails both disjuncts | Correct disjunction, no extraneous dimension condition on regular case |

### Sampled adversarial computations

The following sample retains calculations from every layer and the covariance and residue conventions. The exhaustive per-target, API and individual-Check ledgers are omitted. Here k is a field; C denotes an algebraically closed complete extension of ℚ_p where its valuation ring occurs. Zero cohomology means the trivial abelian group.

| Statement and context | Instances tried | Computed values on each side | Result/change |
|---|---|---|---|
| §0.2 supported fppf cohomology and its comparisons | Empty/full support; DVR Gm; k[t] Ga | fib(id)=0; fib(C→0)=C; H⁰_m(Gm)=0, H¹_m(Gm)=ℤ; H¹_(t)(Ga)=k[t,t⁻¹]/k[t], with t⁻¹ nonzero | Support direction and connecting degree correct |
| §1.1 Cohen presentations, CI and virtual dimension | k⟦x₁,…,x_n⟧ n0,1,2; node; square-zero ring; non-Noetherian valuation | vdim=n; node2−1=1=dim; square-zero2−3=−1<0; valuation completion k gives CI=true and vdim0 outside declared use | All three definitions have positive and negative controls |
| §1.4(a) affine Lefschetz; (b) dualizing complex; (c) local duality | Strictly local field/trait; finite field 𝔽₂ with ℓ3 | Field H>0=0; trait generic H¹(μ₃)=ℤ/3, supported H²=ℤ/3; non-strict field H¹(ℤ/3)=ℤ/3 versus dual stalk degree−1=0 | (a),(b) supported by sources; (c) R01 |
| §1.8(a) full faithfulness/connectivity; (b) equivalence; π₁ clauses | vdim 1 node, vdim 2 A₁, vdim 3 node | U(node curve) disconnected; A₁ surface π₁(U)=ℤ/2 whereas π₁(Spec R)=1; node3 finite étale categories equivalent | Surjection of π₁ at2, isomorphism at3; four Lean headlines covered above |
| §2.1 crystalline covariant classification | ℤ/pⁿ, μ_pⁿ, α_p, n1,2, p2,3 | Constant (F,V)=(pφ,φ⁻¹); multiplicative (φ,pφ⁻¹); at n1 multiplicative V0; α_p both0; FV=VF=p | Cartier dual swaps constant/multiplicative; no odd-prime restriction |
| §2.2 low Hom/Ext sheaves | A=𝔽_p and 𝔽̄_p, G=ℤ/p; μ_p | Fixed points 𝔽_p; pointwise AS quotients 𝔽_p and0; étale cokernel sheaf0 in both; μ_p V−1=−1 so kernel/cokernel0 | Main sheaf statement sound; Check R06 |
| §3.2 animated cohomology, Postnikov, topology comparison, support triangle | Discrete k; k⊕k[1]; μ_n; empty Z | Discrete recovers classical; Ga(A) has H⁻¹=k; empty-support claimed fib(A→k)=k[1]≠0; correct fib(A→A)=0 | R02; use animated open |
| §3.6 fpqc and modulo-p hyperdescent | Identity cover; completion; perfectoid root cover | Identity totalization=C; completion mod p map𝔽_p≅𝔽_p, H²_supportμ_p=ℤ/p both; root-cover descent restores same ℤ/p | Ordinary Čech terms need completion before being called perfectoid: R15 |
| §4.4 positive-characteristic CI purity | μ_p and α_p on k⟦x,y⟧; non-CI socle ring | CI dim 2: H⁰,H¹_support=0; non-CI vdim 1 has xy≠0 in H⁰α_p | Perfect residue/complete hypotheses match this intermediate theorem |
| §5.4 product-module comparison | M=R; M=R/J; infinite sum; zero factors | R=∏R_i; quotient=∏R_i/J_i; over all 𝔽₂ misses all-ones vector; all-zero factors give0→0 surjective | Theorem correct; negative Check R12 |
| §5.6 Katz fixed vectors | Rank0; rank 1 F=φ or cφ; 𝔽₃(t)^perf | 0⊗K=0; fixed space𝔽_p givesK; cφ fixed generator has x^(p−1)=c⁻¹; nonclosed case would need valuation−1/2∉ℤ[1/3] | Both controls work; the fixed-basis headline is statable but absent: R09 |
| §5.7 products of valuations and comparison | 𝒪_C,a=p; a0; characteristic p; infinite factors | H>0(C,G)=0 and points unchanged; a0 left0 versus μ_p(C)=ℤ/p; charp μ_p(K_i)=0; ultrafilters add components beyond I | Theorem and contraction argument sound; Check R07 |
| §6.4 explicit nonétale counterexample | R=𝔽_p⟦x,y,z,t⟧/(x²,y²,xz−yt), p2,3 | xy≠0; xxy=yxy=0; zxy=y²t=0; txy=x²z=0; (xy)^p=0; dim 2, vdim 1, depth 0 | Positive element supplies H⁰_supportα_p≠0 |
| §6.5 regular-local purity through degree dim | DVR, field, regular surface; inverse-Frobenius monomial | DVR H⁰,H¹_supportμ_p=0 but H²=ℤ/p; field H⁰(ℤ/n)=ℤ/n; surface bound≤2; x^(−1) goes to x^(−1/p), strictly less negative | Nonfield exclusion correct; contraction has correct direction |
| §7.3 torsors and gerbes, nonabelian allowed | Trivial ℤ/2 and S₃ torsors; α_p surface; singular A₁ | Wrong Hom ranks8≠4 and216≠36; corrected ranks4=4 and36=36; α_p torsors extend; A₁ double cover does not | R03 source, R05 coherence supplier |
| §7.5 parafactoriality and geometric version | Field/DVR; regular surface; A₁; node3 | Field/DVR Pic0 but Γ(U)≠R, hence not parafactorial; surface Γ=R and Pic0; A₁ Pic=ℤ/2; node3 Pic=ℤ | Definition detects full category equivalence rather than only isomorphism classes |
| §7.6 CI dimension≥4 parafactoriality | Four-dimensional hypersurface; node3; hypothetical injection0→ℤ | Pic0 for dimension4; Picℤ in dimension3; injection0→ℤ does not force target0 | Theorem correct; proof route R04 |
| §8.18 divisor-removal counterexample | (x,y)_n on Gm², n1,2,3; swapped generators | n1 class0; n3 residueχ_y of order 3 on x=0; swap gives−χ_y≠χ_y; n2 signs coincide | Relation uv=ζvu and chosen crossed-product sign agree |
| Convention6: two-term normalization | W₂(Fp)=Z/p²; constant and μ_p² | Constant F=p,V=id; multiplicative F=id,V=p; both FV=VF=p, but ker(V−1) is Z/p² versus0 | Excludes swapping covariant and contravariant conventions, including p2 |
| Convention8: residue | Unramified cubic crossed product, u³=π; inverse | Residues1/3 and−1/3=2/3 on arithmetic Frobenius | Same sign used in §§8.14–8.18 |
| Worked example1: three-dimensional node | k[[x,y,z,w]]/(xy−zw) | dim=vdim=3, Hⁱ_support=0 for i<3, Pic(U)=Z with torsion0 but nonzero | All four conclusions agree with §§1.8,6.2,7.5,7.7 |

## Not verifiable

- The final dependency gate exits 1 on the four external cyclic components reproduced above. This package has no reported upward edge and belongs to none of those components; the wider repository graph is not certified acyclic.

- The following **11 settled uncertified works** were not available as legal readable texts: DF84 Remark 3; Avr77 Proposition 3.6; Aus62 Theorem 1.3; Gro68 Brauer III 2.1 and 6.1(b); MB85 Lemme 2; Bou78 IV Lemme 5.1 and V Corollaire 4.9; Gab04b Conjectures 2–3; BH Definition 2.3.1; SGA3 IX 1.1,2.11 and X 4.5; SGA4 V 6.4, VII 5.7–5.9 and XVIII 3.1.8; SGA5 I 1.12 and (4.2.2). Their citations remain settled; no new request was made. Where CS24 or C19 explicitly invokes the result, that invocation was verified, without claiming to certify the inaccessible original proof.
- **Six partially legible locators:** Gro66's five §1 locators and CTS87 Lemma 2.4 have missing mathematical displays in the supplied extraction. Surrounding hypotheses and proof prose were read; C19 independently states the needed consequences. Full displayed-formula verification is not claimed for these six.
- The operator-supplied elaborated signatures were used for all nine declarations. The read-only prohibition on Lean execution takes precedence over the generic instruction to create and elaborate a new `#check` file. Proposed repair signatures were inspected against native types, not executed.
- The five declared supplier gaps remain future contracts. This pass verifies their names, locations, precision and dependency direction, not their eventual proofs. Downstream ownership moves already settled in the preceding repair report still require downstream workers to implement them.
- Ownership searches covered main, completed roadmaps, the board packages, supplied sibling checkouts and the service's indexed results. Open heads not supplied by the brief were not independently fetched or manually audited. A negative search is not certification of every unprovided open head.

## Source issues

- **Error** in CS24 at Theorem 7.1.2, printed page 87 (CS24 line 3630): the source says regular local dimension at least d−1 suffices, admitting fields at d=1; it should be regular dimension at least max(d−1,1); affects a stated result.
- **Misprint** in CS24 at proof of Theorem 3.3.1(b), printed page 35 (CS24 line 1453): the source says the virtual dimension bound applies to R_d; it should be the bound for R; affects the proof.
- **Misprint** in CS24 at proof of Theorem 6.2.7, printed page 85 (CS24 line 3578): the source says the last parameter is x_n; it should be x_d, matching the presentation's d parameters; affects the proof.
- **Misprint** in CS24 at proof of Theorem 7.2.1, printed page 89 (CS24 line 3726): the source says the Kummer argument ranges over n≥0; it should be n≥1; affects the proof.
- **Misprint** in CS24 at proof of Theorem 7.2.5, printed page 90 (CS24 line 3774): the source says the Kummer argument ranges over n≥0; it should be n≥1; affects the proof.
- **Gap** in CS24 at Lemma 4.1.12, printed page 40, and proof of Theorem 6.2.7, printed page 85 (CS24 lines 1637,3576): the source says n<dim R in the lemma but later uses n=dim R; it should be the same descent lemma for arbitrary integer n, as its proof establishes; affects the proof.
- **Gap** in C19 at proof of Proposition 2.2, printed page 4 (C19 lines 140–146): the source says triviality of the neutral fibre proves injectivity for possibly noncommutative G; it should be supplemented by a twisting argument controlling every fibre, or restricted to commutative G; affects the proof.
- **Misprint** in SGA2 at Exposé XIV Proposition 5.2, printed page 199 (SGA2 lines 7422,7424): the source says the quotient term is J/I although J⊂I; it should be I/J; affects the proof.
- **Misprint** in SGA2 at Exposé XI Lemma 3.17(e), printed page 107 (SGA2 line 3833): the source says the extra parafactoriality assumption concerns closed points in Y; it should be closed points outside Y, as the subsequent invocation of Proposition 3.12 requires; affects a stated result.
- **Misprint** in SGA2 at proof of Exposé XI Lemma 3.17, printed page 107 (SGA2 line 3837): the source says H¹ vanishes for i=1 or2; it should be Hⁱ vanishes for i=1 or2; affects the proof.
- **Misprint** in SGA2 at proof of Exposé XI Theorem 3.13(i), printed page 106 (SGA2 lines 3791,3793): the source says resolve L′ by free O_X-modules and restrict to X′; it should be resolve over X′ and restrict to X; affects the proof.
- **Misprint** in SGA2 at proof of Exposé XI Lemma 3.16, printed page 106 (SGA2 line 3820): the source says depth A equals 3+1; it should be depth A equals depth B+1, which is at least4; affects the proof.
- **Misprint** in SGA2 at Exposé XI Corollary 3.10(ii)(a), printed page 104 (SGA2 line 3721): the source says O_X,p is factorial while quantifying over y; it should be O_X,y; affects nothing.
- **Misprint** in BC22 at proof of Lemma 2.3.2, printed page 27 (BC22 line 1134): the source says the supported cohomology functors are left derived functors; it should be right derived functors, computed using injectives; affects the proof.
- **Misprint** in EGA44 at proof of Proposition 21.13.10, printed page 319 (EGA44 line 13120): the source says injectivity of O_X→j_*O_U is equivalent to the depth-two condition; it should be bijectivity; affects the proof.
- **Misprint** in ILO14 at proof of Exposé XVIII-A Lemma 2.2, printed page 333 (ILO14 line 16277): the source says supports of codimension at least p disappear above codim(Y); it should be above dim(X), with only empty support remaining; affects the proof.
- **Error** in EGA2 at the sentence following Definition 4.5.3, printed page 84 (EGA2 line 3210): the source says restriction to every open preserves ampleness although its definition requires quasi-compactness; it should be restriction to every quasi-compact open, or a definition without that requirement; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "84e8f65c9884a2bd7c5440ed8a4a55913dece76f", "job": "RT-PurityForFlatCohomology~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
