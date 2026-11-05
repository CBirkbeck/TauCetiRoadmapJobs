# Review of EquitableOperatorReduction (pull request #257 at 62d083f)

**Verdict:** needs changes

The mathematics the README and `Suggested.lean` state is correct on every instance I computed (table under *Verified sound*), and no roadmap on main, on the board, or in an open pull request owns equitable partitions or the normalized quotient, so this roadmap is the right owner. What blocks acceptance is the form: the README is a prospectus with no targets, and the acceptance test omits headlines that are statable at the pins. The gate also fails (imports, metadata), so there is no acceptance in this round whatever else changes.

## R01 (P2) — The README states no targets: no hypotheses, no `*Needs:*` lines, no Checks, no locators

**Location.** `TauCetiRoadmap/EquitableOperatorReduction/README.md` lines 88–207: six `## Layer k — …` sections written as bullet lists of topics ("eigenvectors lift, geometric multiplicities do not decrease, and quotient spectrum is contained in host spectrum"), and the gate line `target-ids: layered README states no targets`.

**Claim.** Every theorem in the README is a phrase, not a statement. Not one carries its hypotheses (which cells, which scalars, surjectivity, Hermitian or not), a `*Needs:*` line, or a locator; not one definition has an API list or a `**Checks.**` list; no layer has `### k.n` subsections, `### Examples` or `### Dependencies`. The required headings `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build` and `## Downstream consumers` are absent (the file has `## Ownership and boundaries`, `## Existing foundations to consume`, `## Acceptance gates`, `## Prior formalization and coordination` instead).

**Witness.** Line 136–137 "quotient spectrum is contained in host spectrum" is false without an injective embedding: on `V = Fin 1`, `I = Fin 2`, `cell = const 0`, the compressed matrix is `diag(a, 0)` and `0` is in its spectrum but not in `spectrum ℂ [a]` for `a ≠ 0`. The surjectivity that excludes this lives only in Convention 2, three sections away; a target would carry it. Line 157 "matrix elements between normalized cell states" (and the "transition-amplitude error estimates" of line 172) is Bachman et al. Theorem 2, which needs the two states in singleton cells (bachman-pst-quotient line 345–347); no hypothesis is stated here.

**Repair.** Rewrite each layer as `### k.n` prose targets of the house shape: "Define `…` as …" with its API bullets and at least three discriminating Checks; "Prove that … (Source, Thm, p.)" with every hypothesis in the sentence and a `*Needs:*` line; `### Examples` and `### Dependencies` per layer. The minimum set, with the locators I verified: constant block row sums and `AS = SB` (brouwer-haemers Section 2.3, line 1404–1408, p. 24; Godsil–Royle Lemma 9.3.1, p. 196, uncertified); eigenvector lifting and spectral inclusion for a surjective cell map (brouwer-haemers Lemma 2.3.1, line 1410, p. 24); the normalized quotient `K^{1/2} B K^{-1/2}` with `K = diag |C_i|` (from `KB = SᵀAS`, line 1405); interlacing for an isometric `S` and its Hermitian extension (brouwer-haemers Theorem 2.5.1, line 1481, p. 26; Remark line 1543, p. 28), and tightness forcing equitability (Corollary 2.5.4, line 1530, p. 27); exact reduction of `exp(−itA)` matrix elements between singleton cells (bachman-pst-quotient Theorem 2, line 345, p. 7). Add the headings the shape requires and move the open pull requests this roadmap serves (SpectralQuantumWalks, DiscreteQuantumWalks, StructuredBlockOperators) into `## Downstream consumers` by name.

## R02 (P2) — Headline theorems statable at the pins are absent from `Suggested.lean`, and the docstring names none as unstatable

**Location.** `TauCetiRoadmap/EquitableOperatorReduction/Suggested.lean` lines 5–11 (docstring: "design probes; implementing them alone does not complete a layer") and lines 40–58 (four theorems).

**Claim.** The README's acceptance gates (lines 196–207) name spectral inclusion, spectral projectors commuting with the embedding, and "the approximate exponential estimate" with "a concrete nonzero regression"; Layer 2 names Cauchy interlacing. The Lean file states none of them and its docstring does not say which headline is unstatable and what carrier it lacks. The file's own words say it is a set of probes, which is not what the acceptance test is.

**Witness.** Both of the following elaborate at the pins with `sorry` as the only warning (my probe copy, elaborated with `lake env lean` under `import Mathlib`):

