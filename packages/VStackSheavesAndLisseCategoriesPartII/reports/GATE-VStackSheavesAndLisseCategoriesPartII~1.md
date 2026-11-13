# Answer to human review of VStackSheavesAndLisseCategoriesPartII at 8b71332

The review is one comment carrying four findings (F01–F04) of the eighth package review round, written against the package's line numbers. Each was checked against the pull-request head `8b71332`. All four repairs are already in that head: they entered with the first commit of the pull request (`1de1dfd9`), so the package was repaired before it was ported. The comment's "no package file was changed" refers to the package text the review read. This round changes no file and makes no commit.

## H01 (CBirkbeck) — applied

`TauCetiRoadmap/VStackSheavesAndLisseCategoriesPartII/README.md` line 26 (Scope and ownership, "Outside this roadmap") already names the elliptic local trace of `IgusaVarietiesAndTorsionConcentration` §7.9b as a consumer. Its torsion-coefficient category of cohomological correspondences, trace maps, relative Lefschetz–Verdier identity and base change of local terms are identified there with CoCorr_S (VS8.7), the trace class (VS8.10), VS9.1 and VS9.6. Rational descent, the fixed-locus components through elliptic elements and the local-term computation stay with that roadmap. Line 2067 (Downstream consumers) carries the requested bullet, and no `*Needs:*` line or supplier contract names that roadmap.

Evidence: §7.9b exists at the head of the open Igusa pull request (heading at line 2454; the target at line 2456 plans that category and identity). That roadmap is line 187 of the merge order and this one is line 129, so this roadmap is the owner. Every Igusa coefficient ring is ℓ-power-torsion with ℓ ≠ p, so 1 is killed by some ℓ^n and the ring is killed by an integer prime to p. That is exactly this roadmap's coefficient convention. Its rational coefficients are the part this roadmap leaves to it.

Further ownership search with `roadmaps grep` found no other plan of CoCorr_S or the v-stack trace formula. The searches were Lefschetz–Verdier, inertia stack, trace distribution, categorical trace, Hansen–Kaletha–Weinstein/HKW, Kottwitz conjecture, and cohomological correspondences of v-stacks or diamonds. HeckeStacksAndLocalShtukasPartII excludes the local-shtuka Lefschetz–Verdier applications from its scope. ExcursionOperatorsAndSpectralActionPartII asks HeckeStacksAndLocalShtukas for the HKW22 §6 elliptic character formula, which is a consumer of this roadmap and not a second plan. The scheme-theoretic formulas of EtaleDualityAndPerverseSheaves §6.3 (a supplier here) and GL2AutomorphicRepresentationsAndTransfer R17.6.3a are not v-stack statements.

The Igusa roadmap's own §7.9b still cites only VStackSheavesAndLisseCategories VS0.2 for the Verdier trace. Adding VS8.7, VS8.10, VS9.1 and VS9.6 of this roadmap to its `*Needs:*` line is an edit to that pull request, as the comment says.

## H02 (CBirkbeck) — applied

README line 1861 (VS11.7) already reads as the requested repair. The morphisms are (q♮, α, β), where q♮ consists of three pieces of data:
- a correspondence (c, c′) : C → X ×_S X′;
- a correspondence (u, u′) : U → T ×_S T′ with u′ cohomologically smooth;
- q : C → U with 2-isomorphisms p ∘ c ≅ u ∘ q and p′ ∘ c′ ≅ u′ ∘ q, where p and p′ are the structure maps.

The section cites diagram (4.5.3). It also states α : c^*A → c′^!A′ and an isomorphism β : u^*B ≅ u′^!B′. Line 2058 (Corrections to the sources) records Hansen–Kaletha–Weinstein, Definition 4.5.4, p. 39 as a misprint: C → X ×_U X′ and D → X ×_V X′ stand for correspondences into X ×_S X′ lying over U, respectively V, through q.

Checked against HKW22 lines 1849–1861 (diagram (4.5.3): top row X ← C → X′, bottom row T ← U → T′, verticals p, q, p′) and lines 1879–1886. On the coevaluation the data compose: C = X, (c, c′) = (structure map, Δ_(X/S)), U = T, (u, u′) = (π, Δ_(T/S)), q = p. Both squares commute: X → S either way, and (p × p) ∘ Δ_X = Δ_T ∘ p.

The defect does not recur elsewhere. The other fibre products over U or V in the README are well typed: Y₁ ×_U Y₂ at line 1809, where the Y_i map to U, and X ×_V V at line 463. The ⊠_U and κ_(U/T′) of (4.5.7) at line 1861 match HKW22 lines 1947–1954.

## H03 (CBirkbeck) — applied

