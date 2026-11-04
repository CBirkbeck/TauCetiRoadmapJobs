# GATE-CombinatorialHeegaardFloer~1: answers to human review

The review was written against `caaa7905`. Commit `fe5e627c` (in the PR head `2b141e8`) had already repaired several of its points. The repairs from this round are in commit `5d30db16`. Line numbers below refer to `TauCetiRoadmap/CombinatorialHeegaardFloer/README.md` at `5d30db16`.

## H01 (roed-math) — applied
Lane L now opens with a scope table (README lines 326–338) with one row each for L.1 Némethi cohomology, L.2 spherical `[K,E]`, L.3 integral graph/surface chains and the native Tau Ceti complex. Its columns are graph class and decorations, carrier and coefficients, weight (with source section), characteristic sector, grading, the moves for which invariance is requested, and numerical invariants. The three numbered definitions L.1–L.3 below the table were already present at the PR head.

## H02 (roed-math) — applied
This was already present at the PR head (L.1 and L.3 regression text), and the source confirms it. In Némethi §3.2.1 the edge weight is `max(χ_k) + M^{g_j}(|Δχ_k|)` (Nemethi2008LatticeCohomology line 313). In Example 4.2.4, `χ_K(0) = χ_K(E) = 0` and `w₁[0,E] = 1` (line 576ff). Pattern repair: the README located `M^g` in §3.2.2, but it is defined in §3.2.1. That locator is corrected, and the values `M⁰ = 0`, `M¹(0) = 1`, `M¹(n≥1) = 0` (§3.2.2(b)) are now stated.

## H03 (roed-math) — applied
The "moves" column restricts L.1 to Némethi §3.4.1–3.4.2: genus-zero `(−1)` blow-ups/downs of valence ≤ 2 on negative-definite graphs. It requests no moves for L.2 or L.3.
- The native invariance is stated in `Suggested.lean` only for these two moves, as `latticeChainHomology_blowUpVertex` and `latticeChainHomology_blowUpEdge`.
- Both carry the hypothesis `P.IsNegativeDefinite`.
- Each conclusion is an isomorphism of `𝔽₂[U]`-modules in every cubical degree.
- Each holds for every odd exceptional value `ε`. README lines 340–355 say why: the native homology is `⊕ₙ H_q(S_n; 𝔽₂)`, and Némethi's proof gives homotopy equivalences of the sublevel sets `S_n`.

## H04 (roed-math) — applied
The correction-term paragraph now fixes the domain as negative-definite, with `k²` defined through `Q⁻¹`. It states the lattice-side normalisation `max_{k'∈[k]}(k'²+|V|)/4 = (k²+|V|)/4 − 2m_k`, which follows from `(k+2l)² = k² − 8χ_k(l)` (Nemethi2008LatticeCohomology line 376). Identifying this quantity with the Heegaard Floer `d`-invariant is left to the reconciliation. The text still says that a minimum over an arbitrary integral matrix is not a correction term.

## H05 (roed-math) — applied differently
The README now names the objects the reconciliation receives: the L.3 integral chain complex, the L.1 cochains on Némethi's domain, and the comparison data. The Némethi-to-`[K,E]` and integral-to-native comparisons stay separate targets with stated hypotheses. The README no longer cites "R2c", because R2c exists only in an unmerged revision of HeegaardFloer, and a revision of an existing roadmap cannot be a dependency (see H09). What the reconciliation itself must construct is now said once, as that roadmap's business (README lines 454–460).

