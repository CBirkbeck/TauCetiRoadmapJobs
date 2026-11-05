# Review of ReductiveGroups (pull request #1676 at 77e7aa8)

**Verdict:** needs changes

## R01 (P2) — The companion files still contain admitted data and prohibited imports

**Location:** `TauCetiRoadmap/ReductiveGroups/SpecialLinearCoordinateTargets.lean:16`, “noncomputable def coordinatePresentation”; `TauCetiRoadmap/ReductiveGroups/SignedADETargets.lean:143`; `TauCetiRoadmap/ReductiveGroups/FoldingADETargets.lean:190`; `TauCetiRoadmap/ReductiveGroups/SpectralWeylTargets.lean:63`.

**Claim:** The Lean rules apply to all nine listed files. The eight companions remain construction/API catalogues, including algebra equivalences, bases and homeomorphisms defined by `sorry`. Several import roadmap modules or individual Mathlib modules instead of the required `import Mathlib`. The passing Suggested build does not certify these files.

**Witness:** `coordinatePresentation` has an admitted equivalence as its body; `rootLineQuotientEquiv`, `fixedIntegralBasis` and `centerHomeomorph` likewise admit mathematical data. `TauCetiRoadmap/ReductiveGroups/CoverLiftTargets.lean:1` imports another roadmap file. `TauCetiRoadmap/ReductiveGroups/Suggested.lean:196` already states the SL endpoint without admitted data.

**Repair:** Delete the obsolete eight companion catalogues, retaining their mathematical specifications and Checks in the README. Put any remaining genuinely statable headline in Suggested using real, simple definitions; name unavailable constructions in its docstring. The existing existential SL theorem passes this test for n=0,1,2: the polynomial quotients are respectively ℤ, ℤ[x]/(x−1), and ℤ[a,b,c,d]/(ad−bc−1). No fabricated equivalence is needed. Do not solve this by moving the same admitted constructions into Suggested.

## R02 (P2) — Rational cohomology and cotensor induction duplicate an earlier supplier

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:17`, “Layer 1.1 owns rational cohomology and cotensor induction”; also §1.1, lines 408–509, and the downstream assertion at 3591.

**Claim:** The general flat-Hopf-algebra theory has an earlier owner. Calling that owner a downstream consumer reverses the existing contract. This is not an extension to a wider class of coefficients.

**Witness:** `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:1145` and `:1209`, §0.7 at its indexed open head, specify arbitrary commutative bases, flat Hopf algebras, arbitrary comodules, enough injectives, the same cofree complex, tensor-order comparison, cotensor equalizer and antipode conversion.

**Repair:** Consume IntegralHeckeAndGaloisDeterminants §0.7 in the supplier contract; remove the duplicate generic construction and reversed downstream assertion. Retain group-scheme/rational-representation adapters and the reductive applications. On ℤ[t,t⁻¹] with weight-one coefficients, both conventions give d⁰(1)=t−1 and d¹d⁰(1)=0. With H=ℤ and M=ℤ/2, both give H⁰=ℤ/2 and positive cohomology zero. These tests require no coefficient-flatness assumption in either roadmap.

## R03 (P2) — The classical complex-point topology and charts also duplicate their supplier

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:19`, “Layer 3A.5 owns the classical topology and smooth complex-manifold charts”; construction at 753–790; reversed supply at 3592–3597.

**Claim:** ComplexComparisonPartII C−1.1 supplies this same topology, gluing, smooth charts and separated/proper comparisons. Forgetting its analytic ring sheaf does not produce a new carrier to construct here.

**Witness:** `TauCetiRoadmap/ComplexComparisonPartII/README.md:774–803` supplies the classical topology on X(ℂ), arbitrary affine gluing, products, smooth charts, étale local inverses and separated/proper comparisons for locally finite-type complex schemes, including nonreduced and nonseparated ones.

**Repair:** Import that section's underlying topology and smooth-chart comparisons, delete their reconstruction and the reversed downstream assertion, and retain the algebraic-orbit, stabilizer, tangent and group-specific comparisons. For Spec ℂ[ε]/(ε²), the imported space has one point while its ring has dimension 2; for the doubled affine line, the two origins remain nonseparable. These are already supplier cases. No proper-GAGA result is needed to take this underlying topology.

## R04 (P2) — The unipotent radical is already constructed at the pin

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1000` and `:2842`, “Construct the maximal smooth connected normal k-unipotent subgroup”; `TauCetiRoadmap/ReductiveGroups/Suggested.lean:35` groups unipotent radicals among unavailable carriers.

**Claim:** The construction and its maximality/uniqueness are pinned library results over arbitrary fields. The genuinely additional descent, quotient and base-change comparisons can remain targets, but the native radical must be consumed explicitly.

**Witness:** `TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/Construction.lean:72,79,91,102,132` defines the radical's ideal and coordinate algebra and proves its candidate, maximality and uniqueness properties. Its only base assumption is `[Field k]` at line 65.

**Repair:** Cite `TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadicalDefiningIdeal`, `isUnipotentRadicalCandidate_unipotentRadicalDefiningIdeal`, `unipotentRadicalDefiningIdeal_le`, `eq_unipotentRadicalDefiningIdeal_iff`, `unipotentRadical` and the scheme realization in the supplier contract. Replace construction claims by specifically named transports/extensions, and correct the docstring's missing-carrier description. On 𝔾_a the defining ideal is zero and the radical is 𝔾_a; on SL₂ it is the augmentation ideal and the radical is 1. Over an imperfect field the native construction still gives the k-radical; it does not silently replace it by the geometric radical. The purely inseparable Weil-restriction example can therefore remain a genuine application.

## R05 (P2) — The kernel–differential theorem is another pinned result

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:575`, “Identify the Lie algebra of the scheme-theoretic kernel … with the kernel of its differential, without assuming smoothness”.

**Claim:** This is stated as a new structural theorem without consuming the existing theorem on exactly the counit-derivation carrier the roadmap selects. A scheme/Hopf transport is a distinct remaining task, not a reason to reconstruct the underlying theorem.

**Witness:** `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Quotient/Kernel/Tangent.lean:132,175` supplies `TauCeti.CommHopfAlgCat.lieSubalgebra_kernelHopfIdeal` and `kernelLieEquiv`, identifying the quotient's derivation Lie algebra with the differential kernel, without kernel smoothness.

