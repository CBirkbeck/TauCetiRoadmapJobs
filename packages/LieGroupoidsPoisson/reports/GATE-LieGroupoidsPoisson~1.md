# GATE-LieGroupoidsPoisson~1: answers to human review

The review was made on commit `4391cae`. The pull-request head `f1e1e4c` already contained repairs for every point. This round checked those repairs against the source and by computation, and added the missing locators and one tightening. It also rewrote `TauCetiRoadmap/LieGroupoidsPoisson/Suggested.lean` and fixed several README citations, because the gate was failing on items the review did not raise. That cleanup is listed after the findings. Line numbers refer to `TauCetiRoadmap/LieGroupoidsPoisson/README.md` at the new commit.

## H01 (roed-math) — applied

G5.2 now has its own construction target for the A-homotopy foliation of the admissible-path manifold (README lines 773–819):
- **Distribution.** It is the endpoint-zero `C²` variations `(u,φ)=(∇ₜb, ρ(b))` with `∇ₜb = ∂ₜb − T∇(a,b)`, and it has codimension `dim M + rank A` (line 792). The codimension is proved by the initial-zero/endpoint splitting.
- **Leaves.** They are exactly the full G5.1 A-homotopy classes (line 810).
- **Further assertions.** Independence of ∇, holonomy, open saturation, and the algebroid-geodesic exponential transverse near zero paths (line 815).

This round added the locator Crainic–Fernandes, *Integrability of Lie brackets*, Proposition 4.7 (p. 604) at line 819 and in References. The Proposition was read in the arXiv text (`CrainicFernandes2003`, arXiv math/0105033v5). It states the same four assertions, uses the same variation `u = ∇_a b = ∂_t b − T(a,b)`, `φ = #b`, and gets codimension `n+k` by the same endpoint argument (a) `φ(0)=0`, (b) `b(1)=0`.

## H02 (roed-math) — applied differently

The monodromy-to-slice bridge was already stated at the end of G5.2, but only in a form local to a neighbourhood ("at most once in that neighborhood"). That wording does not rule out a transversal meeting one leaf in several plaques.

- **G5.2 text (lines 822–826), old:** "a finite-dimensional transversal in a quotient neighborhood that meets each entire A-homotopy class at most once in that neighborhood".
- **New:** "through each admissible path a finite-dimensional transversal of dimension `dim M + rank A` that meets each entire A-homotopy class (each leaf, not merely each plaque) in at most one point". It cites Lemma 4.9 (p. 606), which the source states globally, as the leaf intersecting the transversal at most once.
- **G5.5 (line 862):** now says its quotient charts come from this bridge.
- **Non-Hausdorff permission:** kept (line 829).

## H03 (roed-math) — applied

G6.4 now owns the construction of the multiplicative form (lines 965–1010). It covers:
- the closed IM identities `⟨σa,ρb⟩ = −⟨σb,ρa⟩` and `σ[a,b] = L_{ρa}σb − ι_{ρb}dσa`;
- the tangent prolongation, `A(TΓ) ≃ TA(Γ)` and the twofold identification;
- the scalar 1-cocycle `λσ = σ*ω_can` on `TA ×_A TA`;
- Lie-II integration on the twofold tangent groupoid;
- bilinearity, alternation, closedness via the threefold groupoid, nondegeneracy and uniqueness.