## H06 (roed-math) — applied
The native interface and the zero-framed regression were already in the README at the PR head; both calculations check out:
- **Native complex.** With all weights `0`, `d(e_x) = v_x + v_{x+1}`. A finite-support cycle `Σ a_x e_x` forces `a_x = a_{x−1}`, hence `a = 0`. So `H₁ = 0` and `H₀ = 𝔽₂[U]`.
- **Characteristic `K = 0` sector.** Here `A_v = B_v = g = 0`, the two faces coincide and cancel, and `H₀ = H₁ = 𝔽₂[U]`.
- **Face exponents.** The L.2 exponents `A_v − g` and `B_v − g` were checked to equal the native face exponents `w(c) − w(face)` under `K = k + 2Qx`, using `χ_k(x+E_I) = χ_k(x) − f_K(I)`.

The table's native row now records Tau Ceti's weight, which is the maximum of `χ_k` over the cube's vertices (`Plumbing/Cube/Weight/Basic.lean`).

## H07 (roed-math) — applied
**README.** A new section, "Inventory: what Tau Ceti gives us" (README lines 156–208), lists the pinned grid library and the pinned plumbing library by exact names. The "missing" list no longer claims that grid diagrams and grid moves are absent.

Grid library:
- `GridDiagram`, `GridDiagram.MovesTo`, `GridLink`;
- the three complexes;
- `GridDiagram.IsKnot.tau`, `GridDiagram.IsKnot.tau_stabilizeX`;
- the grid-determinant Euler characteristic.

Plumbing library:
- `PlumbingGraph`, `PlumbingGraph.latticeChainComplex`;
- `PlumbingGraph.blowUpVertex` and `PlumbingGraph.blowUpEdge`;
- the `U`-tower, the one-vertex computation, `E₈`.

**`Suggested.lean`.** The comment-only file with alias `abbrev`s is replaced by three headline theorems on native carriers: `tau_eq_of_movesTo` and the two lattice blow-up theorems. The module docstring lists, with the carrier each lacks, the headlines that cannot be stated at the pins: Milnor, `τ ≤ g_s`, `χ = Δ`, `HF̂_st`, L.1, L.3, and `d`. Two Checks were added for the new statements: one-vertex blow-up with the zero-framed negative control, and `τ` on `torusLink 1 2` / `torusLink 2 1` / `torusLink 2 3`.

## H08 (roed-math) — applied
At the PR head the link versions were already in place:
- the stabilization exponent `n−ℓ` and Alexander shift `(n−ℓ)/2` at lines 117–128;
- the componentwise `𝔽[V₁,…,V_ℓ]` in G.6;
- the `ℓ>1` hat factor in G.9.

G.9 now also gives the flavor-dependent factors for `ℓ>1`, following OSS2015GridHomology line 8600ff (Theorem 11.6.1):
- fully blocked: `±Δ_L·∏ᵢ(1−tᵢ^{−1})^{nᵢ} tᵢ^{1/2}`;
- hat: `±Δ_L·∏ᵢ(tᵢ^{1/2}−tᵢ^{−1/2})`;
- unblocked: `±Δ_L·∏ᵢ tᵢ^{1/2}`.

Remark 4.6.10 (line 3268) confirms that variables on different components are not homotopic.

