# PORT-VStackSheavesAndLisseCategoriesPartII

## Result

- Branch: `roadmap/v-stack-sheaves-and-lisse-categories-part-ii`, created from main at `45f58db`.
- Head commit: `1de1dfd9a694520a0f4782496dde6169f24afd42`, "VStackSheavesAndLisseCategoriesPartII: roadmap (README, Suggested.lean, metadata)". It adds exactly `TauCetiRoadmap/VStackSheavesAndLisseCategoriesPartII/{README.md,Suggested.lean,metadata.toml}` (2128 insertions, nothing outside the folder).
- Build: `lake build TauCetiRoadmap.VStackSheavesAndLisseCategoriesPartII.Suggested` ends with `Build completed successfully (18239 jobs).`
  - Warnings: 2, both the same Lake notice: "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file". Building `TauCetiRoadmap.DGAInfinity.Suggested` on main prints the same notice twice, so it comes from the repository setup, not this file.
  - There are no `sorry` warnings because the file declares nothing (see below).
- Gate: `gate VStackSheavesAndLisseCategoriesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`gate --depcheck … --movable`), complete output:

  ```text
  depcheck: 225 roadmaps, 1993 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or `moved:` line.

## Which package text was ported

The board copy of `packages/VStackSheavesAndLisseCategoriesPartII/` in this worker's checkout is the original submission (board commit `50f17402`). Its `review.json` is the round-2 verdict (needs_changes). The repairs of rounds 3–8 (FIX-PKG~3 to ~8) exist only on the package's job branch. That branch head is `2a2f6c48` (FIX-PKG~8, which applies the three findings of REV-PKG~7), and it is checked out on another worker's board.

I ported that head, which carries every repair of rounds 3–8, read-only through `git show 2a2f6c48:…`. Porting the submission copy would have discarded eight rounds of repairs.

During the port, the round-8 review of that head (REV-PKG~8) finished with verdict needs_changes: four findings, one blocking. I checked each against the sources and the pins and applied all four (see below). So at no point has the package carried an "accepted" verdict. The worker should decide whether this port waits for a formal acceptance of the package.

## Draft pull request body

This roadmap is Part II of *Artin v-stacks, solid and lisse coefficient categories*.

- **Where the base stops.** The base roadmap constructs exceptional pullback, and its left adjoint, only for cohomologically smooth stacky maps.
- **The exceptional functors.** Here Rf_! and Rf^! are constructed for every fine map of decent v-stacks, after Gulotta–Hansen–Weinstein. This includes maps that are neither representable nor smooth, such as [T_S/G_S] → S for a locally profinite set T with an action of a locally pro-p group G. The construction comes with the six-functor identities, a comparison Rf_! → Rf_* for proper fine maps, and relative dualizing complexes with integration.
- **The trace formalism.** On these functors the roadmap builds the Lefschetz–Verdier formalism of Lu–Zheng and Hansen–Kaletha–Weinstein:
  - traces in symmetric monoidal 2-categories;
  - the 2-category CoCorr_S of cohomological correspondences, whose dualizable objects are the universally locally acyclic ones;
  - trace classes, and characteristic classes on inertia stacks;
  - the relative Lefschetz–Verdier formula, with local terms, their base change and the comparison with perfect schemes;
  - sheaves on constant profinite diamonds and on classifying stacks of locally pro-p groups, described through smooth modules, distributions and Haar measures;
  - trace distributions of admissible representations, a Künneth formula for characteristic classes, and universal local terms for group actions.
- **Why.** These are the sheaf-theoretic inputs of the local-term computations behind the Kottwitz conjecture for local shtuka spaces.
- **Suggested.lean.** It states nothing: neither pinned library has perfectoid spaces, the v-site, diamonds or D_ét. Its docstring names each headline theorem and the carriers it lacks.

## Dependencies still in pull requests

These are cited suppliers that are open roadmap pull requests, all earlier than this roadmap in the merge order:

- VStackSheavesAndLisseCategories
- DiamondSixOperations
- DiamondsAndVStacks
- DiamondEtaleCohomology
- EtaleDualityAndPerverseSheaves
- AdicCoefficientsAndComparisons
- SmoothRepresentationsOfLocalGroups

