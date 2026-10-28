<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1277#issuecomment-6391245632 -->
Review (claude) of 58a1131

Verdict: needs changes

1. **F01** (P1) Three declared plan gaps have no supplier

   **Location.** The file `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/design/plan.json`, top-level `gaps`, has these entries (lines 4693, 4701, 4710):

   - `presentable-linear-category-self-duality`
   - `adelic-spherical-counit-normalization`
   - `spin-transport-and-involution-computations`

   None of them has a `supplier` key. The brief lists all three with supplier `none`.

   **Claim.** They are declared gaps, and so contracts that the intake announces.

   **Witness.** Each record has only `slug`, `title`, `neededBy` and `detail`. The brief's rule is that a gap whose supplier is `none` is unowned, which is P1.

   The README does not use these slugs. Instead it owns the work in three places:

   - §5.3, README lines 710–722: "This roadmap owns the smooth regular-bimodule coevaluation and its triangle identities."
   - §9.2, README lines 1114–1120: the lattice-adapted counit and its transports.
   - §9.4, README lines 1162–1168: the transport of Δ_A and m_I.

   §5.3 also moves the generic categorical tensor to the new gap `ordinary-presentable-linear-tensor`. So the plan records unowned gaps for work the package now owns.

   **Repair.**
   - Retire the three supplier-less records from plan.json `gaps`. This needs the maintainer, because the package stage may only add gaps.
   - State the ownership once in `## Scope and ownership`. For example: "the spherical counit transports of §9.2, the spin-section and inverse-transpose transport computations of §9.4, and the smooth Eilenberg–Watts coevaluation of §5.3 are targets of this roadmap."
   - Leave the categorical tensor with the new `ordinary-presentable-linear-tensor` gap.

   **Test on the refuting instance.** After the repair, plan.json contains no gap without a `supplier`. §§5.3, 9.2 and 9.4 still each carry their targets and locators (Dor23 Remark 3.54; Definition A.4 to Claim A.6; Construction A.7 and Remark A.8).

2. **F02** (P1) MetaplecticAutomorphicForms §§4.5–4.6 and 5.1 are cited for function fields but are stated for number fields

   **Location.**
   - README line 11: "MetaplecticAutomorphicForms … 4.1–4.6 and 5.1 own the … rational splitting and theta invariance".
   - README line 69: "§§4.1–4.6, including §4.1a, for function-field vector-space Poisson, restricted tensor Weil representations and the rational splitting; §5.1 for rational theta invariance".
   - Needs lines of §6.1 (README line 803: "MetaplecticAutomorphicForms §§4.1–4.6") and §6.3 (README line 849: "MetaplecticAutomorphicForms §§4.1a, 4.4–4.5, 5.1").

   **Claim.** The global function-field restricted-tensor Weil representation and rational theta invariance are supplied.

   **Witness.** I read MetaplecticAutomorphicForms at the head of its open pull request (22bee85).
   - §4.5, Adelic Weil representation, has the scope line "Number field, global ψ, finite-dimensional rational X".
   - §5.1, Theta kernel, says "Number field, characteristic-zero source".
   - §4.6 needs §4.5.

   Only §§4.1, 4.1a, 4.2, 4.3 and 4.4 are stated for global fields of characteristic ≠ 2, including function fields. This roadmap's global context is a function field (Conventions, Global context A). The cited supplier does not make the function-field statement, so the prerequisite is unowned as written.

   **Repair.** Choose one of two routes.

   - (a) Re-scope the citations.
     - Cite MetaplecticAutomorphicForms §§4.1, 4.1a, 4.2–4.4 only, in Scope (line 11), the supplier contract (line 69), and the §6.1, §6.3 and Layer 6 Dependencies lines.
     - Make the invariance of Θ in §6.3 a target proved here from generators: outer and transpose reindexing, the rational mirabolic phase e(b·q·det ξ) = 1, and the middle Weyl element via §4.1a vector-space Poisson summation on M₂(A) together with |q| = 1 for rational q. This is exactly the proof in Dor23 Proposition 4.9, p. 43 (Dor23 lines 2104–2166).
     - Drop the phrase "restricted tensor Weil representations" from the contract. §6.1 already builds Y_A itself from the local kernels.
   - (b) Declare a gap to MetaplecticAutomorphicForms §§4.5, 5.1 asking for their function-field versions.

   **Test.** Under route (a), every Metaplectic section cited for a global statement has scope "global field char ≠ 2" (4.1, 4.2, 4.3), or "4.1a for function fields" (4.2–4.4), or is §4.1a itself. Dor23's proof needs only Poisson summation and the product formula, and the |q|² factor from Dor23 Remark 2.24 becomes 1 for q ∈ F×.