**Repair:** Add these declarations to the native tangent contract and retain only the explicit compatibility with Layer 0's scheme dictionary, if still needed. For Frobenius 𝔾_a→𝔾_a in characteristic p, the kernel is α_p, its Lie algebra has dimension 1, and the differential is zero with one-dimensional kernel. For the identity map both kernels have dimension 0. These discriminating cases are already within the pinned theorem's hypotheses.

## R06 (P2) — The relative lane unnecessarily excludes non-Noetherian bases

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:2797–2798`, “Relative reductive groups over an affine Noetherian base”; “any commutative Noetherian ring”.

**Claim:** The relative library and its comparison are narrowed below the cited source and the native predicate. This also leaves arbitrary base change in the supplier contract landing outside the lane's declared objects. The issue is a missing part of the promised general library, not a false theorem about Noetherian rings.

**Witness:** Conrad, Definition 3.1.1, printed p.81 (`conrad` lines 3334–3338), allows an arbitrary scheme. `TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean:38,82` allows every commutative ring and arbitrary commutative-ring base change.

**Repair:** State the relative affine lane over arbitrary commutative R, retaining smoothness and finite presentation. Use descent/limit arguments where needed; isolate a Noetherian lemma only when its proof actually needs it. Add the negative control R=𝔽₂[x₀,x₁,…], G=SL₂,R: R is not Noetherian, but G is smooth of relative dimension 3, with connected reductive geometric fibres and centre μ₂ of rank 2. The repaired statement includes this base change of SL₂,ℤ and its non-smooth centre.

## R07 (P2) — Lang surjectivity is statable but absent from Suggested

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:1449–1488` promises Lang's theorem; `TauCetiRoadmap/ReductiveGroups/Suggested.lean:14–55` lists the acceptance endpoints and missing carriers without accounting for it.

**Claim:** This headline needs no future pinned reductive-group carrier. It is statable for any native smooth geometrically connected finite-type commutative Hopf algebra over a finite field, with the q-power Frobenius specified by its value equation. Suggested contains neither this theorem nor a valid carrier obstruction.

**Witness:** A scratch theorem with the signature below elaborated at the pins with one `sorry` warning. It uses `TauCeti.AlgHom.mapValue` from `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean:154` and geometric connectedness from `TauCeti/Algebra/AlgebraicGroup/Connected/CommHopfAlgCat.lean:61`.

```lean
import Mathlib
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.FunctorOfPoints

universe u
theorem lang_surjective {k : Type u} [Field k] [Finite k]
    (H : TauCeti.FiniteTypeCommHopfAlgCat.{u,u} k)
    (hsm : Algebra.Smooth k H)
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty k H.obj)
    {K : Type u} [Field K] [Algebra k K] [IsAlgClosed K]
    (F : K →ₐ[k] K) (hF : ∀ a : K, F a = a ^ Nat.card k) :
    Function.Surjective (fun g : WithConv (H →ₐ[k] K) =>
      g⁻¹ * TauCeti.AlgHom.mapValue (H := H) F g) := by
  sorry
```

**Repair:** Add this general Lang endpoint, or an equivalent native scheme formulation, to Suggested in README order and list it in the docstring. The value equation fixes F to the actual Frobenius; it is not an assumed Lang conclusion. Retain the existing mathematical checks: over 𝔽₂, θ²+θ+1=0 gives θ²−θ=1 in the additive group; on the disconnected constant C₂, F=id and the Lang image is only {1}. Thus geometric connectedness is material. No restriction to groups lifted from ℤ or to reductive groups is needed.

## R08 (P3) — The companions retain one-tactic and Check padding

**Location:** `TauCetiRoadmap/ReductiveGroups/SpectralWeylTargets.lean:85`; `TauCetiRoadmap/ReductiveGroups/FoldingADETargets.lean:329`; `TauCetiRoadmap/ReductiveGroups/BruhatCoordinateTargets.lean:119`.

**Claim:** Quotient-map continuity, the fixed-submodule kernel formula and evaluation of the just-defined covering homeomorphism are not acceptance headlines. BruhatCoordinateTargets also consists largely of small matrix/coordinate Checks.

**Witness:** Quotient continuity closes by `exact continuous_quotient_mk'`; the fixed-submodule equality by `exact LinearMap.fixedSubmodule_eq_ker _`; covering-homeomorphism evaluation is already proved by `rfl` in the file. The first two were re-elaborated at the pins in an isolated probe.

**Repair:** Delete these declarations from the acceptance material, including `Suggested.lean` if moved there; the README keeps the mathematical statements/Checks. On g=−1 acting on ℤ the fixed submodule and ker(g−1) are both 0; on ℤ/2 both are the whole module. On the identity covering both evaluation expressions are e. These are definition/library consequences rather than deep end theorems. Deleting the companions under R01 also resolves this finding.

## Verified sound

Finite tests below support specific checks; they do not prove the general theorems.

**Previous findings, checked before the full pass.** All nine were revisited; five are repaired and four remain. No supplied repair report marks one of these as settled/not actionable.

| Previous finding | Current passage and witness | Disposition |
|---|---|---|
| R01, common-Levi twist | README 1808–1818 says “intertwines right t with right wtw⁻¹=diag(1,2)”. Over 𝔽₃, diag(2,1) becomes diag(1,2); the untwisted cosets have columns (2,0) and (1,0). | Repaired. The averaging comparison is distinguished from twisted conjugation. |
| R02, two internal cycles | README 280–293 and 2899–2926 place “Steinberg endomorphisms” after 9B; 2768 and 2989 order distributions → rational integration → contraction. | Repaired. Neither former two-edge cycle survives in the stated proof routes. |
| R03, nonexistent RootSystems 4A | README 2145–2165 now says “Construct the factorization adapter” and cites Layer 4's chamber action. | Repaired. A₁ gives (w,d)=(−1,1); empty root span gives (1,1). |
| R04, companion form | `coordinatePresentation … := by sorry` remains at SpecialLinearCoordinateTargets 16–20. | Not repaired; current R01. |
| R05, duplicate cohomology | README 3591 still calls the interfaces “outputs for IntegralHeckeAndGaloisDeterminants §0.7”. | Not repaired; current R02. |
| R06, duplicate topology | README 3592–3594 still calls topology/charts “outputs for ComplexComparisonPartII C-1.1”. | Not repaired; current R03. |
| R07, diagonalizable subgroups | README 199–204 now consumes `groupLikeSpannedProperty.of_surjective` and `.quotient`; Layer 4 retains quotient groups and additional comparisons. | Repaired. μ_p has length p and one geometric point, and remains diagonalizable. |
| R08, absent construction locators | README 2046–2057 gives Frenkel–Kac §2.3/Proposition 2.2; the Steinberg and arrangement blocks give Riche §2.9.1/Remark 1.23 and Brieskorn/Salvetti/Callegaro locators. | Repaired for the three cited blocks; inspected the texts below. |
| R09, padding | The three declarations listed in current R08 remain. | Not repaired; current R08. |

