# Answers to human review — TropicalAndBerkovichArithmetic (pull request #1494, head `03275b1` → `0390796`)

One comment, one point.

## H01 (mycaule) — applied differently

`TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md` gains a secondary section "Provenance: existing formalizations outside Tau Ceti" (lines 2527–2533) and a References entry (line 2576). They cite LeanPool `f8b9b72` `ChipFiring` (11 files) and `BrillNoetherGraphs` (567 files) as prior formalizations, not suppliers. The overlap is narrower than "Brill–Noether theory, chip-firing and gonality": the roadmap has no graph gonality, Brill–Noether or treewidth target (no occurrence of these words outside the new section), and it meets LeanPool only at the finite-graph rank theorem that §3.5 proves first. That is `riemann_roch_for_graphs` (ChipFiring `RiemannRoch.lean:33`), which uses q-reduced divisors (`Basic.lean:1264`, `:1560`), orientation reversal (`Orientation.lean:945`) and burning (`Orientation.lean:1204`). None of the metric material of §§3.1–3.11 has a LeanPool counterpart: edge lengths, all-point divisors, rational approximation, the Laplacian, the Jacobian and metrized complexes.

Evidence, all read at LeanPool commit `f8b9b721d616a2cc0b22fc226e4a9e3dd6cea2d0` (Lean v4.35.0 per its `lean-toolchain`; Apache-2.0 per the file headers):