```lean
theorem spectrum_compressed_subset (A : Matrix V V ℂ) (cell : V → I) (h : IsEquitableFor A cell) :
    spectrum ℂ (compressed A cell) ⊆ spectrum ℂ A := sorry

theorem exp_residual_bound {A : Matrix V V ℂ} (cell : V → I) (t : ℝ) :
    let _ := Matrix.linftyOpNormedRing (n := V) (α := ℂ)
    let _ := Matrix.linftyOpNormedRing (n := I) (α := ℂ)
    let _ := Matrix.linftyOpNormedAddCommGroup (m := V) (n := I) (α := ℂ)
    ‖NormedSpace.exp ((t : ℂ) • A) * cellEmbedding cell -
        cellEmbedding cell * NormedSpace.exp ((t : ℂ) • compressed A cell)‖ ≤
      |t| * Real.exp (|t| * (‖A‖ + ‖compressed A cell‖)) * ‖residual A cell‖ := sorry
```

Interlacing is statable too: `Matrix.IsHermitian.eigenvalues₀` with `eigenvalues₀_antitone` exists at the pin (`Mathlib/Analysis/Matrix/Spectrum.lean` lines 53–57), so `η_i` between `θ_i` and `θ_{n−m+i}` is a statement about two antitone families indexed by `Fin (card I)` and `Fin (card V)`.

**Repair.** State spectral inclusion (under `IsEquitableFor`, which carries surjectivity), the residual bound for the exponential with an explicit constant (the one above holds by Duhamel: `exp(tA)E − E exp(tQ) = ∫₀ᵗ exp((t−s)A) R exp(sQ) ds`, so the crude constant `|t| e^{|t|(‖A‖+‖Q‖)} ‖R‖` is safe with the ℓ∞ operator norm, which is submultiplicative for `V×V`, `V×I`, `I×I` shapes), and interlacing for a Hermitian `A` under `IsEquitableFor` (BH Theorem 2.5.1 with the Remark at line 1543). If you decide a headline is not statable (the spectral-projector statement needs the finite-dimensional functional calculus of OperatorTheory, which is not at the pin), say so in the docstring, naming the missing carrier, and state nothing in its place.

## R03 (P3) — Gate: `import Mathlib.<submodule>` lines instead of `import Mathlib`

**Location.** `Suggested.lean` lines 1–3: `import Mathlib.Analysis.Matrix.Spectrum`, `import Mathlib.Analysis.Normed.Algebra.MatrixExponential`, `import Mathlib.Combinatorics.SimpleGraph.AdjMatrix`.

**Claim.** The gate reports `imports=1 mathlib-subimports=3 no-import-mathlib=1`. **Witness.** My probe copy with the single line `import Mathlib` elaborates every declaration unchanged. **Repair.** Replace the three lines with `import Mathlib`.

## R04 (P3) — Gate: `metadata.toml` missing

**Location.** `TauCetiRoadmap/EquitableOperatorReduction/` has only `README.md` and `Suggested.lean`; gate line `metadata=1`. **Repair.** Add `metadata.toml` in the shape of a sibling on main (for instance `TauCetiRoadmap/OperatorTheory/metadata.toml`), and a `sources.toml` recording the works the References cite (R08).

## R05 (P3) — Padding: `compressed_isHermitian` closes with one library lemma

**Location.** `Suggested.lean` line 51–52. **Witness.** `Matrix.isHermitian_conjTranspose_mul_mul _ hA` closes it at the pin (`Mathlib/LinearAlgebra/Matrix/Hermitian.lean` line 292: `(B : Matrix m n α) → A.IsHermitian → (Bᴴ * A * B).IsHermitian`); elaborated in my probe copy with no error. **Repair.** Delete it from `Suggested.lean`; the README keeps "Hermitian `A` gives Hermitian compression" as an API bullet citing that lemma.

## R06 (P3) — Duplication by object: Cauchy interlacing and Davis–Kahan have owners; cite them

**Location.** README line 138–139 "Cauchy interlacing for arbitrary orthogonal compression"; lines 43–46 "General Davis--Kahan theory … belong to the Hilbert-space operator-theory roadmap".

**Witness.** RandomMatrices (open pull request, earlier in the merge order) plans "the max–min formula, the additive Weyl inequalities …, Cauchy interlacing" in its Milestone 1 (`TauCetiRoadmap/RandomMatrices/README.md` lines 71 and 194–200 at its head), on top of Courant–Fischer `PD-A51` of `TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md` line 254 on main. Davis–Kahan and principal angles are `TauCetiRoadmap/OperatorTheory/README.md` lines 18, 24, 44–46 and 57 on main (`SpectralSubspacePerturbation`, `PrincipalAngles`).