**Build, scope and signature evidence.** HEAD is the requested 77e7aa8. The diff outside `TauCetiRoadmap/ReductiveGroups` is empty. The worker's gate passes every listed scanner and the targeted build. I reran the targeted module build and direct Lean elaboration of Suggested; both exited 0, with the ten intentional `sorry` warnings only. No dependency manifests, toolchain files or PR files were changed. The existing three-view architecture and layers remain; R02–R05 concern specific duplicated objects.

The dependency command's complete diagnostic output was:

```text
depcheck: 204 roadmaps, 1618 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. This does not validate internal layer order or override the two reversed ownership assertions in R02–R03.

All **23 named declarations in Suggested** were checked with `#check @name` in a scratch copy. All five orbit headlines retain the field, algebraic-closedness, affine/smooth/quasi-compact group and finite-type/quasi-compact/separated target hypotheses. The action structures remain in the orbit definitions. Closed-orbit existence without a specified starting point retains `Nonempty (Points X)`. Characteristic zero remains in linear reductivity. The Borel predicate includes algebraic closedness. The coordinate theorem covers every n, and nonsplitting retains 2≤n. No signature correction is needed in Suggested.

All **ten sorried headlines in Suggested** were probed with `rfl`, `simp` and `infer_instance` alternatives: none closed. The native Borel-conjugacy lemma requires an additional containment theorem, and native linear-reductivity implies reductivity in the opposite direction; neither is a one-lemma proof of these headlines. The explicit two successful library-lemma padding probes are confined to the companions (R08).

**Source sample.** Seven legally obtained texts were inspected; no source was copied into the repository. There are no README locators explicitly flagged unverified. The required seeded sample is supported, with one ownership defect independent of source correctness:

| Target | Source and exact text inspected | Hypotheses/locator result |
|---|---|---|
| 1.1: rational representation/comodule convention | Jantzen, *Representations of Algebraic Groups*, 1985 Part I preprint, §2.8, printed pp.36–39; `jantzen` lines 1070–1210. | Universal-point/coaction description supports the arbitrary-module convention. |
| 1.1: enough injectives | Same preprint, §3.9, p.60; `jantzen` lines 1688–1707. | Flat group scheme; arbitrary coefficient module. The proof embeds into the cofree comodule on an injective module, not an arbitrary cofree module. |
| 1.1: cohomology/cofree acyclicity | §§4.2,4.7,4.14–4.16, pp.69–70,72–73,77–79/79a; `jantzen` lines 1923–1939,1994–2015,2102–2155. | Supports invariants, cofree acyclicity and the Hochschild complex. Printed p.77 was also visually inspected because OCR lost parts of the differential. Coefficient-order transport is explicitly an adapter. |
| 1.1: induction/reciprocity | §§3.3–3.7, pp.53–57; `jantzen` lines 1494–1588. | Source has subgroup induction and the inverse-covariance convention; README supplies a direct equalizer argument for arbitrary Hopf maps and explicitly identifies the antipode conversion. It does not pretend the wider Hopf-map statement is verbatim Jantzen. |
| 8.1: split datum | Conrad, *Reductive Group Schemes*, Definition 5.1.1, p.136; `conrad` lines 5651–5669. | Nonempty base, constant roots **and coroots**, split torus, free root lines. Disconnected bases require these conditions separately. |
| 8.2: pinning | Conrad, Definition 6.1.1 and Remark 6.1.2, p.186 (the cited pp.186–187 include them); `conrad` lines 7725–7751. | A constant positive system and simple-root generators; an arbitrary componentwise Borel need not define this pinning. |

The Jantzen page numbers above are those of the cited 1985 preprint, not the later edition's pagination. The repaired ADE locator is `frenkel-kac` lines 750–789, §2.3, equations (2.3)–(2.6), Proposition 2.2, printed pp.40–41: it proves the complex simple case, and the README explicitly owns the additional integral/disconnected/empty cases and the transpose/sign comparison. The repaired Steinberg locators are `riche` lines 2111–2129 (§2.9.1, p.50) and 1054–1062 (Remark 1.23, p.27); the simply connected hypothesis and dimension formula are retained. The arrangement comparisons were read at `brieskorn` lines 98–110 (Proposition 1, p.25), `salvetti` lines 269–366 (Part One, Theorem 1, pp.608–611), and `callegaro` lines 219–233 (Theorems 2.4–2.5 and the intervening equivariant statement, p.272).

**Headline inventory and acceptance coverage.** The README's end results are: the three-way Hopf/scheme/points and rational-comodule dictionaries; orbit locally-closedness, reduced orbit models, strict boundary dimension and closed-orbit existence; homogeneous quotient representability and complex Matsushima affineness; Jordan/torus and unipotent structure; characteristic-zero linear reductivity and Levi complements; Borel conjugacy, root extraction, parabolics and Bruhat coordinates; Lang and Lang–Steinberg; Harish–Chandra adjunction, specialized Mackey, common-Levi independence and its Gassmann consequence; split pinnings and Chevalley–Demazure existence/classification; integral full-lattice PBW/distributions; signed ADE construction, lifts and folding; arbitrary-field pseudo-reductive examples; rational highest weights, Steinberg, contraction and Peter–Weyl; the SL coordinate presentation; plane braids, finite Weyl arrangements and spectral/Weyl monodromy. These are not all equally statable on today's pinned carriers.