Signs, recomputed:
- **IM identities.** With σ the identity on `(T*M)_π`, the README's Koszul bracket gives `L_{π♯α}β − L_{π♯β}α − dπ(α,β) = L_{π♯α}β − ι_{π♯β}dα`, using `α(π♯β) = −π(α,β)`. This is the stated identity. The identity `⟨α,π♯β⟩ = π(β,α) = −⟨β,π♯α⟩` gives the first one.
- **Cocycle sign.** Pair groupoid on flat `ℝ²ⁿ`. Differentiating `Ω̃(V,W) = Ω(V,W)` along a source-fibre curve gives `λ = ω(Ẋ',Y) + ω(X,Ẏ')`. With `σΩ = −ω♭` and `ω_can = dxⁱ∧dpᵢ`, `σ*ω_can(ȧ,ḃ) = ⟨δp₂,δx₁⟩ − ⟨δp₁,δx₂⟩ = ω(X,Ẏ') + ω(Ẋ',Y)`. The two sides agree, so the sign of `λσ` matches `σΩ(a) = −Ω(a,du·)`.
- **Anchor.** `π♯∘σΩ(v) = −(ω♭)⁻¹(−ω♭v) = v = dt(v,0)`.

## H04 (roed-math) — applied

The proof choice is fixed to the tangent-groupoid route, and its source-simple-connectivity step is written to work with a non-Hausdorff arrow space (lines 970–981).
- The source fibre of `T^[k]Γ` over a k-tuple at x is an affine bundle over `s⁻¹(x)`. Its fibre over g is the product of the affine spaces `{w : ds_g w = v_i}`, nonempty because `ds_g` is onto.
- So the source fibres of `T^[k]Γ` are homotopy equivalent to those of Γ, and are Hausdorff when those of Γ are.
- The text states that no global tangent-bundle splitting, partition of unity or Hausdorff total arrow space is used.

The Lectures (Theorem 14.29, §14.5) could not be read in this round because the author page timed out. They are not cited. The step above was checked directly.

## H05 (roed-math) — applied

G0.1 (lines 251–256), old: "internal sums inside an ambient bundle".

New: an internal sum is formed only where its fibre rank is locally constant, or as the image subbundle of the addition map where that map has constant rank. The reviewer's example satisfies this: the lines spanned by `(1,0)` and `(1,x)` have sum rank 1 at `x=0` and 2 elsewhere, so they form a sum only on `x≠0`.

## Additional repairs needed to pass the gate (not raised in review)

- **`Suggested.lean` rewritten as an acceptance test.** The old file imported twelve `Mathlib.*` submodules and another roadmap's module (`TauCetiRoadmap.DifferentialGeometry.Suggested`), and had three sorry'd data definitions (the regular-fibre atlases and `pairTrivialization`). It also contained a catalogue of rfl lemmas and worked examples that do not appear in the README.
- **What the new file states.** `import Mathlib` plus `TauCeti.Geometry.Manifold.Distribution` and `TauCeti.Geometry.Lie.RightInvariantVectorField`, and four statements on native carriers:
  - `exists_regularFiber_manifold`, with the DifferentialGeometry `IsRegularValue` replaced by its own body (surjective `mfderiv` on the fibre);
  - `submersion_iff_split_mfderiv`, with its definition `IsDiffSubmersionAt`;
  - `submersionKernel_smooth`;
  - `rightInvariant_bracket`.
- **What it says is not statable.** The module docstring names the headlines that cannot be stated at the pins and what each lacks: no Lie algebroid carrier, no Lie groupoid carrier (no smooth structure on composable pairs), no singular-leaf carrier, no Poisson bivector carrier.
- **Matching README edits.** The four names now appear in G0.1 and G2.2. The three atlas names that had been removed from the Lean file are no longer backticked; they are now described in prose.
- **Pull-request numbers replaced by roadmap names.**
  - "PR480" (5 places) → HamiltonianSystems.
  - The `pull/1049` links → `../SymplecticGeometry/CotangentLagrangian/README.md` and `../SymplecticGeometry/HamiltonianReduction/README.md`, both on main.
  - The `pull/480` link → `../HamiltonianSystems/README.md`.
  - The pinned-blob LieGroups link → `../RepresentationTheory/LieGroups/README.md`. Its Layers 4–5 on main still carry Lie III and universal covers.
