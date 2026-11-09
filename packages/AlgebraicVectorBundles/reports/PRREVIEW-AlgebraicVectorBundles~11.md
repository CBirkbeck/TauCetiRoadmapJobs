# Review of AlgebraicVectorBundles (pull request #1221 at 6ae310e)

**Verdict:** accepted

This is an incremental re-review of the 84 lines changed since 1ac6358. In scope are the two repairs (§2.2 route and supplier contracts; the `isFiniteLocallyFreeOfRank` and rank-lemma citations), the §2.1 Check that now refers to the §2.2 route, and everything that cites them.

No findings.

## Previous findings

- R01 — repaired: `README.md:501–533`, "`SheafOfModules.overPushforwardOverAdj V` makes `SheafOfModules.overFunctor _ V` left adjoint to pushforward along `Over.star V`, which the equivalence turns into `j_*` … so uniqueness of left adjoints (`CategoryTheory.Adjunction.leftAdjointUniq`) identifies `M ↦ M|_V` with `j^*`"; the *Needs:* line names all of these.
- R02 — repaired: `README.md:147–149`, "`isFiniteLocallyFreeOfRank X r` is Tau Ceti's `FiniteLocallyFreeSheaf.isConstantRank X r` (VectorBundle/FixedRank.lean) read on `X.Modules`". The docstrings at `Suggested.lean:30–31, 73–75` say the same. `README.md:82–85` names `rank_symmetricPower_apply` and `rank_exteriorPower_apply` in `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf`.

## Verified sound

### Gate, build, merge

- **Gate.** My rerun of `gate … --base origin/main` printed `gate AlgebraicVectorBundles: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK` with exit code 0. The worker's `gate.md` agrees.
- **Dependency check (verbatim).** `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The only roadmap supplier is still PadicMeasuresIwasawaAlgebras §5.1, which is on main; this diff adds no roadmap citation.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean` gives exactly five warnings, `declaration uses 'sorry'`, at lines 99, 119, 133, 151 and 169, and nothing else.
- **Diff and merge.**
  - The diff outside the folder is empty.
  - `HEAD` merges cleanly with `origin/main` (2083308), and no commit on main since the merge base touches this folder.
  - `PROGRESS.md`, `STATUS.md` and `metadata.toml` are unchanged from main.
- **Consumer on main.** SchemeAndStackFoundations `Suggested.lean` imports this module (line 2) and uses `isFiniteLocallyFreeOfRank` (line 1872) and `determinantObj` (line 2565). The gate's targeted build of that module passed.

### Lean statements and signatures

- The diff to `Suggested.lean` touches only docstrings (lines 29–32 and 73–75). No statement, binder or body changed.
- One scratch file holds `#check @name` for all nine declarations. Every elaborated type is the one the r10 review compared with the README, and no binder was lost. The worker's `signatures.md` lists 11 entries; two of them (`` `f.base`, `` and `of`) are parser artefacts of docstring text.

### R02 repair: the rank predicate and the rank lemmas

- **The predicate is the pinned notion.** In a scratch file, this elaborates: `example (X : Scheme.{u}) (r : ℕ) (E : X.Modules) : isFiniteLocallyFreeOfRank X r E ↔ ∃ h : isFiniteLocallyFree X E, TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.isConstantRank X r ⟨E, h⟩ := Iff.rfl`.
  - Pinned definition: Tau Ceti `AlgebraicGeometry/VectorBundle/FixedRank.lean:52`, `isConstantRank X r := fun E ↦ ∀ x, E.rank x = r`.
- **The rank lemmas resolve.** With their modules imported, `#check @TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.rank_symmetricPower_apply` gives `((symmetricPower X n).obj E).rank x = (E.rank x).multichoose n`. This is `VectorBundle/SymmetricPower/Basic.lean:74`.
  - `…rank_exteriorPower_apply` gives `… = (E.rank x).choose n`, at `VectorBundle/ExteriorPower/Basic.lean:93`.
  - Both are in the namespace the README names.
- **The open consumer agrees.** SchemeAndStackFoundations at the head of #1656 (README:87–89) says that the pinned form of this predicate is `FiniteLocallyFreeSheaf.FixedRank X r`. That is `(isConstantRank X r).FullSubcategory` (FixedRank.lean:72), consistent with the repaired text.

### R01 repair: every newly cited declaration, opened at the pins

