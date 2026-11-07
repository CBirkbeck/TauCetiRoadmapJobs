# Review of QuiverRepresentations (pull request #1526 at 9044327)
Folder: `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/`

**Verdict:** needs changes

One P1 (the worker's gate fails its build counter on lake's `module` advisory; elaboration itself is clean), one P2 (Layer 6 plans three objects that the ArtinAlgebras roadmap on main already plans and claims at greater generality), and four P3. README and Suggested.lean below are the two files of the folder above. Library paths beginning `TauCeti/` and `Mathlib/` are at the pins `2fd255d997f47c0b5d834ee416c7015d55444ce5` and `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` of the pull request's `lake-manifest.json` (both pins moved since the previous review, which read Tau Ceti `a91d3aa`; every native citation below was re-resolved at the new pin).

## Previous findings, checked first

The previous review (at `0cb3918`) had one finding.

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01 (P3): the SimpleBasis supplier path lacked the `RepresentationTheory/` prefix | README:227–228: “`TauCeti.isExhaustiveSimpleFamily_vertexSimpleModuleFG` in `RepresentationTheory/GrothendieckGroup/Quiver/SimpleBasis.lean`” | **Repaired.** `TauCeti/RepresentationTheory/GrothendieckGroup/Quiver/SimpleBasis.lean` exists at the pin and declares that theorem (line 77). |

