# Review of LieHighestWeight (pull request #1220 at 92ddd24)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

11 findings: 1 P1, 6 P2, 4 P3; 7 blocking. `README.md` and `Suggested.lean` below are the folder's files. Library paths start with `TauCeti/` or `Mathlib/` and are read at the pins of this head's manifest (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`), which are also main's pins.

The main result of this round: the previous repair moved Layers 6, 7 and the Albert determinant onto native contracts, but four more blocks that the README still plans to build are already in the pinned Tau Ceti (R02–R05), and four "not statable" claims of the module docstring are false for the same reason (R06).

## R01 (P1) — The supply cycle with LieGroups is still there

**Location:** `README.md:563–564`, "LieGroups Layers 2–4, 6–7 for Lie integration, maximal tori, Haar Weyl integration and holomorphic complexification"; `README.md:2940`, "LieGroups Layer 7 consumes the split Serre presentation of §7.1"; `README.md:1359`, `2618`, `2821`.

**Claim:** LieGroups supplies §5.1's compact paragraph, §5.2, §6.2's compact torus bullet and §10.2.

**Witness:** Main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:789` consumes "LieHighestWeight Layer7's" Serre data, and lines 629, 636, 795, 1432 consume Layers 0, 3 and 7. This README states both directions itself at line 2940. The pull-request description says the same.

**Repair:** unchanged from the previous review's R01 (not repaired, text unchanged). Keep the algebraic exports here. Move the passages that need a compact group (the compact paragraph of §5.1, §5.2, the third API bullet of §6.2, §10.2, and the supplier gaps of R07) to LieHighestWeightPartII, which the merge order already lists after LieGroups, and delete them here with a one-line deferral in Scope. The dependency check does not see this edge (it reads `*Needs:*` lines of this README only), so its zero is not evidence.

## R02 (P2) — Layer 8 plans the division octonions that Tau Ceti already has

**Location:** `README.md:2003–2005`, "Build the unavailable doubling APIs in Tau Ceti as a distinct ordered-pair structure `TauCeti.CayleyDickson A` … and name the real division carrier `TauCeti.DivisionOctonionReal`"; the target list runs to line 2046.

**Claim:** The Cayley–Dickson double, its product, conjugation, norm, trace, alternative laws and inverses are to be built.

**Witness:** `TauCeti/Algebra/CayleyDickson/Basic.lean:70,202,210,220,227` (structure, the same product `(ac − star d·b, da + b·star c)`, `NonAssocRing`, `Star`, `StarRing`); `Quaternion.lean:116,139,166,208,212,216,232,261,312,315` (`normSq`, `trace`, `self_add_star`, both alternative laws, `flexible`, `normSq_eq_zero`, `Inv`, `DivisionOctonionReal`, dimension 8).

**Repair:** Move these to *From Tau Ceti* with file and name, and delete the construction sentences (including "the proposed global `CayleyDickson A`" convention at lines 2000 and 2009, which is a pinned definition now). Keep as targets only what the pin lacks: the Moufang identities and two-generated associativity on the double (the pin has Moufang only for the split `TauCeti.Octonion`, `Octonion/Basic.lean:767`), the normed structure, `Im`, the cross product and 3-form, the derivation algebra and the compact Albert algebra. Checked on the README's own Check: `(ij)ℓ = (0,k)`, `i(jℓ) = (0,−k)` with the pinned product.

## R03 (P2) — §3.1 plans the PBW Rees algebra and its two fibres, which are pinned

**Location:** `README.md:842–849`, "Construct the noncommutative Rees algebra as the actual subalgebra of the central-variable polynomial ring `U_R(L)[t]`"; `README.md:864–876` (fibres at 0 and 1, kernel of the zero fibre).

**Claim:** The Rees subalgebra, `j(x) = ι(x)t`, the relation `j(x)j(y) − j(y)j(x) = ħ j([x,y])` and both fibre comparisons are to be constructed.

**Witness:** `TauCeti/Algebra/Lie/UniversalEnveloping/Rees/Basic.lean:53,69,81,104` (`reesAlgebra`, `reesGenerator`, `reesGenerator_mul_sub_mul`, evaluation at one onto), `OneFiber.lean:41,65` (`reesOneFiberEquiv`), `ZeroFiber.lean:62,69,106,122` (`reesSpecializationZero`, value on `j(x)`, kernel `= (ħ)`, `reesZeroFiberEquiv`), over a commutative ring, zero fibre for free `L`.

**Repair:** Cite these and delete the corresponding sentences. What stays is what the pin does not have: the tensor-algebra presentation and universal property, the unit fibre `a ∈ Rˣ` and the `R[t,t⁻¹]` comparison, the zero-fibre Poisson bracket with its laws, the dual-number coefficient `B₁`, and the real evaluation identity. Checked on `[x,y] = y`: `j(x)j(y) − j(y)j(x) = t²ι(y) = t·j(y)`, the pinned relation with the README's sign.

## R04 (P2) — §10.1 plans the affine Weyl group, the alcove and `Ω`, which are pinned

**Location:** `README.md:2645–2671`, e.g. "Build the affine reflections and prove that the affine Weyl group `W_aff = Q∨ ⋊ W` acts simply transitively on alcoves. Build the extended affine Weyl group".

**Claim:** `P∨ = Hom_ℤ(Q,ℤ)`, finiteness of `P∨/Q∨`, the alcove, `W_aff`, simple transitivity, `W_ext`, `Ω`, the surjection `Ω → P∨/Q∨` and the wall action are targets.

**Witness:** `TauCeti/LinearAlgebra/RootSystem/CoweightLattice.lean:150,199`; `Alcove.lean:113,134` (`fundamentalAlcove`, `closedFundamentalAlcove`, `Base.affineSimpleRoot`); `Weyl/Affine/Basic.lean:211,264` (`affineWeylGroup`, `mem_affineWeylGroup_iff`: `Q∨ ⋊ W`); `Weyl/Affine/Alcove.lean:258,284,389` (covering by closed alcoves, simple transitivity); `Weyl/ExtendedAffine/Basic.lean:98,240`, `Alcove.lean:86,218`, `Wall.lean:201`.

**Repair:** Consume these by name. Keep what the pin's own docstrings say is not proved or that I did not find: injectivity of `Ω → P∨/Q∨` (hence the isomorphism), uniqueness of the closed-alcove representative, point stabilisers, the quotient homeomorphisms, intermediate lattices `Y`, `Ω ⋊ Γ_root ≃ Aut` of the affine Cartan matrix, and the based-datum comparison with `TauCeti.integralWeightLattice`. State the hypotheses the pin uses (finite, reduced, irreducible, crystallographic, Archimedean ordered field). Checked in A₁: `W_aff` is generated by `x ↦ −x`, `x ↦ 2−x`; the orbit of 2/3 meets `[0,1]` in 2/3 only.

## R05 (P2) — §9.1 and two Layer 7 "exports" restate pinned theorems

**Location:** `README.md:2410–2421`, "Over ℂ, build the differentiation bridge for the concrete polynomial Schur GL_n modules"; `README.md:2396–2403` (single-weight criterion); `README.md:2903–2911` (CAR multiplicity); `README.md:1816`, "Export coeff_formalCharacter_eq_freudenthalRHS_div"; `README.md:1703–1704`.

**Claim:** These are targets or exports of this roadmap.

**Witness:** `TauCeti/RepresentationTheory/ClassicalGroups/Differential.lean:454` (`differential_tprod`), `Weight/Differential.lean` (`isGlHighestWeightVector_differential`), `WeylModule/Differential.lean:72`, `WeylModule/LittlewoodRichardson.lean:144`; `TauCeti/Algebra/Lie/GeneralLinear/Isotypic.lean:158`; `GeneralLinear/CAR/Decomposition.lean:53,105`; `HighestWeight/Freudenthal.lean:486`; `PBW/Symmetrization.lean:412`.

**Repair:** Cite them in *From Tau Ceti* and delete the build instructions. `TauCeti.LRTableau` (`Combinatorics/Young/LittlewoodRichardson/Basic.lean:71`) and `diagramSchurPoly_mul_diagramSchurPoly_eq_sum_natCard_lrTableau` (`…/Schur/LittlewoodRichardson.lean:313`) are pinned, so cite the pin for the tableau count and SchurWeyl §7.2 only for what it adds. The remaining §9.1 target is the one sentence the pin lacks: the multiplicity of `glIrreducible n ν` in `glIrreducible n λ ⊗ glIrreducible n μ` is `Nat.card (LRTableau λ ν μ)`, a corollary of the three pinned theorems. The list above is what I opened, not a complete audit: grep `TauCeti/RepresentationTheory/ClassicalGroups/` (it also has `Branching`, `GelfandTsetlin`, `UnitaryTrick`) and `TauCeti/Algebra/Lie/GeneralLinear/` against §5.2 and Layer 9 by object. Checked on `λ = μ = (1)`, `n = 2`: counts 1, 1 and `2·2 = 3 + 1`; CAR at `N = 2`: `2^4 = 8·2`.

## R06 (P2) — Four "not statable" claims of the module docstring are false; statable headlines are absent

**Location:** `Suggested.lean:32–39`, "lack the positive division-octonion … carriers", "The closed-alcove headline lacks the constructed affine Weyl action", "The LR application lacks the Littlewood-Richardson tableau carrier", "lack the constructed filtered Rees algebra and its fibre maps".

**Claim:** These headlines cannot be stated at the pins.

**Witness:** The carriers are the pinned declarations of R02–R05. Three probe statements elaborate from this worktree with `sorry` as the only warning: closed-alcove uniqueness on `RootPairing.closedFundamentalAlcove` and `P.affineWeylGroup`; the zero-fibre bracket through `reesSpecializationZero`; `ℂ ⊗[ℝ] TauCeti.DivisionOctonionReal ≃ₗ[ℂ] TauCeti.Octonion ℂ` preserving `1` and `*`.

**Repair:** Correct the docstring and state the headlines that remain this roadmap's after R02–R05, on the pinned carriers:

- for `P : RootPairing ι ℝ M N`, finite, nonempty index, crystallographic, reduced, irreducible, base `b`: `x ∈ closedFundamentalAlcove P b`, `f ∈ P.affineWeylGroup`, `f x ∈ closedFundamentalAlcove P b` imply `f x = x`;
- for a field `K` and Lie algebra `L`: a bilinear `B` on `SymmetricAlgebra K L` with `B (sp₀ a) (sp₀ b) = sp₀ c` whenever `a*b − b*a = reesParameter * c`, and `B (ι x) (ι y) = ι ⁅x,y⁆`;
- the complexification equivalence above (and, if wanted, `finrank ℝ (derivationLieAlgebra ℝ DivisionOctonionReal) = 14`, which also elaborates);
- the LR multiplicity sentence of R05 (I did not elaborate this one).

The formally real Albert carrier, the Vinberg and Freudenthal brackets, the compact maximal torus and category O are still absent at the pin; those four claims stand.

## R07 (P2) — Two of the three supplier gaps ask LieGroups for what the pin provides

**Location:** `README.md:595–607`, `gap:unitary-regular-uniqueness` ("by Zariski density of U(n) in GLₙ(ℂ)") and `gap:unitary-regular-functoriality` ("fully faithful … preserves and reflects irreducibility").

**Claim:** LieGroups must add these.

**Witness:** `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/PolynomialFunctions/Unitary.lean:124` (`eq_of_mem_rationalFunctions_of_forall_unitary`: rational functions on `GL n ℂ` agreeing on `U(n)` are equal); `TauCeti/RepresentationTheory/ClassicalGroups/UnitaryTrick.lean:128,159` (`isIrreducible_comp_toUnits_iff`, `intertwiningMapEquiv`).

**Repair:** Delete both gaps and cite those declarations (uniqueness is the density theorem applied to matrix coefficients, `IsRationalRep.dual_apply_mem_rationalFunctions`). Only `gap:unitary-regular-extension` remains: I found no pinned statement that a continuous `U(n)`-representation extends to a rational one. It moves with §5.2 under R01, and it is still declared nowhere the intake reads (no plan lists it; this is the previous review's R07, not repaired). The README's witness still separates the remaining gap from holomorphic extension: `t ↦ t⁻¹` gives 1/2 at `t = 2`, conjugation gives 2.

## R08 (P3) — The Serre headline is narrowed to simple `L`

**Location:** `Suggested.lean:139`, `[LieAlgebra.IsSimple K L]` in the section of `serreLift_injective_of_base`; `README.md:1833–1834`, "for every such generating system in simple `L`".

**Claim:** Injectivity of the normalized Serre lift needs `L` simple.

**Witness:** Etingof, Theorem 24.2, p. 130 (EtingofLieGroupsLieAlgebras, MIT edition, line 4757) is for "any reduced root system". The pinned `TauCeti.exists_isSerreSystem_of_base` and `serreLift_surjective` have no simplicity binder. For `L = sl₂ × sl₂` the Serre algebra of `diag(2,2)` is spanned by six generators, the lift is onto a 6-dimensional algebra, so it is injective.

**Repair:** Delete `[LieAlgebra.IsSimple K L]` from the section and state the README target for Killing-semisimple `L`; the reduction to simple components (Etingof's first proof line) is the route, and the simple case is a Check. `#check` of the edited statement keeps `IsKilling`, `FiniteDimensional`, the Cartan and `IsTriangularizable` binders.

## R09 (P3) — The family index still assigns PBW to this roadmap

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:82–84`, "The highest-weight roadmap owns the concrete PBW project; Ado–Iwasawa consumes its injectivity, ordered-monomial, filtration, domain, and Noetherian consequences".

**Claim:** Ado–Iwasawa receives PBW from this roadmap.

**Witness:** `README.md:56–57` of this folder: "AdoIwasawa consumes native ordered PBW directly; this roadmap's additional exports are the Rees, normalization and central-monic comparisons." The two files of this pull request contradict each other. Previous R11, not repaired; the description lists it as open.

**Repair:** Replace the sentence by: both roadmaps consume Tau Ceti's PBW basis, filtration, domain and Noetherian theorems; this roadmap adds the central-monic finiteness adapter that Ado–Iwasawa uses. (After R03 the Rees algebra is no longer an export either.)

## R10 (P3) — §9.1 and the character-inversion target of §6.1 have no locator

**Location:** `README.md:2374–2381` (reductive reconstruction and complete reducibility under central semisimplicity; no source in §9.1 at all); `README.md:1453–1457`, "two finite-dimensional modules are equivalent exactly when their formal characters agree", with `README.md:1384` citing "Proposition 30.4 and Corollary 30.5, pp. 159–160".

**Claim:** Each theorem has a locator supporting it.

**Witness:** Etingof Proposition 30.4 (line 5898, p. 159) is the list of equivalent conditions for a minuscule weight and Corollary 30.5 the minuscule character; neither states that characters determine a module. The triangularity used is one line inside the proof of (3)⇒(2) (lines 5918–5920). The References entries for Layer 9 (Goodman–Wallach, Dixmier, Molev) give no theorem or page.

**Repair:** In §9.1 cite a numbered statement for the reductive reconstruction and for complete reducibility with semisimple centre (Dixmier §1.6 by proposition number; uncertified is acceptable), and say "proof of Proposition 30.4, (3)⇒(2), p. 159" where only that step is used. For the inversion target either give a locator that states it or mark it as derived from `TauCeti.formalCharacter_eq_finsum_isotypicMultiplicity_smul` and the pinned triangular expansion, with no source claim.

## R11 (P3) — Process wording in Conventions

**Location:** `README.md:111`, "State each result at the generality it actually needs, in the Zulip house style".

**Claim:** Timeless prose.

**Witness:** The house rule excludes process and venue references; a reader cannot resolve "the Zulip house style".

**Repair:** End the sentence at "needs".

## Verified sound

**Previous findings (review of `beea1d2`), checked first.** No repair report for this head was supplied; nothing is settled as not actionable.

| Previous | Passage at this head | Status |
| --- | --- | --- |
| R01 cycle with LieGroups | `README.md:2940` "LieGroups Layer 7 consumes the split Serre presentation of §7.1" | Not repaired → R01 |
| R02 adjoint zero weight | `README.md:616–617` "The nonzero weights of the complexified adjoint representation are the root characters" with three Checks | Repaired |
| R03 Layer 6 native | `README.md:1380–1381` "Use the orbit sums, integral lower sets, triangular character expansion and polynomial density from the exact Tau Ceti supplier contracts" | Repaired |
| R04 Layer 7 native | `README.md:1666–1667` "Use the native Killing-duality, inner-action, polynomial-density, Cartan-conjugacy and trace-power contracts" | Repaired for the objects named then; two more in R05 |
| R05 Albert determinant | `README.md:1980–1981` "Use the native cyclic determinant and cubic/trace identities from the supplier contract" | Repaired |
| R06 four redundant gaps | `README.md:609` "From ConvexityToric T1 and SchurWeyl §7.2" | Repaired; two further redundant gaps in R07 |
| R07 gap registration | three gaps at `README.md:586–607`, no plan entry | Not repaired → R07 |
| R08, R09 statement hygiene | `octonionSerreLift_injective`, `nonempty_derivationAlbert_equiv_f4` | Repaired; gate `statement-hygiene=0` |
| R10 dropped layer ids | table at `README.md:49–53` | Repaired; Layers 1, 2, 4 map to named declarations |
| R11 family PBW paragraph | family `README.md:82–84` unchanged | Not repaired → R09 |
| R12 description | "revises `…/LieHighestWeight/` and its entry in `…/RepresentationTheory/README.md`" | Repaired |
| R13 Cartan path | `README.md:260` `Mathlib/LinearAlgebra/Matrix/Cartan/Basic.lean` | Repaired |
| R14 exceptional locators | Schafer p. 28 and p. 41, Baez Theorems 4–7, Garibaldi Example 4.4 | Repaired; all read below |
| R15 representation ring | `README.md:1397–1438`, API and four Checks on `TauCeti.SplitK0` | Repaired |

**Gate, build, scope.** The worker's gate passes with every counter 0. Outside-folder diff is empty apart from the family index. `lake env lean` on `Suggested.lean`: exit 0, ten `sorry` warnings, nothing else. Dependency check output:

```text
depcheck: 227 roadmaps, 2067 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line; R01 is found by reading, as explained there.

**Signatures and padding.** `#check @` on all 11 declarations in a scratch copy: each matches the README statement. The two "lost binder" leads are false: `IsTriangularizable K H L` is present in both elaborated types. One-tactic probe (`simp`, `rfl`, `infer_instance`, `aesop`) on the ten admitted theorems: 0 closed. `module_finite_of_central_monic_relations` was compared with the pinned `moduleFinite_of_isIntegral_of_span_eq_top` (`PBW/Finite.lean:180`): the adapter needs a commutative structure on `R`, a tower and a reindexing, so it is not one lemma. `exists_pbwSymmetrization` is global; the pin's `pbwSymmetrization` (`PBW/Symmetrization.lean:78`) is degreewise. `fourteen_le_rank_g₂` (`Octonion/Serre.lean:405`) is the wrong inequality for injectivity. No padding finding.

**Headlines.** The ten stated theorems are true on the instances below. Missing statable headlines are R06. The type-A Schur character identity is `character_irreducible_eq_detTwist` in main's `ClassicalGroups/Suggested.lean:215` and is correctly not restated.

**Library declarations opened at the pin (38).** Those cited in R02–R08, plus `TauCeti/Algebra/Lie/Weights/WeightLattice.lean:100` (`coweightPairing` is `Function.invFun Int.cast` of `λ(α∨)`: a junk value off the integral lattice, harmless under `IsDominantIntegral`), `Presentation/Serre.lean:601`, `Presentation/Serre/Killing.lean:216`, `HighestWeight/Dual.lean:92,142,156,169`, `AlbertAlgebra/Determinant.lean:152,310`, `Algebra/Lie/E8/Vinberg.lean` (module dimension 248 only, no bracket), `GeneralLinear/DiagonalCartan.lean:97,198`, `GeneralLinear/CompleteReducibility.lean:62`. A scan of 341 backticked names found none absent from both pins except notation and the ClassicalGroups name above.

**Cross-roadmap citations resolved.** LieGroups (main) lines 629, 636, 789, 795, 1432; ConvexityToric (main) Conventions and T1 for the period lattice `(2π)⁻¹ker(exp)`; ClassicalGroups (main) `Suggested.lean:215`; AdoIwasawa (same family, main) lines 94, 228 for the PBW ownership sentence; LieHighestWeightPartII is in the merge order. Overlap lead: #1797 conflicts in both files; the generated `merge-order` block orders #1797 before this pull request, so no finding. The five closest open roadmaps were not re-read this round beyond ClassicalGroups; the previous review's reading of their scopes is not re-certified here.

**Sources (14 sampled subsections).** Etingof's 18.755 notes were read in the MIT edition the README cites (PDF page = printed + 1); Etingof's *Representations of Lie Groups* in arXiv v2 (PDF = printed); Garnier's printed pages (figures occupy unnumbered PDF pages).

| Sample | Read at | Result |
| --- | --- | --- |
| 0.1 | Etingof Thm 11.16 (line 2459, p. 66), Thm 11.18 (line 2540, p. 68) | Locators exact; norms are the roadmap's derivation, recomputed below |
| 3.1 | Gutt, Lecture 1, slide 14/28 (lines 924–947) | Positive bracket `⟨ξ,[X,Y]⟩` and averaged symmetrization: supports the convention only, as stated |
| 3.2 | same slide; formulas derived | Recomputed below |
| 5.1 | Etingof Ex. 32.13, Prop. 32.14 (lines 6640–6658, pp. 176–177); *Representations* §17.2 (line 3469, p. 81) | Exact; source is for simple `g`, README says so and extends componentwise |
| 5.2 | Woit Thm 1 (line 94, p. 3), Thm 2 (line 192, p. 5) | Exact |
| 6.1 | Etingof Prop. 30.4 (line 5898, p. 159), Cor. 30.5 (line 5930, p. 160) | Pages exact; content is minuscule-only → R10 |
| 6.2 | Etingof Prop. 26.3 (line 5127, p. 139), Thm 26.4 (line 5134, p. 140) | Exact: these are the Weyl denominator and character formula |
| 7.1 | *Representations* Thm 10.1 (line 2153, p. 51), Rem. 10.2 (p. 52), Thm 13.5 (line 2987, p. 69), Thm 14.1 (line 3041, pp. 70–71); Etingof Thm 24.2, Lemma 24.3 (lines 4763, 4784, p. 130) | Exact; Thm 24.2 is more general than the headline → R08 |
| 7.2 | Thm 14.1(iv) (line 3058, p. 71), Rem. 10.2(1) | Exact |
| 9.1 | no locator in the subsection | R10 |
| 9.2, 9.3 | *Representations* Thm 13.5, Thm 14.1(iv)–(v), Ex. 10.3 (line 2213, pp. 52–53) | Exact; Dixmier §1.6 not readable |
| 10.1 | Garnier Thm 1.3.2 (line 231) and 1.3.5 (line 276), p. 5; Prop.-Def. 2.2.1 (line 389, p. 8); Cor. 2.2.7 (line 642, p. 10); Prop. 2.3.1 (line 1161, pp. 16–17) | Exact |
| 10.2 | Etingof Thm 43.4, Cor. 43.5 (lines 8808, 8829, p. 231), Cor. 43.6 (line 8845, p. 232) | Exact |

Also read for Layer 8: Schafer lines 1022 (p. 28), 1438–1455 (pp. 40–41), 1461 (p. 41); Baez Theorems 4–7 (lines 1687, 1856, 2040, 2122; pp. 37, 41, 46, 48); Garibaldi Example 4.4 (line 382, p. 9). All exact.

**Adversarial table.** Values computed for this review.

| Statement | Instance | Values | Result |
| --- | --- | --- | --- |
| `exists_polynomialSymmetric` | d=2, i=1; d=0; i=d | tensor `e₁e₀ ↦ X₀X₁`; empty tensor ↦ 1; exponent `d−i = 0` | holds; `Fin (d+1)` prevents underflow |
| 0.1 norm of `v_r` | (m,n,r) = (2,2,1), (2,2,2), (1,1,1) | sum 1/2+1/2 = 1, formula 24/24; 1+1+1 = 3, 12/4; 1+1 = 2, 2/1 | agree |
| 0.1 lowering norms and ladder | m=n=1, r=0, N=2 | `‖Fv‖² = 2 = 1!·2!/1!`; `‖F²v‖² = 4 = 2!·2!/0!`; `E F v = 2v = 1·(2−1+1)v` | agree |
| 0.1 item 5 | general n≥2 | `F²w₁ = 2A+4nB+n(n−1)C` by two Leibniz steps; Gram `1, 1/(2n), 2/(n(n−1))`; inner products `2−4+2`, `2+2(n−2)−2(n−1)`, `1−(n−2)/n−2/n` | all 0 |
| `module_finite_of_central_monic_relations` | `L = Kx`, `R = K[x²]`; `R = K`; `L = 0` | span `{1,x}`; no monic relation, `U = K[x]` infinite; `U = K` | holds; hypothesis needed |
| `exists_pbwSymmetrization` | word `xy`, `[x,y] = y` | `(xy+yx)/2 = yx + y/2`; `e(⁅x, y⁆)= y = xy − yx` | holds; not multiplicative |
| 3.1 Rees | `[x,y] = y`; sl₂ | `t²ι(y) = t·j(y)`; `j(h)²+2ħj(h)+4j(f)j(e) = t²Ω` central | agree with pin |
| 3.1 evaluation identity | ξ(x)=2, ξ(y)=3 | `{x,y}` ↦ 3; `{x²,y}` ↦ 2·2·3 = 12 | agree |
| 3.2 | b=c=1; `B_sym(x,y)` | `XY = Y(X+ħ) = YX+ħY`; `y + 0 + 0 − y/2 = y/2` | agree |
| `invariantForm_isSymm_iff_tits_sign` | sl₂ `V(1)`, `V(2)`; A₂ adjoint; C₂ standard; `L = 0` | sums 1, 2; 1+1+2 = 4; 1+1+1+0 = 3; empty sum 0 | skew, sym, sym (Killing), skew (symplectic), sym; both halves consistent since `1 ≠ −1` in `ℤˣ` |
| 5.1 indicator | SU(2) standard; circle `z` | −1; `∫z² = 0` | agree |
| 5.2 | λ=(1,0), n=2 | `N_λ = t₁ − t₂²/t₁`; `D·P = t₁+t₂−t₂−t₂²/t₁` | agree |
| 5.2 stable tensor | λ=(2,0), μ=(1,0); λ=(0,0) | 3·2 = 4+2; translate (0,1) not dominant | weak inequality right |
| 5.2 branching | λ=(2,1,0) | 2+1+3+2 = 8 | agree |
| 6.2 | λ=(1,0), t=(2,3) | −4 + 9 = 5 = 2+3 | agree |
| 7.1 translation, HC | A₁ | `τ_(−ρ)(h²+2h) = h²−1`; `χ₂(Ω) = 8 = χ₋₄(Ω)` | agree |
| 7.1 orbit separation Check | `(h²−1)/3` | 0 at ±1, 1 at ±2; shifted: 0, 0 on {0,−2}; wrong shift: 0 and 8/3 | agree |
| 7.1 Killing transport | sl₂ | `κ(h−2e, f) = −2·4 = −8` | agree |
| `serreLift_injective_of_base` | sl₂ × sl₂; transpose on B₃ not recomputed | 6 = 6 | holds without simplicity → R08 |
| `octonionSerreLift_injective`, F₄ | dimensions | 2+12 = 14; 4+48 = 52; `Der` dims 14 and 52 at the pin | consistent |
| `finrank_e8`, `finrank_e6_e7` | rank + roots | 8+240 = 248 = 80+84+84; 6+72 = 78 = 52+26; 7+126 = 133 = 78+1+27+27 | consistent |
| 8 Albert Checks | diag(1,2,3); `E₀₀`; unit; (3,1,1) with `x₁ = 1` | (216−252+72)/6 = 6; (1−3+2)/6 = 0; (27−27+6)/6 = 1; 3−1 = 2 | agree |
| 8 derivation Check | `D = [L_A, L_B]`, `A = E₀₀`, `B = E₀₁+E₁₀` | `A∘(B∘A) − B∘(A∘A) = B/4 − B/2 = −B/4` | agree |
| 9.1 LR | λ=μ=(1), n=2, 1 | 1, 1; `(x+y)² = (x²+xy+y²)+xy`; `x² = x²+0` | agree |
| 9.3 Casimir | gl₂, μ=(3/2,1/2); staircase | 15/4 − 1/4 = 7/2; difference `(−3N+3+4t) − (−3N+3+4s) = 4(t−s)` | agree |
| `exists_productCenterEquiv` | `Z = Kz`, `S = sl₂`; `Z = S = 0` | `K[z]⊗K[Ω]`, `z ↦ z⊗1`; `K ≃ K⊗K` | holds over any field |
| Worked CAR example | N=2 | `ΣF_ii = (2+2)/2 = 2 = N²/2`; 16 = 8·2 | agree; native → R05 |
| 10.1 | A₁ | orbit of 2/3 under `x ↦ ±x+2k` meets [0,1] in 2/3; with `P∨`: 2/3 ~ 1/3 | agree |
| 10.2 | SU(2), SO(3) | centre 2, `Ω_Y` 1; centre 1, `Ω_Y` 2 | agree |
| gap witness | U(1), `z ↦ z⁻¹` at 2 | 1/2 against 2 for conjugation | right witness |

## Not verifiable

- `HumphreysIntroLieAlgebras`, `BourbakiLie78`, `GoodmanWallachSymmetry`: settled uncertified; their locators (Humphreys §20.3 at `README.md:1003`, the References entries) were not read.
- Dixmier §1.6, Serre, Fulton–Harris, Jantzen, Molev, Humphreys' category O: cited in References and §9.3 without a readable legal text on this worker; not requested again.
- Ownership against the open pull requests other than #1797 and ClassicalGroups #1192 was not re-checked this round.
- The LR headline of R06 and the completeness of the native-duplication list of R05 were not established by elaboration; both are marked as such in the findings.

## Source issues

- none