3. **F03** (P2) The sole declaration of Suggested.lean is a supporting lemma, not a headline

   **Location.** `packages/ExoticMonoidalStructuresAndAbstractAutomorphicity/Suggested.lean`, lines 46–75: `structure AssociativeTensor` and `theorem idempotent_coherence`. The README calls this lemma "The headline `idempotent_coherence`" (line 669) and adds "The acceptance file adds only `AssociativeTensor` and `idempotent_coherence`" (line 13).

   **Claim.** The unit-free idempotent theorem is a headline of this roadmap.

   **Witness.**
   - The statement involves only an arbitrary category, an arbitrary tensor functor and an object P. It mentions none of the roadmap's objects: Y, ⊛, I_unit, E, I, Mod_aut.
   - Its conclusion is a formal diagram chase on its hypotheses. I proved it completely in Lean in a scratch copy, in about 70 lines using only naturality, the pentagon and the three hypotheses. The file elaborates under the pinned toolchain.
   - The Summary (README line 3) does not list it among the end theorems.
   - Dor23 uses it as a lemma (Dor23 line 1830, "the same argument as the idempotent theorem").

   This is a theorem about free variables whose conclusion is algebra on its hypotheses, so it is not a headline. All the actual headlines are, correctly, named in the docstring as not statable.

   **Repair.**
   - Delete `AssociativeTensor` and `idempotent_coherence` from `Suggested.lean`.
   - In the module docstring, drop the sentence beginning "The unit-free idempotent coherence headline is statable…". Keep the list of headlines that are not statable. A file that states nothing, with its docstring saying why, is the correct outcome.
   - In the README, keep §5.1 as a prose target with its GH11 locator. Remove the backticked names from lines 13 and 669, and remove the sentences at lines 35 and 39 that refer to "the unit-free categorical acceptance theorem" and to "its single categorical headline".
   - If a maintainer keeps the lemma anyway, rename the structure to the literature's notion (a semigroupal, or non-unital monoidal, category). `AssociativeTensor` is invented vocabulary.

   **Test.** After deletion the file is the docstring and namespace only. It elaborates with no warnings, and no backticked Lean name of this roadmap remains in the README.

4. **F04** (P2) The gap `function-field-quotient-constituents` is compound

   **Location.** README line 75 (plan.json line 4778): "Supply determinant pushforward on compact quotient functions with compatible fibre measures, rational/unipotent generation of SL₂(A), and classical automorphicity of every irreducible constituent of parabolic induction from automorphic torus characters."

   **Claim.** A single precise contract.

   **Witness.** The sentence asks for three unrelated statements:
   - (i) a measure-theoretic pushforward, used in §7.3;
   - (ii) generation of SL₂(A) by U(A) and GL₂(F), used in §7.3 (compare Dor23 lines 2425–2427);
   - (iii) a deep Eisenstein-series theorem, that every constituent of global parabolic induction is a subquotient of S̃, used in §11.6.

   The brief treats a compound `needs` as P2.

   **Repair.**
   - Split it into three slugs, each with one sentence and its own consumer:
     - `determinant-pushforward` (FunctionFieldArithmetic §6.2), Needs of §7.3;
     - `sl2-rational-unipotent-generation` (FunctionFieldArithmetic §6.1), Needs of §7.3;
     - `eisenstein-constituent-automorphicity` (FunctionFieldArithmetic §6.3), Needs of §11.6.
   - Repoint the Needs lines of §§6.2, 6.5, 7.3, 11.4 and 11.6 to the slug each one actually uses.

   **Test.** §7.3's proof route ("Together with Γ this forces SL₂(A)-invariance") then cites only the first two slugs. §11.6 ("import automorphicity of all constituents of parabolic inductions") cites only the third.

5. **F05** (P2) The gap `compact-data-global-zeta` is phrased in this roadmap's own objects

   **Location.** README line 65 (plan.json line 4760): "Supply a common absolute-convergence half-plane and unfolding for the function-field GL₂ theta zeta integrals of arbitrary compact quotient functions".

   **Claim.** A contract that AutomorphicLFunctionsAndLocalFactors AL.3 can state.

   **Witness.**
   - The "theta zeta integrals" are those of §6.5. That is, Z_JL(φ′′, s) with φ′′ = m(φ′⊗Ψ⊗φ), where m is this roadmap's theta multiplication (§6.4).
   - AL.3 has no m and cannot state convergence or unfolding for it.
   - Dor23 Remark 4.11 (Dor23 lines 2181–2205) asserts the identity "by a direct computation" without any convergence discussion. This convergence is the roadmap's own open problem, written as a gap.

   **Repair.**
   - Restate the contract on AL objects only: absolute convergence, in a right half-plane, of the Godement–Jacquet integral ∫ c(g)Φ(g)|det g|^{s+1/2} d×g, where c(g) = ∫_{Γ\G} φ′(h⁻ᵀ)φ(hg)dh is the matrix coefficient of compact quotient functions and Φ ∈ S(M₂(A)).
   - Make the theta-product side (the Whittaker coefficient of m(…) and its unfolding) a target of §6.5 here. Its locator is Dor23 Remark 4.11, p. 44.

   **Test.** The restated sentence mentions only φ, φ′, Φ, Γ\G and GL₂(A), all of which AL.3 and FunctionFieldArithmetic §6.1 carry.