| Declaration | File and line at the pin | What it says, against the README's use |
| --- | --- | --- |
| `SheafOfModules.overFunctor` | Mathlib Algebra/Category/ModuleCat/Sheaf/PushforwardContinuous.lean:57 | `pushforward (𝟙 _)` along `Over.forget`; `M.over X` is its value (:63) |
| `SheafOfModules.overPushforwardOverAdj` | same file :339 | `pushforward (𝟙 (R.over x)) ⊣ pushforward (pushforwardOver x)`, with `pushforwardOver x` (:331) the ring map along `Over.star x`; definitionally `overFunctor R x ⊣ …`, as the route says |
| `TopologicalSpace.Opens.overEquivalence` | Mathlib Topology/Sheaves/Over.lean:37 | `Over U ≌ Opens ↥U` |
| `TopologicalSpace.Opens.sheafOfModulesEquivOver` | Mathlib Topology/Sheaves/Module.lean:28 | `SheafOfModules (R.over U) ≌ SheafOfModules (U.sheafRestrict.obj R)`, built on `U.overEquivalence.symm` |
| `…sheafOfModulesEquivOverUnit`, `…InverseUnit` | same file :37, :43 | the functor and its inverse carry the unit to the unit; stated for `R : X.Sheaf RingCat.{u}` with `X : TopCat.{u}`, the roadmap's single-universe setting |
| `CategoryTheory.Adjunction.leftAdjointUniq` | Mathlib CategoryTheory/Adjunction/Unique.lean:37 | `F ⊣ G → F' ⊣ G → (F ≅ F')` |
| `SheafOfModules.Presentation.ofIsIso` | Mathlib …/Sheaf/Quasicoherent.lean:131 | transports a presentation along an isomorphism; finiteness is kept (:136) |
| `Scheme.Modules.pullbackOver`, `…pullbackOverObjIso` | Tau Ceti AlgebraicGeometry/Modules/Pullback/Basic.lean:438, :458 | the scheme proof the route transposes: `overEquiv V` ⋙ `pullback (f ∣_ V)` ⋙ `(overEquiv (f⁻¹V)).inverse`, then `Presentation.map … |>.ofIsIso` (:617) |

At the roadmap's carriers (`TauCeti.SheafOfModules.ringCatSheaf 𝒪Y`, `V : Opens Y`), a scratch file elaborates:
- `SheafOfModules.overFunctor _ V`;
- `SheafOfModules.overPushforwardOverAdj V : overFunctor _ V ⊣ pushforward (pushforwardOver V)`, where the instance `HasBinaryProducts (Opens Y)` is found;
- `V.sheafOfModulesEquivOver _`;
- `V.sheafOfModulesEquivOverUnit _`.

The route is mathematically right step by step:
- The cover and presentations of `M.over V` are what `SheafOfModules.IsFinitePresentation` stores (Quasicoherent.lean:263).
- On an open `U`, pushforward along `Over.star V` and `j_*` both give sections over `U ∩ V`, and the ring maps are both restriction.
- So the two right adjoints agree, and `leftAdjointUniq` (after transport along that isomorphism) identifies `M|_V` with `j^*M`.
- `Opens.map f_V` preserves `⊤` between posets with top, so it is final, and `pullbackObjUnitToUnit` is an isomorphism.
- The preimages `f⁻¹(V)` cover `X`.

Two reading notes on this passage need no change:
- The first transport, of the presentation of `M.over V` along the equivalence over `V`, is carried by the name `M|_V` and by `sheafOfModulesEquivOverUnit`, which the route and its *Needs:* line both name.
- Mathlib has no ringed-space `pullbackCongr`. The route needs one only to compare pullbacks along the two composites, and both composites send an open `U` of `Y` to `{x ∈ f⁻¹V | f x ∈ U}`. That is routine, unlike the slice-site step R01 asked for.

The §2.1 Check (`README.md:496–497`) now points to this identification. Checks are not targets, so the reference forward to §2.2 creates no build-order edge.

### Sources: the seeded sample, where it falls in the change

- **2.2, Tag 01BQ** (`stacks-01BQ` line 672, Sheaves of Modules, Lemma 17.11.5, p. 14): pullback of a finitely presented module along any morphism of ringed spaces is finitely presented. Its proof refers to Lemma 10.4 (Tag 01BG, line 475). That proof localises to a global presentation, then applies the right-exact, colimit-preserving `f^*`, which is the shape of the README's route. It supports the target as stated.
- **2.1, Tag 02N4** (line 1353, Lemma 17.20.2, p. 28): flat pullback is exact. Line 1352 notes that an open immersion is flat, as the changed Check says.
- **The other sampled targets** (1.1, 1.2, 3.1, 3.2, 3.3 and 4.1) are untouched by this diff. They carry the r10 verification: Tags 0098, 01CD, 01CH, 01CI, 01CF, 01CG, 0FJB–0FJE, 01I8, 0EKK, 062M and 062N, each read at its line in the cached texts.
- No README locator is flagged as unverified.

