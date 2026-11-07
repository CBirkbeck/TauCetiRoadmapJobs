## H01 (roed-math) — applied

`TauCetiRoadmap/QuiverRepresentationsPartII/README.md:77` cited the parent’s sorry’d statements `exists_indecomposable_decomposition` and `krullSchmidt_unique`; both are deleted from the parent’s Suggested.lean at the #1526 head `74f6da2`. The Krull–Schmidt contract now cites the pinned `TauCeti.exists_indecomposable_decomposition` (`TauCeti/RingTheory/KrullSchmidt/Existence`) and `TauCeti.exists_equiv_linearEquiv_of_finset` (`TauCeti/RingTheory/KrullSchmidt/Uniqueness`) together with the representation-level forms, under “From Tau Ceti” at `README.md:71`. Their signatures are the same as the parent’s two statements: `IsFiniteLength A M`, a `Finset` of indecomposable submodules forming a `DirectSum.IsInternal` family, and `s ≃ t` with linear isomorphisms. The same defect occurred in the parent’s `quiverRepEquivalence` (old line 75), which #1526 also deletes; it now cites `TauCeti.quiverRepEquivalence` (`README.md:69`, `README.md:79`). Scope (`README.md:7`) and the *Needs*/Dependencies lines 166, 221, 245, 259 and 302 now credit these results to Tau Ceti, not to the parent.

## H02 (roed-math) — disputed

After the H01 repair, no dependency on #1526 is needed. This README cites from the parent only Layer 1 (the left-module reading of representations) and Layer 5 (the type-A interval specialization). Both exist on main (`eaf17b1`) and at the #1526 head `74f6da2` (§5.1 there states the equioriented Aₙ interval classification explicitly). The Krull–Schmidt and module-equivalence names now resolve at the Tau Ceti pin, whether or not #1526 merges. #1526 revises an existing roadmap and is not a supplier, so it goes neither in the merge-order paragraph nor in the PR description. The overlap index likewise lists no id that this README cites and an open pull request drops or alone defines.

### Verification record

**Declarations at the pins.** Every newly cited Tau Ceti declaration was located by its `theorem`/`def` line, inside `namespace TauCeti`, at both the branch’s manifest pin and the content pin. The branch pin is Tau Ceti `a91d3aaf`: `RingTheory/KrullSchmidt/Existence.lean:178`, `Uniqueness.lean:228`, `RepresentationTheory/Quiver/Representation/AsModule.lean:574`, `Quiver/Representation/KrullSchmidt.lean:85,110,148` and `Quiver/FiniteRepType/Correspondence.lean:78`. The content pin is `2fd255d`, with the same files at lines 178, 215, 565, 85/110/148 and 78. `IsFiniteLength` was found at both Mathlib pins (`Mathlib/RingTheory/FiniteLength.lean`). `TauCeti.IsIndecomposableModule` (`RingTheory/KrullSchmidt/Indecomposable.lean:90`) requires `Nontrivial M`, so ⊥ never appears as a summand.