- **TeX subscripts.** `Σ_{i<j}(-1)^{i+j}` → `Σ_(i<j)(-1)^(i+j)` in the two CE differentials.
- **References.** Lee (Corollary 5.14, Proposition 5.38) added.
- **Not edited.** The roadmap folder has no `sources.toml`, and this job may not create one. `CrainicFernandes2003` was fetched from arXiv but is not recorded in a manifest.

Binder check: `#check @name` was added for all five declarations, the module was elaborated once, and the lines were removed again. Every elaborated type carries all of its hypotheses in its own signature (the file has no `variable` blocks). Each matches its README sentence: dimensions n, m; boundaryless models; `ContMDiff` hypotheses; `CompleteSpace E`, `LieGroup I ∞ G`, `BoundarylessManifold I G`.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `exists_regularFiber_manifold` | n<m; n=m; c outside the image | n<m: an onto map ℝⁿ→ℝᵐ is impossible, so the fibre is empty and the model is `Fin 0 → ℝ`; n=m: the fibre is discrete, the range of a map from `ℝ⁰` is 0 and ker df = 0; c outside the image: the fibre is empty and every conclusion holds trivially | true | hypothesis inlined |
| `submersion_iff_split_mfderiv` | X empty; n<m | X empty: both sides true; n<m, X nonempty: no right inverse ℝᵐ→ℝⁿ exists, and no normal form either, so both sides false | true | none |
| `submersionKernel_smooth` | X empty; n=m | X empty: trivially true; n=m: ker = 0 is a rank-0 distribution | true | none |
| `rightInvariant_bracket` | GLₙ, `X^R_A(g)=Ag` | `[X^R_A, X^R_B](g) = B(Ag) − A(Bg) = −[A,B]g`, while left-invariant fields give `g[A,B]` | sign correct | none |
| G5.2 codimension | trivial algebroid A=0 over M; `A=TM` | A=0: codim = dim M (paths are points, and the leaf space is M); A=TM: codim 2 dim M = dim(M×M) | matches dim Σ(A) | none |
| G6.4 IM identities | σ = identity on `(T*M)_π` | the Koszul expansion above | agree | none |
| G6.4 `λσ` sign | pair groupoid on flat ℝ²ⁿ | both sides equal `ω(Ẋ',Y)+ω(X,Ẏ')` | agree | none |
| G6.4 nondegeneracy | dim count | `dim Γ = dim M + rank A = 2 dim M` because σ is an isomorphism | consistent | none |
| G0.1 internal sum | lines `(1,0)` and `(1,x)` | sum rank 1 at x=0, 2 elsewhere | hypothesis needed and present | none |

## Ownership and suppliers

No new carrier was added. The foliation and multiplicative-form constructions are specific to G5 and G6, and this roadmap owns them. `roadmaps grep` found no other owner of an A-homotopy foliation or of the IM-form integration. The citations now name HamiltonianSystems, an open pull request that adds a new roadmap folder, and HamiltonianReduction, CotangentLagrangian and LieGroups, which are on main.

Depcheck (`--movable`):

```
NOT IN ORDER: LieGroupoidsPoisson (insert it after its last supplier)
depcheck: 148 roadmaps, 1006 edges, 1 problem(s)
```

There is no UPWARD or CYCLE line. NOT IN ORDER means this roadmap is still at the design stage and is not yet in the merge order, which the brief does not count as a defect.

## Build and gate

`lake build TauCetiRoadmap.LieGroupoidsPoisson.Suggested`: Build completed successfully (8984 jobs). The only warnings are four `declaration uses sorry`, at lines 50, 69, 80 and 92.

Gate after commit `e11d2731`:
`gate LieGroupoidsPoisson: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=1 metadata=0 dirty=0 outside-folder=0 source-material=0 FAIL`

The only failing item is `depcheck: NOT IN ORDER`, the same design-stage line as above. Before this round, the gate also failed on blob=1, tex=4, prnum=5, sorry-data=3, imports=1, mathlib-subimports=12 and no-import-mathlib=1.