- **Carrier.** `CFGraph` (`ChipFiring/ChipFiringWithLean/Basic.lean:45–53`) has a finite, nonempty vertex type, edges a `Multiset (V × V)` and a `loopless` field. `CFDiv G := G.V → ℤ` (`:118`). Connectivity is the separate predicate `graphConnected` (`:69`). §3.1 differs: it keeps loops (its Check "a single loop has b₁=1") and adds lengths to Mathlib `Graph`. `Graph` is at the pin in `Mathlib/Combinatorics/Graph/Basic.lean:90`, and its edges have distinct identities.
- **Match with §3.5.** §3.5's discrete step reads "for a connected loopless multigraph and a base vertex, obtain the unique reduced representative by chip firing, use its burning order …, reversing an order exchanges its distinguished divisor with its complement in the canonical divisor". This is the content of the four declarations above. LeanPool uses acyclic orientations where Baker–Norine use vertex orders.
- **No metric content.** No ChipFiring file mentions `ℝ` or real edge lengths. I grepped all 11 files; the only "length" matches are list lengths. BrillNoetherGraphs' statement file `Highlights.lean` names lengths only as natural-number subdivision and arc counts.
- **BrillNoetherGraphs.** Its `ChipFiringWithLean/` holds six chip-firing files of its own (blob hashes differ from ChipFiring's). On top of them it proves:
  - `cdpr_chain_brill_noether_general` (`Highlights.lean:1391`) and `cycle_theta_chain_brill_noether_general` (`:1627`);
  - `exists_graph_of_genus_and_gonality` for `2 ≤ k ≤ (g+3)/2` (`:1946`);
  - `brill_noether_existence_through_five` (`:1242`);
  - `gonality_drops_under_regular_subdivision` (`:2003`);
  - `treewidth_le_gonality` (`:2052`).

  Two of its tools only look close to this roadmap. Its `RankDeterminingSet` (`Utilities/Foundations/RankDeterminingSet.lean:157`) is a set of vertices of a finite graph, whereas §3.9's rank-determining sets lie on the residue curves of a metrized complex. Its divisor-class presentations (`Bananas/Jacobian/`, `Bananas/Theta/`) are for banana graphs only, not the general finite-model exact sequence of §3.4.
- **Ownership.** No Tau Ceti roadmap owns chip-firing or graph Brill–Noether, so there is no owner to cite instead. `roadmaps grep` over main and the 459 open heads finds no chip-firing, Baker–Norine, reduced-divisor-on-graphs or graph-gonality material. CanonicalModelsAndGonality treats the gonality of curves and function fields, not of graphs. The pinned Mathlib and Tau Ceti have no chip-firing either; the only grep hits are an author name.
- **Why a citation, not a deletion or a new owner.** LeanPool is neither Mathlib nor Tau Ceti, so it cannot be a supplier. The repository README ("Porting existing work") asks a roadmap that develops the same mathematics to cite the existing work and coordinate. The section follows the form sibling roadmaps use for LeanPool (for example ExplicitCharacterSumsAndSieves, "Provenance: existing formalizations outside Tau Ceti"). It prescribes nothing and adds no target.
- **Other LeanPool projects.** I checked the remaining LeanPool projects whose names suggest overlap. `SpectralTheory` and `CompactSpectral` are spectral theory of Hilbert-space operators, not Banach spectra. `FiniteGraphFundamentalGroup` gives the unit-cell topological realization of a finite quiver and its π₁, with no lengths. None of them meets a target here, so none is cited.

## Adversarial pass on the added sentences

| Statement added | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| A linear-equivalence class contains at most one q-reduced divisor, exactly one on a connected graph | Lean statements `Basic.lean:1264` (no connectivity hypothesis) and `:1560` (`graphConnected`); two-component graph with q in one component and D=−1 at a vertex w of the other | Uniqueness: hypotheses qReduced D₁, qReduced D₂, D₁~D₂ give D₁=D₂ for every `CFGraph`. Existence fails without connectivity: chip-firing preserves each component's degree, so w's component keeps degree −1 and no q-effective representative exists | Holds as worded ("at most one", "exactly one on a connected graph") |
| Orientation and reverse divisors sum to K | Single edge u→v; `ordiv`(x)=indeg(x)−1 | ordiv(O)=(−1,0), ordiv(Ō)=(0,−1), sum (−1,−1). K=(val−2)=(−1,−1). In general indeg+outdeg−2=val−2 | Equal; no change |
| r(D)−r(K−D)=deg D−g+1 on a connected graph | Tree (g=0) with D=0; cycle Cₙ (g=1) with D=0; Lean conclusion `RiemannRoch.lean:34` | Tree: r(0)=0 and deg K=−2, so r(K)=−1; LHS 1, RHS 0−0+1=1. Cycle: K=0 and r(0)=0; LHS 0, RHS 0−1+1=0. Lean writes `deg D - genus G + 1` | Equal; matches §3.5's deg(D)+1−g |
| Clifford's inequality; gonality ≤ g+1 | g=2 with D=K; a tree; Lean `:131` (hypotheses rank D ≥ 0 and rank(K−D) ≥ 0), `:237` | r(K)=g−1=1 ≤ deg K/2=1 (equality). Tree: one chip at a vertex has rank 1, so gonality is 1 ≤ 0+1 | Holds; hypotheses of Clifford left implicit in "Clifford's inequality" (standard) |
| Graph of genus g and divisorial gonality k for 2 ≤ k ≤ ⌊(g+3)/2⌋ | g=0, 1, 3; Lean `:1946–1949` (`gonalityEq`, `genus G = g`, `graphConnected`) | g=0: ⌊3/2⌋=1, so the range is empty. g=1: k=2, which is a cycle's gonality. g=3: k∈{2,3} | Range and quantifier as in Lean |
| Brill–Noether existence in genus at most five | Lean `:1242–1246` | Hypotheses genus g ≤ 5 and (r+1)(g−d+r) ≤ g, i.e. ρ ≥ 0; conclusion ∃ D with deg D=d and rank ≥ r | Matches |
| Treewidth bounded by gonality | Lean `:2052–2055` | Hypotheses connected and `gonalityLeq G k`; conclusion treewidth of the underlying simple graph ≤ k | Matches |
| Divisorial gonality drops under regular subdivision | Lean `:2003–2006` | ∃ G, k, n>0 with G connected, the n-th subdivision admitting a degree-k rank-≥1 divisor and G not | Matches "drops" |
| §3.5 overlap is the finite-graph step only; §§3.3, 3.4, 3.8–3.11 have no counterpart | Grep of all 11 ChipFiring files for `ℝ`, `Real`, `metric`, `length`; Rank and Orientation files for Jacobian/Picard | 0 real or metric hits. "length" matches are `List.length` only. No Picard or Jacobian quotient is formed | Holds |
| Carrier differs from §3.1 | §3.1 Check "a single loop has b₁=1"; `CFGraph.loopless` | A loop is admissible in §3.1 and excluded from `CFGraph` | Holds |

Every row above checks a sentence about external code against the code itself. No theorem, target or Check of the roadmap changed, so no supplier convention needed a new witness.

## Build, signatures, gate

- `lake build TauCetiRoadmap.TropicalAndBerkovichArithmetic.Suggested`: **Build completed successfully (18239 jobs).** There are six `declaration uses 'sorry'` warnings, at lines 51, 58, 63, 68, 74 and 83, and the standard notice that `Mathlib` is designed for the module system.
- `Suggested.lean` is unchanged, so I did not re-run the `#check @name` comparison. The worker's elaboration of its 9 declarations (no dropped section binders) still applies.
- Gate, after commit `0390796`: `gate TropicalAndBerkovichArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. Before the commit the same line read `dirty=1 … FAIL`, the uncommitted README.
- Depcheck: `depcheck: 250 roadmaps, 2380 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the revised README: no cross-roadmap citation and no Lean name found nowhere. The resolver did not check names outside TauCetiRoadmap (no pinned Lake packages on its host). The backticked LeanPool names were checked by hand above.

## Notes

- **sources.toml.** LeanPool is cited as Lean code, not as a mathematical source with theorem locators. `sources.toml` is outside the two files this job may edit, so it has no LeanPool entry. Sibling roadmaps cite LeanPool in their References in the same way.
- **Ownership.** I checked it against the roadmaps on main and the 459 open heads through `roadmaps grep`. No owner of chip-firing or graph Brill–Noether exists, and this roadmap does not take ownership of either.
- **Untrusted text.** The comment contained no instruction aimed at the tooling; nothing suspicious to quote.
- **Downloads.** The LeanPool files I read were fetched into the job's scratch directory only. Nothing from them was copied into the repository.
