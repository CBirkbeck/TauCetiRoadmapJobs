# GATE-RepresentationTheory~1: answers to human review

All review points concern the sub-roadmap `TauCetiRoadmap/RepresentationTheory/SchurWeyl/`. That is the only folder this pull request changes, and it sits inside the roadmap folder `TauCetiRoadmap/RepresentationTheory/`. The review repairs were made in `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md`. `TauCetiRoadmap/RepresentationTheory/SchurWeyl/Suggested.lean` is unchanged. Commit: `7d529da2`. The family-level `Suggested.lean` was added in `bd22cebe` (see Build and gate). Points H01–H05 were already repaired at the reviewed head `c110204`; I re-verified each one there. H06 is the open blocker and is repaired in this commit.

## H01 (roed-math) — applied

Already present at `c110204` in `SchurWeyl/README.md` Layer 9, "Harmonic tensors and ordinary Young shapes" and "Multiplicity modules and the two label conventions":
- the index set `J_k = {(j,λ) : 0 ≤ j ≤ ⌊k/2⌋, λ ⊢ k−2j}`;
- the admissibility conditions `λ′₁+λ′₂ ≤ n` (full O_n) and `ℓ(λ) = λ′₁ ≤ l` (Sp_{2l});
- E_λ built at degree q = |λ|, with `G_(k,λ) = Hom_G(E_λ, T^k)` acted on by postcomposition;
- `G^Sp_(k,λ) ≅ D_(k,λ′)`, with the Sp₂, k=2 example labelled (1,1).

This matches Dipper–Doty–Hu, Theorem 1.2(3) (arXiv v2, `DipperDotyHu` line 221: `∆(λ) ⊗ D(λ′)` with `ℓ(λ) ≤ m`).

## H02 (roed-math) — applied

Already present at `c110204` in Layer 9, "The diagram ideals and the trace filtration" and "Cup expansion, its relations, and the graded action":
- the image ideals `I_j`, the filtration `F_j`, the graded pieces `gr_j`, and the partial-matching cup maps `C_j`, `Ψ_j`;
- the relation space `R_j = ker Ψ_j` in every dimension, with stable injectivity (n ≥ 2k, l ≥ k) as a separate theorem;
- "Three separate semisimplicity statements", which separates semisimplicity of the geometric image from abstract Brauer semisimplicity.

I recomputed the reviewer's relation `D₁₂ − D₁₃ + D₂₃ = 0` with exact arithmetic and it holds; the README states it in "Low-rank acceptance examples".

## H03 (roed-math) — applied

README lines 18, 77 and 114 now cite `Representation.irreducible_iff_isSimpleModule_asModule`. That declaration exists at the pinned Mathlib, `Mathlib/RepresentationTheory/Irreducible.lean` line 32.

## H04 (kim-em) — answered

The author's comment lists the repairs made in `8da3b7a`. Each of the listed Layer 9 items (H01–H03) is present at `c110204` as described there; nothing in the comment needs a separate answer.

## H05 (roed-math) — applied

Already present at `c110204` in Layer 9:
- the matching sign `ε(P) = sign(w_P)`;
- the diagonal change of basis `D_j`;
- `ρ_raw = D_j ρ_std D_j`, with the normalized cups `ε(P) cup_P`.

The Sp₂ degree-3 data (ε = (1,−1,1), `s₁(x,y,z) = (x,−z,−y)`, `s₂(x,y,z) = (−y,−x,z)`, `e₁(x,y,z) = (−2x−y+z,0,0)`, `e₂(x,y,z) = (0,0,x−y−2z)`) was rechecked by exact computation against the native `Matrix.J`, `symplecticCup`, `symplecticCap` and the minus-flip:
- C intertwines all four generators on every basis input;
- `r(v) = (v,−v,v)` is fixed by s₁ and s₂ and killed by e₁ and e₂.

## H06 (roed-math) — applied