6. **F06** (P2) The gap `function-field-cuspidal-factorization` asks for what an earlier supplier already provides

   **Location.** README line 85 (plan.json line 4772): "Supply cuspidal multiplicity one and restricted tensor factorization over global function fields …", assigned to GL2AutomorphicRepresentationsAndTransfer §§R16.4.1–R16.4.3.

   **Claim.** The factorization is missing upstream.

   **Witness.**
   - AutomorphicLFunctionsAndLocalFactors, at its open head 5d22a23, is earlier in ORDER.txt (line 94, against line 104). Its target *Restricted tensor realizations*, under Representation prerequisites, treats function fields explicitly. It constructs central-character automorphic functions, constant terms and the cusp subspace over a function field, proves finite dimensionality at fixed level and central degree class, and gives the "algebraic restricted tensor factorization of an irreducible cuspidal summand" (source: Lafforgue VI §1d).
   - Its AL.3 target *Function-field local factors, multiplicity one and converse theorem* is the function-field multiplicity owner.
   - By contrast, GL2AutomorphicRepresentationsAndTransfer §§R16.4.1 and R16.4.3 are scoped "F number field" and "Number field F".

   **Repair.**
   - Cite AutomorphicLFunctionsAndLocalFactors, Representation prerequisites, *Restricted tensor realizations*, for the function-field factorization.
   - Narrow the gap to ordinary cuspidal multiplicity one in the smooth GL₂ cusp space over a function field, and assign it to AutomorphicLFunctionsAndLocalFactors AL.3, *Function-field local factors, multiplicity one and converse theorem*.
   - Update §11.4's Needs line accordingly.

   **Test.** The remaining request then names nothing that the AL head already states.

7. **F07** (P3) FunctionFieldArithmetic §6.2 does not carry S = S(Γ\G) as cited

   **Location.** README line 73 ("§§6.1–6.4 for adelic groups, compact and unrestricted smooth automorphic functions") and §6.2, line 807 ("Use the supplied S = S(Γ\G)").

   **Witness.** FunctionFieldArithmetic §6.2, at head f7a17ee, defines 𝒜(G,U,Ξ;R) as functions invariant under a central lattice Ξ, with Ξ required so that the central quotient is finite. Such functions are never compactly supported on Γ\G, so S(Γ\G) is not a subspace of it.

   **Repair.** Form S as SmoothRepresentationsOfLocalGroups §SR.1.1's C_c^∞(X) on the l-space X = Γ\G given by FunctionFieldArithmetic §6.1 (G(K) is a closed discrete subgroup). Form S̃ as the smooth functions on the same X. Keep FunctionFieldArithmetic §§6.3–6.4 for constant terms and cusp finiteness, noting their Ξ-quotient conventions.

8. **F08** (P3) Needs lines omit inputs their own proof routes use

   **Location and witness.** §6.1's proof route compares y_v with the local spherical coalgebra, which needs the counit of §4.2 and the coassociativity of §5.5, as Dor23's proof of Claim 4.3 uses them (Dor23 lines 2032–2038). It also imports Completed/RestrictedProducts Layer 1. Its Needs line (README line 803) lists neither §4.2 nor §5.5 nor Completed/RestrictedProducts. §6.3's route uses a "function-field Weil/theta contract" that R02 removes.

   **Repair.** Add §4.2, §5.5 and Completed/RestrictedProducts Layer 1 to §6.1's Needs line. After R02, replace §6.3's contract wording with "MetaplecticAutomorphicForms §4.1a".

9. **F09** (P3) Locator precision

   **Location and witness.**
   - §9.2 cites "Remark 3.47, pp. 32–33". Remark 3.47 lies wholly on p. 33 (Dor23 lines 1618–1630).
   - §2.1 cites "Notation before Definition 3.2, pp. 18–19 (Dor23 line 948)". The convention is equation (3.2) and Definition 3.2, p. 19 (Dor23 lines 961–982).
   - §0.2's line pointer 505 is Remark 2.8. Construction 2.7 is at Dor23 line 496.
   - The gap `rational-theta-characteristic` carries no locator for the existence theorem it requests. Dor23 Remark A.2 (Dor23 line 2512) attributes it to Armitage, *Inventiones* 2 (1967).

   **Repair.** Correct these three locators, and add "Dor23 Remark A.2, p. 50, citing Armitage 1967" to the gap's sentence.

10. **F10** (P3) Gap wording and vocabulary

   - `equal-characteristic-fourier` (README line 61) partly duplicates AL.3 *Curve additive analysis*. That target applies the finite-level Fourier proof to all completions of a function field, which covers every equal-characteristic local field, and fixes the self-dual normalisation there. Narrow the gap to the finite-dimensional and partial transforms for an arbitrary nontrivial character.
   - In `all-generic-kirillov` (README line 83), the clause "including both Steinberg/trivial extension orientations" is unclear: Kirillov realizations are of irreducibles. Say which Jacquet modules of the two reducible principal series are meant, or drop the clause.
   - "Firm module" is SmoothRepresentationsOfLocalGroups §SR.1.3's "nondegenerate module" over an idempotented algebra. State the equivalence once in Conventions (defect class 7).