Suggested states the five orbit headlines (lines 101–151), linear reductivity (165), Borel conjugacy (177), SL coordinates (196), plane braids (245), and permutation nonsplitting (251). Its module docstring groups many remaining endpoints by missing quotient/comparison, rational-module, pinned-group, integral-realization, fixed-algebra and spectral-action carriers. The unipotent-radical claim in that inventory needs R04's correction, and Lang is missing despite being statable (R07). The docstring should also name the characteristic-zero Levi-complement and finite-group functor endpoints explicitly rather than leaving them unaccounted for. Generic Lie-algebra PBW, root-system classification and native Tannakian reconstruction are suppliers, not additional absent acceptance theorems. The plane-braid statement uses the actual quotient of injective configurations, not an arbitrary space assumed to have the desired fundamental group.

**Adversarial table: 102 retained rows.** The table retains the seeded samples, headline checks and finding witnesses; auxiliary per-target calculations are omitted for length. “Pass” means the displayed instance is consistent with the assertion, not that a finite test proves it. Zero rings/empty schemes are separated from nonempty bases; finite fields have q≥2. Displayed denominators are nonzero or invertible. The A₂ cocycle/Jacobi, finite-matrix count, modular fixed-kernel and representation-dimension calculations were independently recomputed in scratch; other rows are direct calculations.