The surjection onto the commutant was asserted without assigning the invariant-tensor theorem behind it. I confirmed the gap:
- neither pinned Mathlib nor pinned Tau Ceti has an O/Sp tensor-invariant spanning theorem; the native `BrauerGenerators` files prove only cap/cup invariance;
- no roadmap on main or in an open roadmap pull request supplies one; `roadmaps grep` for the first fundamental theorem, vector invariants and Capelli finds only this roadmap.

Layer 9 has a new item, "The invariant-tensor first fundamental theorem (the bridge to the commutant)", inserted after the double-centralizer item. The surjectivity sub-bullet now points to it. The new item has four steps.

1. **Endomorphisms as tensors.** `Ξ_k : End(T^k) ≃ ⨂ over Fin k ⊕ Fin k`, built from:
   - `dualTensorHomEquiv`, `PiTensorProduct.dualDistribEquiv` and `PiTensorProduct.tmulEquiv`;
   - the native self-dualities `TauCeti.stdOrthogonalRepToDual` and `TauCeti.stdSymplecticRepToDual`.

   It turns conjugation into the diagonal action, using native `…RepToDual_equivariant`.
2. **Matching tensors.** `t_D` for a native `TauCeti.BrauerDiagram k`, with:
   - a fixed arc orientation;
   - invariance from native `piTensorProductMap_comp_{orthogonal,symplectic}Cup`;
   - a relabelling sign law;
   - `Ξ_k(ρ(D)) = ε(D) t_D`.
3. **The spanning theorem.** It holds in every dimension, including odd degree. Stable independence is kept separate and unused.
4. **The commutant.** The two `…_surjective_to_commutant` endpoints follow (Doty–Hu, Theorem 1.2(b), `DotyHuOrthogonal` line 177; Dipper–Doty–Hu, Theorems 1.2(1) and 1.4, `DipperDotyHu` lines 189 and 236). No second fundamental theorem is needed.

Step 3 also gets a proof route. It is not mandatory, and every input is pinned:
- a right-G-invariant polynomial `μ(g) = g·u` becomes a rational function of `c = g c₀ gᵀ` by Cholesky factorisation plus sign invariance (O), or by symplectic Gram–Schmidt (Sp);
- this function is a polynomial, by the factorisation `c = g c₀ gᵀ` (Mathlib `LinearMap.BilinForm.exists_orthogonal_basis`) and boundedness along `g + tA`;
- polarisation then gives a linear map that commutes with every `h^{⊗2k}`;
- native `TauCeti.mem_range_permTensorActionAlgHom_iff_forall_commute` (the GL Schur–Weyl theorem, `Symmetric/TensorAction/SchurWeyl.lean`) finishes the argument.

This also covers the reviewer's item 5: the polynomial-invariant route (polarisation, multidegree extraction, comparison through φ) is named as an alternative.

Checks added:
- Ξ at k=0;
- the orthogonal value `Ξ₁(id) = cup`;
- for Sp₂, `Ξ₁(id) = −θ` (computed: φ(e) = −f*, φ(f) = e*);
- ε at k=2 for the cap-cup and the crossing (−1) and the identity (+1);
- Sp₂ in degree 4: three matching tensors span a 2-dimensional space, related by `θ₁₂θ₃₄ − θ₁₃θ₂₄ + θ₁₄θ₂₃ = 0` (verified exactly);
- O₁;
- the negative control O₂ versus SO₂ in degree 2.

The Ordering paragraph and References were updated: Doty–Hu was added, and Dipper–Doty–Hu now carries theorem locators.

## Adversarial pass on the added statements