11. **F11** (P3) Check wording

   - §0.5, Check 1 (README line 218) applies "the coordinate change" without saying which one. The values match (m, y) ↦ (m, y·det m), the separation used in §1.3; name that map.
   - §5.1, Check 3 (README line 686) gives the reason as "since it sends 0 to 0". The failing instance should be stated: with a(0) = 0 and a(2) = 5, at (x, y) = (0, 1) the left side is θ(a(0), 1) = 2 and the right side is a(θ(0, 1)) = 5.

Eleven findings: two P1, four P2 (blocking), five P3. The mathematics of the README holds up well: none of the 58 targets is false, and every computed witness I recomputed is correct (table below). The blocking findings concern ownership and supplier scope: three plan gaps have no supplier, a supplier section is cited outside its scope, three gap contracts are defective, and the only declaration in `Suggested.lean` is not a headline theorem.

Severity note. Under this job's reviewer instructions, padding in `Suggested.lean` counts as blocking. R03 is therefore rated P2, not the P3 the generic brief would give.

## Verified sound

### Elaboration
`lake env lean`, run on the package's `Suggested.lean` from the content checkout at the pins (Mathlib 6b7abb3, Tau Ceti a91d3aa, toolchain v4.35.0-rc3), finished in about 7 s. The only warning is "declaration uses `sorry`", at line 67.

### Binder check
I ran `#check @AssociativeTensor` and `#check @AssociativeTensor.mk` in a scratch copy. The file uses no `variable` block, so no binders are dropped. The elaborated types match README §5.1: tensor C × C ⥤ C, an associator from (X⊗Y)⊗Z to X⊗(Y⊗Z), naturality and the pentagon.

### One-tactic probe
`simp`, `aesop`, `cat_disch`, `rfl` and `ext; simp` all fail on `idempotent_coherence`. A full 70-line proof (naturality five times, the pentagon, cancellation of the isomorphism m₁, and a³ = a² ⇒ a = 1) compiles. So the statement is **true**, is not one-tactic padding, and is still not a headline (R03).

### Headlines
I listed 15 headlines from the README; none is statable at the pins.

| Headline | README |
| --- | --- |
| Rigidified triality lift | 0.3 |
| Singular, open and Kirillov spectral theorems | 1.2–1.4 |
| Local zeta comparison | 1.5 |
| Whittaker unit and trace | 2.4–2.5 |
| Unit centre and degeneracy-free equivalence | 3.3–3.5 |
| Spherical equivalence and joint generation | 4.3–4.4 |
| Unique exotic associator | 5.2 |
| Frobenius self-duality | 5.3 |
| Generic idempotent algebras and spherical algebra | 5.4–5.5 |
| Adelic product, theta multiplication and global zeta | 6.1–6.5 |
| Compact algebra I | 7.3–7.5 |
| Fully faithful realization and matrix Schwartz module | 8.2–8.3 |
| Spin coalgebra, convolution and invariance | 9.2–9.4 |
| Normalized induction, multiplication and intertwiner | 10.3–10.5 |
| Automorphic adjunction, Weyl lifting, components, irreducibles and finite length | 11.2–11.7 |

I agree with the module docstring that each lacks a carrier at the pins. Neither pin has a smooth-representation category, a Weil representation, a Schwartz–Bruhat carrier or function-field adeles with idele norm. Tau Ceti has only D₄ diagram triality (TauCeti/Algebra/Lie/D4/Tripled/Triality.lean), which is a different object, as the README says.

### Library declarations opened at the pins
- `Matrix.det_fin_two` (Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:809)
- `Matrix.trace` (Mathlib/LinearAlgebra/Matrix/Trace.lean:43)
- `Matrix.trace_transpose` (Trace.lean:71) and `Matrix.trace_mul_comm` (Trace.lean:156)
- `Rep.coinvariantsTensor` (Mathlib/RepresentationTheory/Coinvariants.lean:410), an abbreviation `Rep k G ⥤ Rep k G ⥤ ModuleCat k` with no topology
- `CategoryTheory.SymmetricCategory` (Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:366), which needs `MonoidalCategory`
- `CategoryTheory.CommMon` (Monoidal/CommMon_.lean:26)
- `CategoryTheory.Mod` (Monoidal/Mod.lean:227)

All seven claims are as stated. Neither Mathlib nor Tau Ceti has a semigroupal (unit-free monoidal) structure. A grep for "semigroupal", "nonunital monoidal" and "pentagon" outside `MonoidalCategory` finds nothing.

### Dependency check
`depcheck: 40 roadmaps, 412 edges, 0 problem(s)` (with `--movable`): no UPWARD, CYCLE or moved line.

Positions in ORDER.txt: EnhancedDerivedSheaves 18, SmoothRepresentationsOfLocalGroups 26, AutomorphicLFunctionsAndLocalFactors 94, GL2AutomorphicRepresentationsAndTransfer 104, MetaplecticAutomorphicForms 165, FunctionFieldArithmetic 168, this roadmap 288. AlgebraicVectorBundles and Completed/RestrictedProducts are on main (ae2562c).

