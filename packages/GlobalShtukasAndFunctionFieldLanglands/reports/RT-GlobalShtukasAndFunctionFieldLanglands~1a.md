<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/146#issuecomment-6326329671 -->
Red team round 1 pass a (codex) of 1515191

Verdict: needs_changes

1. **F01** (P1) Split Satake formula asserted for nonsplit groups

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:693`, “identifies the spherical E-Hecke algebra with E ⊗_Z K₀(Rep Ĝ)”.
   - Claim: This formula holds at every hyperspecial good place under the standing connected-reductive hypotheses.
   - Witness: For the norm-one torus of an unramified quadratic local extension, T(K)=T(O_K), so its spherical Hecke algebra is E. Its dual is G_m, whose representation ring gives E[z,z⁻¹].
   - Exact repair text: “For split G, the spherical Hecke algebra is E ⊗_Z K₀(Rep Ĝ), with the following basis and trace normalization. For unramified nonsplit G, use the algebra of regular functions on the semisimple twisted-conjugacy quotient of Ĝ⋊Frob_v; coefficient representations and traces carry the Frobenius action from §GS.1.13. For an unramified torus T, use the group algebra of X_*(T)^{Frob_v}. The norm-one unramified quadratic torus has spherical Hecke algebra E.” Apply the same distinction to §GS.3.6 and every later use of h_{V,v}.

2. **F02** (P1) Hecke correspondence proof depends on its own later consequence

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:996`, “Use the creation–Frobenius–annihilation formula to extend spherical operators across their support.”
   - Claim: The proof of §GS.2.11 uses §GS.3.6.
   - Witness: §GS.3.6 needs §GS.3.1 (line 1177); §GS.3.1 needs §GS.2.11 (line 1054). Thus the proof dependencies contain GS.2.11 → GS.3.6 → GS.3.1 → GS.2.11.
   - Exact repair text: Replace the last sentence of the §GS.2.11 proof by “At a place in the support of the Hecke function, construct this action on the locus where all legs avoid that place.” Replace its extension assertion by “Extension across that place is a subsequent theorem of §GS.3.6.” Keep the extension and its proof solely in §GS.3.6.