**Repair.** Cite "RandomMatrices Milestone 1 (Cauchy interlacing)" and "OperatorTheory PolarDecomposition PD-A51" in `## Exact supplier contracts` and keep here only what is specific to equitability: eigenvalues of the quotient are eigenvalues of the host (BH Lemma 2.3.1) and tight interlacing forces equitability (BH Corollary 2.5.4). Name OperatorTheory and its subsection `SpectralSubspacePerturbation` instead of "the Hilbert-space operator-theory roadmap"; likewise name `Regularity` and `DenseGraphLimits` (Completed) where lines 191–193 say "graph regularity roadmap" and "dense-graph-limits roadmap".

## R07 (P3) — Timelessness, typography and one type slip

**Location.** README lines 209–219 (`## Prior formalization and coordination`: repository and commit links, "Its author is coordinating this roadmap"); line 20–21 "Suggested home"; lines 38 and 44 `Weisfeiler--Leman`, `Davis--Kahan`; line 61 "the embedding `E : I →ₗ[𝕜] V`"; `Suggested.lean` lines 8–10 ("not exhaustive", "design probes", "later roadmaps").

**Claim.** Process narrative and provenance do not belong in the roadmap; double hyphens are a LaTeX habit; `I` and `V` are index types, not modules, so `I →ₗ[𝕜] V` is not a type. **Repair.** Drop the provenance section (the pull request description is the place for it), write the en dash or a hyphen, write `E : (I → 𝕜) →ₗ[𝕜] (V → 𝕜)` or just the matrix `Matrix V I 𝕜`, and give the Lean docstring the required form: "<title>: target signatures", the roadmap is README.md, this file states the headline theorems against the pinned APIs, and which headlines are not statable and why.

## R08 (P3) — References carry no locators; supplier contracts cite no declarations

**Location.** README lines 221–226 ("sections on equitable partitions", "work on quotient graphs and perfect state transfer") and lines 76–86.

**Witness.** The works are identified and legal copies exist for two of them: Brouwer–Haemers is on the author's page (`aeb.win.tue.nl/2WF02/spectra.pdf`, Section 2.3 p. 24, Section 2.5 p. 26–28); Bachman, Fredette, Fuller, Landry, Opperman, Tamon, Tollefson, *Perfect state transfer on quotient graphs*, arXiv:1108.0339 (Lemma 1 and Theorem 2, p. 6–7); Godsil–Royle resolves only to a paywalled page (uncertified; Lemma 9.3.1 p. 196 is corroborated by bachman-pst-quotient line 317–318). Horn–Johnson is cited for nothing in particular. At the pins the README's suppliers have names: `Matrix.rowStochastic` and `Matrix.colStochastic` (`Mathlib/LinearAlgebra/Matrix/Stochastic.lean` lines 46 and 129, submonoids), `Finpartition.ofSetoid` (`Mathlib/Order/Partition/Finpartition.lean` line 846), `SimpleGraph.adjMatrix` and `SimpleGraph.lapMatrix` (`AdjMatrix.lean` 238, `LapMatrix.lean` 67), `Matrix.IsHermitian.eigenvalues₀` (`Analysis/Matrix/Spectrum.lean` 53), `Matrix.exp_conj` (`MatrixExponential.lean` 187, which needs `IsUnit U` and so does not cover a rectangular isometry: a reason `exp_intertwines` is a genuine target), `Matrix.linftyOpNormedRing` and `Matrix.frobeniusNormedRing` (`Analysis/Matrix/Normed.lean` 393, 653), and Tau Ceti `TauCeti/Analysis/Semigroups/{Basic,BoundedGenerator,UniformlyContinuous}.lean`. `Set.EquitableOn` (`Data/Set/Equitable.lean` 33) is `∀ a b ∈ s, f a ≤ f b + 1`, a condition on a function's values, and `Finpartition.IsEquipartition` (`Equipartition.lean` 38) applies it to `card`: the gloss "balanced cardinalities" fits the second only.

**Repair.** Record the four works in `sources.toml` with theorem and page locators and cite them at the claims; list the declarations above under `## Exact supplier contracts` with what is assumed of each.

## R09 (P3) — Surjectivity is carried twice

**Location.** `Suggested.lean` lines 24–26 (`IsEquitableFor` bundles `Function.Surjective cell`) and lines 45–47 (`isEquitableFor_iff_intertwines` takes `hcell` again).