### Cross-roadmap citations resolved (31)
- SmoothRepresentationsOfLocalGroups, at the head of its pull request (1383569): §§SR.0.1–SR.0.4, SR.0d.1–SR.0d.2, SR.1.1–SR.1.3, SR.2.1–SR.2.3, SR.3.2 and SR.4.1 all exist. It contains no smooth balanced tensor, so that gap is legitimate.
- AutomorphicLFunctionsAndLocalFactors (5d22a23): AL.0 *Local Schwartz–Bruhat spaces and finite Fourier levels*, where S(F) is scoped to completions of number fields, so the equal-characteristic gap is legitimate (R10); AL.1; AL.2; AL.3 *Curve additive analysis*; AL.3 *Function-field local factors, multiplicity one and converse theorem*.
- GL2AutomorphicRepresentationsAndTransfer (69bcab7): R16.2.1 (characteristic 0 only), R16.2.8 (supercuspidal only), R16.4.1–R16.4.3 (number field only). The gaps are therefore legitimate, except for R06.
- MetaplecticAutomorphicForms (22bee85): §§0.15–0.18, 1.1–1.4, 2.4b–2.7, 4.1, 4.1a, 4.2–4.6 and 5.1 exist; for the scope problem see R02.
- FunctionFieldArithmetic (f7a17ee): §§0.1–0.3, 2.1–2.3, 4.8–4.10, 5.8 and 6.1–6.4 exist; see R07.
- ArithmeticGaloisDuality §R02.3.2 (09ad340) exists.
- On main: AlgebraicVectorBundles L0B–L0C (InvertibleSheaf, rigid structure on finite locally free sheaves); EnhancedDerivedSheaves §E5:presentability.2 with its bold target *Tensor products of presentable categories and module base change*; Completed/RestrictedProducts Scope and ownership, Layer 1, and *Change of family and double cosets*.

The `roadmaps resolve` command reports no cross-roadmap citation and no Lean name that it cannot find.

### Ownership
`roadmaps grep` across main and the 344 open heads found no other owner for:
- the exotic product, abstract automorphicity, `AssociativeTensor`, `idempotent_coherence` or a semigroupal category;
- degeneracy-free representations or smooth Eilenberg–Watts;
- the Godement–Jacquet versus Jacquet–Langlands comparison.

"Theta characteristic" occurs only as unary theta characteristics in QSeriesPartitionsAndMockModularForms, a different object. Kirillov models appear only in suppliers or in unrelated p-adic roadmaps. Among the board packages in this checkout, only this package mentions Dor's exotic structures.

### Source sample: 15 of 15 targets verified at their locators
- **0.2:** Dor23 Constructions 2.7 and 2.9, p. 11, lines 496–513. The definition det(g₁g₂g₃) = 1, the action g₁mg₃ᵀ⊗g₂v, and (13) acting by mᵀ⊗v all match.
- **1.4:** Dor23 Theorem 2.2 and Remarks 2.3–2.4, p. 9, lines 416–441; proof pp. 15–17. Uniqueness of ν follows from the rigidification and Lemma 2.19.
- **2.1:** Dor23 equation (3.2) and Definition 3.2, p. 19.
- **2.3:** Dor23 Definitions 3.7–3.8, pp. 20–21. The unit comparison runs 1_D → F(1_C), which confirms the c·id value in Check 3.
- **3.2:** Dor23 §3.4, pp. 25–27, lines 1293–1365. The quasi-unital Z, smooth equals firm, and underlined Hom equals the finite-support Hom.
- **3.4:** Dor23 Claims 3.30 and 3.32–3.33, proof of Theorem 3.26, Lemma 3.35, pp. 27–29.
- **4.4:** Dor23 Corollary 3.51, p. 34, line 1710; generation as a Z-linear category, p. 37, line 1842.
- **6.1:** Dor23 §4.2, Claim 4.3 and Corollary 4.4, pp. 40–41.
- **8.2:** Dor23 Claim 4.28, Proposition 4.32 and Remark 4.33, pp. 48–49; Dor21 Theorem A.1.1 (limits and colimits) and Warning A.1.2 (not closed under extensions), pp. 4–5.
- **9.2:** Dor23 Definition A.4, Construction A.5 and Claim A.6, p. 51. The source does not define ε_A, and the README honestly states this as a construction target.
- **9.4:** Dor23 Construction A.7 and Remark A.8, p. 51. The formula ι(f)(g) = |det g|⁻²f(g⁻ᵀ) matches.
- **10.2:** Dor21 Definition B.4.1 and Remarks B.4.2–B.4.3, p. 23.
- **10.3:** Dor21 Construction B.3.4, Claim B.3.5, Proposition B.3.6 and Corollary B.3.7, pp. 21–22; Claim B.4.4, p. 23.
- **11.4:** Dor21 Propositions C.4.1, C.4.6 and C.4.8, and Remark C.4.5, pp. 47–51.
- **11.7:** Dor21 Theorem C.5.4 and Remark C.5.5, pp. 54–55.