The folder changed by 449 lines since that head (the merge with main and the author's own rewrite of Layer 6 as consumption of the pinned Auslander–Reiten theory, with six admitted theorems deleted from Suggested.lean), so this is a full review.

## R01 (P1) — The push gate fails its build counter on this head

**Location:** `scratch/gate.md` for `9044327`: `build=2 FAIL`; both lines are lake's advisory “imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file” on Suggested.lean:1.

**Claim:** the gate passes at this head.

**Witness:** the gate summary line ends `build=2 FAIL`. Independently, `lake env lean` on Suggested.lean exits 0 with exactly five `declaration uses sorry` warnings (lines 51, 67, 75, 88, 117) and no error: the Lean content is sound; only the gate's build counter fails, and the brief makes a failed build a P1 with no acceptance while it fails.

**Repair (tested):** make `module` the first line of Suggested.lean, before `import Mathlib`, and change nothing else. A scratch copy in that form elaborates under `lake env lean` with the same five sorry warnings and exit 0 (the imported Tau Ceti modules are themselves in module form at this pin, so plain imports suffice; no `public section` is needed because the file exports nothing).

## R02 (P2) — Layer 6 plans three objects owned by ArtinAlgebras on main

**Location:** README:789–798 (“Prove `exists_stable_translate_equivalence`: … an equivalence from the projective stable category to the injective stable category … its inverse is Tr D”), README:832–835 (“Prove the companion formula: D Ext¹ₐ(M,N) is k-linearly isomorphic to Homₐ(Tr D N, M) modulo maps through projectives”), README:893–907 (“Prove the valued mesh. … D_X the residue division ring of End(X). Then Irr(X,M) … and Irr(τM,X) … both have dimension μ over D_X”), and Suggested.lean:104–127 (`projectiveFactorIdeal`, `injectiveFactorIdeal`, `exists_stable_translate_equivalence`).

**Claim:** these three are this roadmap's targets.

**Witness:** `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/README.md` on main (merged 2026-11-05, commit `e28fb09c`) owns all three for Artin algebras over a commutative Artinian ring, and says the field case is its specialisation: §4.2, lines 827–830, “`D_R` induces an anti-equivalence between the projective stable category of `mod Aᵐᵒᵖ` and the injective stable category of `mod A`. Composed with `TauCeti.stableTransposeEquivalence` it gives the equivalence `τ : E/[P] ≌ E/[I]`”; §4.2, lines 832–834, both Auslander–Reiten formulas, including `Ext¹_A(M, N) ≅ D_R (Hom_A(τ⁻ N, M) modulo maps factoring through projectives)` as natural isomorphisms; §5.1, lines 892–899, the division-ring bimodule structure on `TauCeti.irreducibleMorphismSpace` and the valuations; §5.3, lines 943–947, the multiplicities `b_{WZ} = a_{τZ,W}` of the middle term and the mesh. Its scope (lines 54–60) states that QuiverRepresentations Layer 6 “develops Auslander–Reiten theory for a finite-dimensional algebra over a field. Layers 0 and 3 to 5 here state the same theory for Artin algebras … and the general constructions **replace** the field ones: the field declarations are the case `R = k` … No parallel construction is kept.” A roadmap on main that states an object must be cited, not restated; the previous review could not see this, because ArtinAlgebras was then an open pull request whose files were not supplied. (StablePeriodicCurved on main, Layer 0, line 184, also owns the generic stable category as the quotient by the factoring ideal; the two `*FactorIdeal` definitions exist only to state the deleted headline.)

**Repair (tested for direction):** state the deferral once, under Scope and ownership, after the GrothendieckEulerForms sentence at README:61: “ArtinAlgebras §4.2 and §§5.1–5.3 own the stable equivalence τ : E/[P] ≌ E/[I], both Auslander–Reiten formulas and the valued Auslander–Reiten quiver with its mesh for Artin algebras; the field case is their case R = k and is not planned here.” A copy of the README with exactly that sentence passes the dependency check (`depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`), and ArtinAlgebras lists this roadmap among its own suppliers (its line 224), so a `*Needs:*` edge to it must not be added. Then delete the three targets: in §6.1 the paragraph at 789–798 from “Prove `exists_stable_translate_equivalence`” on, the “API for the translate” list (800–806) and the Needs items “the stable transpose equivalence, stable transpose on maps, categorical factoring ideals and quotient categories”, keeping the factoring-ideal Checks only if they are reworded as Checks of the pinned `ModuleCat.arTranslate` and `TauCeti.ExactStructure.InjectiveStableCategory`; in §6.2 the paragraph 832–835 and the fourth Check (843–844); in §6.4 the paragraph 893–897, the “API for the valued mesh” list (899–907) and the ℂ[ε]/(ε²) Check (916–918). Delete `projectiveFactorIdeal`, `injectiveFactorIdeal` and `exists_stable_translate_equivalence` from Suggested.lean together with the three imports only they use (`TauCeti.Algebra.Module.AuslanderReiten.Translate`, `…MorphismIdeal.FactorThrough`, `…MorphismIdeal.Additive`), and say in the module docstring that the Layer 6 headlines are owned by ArtinAlgebras. Update the Summary (README:8–10), “How to read the build” (338–341), the Layer 6 Dependencies (930–932) and the Downstream consumers accordingly. A scratch copy of Suggested.lean with those deletions (and the R04 rename) elaborates: see Verified sound.

## R03 (P3) — Ids this pull request drops are cited by ArtinAlgebras on main, with no old → new numbering

**Location:** main's README of this roadmap, lines 389–392 (“(6A) the radical … (6B) minimal projective/injective presentations; (6C) the transpose `Tr` and stable equivalence; (6D) the AR translate … (6E) existence and uniqueness of almost-split sequences; (6F) the AR quiver”) and line 411 (“`arQuiver k A`”); this head has §§6.1–6.4 and no `arQuiver`.

**Claim:** no other roadmap cites the dropped ids (the overlaps tool reported none; the sublayer labels are prose, not headings, so it does not see them).

**Witness:** `TauCetiRoadmap/RepresentationTheory/ArtinAlgebras/README.md` on main cites “Layer 6 (sublayers 6A-6F)” at line 54, “`arQuiver k A` (6F)” at lines 60 and 950, “QuiverRepresentations 6E” at line 859, and “Layer 6 (6A-6F)” at lines 224 and 1239–1241. Those citations break when this pull request merges.

**Repair:** add one line per moved id to the README, in Scope and ownership or at the head of Layer 6: 6A → §6.4 (irreducible morphisms, now the pinned `TauCeti.irreducibleMorphismSpace`), 6B → §3.1, 6C → §6.1, 6D → §§6.1–6.2, 6E → §6.3, 6F → §6.4, and `arQuiver k A` → the pinned `TauCeti.IrreducibleMorphismQuiver` with `ModuleCat.arTranslation`.

## R04 (P3) — Gate statement-hygiene: `homDifferential_coker_equiv_ext` concludes `Nonempty (… ≃ₗ[k] …)`

**Location:** Suggested.lean:75–81; `scratch/gate.md` statement-hygiene line 78.

**Claim:** the theorem states the comparison of the Hom-differential cokernel with Ext¹.

**Witness:** the conclusion is `Nonempty (HomArrow M N ⧸ range (homDifferential M N) ≃ₗ[k] Ext (F M) (F N) 1)`, an unmarked isomorphism: it is satisfied by any k-linear bijection, so it says only that the two k-vector spaces have the same dimension, and the README's “compatibility with the class of a short exact extension” (604) is not in the statement. The gate names the repair.

**Repair:** rename the theorem `nonempty_homDifferential_coker_linearEquiv_ext` in Suggested.lean and at README:603 and 610 (the gate's accepted form; a scratch copy with the rename elaborates, see Verified sound). The stronger form, the canonical map from the cokernel to Ext¹ and `Function.Bijective` of it, needs the extension class of a cocycle as a definition; if the author states it, the pinned `LinearMap.homCocycleQuotientEquivExt` (R05) is the map to compose with.

## R05 (P3) — §4.1 restates two pinned ingredients instead of citing them

**Location:** README:589–592 (“construct the natural two-term projective resolution of an arbitrary representation M … Prove exactness, projectivity and naturality”) and 603 (“identifying its cokernel k-linearly with native Ext¹”); the From Tau Ceti contracts name neither object.

**Claim:** the resolution and the Ext¹ identification are new work of this layer.

**Witness:** `TauCeti/RepresentationTheory/Quiver/PathAlgebra/BimoduleResolution.lean` (variables at lines 113 and 126: any commutative ring k, `[Finite Q]`) proves the standard bimodule resolution `0 → ⨁_{b:i→j} A eⱼ ⊗ eᵢ A → ⨁_v A e_v ⊗ e_v A → A → 0` exact with projective terms: `TauCeti.PathAlgebra.arrowTensorDifferential_injective`, `exact_arrowTensorDifferential_vertexTensorMul`, `vertexTensorMul_surjective` and the two `Module.Projective Aᵉ` instances. Tensoring it over A with M gives exactly the resolution of 589–591 (the sequence is split exact as right A-modules since A is right projective, so exactness survives), and its differential is the arrow difference of 591–592. `LinearMap.homCocycleQuotientEquivExt` in `TauCeti/Algebra/Category/ModuleCat/HomCocycle.lean:51` identifies, for any `f : P₁ → P₀` with `P₀` projective and any module N, the Hom cocycles modulo coboundaries with `Ext¹(P₀ ⧸ range f, N)` k-linearly.

**Repair:** add both to the From Tau Ceti contracts and to §4.1's Needs, and state the remaining target as: the tensored bimodule resolution is the vertex/arrow resolution (with naturality in M), and its Hom cocycle quotient is the cokernel of the Hom differential; the Ext¹ comparison is then the pinned equivalence composed with that identification, and heredity is projectivity of the two terms.

## R06 (P3) — Manifest-status wording in the References

**Location:** README:952: “ARS is cited by locator only (uncertified).”

**Claim:** the ARS text was not read.

**Witness:** the institutional copy linked on the next line is readable; this review read II.2.6, II.3.3, II.4.1, II.4.6, IV.4.1, IV.4.6, V.1.14–1.15, VII.1.3 and VII.1.5 from it (lines in the sample table). “Uncertified” is a manifest status, not a mathematical statement, and the README is timeless prose.

**Repair:** delete the sentence.

## Verified sound

The review covers all 959 README lines and all 129 Lean lines, the family index (unchanged from main: the prescribed diff outside the folder and the family files is empty), the change set since `0cb3918`, the root README's checklist and CONTRIBUTING, and ArtinAlgebras, StablePeriodicCurved, SemisimpleAlgebras, RootSystems and GrothendieckEulerForms on main. No pull-request file was changed; git status stayed clean.

### Gate, elaboration, signatures, padding

- The worker's gate at `9044327`: every scanner counter 0 except `statement-hygiene=1` (R04) and `build=2` (R01); `depcheck=0`, `outside-folder=0`, `stray-files=0`.
- `lake env lean` on Suggested.lean: exit 0, five `sorry` warnings, nothing else. The `module`-form copy (R01) and the copy with the R02 deletions and R04 rename elaborate the same way (sorry warnings only, exit 0): the latter in `module` form, four sorry warnings at its lines 49, 65, 73 and 86, exit 0.
- The worker's `#check @name` file for all 7 declarations (`scratch/signatures/SignatureCheck.lean`) was re-elaborated here: exit 0, seven elaborated types printed. Each elaborated type was compared with its README statement: `exists_admissible_presentation` carries `[IsAlgClosed k]`, `[FiniteDimensional k A]` and `IsBasic A` (README:514–515); `pathAlgebra_higher_ext_vanish` and the Ext comparison carry `[Fintype Q]`, `[∀ i j, Fintype (i ⟶ j)]` and no acyclicity, with arbitrary modules and arbitrary vertex spaces (README:589, 604); `exists_rootPairing_titsForm` carries `[Nonempty Q]`, connectedness and `PosDef` on small types (README:107, 711); `exists_stable_translate_equivalence` carries `[FiniteDimensional k A]` and the minimal-presentation hypothesis (README:750, 789). No section binder was lost (the worker's `signatures.md` agrees).
- Padding probe: on scratch copies every admitted theorem was tried with `simp`, `rfl` and `infer_instance` separately; all 15 attempts fail (unsolved goals, `rfl` not a relation, `failed to synthesize`). No declaration restates a definition, mirrors a Check or computes a value; the two definitions have real bodies on the pinned `CategoryTheory.ObjectProperty.factorIdeal`.
- README and Lean agree on names: all seven Lean names appear in the README (514, 593, 603, 711, 752–753, 789) and no other backticked name of this roadmap's own occurs.

### Headline theorems

| Headline (README Summary, 5–10) | Status |
|---|---|
| Ext-quiver form of Gabriel's presentation | `exists_admissible_presentation`, Lean:51; the pinned `TauCeti.IsBasic.exists_surjective_pathAlgebra_isAdmissibleIdeal_ker` (Presentation.lean:182) gives only the surjection, and that file's implementation note says the simple identification and Ext¹ arrow counts are not stated there |
| Heredity of every finite path algebra | `pathAlgebra_higher_ext_vanish`, Lean:67; no `hereditary` declaration exists in the pinned quiver, Auslander–Reiten or Grothendieck-group directories; the pinned `hasProjectiveDimensionLT_two_pathAlgebra` is the finite-length acyclic case |
| Hom differential cokernel = Ext¹ | Lean:75 (R04 rename); ingredients pinned (R05) but the composite is not |
| Marked rational root system | `exists_rootPairing_titsForm`, Lean:88; no `RootPairing` occurs in the pinned quiver directories |
| Stable translate equivalence | Lean:117; owned by ArtinAlgebras §4.2 (R02) |
| Companion duality formula, valued mesh | prose only; owned by ArtinAlgebras §4.2 and §§5.1–5.3 (R02) |
| ADE correspondence, AR duality, almost-split existence, AR quiver and k-mesh | consumed from the pin; declarations resolved below |

### Sources: all 14 seeded targets

Cache ids: ASS `300fff0a…` (pdf page = printed + 11), ARS `d30323e7…` (+14), BGP `00416aa1…` (−16), Etingof v5 `30325e11…` (0). All four are the legal copies the README links; none was unreadable. ASS's standing algebraically closed convention is at `ass line 302` (README:99).

| Target | Locator read | Support |
|---|---|---|
| 0.1 | ASS II.1.2 p.43 `ass line 2302`; II.1.4 p.45 `line 2394` (unit iff finite vertices, finite-dimensional iff finite acyclic); II.1.8 p.48 `line 2524` | as stated |
| 1.1 | ASS III.1.6 p.72 `line 3897`, unbound corollary p.74 `line 4014`; III.2.4 p.79 `line 4322`; III.2.6 p.81 `line 4445` | as stated; the README's full dual avoids the source errors below |
| 2.1 | ASS I.4.8 p.22 `line 1321`; I.4.10 pp.23–24 `line 1370` | as stated, multiset uniqueness |
| 3.1 | ASS I.5.12 `line 1747`, I.5.13(d) `line 1774`, I.5.14 `line 1779`, I.5.15 `line 1790`, I.5.16 `line 1802` (pp.30–32); I.6.3 p.33 `line 1893`; I.6.10 p.37 `line 2044`; ARS II.2.6 p.36 `ars line 1682`, II.3.3 p.38 `line 1760`, II.4.1 p.40 `line 1805`, II.4.6 p.42 `line 1893` | as stated |
| 3.2 | ASS II.2.1 p.53 `line 2782`; II.3.7 p.64 `line 3404`; III.2.12 pp.84–85 `line 4621`, `line 4626` (Ext¹(S(a),S(b)) ≅ e_a(rad/rad²)e_b, arrows a→b = dim Ext¹) | the source's right-module corner (a,b) becomes the left-module corner (b,a), consistent with README:529 and the pinned quiver |
| 3.3 | ASS III.3.7 `line 4822`, 3.8 `line 4848`, 3.10 `line 4891`, 3.11 `line 4912`, 3.13 p.91 `line 4958` | as stated; row/column transposition explicit |
| 4.1 | ASS VII.1.4 p.245 `line 12128`; VII.1.7(a) p.248 `line 12279`; III.3.13 `line 4958` | the source states the finite acyclic case; the README says so and the general case is a target |
| 4.2 | BGP Theorem 1.1 pp.21–22 `bgp line 173`; Etingof v5 Def. 5.26–5.27 pp.90 `etingof line 4007`, `line 4021` | as stated |
| 5.1 | BGP Lemma 2.3 p.28 `line 430`; Theorem 3.1 p.28 `line 447`; Note 1 p.30 `line 527`; Etingof Thm 5.23 p.89 `line 3991` | as stated; BGP's footnote `line 502` handles finite fields separately, and the pinned `isFiniteRepType_iff_titsForm_posDef` is the authority |
| 5.2 | BGP Lemma 2.2 p.27 `line 407`; Etingof Def. 5.20, Rem. 5.21 p.89 `line 3977`, `line 3980` | as stated |
| 6.1 | ASS IV.2 pp.109–110 `line 5909`, `line 5927`; IV.2.10 p.116 `line 6267`; IV.2.11 `line 6283` | as stated (ownership: R02) |
| 6.2 | ASS IV.2.13 pp.117–118 `line 6331`, `line 6336`; ARS IV.4.1 p.129 `line 4992`; IV.4.6 p.131 (after 4.5 at `line 5063`) | as stated |
| 6.3 | ASS IV.1.11–1.13 pp.104–105 `line 5692`–`line 5723`; IV.3.1 p.120 `line 6441`; ARS V.1.14 p.144 `line 5511`, V.1.15 p.145 `line 5541` | as stated |
| 6.4 | ASS IV.4.1 p.125 `line 6725`; IV.4.2 p.126 `line 6735` (algebraically closed used at `line 6797`); IV.4.4 p.128 `line 6867`, `line 6903`; ARS VII.1.3 p.230 `ars line 8657`, VII.1.5 p.231 `line 8703` | as stated (ownership: R02) |

Also read: Etingof Example 1.19 p.9 `line 322` (README:735).

### Adversarial mathematics: computed values

A₂ is 1 → 2 with arrow a; left modules, later-factor-first multiplication; S₁ = (k,0), S₂ = (0,k), P₁ = (k → k, id), P₂ = S₂, I₁ = S₁, I₂ ≅ P₁. T = k[ε]/(ε²), U = T/(ε). Dimensions over k.

| Statement | Instances | Values on each side (wrong model in brackets) | Result | Change |
|---|---|---|---|---|
| 0.1 multiplication | A₂ | e₂a = a = ae₁; e₁a = ae₂ = a² = 0 [pointwise coefficient product: e₂a = 0] | pass | none |
| 0.1 unit, dimension | ∅, A₁, A₂, loop | paths 0, 1, 3, ∞; 1 = 0 in the empty algebra; loop basis 1, X, X², … | pass | none |
| 1.1 elementary modules | A₂ | P₁ = span{e₁,a} vector (1,1); P₂ (0,1); I₁ = D(e₁A) = D span{e₁} (1,0); I₂ = D span{e₂,a} (1,1); regular (1,2), total 3 [reversed paths swap P and I] | pass | none |
| 1.1 cover | A₁; loop | id : k → k kernel 0; k[X] → k at 0: (X−1) proper, image k, not superfluous | pass | none |
| 2.1 decomposition | 0, k, k², T | summands 0,1,2,1; End T = T local, ε nilpotent nonzero noninvertible | pass | none |
| 3.1 duality exchange | T | cover T → U dualises to U → D T ≅ T, 1 ↦ ε; ideals of T are 0, kε, T so kε is essential; kernel of cover and socle both dimension 1 | pass | none |
| 3.1 Morita | M₂(k), e = E₁₁; k×k; A₂ | M₂(k)E₁₁M₂(k) = M₂(k), eAe = k; M₂(k)/rad not reduced (E₁₂² = 0 ≠ E₁₂); k×k basic; End(P₁) = e₁Ae₁ dim 1 ≠ 3 = dim A | pass | none |
| 3.2 admissibility | T = k[X]/(X²) | J = (X), I = (X²) = J², N = 2; Jac(k[X]) = 0 so I ⊄ Jac² [Jacobson reading fails] | pass | none |
| 3.2 Ext-quiver direction | A₂ | 0 → S₂ → P₁ → S₁ → 0 nonsplit: dim Ext¹(S₁,S₂) = 1, Ext¹(S₂,S₁) = 0 (S₂ projective); arrows 1→2: 1, 2→1: 0; a = e₂ae₁ lies in the (2,1)-corner used by the pinned proof [arrows j→i: 0 ≠ 1] | pass | none |
| 3.2 zero algebra | A = 0 | IsBasic 0 holds (0/Jac = 0 semisimple, reduced); Q = ∅, kQ = 0, ker = ⊤ = ⊥ admissible, no simples: all clauses vacuous and true | pass | none |
| 3.2 algebraic closedness | ℂ over ℝ | basic, one simple with End of ℝ-dimension 2; any ℝQ/I with one vertex and radical 0 is ℝ, dimension 1 | pass, excluded by `[IsAlgClosed k]` | none |
| 3.2 restriction and uniqueness | A₂; k×k | vertex simples pairwise non-isomorphic (e_i acts by 1 on S_i, 0 on S_j); arrows act by 0 on simples, so restrictScalars gives the vertex simple; simple counts 2, 2 = vertex counts | pass | none |
| 3.3 matrices | A₁; A₂; k×k | A₁: C = E = [1], B = [2]; A₂: C = [[1,1],[0,1]], E = [[1,−1],[0,1]], CE = EC = I, B = [[2,−1],[−1,2]]; k×k: C = E = I, B = 2I | pass | none |
| 4.1 heredity | loop; T; ∅; n = 2 | k[X] PID: Ext² = 0; T: Ext²_T(U,U) = k ≠ 0 but T is not a path algebra, so outside the statement; empty quiver: zero ring, Ext = 0 | pass | none |
| 4.1 Ext comparison | A₂ (S₁,S₂) and (S₂,S₁); loop (k_λ,k_μ) | HomVertex = 0, HomArrow = Hom(k,k) = k, coker k = Ext¹(S₁,S₂); reversed: HomArrow = 0 = Ext¹(S₂,S₁); loop: differential x ↦ (μ−λ)x, coker dimension 1 iff λ = μ, equal to Ext¹_{k[X]}(k_λ,k_μ); Euler 0 = 1−1 = 0−0 | pass | R04 (form of the statement) |
| 4.2 sink reflection | A₂, sink 2 | S₁ = (k→0): kernel k, image (k ← k, id), (1,0) ↦ (1,1); P₁: kernel 0, (k ← 0), (1,1) ↦ (1,0); S₂ ↦ 0; s₂(a,b) = (a, a−b) matches; (0,1) ↦ (0,−1) [s₁(a,b) = (b−a,b) sends (1,0) ↦ (−1,0)] | pass: the pull request's correction is right | none |
| 4.2 Coxeter | A₂, order [2,1] | s₁s₂(1,0) = s₁(1,1) = (0,1) = dim S₂ | pass | none |
| 5.1 roots | A₂; D₄ | q(a,b) = a²+b²−ab: nonnegative solutions of q = 1 are (1,0),(0,1),(1,1); D₄: q(1;1,1,1) = 1+3−3 = 1, q(2;1,1,1) = 4+3−6 = 1; 3 + 8 + 1 = 12 positive roots | pass | none |
| 5.1 height rise | D₄, sink = centre | s_c(1;1,1,1) = (3−1;1,1,1) = (2;1,1,1): height 4 → 5, q stays 1 | pass | none |
| 5.2 Cartan entries | A₁; A₂; loop | B(eᵢ,eⱼ) = 2δᵢⱼ − #(i→j) − #(j→i): A₁ [2]; A₂ [[2,−1],[−1,2]]; a loop at i gives q(eᵢ) = 0, so PosDef excludes loops and every diagonal entry is 2 | pass | none |
| 5.2 pairing convention | simply laced | pairing(i,j) = 2B(eᵢ,eⱼ)/B(eⱼ,eⱼ) = B(eᵢ,eⱼ) since B(eⱼ,eⱼ) = 2q(eⱼ) = 2; symmetric, so Mathlib's row/column order is immaterial | pass | none |
| 5.2 root set | A₂; Kronecker; 3 arrows; 2d | q(1,−1) = 3 ≠ 1; Kronecker q(1,1) = 0 and three arrows q(1,1) = −1 fail PosDef; q(2d) = 4q(d) ≠ 1 so reduced; zero vector excluded by d ≠ 0 | pass | none |
| 5.2 hypotheses | ∅; A₁ ⊔ A₁ | empty Q: Nontrivial (Q → ℚ) fails, excluded by `[Nonempty Q]`; disconnected: root system reducible, excluded by `hconn` | pass | none |
| 6.1 stable categories | A = k; A₂ | k: all objects zero in both quotients; A₂: id P₁ = 0 and id S₁ ≠ 0 in the projective quotient; id S₁ = 0 (S₁ = I₁) and id S₂ ≠ 0 (I₂ ≠ S₂) in the injective quotient | pass | R02 (ownership) |
| 6.1 translate | A₂; T; A = k | τS₁: presentation P₂ → P₁ → S₁, Tr S₁ = e₂A/aA = right simple at 2, D of it = S₂; τP₁ = τS₂ = 0; T: Tr U = T/εT = k, τU ≅ U; A = k: presentation 0 → M → M, τ = 0 | pass | R02 |
| 6.2 duality | A₂ (S₁,S₂); T (U,U) | dim Ext¹(S₁,S₂) = 1; Hom(S₂,τS₁ = S₂) = k, maps through I₂ ≅ P₁ vanish since Hom(P₁,S₂) = e₁S₂ = 0: costable dimension 1; T: both sides 1, every U → T → U is zero | pass | none |
| 6.3 almost split | A₂; T | 0 → S₂ → P₁ → S₁ → 0 nonsplit, τS₁ = S₂; projective S₂ ends none (pinned iff); T: 0 → U → T → U → 0, dimensions 1, 2, 1, nonsplit since T is indecomposable | pass | none |
| 6.4 mesh | A₂; T; ℂ[ε]/(ε²) over ℝ | Irr(S₂,P₁) = Irr(P₁,S₁) = k, Irr(S₂,S₁) = 0; at M = S₁, X = P₁: one arrow X → M and one τM → X; T: ε factors through U so no loop at T; ℂ[ε]: Irr dimension 1 over ℂ, 2 over ℝ, μ = 1 | pass | R02 |
| Conventions: finiteness | loop regular module; 0 | k[X] cyclic over k[X], infinite over k, finrank 0 by `Module.finrank_of_not_finite`; zero module finite over both | pass | none |
| `exists_stable_translate_equivalence` degenerate | A = k | E between two zero categories; T = 0 ≅ D Tr 0; clause holds | pass | R02 |

### Library declarations opened at the pins

Tau Ceti (file:line): `pathAlgebra`, `pathAlgebraBasis`, `PathAlgebra.adjoin_vertexIdempotents_union_arrows` (`RepresentationTheory/Quiver/PathAlgebra/Basic.lean`); `arrowIdeal` (`Quiver/Radical.lean:259`); `IsAdmissibleIdeal` (`AdmissibleIdeal/Basic.lean:102`: `∃ N, arrowIdeal^N ≤ I` and `I ≤ arrowIdeal^2`); `IsBasic` (`RingTheory/Semisimple/BasicAlgebra.lean:191`: semisimple and reduced radical quotient); `IsBasic.exists_surjective_pathAlgebra_isAdmissibleIdeal_ker` (`AdmissibleIdeal/Presentation.lean:182`) and `exists_quiver_admissibleIdeal_morita`; `QuiverRep` (`Representation/Basic.lean:53`, `Paths Q ⥤ ModuleCat k`); `HomArrow`, `homDifferential` (differential `N(a)fᵢ − fⱼM(a)`), `eulerForm_eq_finrank_hom_sub_finrank_coker` (`HomDifferential.lean:63`, `:66`, `:159`, with `Fintype Q`, finite arrow types and finite-dimensional vertex spaces); `vertexSimpleModule` (`VertexSimpleModule.lean:46`); `eulerForm`, `titsForm`, `titsPolarForm` (`EulerForm.lean:57`, `:99`, `:113`: `∑ dᵥeᵥ − ∑_{a:i→j} dᵢeⱼ`, its diagonal, its polarisation); `hasProjectiveDimensionLT_two_pathAlgebra` (`Projective/Dimension.lean`, finite length, acyclic); `isFiniteRepType_iff_titsForm_posDef`, `gabrielIndecomposableEquivPositiveRoot`; `IsMinimalProjectivePresentation` (`MinimalProjectivePresentation/Basic.lean:133`: cover, projective P₁, exactness, superfluous kernel); `AuslanderReitenTranspose` (`Transpose.lean:106`), `AuslanderReitenTranslate` (`Translate.lean:113`, the k-dual of the transpose); `stableTranspose` with `IsEquivalence` (`Functor.lean:209`, `Equivalence.lean:48`) and `stableTransposeEquivalence` (`Equivalence.lean:179`, `FinitelyPresentedStableModule A ≌ (FinitelyPresentedStableModule Aᵐᵒᵖ)ᵒᵖ`, any ring); `LinearMap.auslanderReitenExtEquiv` (`Algebra/Category/ModuleCat/AuslanderReiten/Basic.lean:167`; variables at `:47`: field k, any k-algebra A, finite projective P₀, P₁, no minimality, no finite-dimensionality of A, as README:293–299 says); `ModuleCat.exists_isAlmostSplit_arTranslate` and `exists_isAlmostSplit_X₃_eq_iff` (`Sequence.lean:70`, `:97`, `[FiniteDimensional k A]`, `[Module.Finite A M]`); `ModuleCat.arTranslation` (`Quiver.lean:99`); `card_arrows_eq_card_arrows_of_translate_eq_some` (`Mesh.lean:67`, `Nat.card (x ⟶ m) = Nat.card (t ⟶ x)`; the file's docstring says the valued relation is not proved there); `IsAlmostSplit.exists_iso_τ₃_eq` and `nonempty_iso_X₁` (`AlmostSplit/Uniqueness.lean:129`, `:145`); `exists_isInjectiveEnvelope_of_finite` (`Envelope/FiniteDimensional.lean:67`); `IsIdempotentElem.cornerEquivalence`, `moritaEquivalenceCorner` (`RingTheory/Morita/Corner.lean:391`, `:443`, full idempotent `TwoSidedIdeal.span {e} = ⊤`); `homCocycleQuotientEquivExt` (`ModuleCat/HomCocycle.lean:51`) and the bimodule resolution (R05). All 136 backticked library names of the README were grepped as declarations at the pins and every one resolves (including `IsRepresentationFinite.finite_irreducibleMorphismQuiver_arrows`, `Quiver.IsAcyclic.exists_isSinkAdmissible`, `HasBinaryBiproducts.of_hasBinaryCoproducts`); all 62 cited file paths exist (the `Paths below are relative to TauCeti/` convention and the `{A,B}.lean` brace forms were expanded).

Mathlib: `RootPairing.Base` (`LinearAlgebra/RootSystem/Base.lean:68`: `support`, linear independence, every root or its negative in the additive monoid of base roots), `Base.cartanMatrix` (`CartanMatrix.lean:107`, `pairingIn ℤ`), `IsRootSystem` (`Defs.lean:120`), `IsCrystallographic` (`IsValuedIn.lean:59`), `IsReduced` (`Reduced.lean:50`), `IsIrreducible` (`Irreducible.lean:148`, requires `Nontrivial M`); `CategoryTheory.Abelian.Ext`; `Module.equiv_directSum_of_isTorsion`; `CompositionSeries.jordan_holder`; `MoritaEquivalence`.

### Cross-roadmap citations and supply direction

- SemisimpleAlgebras Layers 1.5–2, RootSystems Layers 1, 2 and 5 (both on main): consumed as cited; GrothendieckEulerForms (main and open #1257, lines 12, 178–199, 626–918), QuiverRepresentationsPartII (#1486, lines 7, 77, 221), McKaySkewGroup (#223, lines 77, 274), ZigzagPreprojective (#1653, lines 254–256, 496, 762): all consume this roadmap; none states a headline of this file. No sibling Suggested.lean declares a name in `TauCetiRoadmap.QuiverRepresentations`. ArtinAlgebras and StablePeriodicCurved on main: R02, R03.
- The dependency check on this head: `depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line (this roadmap, ArtinAlgebras, SemisimpleAlgebras and RootSystems are on main and not in the merge order; QuiverRepresentationsPartII and McKaySkewGroup are at lines 263 and 307 and cite this roadmap downward).
- All 14 `*Needs:*` lines were read; the only forward use is §3.3's use of the §4.1 resolution to discharge the pinned finite-resolution hypothesis, with the reverse edge excluded at README:573 and 583; Layer 6's internal order (6.1 → 6.2 → 6.3 → 6.4) is acyclic.
- The pull request description's A₂ reflection table was recomputed (row 4.2 above): the sink reflection at 2 realises s₂, as the description says, and the README Check at 655–656 and Conventions 88–89 agree.

## Not verifiable

- None of the four sources was unreadable; no request is outstanding. ARS is readable from the linked institutional copy (R06).
- Ownership against open pull requests was checked against the sibling checkouts the brief lists and the object-search index; packages on the board (three listed) are unrelated to quivers.

## Source issues

- **Misprint** in ASS at I.5.10 proof, printed p.30 (`ass line 1722`): the source says the cover of the kernel of p₀ has domain P₀; it should be a new projective P₁, as in the displayed presentation that follows; affects the proof.
- **Error** in ASS at III.2.4(a) and III.2.6(b), printed pp.79 and 81 (`ass line 4324`, `line 4331`, `line 4447`): the source says the residual classes of all paths form a basis of the vertex spaces of a bound-quiver projective or injective; they span but need not be independent when a relation identifies two paths (p − 2q on two parallel length-two paths); affects a stated result.
- **Error** in ASS at III.2.6(c), printed p.81 (`ass line 4454`): the source says the injective modulo its socle is spanned by residual classes of paths of length at most one; the dual radical path space keeps longer paths (on 1 → 2 → 3, I(3)/S(3) has vertex vector (1,1,0) from the length-two path); affects a stated result.