The README’s stated pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`) match the branch’s `lake-manifest.json`. Main now pins `1b1ccf4b` and `2fd255d`. Every declaration the README names in this repair exists at both. Lines 47 and 65 must be updated if the branch’s manifest is moved to main’s pins.

**Suggested.lean.** The file is unchanged, so the 40 elaborated signatures in the job’s signature listing still apply. No declaration in it mentions Krull–Schmidt or the parent, and no binder changed.

**Ownership.** Ownership did not move to this roadmap. The repair moves three citations from the parent roadmap to their library owner, Tau Ceti: the representation/module equivalence, Krull–Schmidt, and Gabriel’s correspondence. Only the type-A specialization of Gabriel’s correspondence is still cited from the parent (Layer 5). It is absent at the Tau Ceti pin: the search found no equioriented or interval classification under `RepresentationTheory/Quiver`. The supplied sibling checkouts and the open-roadmap index were not searched again for these objects, because the repair adds no construction.

**Overlap.** #1526 is the only open pull request that changes the parent roadmap. It does not touch this folder, so the two heads do not conflict.

**Resolver lead.** The citation resolver’s earlier lead, `GridPath.weight_bound`, is a declaration of this roadmap (`TauCetiRoadmap/QuiverRepresentationsPartII/Suggested.lean:226`). After the repair the resolver reports no unresolved cross-roadmap citations and no unresolved Lean names. On this host it does not check names outside TauCetiRoadmap, so the Tau Ceti names were checked by hand as above.

**Sources.** No source was fetched and none is missing. The repair concerns library contracts only.

### Adversarial mathematics record

Notation: α: 0→1 and β: 1→2 are the arrows of the equioriented A₂ path 0→1→2, and `q` is the Tits form.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Left-module convention of `TauCeti.quiverRepEquivalence` (`README.md:69`, 79) | Path 0→1→2 with the arrows α, β | At `AsModule.lean:175–177`, `pathEnd ⟨a,b,p⟩ * pathEnd ⟨c,a,q⟩ = pathEnd ⟨c,b,q.comp p⟩` with c=0, a=1, b=2, q=α, p=β gives `pathEnd β * pathEnd α = pathEnd (α.comp β)`. The later arrow β is on the left. A right-module reading gives the opposite order and is excluded | pass | Now cited from Tau Ceti instead of the parent |
| Module-level existence, `TauCeti.exists_indecomposable_decomposition` | M=0; M=k² over k; M=k[ε]/(ε²) over itself | s=∅, and the empty internal sum is the bijection 0→0; s={ke₁,ke₂}, card 2; s={M}, card 1, since M is indecomposable with nilpotent ε in its endomorphism ring | pass | Cited at `README.md:71` |
| Module-level uniqueness, `TauCeti.exists_equiv_linearEquiv_of_finset` | k² with s={ke₁,ke₂} and t={k(e₁+e₂),ke₂}; M=0 | A bijection s≃t matches 1-dimensional summands, so the multiset of iso classes is {k,k} with multiplicity 2 on both sides; for M=0, ∅≃∅ | pass | Cited at `README.md:71` |
| Multiplicities survive the Finset packaging | k²: ke₁ ≠ ke₂ but ke₁ ≅ ke₂; could ⊥ be a member? | Two distinct finset members give class k with count 2. ⊥ is excluded because `IsIndecomposableModule` requires `Nontrivial` | pass | Kept, with the reason stated |
| Finite window gives finite length | Zero pair on window [0,0]; VN [0,1] on window [0,1] | ℂ-dimensions 0 and 2. Lengths 0 and 2, with composition factors S₀, S₁, by `isArtinian_of_tower` and `isNoetherian_of_tower` as used in Tau Ceti’s quiver Krull–Schmidt | pass | Hypothesis check added at `README.md:71` |
| Representation-level forms (`exists_indecomposable_iso_biproduct` …) | Window [u,v] with u≤v; u=v | v−u+1 vertices (1 when u=v), finitely many arrows, pointwise finite dimension | pass | Kept; described as the module form read through the equivalence |
| Gabriel correspondence, `TauCeti.gabrielIndecomposableEquivPositiveRoot` | Empty quiver; A₁; equioriented A₂; Kronecker quiver | Empty: `q` is positive definite vacuously, no vector has q=1, and the zero representation is not indecomposable, so both sides are empty. A₁: q(d)=d², roots {1}, indecomposable k. A₂: roots (1,0),(0,1),(1,1), each with q=1. Kronecker: q(1,1)=1+1−2=0, not positive definite, so the hypothesis excludes it | pass | Cited at `README.md:73`, with its hypotheses (finite vertices and arrows, positive-definite `q`, any field) |
| Type-A specialization (parent Layer 5, `README.md:81`) | A₃ path 0→1→2; vectors (1,1,1), (1,0,1), (2,1,0); orientation reversal on A₂ | q(1,1,1)=3−1−1=1, an interval; q(1,0,1)=2, not a root; q(2,1,0)=4+1−2=3, not a root. There are 6=3·4/2 intervals. The reversed A₂ has the same supports {[0,0],[1,1],[0,1]} | pass | Wording “one-dimensional interval blocks” made precise as “one-dimensional at each vertex of their support, with identity arrows” |
| Identity arrows are required in interval representations | A₂ with dimension (1,1): arrow 1 versus arrow 0 | With arrow 1 the representation is indecomposable (type [0,1]). With arrow 0 it is S₀⊕S₁ (type [0,0]+[1,1]), matching the §1.3 Check | pass | Retained in the wording |
| Positive-definite form on finite type-A windows | A_n with q(d)=½(d_u²+d_v²+Σ(dᵢ−dᵢ₊₁)²) | For an interval indicator the two boundary contributions are 1+1=2, so q=1. For d=0, q=0. For a nonzero d, q>0 | pass | Hypothesis of the Tau Ceti correspondence is satisfied by every window |
| Direction of supply after the repair | depcheck | `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line | pass | None |

### Build and gate

Repairs committed as `4f50add9`: “QuiverRepresentationsPartII: review repairs (cite pinned Tau Ceti Krull–Schmidt and module equivalence instead of parent names)”.

`lake build TauCetiRoadmap.QuiverRepresentationsPartII.Suggested`: `Build completed successfully (8978 jobs).` There are 13 `declaration uses 'sorry'` warnings, one per headline theorem, and no errors.

Depcheck: `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`.

Gate summary line:

`gate QuiverRepresentationsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