| Statement | Instances tried | Computed values on the two sides / negative control | Result; change |
|---|---|---|---|
| 0: convolution realizes group multiplication | 𝔾_a, parameters 1,2 | Δx=x⊗1+1⊗x evaluates to 3; (1+2)=3; multiplying evaluations would give 2 | Pass |
| 0: sheaf quotient versus point quotient | 𝔾_m/μ₂ over ℚ | Square class 2 has 0 rational square roots, 2 over ℚ(√2); (√2)²=2 | Pass |
| 0: base change and nonreduced test algebras | μ₂ over 𝔽₂[ε]/ε² | (1+ε)²=1; 1+ε≠1, although μ₂(𝔽₂)={1} | Pass |
| 1: rational action/comodule comparison | 𝔾_m weight m=1, trivial weight | ρ(v)=v⊗t gives g·v=gv; ρ(v)=v⊗1 gives g·v=v | Pass |
| 1: Tannakian points transport | Trivial group; 𝔾_m | Tensor automorphism on every weight n is aⁿ; on weight 0 it is 1; trivial group yields only 1 | Pass; native theorem consumed |
| 1.1: invariant equalizer | ℤ[t,t⁻¹], weights 0 and 1 | ker(ρ−id⊗1)=ℤ for weight 0 and 0 for weight 1 | Pass; R02 ownership |
| 1.1: Hochschild differential sign | Weight-one generator | d⁰(1)=t−1; d¹(t−1)=(t⊗t−t⊗1)−(t⊗t−1⊗1)+(t⊗1−1⊗1)=0 | Pass; R02 |
| 1.1: trivial-group derived invariants | H=ℤ, M=ℤ/2 | Differentials alternate 0,id,0,id; H⁰=ℤ/2, H¹=H²=0 | Pass; no coefficient flatness |
| 1.1: cofree acyclic need not injective | Trivial group, cofree ℤ | Positive cohomology=0; extension of 2ℤ→ℤ, 2↦1 would require 2f(1)=1 | Pass |
| 1.1: enough injectives route | M⊂I, flat H | M⊗H→I⊗H has kernel 0; arbitrary noninjective cofree ℤ still fails the preceding extension | Pass; hypotheses distinguished |
| 1.1: coefficient-last comparison | m⊗h₁⊗h₂ | τ gives h₁⊗h₂⊗m with coefficient +1; reversing h₁,h₂ is a different tensor | Pass |
| 1.1: cotensor induction dimension | H=1⊂C₂; C₂⊂S₃, trivial coefficient | Dimensions 2 and 3 equal indices 2 and 3 | Pass; R02 |
| 1.1: induction for a non-surjective Hopf map | ℤ→ℤ[t,t⁻¹], weight 1 | Cotensor with ℤ equals invariants=0; weight 0 gives ℤ | Pass |
| 1.1: reciprocity/evaluation | Identity subgroup inclusion, sign character of C₂ | Evaluation recovers v; generator acts by −v on both modules | Pass |
| 1.1: antipode covariance conversion | G=𝔾_m, character g↦g | F(hg)=hF(g); f(g)=F(g⁻¹)=g⁻¹ gives f(gh)=h⁻¹f(g) | Pass |
| 2: tangent/I-over-I² comparison | 1, 𝔾_a, 𝔾_m, μ_p | Tangent dimensions 0,1,1,1; dim μ_p=0, so smooth dimension equality is unavailable there | Pass |
| 3: kernel differential | Frobenius 𝔾_a, identity | Lie(α_p)=k=ker(0); Lie(1)=0=ker(id) | Pass mathematics; R05 duplication |
| 3: homogeneous quotient representability | SL₂/U over a field | Quotient is A²∖{0}, dim 2; affinization is A² and adds one point | Pass; quotient not assumed affine |
| 3A: geometric orbit uses all scheme points | 𝔾_m on A¹, x=1 | Image=D(t), contains its generic point; rational-points-only subset omits that point | Pass |
| 3A: locally closed orbit | 𝔾_m on P¹, x=1 | Orbit=P¹∖{0,∞}, open in closure P¹ | Pass; Suggested headline |
| 3A: reduced orbit model | Trivial action on dual-number point | Reduced model Spec k has length 1; ambient local ring length 2; same singleton image | Pass; Suggested headline |
| 3A: strict boundary dimension | Same P¹ orbit; a closed point | dim boundary=0<1; empty boundary dimension ⊥<0 | Pass; Suggested headline |
| 3A: boundary orbit dimension | 0 in closure of 𝔾_m·1⊂A¹ | dim orbit(0)=0<dim orbit(1)=1 | Pass |
| 3A: closed orbit in closure | 𝔾_m·1 in A¹ | Closure=A¹, closed orbit {0}⊆A¹ | Pass; Suggested headline |
| 3A: nonempty closed-orbit existence | Empty X; singleton X | Empty X has 0 points and fails Nonempty; singleton supplies 1 closed orbit | Pass; Suggested hypothesis excludes false case |
| 3A.5: classical point topology | A¹ℂ, P¹ℂ, dual-number point | ℂ is noncompact; P¹(ℂ) compact; dual-number space singleton with ring dimension 2 | Pass mathematics; R03 |
| 3A.5: Hausdorff comparison | Doubled affine line | Two distinct origins have intersecting every pair of punctured neighborhoods | Pass; separatedness needed |
| 3A.5: smooth orbit manifold/tangent | SL₂ on nonzero vectors | dim G=3, dim stabilizer=1, dim orbit=2=3−1 | Pass |
| 3A.5: properness comparison | P¹→point; A¹→point | P¹(ℂ) compact, ℂ noncompact; only first map proper | Pass; supplier already owns this |
| 4: multiplicative Jordan decomposition | [[2,1],[0,2]] over ℚ | s=2I, u=[[1,1/2],[0,1]], su=original, [s,u]=0 | Pass; 2 invertible |
| 4: Jordan decomposition field restriction | k=𝔽₂(a), matrix [[0,a],[1,0]] | Characteristic polynomial X²−a; required scalar √a is not in k | Pass; geometric decomposition/descent distinguished |
| 4: nonsplit torus Galois lattice | Norm-one torus over ℝ | Complex character lattice ℤ; conjugation n↦−n, invariant rank 0 | Pass |
| 5: Lie–Kolchin hypotheses | S₃ over ℂ; real rotation torus | Standard S₃ representation dim 2 has no invariant line; rotation by 90° has no real eigenline | Pass; connected/closed-field hypotheses necessary |
| 5: unipotent radical maximality | 𝔾_a, SL₂ | Radical dimensions 1 and 0; defining ideals 0 and augmentation | Pass mathematics; R04 |
| 6: characteristic-zero linear reductivity | Torus weights; SL₂ in characteristic 2 control | Weight spaces split over char 0; Sym²(k²) in char 2 has dimension 3 and simple socle dimension 2 | Pass; Suggested retains CharZero |
| 6A: cocycle sign/change of section | t=2, v=1, a(t)=(t−1)v | a(2)=1; conjugating standard complement by (−1,1) gives translation coordinate 1 | Pass |
| 6A: complement conjugacy versus uniqueness | L×G_a with trivial action | Every u centralizes L, so all uLu⁻¹=L; conjugating element not unique | Pass |
| 6B: Matsushima invariant convention | GL₂/O₂, g=diag(2,1), right swap matrix | ggᵀ=diag(4,1) unchanged; gᵀg becomes diag(1,4) under right swap | Pass |
| 6B: reductivity of stabilizer matters | SL₂/U | Quotient A²∖{0} is not affine; U unipotent not reductive | Pass |
| 7: Borel conjugacy | SL₂, upper/lower Borels; trivial group | Weyl representative conjugates B⁺ to B⁻; trivial group has exactly one Borel | Pass; Suggested headline |
| 7: standard parabolics | GL₃ | Subsets of 2 simple roots give 4 standard parabolics; Weyl group has 6 elements | Pass |
| 7: full root datum | SL₂ versus PGL₂ | Root has index 2 in SL₂ character lattice, index 1 for PGL₂; same A₁ diagram | Pass |
| 7: Levi decomposition | Upper GL₂ Borel | Dimensions dim T=2, dim U=1, dim B=3=2+1; T∩U={1} | Pass |
| 7: Bruhat dimensions | SL₂/B=P¹ | Cells A⁰ and A¹ have complex dimensions 0 and 1 | Pass |
| 7C: rank-one open chart | SL₂, a=2 | u(2)n₀B⁺ maps to [2:1]; u(2)B⁺=[1:0] is constant | Pass |
| 7a: Lang surjectivity | 𝔾_a over 𝔽₂, θ²+θ+1=0 | θ²−θ=1; over constant C₂, F=id and g⁻¹F(g)=1 only | Pass; connectedness separates cases |
| 7a: rational quotient lifting | Stable μ₂-coset {a,−a}, q odd, a^q=−a | F fixes the coset; neither point is fixed; H¹ obstruction nontrivial | Pass; connected stabilizer hypothesis matters |
| 7c: Harish–Chandra induction | GL₂(𝔽_q), trivial T-module | Induced dimension q+1; U-invariant dimension 2, including q=2:3 and 2 | Pass |
| 7c: biadjunction identity case | P=L=G, U=1 | e_U=1; induction and restriction are identity, both Hom sets equal Hom(V,W) | Pass |
| 7d: Mackey Weyl terms | GL₂ split torus, character θ | Restricted induced module has terms θ and θ^w; dimensions 1+1=2 | Pass |
| 7e: conjugation twist | GL₂(𝔽₃), t=diag(2,1), swap w | wtw⁻¹=diag(1,2); untwisted second columns (2,0)≠(1,0) | Pass repaired Check |
| 7e: same-Levi independence | GL₃ point/plane parabolics | Both indices q²+q+1; at q=2 both 7, though the subgroups are not conjugate | Pass |
| 7f: almost conjugacy transport | Identity equivalence; conjugation | Each class-intersection cardinality is unchanged; S₃ transposition subgroups give (1,1,0) in the three classes | Pass; existing InductionRestriction endpoint |
| 8.1: split root datum | Rank-0/rank-1 torus | X=Y=0 or ℤ; root sets empty in both; pairing rank 0 or 1 | Pass; seeded sample |
| 8.1: central isogeny data not diagram | SL₂/PGL₂ | X/root lattice indices 2/1, same Cartan matrix [2] | Pass; seeded sample |
| 8.1: nonreduced residue fibres | SL₂ over 𝔽₂ | dim G=3; centre length 2, tangent dimension 1 | Pass; smooth centre not required |
| 8.1: empty base convention | Zero ring | Spec 0=∅, geometric fibre set empty; no root datum recoverable from fibres | Pass; nonempty base retained |
| 8.2: pinning generator | SL₂ over ℤ/4 | x(t)=I+tE₁₂; tangent at 0 is E₁₂ with coefficient 1 | Pass; seeded sample |
| 8.2: rescaled pinning is different | Over ℚ, x(2t) | Tangent 2E₁₂≠E₁₂; over ℤ/4 coefficient 2 is not a basis generator | Pass |
| 8.2: empty simple-root set | Torus | Exactly one empty family of root generators | Pass |
| 8.2: disconnected-base positive system | SL₂ over k×k with B⁺,B⁻ | Signs (+,−), not constant (+,+) or (−,−) | Pass; arbitrary Borel not a pinning of constant data |
| 9A: commutator and central sign | Adjacent simple lifts; empty lattice | Commutator=−1=(−1)^−1; empty cover has two elements ±1 and central τ²=1 | Pass |
| 9A: signed root-line quotient | One root, two lifts | Relation e₊+e₋=0 leaves ℤ, with e₋↦−1; mod 2 both signs map to 1 | Pass |
| 9A: Cartan/root bracket | A₂, H₁,x_α₂ | [H₁,x_α₂]=−x_α₂; opposite order gives +x_α₂ | Pass |
| 9A: integral alternation and Jacobi | A₂ basis of rank 8 | 512 basis triples have Jacobi vector (0,0,0,0,0,0,0,0); [x,x]=0 | Pass; integral calculation also reduces mod 2/3 |
| 9A: lift torsor/kernel | A₁ lattice | Hom(ℤ,{±1}) has 2 elements; lattice isometry group has 2; lift group has 4 | Pass |
| 9A: Weyl/based factorization | A₁ −1; A₁² component swap | Pairs (−1,1) and (1,swap); each product recovers original isometry | Pass repaired supplier adapter |
| 9A: signed-cycle invariants | Length-2 cycle with signs +,+ | Fixed vectors (c,c); integral rank 1, equal to orbit-sum span | Pass |
| 9A: invariant formation and base change | Above negative cycle | (fixed over ℤ)⊗𝔽₂=0; fixed after tensor=𝔽₂ | Pass; bad-prime enlargement retained |
| 9A: folded A₂ normalization | e=e₁+e₂,f=f₁+f₂,h=h₁+h₂ | [h,e]=e,[e,f]=h; (2h,e,2f) satisfies sl₂; sublattice index 4 | Pass |
| 9A: folded Cartan orientation | A₃ and A₄ reversals | Matrices [[2,−2],[−1,2]] and [[2,−1],[−2,2]]; they are transposes, not identical conventions | Pass |
| 9A: triality Cartan convention | D₄ order 3 | Matrix [[2,−3],[−1,2]]; product of off-diagonal entries 3 | Pass |
| 9A: exceptional fixed dimensions | D₄ triality, E₆ involution | 2+6+18/3=14; 4+24+48/2=52; identity on D₄ instead gives 28 | Pass |
| 9A: modular toral fixed kernel | Same γ over ℤ, 𝔽₂, 𝔽₃ | Integral and 𝔽₂ kernels 0; 𝔽₃ kernel {(0,0),(1,2),(2,1)}, dimension 1 | Pass |
| 9A: fixedCartan kernel formula | −id on ℤ and ℤ/2 | Fixed=ker(−2)=0 over ℤ, whole module over ℤ/2 | Pass mathematics; R08 padding |
| 9A: integral PBW divided powers | sl₂ | E·E=2E^(2); coefficient 2 becomes 0 mod 2, not division by 2 | Pass |
| 9A: PBW triangular order | sl₂, one E and F | EF=FE+H; coefficient of H is +1 | Pass |
| 9B: integral Chevalley construction | A₁, simply connected versus adjoint | SL₂ and PGL₂ have dimension 3; centres μ₂ and 1 | Pass; full datum distinguishes them |
| 9B: special isogeny square | B₂ in characteristic 2 | τ*=[[0,2],[1,0]], (τ*)²=2I; geometric composite is Frobenius | Pass |
| 9C: finite-order distribution definition | 𝔾_a, δₙ extracting xⁿ | δₙ annihilates (x)^(n+1); δₙ(xⁿ)=1, so it does not annihilate (x)^n | Pass |
| 9C: distribution multiplication | 𝔾_a | δ₁*δ₁=2δ₂; at p=2 product 0, while δ₂≠0 | Pass |
| 9C: Frobenius-kernel dimension | SL₂ and rank-one torus | Distribution dimensions p³ and p; at p=2 values 8 and 2 | Pass |
| 9D: pinned classification | Root datum A₁ with character indices 2,1 | Recovered groups SL₂,PGL₂; pinning-preserving automorphism with fixed full datum is identity | Pass |
| 9D: relative reductivity | R=𝔽₂[x₀,x₁,…], SL₂,R | Smooth relative dimension 3, centre rank 2; ring fails Noetherian condition | R06: widen base |
| 9D: pseudo-reductive versus reductive | K/k purely inseparable of degree p | k-unipotent radical dimension 0; after algebraic closure kernel 1+nilradical has dimension p−1 | Pass; native radical ownership R04 |
| 9E: Steinberg extension and twists | F^m=Frob_q, trivial group; split SL₂ | Trivial fixed group order 1; split SL₂(q) order q(q²−1), at q=2 gives 6 | Pass; after carrier construction |
| 10A: rational/distribution integrability | G_m weight m | Toral distributions act by binom(m,n), with m integral; arbitrary Lie eigenvalue 1/2 cannot be a character weight | Pass; no arbitrary-Lie-module substitute |
| 10A.1: contraction weights | Weight p and weight 1 | Contracted weights 1 and absent, respectively | Pass |
| 10A.1: contraction not monoidal | p=2, two weight-one modules | Each contraction 0; tensor has weight 2 and contraction dimension 1 | Pass |
| 10B: Δ/∇/L in small characteristic | SL₂, p=2, highest weight 2 | Weyl/induced dimensions 3; simple dimension 2 | Pass |
| 10B: Steinberg algebraic theorem | SL₂, p=2,3; rank 0 | (p−1)ρ has dimensions 2 and 3, equal p^1; rank 0 gives 1=p^0 | Pass |
| 10B: tensor-product digits | SL₂, p=3,n=4 | Digits (1,1), simple dimension (1+1)(1+1)=4; Weyl dimension 5 | Pass |
| 10C: Peter–Weyl left/right conventions | G_m, coefficient t^n | Left/right weights (−n,+n), Δt^n=t^n⊗t^n, S(t^n)=t^−n | Pass |
| 11A: orbit quotient/forget-order | n=2, (0,1),(1,0) | Two ordered points, one unordered orbit; quotient projection continuous | Pass; companion continuity is padding |
| 11A: plane-braid fundamental group | n=0,1,2 | π₁=1,1,ℤ; B₀=B₁=1, B₂=ℤ | Pass; Suggested headline includes degenerate n |
| 11A: permutation-map nonsplitting | B₂=ℤ→S₂ | Map m↦m mod 2; section would require 2m=0 and m odd, impossible | Pass; Suggested n≥2 |
| 11B: finite arrangement topology | A₁; empty roots with central direction | A₁ complement ℂ×, quotient z↦z², π₁=ℤ; empty arrangement ℂ^r gives π₁=1 | Pass |
| 11C: cameral Weyl action | A₁ Weyl lift n with n²=−I | n²≠I in G, but [gn²]=[g] in G/T; quotient action squares to identity | Pass |
| 11C: G/T simply connected | PGL₂(ℂ) | π₁(G)=C₂; G/T has contractible fibre over P¹ and π₁=0 | Pass; no simply-connected-G assumption |
| 11C: monodromy endpoint inversion | A₂ loop lifting to endpoint w=(012) | Recorded group action is w⁻¹=(021), distinct from w | Pass |
| SL coordinate presentation | n=0,1,2 | Relations 0, x−1, ad−bc−1; rings ℤ,ℤ,ℤ[a,b,c,d]/(ad−bc−1) | Pass; Suggested headline, R01 |
| Companion covering evaluation | Identity covering e↦e | Constructed homeomorphism sends e to e; displayed RHS e | Pass; R08 delete padding |