## H09 (roed-math) — applied differently
The README no longer depends on the unmerged HeegaardFloer revision. The commit-pinned blob link to its Reconciliation 2 is removed; the gate also refused that link. HeegaardFloer is now cited as it is on main (Reconciliations, item 2), as a downstream consumer only: Lane L supplies it and uses none of its results, and the depcheck shows no edge from this roadmap to HeegaardFloer. The scope this roadmap relies on is stated here from the source: Zemke Theorem 1.1, i.e. plumbing trees, `𝔽[[U]]`, relatively graded when `b₁ = 0` (Zemke2021LatticeHF line 50). Main's item 2 still claims "every plumbed 3-manifold". That is an overstatement in HeegaardFloer that this folder cannot edit, and the README says that claims beyond Zemke's scope are not supported.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `tau_eq_of_movesTo` | unknot grids; `torusLink 1 2` vs `torusLink 2 1`; `torusLink 2 3`; `K = ZMod 2`, `K = 𝔽₂[ε]/ε²` | `τ = 0` (`tau_unknot`); `2τ = −pq` gives `−1, −1` for `(1,2),(2,1)` and `−3` for `(2,3)`; for a general char-2 `K`, the OSS invariance maps are `𝔽₂`-homotopy equivalences, which base-change, and `tau_eq_of_linearEquiv` holds over any `CommRing`, `CharP 2` | consistent; `CharP K 2` rules out the zero ring | new |
| `latticeChainHomology_blowUpVertex` | `oneVertexPlumbing w`, `w<0`; zero-framed vertex; `ε = ±1, 3`; `q > |V|` | one vertex: `𝔽₂[U]` in `q=0` on both sides (blow-up `w−1, −1` is negative definite, `det = −w > 0`); the zero-framed vertex is excluded by `hP`; `ε ↦ ε − 2m` via `2Q(mE_new)`, which shifts the weight by a constant; for `q > |V|` both sides vanish (`H_q(S_n) = 0`) | holds | new |
| `latticeChainHomology_blowUpEdge` | same as above, using the edge formula `2χ' = 2χ + s(s−ε)` (`EdgeBlowUp.lean`) | same projection argument as Némethi §3.4.2, intersection-point case | holds on Némethi's domain | new |
| native `H_q ≅ ⊕ₙ H_q(S_n; 𝔽₂)` | one vertex `w=0`, `k=0` | all weights `0` ⇒ `S_n = ℝ` for `n ≥ 0`, `H₀ = 𝔽₂` in each degree, `U` = identity ⇒ `𝔽₂[U]`; `H₁ = 0` (matches H06) | holds | README text |
| max-orbit identity | `k' = k + 2l` | `k'² = k² − 8χ_k(l)` ⇒ `max k'² = k² − 8m_k` | holds | README text |
| G.9 factors | `ℓ>1`, book Thm 11.6.1 | three flavor factors as quoted | matches source | README text |
| L.2 exponent normalisation | zero-framed vertex `K=0`; general `I ⊆ E` | `f_K({v}) = 0`, `B_v − g = 0`; `w(x,E) = χ(x) − g(K,E)` ⇒ upper-face exponent `min_{I∋v} f_K(I) − g` | matches README | none |

## Other checks

- **Signatures.** The scratch `#check` elaboration was not run, because the only Lean commands this job may run are the build and the gate, and the provided `signatures.md` was unavailable. The three declarations have no section `variable`s: every binder (`[DecidableEq V] [Fintype V]`, `hP`, `hε`, `[CommRing K] [CharP K 2]`) is in the declaration's own signature. Their types match the README prose.
- **Ownership.** Searched main and the open roadmap PRs with `roadmaps grep` for grid homology, lattice homology, `blowUpVertex` and `latticeChainHomology`. Grid and lattice invariance appear only in this roadmap. GeometricTopology and HeegaardFloer only mention them or consume them. No declaration name in `Suggested.lean` collides with a roadmap declaration.
- **Sources.** Nemethi2008LatticeCohomology (arXiv:0709.0841v1), Zemke2021LatticeHF (arXiv:2111.14962v4) and OSS2015GridHomology (author-page PDF) were fetched through the sources service. This job may not edit `sources.toml` (it is not among the editable files), so the manifest entries still have to be recorded. No text was missing, so `needs-references.toml` was not written.
- **Merge order.** No supplier moved.

## Build and gate

- `lake build TauCetiRoadmap.CombinatorialHeegaardFloer.Suggested`: Build completed successfully (9084 jobs). The only warnings are the three expected `declaration uses 'sorry'` (lines 44, 56, 68).
- depcheck (`--movable`): `depcheck: 148 roadmaps, 1006 edges, 0 problem(s)`.
- gate: `gate CombinatorialHeegaardFloer: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`. The gate at the PR head had failed on `blob=1` (the commit-pinned link) and `residue=1` ("stand-in"); both are repaired.