Suppliers on main: EnhancedDerivedSheaves, SchemeAndStackFoundations, PivotalSpherical, AdicSpacesPartIII, DGAInfinity and EtaleCohomologyFoundations. Only an open revision defines none of the ids cited. EtaleCohomologyFoundations §F.10.3, newly cited, is unchanged at the head of its open revision (#1891).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` declared nothing, and that is still correct: every headline needs carriers absent at both pins.

- **Checked at the pins:** Mathlib has `PreTilt` (`Mathlib/RingTheory/Perfection.lean:623`), `untilt` and `fontaineTheta` (`Mathlib/RingTheory/Perfectoid/`). Tau Ceti has `TauCeti.Perfectoid.IsPerfectoidTateRing`, `IsPerfectoidField` and `TauCeti.PreAdicSpace`.
- **Not at the pins:** no perfectoid-space category, v-site, diamond, small v-stack or D_ét.
- **Docstring changes only:** the pretilt locator is corrected (round-8 R04), "pre-adic and adic spaces" is narrowed to the pre-adic spaces the pin actually has, and the namespaces are named.
- **Binder and `#check` audit:** there are zero declarations, so the binder audit has zero inputs. As a mechanical check of the README's library citations, I temporarily added `#check @name` lines to the module for all 30 Mathlib and Tau Ceti names it cites, plus `PreTilt`, and built it once. Exit code 0, no errors; then I restored the file. The list included the reflexivity instances, `FGModuleCat.rightRigidCategory`, `dualTensorHomEquiv`, `TauCeti.IsSmoothDiscrete`, `LinearMap.projectiveTrace`, `LinearMap.projectiveTrace_eq_trace` and `LinearMap.projectiveTrace_cyclic`.

## Supplier replacements and duplication removals

Duplication sweep, by object, on main and at all 452 open heads, using `roadmaps grep` and `roadmaps show`. The queries covered: decent v-stacks; fine maps; prespatial; cohomological correspondences; Lefschetz–Verdier; Lu–Zheng; GHW; HKW; categorical traces; symmetric monoidal 2-categories; Grothendieck constructions; inertia stacks; characteristic classes; trace distributions; universal local terms; local terms; C(T, Λ)-modules; distributions on profinite sets; Haar(G, Λ); reflexivity over truncated DVRs; dualizable ⇔ perfect; Euler-characteristic and Lefschetz traces; proper maps of v-stacks; Hausdorff-quotient cohomology; classifying stacks. Each change below is recorded in *Scope and ownership* and the supplier contracts:

1. **Properness of maps of v-stacks** (definition, 0-truncatedness, permanence, closed immersions). The package restated it in VS6.11 and the Conventions; it is DiamondsAndVStacks §D4.11. The restatement and the API bullet "a proper map is 0-truncated" are deleted; VS6.11, VS7.7, the Conventions, the contract and the layer dependencies now cite §D4.11. VS6.11 keeps only proper fine and proper nice maps.
2. **Hausdorff-quotient cohomology comparison** Hⁱ(|Y|_B, F) ≅ Hⁱ(|Y|, f^*F) (GHW22 Lemma 3.8's input). VS7.2 called it "proved here"; it is DiamondsAndVStacks §D5.15 (*reduction-to-spatial-and-hausdorff-cohomology*). VS7.2 step 3 now cites it. It is applied to X₀′ = X₀ ×_(Spd(C,C⁺)) Spd(C, O_C), a separated spatial diamond, matching GHW22's proof of Proposition 3.7, which I checked in the cached text.
3. **Dualizable ⇔ perfect, and the Euler-characteristic trace, in D(R).** VS8.4 proved both; EtaleCohomologyFoundations §F.10.3 (on main) owns them: perfect = dualizable for the derived tensor, and the Lefschetz number as categorical trace, consuming DGAInfinity Layer 5. VS8.4 is now "Biduality criteria for dualizability in D(Λ)". It keeps only the two HKW22 Lemma B.1.2(2) criteria and their equivalence with dualizability, and imports the rest. PrismaticCohomologyPartII §4.0 (`isDualizable_iff_perfect`) states the same equivalence, but it is open and later than main, so main is cited.
4. **Finite-projective trace.** Tau Ceti at the pin has `LinearMap.projectiveTrace` (`TauCeti/LinearAlgebra/Trace/Projective.lean`), with `projectiveTrace_eq_trace` and `projectiveTrace_cyclic`. It is now cited in the From Tau Ceti contract and in VS8.4. AdicSpacesPartIII §R3.8 is kept only for *projective-trace-realization*, its comparison with the categorical trace.
5. **Names that are not declarations.** `CohCorr.pullbackAlong`, `CohCorr.restrictOpen` and `HaarMeasureWithValues` are planned names in open-PR READMEs: none is in a `Suggested.lean`, at the pins or on main. They are replaced by prose citations of EtaleDualityAndPerverseSheaves §6.2 and SmoothRepresentationsOfLocalGroups §SR.1.1 (*a-valued-haar-measure*).

Checked with no change needed:

- **EtaleDualityAndPerverseSheaves §6** owns only scheme cohomological correspondences in Varshavsky's form. It has no abstract Lu–Zheng §1 traces, so VS8.1–VS8.3 are not duplicated.
- **ExcursionOperatorsAndSpectralActionPartII** owns HKW22 §6 character formulas; it is downstream.
- **HeckeStacksAndLocalShtukas and DiamondSixOperations** state no trace formula.
- **SmoothRepresentationsOfLocalGroups §SR.1.1** gives existence and uniqueness of normalised Haar measures. VS10.5 keeps only the module structure, the right-translation character and the identification with Hom_G(C_c(G, Λ), Λ), as its scope line already said.
- **No other owner** exists for decent v-stacks, fine maps, prespatial diamonds, CoCorr_S, BCoCorr_S, universal local terms, smooth C(T, Λ)-modules, Dist(T, Λ) or Haar(G, Λ).

## Round-8 review findings (REV-PKG~8), verified and applied

- **R01 (P2)** — checked in `roadmaps show IgusaVarietiesAndTorsionConcentration`. Its §7.9b, merge-order line 187 (this roadmap is line 129), plans "the dualizable cohomological-correspondence category and its trace maps" and the relative Lefschetz–Verdier identity, citing only the base roadmap's VS0.2. That is a second plan of VS8.7, VS8.10 and VS9.1. *Scope and ownership* now names §7.9b as a consumer: torsion CoCorr_S, the trace class, VS9.1 and VS9.6 are here; the rational-coefficient descent, the elliptic fixed-locus matching and the local-term computation stay there. *Downstream consumers* gains the matching bullet. No *Needs:* or contract row names that roadmap, and the dependency check stays clean. The matching citation in §7.9b is that pull request's edit.
- **R02 (P3)** — checked against HKW22 lines 1849–1884, diagram (4.5.3). VS11.7 wrote morphisms of BCoCorr_S as C → X ×_U X′, which is undefined. They are now a correspondence C → X ×_S X′ over U → T ×_S T′ through q : C → U, with the two 2-commutative squares. A *Corrections to the sources* entry records the HKW22 Definition 4.5.4 misprint, with the coevaluation as witness.
- **R03 (P3)** — checked against LZ22 lines 395–419. In LZ22 Lemma 1.11 the square has f : X → X′, g : Y → Y′ and c′ : X′ → Y′, with p : g ∘ c ⇒ c′ ∘ f, the direction forced by F(p) : F(c′f) → F(gc) in Cat^co. The VS8.3 statement and API bullet now name the square and the lifted morphism (X′, F(f)L) → (Y′, F(g)M).
- **R04 (P3)** — `PreTilt` is at `Mathlib/RingTheory/Perfection.lean:623`, not under `Perfectoid/`. Fixed in the `Suggested.lean` docstring.

## Other fixes from the read as an upstream reviewer

- **Forward reference.** VS9.3 stated the isolated-fixed-point formula with local terms, which VS9.4 defines, and listed VS9.4 in its *Needs:*. The sum formula, its proof step and its locator (HKW22 p. 34) moved to VS9.4, which now needs VS9.3. VS9.3 keeps tr = ∫ tr_c(u, A), and its P¹ Check is restated through the integral. A mechanical scan of every *Needs:* line now finds no reference to the same or a later subsection.
- **Unstated input in VS10.9.** Step 3 silently used Rq^!(B ⊗ I) ≅ Rq^!B ⊗ q^*I for invertible I with q not smooth. It now cites VS7.10 and VS10.7 explicitly, and *Needs:* gains VS7.10.
- **Process residue.**
  - The "Former numbering" table is deleted: no roadmap on main, at an open head or among the board packages cites this roadmap's ids.
  - "they are planned here (as proof obligations)" (VS7.3, VS11.8) becomes "their proofs are part of this target".
  - "No roadmap on main or earlier in the merge order defines it" becomes "No other roadmap defines it".
  - "The sources are…" in the summary becomes "The principal references are…".
- **Proper names capitalised.** Title ("Artin"), the Layer VS9 heading ("Lefschetz–Verdier"), and the "*Corrections to the sources*" cross-reference in VS9.3.
- **Supplier headings.** The combined "From TauCetiRoadmap.PivotalSpherical, AdicSpacesPartIII and DGAInfinity" heading is split into one heading per supplier, each with "Used by".

## Adversarial mathematics pass

Conventions: Hⁱ(M[n]) = H^(i+n)(M); permutations are composed right to left; Λ is killed by n prime to p unless the subsection says "any commutative ring". Every value below was recomputed for this port. Where an earlier review computed the same instance, it was recomputed here, not copied.

| Statement | Instances tried | Values computed (two sides / wrong model) | Result | Change |
|---|---|---|---|---|
| Conventions: Λ | Λ = 0 (n = 1); Λ = F₃ × F₃, p = 2 | Λ = 0: every D_ét is zero, K = 0 is the unit. F₃ × F₃: 3·Λ = 0, 3 prime to 2. | Holds; the degenerate case is covered by Checks (VS7.9, VS8.9, VS11.1). | none |
| Conventions: ⊗-invertible vs §S4.2 | I = e₁Λ ⊕ e₂Λ[1] over a geometric point | I ⊗ (e₁Λ ⊕ e₂Λ[−1]) = e₁Λ ⊕ e₂Λ = Λ; H⁰(I) = F₃, H⁻¹(I) = F₃ (two degrees, versus one for L[n]). | Strictly weaker than §S4.2 when Spec Λ is disconnected; the README says so. | none |
| Conventions: nice maps | (P¹_C)^♢ → Spd C; [S/C₂] → S | P¹: compactifiable, representable, dim.trg 1, so nice. [S/C₂]: not representable, so not nice, though fine. | Holds. | none |
| Conventions: proper, cohomologically proper | q : S → B(C₂); f : B(C₃) → S, p = 2, Λ = F₃ | q: base change C₂ × S → S is finite étale, hence proper nice. f: diagonal fibre C₃ is not injective, so f is not proper; H⁻¹(Rf_!Λ) = H₁(C₃, F₃) = F₃ ≠ 0 = H⁻¹(Rf_*Λ). | Proper is needed for c_f; properness now cites DiamondsAndVStacks §D4.11. | citation |
| Conventions: duality orientation | X = Λ ⊕ Λ[1] in D(Λ) | tr(id) = ev ∘ σ ∘ coev = 1 − 1 = 0; without the sign, 2. | Orientation matches Mathlib `ExactPairing` (coev 𝟙 → X ⊗ Y, ev Y ⊗ X → 𝟙, Rigid/Basic.lean:78). | none |
| Conventions: Fix(c), In_S | identity correspondence of BC₂; transposition of a two-point set | In_S(BC₂) = BC₂ × C₂, 2 components; Fix(transposition) = ∅. | Holds. | none |
| Conventions: χ_G, δ_G witness | affine group over ℚ_p, g = diag(p,1), K = (1+pZ_p) ⋉ Z_p | Eg = {(ap, b)}: μ(Eg) = |p|⁻¹μ(E) = pμ(E), so χ_G(g) = p; gKg⁻¹ = (1+pZ_p) ⋉ pZ_p of index p, so δ_G(g) = 1/p = χ_G(g)⁻¹. Conjugation scales b by p, modulus |p| = p⁻¹ = δ_P; with N = 1 the modulus is 1. | Holds. | none |
| Conventions: conjugation action direction | affine group over ℚ₂, Λ = F₅, h = 1_K | Stated direction: χ·μ(gKg⁻¹) = 2·3 = 6 = 1 = μ(K). Other direction: χ·μ(g⁻¹Kg) = 2·2 = 4 ≠ 1. For p odd, |2|_p = 1 and both give 1. | Discriminates; needs p = 2, as stated. | none |
| VS6.1 representable in loc. sep. loc. spatial diamonds | id; open U ⊂ X; [S/C₂] → S over S = Spd C and S = ∅ | id: fibre products X ×_X T = T. [S/C₂]: base change along id_S is [S/C₂], with Aut(trivial torsor) = C₂ ≠ 1, so not 0-truncated, not a diamond. S = ∅: [∅/∅] = ∅, representable. | Holds; the negative example needs S ≠ ∅, as stated. | none |
| VS6.2 decent | Spd C; Spd Z_p; ∅; point of [S/Z_p] | Spd C: id chart. Spd Z_p: 2 points, chart from Spd Z_p × Spd F_p((t^(1/p^∞))). ∅: empty chart is surjective. S → [S/Z_p]: base change Z_p × S → S has the distribution sheaf as dualizing object, with stalk rank ≥ 2 (germs of δ₀ and of Haar measure independent over F_ℓ), so not smooth, not a chart. | Holds. | none |
| VS6.3 decent ⇒ Artin | BC₂ over a geometric point | Chart S → BC₂ is finite étale with 2 sheets; the diagonal has C₂-torsor fibres, quasiseparated and representable. | Holds. | none |
| VS6.4 fibre products | In_S(BC₂) = BC₂ ×_(BC₂×BC₂) BC₂ | = BC₂ × C₂, decent with chart S ⊔ S. | Holds. | none |
| VS6.5 examples | Spd Z_p, Spd C, Spd k | |Spd Z_p| = {Spd Q_p, Spd F_p}, 2 points; it is not a diamond, since its closed point is hit by no quasi-pro-étale map from a geometric point (VS6.11 Check). | Holds. | none |
| VS6.6–6.7 fine maps | id; eligible map of loc. spatial diamonds; [S/GL_n(Z_p)] → S; infinite-dimensional ball | Ball: dim.trg = ∞ at every point, not locally finite, so not fine. The other three are fine. | Holds. | none |
| VS6.8 smooth fine maps | [S/GL_n(Z_p)] → S; S → [S/Z_p]; S = ∅ | First: smooth (chart X/K → S smooth, K pro-p). Second: not smooth (as in VS6.2). S = ∅: id_∅, smooth. | Holds. | none |
| VS6.9 BG, maps BG → BH, 2-morphisms | G = Z/2 → H = S₃, f₂(t) = (12), h = (123); S = Spd Q_p, G = 1, H = Z/2 | f₁ = ad(h)f₂: f₁(t) = (123)(12)(132) = (23). h⁻¹f₁(t) = (132)(23) = (13) = f₂(t)h⁻¹ = (12)(132); the wrong model h·f₁(t) = (12) ≠ f₂(t)h = (23). H¹(Q_p, Z/2) = Q_p^×/Q_p^×2, of order 4 for p odd, so 3 nontrivial torsors are maps B1 → BZ/2 not of the form φ_f. | Holds; the right-torsor and left-multiplication convention is pinned. | none |
| VS6.10 2-morphisms and f^* ⊣ Rf_* | α_g on q : S → BS₃ | α_(12)α_(123) = α_((12)(123)) = α_(23), α_(123)α_(12) = α_(13); these act differently on the 2-dimensional irreducible representation. | Left action as stated. | none |
| VS6.11 proper fine / nice, spatial criterion | P¹ → Spd C; q : S → B(C₂); [S/Z_p] → S; open disc; Spd Z_p | P¹: spatial; every point is hit by a quasi-pro-étale map from a geometric point. q: proper nice with Aut(q) = C₂. [S/Z_p]: diagonal fibre Z_p × S, not injective. Disc: not quasicompact over its closure, not proper. Spd Z_p: spatial v-sheaf with 2 points, closed point not hit, not a diamond. | Holds. | Properness restatement replaced by DiamondsAndVStacks §D4.11. |
| VS7.1 prespatial | Spa(C, O_C)^♢; ⊔_ℕ points | First: X₀ = X. Second: locally prespatial, not quasicompact, so not prespatial. | Holds. | none |
| VS7.2 amplitude ≤ 3·dim.trg | proper P¹ over Spd C; a point; ∅ | P¹: actual amplitude 2 (H⁰, H²) ≤ 3·1 = 3, while 2·dim.trg alone (2) would not cover the |X|^h part in general. Point: 0 ≤ 0. ∅: 0. Krull dimension of |X₀′| ≤ dim.trg f checked in GHW22 pp. 14–15. | Holds. | Step 3 now cites DiamondsAndVStacks §D5.15 on X₀′. |
| VS7.3 weakly compactifiable, Rf_! = h_!Rp_*j_! | qc open immersion j; proper strongly compactifiable p | Rj_! = extension by zero; Rp_! = Rp_* (h = j = id). | Holds. | wording |
| VS7.4 enhanced operations, codescent | T = Z₂ × Spa C → Spa C; U_n = 2ⁿZ₂, W_n = 2ⁿ + 2^(n+2)Z₂ | (δ₀, ν) on U_n = (1, 0), on W_n = (0, 1). y_n = 3·2ⁿ ∉ W_n since 3·2ⁿ − 2ⁿ = 2^(n+1) ∉ 2^(n+2)Z₂, so two independent germs and no invertible dualizing object. Codescent still holds by the split augmentation at t₀. | Holds; smoothness is sufficient, not necessary. | none |
| VS7.5 Rf_!, Rf^! for fine maps (headline) | f = id; f : B(C₃) → S, Λ = F₃, p = 2 | id: Rf_! = id. B(C₃): Rf_!Λ = (Λ ⊗ Haar)_(C₃) derived, H^(−i) = H_i(C₃, F₃) = F₃ for i ≥ 0. | Consistent with VS10.9. | none |
| VS7.6 (P1)–(P5), (BC1)–(BC2), Künneth | f : T_S → S, T = {a, b} | (P3): Rf_!(A ⊗ f^*B) = (A_a ⊗ B) ⊕ (A_b ⊗ B) = (A_a ⊕ A_b) ⊗ B. (P4) with B = Λ: RHom(⊕A_t, Λ) = ⊕ RHom(A_t, Λ) = Rf_*RHom(A, f^!Λ), with f^! = f^* étale. | Holds. | none |
| VS7.7 c_f : Rf_! → Rf_* | closed immersion i; q : S → B(C₂), Λ = F₃; B(C₃) → S | i: c_i = id. q: q_*Λ = Λ[C₂] with α_σ acting by the swap e₁ ↔ e_σ (matrix [[0,1],[1,0]] ≠ id); c_q(e_g) = δ_g commutes with the swap. B(C₃): no isomorphism (F₃ against 0 in degree −1). | Pseudo-naturality is nontrivial; properness is needed. | DiamondsAndVStacks §D4.11 added to *Needs:*. |
| VS7.8 intrinsic smoothness | Δ : P¹ → P¹ × P¹, Λ = F₃; q : S → [S/Z_p] | Δ: K_Δ = Λ(−1)[−2], H⁰ = 0; self base change is id, K = Λ, H⁰ = F₃; formation does not commute, so not smooth by (3). q: Rq^!F_ℓ = F_ℓ invertible but the twist map fails on C(Z_p, F_ℓ), so not smooth by (2). | Holds; both (2) and (3) are needed. | none |
| VS7.9 K_(X/S), integration | S; P¹; T_S, T = Z_p; S = ∅; S = Spd C ⊔ Spd C | K_(S/S) = Λ, ∫_S = id. K_P¹ = Λ(1)[2], ∫ fundamental class = 1. T_S: H⁰ = Dist(Z_p, Λ), two independent germs at 0, not invertible. ∅: K = 0 invertible in the zero category. Two points: Dist(Z_p, Λ)². | Holds; Λ ≠ 0 and the base hypothesis are needed. | none |
| VS7.10 Rf^! commutes with ⊗-invertible I | I = e₁Λ ⊕ e₂Λ[1], f : P¹ → S; I = C(Z_p, Λ) on [S/Z_p] | P¹: both sides e₁Λ(1)[2] ⊕ e₂Λ(1)[3], nonzero in degrees −2, −3. C(Z_p, Λ): q^*I is free of infinite rank, not perfect, not invertible; the map fails. | Holds; the hypothesis is needed. | none |
| VS7.11 K_Δ ≅ K^(−1) for smooth f | smooth curve; f = id; f : [S/G] → S | Curve: K_Δ ⊗ K_f = Λ(−1)[−2] ⊗ Λ(1)[2] = Λ. id: Λ ⊗ Λ = Λ. BG: K_Δ = Haar(G, Λ) = (Haar^∗)^(−1). | Holds. | none |
| VS8.1 dualizable objects, traces | FGModuleCat K; D(Λ), Λ ⊕ Λ[1]; Corr_S, a transposition of 2 points | tr(id_V) = dim V; 1 − 1 = 0; Fix = ∅, trace ∅. | Holds. | none |
| VS8.2 functoriality of traces | empty correspondence on P¹, X′ = C′ = S | 2-cell ∅ → P¹ (closed immersion, cohomologically proper); both integrals 0. | Holds. | none |
| VS8.3 Grothendieck construction, unique lift | B terminal, F(∗) = Λ-modules, Λ = Z/5 | Morphisms are Λ-linear maps; tensor of ·2 and ·3 is ·6 = ·1 before and after assembly. For the unique lift, u′ = F(c′)F(f)L ≅ F(c′f)L → F(gc)L ≅ F(g)F(c)L → F(g)M, typed as (X′, F(f)L) → (Y′, F(g)M). | Holds. | Statement names its square (R03). |
| VS8.4 biduality criteria in D(Λ) | Λⁿ[0]; Λ ⊕ Λ[1]; Λ = Z/6, P = 3Λ; Λ = Z, M = Q; Λ a field, M = Λ^(ℕ) | Matrix trace. 1 − 1 = 0 versus 2 without the sign. 3·3 = 3 (idempotent), tr_proj(id_P) = 3, `LinearMap.trace` = 0 since |P| = 2 is not a power of 6. Q: 𝔻Q = Ext¹(Q, Z)[−1] ≠ 0, so M ⊗ 𝔻M has H⁰ = 0 against H⁰ RHom(Q, Q) = Q, and (b) fails. Λ^(ℕ): evaluation into the double dual is not surjective, so (a) fails. | Holds. | Rewritten to cite EtaleCohomologyFoundations §F.10.3 and `LinearMap.projectiveTrace`; owns only (a), (b). |
| VS8.5 reflexive ⇔ f.g. over R/𝔪^k | Z/9, M = Z/3; F_ℓ, M = F_ℓ^(ℕ); k = 1, M = κ² | Z/3: dual = 3Z/9 of size 3, double dual of size 3, bijective. F_ℓ^(ℕ): double dual of dimension 2^(2^ℵ₀), strictly larger than ℵ₀. κ²: (x, y) ↦ (φ ↦ φ(x, y)) is bijective. Converse also checked by Nakayama for nilpotent 𝔪: M/𝔪M finite-dimensional implies M f.g. | Holds; differs from Mathlib's finite-projective instance (Z/3 is not projective over Z/9). | none |
| VS8.6 Corr_S | unit; In_S(X) = tr(id_X); open disc ⊂ closed disc as a 2-cell | tr(id_S) = S; In_S(BG) = [G//G]; the open inclusion is not closed, hence not proper, hence not a 2-morphism. | Holds. | none |
| VS8.7 CoCorr_S | X = S, G = G_m^♢ acting; G finite | G_m: α^*Λ = Λ but α^!Λ = Λ(1)[2], so the equivariance isomorphism is not a 1-morphism. Finite G: α étale, α^! = α^*, so it is. | Holds. | none |
| VS8.8 dualizability criterion | (S, A), A = Λ²; (X, Λ) for smooth X | m : 𝔻A ⊠ A → RHom(A, A) is the 4 = 4 dimensional isomorphism. Smooth X: dual (X, K_(X/S)). | Holds. | none |
| VS8.9 dualizable ⇔ ULA (headline) | A = F₃² at a point; A = ⊕_ℕ F₃; j_!Λ on the closed disc, Λ = F₃ and Λ = 0 | dim(A^∗ ⊗ A) = 4 = dim End(A). Infinite: A^∗ ⊗ A consists of finite-rank operators and misses id. j_!F₃: not ULA, not dualizable. Λ = 0: j_!0 = 0, dualizable. | Both directions discriminated. | none |
| VS8.10 trace class | S = X = C = Spd C, A = Λ², u = matrix; C = S ⊔ S folded, u = (1, 2), Λ = F₅ | Matrix trace. Fold: Fix = C, class (1, 2), integral 3 = trace of diag(1, 2) pushed to S. | Holds; the scalar formula needs C = S, as stated. | none |
| VS8.11 inertia, characteristic class | A = Λ³ ⊕ Λ[1]; X = B(Z/2); G finite, Λ trivial | cc = 3 − 1 = 2. In_S(BZ/2): 2 components; S = ∅: equal. Trivial representation: constant class function 1 (= character, VS11.4). | Holds. | none |
| VS8.12 restriction to opens | X = S ⊔ S, A = (Λ², Λ³) | cc = (2, 3), restriction to the first component = 2. In BZ/2 the σ-component of the inertia is open but no open substack has it as inertia. | Holds. | none |
| VS9.1 relative LV formula (headline) | two-point fold, u = (1, 2), Λ = F₅; C = ∅ over P¹ | ∫ = 1 + 2 = 3 = tr(diag(1, 2)). C = ∅: 0 = tr(0). | Holds. | none |
| VS9.2 cc commutes with proper pushforward (headline) | p : S ⊔ S → S, A = Λ; A = 0 | p_*cc = 1 + 1 = 2 = cc(p_*Λ = Λ²) = χ(Λ²). A = 0: 0 = 0. | Holds. | none |
| VS9.3 Lefschetz formula for proper diamonds | P¹, g(z) = az, a ≠ 1; closed disc D, g(T) = T + p, char 0 | P¹: Fix = {0, ∞}, ∫ = 1 + 1 = 2 = tr on H⁰ ⊕ H²(1) = 1 + 1. D: Fix = ∅ (p ≠ 0) but tr on RΓ(D, Λ) = Λ is 1 ≠ 0. | Properness needed. | Isolated-point sum formula moved to VS9.4; forward reference removed. |
| VS9.4 local terms and sum formula | Λⁿ at a point; β = ∅; P¹ with z ↦ az; g = id on P¹ | loc = n; loc_∅ = 0. Multipliers a and a⁻¹ ≠ 1 at 0 and ∞, local terms 1 + 1 = 2 = tr(g). id on P¹: Fix = P¹, no pointwise term, ∫ = χ = 2. | Holds. | Gains the sum formula; *Needs:* VS9.3. |
| VS9.5 base change of correspondences | a = id; C ⊂ C′ | Identity functor; A ↦ A on D(Λ). Without the mate, u_T lands in a_C^*c₂^!F, not c₂,T^!a_X^*F. | Holds. | none |
| VS9.6 local terms commute with base change | a = id; C ⊂ C′ geometric points | loc values equal in Λ (both connected). | Holds. | none |
| VS9.7 diamondification | perfect A¹, x ↦ x + 1; Spec k | Fixed equation x = x + 1 gives 1 = 0, so Fix = ∅ on both sides. Spec k ↦ Spd k with the identity on D(Λ). | Holds; Λ = F_ℓ[t] is outside §6.2's finite rings, hence the gap. | §6.2 cited in prose |
| VS9.8 scheme local terms agree | id on perfect A¹; Spec k | A¹: c₁ = id is proper but Fix = A¹ is not proper over k. Spec k: both sides χ(F). | Both hypotheses are needed. | §6.2 cited in prose |
| VS10.1 smooth and complete modules | T finite; T = ∅; T = ℕ, Λ = Z; T compact | Finite: all modules smooth and complete. ∅: C = 0, only module 0. ℕ: the constant 1 ∈ Z^ℕ is not 1_U·1 for finite U; smooth part Z^(ℕ). Compact: 1_T = 1, all smooth. | Holds. | none |
| VS10.2 sheaves ↔ smooth modules | T = {a, b}, F₃² ⊕ F₃; T = ℕ; T = Z_p | dim F_M(T) = 3 = 2 + 1 (the wrong model gives 3 at each point). ℕ: compactly supported Λ^(ℕ) against global Λ^ℕ. Z_p: M^s = M^c = M. | Holds. | none |
| VS10.3 distributions | T = Fin 3; ∅; T = Z_p, Λ = F_ℓ | Λ³ with Dirac basis; 0; the Haar distribution vanishes on no small open around a point (μ(pⁿZ_p) = p^(−n) ≠ 0), unlike a finite Dirac sum. | Holds. | none |
| VS10.4 operations on T_S | T = {a, b}, Λ = F₃; T = point; ∅ | Rf_!f^*Λ = Λ², dimension 2 (not the identity); point: identity; ∅: zero category. H⁰(f^!Λ) = Dist(T, Λ). | Holds. | none |
| VS10.5 Haar(G, Λ) | Z/3 over Z[1/3]; Z_p over F_ℓ; Z_p over F_p; affine group, p = 2, Λ = F₅ | Counting measure generates; μ(pⁿZ_p) = p^(−n); over F_p: μ(Z_p) = p·μ(pZ_p) = 0 for all n, so Haar = 0; right translation by diag(2, 1) acts by 2 ≠ 1, and χ·δ = 2·3 = 1. | Holds. | Carrier cited in prose. |
| VS10.6 [S/G_S] decent | GL_n(Z_p); Q_p^× | Open pro-p subgroups 1 + pM_n(Z_p) and 1 + pZ_p (1 + 4Z₂ for p = 2); charts X/G_S exist. | Holds. | none |
| VS10.7 four operations at the point of BG | G = C₂, Λ = F₃; G = Z_p | q_!Λ = q_*Λ = Λ[C₂], dimension 2; Hom_G(Λ[C₂], M) = M (dimension 1 for M trivial or sign); Rq^!Λ = Haar = Λ. Z_p: Rq_*Λ = C(Z_p, Λ). | Holds. | none |
| VS10.8 restriction and induction | H = 1; G = H × H′, H′ finite | Reduces to VS10.7; Rq^!M = M since Haar(H′) = Λ. | Holds. | none |
| VS10.9 structure map of BG | C₂, Λ = F₃; Z_p | (1 + σ)/2 averaging gives invariants = coinvariants: trivial F₃, sign 0. Z_p: H¹ = Hom_cts(Z_p, Λ) = 0 since p ∈ Λ^×, so Rf_*Λ = Λ. | Holds. | Step 3 cites VS7.10 and VS10.7. |
| VS10.10 [T_S/G_S] and untwisting | G = 1, T a point, p = 2, Λ = Z/9 | Generator μ₀: a ↦ a. uμ₀: a ↦ ua. 3μ₀: a ↦ 3a, kernel = image = {0, 3, 6}. | A generator is needed. | none |
| VS11.1 admissible ⇔ ULA ⇔ dualizable | Q₂ regular representation over F₃; Λ = 0 | C_c(Q₂, F₃)^(Z₂) = ⊕_(Q₂/Z₂) F₃, of infinite rank, not perfect. Λ = 0: all 0, admissible. | Holds. | none |
| VS11.2 In_S(BG) = [G//G] | c = (12), y = (123) | y⁻¹cy = (13); the left-torsor formula ycy⁻¹ = (23). | Right convention consistent with VS6.9. | none |
| VS11.3 trace distribution | sign of Z/2 over F₃; Λ trivial for Z_p; affine group invariance | Values 1, −1 (the trivial representation gives 1, 1). ∫ h dμ. Invariance: 2·3 = 1 against 2·2 = 4 the other way. | Holds. | none |
| VS11.4 cc = tr.dist (headline) | G finite, M = sign of C₂, Λ = F₃; G pro-p, M = Λ | cc = character (1, −1); Haar distribution. Consistent with the VS8.11 Check (trivial representation gives constant 1). | Holds. | none |
| VS11.5 modified Künneth map | two closed balls over a point, Λ ≠ 0; A₁′ = 0 | Source Λ(2)[4]: H^(−4) = Λ. Untwisted target Λ(1)[2]: H^(−4) = 0. With the twist both are Λ(2)[4]. A₁′ = 0: both 0. | The twist is needed. | none |
| VS11.6 trivialisation over In_S(T) | T = S; T = BC₂ | cc_(S/S)(Λ) = 1. In_S(BC₂) = 2 copies of BC₂, K = Λ on each, value 1. | Holds. | none |
| VS11.7 BCoCorr_S and based dualizability | T = S; X = T = P¹, Λ = F₃, p = 2; coevaluation typing | T = S: Δ = id, dual (X → S, 𝔻A, B⁻¹). P¹: K_Δ = Λ(−1)[−2], H⁰ = 0, against Λ after self base change: Δ not smooth, no based coevaluation. Coevaluation: (c, c′) = (id, Δ) : X → X ×_S (X ×_S X) over T → T ×_S T through q = p; both squares commute, whereas X ×_U X′ with U = T is undefined. | Holds. | Morphism typing fixed; Corrections entry added (R02). |
| VS11.8 functoriality and monoidality of ⊠_𝔗 | trivial bases | Reduces to functoriality of ⊗ in CoCorr_S; (B ⊠ B′)⁻¹ = B⁻¹ ⊠ B′⁻¹. | Holds. | wording |
| VS11.9 Künneth for cc (headline) | T = S point, A₁ = Λ², A₂ = Λ³; A₂ = 0 | 2·3 = 6 = χ(Λ⁶); with a zero factor, both sides 0. | Holds. | none |
| VS11.10 In_S([X/G]) | trivial action; G = 1 | Fix(c) = X × G, In = X × [G//G]; G = 1 gives X. | Holds. | none |
| VS11.11 universal local term | C₂ swapping {a, b}; G_m acting on a point | Over 1: Fix = {a, b}, class (1, 1). Over σ: ∅, class 0. G_m: α^*Λ = Λ against α^!Λ = Λ(1)[2], so working over G is needed. | Holds. | none |
| VS11.12 cc on [X/G] = universal local term (headline) | G = S₃, x = (12), a = (123), t = (x, 1, 1) | New map: F(t·(a, 1)) = (x, xa, 1) = F(t)·(a, 1), with xa = (23). Old map: ax = (13) ≠ (23). Inertia coordinate at the unit is x = (12). | Holds. | none |
| VS11.13 étale locus | g(z) = az near 0, ∞; [[a, b], [0, 1]] near a = 1 | Linear terms (a − 1)z and (a⁻¹ − 1)w are nonzero. w(bw + a − 1) = 0 has a double root at w = 0 when a = 1, b ≠ 0: isolated but not étale. | Étaleness hypothesis needed. | none |

Context check, done mechanically for the README since `Suggested.lean` declares nothing:

- Every subsection opens with its standing hypotheses ("Throughout this subsection").
- Every *Needs:* line refers only to earlier subsections after the VS9.3/VS9.4 fix.
- Every definition block has at least three Checks, and every subsection has at least two.

## Ownership against open pull requests

Checked with `roadmaps grep` and `roadmaps show` over all 452 open heads and main, as listed above.

Unresolved:

- **AnalyticStacks (open, later in the merge order).** Its §0.3 also plans restricted multisimplicial nerves and the Liu–Zheng construction principle. This roadmap instead requires them of EnhancedDerivedSheaves §E3.4 (on main) through the supplier gaps gap:vs-pii-restricted-nerves, gap:vs-pii-partial-adjoints, gap:vs-pii-enhanced-operation-map and gap:vs-pii-descent. AnalyticStacks should cite EnhancedDerivedSheaves once the gaps are filled. That is an edit to AnalyticStacks or EnhancedDerivedSheaves, outside this folder; this roadmap claims neither target.
- **IgusaVarietiesAndTorsionConcentration §7.9b** should cite VS8.7, VS8.10, VS9.1 and VS9.6 of this roadmap; that is its pull request's edit.

## Unresolved and notes for the worker

- **Package not accepted.** Its latest verdict (REV-PKG~8) is needs_changes, and its four findings are applied here, not on the package branch. Whether this port waits for a formal acceptance is the worker's call.
- **Lake notice.** The `module`-system notice in the build is repository-wide.
- **Untrusted text.** None of the reviews, reports or roadmaps read contained instructions directed at this job; nothing suspicious to quote.


Pull request: #2288 (roadmap/v-stack-sheaves-and-lisse-categories-part-ii at 1de1dfd)