Also checked:
- GH11 Theorem 3.1.2 (p. 10, lines 481–500) and Appendix A (p. 15). The defect is defined by C∘θ∘(θ⊗1) = θ∘(1⊗θ)∘α, the hypotheses are the two intertwining squares, and the conclusion is C = id. All match the Lean statement.
- Dor20Z Claim A.3, p. 26: S(F) ≅ S(F×), sending 1_{O×} to 1_O.
- The package records no unverified locators.

### Gap contracts
The other nine gaps are precise and statable by their suppliers:
- `smooth-balanced-tensor`
- `smooth-tor-residual-action`
- `firm-centre-enrichment`
- `transpose-central-distributions`
- `twisted-spherical-centre`, which Dor23 calls "clear" (line 1545); I checked End(c-Ind_{SL₂(O)} 1) blockwise as the spherical Hecke algebras of the twists χ∘det
- `normalization-module-freeness`
- `all-generic-kirillov`, apart from the clause in R10
- `rational-theta-characteristic`
- `ordinary-presentable-linear-tensor`

### Style
- All 58 subsections have at least three Checks, a locator and a Needs line.
- The README contains no LaTeX, process words, pull-request numbers, `lemma` or machine paths.
- `Suggested.lean` has no `set_option` and no sorry'd data, and its only import is `import Mathlib`.

### Adversarial pass (one row per statement; values computed)