**Pinned-library audit.** The checked checkouts match Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following 21 entries record declarations whose definitions/signatures were opened, not merely name-search hits. Paths beginning `Mathlib/` or `TauCeti/` are relative to their respective repositories.

| Pinned file and line | Declaration(s) and scope checked |
|---|---|
| `Mathlib/AlgebraicGeometry/Group/Affine.lean:187,482` | `hopfSpec.fullyFaithful`, `essImage_hopfSpec`: essential image is affine group schemes. No finite-type or smoothness assertion is built into affineness. |
| `Mathlib/AlgebraicGeometry/Group/Smooth.lean:29,63` | `smooth_of_grpObj`: field, locally finite type, group object, geometrically reduced. This is not smoothness of every finite-type group scheme. |
| `Mathlib/AlgebraicGeometry/Group/Abelian.lean:132` | `isCommMonObj_of_isProper_of_geometricallyIntegral`: both properness and geometric integrality; constant S₃ is not a counterexample under those hypotheses. |
| `Mathlib/LinearAlgebra/FixedSubmodule.lean:42` | `LinearMap.fixedSubmodule_eq_ker`: native equation for every module endomorphism over a ring; no ADE assumption. |
| `Mathlib/Topology/Constructions.lean:742` | `continuous_quotient_mk'`: quotient topology supplies continuity; no free-action or covering hypothesis. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:118,213` | `exists_coordinateBialgHom_surjective`, `exists_isClosedImmersion_generalLinear`: finite-type regular-comodule generation/affine group embedding. Kept as suppliers. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:138` | `pointsFunctorIsoTensorAutFunctor`: includes the explicit `GrpCat.uliftFunctor`; not an unlifted equality of carriers. |
| `TauCeti/Algebra/AlgebraicGroup/Tangent/Cotangent.lean:261,360` | `Derivation.cotangentLinearEquiv`; `tangentScalarExtensionEquiv` explicitly requires finite projective cotangent module. |
| `TauCeti/Algebra/AlgebraicGroup/Borel/Basic.lean:148` | `IsBorelOverAlgClosed` is `IsAlgClosed k ∧ Minimal (IsBorelCandidate k H) I`. Hopf-ideal minimality reverses subgroup maximality. |
| `TauCeti/Algebra/AlgebraicGroup/Borel/Conjugation.lean:161` | Native `exists_conjugate_eq_of_isBorelOverAlgClosed` requires `hcontain`; it does not prove the unconditional Suggested headline. |
| `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean:70,78` | `reductiveCommHopfAlgProperty` and its iff include smoothness, geometric connectedness and triviality of specified normal subgroups after algebraic closure. |
| `TauCeti/Algebra/AlgebraicGroup/Reductive/LinearlyReductive.lean:337` | `of_smooth_of_geometricallyConnected_of_baseChange_linearlyReductive` proves the converse direction to Suggested's characteristic-zero target. |
| `TauCeti/Algebra/AlgebraicGroup/Reductive/Over.lean:38,82` | Relative predicate and `baseChange`, over arbitrary commutative rings (R06). |
| `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/Equivalence.lean:138,154` | `schemeEquivalence`, `schemeEquivalence.functorCompιIso`; finitely generated commutative groups, including torsion. |
| `TauCeti/Algebra/AlgebraicGroup/DiagonalizableGroup/ClosedSubgroup.lean:56,67` | `groupLikeSpannedProperty.of_surjective`, `.quotient`; coordinate quotients mean closed subgroups, not quotient groups. |
| `TauCeti/Algebra/AlgebraicGroup/Unipotent/Radical/Construction.lean:72,79,91,102,132` | Native radical construction, candidate, maximality, uniqueness and coordinate carrier (R04). |
| `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Quotient/Kernel/Tangent.lean:132,175` | `lieSubalgebra_kernelHopfIdeal`, `kernelLieEquiv`, on counit derivations (R05). |
| `TauCeti/Algebra/AlgebraicGroup/FunctorOfPoints.lean:154`; `TauCeti/Algebra/AlgebraicGroup/Connected/CommHopfAlgCat.lean:61` in the same algebraic-group directory | `TauCeti.AlgHom.mapValue` is postcomposition; geometric connectedness quantifies over field extensions. These suffice for the compiled Lang signature (R07). |
| `TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Basic.lean:380,445,574` | `pointsMulEquiv`, `pointsMulEquiv_mapValue`, `pointsNatIso`: actual determinant-one matrices and naturality, not yet the chosen polynomial presentation. |
| `TauCeti/Algebra/AlgebraicGroup/Fppf/Quotient/Homogeneous/Basic.lean:216`; `TauCeti/Algebra/AlgebraicGroup/HopfIdeal/Coinvariants/Basic.lean:92` in the same directory | `fppfHomogeneousQuotient` is sheafification; `coinvariants` is the equalizer `(id⊗π)Δ(h)=h⊗1`. Neither definition asserts quotient representability. |
| `TauCeti/LinearAlgebra/BilinearForm/Isometry.lean:153,166`; `TauCeti/GroupTheory/SpecificGroups/Braid/Basic.lean:304` | Native `isometryGroup`/membership needs no positive-definiteness; `BraidGroup.permHom` is the generator-to-transposition homomorphism. |