3. **F03** (P2) The companion slope bound loses its finite-determinant hypothesis

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:1815`, “More generally an algebraic p-plain irreducible sheaf … For a reciprocal Frobenius root α … ≤(r−1)²/r”.
   - Claim: The displayed uncentered slope bound follows the extension to arbitrary algebraic p-plain sheaves without restricting it back to finite determinant.
   - Witness: The constant rank-one sheaf with geometric Frobenius q is algebraic and p-plain and has companions. Its normalized p-adic slope is 1, whereas the displayed rank-one bound is 0.
   - Exact repair text: “For the finite-determinant sheaf, the normalized slopes satisfy |v_λ(α)/v_λ(q^{deg x})| ≤ (r−1)²/r. For a general algebraic p-plain sheaf this bound applies after the finite-determinant constant twist; undoing that twist translates all slopes by the twist's normalized valuation.” Add the constant Frobenius-q rank-one sheaf as a negative-control Check.

4. **F04** (P3) The stated library pins are different from the supplied pins

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:47`, the two commit hashes under “From Mathlib”.
   - Claim: The inspected pins are Mathlib 082e2d37… and Tau Ceti f7904748… .
   - Witness: `lake-manifest.json:8` pins Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; line 18 pins Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a.
   - Exact repair text: “Mathlib at `6b7abb3c7686292736be2955bd3eb9ebf63b456a` (with Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`):”. Recheck the supplier list against these versions; do not change either library pin.

5. **F05** (P2) Two admitted excursion milestones already exist in Mathlib

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean:201`, `excursionAlgebra_commute`, and line 207, `excursionAlgebra_finiteDimensional`.
   - Claim: Commutativity and finite dimensionality of the generated subalgebra are new theorem targets.
   - Witness: `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean:757` has `Algebra.isMulCommutative_adjoin`; `Mathlib/LinearAlgebra/FiniteDimensional/Basic.lean:634` has `FiniteDimensional.finiteDimensional_subalgebra`.
   - Exact repair text: Delete these two admitted declarations. Replace their README target listing with “Use Mathlib `Algebra.isMulCommutative_adjoin` for the commuting generating family and `FiniteDimensional.finiteDimensional_subalgebra` for the image algebra.” Keep the geometric realization and character-space decomposition as the roadmap's targets.

6. **F06** (P2) Picard-stack infrastructure is planned again instead of imported

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:426`, “Bun_{G_m} is the Picard stack: a G_m-gerbe over the Picard scheme”.
   - Claim: §GS.0.15 constructs the stack-level Picard description for the later horocycle calculation.
   - Witness: `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4940` already owns `picardStack`, `aut_eq_units`, `toPicardSheaf`, `isGerbe`, `split_of_point`, `tensor` and `baseChange`, with exactly the same smooth projective geometrically connected curve hypotheses.
   - Exact repair text: “Import SchemeAndStackFoundations §3.7 (`picardStack`, `aut_eq_units`, `toPicardSheaf`, `isGerbe`, `tensor`, `baseChange`). Identify Bun_{G_m} with that stack. This target adds its Frobenius–Lang fibres and their central-lattice quotient, preserving the supplied gerbe and automorphism structure.” Add that exact supplier to §GS.0.15's Needs and the supplier table.

7. **F07** (P1) The integral Eichler–Shimura bridge is missing, and clearing denominators does not supply it

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:1185`, “clear the characteristic-zero factorial denominators in the projector argument”.
   - Claim: The rational alternating-projector proof supplies the integral recurrence used for full integral cohomology, specialization and excursions in §§GS.4.12–GS.5.4.
   - Witness: Xue-I lines 2619–2632 explicitly reject that proof over O_E. Lines 2583–2598 require a separate theorem for arbitrary finitely generated W, using an auxiliary finite-free representation M; W need not be an external tensor product.
   - Exact repair text: Add to §GS.3.7: “For split G, every finite I=I′∪{0} and W∈Rep_{O_E}(Ĝ^I) on a finitely generated module admit a finite-free Ĝ-representation M such that Σ_{a=0}^{rank M}(−1)^a S_{∧^{rank M−a}M,v}∘(F_0^{deg v})^a=0 on the integral cohomology system restricted to the 0-leg at v, with the required increase of HN bound. For external products of free representations, M can be the 0-factor.” Replace denominator clearing by the coefficient-natural Cayley–Hamilton construction of Xue-I Proposition 7.2.6, §§7.3–7.4, pp. 44–54; cite §GS.1.14 as an input. Retain the projector proof only for the rational branch. Add the torsion negative control “2·Id=0 on F₂ does not imply Id=0.”

8. **F08** (P1) The chosen finite L-group quotient can force forbidden ramification

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:1730`, “choose a finite splitting-of-pinning extension F̃/F” and “unramified outside |N|∪(X∖U)”.
   - Claim: An arbitrary such extension is compatible with the stated unramifiedness and prescribed projection.
   - Witness: For G_m/F₃(t), U=X=P¹ and N=∅, choose F̃=F(√t). Its prescribed quotient is ramified at 0, forbidding unramified parameters. VL lines 8299–8305 instead use the pinning-action quotient.
   - Exact repair text: In Conventions and §GS.5.10 replace the choice by “Let F̃ be the fixed field of the kernel of the pinned Galois action on the full based root datum, and Q=Gal(F̃/F). Since G extends reductively over U, Q is unramified over U. More generally one may use a finite splitting cover only when it is étale over U.” Retain the prescribed projection and add the ramified split-torus choice as a rejected Check.

9. **F09** (P2) A stable lattice does not exist in the rational branch of the proposed source correction

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:2086`, E6, “a finite-dimensional E-vector space with a stable lattice, so the rational Drinfeld lemma applies”.
   - Claim: The λ-invertible quotient in §GS.4.12 admits a lattice stable under the Frobenius–Weil action; the integral lisse lemma supplies the required descent.
   - Witness: Take A=O_E[t,t⁻¹], m=(λt−1), M=A, with trivial geometric action and Frobenius multiplication by t. Then M/mM=E has Frobenius λ⁻¹ and no stable lattice. Xue-S lines 440–452 require only geometric continuity.
   - Exact repair text: Replace the quoted clause by “a finite-dimensional E-vector space with continuous geometric-Galois action. Apply the rational Frobenius–Weil descent lemma (Xue-S Lemma 1.2.10); no lattice stable under all partial Frobenius operators is required.” Add that lemma, with continuity defined on the geometric kernel, as an explicit target preceding §GS.4.12, distinct from the integral/profinite statement of §GS.4.2. Add the unramified scalar λ⁻¹ example.

10. **F10** (P1) Four supplier contracts have no eligible owner

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:70`, supplier rows for FunctionFieldArithmetic, EtaleDualityAndPerverseSheavesPartII, ExcursionOperatorsAndSpectralAction and DrinfeldModulesAndTModules (also lines 72, 78, 82).
   - Claim: FA.1–FA.6, EQ.3, ES0:classical-center.1, ES7:equal-characteristic.18 and DM.7 supply prerequisites.
   - Witness: These four folders occur in neither `TauCetiRoadmap/` nor `Completed/`, neither `merge-order/ORDER.txt` nor the seven supplied sibling heads; corresponding open-PR name searches return no matches. No matching declared gaps exist.
   - Exact repair text: Remove these four supplier rows and their Needs citations. Add owned prerequisites before their first use: “Global function-field arithmetic: adeles, ideles, finite-level reciprocity, differential additive characters and self-dual measures, zeta functions, Chebotarev and cuspidal support, for F=F_q(X).” “Oriented products and descent for coherent schemes with invertible torsion coefficients.” “The classical smooth Bernstein-centre restriction and the equal-characteristic GL_r local correspondence, including Weil–Deligne monodromy.” “Elliptic sheaves with the periodicity, pole and zero conditions required in §GS.2.7.” Give each a precise statement, proof and source, or declare a matching precise gap assigned to an eligible earlier supplier in both the design and README. Remove DrinfeldModulesAndTModules from the supply side of its stated downstream relationship.

11. **F11** (P2) Full arithmetic Satake is promised but only a finite-quotient coefficient functor is built

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:619`, “arbitrary Frobenius structures … arithmetic Satake category of §GS.1.13”.
   - Claim: §GS.1.13 provides the full category of arithmetic Satake objects.
   - Witness: For G=1, a rank-one lisse E-sheaf with Frobenius 1+ℓ has infinite-order arithmetic descent. It cannot come from a representation of any finite Q. Ric lines 905–927 use the full absolute Galois group.
   - Exact repair text: Add to §GS.1.13: “Over a field k₀, the arithmetic Satake category is equivalent to representations of Ĝ⋊Gal(k₀^sep/k₀) whose Ĝ-action is algebraic and whose arithmetic action satisfies the ℓ-adic continuity and finite-coefficient-field conditions of Ric Theorem 5.1. Here k₀=F_q for §GS.1.7, and k₀=F at the generic point in the nonsplit descent construction. The normalized finite-form L-group coefficient functor is a specified subfunctor of this category, not its full description.” Add the infinite-order rank-one Frobenius object as a Check; retain the pinning/Tate comparison.

12. **F12** (P2) Rank-one examples silently erase the level

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:1785`, “functions on the finite group Pic(X)/Ξ”; also the torus example at line 1299.
   - Claim: Under the standing arbitrary level N, the torus cusp space is the unlevelled Picard quotient.
   - Witness: For X=P¹/F₃, G=G_m and N={0,∞}, the degree-zero ray Picard group is F₃×, of order 2. The ordinary degree-zero Picard group is trivial; quotienting degrees gives dimensions 2 and 1.
   - Exact repair text: “At full level N the torus cusp space consists of functions on the levelled bundle classes Bun_{T,N}(F_q)/Ξ. For G_m these are the ray Picard classes Pic(X,N)/Ξ. When N=∅ this specializes to Pic(X)/Ξ.” Use the two-point level on P¹/F₃ as a negative-control Check in both examples.

13. **F13** (P3) The required source manifest is absent

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:2095`, References, and the package file inventory.
   - Claim: The package supplies traceable source contracts for its targets.
   - Witness: The package has no `sources.toml`, although its References list 25 works and §GS.7.2 additionally relies on Arasteh Rad–Hartl and Richarz's other paper.
   - Exact repair text: Add `sources.toml` with schema `tauceti-roadmap-sources/v1`; record each cited work's id, authors, title, year, locator scheme, exact locators and target associations, plus the sources service's URL, retrieval, hash, licence and status fields. Record Del73 as uncertified if no legal text is supplied. Add direct primary-source references for the parahoric and Gabber prerequisites in §§GS.7.2 and GS.7.4, with the precise versions and result numbers actually used.

14. **F14** (P2) The easy direct-sum headline is reduced to a spanning statement

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean:215`, `iSup_generalizedCharacterSpace_eq_top`; `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:1680`, `GlobalExcursion.primaryDecomposition`.
   - Claim: The Lean milestone mirrors the generalized-character decomposition.
   - Witness: Its conclusion only says the supremum is top. Independence is expressible on the same carriers; `Mathlib/LinearAlgebra/Eigenspace/Pi.lean:90` already proves `Module.End.independent_iInf_maxGenEigenspace_of_forall_mapsTo` for simultaneous generalized spaces.
   - Exact repair text: Replace the spanning-only milestone by a named theorem whose conclusion is `iSupIndep (fun χ : excursionAlgebra S →ₐ[K] K => ⨅ a : excursionAlgebra S, (a : Module.End K V).maxGenEigenspace (χ a)) ∧ (⨆ χ : excursionAlgebra S →ₐ[K] K, ⨅ a : excursionAlgebra S, (a : Module.End K V).maxGenEigenspace (χ a)) = ⊤`, retaining the explicit algebraic-closedness, finite-dimensionality and commutation assumptions. Cite the pinned independence theorem in its proof plan; list the new headline name in §GS.5.7.

15. **F15** (P3) The inverse Check cannot detect a missing inverse, and numerical Checks lack Lean mirrors

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:1592`, “This pins both the relative inverse and the nonconstant two-leg case”; also Checks at lines 218–220, 283–285 and 1590–1591.
   - Claim: The stated matrix calculation tests the inverse convention, and the statable numerical Checks are mirrored in Suggested.lean.
   - Witness: Every tested second matrix is 1, so tr(g₁g₂) passes the same values as tr(g₁g₂⁻¹). The Lean file tests only the identity matrix coefficient and omits the constant-shift and (1,3]-block calculations.
   - Exact repair text: Replace the inverse control by “For A=diag(2,1/2), f(A,A)=2, whereas the incorrect tr(A²) is 17/4.” Add a proved example using `excursionFunction` for the two-leg Hom representation (Mathlib `Representation.linHom`) and this calculation. Bundle zero covector, one-leg constancy and identity pairing into its other example. Bundle the symbolic Euler check `eulerForm g (1,0) (1,0)=1-g`, the rank-zero slope check, and the constant-shift and consecutive-block formulas into the relevant definitions' existing example slots. Keep at most two proved examples per definition; make the README and Lean test lists agree.

16. **F16** (P2) Abstract matrix coefficients are described as regular excursion functions

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean:165`, “it is the invariant function f that indexes an excursion operator”.
   - Claim: Diagonal invariance of the abstract representation in the Lean signature suffices for regular-function excursion indexing.
   - Witness: On (R×)² let ρ(a,b) act on R by |a/b| and take x=1, ξ=id. Both diagonal invariance conditions hold, but |a/b| is not a regular algebraic function on G_m².
   - Exact repair text: “This definition is the pointwise matrix coefficient of an abstract group representation. For a finite-dimensional algebraic representation of Ĝ^I, the additional algebraic structure in README §GS.5.2 makes it a regular excursion function. The Lean diagonal-invariance theorem asserts only invariance of functions on points.” Retain the honest abstract signature; do not add an empty regularity predicate.

17. **F17** (P1) The bundle mass proof applies an unprovided mass theorem

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:382`, “Apply the Siegel mass formula for bundles”.
   - Claim: The listed slope, orbit-weighting and zeta inputs prove the bundle mass formula.
   - Witness: Sch lines 1000–1056 state the same formula and refer to Harder–Narasimhan Proposition 2.3.4. None of §GS.0.13's Needs supplies the Siegel mass theorem; the proposed first step invokes the result being planned.
   - Exact repair text: Replace the first proof sentence by “Prove the bundle mass formula, including its adelic volume calculation, by the Harder–Narasimhan argument (Proposition 2.3.4); establish the required global volume/Tamagawa input here before applying the orbit-weight identity of §GS.0.11.” Give that input a named target with hypotheses and an exact source, or cite an eligible earlier supplier's exact existing target. Retain the separate torsion-support and coherent-sheaf extension arguments.

18. **F18** (P2) Lang's theorem is consumed without its named owner

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:428`, “Apply Lang's theorem”; also the local triviality proof in §GS.0.7 and semilinear descent in §GS.4.1.
   - Claim: The listed prerequisites supply the Lang surjectivity used in these proofs.
   - Witness: `TauCetiRoadmap/ReductiveGroups/README.md:715` explicitly assigns ordinary q-Frobenius Lang surjectivity for smooth geometrically connected finite-type groups to ReductiveGroupsPartII RG2.3.7, `lang-theorem`. This contract is missing from the package's suppliers and affected Needs.
   - Exact repair text: Add “ReductiveGroupsPartII RG2.3.7, `lang-theorem`: surjectivity of x↦x⁻¹Frob_q(x) for a smooth geometrically connected group of finite type over F_q.” Cite it in §§GS.0.7, GS.0.15 and GS.4.1, checking these hypotheses for the group used, in particular Pic⁰ rather than the disconnected full Picard scheme.

19. **F19** (P3) Horocycle Checks repeat the admissibility rules without a test tuple

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:942`, the three `HorocycleIndex` Checks.
   - Claim: These are discriminating tests of the admissibility definition.
   - Witness: The first two bullets repeat the permitted-step rules; the third only counts increases and decreases. No complete tuple tests the endpoint condition simultaneously with the step conditions.
   - Exact repair text: Add three explicit controls: “With Σ=Σ∞=∅ and N>max(2g−2,0), the r=0 tuple ((∅,N)) is admissible with zero-dimensional support. For r=2, ((∅,N),(∅,N+1),(∅,N)) is admissible with two free legs. For r=1, ((∅,N),(∅,N+1)) satisfies the local step rule but is inadmissible because N₁≠N₀.” Keep the general step and parity statements as consequences, not substitutes for these Checks.

20. **F20** (P3) Suggested.lean contains a prohibited declaration catalogue

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean:237`, “README targets that are not stated here”, through line 247.
   - Claim: A catalogue of unavailable target names belongs in the representative-signature file.
   - Witness: The closing block lists BunG, BDGrassmannian, ShtukaIC and other unavailable carriers without any declaration; the binding Suggested.lean contract expressly excludes catalogues of names.
   - Exact repair text: Delete the closing catalogue block. Keep the module docstring's short mathematical explanation that stack and sheaf carriers are unavailable, with the target specifications in README.md. Remove the contributor/reviewer process wording from line 8.

21. **F21** (P2) The general-base nearby-cycle theorem drops the source's base hypothesis

   - Location: `packages/GlobalShtukasAndFunctionFieldLanglands/README.md:1905`, “nearby cycles on the oriented product over a coherent base of higher dimension”.
   - Claim: The owned Orgogozo theorem is stated for a coherent base, with only finite presentation and invertible torsion made explicit in the proof.
   - Witness: Org line 86 requires S coherent and irreducible; lines 87–91 also specify finite presentation, invertible n and a bounded constructible Z/n-complex. The cited theorem does not state the advertised arbitrary coherent-base version.
   - Exact repair text: “Let S be a coherent irreducible scheme, f:Y→S finitely presented, n invertible on S and K∈Dᵇ_c(Y,Z/n). There is a modification S′→S after which the nearby cycles of K are bounded constructible and commute with every base change. For the leg-base application choose the smooth geometrically connected curve component containing v, so its power is integral.” If a theorem for arbitrary coherent S is intended, give its additional reduction or a source establishing that generality as a separate owned target.

## Verified sound

Coverage: every line of README.md (2,121) and Suggested.lean (249) was read. The inventory contains 93 numbered README targets, including their named APIs, and 26 Lean declarations/examples: six real-bodied definitions, nine admitted theorems and eleven proved examples (15 named declarations). All 111 explicit README Checks were assessed mathematically. The source ledger below records 134 locator checks across 27 legally obtained works; two additional works remain uncertified as specified below. These counts describe review coverage, not successful compilation or certification of all claims.

The 21 exact supplier rows were checked for eligibility: six are present on main, eleven are named in the authorized earlier merge order but their current text was unavailable, and four fail eligibility as detailed in R10. The six available owners are ReductiveGroups, SchemeAndStackFoundations, EtaleCohomologyFoundations, AlgebraicVectorBundles, AlgebraicCurves and JacobianChallenge. All seven supplied sibling heads were searched for overlapping objects; the package contains zero direct citations of those seven siblings. Exact supplier statements beyond the available main files are not certified by their names appearing in the order.

The Lean statements retain the instances required for the displayed conclusions. The finite-witness, image and scalar-multiplication statements hold without hidden Noetherian or fraction-field assumptions. The monic-recurrence statement survives degree zero and does not require a finite-dimensional ambient module. The inverse-prime example distinguishes integral finiteness from rational dimension. The matrix-coefficient invariance statement is valid on points; R16 concerns its advertised geometric interpretation. The generalized-character spanning theorem survives the zero module and a nonsemisimple Jordan block; R14 concerns the missing directness headline.

There is one `import Mathlib`, no admitted data definition, no admitted example, no `set_option`, no `lemma` declaration and no `True` placeholder. Each named Lean declaration appears in the README; no definition has more than two proved examples. The heavy stack/sheaf headlines remain README statements rather than forced replacement carriers. No computational algorithm target was found. The numerical Euler sign, shifted consecutive-block subtraction, integral versus rational finiteness, finite-type central-degree condition, nontrivial stack automorphisms and the source corrections E1–E3 passed the recorded boundary tests. The rows below distinguish those results from source and dependency defects.

The explicit target graph has 93 targets and 198 internal Needs links; every internal anchor resolves and every explicit link points earlier. The prose-only cycle in R02 is absent from that graph. The prescribed dependency check returned exit status 1 and exactly:

```text
NOT IN ORDER: GlobalShtukasAndFunctionFieldLanglands (insert it after its last supplier)
depcheck: 8 roadmaps, 61 edges, 1 problem(s)
```

It returned no UPWARD or CYCLE line. The missing order entry is not raised as a finding under the intake rule. This tool result does not certify the four nonexistent suppliers or exclude the internal proof cycle.

The read-only `origin/main...HEAD` diff contains four files, all inside this package: README.md (2,121 added lines), Suggested.lean (249), metadata.toml (1) and review.json (8), totaling 2,379 insertions. README.md and Suggested.lean remain unchanged during this review. No Lean command, git mutation or external post was performed.

### Lean statement and context ledger

Lines in this table refer to `packages/GlobalShtukasAndFunctionFieldLanglands/Suggested.lean`. The contexts record the binders used by each statement; universe-polymorphic `Type*` parameters are not silently specialized.

| Declaration / line | Section and complete variable/instance context | Boundary tests and result | Change |
|---|---|---|---|
| eulerForm / 43 | NumericalClasses; explicit g:ℤ, c,c′:ℕ×ℤ | Rank 0; torsion; g=0,1; (1,0),(1,1). Formula correct. Negative genus is only numerical totalization. | R15 |
| example / 47 | NumericalClasses; no variables | χ(O,O(1))=2 on P¹. Correct. | None |
| example / 51 | NumericalClasses; no variables | χ(O(1),O)=0. Correct asymmetric degree sign. | None |
| slope / 56 | NumericalClasses; explicit c:ℕ×ℤ | (0,0),(0,3),(1,−1),(2,1). Zero-class convention explicitly nongeometric. | R15 |
| example / 60 | NumericalClasses; no variables | Rank-zero pair maps to top. Correct. | None |
| example / 64 | NumericalClasses; no variables | Positive-rank slope 1/2. Correct. | Align README test list, R15 |
| shiftedSlope / 71 | NumericalClasses; T:ℕ→ℝ, a,b:ℕ, deg:ℤ | Empty block, a>b totalization, T=0, constant shift, block (1,3]. Geometric domain explicitly a<b. | R15 |
| example / 76 | NumericalClasses; no variables | T=(1,−1), ranks 1 and 2: 0≤0. Correct. | None |
| example / 82 | NumericalClasses; no variables | T=0: 1≤0 is false. Correct negative control. | None |
| HeckeFinite / 99 | IntegralFiniteness; R,M,ι:Type*; CommRing R, AddCommGroup M, Module R M; T,m explicit | Zero ring/module, empty operators, integral scalars, expanding inverse uniformizer. Definition distinguishes integral and rational finiteness. | None |
| example / 103 | Same R,M,ι context; explicit T | Zero stable submodule works without Noetherian assumptions. | None |
| example / 109 | Same R,M,ι context; explicit a:ι→R and m:M | Cyclic submodule is finite and stable under scalar operators. | None |
| HeckeFinite.finiteLattice / 115 | Same R,M,ι context; T, finite s, hs explicit | Empty s uses zero; finite sum of finite stable submodules gives witness. No Noetherian hypothesis needed. | None |
| HeckeFinite.map / 121 | Same context plus M′, AddCommGroup M′, Module R M′; f and intertwining equality explicit | Zero/noninjective map; image of finite witness remains finite. Correct. | None |
| finiteLattice_of_monic_recurrence / 130 | Same R,M context; T,P,hP,hPT,m explicit; Unit index | P=1 forces relevant module action to vanish; degree 1 and 2 give cyclic finite spans. No finite-dimensionality required. | Integral geometric application needs R07 |
| not_heckeFinite_inv_ell / 137 | IntegralFiniteness; explicit ℓ:ℕ and Fact ℓ.Prime; R=Z_ℓ, M=Q_ℓ, Unit index | ℓ=2,3; valuations of ℓ^(−n) unbounded below, contradicting finite generation. Section's unrelated R,M,ι do not survive. | None |
| HeckeFinite.smul / 154 | FractionField; R,E,M,ι:Type*; CommRing R, Field E, Algebra R E, AddCommGroup M, Module E M, Module R M, IsScalarTower R E M; T,a,hm explicit | a=0, noninjective R→E, empty family. Image under scalar multiplication is a finite R-witness. True without IsFractionRing. | None |
| excursionFunction / 168 | Excursions; explicit k,G,W:Type*; CommRing k, Group G, AddCommGroup W, Module k W; ρ,x,ξ | Zero covector; trivial group; nonalgebraic representation. Function is defined, regularity is not implied. | R16 |
| example / 173 | Same explicit context | Identity representation value equals ξ(x), including zero module. Correct. | Expand coverage, R15 |
| excursionFunction_diagonal_invariant / 181 | Explicit k,H,W,I:Type*; CommRing k, Group H, AddCommGroup W, Module k W; ρ,x,ξ,hx,hξ,h,h′,g | I empty/singleton; noncommutative H. Left invariance uses ξ, right invariance uses x. Correct pointwise theorem. | R16 docstring scope |
| excursionAlgebra / 193 | Excursions; K,V,ι:Type*; Field K, AddCommGroup V, Module K V; S explicit | Empty generators give scalar subalgebra; V=0 gives zero endomorphism algebra. Correct. | None |
| example / 197 | Same K,V context; Empty index | Empty family generates bottom subalgebra. Correct, also for V=0. | Align README test list |
| excursionAlgebra_commute / 201 | Same K,V,ι context; S and pairwise Commute hS explicit | Empty family; one Jordan generator. True but pinned result already supplies it. | R05 |
| excursionAlgebra_finiteDimensional / 207 | Same K,V,ι context; explicit FiniteDimensional K V; S | V=0 and arbitrary generator set. True but pinned instance supplies it. | R05 |
| iSup_generalizedCharacterSpace_eq_top / 215 | Same K,V,ι context; explicit IsAlgClosed K and FiniteDimensional K V; S,hS | V=0 with no characters; empty generators on nonzero V; Jordan block. Supremum statement true, independence absent. | R14 |
| example / 224 | Excursions; closed concrete Q² statement | (J−1)(0,1)=(1,0)≠0 and (J−1)²(0,1)=0; J belongs to generated algebra. Correct. | None |

### README adversarial ledger

Lines in this table refer to `packages/GlobalShtukasAndFunctionFieldLanglands/README.md`. Each section's standing hypotheses apply to its listed APIs. “No change” means the stated instances revealed no additional defect; it does not waive findings inherited from prerequisites or the unavailable supplier versions.

| Statement (README line) | Instances tried | Result | Change |
|---|---|---|---|
| GS.0.1 (98) | G=1, G_m, GL₂ on P¹; arbitrary base and nonreduced base | Automorphisms retained; fixed degree alone is unbounded | No mathematical counterexample; supplier versions unresolved |
| GS.0.2 (129) | Trivial bundle; square-zero extension; GL₁ with genus 0 or 1 | H²=0, H¹ deformations and H⁰ infinitesimal automorphisms have correct degrees | No change |
| GS.0.3 (145) | N empty, rational point, doubled point; G_m over F₂ | Empty level and nilpotents handled correctly | No change |
| GS.0.4 (171) | n=1, n=2, degree-two place; half-twist squared | Integral twist and PGL₂ involution agree | No change |
| GS.0.5 (198) | Zero sheaf, torsion length one, O(2)⊕O(−1), nonreduced base | Zero excluded from geometric slope; almost-isomorphism qualification correct | R15: mirror numerical Checks |
| GS.0.6 (230) | G_m with unbounded degree; GL₂ fixed degree and unbounded HN | Both instability and central degree must be controlled; supplied conditions do so | No change |
| GS.0.7 (248) | G_m, split GL_n, nonsplit torus with nontrivial ker¹ | Groupoid stabilizers and inner-form indexing retained; nonabelian input explicitly owned | R10, R18: arithmetic and Lang inputs |
| GS.0.8 (266) | Zero/constant shift; T=(1,−1); quotient block (1,3] | Dominance and consecutive-block subtraction give the right inequalities | R15 |
| GS.0.9 (295) | Two opposite flags on trivial rank-two bundle on P¹; zero instability | Two minimizers at zero prevent false uniqueness; positive case separated | No change |
| GS.0.10 (322) | GL₁ degree zero/nonzero generator; GL_n degree nd; semisimple centre | Degree injectivity and cocompact degree image distinguish valid lattices | No change |
| GS.0.11 (346) | Rank-one automorphism group F_q×; q=2; finite truncated union | Orbit weight times diagonal kernel equals 1 | No change |
| GS.0.12 (362) | Split identity descent; nonsplit pure-inner-form component | Effective descent preserves the generic torsor class | R10 inherited supplier defect |
| GS.0.13 (378) | r=0 excluded; r=1; q=2; torsion length 0 and 1 | Displayed masses pass; proof assumes its unsupplied mass input | R17 |
| GS.0.14 (396) | Torus; GL₂ trivial-bundle indicator; infinite central degrees | Empty parabolic family and nonzero constant term distinguish cuspidality | R10 |
| GS.0.15 (424) | Pic⁰ versus full Pic; degree translations; scalar automorphisms | Finite Lang kernel only on Pic⁰; noncanonical gerbe splitting correctly qualified | R06, R18 |
| GS.1.1 (457) | G_m over dual numbers; one minuscule GL₂ leg; two colliding legs | Nonreduced loop geometry and collision restrictions retained | No change |
| GS.1.2 (486) | Zero coweight, torus, minuscule/nonminuscule GL₂ | Bounds include closure strata; torus weights add | No change |
| GS.1.3 (513) | Empty chain; zero bound; torus inverse modifications | Identity and composition conventions consistent | No change |
| GS.1.4 (539) | B G_m; BΓ including ℓ dividing its order with rational coefficients; open immersion | Unbounded cohomology, weighted count and convergence qualifications correct | No change |
| GS.1.5 (574) | Two distinct legs versus diagonal; two GL₂ minuscule modifications | Global smallness is distinguished from diagonal semismallness | No change |
| GS.1.6 (590) | r=0; one leg away from level; ab=t at t=0 | Singular fibre does not contradict smooth total chart | No change |
| GS.1.7 (617) | G=1 with Frobenius ±1 and 1+ℓ; G_m weights; standard GL₂ tensor square | Geometric category correct; full arithmetic category not actually supplied | R11 |
| GS.1.8 (645) | Odd-dimensional GL₂ stratum; two odd factors; ℓ=2 | Koszul correction and fixed half Tate twist are coherent in characteristic zero | No change |
| GS.1.9 (661) | Trivial group, torus, SL₂; integral versus field coefficients | Rational geometric equivalence distinct from integral extension | No change |
| GS.1.10 (677) | Central scalars for GL₂; G_m acting on its Grassmannian | Central loop action on normalized coefficients is trivial; dual central characters are different | No change |
| GS.1.11 (691) | Split G_m; norm-one unramified quadratic torus | Nonsplit counterexample to the representation-ring formula | R01 |
| GS.1.12 (707) | N=0; one quotient line; swap on rank two; characteristic 2 | Determinant character and opposition sign correct | No change |
| GS.1.13 (726) | Trivial pinning quotient; nonsplit torus; infinite arithmetic Frobenius | Finite L-group functor insufficient for full arithmetic Satake | R11; R08 for choice of cover |
| GS.1.14 (744) | O_E, O_E/λ, two torsion unit objects; ℓ=2 | Perverse truncation removes Tor₁; free restriction and rationalization correct | No change |
| GS.2.1 (780) | I empty; G_m weights (1,−1) and single 1; Frobenius on S versus X | Degree balance and relative Frobenius convention distinguish objects | No change |
| GS.2.2 (807) | Zero legs; G_m central degrees; fixed bound and central quotient | Finite type requires both fixed bound and central-degree control, present here | No change |
| GS.2.3 (823) | Zero bound; one GL₂ minuscule leg; equalizer differential | Smooth local model uses zero Frobenius differential, with finite-jet bound | No change |
| GS.2.4 (839) | D∞=0; degree-two infinity place; one negative leg | Degree balance and parity count selected geometric infinity flags, not closed-point degree | No change |
| GS.2.5 (866) | I empty, W=1; coefficient torsion; successively refined partitions | Normalization and directed systems are consistent; boundedness separated | No change |
| GS.2.6 (893) | No legs; no twist; twisted inner form | Finite rational automorphism groups survive in the no-leg groupoid | No change |
| GS.2.7 (909) | Rank one; r=1, μ=−1, fractional infinity; degree balance | Specialization depends on nonexistent DM.7 contract | R10 |
| GS.2.8 (925) | Σ empty with r=0,1,2; returning and nonreturning N tuples | Step rules alone do not test endpoint admissibility | R19 |
| GS.2.9 (952) | One leg; two blocks; degree-two closed point | Order comparisons and number of Frobenius iterates consistent | No change |
| GS.2.10 (978) | Identity map of legs; merger of two legs; omitted trivial leg | Coalescence direction and coefficient restriction correct | No change |
| GS.2.11 (992) | Unit double coset; disjoint places; leg at support | Away-place correspondence is sound; extension proof cycles | R02 |
| GS.3.1 (1032) | Unit coefficient; zero invariant vector; coevaluation/evaluation | Triangle identity and scalar dependence correct | No change |
| GS.3.2 (1058) | Zero ring/module; empty family; ℓ=2; operator ℓ⁻¹ | Integral finiteness differs from rational finite dimension; witnesses behave correctly | No change |
| GS.3.3 (1087) | r=0; two free legs; genus 0/1 threshold | Shift [−2r+#I] and normalized positive perverse shift agree with YZ | No change |
| GS.3.4 (1103) | Fixed truncation; inverse PGL₂ double coset; base change | Ind-perverse category avoids claiming a constructible full colimit | No change |
| GS.3.5 (1130) | Torus; no legs; trivial-bundle GL₂ indicator | Empty intersection and proper-parabolic constant terms are correct | No change |
| GS.3.6 (1159) | V=1; degree-two place; GL₂ odd-dimensional minuscule orbit | Degree and sign tested correctly; inherits unsupported nonsplit formula | R01, R02 |
| GS.3.7 (1181) | dim V=0,1,2; ℓ=2 torsion; nonfree coefficients | Rational relation correct; denominator-clearing cannot give integral recurrence | R07 |
| GS.3.8 (1199) | Torus; GL₂ noncuspidal compact function; no legs | Hecke-finite equals cusp under the geometric hypotheses | R10; levelled torus example R12 |
| GS.3.9 (1215) | Fixed degree versus all degree translates; Pic⁰ versus Pic | Source corrections E1–E3 preserve shift, torsor and translation index | No change |
| GS.3.10 (1231) | Torus; torsion coefficients; nonfree W; arbitrary j | Finite integral cusp module and rational comparison match Xue's split hypotheses | No change |
| GS.3.11 (1249) | r=0; Eisenstein component; infinitely many truncations | Finite remainder and Eisenstein support are kept distinct | No change |
| GS.3.12 (1265) | One local Hecke algebra; infinitely generated O_E-module; torsion chain | Finite generation over Hecke algebra does not imply O_E-finiteness | No change |
| GS.3.13 (1281) | r=0 and #Σ∞=0 or 2; r=1 parity failure; r=2 threshold | Stated parity condition repairs the naive iff | No change |
| GS.4.1 (1311) | I empty or singleton; finite étale cover; nonétale dual numbers | Product-of-lifts condition is essential and present | R18 |
| GS.4.2 (1327) | One leg; dense open not a product; torsion coefficients | Integral lisse descent is correctly distinct from arbitrary rational Weil action | R09: add rational lemma separately |
| GS.4.3 (1343) | One/two legs; geometric kernel; independent degrees | Z^I quotient and geometric kernel distinguished from full arithmetic Galois group | No change |
| GS.4.4 (1369) | Identity leg map; merge two legs; commuting Frobenius blocks | Product over fibres of the leg map has the correct direction | No change |
| GS.4.5 (1383) | One monic recurrence; constant monic polynomial; finite family | Finite forward-power box valid; no finite-dimensional ambient assumption | R07 for integral geometric input |
| GS.4.6 (1399) | Identity specialization; generic diagonal to generic product | Injectivity and Hecke-finite surjectivity correctly separated | No change |
| GS.4.7 (1415) | Empty/singleton I; finite lattice; increasing union | Continuity is on finite stable pieces, not an arbitrary topology | No change |
| GS.4.8 (1429) | No legs; trivial extra leg; V⊠V∨ under merger | Cusp identification and diagonal restriction agree | No change |
| GS.4.9 (1456) | Identity/coalesced legs; two compositions | Galois restriction follows the leg-map direction | No change |
| GS.4.10 (1470) | Zero vector/covector; identity coefficient map; composition | Naturality respects pairings and fixed retained legs | No change |
| GS.4.11 (1484) | Two generic points and specialization choices | Comparison is on Hecke-finite subspaces with coherent transport | No change |
| GS.4.12 (1498) | A=O_E[t,t⁻¹], m=(λt−1); integral and rational quotients | Stable-lattice claim fails for Frobenius λ⁻¹ | R09 |
| GS.4.13 (1514) | Constant finite sheaf; infinite direct union; nonsplit good open | Ind-smooth does not mean one finite-rank lisse sheaf | No change |
| GS.5.1 (1546) | Empty legs; all γ=1; coefficient scalar 0 or 1 | Creation–action–annihilation yields the correct scalar | No change |
| GS.5.2 (1572) | Zero covector; one leg; two equal nonidentity SL₂ matrices; nonalgebraic representation | Abstract invariance true; inverse test insufficient and regularity needs algebraicity | R15, R16 |
| GS.5.3 (1596) | Two-leg trace; inertia at a good place; nilpotent excursion algebra | Spherical scalar action uses its separate adjointness argument | No change |
| GS.5.4 (1610) | Auxiliary I empty; retained J empty/nonempty; torsion W | Retained coordinates must get identity; integral bridge required | R07 |
| GS.5.5 (1639) | I empty; constant functions; reindexing; three-copy multiplication | Relative inverse and multiplicative identities match VL | No change |
| GS.5.6 (1655) | Inertia at good place; ramified bad place; nonsplit projection | Unramifiedness is confined to the indicated open | R08 for arbitrary quotient choice |
| GS.5.7 (1669) | V=0; empty generators; 2×2 Jordan block | Spanning is true; directness missing from easy Lean headline; two duplicates | R05, R14, R15 |
| GS.5.8 (1698) | Trivial group; scalar character; finite coefficient extension | Semisimple reconstruction kept distinct from elementwise conjugacy | Supplier target version unverified |
| GS.5.9 (1714) | Zero cusp space; G_m; nilpotent blocks; spherical adjoints | Generalized decomposition and spherical scalar statement consistent | R12 for example at nonempty level |
| GS.5.10 (1728) | Split torus with ramified chosen splitting extension | Prescribed projection contradicts unramifiedness | R08 |
| GS.5.11 (1742) | ℓ=2; torsion reduction; nonreduced finite commutative algebra | Generalized modular blocks retained; no scalar-action overclaim | No change |
| GS.5.12 (1756) | Zero trace function; unit coefficient; missing Frobenius comparison | Conditional input is explicit and unused elsewhere | No change |
| GS.5.13 (1770) | No legs and W=1; nontrivial centralizer | Conjecture labelled and not used to prove decomposition | No change |
| GS.6.1 (1799) | Constant Frobenius q; ℓ-adic unit not p-plain; finite-order character | Twist sign −w correct; p-plainness not inferred from one completion | No change |
| GS.6.2 (1813) | Rank one constant Frobenius q; r=1 finite determinant | Uncentered bound fails after arbitrary p-plain twist | R03 |
| GS.6.3 (1829) | r=1; reducible rank-two parameter; finite central character | Rank-induction contradiction uses lower-rank correspondence and correct pole | Supplier AL.3 version unverified |
| GS.7.1 (1858) | Split torus; degree-two good place; hyperspecial level | Spherical comparison conditional on corrected Satake statement | R01 |
| GS.7.2 (1872) | No legs; n=r=0; Frobenius budget one; parahoric model | Stack automorphisms and inverse-Frobenius thickening retained | R13: precise primary references |
| GS.7.3 (1903) | Trait versus two-dimensional leg base; λ-torsion; fixed complex | Modification depends on complex; arbitrary base change only after modification | R10 for oriented-topos supplier; R21 for base hypothesis |
| GS.7.4 (1919) | δ=1; zero degree; negative di with mi+di≥0 | Transport requires general-base comparison, explicitly owned | R13: Gabber primary locator |
| GS.7.5 (1935) | f=1; spherical trace; two torsion realizations; deep congruence level | Global detection, prime-to-ℓ level and finite support at each exponent respected | No change |
| GS.7.6 (1962) | Integral unit Frobenius; nonintegral λ⁻¹; parabolic induction | Profinite Galois parameter restricted to integral case; general case is Weil | R10 for centre input |
| GS.7.7 (1980) | J empty; finite support at each λ^s; support growing with s | Decay at infinity distinguished from finite support of inverse limit | No change |
| GS.7.8 (1996) | Good and bad place; nonintegral Weil restriction | All-tuples reconstruction used, not good-place eigenvalues alone | R08 inherited quotient issue |
| GS.7.9 (2012) | Steinberg and trivial GL₂ representation | Same semisimple Weil part, different N; Frobenius semisimplification retains N | No change |
| GS.7.10 (2026) | Zero representation; trivial rank one; ψ versus ψ(ϖ·); q=2 | Ratio and q^(1/2−s) agree; q=1 excluded; Del73 text uncertified | R10 for arithmetic inputs |
| GS.7.11 (2052) | r=1; Steinberg rank two; ramified place | Full WD comparison requires local GL_r supplier that is unavailable | R10 |

### Source locator ledger

Each entry identifies the extracted-text passage checked. This is a locator audit, not a claim that every proof in the cited work was checked. EX24 denotes Eteve–Xue, arXiv:2409.16474v1; Ric16 denotes Richarz, arXiv:1311.1008v2; AH19 denotes Arasteh Rad–Hartl, arXiv:1302.6351. HN75 denotes Harder–Narasimhan's bundle-counting paper, Proposition 2.3.4. Other source IDs are those used by the README. Source text remains outside the repository.

| Source | Locator checks (numbered extracted-text witnesses) |
|---|---|
| VL | Definition 1.6 (VL line 2222); Notation 1.7 (VL line 2231); Construction 1.8 (VL line 2251); Definition 1.12 (VL line 2363); Lemma 1.14 (VL line 2473); Theorem 1.17 (VL line 2574); Remark 1.19 (VL line 2634); Remark 1.20 (VL line 2698); Remark 1.21 (VL line 2720); Proposition 2.6 (VL line 2813); Proposition 2.8 (VL line 2865); Definition 2.14 (VL line 3213); Definition 4.1 (VL line 3499); Definition 4.5 (VL line 3651); Definition 4.7 (VL line 3664); Proposition 4.12 (VL line 3704); Proposition 4.14 (VL line 3756); Lemma 5.3 (VL line 3836); Proposition 7.1 (VL line 5453); Lemma 8.11 (VL line 5925); Lemma 8.12 (VL line 5998); Remark 8.18 (VL line 6104); Definition 8.19 (VL line 6163); Remark 8.21 (VL line 6267); Proposition 8.23 (VL line 6295); Proposition 8.27 (VL line 6424); Proposition 8.31 (VL line 6672); Proposition 8.32 (VL line 6766); Corollary 8.34 (VL line 6963); Definition 9.3 (VL line 7207); Lemma 9.4 (VL line 7208); Proposition 9.7 (VL line 7344); Lemma 10.1 (VL line 7407); Lemma 10.2 (VL line 7576); Lemma 10.4 (VL line 7631); Lemma 10.6 (VL line 7768); Proposition 10.8 (VL line 7804); Proposition 10.10 (VL line 7858); §11 reconstruction proof (VL line 8045); Theorem 11.11 (VL line 8227); §12.1 finite quotient (VL line 8299); §13 integral/modular statements (VL line 9096); Proposition 15.1 (VL line 9481); Lemma 16.2 (VL line 9528); Lemma 16.4 (VL line 9618) |
| LL | Proposition VII.4 (LL line 11350); Corollary VII.5 (LL line 11409); Theorem VII.6 (LL line 11421) |
| GeL | Theorem 0.1 (GeL line 50); Remark 0.3 (GeL line 111); Theorem 1.1 (GeL line 193); Proposition 1.3 (GeL line 263); Lemma 1.4 (GeL line 278); Proposition 3.2 proof (GeL line 800); Remark 3.12 (GeL line 1178) |
| MV | Lemma 6.1 (MV line 805); Proposition 6.3 (MV line 872); Theorem 7.3 (MV line 996); Proposition 11.1 (MV line 1292); Theorem 12.1 (MV line 1370) |
| Ric | Theorem 5.1 (Ric line 905); Proposition 5.6 (Ric line 1044); Corollary 5.8 (Ric line 1051) |
| YZ | Corollary 3.29 (YZ line 2239); Lemma 3.30 (YZ line 2250); Corollary 3.31 (YZ line 2256); Definition 3.32 (YZ line 2287); Lemma 3.33 (YZ line 2296); Lemma 3.34 (YZ line 2325); Remark 3.35 (YZ line 2362); §3.5.4 (YZ line 2367); Lemma 3.36 (YZ line 2392) |
| Yu | Theorem 3.3.1 (Yu line 859); Equation (3.3.5) (Yu line 893); Equation (3.3.6) (Yu line 902) |
| Xue-I | Theorem 1.1.5 (Xue-I line 218); Theorem 3.2.1 (Xue-I line 942); Proposition 3.2.2 (Xue-I line 953); Proposition 3.2.7 (Xue-I line 987); Proposition 4.2.6 (Xue-I line 1304); Proposition 5.0.2 (Xue-I line 1588); Theorem 5.0.4 (Xue-I line 1630); Corollary 5.0.5 (Xue-I line 1635); Proposition 6.1.2 (Xue-I line 1723); Proposition 6.2.12 (Xue-I line 2058); Proposition 6.3.3 (Xue-I line 2231); Proposition 7.2.6 (Xue-I line 2583); §7.2.11 (Xue-I line 2619); §7.2.12 (Xue-I line 2625); Proposition 8.1.2 (Xue-I line 3345); Lemma 8.2.2 (Xue-I line 3356); Lemma 8.2.4 (Xue-I line 3362); Proposition 8.2.6 (Xue-I line 3392); Construction 8.3.3 (Xue-I line 3460); Lemma 8.3.5 (Xue-I line 3487); Proposition 8.4.2 (Xue-I line 3515) |
| Xue-S | Lemma 1.2.10 (Xue-S line 448); Lemma 1.2.11 (Xue-S line 450); Proposition 1.3.4 (Xue-S line 526); Lemma 1.3.11 (Xue-S line 572); Theorem 4.2.3 (Xue-S line 1966); Theorem 6.0.12 (Xue-S line 2131); Proposition 6.0.13 (Xue-S line 2137) |
| Var | Lemma A.12 (Var line 1310); Proposition A.13 (Var line 1324) |
| Hein | Proposition 1 and deformation proof (Hein line 158) |
| Schieder | Theorem 2.3.3 and canonical-reduction explanation (Schieder line 433) |
| Chau | Theorem 4.1.2 (Chau line 806) |
| Sch | Theorem 4.1(i)–(iii) (Sch line 1000) |
| Zhu | §0.2 and equal-characteristic sign input (Zhu line 162) |
| LY | Lemma 3.3 (LY line 406) |
| Feng | §5.2.3 (Feng line 1612) |
| Chin | Theorem 3.1 (Chin line 285); Proposition 4.3 (Chin line 514); Theorem 4.6 (Chin line 559) |
| KZ | §5.3.1 (KZ line 2353) |
| Org | Theorem 1.1 (Org line 86); Theorem 6.1 (Org line 801) |
| LO-I | Theorem 2.3.3 (LO-I line 357); Theorem 5.5.6 (LO-I line 1619); Theorem 5.7.5 (LO-I line 2179) |
| LO-II | Theorem 7.5 (LO-II line 670); Theorem 7.7 (LO-II line 765); Theorem 11.4 (LO-II line 1041); Theorem 12.1 (LO-II line 1074) |
| LO-P | Theorem 4.2 (LO-P line 179); Theorem 5.1 (LO-P line 194); Theorem 8.2 (LO-P line 366) |
| Sun | Theorem 1.1 (Sun line 60); Theorem 4.2(ii) (Sun line 1370) |
| EX24 | Theorem A.4 (EX24 line 1564); Theorem A.9 (EX24 line 1607) |
| Ric16 | Theorem A (Ric16 line 47) |
| AH19 | Theorem 3.15 (AH19 line 798) |
| Del73 | Uncertified: sources service resolved only a paywalled citation. |
| HN75 | Uncertified: Proposition 2.3.4 is cited through Sch; sources service resolved only a paywalled citation. |

## Not verifiable

- Exact current sections, declarations and hypotheses of the eleven eligible earlier suppliers were unavailable in the supplied read-only checkouts: AutomorphicLFunctionsAndLocalFactors; EndoscopicTransferAndUnitaryTraceComparison; EtaleDualityAndPerverseSheaves; DeligneWeightsAndPurity; LanglandsParameterStacks; IntegralHeckeAndGaloisDeterminants; ReductiveGroupsPartII; SmoothRepresentationsOfLocalGroups; LefschetzPencilsAndVanishingCycles; RelativeFarguesFontaine; AlgebraicModuliForArithmeticGeometry. Their eligibility was checked against the merge order; that is not a check of their current contents. The boundary-only ownership descriptions of GeometricSatakeAndFusion and HeckeStacksAndLocalShtukas likewise lack supplied current texts. R18's owner assignment is witnessed in ReductiveGroups on main; the actual current RG2.3.7 declaration was not independently read.
- Del73: §§3.12 and 8.12, Theorem 4.1 and Lemmas 4.12–4.16 were not readable through a legal source returned by the service. They remain uncertified paywalled locators, not missing-reference requests. The displayed elementary rank-one gamma normalization was checked independently; the full local-constant source claims are not certified.
- HN75 Proposition 2.3.4: the service returned an uncertified paywalled citation. Sch's displayed mass formula and attribution were read; the original proof and its volume input were not. R17 is the missing proof input in the package, independent of this access limitation.
- The extracted GeL text loses some formula and diagram glyphs. The listed statements, hypotheses and structural comparisons were checked where readable; full glyph-level certification of its restricted-shtuka and transport diagrams is not claimed.
- Lean elaboration was not run, as required by the read-only/no-build instruction. The 11 example proofs and nine admitted signatures were inspected against the pinned APIs; this report does not claim a successful build or completed proofs of admitted targets.

No unresolved missing-reference request remains: the initially unavailable LL and Sch texts were subsequently obtained legally. The paywalled citations above are settled as uncertified. No finding is a re-raise of a repair disposition marked not actionable.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "15151913bb203c0f3f95723924f0564841e7a37a", "job": "RT-GlobalShtukasAndFunctionFieldLanglands~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