README line 876 (VS8.3) already introduces f : X → X′, g : Y → Y′, c : X → Y, c′ : X′ → Y′ and the 2-morphism p : g ∘ c ⇒ c′ ∘ f. It then states the unique morphism (c′, u′) : (X′, F(f)L) → (Y′, F(g)M) above c′ making p a 2-morphism g♮ ∘ (c, u) ⇒ (c′, u′) ∘ f♮, with f♮ = (f, id) defined in the same paragraph. The API bullet at line 885 agrees.

Checked against LZ22 lines 395–419. The direction of p is fixed by the proof of Lemma 1.11: u′ uses F(p) : F(c′f)L → F(gc)L, and F reverses 2-cells (F(p)(L) : F(d)L → F(c)L for p : c → d, LZ22 lines 382–389), so p : g ∘ c ⇒ c′ ∘ f. VS9.1 (line 1193) uses the lemma with f = g = 𝔮 and the square 𝔮 ∘ 𝔣 ⇒ 𝔣′ ∘ 𝔮. For q cohomologically proper, F(q♮)A = q_!A ≅ Rq_∗A (VS8.6), which gives (X′, Rq_∗A) as stated.

## H04 (CBirkbeck) — applied

`TauCetiRoadmap/VStackSheavesAndLisseCategoriesPartII/Suggested.lean` lines 13–14 already read: "Mathlib has pretilts (`Mathlib/RingTheory/Perfection.lean`), the untilt map and Fontaine's θ (`Mathlib/RingTheory/Perfectoid/`)".

Checked at the pinned Mathlib: `PreTilt` is `Mathlib/RingTheory/Perfection.lean` line 623, `untilt` is `Mathlib/RingTheory/Perfectoid/Untilt.lean` line 49, and `fontaineTheta` is `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean` line 166. At the pinned Tau Ceti, `TauCeti.PreAdicSpace` is `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean` line 40, and `TauCeti.Perfectoid` is the namespace of `IsPerfectoidTateRing` and `IsPerfectoidField` in `TauCeti/RingTheory/Perfectoid/`. Neither library declares perfectoid spaces.

The same pattern was checked in the README: every file and line locator in its Mathlib and Tau Ceti supplier contracts holds at the pins. That includes `Module.IsReflexive` at `Mathlib/LinearAlgebra/Dual/Defs.lean` line 203, the finite projective instance at `Mathlib/LinearAlgebra/Dual/Lemmas.lean` line 262, `Module.instFiniteDimensionalOfIsReflexive` at line 284, and `FGModuleCat.rightRigidCategory` at `Mathlib/Algebra/Category/FGModuleCat/Basic.lean` line 265.

## Adversarial pass on the four passages

No statement was added or changed, so this records the check of the four existing passages the findings concern.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| VS11.7 morphisms of BCoCorr_S | identity of (X → T, A, B); coevaluation of 𝔛 over T with Δ_(T/S) smooth | identity: C = X, U = T, c = c′ = id, q = p, α = β = id, both squares trivial. Coevaluation: c : X → S, c′ = Δ_X, u = π, u′ = Δ_T, q = p; p_S ∘ c = π ∘ p : X → S, and (p × p) ∘ Δ_X = Δ_T ∘ p : X → T ×_S T | well typed; agrees with HKW22 (4.5.3) | none |
| VS8.3 unique lift (LZ22 Lemma 1.11) | B terminal; B = Corr_S with f = g = q♮ | terminal: f = g = c = c′ = id, so u′ = u (unique). Corr_S: (X′, F(q♮)A) = (X′, q_!A) = (X′, Rq_∗A), the object VS9.1 states | the 2-cell direction g ∘ c ⇒ c′ ∘ f matches F(p) : F(c′f)L → F(gc)L | none |
| Scope: Igusa §7.9b consumer | coefficient ring Z/ℓ^n, ℓ ≠ p; F̄_ℓ; a ℓ-adic field | Z/ℓ^n is killed by ℓ^n, prime to p (in scope); F̄_ℓ is killed by ℓ (in scope); a characteristic-zero field is killed by no n (left to the Igusa roadmap's rational descent) | boundary consistent with Conventions line 31 | none |
| Suggested.lean library locators | the three Mathlib objects; the two Tau Ceti objects | file and line found at the pin for each (H04) | correct | none |

`Suggested.lean` declares nothing; its docstring explains why. So there are no declarations for the mechanical `#check @name` comparison, and no elaborated signature changed. No source was missing, and `needs-references.toml` was not written.

## Build and gate

- `lake build TauCetiRoadmap.VStackSheavesAndLisseCategoriesPartII.Suggested`: `Build completed successfully (18239 jobs).` The only warnings are the standard notes that `Mathlib` is designed for the module system.
- Gate: `gate VStackSheavesAndLisseCategoriesPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check (`--movable --pr 2288`): `depcheck: 239 roadmaps, 2174 edges, 0 problem(s)`. There is no UPWARD or CYCLE line, and the consumer citation of `IgusaVarietiesAndTorsionConcentration` adds no supplier edge.