**Claim.** As written the statement is true and `hcell` is not droppable: on `V = Fin 1`, `I = Fin 2`, `cell = const 0`, the intertwining `A * E = E * Q` holds (elaborated: `E = [1, 0]`, `Q = diag(a, 0)`) while `IsEquitableFor` fails on surjectivity (elaborated). But the forward direction then proves surjectivity from a hypothesis that assumes it. **Repair.** Either keep surjectivity out of the predicate and make `hcell` the standing hypothesis of the Hilbert-tier theorems (matching Convention 2 and 3), or keep it in the predicate and state the iff as `IsEquitableFor A cell ↔ Function.Surjective cell ∧ A * E = E * Q`. Say which in the README.

## Verified sound

**Gate and build.** Gate at 62d083f: `build=0`, `depcheck=0`, `sorry-data=0`, `set_option=0`; failures `imports`, `mathlib-subimports`, `no-import-mathlib`, `target-ids`, `metadata` (R01, R03, R04). No change outside the roadmap folder (`git diff --stat origin/main...HEAD` excluding the folder is empty).

**Dependency check.** `gate --depcheck … --movable`: `depcheck: 156 roadmaps, 1060 edges, 0 problem(s)`; no UPWARD or CYCLE line. The README has no `*Needs:*` lines, so the result is vacuous (R01). EquitableOperatorReduction is last in the merge order; its three consumers are open pull requests by the same author and are not in the order yet.

**Ownership.** `roadmaps grep -i equitable` over main and 365 open heads: the only other hits are `Regularity` on main (equipartitions, a different notion, as the README says) and the three consumers #258, #259, #260. `lumpab|divisor matrix|quotient matrix`: no owner elsewhere; `MarkovChainsAndRenewal` on main (line 47) only adapts to row-stochastic matrices. Interlacing and Davis–Kahan: owners found (R06). Ownership against open pull requests whose files the brief does not give me was not checked.

**Elaboration.** `Suggested.lean` is as the signatures file records (9 declarations, no dropped binders). My probe copy under `import Mathlib`, elaborated twice with `lake env lean`: the four theorems with `simp`/`rfl` (three fail, as a real target should), `compressed_isHermitian` with one library lemma (closes: R05), two headline candidates (elaborate: R02), and three computed examples (close).