### Adversarial pass

New rows, for the changed passages, with values computed on each side:

| Statement | Instance | Left side | Right side | Result |
| --- | --- | --- | --- | --- |
| §2.2 route: `M ↦ M|_V` is `j^*` | `Y = 𝔸¹_k`, `V = D(t)`; `M = 𝒪/(t)`; `M = 𝒪_Y` | `M|_V(W) = (k[t]/(t))[1/t] = 0`; `M|_V(V) = k[t,t⁻¹]` | `j^*M` stalks `(k[t]/(t))_x = 0` for `x ∈ V`; `j^*𝒪 = 𝒪_V`, sections `k[t,t⁻¹]` | agree |
| same, the wrong direction | `M = 𝒪_Y`, global sections | restriction as `j_*`: `j_*𝒪_V(Y) = k[t,t⁻¹]` | `𝒪_Y(Y) = k[t]` | `overPushforwardOverAdj` puts restriction on the left, which excludes it |
| same, the right adjoints agree | `N = 𝒪_V`; `U = Y` and `U = D(t−1)` | along `Over.star V`: `N(U ⊓ V)` = `k[t,t⁻¹]`, `k[t,t⁻¹,(t−1)⁻¹]` | `j_*N(U) = N(j⁻¹U)`: the same two rings | agree, as the route says |
| finality of `Opens.map f_V` | origin `↪ 𝔸¹`; `V = D(t)`, then `V = 𝔸¹` | `f⁻¹V = ∅`: `𝒪_∅ = 0 = f_V^*𝒪_V`; `f⁻¹V = pt`: `𝒪 —t→ 𝒪 → M` becomes `k —0→ k → k` | presentation of `0`; presentation of `k`, as in the first §2.2 Check | as stated |
| same, a non-final functor | the discrete two-point site of the §1.2 Check | left adjoint sends `𝒪 = (k,k)` to `k²` | unit `k` | unit not preserved; finality is the hypothesis that matters |
| §2.2 cover | `X = pt` over `𝔸¹`, cover `{D(t), D(t−1)}` | preimages `∅`, `pt` | union `pt = X` | covers |
| §2.1 Check, open immersion | `j : D(t) → 𝔸¹`, `0 → 𝒪 —t→ 𝒪 → 𝒪/(t) → 0` | `0 → 𝒪_V —t→ 𝒪_V → 0 → 0`, `t` a unit | exact; the origin (not flat) gives `k —0→ k` | Check correct |
| `isFiniteLocallyFreeOfRank` = `isConstantRank` | `X = ∅`; `𝒪^r` on `Spec k`; `Spec k ⊔ Spec k` of ranks `(2,1)` | every `r`; exactly `r`; no `r` | the same for `isConstantRank`, by `Iff.rfl` | equal; "rank `r` at some point" would accept `(2,1)` for `r = 1, 2` |
| rank lemmas | `E = 𝒪²`: `Sym²`, `Sym³`, `∧²`, `∧³`; `E = 0`: `Sym⁰` | ranks `3`, `4`, `1`, `0`; `1` | `multichoose 2 2 = 3`, `multichoose 2 3 = 4`, `choose 2 2 = 1`, `choose 2 3 = 0`; `multichoose 0 0 = 1` | match; swapping the formulas gives `Sym³` rank `choose 2 3 = 0` |

Rows carried from the r10 report, whose statements this diff does not touch:

| Statement | Instance | Values | Result (r10) |
| --- | --- | --- | --- |
| 1.1 stalks | `G = 𝒪`, origin `↪ 𝔸¹`; `G = j_!𝒪_U` | `k = k ⊗ k[t]_(t)`; `κ(x)` / `0` on both sides | iso |
| 1.2 `pullback_tensor_isIso` | `Spec 𝔽_p → Spec ℤ`, `ℤ/p²`; `j_!𝒪_U`; discrete two-point site | `𝔽_p = 𝔽_p ⊗ 𝔽_p`; `κ(x)`, `0`; `k² → k⁴` | iso; fails off `Opens.map` |
| 2.1 exactness | `Spec k[t]_(t) → 𝔸¹`, `j_!𝒪_U ↪ 𝒪`; origin with `t` | injective; `0 : k → k` | as stated; flatness needed |
| 2.2 finite presentation of `f^*M` | `𝒪/(t)` to origin; `𝒪^n`; `k[x,y₁,…]/(x yᵢ)` | `k`; `𝒪_X^n`; image of `ann(x)` is not finitely generated | as stated; the coherent analogue fails |
| 2.2 Hom (`isIso_pullbackIhomComparison_app_of_flat`) | origin; `𝒪^(ℕ)` along `Spec ℚ → Spec ℤ`; `N = j_!𝒪_U ⊕ 𝒪/(t)` | `0` vs `k`; `(1/pᵢ)` not hit; `k`, `0` on both sides | flatness and finite presentation needed; non-quasi-coherent `N` holds |
| 3.1 powers | `n = 0`; `𝒪²` with `n = 2, 3`; `j_!𝒪_U`, `Sym²` | `𝒪`; `k·e₁∧e₂`, `0`; `κ(x)`, `0` | iso |
| 3.2 exterior multiplication and `γ` | `𝒪²` with `a = b = 1`; `𝒪³` with `(2,1)`; Euler sequence; `e₁ ↦ e₁∧e₂` | `−1`; `+1`; degree `0 = −1 + 1`; `+e₁∧e₂` | signs and order pinned |
| `mk_determinantObj_of_shortExact` | `0 → 𝒪 → 𝒪(1)² → 𝒪(2) → 0`; `X = ∅` | `2 = 0 + 2`; `1 = 1·1` | as stated |
| 3.3 graded lines | `P = A`; `diag(t,1)` | parity `1`, `−swap`; `det = t`, `t⁻¹ ∉ k[t]` | sign kept, inverse convention excluded |
| 4.1 weight grading | `α_p`; `𝔾_a/𝔽₂` with `λ²`; `A₀` | `A_n = 𝔽_p tⁿ`; weight `2`, `A₁ = 0`; `A₀ = 𝒪_X` | as stated |

### Padding and headline theorems

- **Padding probe.** I made 25 attempts on scratch copies: `infer_instance`, `simp`, `rfl`, `exact inferInstance` and `aesop`, each on all five theorems. None closed a goal. The errors were `synthInstanceFailed`, "simp made no progress", "unsolved goals", `rfl` failures and "aesop made no progress".
- **The four definitions** are the ones main's SchemeAndStackFoundations consumes.
- **Headline theorems** (Summary, `README.md:15–25`) are unchanged since r10:
  - The five statable headlines are stated: `pullback_tensor_isIso`, `isIso_pullbackIhomComparison_app_of_flat`, `symmetricPower_pullback_isIso`, `exteriorPower_pullback_isIso` and `mk_determinantObj_of_shortExact`.
  - Four headlines are named in the module docstring as not statable, each with its missing carrier: the ringed-space Hom comparison, the determinant isomorphism with its sign law, the graded-line comparison and the module-scheme recognition.

### Overlaps and ownership

- **Overlap list.** `scratch/overlaps.md` shows no open pull request that changes this roadmap, no cited id that one drops, and no id defined only by a revision.
- **Ids other roadmaps cite.** L0A, L0B, L0C, the `#layers` anchor and the `#l0b…` anchor are cited by #545, #1212, #1822, #1235, #1310, #1065, #1737 and #1472. They resolve through the label lines at `README.md:346–373`, one line per label, which this diff leaves intact. The L0B line already names "finite presentation of pullback along morphisms of ringed spaces".
- **Ownership.** The change owns no new object: it adds route detail and supplier names only.
  - `roadmaps grep` for Tag 01BQ, `sheafOfModulesEquivOver`, `overPushforwardOverAdj` and `isFinitePresentation_pullback` finds only this roadmap.
  - The SchemeAndStackFoundations checkouts at #1656 and #1276 cite this roadmap and claim none of these objects.

### Remarks, and the pull request description

- **Untouched text.** Nothing to remark.
- **Pull request description.** It still describes the pull request's first commit ("Only AlgebraicVectorBundles/Suggested.lean changes"). This is for the human approver and is not a finding about the folder.

## Not verifiable

- **Hartshorne, *Algebraic Geometry*, II, Exercise 5.16** (the `determinantObj` docstring and §3.2). The manifest records it as `uncertified` (paywalled), so it was not opened. Every claim it supports is also cited to Stacks Tags 0FJB–0FJE, which were read in r10.
- **Ownership against SchemeAndStackFoundations #1807, #1854 and #1808.** They appear in the vocabulary-overlap list without checkouts in the brief, so ownership against them was not checked beyond `roadmaps grep`.

## Source issues

- none