CoverLiftTargets also reconstructs the native isometry subgroup; R01 removes that duplication.

**Supplier and ownership audit.** Indexed `roadmaps grep`/`show` searches were combined with the main-tree files, available package files and the supplied open checkouts. Existing-roadmap revisions were not substituted for main. The following 16 rows give the resolved mathematical interfaces; the two overlaps are findings R02–R03, not declarations of new supplier gaps. The resolver's 21 name leads were checked: 20 are this roadmap's Suggested declarations, and the remaining `Gassmann.almostConjugate_iff_permutation_equiv` is explicitly the InductionRestriction target below, not a missing native lemma.

| Owner and repository-relative locator | Interface and boundary resolved |
|---|---|
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:551,755,798` | §§0.3,0.7,0.8: relative Proj, local dimension and étale coordinates. The orbit proof uses dimension over a field, not an arbitrary non-Noetherian dimension assertion. |
| Same file `:2071,2167,2418,2458,2502` | §§1.1,1.5,1.13–1.15: descent, quotient sheaves, group spaces, stabilizers, torsors. Torsor interfaces retain the stated flatness/local finite-presentation hypotheses; no universal quotient representability is inferred. |
| Same file `:3437,5613` | §§2.6,4.12: projective-space cohomology and Chow lemma; the complex finite-type use has a Noetherian base. |
| `TauCetiRoadmap/ModularCurves/README.md:386,412` | §§0E–0F: effective affine descent and finite-locally-free affine Weil restriction. The source is affine finitely presented, as required in 9D. |
| `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:296–319` | Layer 4 is chamber/simple-transitivity theory; there is no 4A. Layers 1–2 and 5–6 supply finite root/Coxeter and classification/numbering inputs, not the automorphism adapter newly owned here. |
| `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md:405,537,931` | Layers 3–4 and 7: PBW/highest weights and Serre/Harish–Chandra comparisons. Group integral forms and rational positive-characteristic representations are different remaining objects. |
| `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:275,407,428` | Layers 2,7,8: finite-dimensional closed subgroups, reductive compact-form comparison, complex flag cells. No infinite-dimensional or positive-characteristic theorem imported. |
| `TauCetiRoadmap/SmoothBundlesConnections/README.md:221,315,421` | B1.0/B1.1/B1.4: regular fibres, principal structures, homogeneous quotients. Regular-fibre statements allow non-Hausdorff ambient manifolds; proper quotient assertions retain properness. |
| `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:346–385` | Layer 2.1 explicitly owns `Gassmann.almostConjugate_iff_permutation_equiv`, using fixed-coset counts and native representation equivalences. |
| `TauCetiRoadmap/GroebnerGeometry/README.md:394` | G5 owns polynomial minors, signs, straightening and initial algebra. ReductiveGroups retains group/function comparisons, not a second generic straightening theorem. |
| `TauCetiRoadmap/AlgebraicVectorBundles/README.md:306`; `TauCetiRoadmap/SchubertGeometry/README.md:17–23` | Graded module-scheme/relative linear objects and existing flag/coherent ownership. SchubertGeometry explicitly consumes ReductiveGroups' algebraic Steinberg theorem; its later geometry is not a premise of that theorem here. |
| `TauCetiRoadmap/AlgebraicTopology/README.md:289`; `TauCetiRoadmap/DGFloer/README.md:461–490` | Van Kampen/CW interfaces and Layer 1 item 2's based fibration exact sequence, including components. No claim that connectedness of G alone proves π₁(G/T)=0. |
| `TauCetiRoadmap/ReflectionInvariantTheory/README.md:129–150`; `TauCetiRoadmap/IntegralLattices/README.md:590` | Reflection invariant-degree/coinvariant theory and integral-lattice carrier dictionary. Reflection coinvariants are not Hopf-ideal right invariants. |
| `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:1145–1174,1209–1224` | Open new-roadmap owner of arbitrary-base rational cohomology/cotensor induction; actual overlap R02. |
| `TauCetiRoadmap/ComplexComparisonPartII/README.md:774–803` | Open new-roadmap owner of the classical complex-point topology and smooth charts; actual overlap R03. |
| `TauCetiRoadmap/RootSystemsPartII/README.md:9,19,57–61` at the supplied open head | Explicitly imports ADE signed fixed-algebra/projection comparisons from ReductiveGroups and extends root combinatorics. Its root-row convention is the transpose of this roadmap's H-row convention; A₃ outer-first entries −2,−1 agree after the indicated transport. No second owner for the signed Lie algebra was inferred. |

No kept Suggested name was found to collide with another roadmap’s fully qualified declaration.

**Companion signature limitations and shape.** I appended `#check @name` probes for 273 named companion declarations. Five companion copies elaborated directly. SignedADE, CoverLift and Folding initially stopped at missing roadmap object files; a combined scratch copy with their source definitions supplied allowed inspection of the SignedADE/Folding signatures. CoverLift still failed on `CoverLifts.LiftGroup` and `CoverLifts.projection` (`TauCetiRoadmap/ReductiveGroups/CoverLiftTargets.lean:30–38`), which are not provided by its imports. These failures are covered by R01's deletion of obsolete acceptance catalogues; they are not a claim that the worker's Suggested gate failed. No invented carrier was inserted to make that file pass.

The seeded definitions have APIs and at least three discriminating Checks. Shape examples consulted: RootSystems, ReflectionInvariantTheory, Completed/EffectiveBounds. No copied source passage, good-prime-only replacement, `set_option` in a reviewed file, or change outside the roadmap folder was found. The findings above prevent acceptance despite the passing gate.

## Not verifiable

- CoverLiftTargets' complete elaborated signatures cannot be certified: the imported files do not supply `CoverLifts.LiftGroup` or its projection. A combined source probe confirms this is not just the missing `.olean` symptom. R01 gives the repair.
- An admitted basis, equivalence or homeomorphism has no implemented value to test. For the companion constructions the table checks the README's specified mathematics; it does not certify behavior of `sorry` data. This is the policy defect in R01.
- No required sampled source was inaccessible. Source verification covered the seeded targets and the three repaired locator blocks, plus Conrad's relative-base definition; the rest of the bibliography was not independently source-certified in this sample. No new missing-reference request is needed, and no manifest was edited.

## Source issues

- none