| Statement | Instances | Computed values | Result | Change |
|---|---|---|---|---|
| Conv. B witness | E₀₀,E₁₁; E₀₁,E₁₀ | au+dr−bt−cs = 1 and −1 | holds | — |
| Conv. w² | w = [[0,−1],[1,0]] | w² = −I; double negative Fourier transform gives m ↦ −m | holds | — |
| Conv. ν = 1 lattice | h = diag(1,−π) | hkh⁻¹ has entry (1,2) equal to −π⁻¹b, so the intersection is u(π⁻¹O) | holds | — |
| Conv. normalized Weyl | (a,d) = (π,1) | \|π\|·\|π⁻¹\| = q⁻¹·q = 1 | holds | — |
| AL contract on ℤ/3 | δ₁ | F(δ₁) = 3^{−1/2}(1,ζ⁻¹,ζ⁻²); F²(δ₁) = (1/3)Σζ^{−y(1+z)} = δ₂ | holds | — |
| SR averaging witness on C₂ | (x,y) | ½(v+σv) = ((x+y)/2,(x+y)/2) | holds | — |
| AVB spin witness on ℙ¹ | O(−1) | deg O(−2) = −2 = 2g−2 at g = 0; O² has degree 0 | holds | — |
| 0.1 pairing | (1,2,3,4),(5,6,7,8); zero ring; 𝔽₂; ℤ[ε] | −4 against 60; Gram matrix of permutation type (14)(23) with det +1; B(m,m) = 2det m, which is 0 over 𝔽₂; B(εE₀₀,E₁₁) = ε | holds | — |
| 0.2 triality action | scalar triples; diag(π,1),diag(π⁻¹,1),1 | (abc)² = 1; multiplier abc = 1; (π,1,1) gives π | holds | — |
| 0.3 lift | identity triple; (13) | id; E₀₁ → E₁₀ → E₀₁ | holds | — |
| 0.4 kernel | middle [[a,b],[0,1]]; w | from (2.4): diag(y,1)·u·diag(y⁻¹a⁻¹,1) = u(yb), giving \|a\|e(by det m)Ψ(m,ay); diag(y,1)w diag(y⁻¹,1) = diag(y,y⁻¹)w, giving \|y\|²F_y; F_y² = \|y\|⁻⁴·reflection | holds | — |
| 0.5 open kernel | m = 0; Weyl element | singular m ∉ Y°; the Fourier image of a ball at I₂ has value at 0 | holds | R11 wording |
| 1.1 Bernstein balance | z = 0, 1, e_c | 0; id; e_c² = e_c | holds | — |
| 1.2 singular stratum | V = 1_G; supercuspidal | V_{SL₂} ≠ 0 breaks the hypothesis; Jac = 0; E²₀,₁ vanishes because SL₂ acts by id on Tor₁ | holds | source Gap noted |
| 1.3 open integral | Φ(g)f(y det g); V₁⊕V₁ | f(y)·∫βΦ; coefficient space of dimension 4 | holds | — |
| 1.4 Kirillov extension | supercuspidal; principal series | boundary 0; boundary ≠ 0 | holds | — |
| 1.5 zeta comparison | y ∈ O×; uniformizer shell | Mellin factor 1; exponents s−½ and s+½ | holds | — |
| 2.1 IRL | diag(π,1); u(b) | ρ(diag(π,1)) rather than ρ(diag(π⁻¹,1)); u(b)ᵀ e₁ = e₁+be₂; (v·g)·h = ρ(hᵀgᵀ)v = v·(gh) | holds | — |
| 2.2 product | M = 0; swap applied twice | 0; identity | holds | — |
| 2.3 weak data | unitor cλ, c = 2 | s on ℂ⊗ℂ is the identity, so λs = λ survives scaling; unit square cλ∘(η⊗1) = λ forces η = c·id (direction 1_D → F(1_C), Def 3.8) | holds | — |
| 2.4 Whittaker unit | u with θ(u) ≠ 1 | W(ug) = θ(u)W(g); relation maps to 0 | holds | — |
| 2.5 trace | M = I_unit | Φ⁻(I⊛N) ≅ IRL(I)⊗_G N ≅ Φ⁻N; transpose acts by +1 | holds | — |
| 3.1 degeneracy-free | 1_G; St; extension E with 1_G as subobject | Φ⁻(1_G) = 0; Ext¹(St,1) ≠ 0; Hom(E,1) = 0 since the extension does not split | holds | — |
| 3.2 Bernstein modules | ⊕ℂ; (1,1,…) | not of finite support, so it lies in the product only | holds | — |
| 3.3 unit and centre | f = id; z = 0 | ψ(f)_I = f, using s_{I,I} = id; central balance gives z_X = 0 | holds (the route differs from Dor's and is valid) | — |
| 3.4 adjunction | N supported on one block | e_d F(N) = 0 for d ≠ c | holds | — |
| 3.5 equivalence | F(0); F(Z) | 0; I_unit | holds | — |
| 4.1 generator | χ ramified with χ(u) ≠ 1 | SL₂(O)-invariants of dimension 1; K-invariants 0 | holds | — |
| 4.2 counit and Δ | ν = 0, 1; 𝔽₃((t)) | q⁰δ₁; q⁻¹δ_{π⁻¹}; e(t⁻²) = 1 although t⁻² ∉ O | holds | — |
| 4.3 equivalence | ramified χ∘det | in the image, with K-invariants 0 | holds | — |
| 4.4 generation | (Z,0)⊗(0,Z_sph) | (0,Z_sph), matching I⊛E = E | holds | — |
| 5.1 idempotent theorem | complex line with θ = c·xy; Cantor pairing on ℕ | triple products c²xyz both ways, so a = 1; triple products 2 and 5 at (0,0,1), and left intertwining fails at (0,1) with 2 against 5; full Lean proof gives a³ = a² ⇒ a = 1 | true | R03, R11 |
| 5.2 associator | three E generators | pentagon gives a³ = a², so a = 1 (Dor23 line 1829) | holds | — |
| 5.3 self-duality | Vect | ev(M,N) = M⊗N, coev ℂ ↦ ℂ, triangle composites id | holds | R01 |
| 5.4 generic algebras | unit scaled by c | m′ = c⁻¹m restores the unit equation | holds | — |
| 5.5 spherical algebra | ⊕ℂ | block units are not an element of the direct sum | holds | — |
| 6.1 adelic product | extra unramified place | inserting y_v leaves the class unchanged | holds | R02, R08 |
| 6.2 S and S̃ | scalar i; constant function | bilinear, so i·B, not −i; constant 1 lies in S̃ but not in S | holds | R07 |
| 6.3 Θ | pairs (E₀₁,1),(E₁₀,1) | a+b both ways; \|q\|² = 1 for rational q | holds | R02 |
| 6.4 multiplication | swapping the S factors | same finite sum | holds | — |
| 6.5 global zeta | zero input; rational idele a | 0 = 0; \|a\| = 1 | holds | R05 |
| 7.1 Poincaré map | rational b | e(b) = 1, so the summand is independent of representative | holds | — |
| 7.2 Petersson unit | det ξ = 0; q·det ξ = 1 | ∫_{A/F} e(−x) = 0; volume 1 | holds | — |
| 7.3 ideal I | Poincaré image | the fibre integral contains ∫θ = 0 | holds | R04 |
| 7.4 algebra | m_I∘(e⊛id) | id_I (Dor23 Cor 4.18), cancelled through an epimorphism | holds | — |
| 7.5 module | two actions agreeing on e | difference∘(e⊛id) = 0, so difference = 0 | holds | — |
| 8.1 criterion | regular I | unit composite id_I | holds | — |
| 8.2 closure | infinite product | smooth part ≠ vector-space product; extensions excluded (Dor21 Warning A.1.2) | holds | — |
| 8.3 matrix Schwartz | m = 0 | e(b·q·0) = 1 | holds | — |
| 9.1 spin lattice | ord ω = 2k; ω ↦ a²ω | annihilator of π^jO is π^{−j−2k}O, giving Λ = π^{−k}O; Λ becomes a⁻¹Λ; at ∞ with dt, k = −1 gives πO | holds | — |
| 9.2 global coalgebra | Λ_v = O_v | 1_{M₂(O_v)}δ₁ equals the local Δ at ν = 0 | holds | R01 |
| 9.3 convolution | e, 1−e | e(1−e) = 0 | holds | — |
| 9.4 invariance | diag(π,1) | ι² = q²·q⁻² = 1; Π_v\|a\|_v = 1 | holds | R01 |
| 10.1 L_norm and η | (a,d) = (π,1), (λ,y) = (1,1), f(π,1) = 1 | q⁻¹·\|π\|⁻¹·f(π,1) = 1 against f(π,1) = 1; unweighted gives q⁻¹ against 1; the weights cancel in general | holds | — |
| 10.2 normalized induction | adjunction direction | Hom_T(r̂W,V) ≅ Hom_G(W,îV); no √q needed | holds | — |
| 10.3 rank-one quotient | diag(0,λ) | det 0, U-phase 1, (π,1) acts with q⁻¹ | holds | — |
| 10.4 lax induction | reducible i(\|a/d\|) | no unit before η is inverted (Dor21 Example B.5.1) | holds | — |
| 10.5 intertwiner | conductor 0 | double composite η⊗η(w), not id | holds | — |
| 11.1 torus category | rational t with ρ(t) ≠ id | no inflation | holds | — |
| 11.2 adjunction | η_v(1_{O×}⊗1_{O×}) | equals 1_{O×}(λ)1_{O×}(y), not 1_O(λ)1_{O×}(y), so reference vectors are not preserved and no global η exists | holds | — |
| 11.3 Weyl lifting | four-term identity; deg(u/v) = 0, −m; 𝔽₃ | four products match; prime degrees N, N, 2N and N, N−m, 2N−m; stabilizer order 4; half-character values q^{−1/2} both | holds | — |
| 11.4 components | cusp form; degree 2 and 3 places | constant term 0; degree-one idele 3−2 | holds | R06 |
| 11.5 decomposition | e² = e | mixed products 0 | holds | — |
| 11.6 irreducibles | Steinberg block | St-modules are sums of St (Dor21 Lemma C.5.2) | holds | R04 |
| 11.7 finite length | cuspidal; Eisenstein; length n | 0; at most 1+1; at most 2n | holds | — |

## Not verifiable

- **Ownership against the 22 board packages listed in the board packages index.** Their READMEs live on other board pull-request heads, which I did not fetch, so ownership against them was checked only through the roadmap service's index. The board packages in this checkout were grepped.
- **Armitage 1967** (existence of a rational theta characteristic, cited by Dor23 Remark A.2). I did not fetch it, because the README does not cite it. R09 asks for the locator to be added; if fetched it is likely publisher-paywalled.
- **Full build.** I ran no full `lake build`, only `lake env lean` on the package file, as the brief allows.

## Source issues

- **Misprint** in Dor23 at Warning 3.25, p. 25: the source calls the degeneracy-free object the nontrivial extension of "the trivial representation St" by 1_G; it should be the nontrivial extension of St by the trivial representation 1_G (1_G as subobject); affects nothing.
- **Misprint** in Dor23 at the proof of Proposition 2.12, p. 14: the torus is written as triples (a,b,c) in F× with abc = 1; it should be triples in (F×)³ with abc = 1; affects nothing.
- **Gap** in Dor23 at the proof of Lemma 2.20, p. 17: the source derives vanishing of the (0,1) spectral-sequence term from vanishing SL₂-coinvariants alone; it should add that SL₂ acts by the identity on Tor₁ by functoriality, so tensoring with Ṽ kills it; affects the proof.
- **Error** in Dor23 at Remark 3.47, p. 33: the source allows any h with hKh⁻¹ ∩ U equal to the kernel of θ; that kernel need not be compact (over 𝔽₃((t)) it contains u(t⁻²)), so it should be the conductor lattice u(π^{−ν}O); affects a stated result.
- **Misprint** in Dor23 at the proof of Claim 4.3, p. 41: the distinguished unit vector is written as the indicator of GL₂(F_v); it should be the indicator of GL₂(O_v); affects nothing.
- **Misprint** in Dor23 at the proof of Proposition 4.9, p. 43: the Fourier integrals are written over M₂(F); they should be over M₂(A), with the sum still over M₂(F); affects nothing.
- **Misprint** in Dor23 at Construction 4.15, p. 45: the Petersson pairing integrates over GL₂(A); it should integrate over GL₂(F)\GL₂(A); affects nothing.
- **Gap** in Dor23 at Claim A.6, p. 51: counitality is asserted although the global counit and the local transports of Remark 3.47 are never constructed; it should construct ε_A from lattice-adapted local data and check both counit equations; affects the proof.
- **Gap** in Dor23 at Construction A.7 and Remark A.8, p. 51: independence of the rational section and multiplicativity of ι are asserted without computation; they should be proved by transporting Δ_A and m along ω ↦ a²ω and the inverse transpose; affects a stated result.
- **Misprint** in Dor21 at Remark B.2.1, p. 16: the y-coordinate of the outer action uses det(g₁g₂ᵀ); it should use det(g₁g₃ᵀ), as in Dor23 Example 2.14; affects nothing.
- **Gap** in Dor21 at Remark C.4.5, p. 49: the source fixes a place of degree one, which need not exist when the curve has no rational point; it should use an idele of degree one, which always exists; affects the proof.
- **Error** in Dor21 at the proof of Lemma C.4.9, p. 52: the source takes a prime in the ray class of xy⁻¹, but classes of degree ≤ 0 contain no prime; it should shift by elements of large positive degree and recover the class by the four-term convolution identity; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "58a1131", "job": "REV-PKG-ExoticMonoidalStructuresAndAbstractAutomorphicity", "model": "opus", "worker": "fable-rev74"} -->