| statement | instances | computed values | result | change |
|---|---|---|---|---|
| Ξ_k equivariance, Ξ₁(id) | O any n, k=1; Sp₂ k=1 | O: Σeᵢ⊗eᵢ; Sp₂: φ(e)=(0,−1)=−f*, φ(f)=(1,0)=e*, so Ξ₁(id)=f⊗e−e⊗f=−θ | holds; sign pinned | sign Check added |
| Ξ₂ of cap-cup, crossing, identity (Sp₂) | k=2 | cap ω=−e*⊗f*+f*⊗e* ↦ −θ_in, so Ξ₂(cupcap)=−θ_in⊗θ_out; crossing acts as −swap and Ξ₂(swap)=(−θ)(−θ)=+t, so ε=−1; identity ε=(−1)²=+1 | holds | Check added |
| tensor theorem (spanning) | V=0; k=0; O₁; O₂ deg 2; Sp₂ deg 2, 4; odd degree | V=0, k>0: 0=0; k=0: ℂ=ℂ·1; O₁: dim 1 = span of (2k−1)!! equal tensors; O₂ deg 2: dim 1 (Sym²=1⊕2-dim, Λ²=det); Sp₂ deg 2: dim 1, 1 matching; Sp₂ deg 4: dim 2 (trivial multiplicity in V^{⊗4}), 3 matchings, Plücker relation verified exactly; odd degree: −1 acts by −1, so 0 | holds; spanning ≠ independence | Checks added |
| statement for SO_n instead of O_n | SO₂ deg 2 | SO₂ ⊂ SL₂ fixes e₁⊗e₂−e₂⊗e₁, and diag(1,−1) negates it | SO_n version false | negative control added |
| route: μ(g)=μ(L) | any L with L c₀ Lᵀ = g c₀ gᵀ | L⁻¹g preserves c₀, so L⁻¹g ∈ G (O: q qᵀ=1; Sp: q(−J)qᵀ=−J ⇔ q J qᵀ=J, Mathlib's condition) | holds | — |
| route: square roots disappear (O) | n=1; general Cholesky | n=1: μ ∈ ℂ[s] even in s=√c, hence in ℂ[c]; general: column j = s_j·(rational), and μ(L·diag(±1))=μ(L) | holds | — |
| route: pole removal | c with d_i(c)=0 | c=g gᵀ for singular g; g+tA is invertible and good for small t≠0; P(c_t)→P(c)≠0 and d_i(c_t)→0, yet μ stays bounded, so N_i=0 | holds | — |
| route: homogeneity | μ(tg)=t^{2k}μ(g) | F(t²c)=t^{2k}F(c), so degree k | holds | — |
| endpoint locators | Doty–Hu Thm 1.2(b); DDH Thms 1.2(1), 1.4 | read at `DotyHuOrthogonal` lines 177–195; `DipperDotyHu` lines 189–197, 236–249 | match | locators added |

I checked every library name added to the README at the pins (file grep): `stdOrthogonalRepToDual`, `stdSymplecticRepToDual`, their `_equivariant` lemmas, `orthogonalCup`, `symplecticCup`, `piTensorProductMap_comp_orthogonalCup`, `piTensorProductMap_comp_symplecticCup`, `symplecticCupCap`, `mem_range_permTensorActionAlgHom_iff_forall_commute`, `BrauerDiagram` (Tau Ceti); `dualTensorHomEquiv`, `PiTensorProduct.dualDistribEquiv`, `PiTensorProduct.tmulEquiv`, `finSumFinEquiv`, `LinearMap.BilinForm.exists_orthogonal_basis` (Mathlib). `roadmaps resolve` on the README reports no unresolved citations or names. `Suggested.lean` was not changed, so I did not run a new `#check @name` comparison; the reviewer asked for no Lean changes for this repair.

Ownership: the tensor first fundamental theorem for O/Sp is not owned anywhere I can read (main, the open heads via `roadmaps grep`, the sibling checkouts). This roadmap owns it as the input to its own endpoint theorems. No new Lean declaration was added, so no names can collide.

Sources: I fetched `DotyHuOrthogonal` (arXiv 0712.0944v3), `DipperDotyHu` (arXiv math/0503545v2) and `GoodmanWallachAppF` (author page; used only to check the reviewer's description). `DeConciniProcesi1976` is paywalled (uncertified), so it is named only as an alternative route, without a locator. The service failed to find a legal copy of Kraft–Procesi, so it is not cited. `needs-references.toml` was not kept, because no cited text is missing. This job may not edit `sources.toml`, so the new references are recorded only in the README's References section.

## Build and gate

The family folder `TauCetiRoadmap/RepresentationTheory/` had no top-level Lean file, so the briefed build target did not exist. The folder now has `TauCetiRoadmap/RepresentationTheory/Suggested.lean`, added in commit `bd22cebe`. The file contains:
- the module docstring;
- an empty `namespace TauCetiRoadmap.RepresentationTheory`.

The docstring says why nothing is stated. The family index `README.md` has no headline theorems of its own. Each member roadmap states its own headlines in its own `Suggested.lean`, and the docstring lists those files. Restating them here would plan them a second time, and a roadmap file cannot import another roadmap's module. The file has no declarations, so there was nothing to compare with `#check @name`. The README and the other files are unchanged. The merge-order file is not touched by this job.

- `lake build TauCetiRoadmap.RepresentationTheory.Suggested`: **Build completed successfully (8976 jobs).**
- `lake build TauCetiRoadmap.RepresentationTheory.SchurWeyl.Suggested` (the file the review points concern; not re-run here, as the file is unchanged since that run): **Build completed successfully (9177 jobs)**. The tail shows only `declaration uses sorry` warnings.
- Gate as briefed: `gate RepresentationTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`.
- Depcheck (`--movable`) on the family README: `depcheck: 148 roadmaps, 1009 edges, 0 problem(s)`. There are no UPWARD or CYCLE lines. The earlier run on `SchurWeyl/README.md` gave the same result.

## Notes for this run

- The two repair commits are `7d529da2` (Layer 9 bridge in `TauCetiRoadmap/RepresentationTheory/SchurWeyl/README.md`) and `bd22cebe` (family-level `TauCetiRoadmap/RepresentationTheory/Suggested.lean`). Their content is the earlier attempt's, restored unchanged after rechecking it. The earlier attempt was refused only because it edited the merge-order file. That edit is not repeated: the merge-order file is unchanged.
- I recomputed the sign Checks against the pinned definitions. The native `TauCeti.symplecticCup` is `−Σ J_xy e_x⊗e_y`, which is `e⊗f − f⊗e = θ` for Sp₂, since Mathlib's `Matrix.J` has `J(inl,inr) = −1`. The self-duality `stdSymplecticRepToDual` is `v ↦ vᵀJ·`, giving `φ(e) = (0,−1) = −f*` and `φ(f) = (1,0) = e*`. `BrauerDiagram k` is `PerfectMatching (Fin k ⊕ Fin k)`, with `Sum.inl` the bottom (input) points, as the README states. Exact integer computation gives:
  - the degree-4 Sp₂ relation `θ₁₂θ₃₄ − θ₁₃θ₂₄ + θ₁₄θ₂₃ = 0` holds;
  - the three matching tensors have rank 2;
  - `dim (V^{⊗4})^{SL₂} = 2`, from the kernel of the 𝔰𝔩₂ action.
- `#check` comparison: the family `Suggested.lean` has no declarations, and `SchurWeyl/Suggested.lean` is unchanged. No declaration's elaborated type could have changed, so I did not run a comparison file.
- Ownership against open pull requests was checked with `roadmaps grep`. The open heads, main and the sibling checkouts were searched for the O/Sp tensor first fundamental theorem; only this roadmap mentions it.
- No text is missing, so no `needs-references.toml` was written. The review text contains no instructions aimed at this job: its label changes are the reviewer's own workflow.

## Build and gate (this run)

- `lake build TauCetiRoadmap.RepresentationTheory.Suggested`: `Build completed successfully (8976 jobs).`
- Gate: `gate RepresentationTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck `--movable`: run on the family README and on `SchurWeyl/README.md`, both give `depcheck: 148 roadmaps, 1009 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
