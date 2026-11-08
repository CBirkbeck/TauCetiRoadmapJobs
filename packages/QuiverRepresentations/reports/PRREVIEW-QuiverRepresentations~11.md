# Review of QuiverRepresentations (pull request #1526 at 1cfed5f)
Folder: `TauCetiRoadmap/RepresentationTheory/QuiverRepresentations/`

**Verdict:** accepted

Incremental re-review of the 84 lines changed since `475684d` (the head the previous review read): the README's Summary, Conventions, the Tau Ceti contracts, §4.1 and References, and the Lean docstrings of `pathAlgebra_higher_ext_vanish` and `nonempty_homDifferential_coker_linearEquiv_ext`. No Lean statement changed. README line numbers are at `1cfed5f`; library paths beginning `TauCeti/` and `Mathlib/` are at the pins of the pull request's `lake-manifest.json` (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`, unchanged). No finding, new or carried.

## Previous findings

- R01 — repaired: README:245–261 now cites `TauCeti.QuiverRep.arrowExtension`, `exists_arrowExtension_iso_fixing_ends`, `exists_arrowExtension_hom_fixing_ends_iff`, `homDifferential_surjective_iff_all_extensions_split` and `CategoryTheory.ShortComplex.ShortExact.extClass_baerSum` as contracts; the API bullet at 691–696 consumes them ("With the pinned classification … and the pinned Baer-sum additivity … it therefore identifies …") instead of planning them. Each name, its file and its content are as stated at the pin (table below); the variable blocks of `ArrowExtension/Basic.lean:35–36` and `Classification.lean:37–38` carry only `[Field k] [Quiver Q]`, so "over any field, with no finiteness or acyclicity" is right; `BaerSum.lean:33,58` carry `[Abelian C] [HasExt C]`, as README:259 says. The Summary (37–39), the §4.1 *Needs:* line (724–726) and the Lean module docstring (lines 22–24) list the new suppliers consistently.
- R02 — repaired: README:643 (standard resolution, p.7), 652–653 (consequence (1), p.8, every finite quiver, oriented cycles allowed; ASS VII.1.4 and VII.1.7(a) for the finite connected acyclic case), 666–668 (the exact sequence in the proof of consequence (3), p.8, with the remark that finite-dimensionality enters only the dimension count), 675 (consequence (3) for the Euler corollary), the Conventions sentence at 124–125 (the notes fix an algebraically closed field, p.3, unused by these results), the References entry at 1033–1036 and the two Lean docstrings. The manifest records the text as `cbquiv` (`author-page`, `certified`, cited for 4.1). Every locator matches the cached text (table below).

Neither repair introduced a new problem: the new Check at README:707–712 computes correctly (below), the only new API bullet makes a claim the pinned `LinearMap.homCocycleQuotientEquivExt_mk` supports, and no wording is process narrative.

## Verified sound

### Gate, elaboration, signatures

- **Gate.** The worker's gate at `1cfed5f` ends `OK` with every counter 0 including `build=0`; my rerun of the same command ends `OK` with every text counter 0.
- **Dependency check.** `depcheck: 236 roadmaps, 2421 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- **Outside the folder.** The prescribed diff against `origin/main` outside the folder and the family index is empty; `git diff --name-only origin/main...HEAD` lists only the folder's README.md and Suggested.lean; the worktree is clean.
- **Elaboration.** `lake env lean` on a scratch copy of Suggested.lean with four `#check @name` lines appended exits with exactly the four `declaration uses sorry` warnings (lines 54, 73, 83, 96) and no error. The four elaborated types equal the worker's `signatures.md` and are byte-for-byte the types the previous review compared with the README (heredity and the Ext comparison carry `[Fintype Q]` and finite arrow types and no acyclicity or finiteness of modules, README:640–656; the admissible presentation carries `[IsAlgClosed k]`, `[FiniteDimensional k A]`, `IsBasic A`; the root bridge carries `[Nonempty Q]`, connectedness and `PosDef`). No section `variable` exists in the file, so no binder can be lost.
- **Padding and headlines.** The four statements are unchanged since `475684d`, so the previous report's one-tactic probe (20 attempts, all failing) and headline table carry forward. The docstring changes add only source locators.
- **Lean form.** Single `import Mathlib` plus five Tau Ceti modules that exist at the pin, one module docstring, no definitions, no `set_option`, no `lemma`, no process words or pull-request numbers in either file.

### The changed contract names, opened at the pin

| Name | File and line | Content checked against the README |
|---|---|---|
| `TauCeti.QuiverRep.arrowExtension` | `TauCeti/RepresentationTheory/Quiver/Representation/ArrowExtension/Basic.lean:44` | object `Nᵢ × Mᵢ` (line 46); arrow `a` acts by `(N(a)n + c(a)m, M(a)m)` (`arrowExtension_map_toPath`, line 61–64), i.e. the upper triangular matrix with diagonal `N(a), M(a)` and corner `c(a)`; `arrowExtensionInl : N ⟶ E` (line 68), `arrowExtensionSnd : E ⟶ M` (line 79): the extension `0 → N → E → M → 0` of README:247 |
| `exists_arrowExtension_iso_fixing_ends` | `…/ArrowExtension/Classification.lean:191` | for `S.ShortExact`, some `c : HomArrow S.X₃ S.X₁` and an iso `arrowExtension S.X₃ S.X₁ c ≅ S.X₂` compatible with `S.f` and `S.g` (README:250–251) |
| `exists_arrowExtension_hom_fixing_ends_iff` | `Classification.lean:81` | a morphism `arrowExtension M N c ⟶ arrowExtension M N c'` fixing both end terms exists iff `mk c = mk c'` in `HomArrow M N ⧸ (homDifferential M N).range` (README:252–254) |
| `homDifferential_surjective_iff_all_extensions_split` | `Classification.lean:253` | `Surjective (homDifferential M N)` iff every short exact `N → E → M` has a `Splitting` (README:255–256) |
| `CategoryTheory.ShortComplex.ShortExact.extClass_baerSum` | `TauCeti/Algebra/Homology/Ext/BaerSum.lean:106`, namespace `CategoryTheory.ShortComplex` (line 27) | `(hS.baerSum hT).extClass = hS.extClass + hT.extClass`, under `[Abelian C]` (line 33) and `[HasExt C]` (line 58) (README:258–259) |
| `LinearMap.homCocycleQuotientEquivExt_mk` | `TauCeti/Algebra/Category/ModuleCat/HomCocycle.lean:71` | the class of the cocycle given by `h : range f →ₗ N` goes to `extClass.comp (Ext.mk₀ h)`, the pushout of the image extension along `h`: the content of the new API bullet README:691–693 |
| `TauCeti.QuiverRep.homDifferential` | `…/Representation/HomDifferential.lean:66–68` | component `N(a) ∘ fᵢ − fⱼ ∘ M(a)` (README:659) |

### Sources: every new locator, against the cached text

Page offsets: `cbquiv` printed page = cache page; `ass` printed = pdf − 11. The README flags no locator as unverified.

| README passage | Locator read | Support |
|---|---|---|
| 124–125: the notes fix an algebraically closed field | `cbquiv line 57` (p.3, "once and for all") | as stated; the standard resolution's proof (lines 232–285) uses only the path basis, so the Conventions remark is right |
| 640–643: two-term resolution with terms ⊕ᵢ Pᵢ⊗Mᵢ and ⊕ₐ Pⱼ⊗Mᵢ, differential concatenation minus arrow action | `cbquiv line 225–231` (p.7): terms `⊕_α Ae_{t(α)} ⊗ e_{s(α)}X` and `⊕_i Ae_i ⊗ e_iX` for any left module X; `f(a⊗x) = aα⊗x − a⊗αx` | as stated, same sign; X is an arbitrary left module and Q any finite quiver (vertices `{1,…,n}`, finitely many arrows, line 62–63; no acyclicity) |
| 651–655: heredity, consequence (1), p.8 | `cbquiv line 290–295`: proj.dim X ≤ 1, Extⁱ(X,Y)=0 for i ≥ 2, every X | as stated |
| 652–654: ASS VII.1.4, VII.1.7(a) finite connected acyclic | `ass line 12128` (p.245), `12279` (p.248, "finite, connected, and acyclic") | as stated |
| 666–668: the Hom–Ext¹ comparison, exact sequence in the proof of (3), p.8 | `cbquiv line 300–303`: Hom(−,Y) applied to the resolution gives `0 → Hom(X,Y) → Hom(⊕Ae_i⊗e_iX, Y) → Hom(⊕Ae_{t(α)}⊗e_{s(α)}X, Y) → Ext¹(X,Y) → 0`; f.d. is the hypothesis of (3) but enters only the dimension line 303 | as stated, including the finite-dimensionality remark |
| 674–675: Euler corollary, consequence (3) | `cbquiv line 300` | as stated (f.d. X, Y; the README asks pointwise finite-dimensional, the same for a finite quiver) |
| 1033–1036 References | the cached copy from the author's page; manifest `cbquiv`, `licence_class = author-page`, `status = certified` | consistent |

### Adversarial mathematics: computed values

Conventions as in the README: A₂ is 1 → 2 with arrow a, left modules, later factor first; S₁ = (k,0), S₂ = (0,k), P₁ = (k →id k), P₂ = S₂. Rows for statements the diff touches are new; the rest cite the previous report (r10), whose rows and values stand because the statements are unchanged.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| Contract: `arrowExtension M N c` is upper triangular with corner c (245–248) | A₂, M=S₁, N=S₂, c(a)=λ; c = 0 | vertex spaces (0×k, k×0); the arrow sends (0,m) ↦ (λm, 0), middle arrow λ [the lower-triangular model would put c in the (M,N) corner, impossible since M(a)=0 forces 0 there]; c = 0 gives S₁⊕S₂ | pass, matches `arrowExtension_map_toPath` | none |
| Contract: `exists_arrowExtension_hom_fixing_ends_iff` (252–254) | A₂ (S₁,S₂), c = λ, c' = μ | HomVertex(S₁,S₂) = 0, range 0, so classes equal iff λ = μ; P₁-shaped middles with λ, μ ≠ 0 are isomorphic as representations but not with fixed ends unless λ = μ: this is the "fixed end terms" clause of the README | pass | none |
| Contract: `homDifferential_surjective_iff_all_extensions_split` (255–256) | A₂ (S₁,S₂) and (S₂,S₁); loop (k_λ,k_μ) | (S₁,S₂): differential 0 → k not onto and P₁ is a nonsplit extension; (S₂,S₁): 0 → 0 onto, Ext¹ = 0; loop: f ↦ (μ−λ)f onto iff λ ≠ μ iff Ext¹ = 0 | pass | none |
| Contract: Baer sum additivity (258–259) | A₂ (S₁,S₂), classes λ, μ | Baer sum of corner-λ and corner-μ extensions is the corner-(λ+μ) extension (pullback then pushout along the diagonal and the sum adds corners); extClass λ+μ | pass | none |
| New API bullet: comparison sends class of c to the extension class of the corner-c arrow extension, the pushout of the resolution's extension (691–696) | A₂, M=S₁, N=S₂ | resolution 0 → P₂ → P₁ → S₁ → 0, f(e₂⊗x) = e₂a⊗x − e₂⊗ax = a⊗x (ax = 0 in S₁); c = λ gives h : P₂ → S₂, e₂ ↦ λ; pushout identifies a with λ·g, middle (k →λ k) = corner-λ extension; `homCocycleQuotientEquivExt_mk` gives exactly extClass ∘ mk₀ h | pass | none |
| New Check 707–712: sign reversal | same, differential negated; λ ≠ 0, char k ≠ 2; char 2; λ = 0 | reversed f gives a ≡ −λg, middle arrow −λ; corner −λ versus λ: classes differ since range 0 and 2λ ≠ 0; in char 2 they coincide (the Check's hypothesis excludes it); λ = 0 both split; both middles ≅ P₁ for λ ≠ 0 | pass | none |
| New locator sentence 652–655: heredity for every finite quiver | loop k[X]; two loops; ∅; T = k[ε]/ε² (control) | PID ⇒ Ext² = 0; free ideal ring ⇒ hereditary; zero ring; T has Ext²(k,k) = k but is not a path algebra | pass (r10 row, locator now present) | none |
| `nonempty_homDifferential_coker_linearEquiv_ext` 666–670 | A₂ both orders; loop; M = k[X]; ∅ | cokernel dims 1, 0; loop 1 iff λ = μ; M = k[X]: f ↦ −f∘X onto, cokernel 0 = Ext¹(free, k₀); ∅: 0 = 0 | pass (r10 row, locator now present) | none |
| Euler corollary 674–680 | A₂; P₁; loop | E((1,0),(0,1)) = −1 = 0 − 1; E((0,1),(1,0)) = 0 = 0 − 0 [ℕ-subtraction gives 0]; q(1,1) = 1 = 1 − 0; loop E(1,1) = 0 = 1 − 1 and 0 − 0 | pass (r10 row, locator now present) | none |
| 0.1, 1.1, 2.1, 3.1 (envelope, copresentation, Morita), `exists_admissible_presentation`, 3.3 matrices, §4.1 resolution, 4.2 sink reflection, Coxeter, Kronecker controls, 5.1 roots, `exists_rootPairing_titsForm`, §5.2 route, 6.1 stable Hom and translate, 6.2 duality, 6.3 almost split and uniqueness, 6.4 AR quiver and mesh, Conventions, Layer 5 examples | as in r10 | the values of the r10 table (A₂, A₁, loop, k×k, T, D₄, Kronecker, ∅, A₁⊔A₁, 2α; e.g. CE = I for C = [[1,1],[0,1]]; D₄ root (2;1,1,1) with q = 1; A₂ sink reflection (1,0) ↦ (1,1) = s₂(1,0)) | pass, untouched by this diff | none |

### Cross-roadmap citations, suppliers and ownership

- The diff adds no cross-roadmap citation; the only roadmap edges remain SemisimpleAlgebras Layers 1.5–2 (main), downward. `citations.md` lists no unresolved citation and no unresolved Lean name; `overlaps.md` lists no pull request changing this roadmap, no dropped id and no id defined only by an open revision.
- Ownership of the new material: the arrow-extension classification and Baer-sum additivity are Tau Ceti's at the pin and are now consumed, not planned; the Ext-quiver statement, general heredity, the Hom-differential comparison and the Tits-form root pairing have no other owner on main or at the open heads (r10's search; the overlaps index at `723d26b` lists the same three closest roadmaps, GrothendieckEulerForms, QuiverRepresentationsPartII and RepresentationTheory, none of which owns these objects).
- Remarks on untouched text (no change requested): none found in the passages read around the diff.

## Not verifiable

- `exists_arrowExtension_iso_fixing_ends` and `extClass_baerSum` were verified from the Tau Ceti source files at the pin, not by `#check`: their modules are not imports of Suggested.lean and their object files are not built in this worktree. The names, namespaces, hypotheses and statements are quoted above from the pinned source.
- The publisher's authorisation of the two teaching copies of ASS and ARS linked in References (unchanged since r10) remains undetermined; the manifest records them as `institutional`, `certified`, and I read them only to check locators.

## Source issues

- none