**Adversarial table.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `branchSum` orientation (Conv. 5) | path 1–2–3, cells c = {2}, ℓ = {1,3} | row 2 into ℓ: A₂₁+A₂₃ = 2; row 1 into c: 1; row 1 into ℓ: 0; equals BH `b_{ij}` row sums of blocks (line 1403) and lumpability `P(x → C_j)` | sound | none |
| `IsEquitableFor` | path P3 with {2},{1,3}; path P4 with {1},{4},{2,3}; discrete; indiscrete | P3: both leaves give (1,0): equitable. P4 refinement: row 2 into {1} = 1, row 3 into {1} = 0: not equitable (README's refinement counterexample, line 116, true). Discrete: always. Indiscrete: iff constant row sums | sound | none |
| `cellEmbedding`, `EᴴE = 1` | indiscrete n = 2; `Fin 1 → Fin 2` const; V = I = ∅ | n = 2: E = (1,1)/√2, EᴴE = ½+½ = 1. Const: E = [1 0], EᴴE = diag(1,0) ≠ 1 (surjectivity needed; hypothesis present). Empty: 0×0 = 1 | sound | none |
| `compressed` = `K^{1/2} B K^{-1/2}` (README line 13; BH line 1405) | P3 with c,ℓ; symmetric 2×2 indiscrete | K = diag(1,2), B = [[0,2],[1,0]]: Q_{cℓ} = √(1/2)·2 = √2, Q_{ℓc} = √2·1 = √2, Hermitian, B not symmetric (Layer 2 gate, line 141, true); agrees with Bachman (10) √(d_{cℓ}d_{ℓc}) = √2. Indiscrete [[a,b],[b,a]]: Q = a+b = common row sum (elaborated) | sound | none |
| `isEquitableFor_iff_intertwines` | P3 (→); `Fin 1 → Fin 2` const (←) | →: A e_c = (1,0,1) = √2 e_ℓ = (EQ)_{·c}. ←: intertwining holds, predicate fails: `hcell` necessary | sound | R09 (form) |
| `compressed_isHermitian` | A = [[0,1],[0,0]], cell = id; any A | Q = A not Hermitian: hypothesis needed; closes by `isHermitian_conjTranspose_mul_mul` | padding | R05 |
| `exp_intertwines` | t = 0; n = 1 term; non-surjective cell | t = 0: E = E. Induction `AⁿE = EQⁿ` from `AE = EQ`; termwise in the series. Holds without surjectivity | sound | none |
| `residual` | P3 with {1},{2,3} | Q = [[0,1/√2],[1/√2,1]]; R = A E − E Q: column 1 = (0, ½, −½), column 2 = 0; nonzero, matching row 2 into {1} = 1 ≠ 0 = row 3 | sound | none |
| spectral inclusion (README line 136) | P3; `Fin 1 → Fin 2` const | P3: spec Q = {±√2} ⊆ {±√2, 0}. Const: spec Q = {a, 0} ⊄ {a}: needs surjective cell | sound under Conv. 2 | R01 (hypothesis), R02 (state it) |
| multiplicities / lifting (line 136) | K_{p,q} (BH line 1427) | B = [[0,p],[q,0]], eigenvalues ±√(pq) = nonzero eigenvalues of K_{p,q} | sound | none |
| interlacing (line 138) | BH Thm 2.5.1 hypotheses | needs `SᵀS = I`, real symmetric; Hermitian by Remark line 1543; tight ⇒ equitable (Cor. 2.5.4) | sound | R06 (owner) |
| Duhamel bound (line 168) | t = 0; R = 0 | both sides 0; R = 0 recovers `exp_intertwines` | sound, statable | R02 |
| Bachman Theorem 2 (line 157, 172) | singleton cells | `⟨b|e^{−itA}|a⟩ = ⟨π(b)|e^{−itQ}|π(a)⟩` needs a, b in singleton cells (line 345) | hypothesis missing in README | R01 |
| Conv. 4 `E : I →ₗ[𝕜] V` | — | I, V are types | type slip | R07 |
| `Set.EquitableOn` gloss (line 40) | pin | `f a ≤ f b + 1` on values; `IsEquipartition` applies it to `card` | imprecise | R08 |

**Library declarations opened at the pin.** `Matrix.isHermitian_conjTranspose_mul_mul` (Hermitian.lean 292); `Matrix.rowStochastic`, `colStochastic` (Stochastic.lean 46, 129); `Set.EquitableOn` (Data/Set/Equitable.lean 33); `Finpartition.IsEquipartition` (Equipartition.lean 38); `Finpartition.ofSetoid` (Finpartition.lean 846); `SimpleGraph.adjMatrix` (238), `lapMatrix` (67); `Matrix.IsHermitian.eigenvalues₀`, `eigenvalues₀_antitone` (Analysis/Matrix/Spectrum.lean 53, 56); `Matrix.exp_conj` (MatrixExponential.lean 187); `Matrix.topologicalRing` (Topology/Instances/Matrix.lean 168); `linftyOpNormedRing`, `frobeniusNormedRing` (Analysis/Matrix/Normed.lean 393, 653); no `interlac` anywhere in the pinned Mathlib; Tau Ceti `Analysis/Semigroups/` modules listed above; no `equitable` in the pinned Tau Ceti.

**Cross-roadmap citations resolved.** OperatorTheory on main (Davis–Kahan lines 24, 57; PrincipalAngles 44–46; Courant–Fischer PD-A51), RandomMatrices at its head (Cauchy interlacing, lines 71, 197), Regularity on main (line 75, `IsEquipartition`), DenseGraphLimits (Completed), MarkovChainsAndRenewal on main (line 47). The worker's citation scan found nothing unresolved because the README names no roadmap by name.

**Sources read.** brouwer-haemers (author page, 255 pages): lines 1388–1420, 1421–1445, 1481–1497, 1528–1546. bachman-pst-quotient (arXiv:1108.0339v2): lines 305–370. Both agree with the README's conventions (row-sum orientation, normalized columns, `K^{1/2}BK^{-1/2}`).

## Not verifiable

- The seeded sample of 15 targets is empty: the README has no locators and no `sources.toml`, so there was nothing to sample by locator; I verified the four referenced works' identity and the statements they support instead (above).
- Godsil–Royle, *Algebraic Graph Theory*: DOI prefix 10.1007 is paywalled; the service recorded it `uncertified`. Lemma 9.3.1, p. 196 is corroborated by bachman-pst-quotient line 317–318 only.
- Horn–Johnson, *Matrix Analysis*: cited for nothing specific; not fetched.
- Ownership against open pull requests whose files this brief does not provide was not checked.

## Source issues

- **Misprint** in brouwer-haemers at Section 2.3, printed page 24: the source indexes the block identity over `i, j = 0, …, d`; it should be `i, j = 1, …, m`, the number of parts; affects nothing.
