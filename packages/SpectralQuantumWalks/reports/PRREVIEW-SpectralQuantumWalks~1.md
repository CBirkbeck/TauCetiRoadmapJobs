# Review of SpectralQuantumWalks (pull request #258 at 162e2af)

**Verdict:** needs changes

The gate fails (sorry'd data, imports, residue, target structure, metadata), so there is no acceptance at this head whatever the mathematics. The mathematics has one false Lean theorem and one family of prose claims that need a real-symmetry hypothesis; the rest of the headline material is correct where it is specific, and is confirmed by computation below.

## R01 (P1) — `stronglyCospectral_of_hasPSTAt` is false for the Hermitian carrier

Location: `TauCetiRoadmap/SpectralQuantumWalks/Suggested.lean` lines 36–38 and 52–53 ("Perfect state transfer forces the projector sign relations").

Claim: for Hermitian `A`, `HasPSTAt A u v t` implies that for every real `lam` there is `eps ∈ {1, −1}` with `E_lam e_u = eps · E_lam e_v`.

Witness: `A = !![0, i; −i, 0]` (Hermitian, zero diagonal), `t = π/2`. Then `U(π/2) = !![0, 1; −1, 0]`, so `U(π/2) e_0 = −e_1` and `HasPSTAt A 0 1 (π/2)` holds. The projector at eigenvalue `1` is `E_1 = ½ !![1, i; −i, 1]`, and `E_1 e_0 = (½, −i/2) = (−i) · E_1 e_1`. No `eps ∈ {1, −1}` works. The `±1` in Godsil's Corollary 2.2 comes from the projectors being real (godsil-state-transfer line 128–129: "both real, β = ±1"); for a complex Hermitian matrix the phase is `γ·exp(itλ)` (godsil-state-transfer line 115–118, Lemma 2.1, which does hold for Hermitian `A`).

Repair (tested on the witness): either (a) state the theorem for real symmetric input, e.g. `(A : Matrix V V ℝ) (hA : A.IsSymm)` with the walk on `A.map (algebraMap ℝ ℂ)`, or carry `(hre : ∀ i j, (A i j).im = 0)` next to `hA`; or (b) keep the Hermitian carrier and define strong cospectrality with a unimodular phase, `∃ eps : ℂ, ‖eps‖ = 1 ∧ ∀ x, E x u = eps * E x v`, proving the `±1` form as the real-symmetric specialisation. On the witness, (a) excludes `A` and (b) is satisfied with `eps = −i`. Add the witness to the README as a negative-control Check for the `±1` definition.

## R02 (P1) — `spectralProjector` is sorry'd data

Location: `TauCetiRoadmap/SpectralQuantumWalks/Suggested.lean` lines 32–33; gate rule `sorry-data`. `StronglyCospectral` (line 36) and `stronglyCospectral_of_hasPSTAt` (line 52) mention it, so neither states anything checkable.

Witness: the gate output lists `line 32: noncomputable def spectralProjector … := sorry`. The elaborated type (worker's signature check, confirmed by my `#check`) is `{V : Type u_1} → (A : Matrix V V ℂ) → A.IsHermitian → ℝ → Matrix V V ℂ`: the `[Fintype V] [DecidableEq V]` binders are gone because the body is `sorry`.

Repair (elaborated at the pin with `import Mathlib`): the projector is Mathlib's Hermitian functional calculus applied to the indicator of `{lam}`:

```lean
noncomputable def spectralProjector (A : Matrix V V ℂ) (hA : A.IsHermitian) (lam : ℝ) :
    Matrix V V ℂ :=
  hA.cfc (Set.indicator {lam} 1)
```

`Matrix.IsHermitian.cfc` is `Mathlib/Analysis/Matrix/HermitianFunctionalCalculus.lean` line 132 (conjugation of `diagonal (f ∘ eigenvalues)` by `eigenvectorUnitary`), and `Matrix.IsHermitian.cfc_eq` (line 143) identifies it with the generic `cfc`. With this body the elaborated type regains `[Fintype V] [DecidableEq V]`. For `lam` outside the spectrum the value is `0`, which is the intended junk value.

## R03 (P2) — PST symmetry, `2t`-periodicity and the `±` phase conditions need real symmetry

Location: `TauCetiRoadmap/SpectralQuantumWalks/README.md` line 49 (carrier: "an arbitrary finite Hermitian complex matrix"), lines 124–126 ("PST symmetry, time reversal", "PST from `u` to `v` implies periodicity at both vertices at time `2t`"), line 111 (`E_λ e_u = ± E_λ e_v`), line 131 (PGST "phase conditions"), line 142 ("plus/minus strong-cospectral support").

Claim: these hold for the Hermitian carrier.

Witness: `A = (2π/(3√3)) · !![0, i, −i; −i, 0, i; i, −i, 0]` (Hermitian, zero diagonal, eigenvalues `0, ±2π/3`). Computed: `U(1)` is the cyclic permutation matrix with `U(1) e_0 = e_2`, `U(1) e_2 = e_1`, `U(1) e_1 = e_0`, and `U(2) e_0 = e_1`. So there is PST `0 → 2` at `t = 1`, no PST `2 → 0` at `t = 1`, and no periodicity at `0` at time `2`. Godsil's Lemma 1.1 proves symmetry from "`H(τ)` is symmetric" (godsil-state-transfer line 51, 60), and Lemma 13.1 for PGST from "real vectors" (line 779).

Repair: state each of these targets for real symmetric `A` (the Mathlib carrier `Matrix V V ℝ` with `IsSymm`, mapped to `ℂ`), keep the Hermitian versions that survive (Lemma 2.1's phase relation, unitarity, `U(−t) = U(t)ᴴ`, PST `u → v` at `t` gives PST `v → u` at `−t`), and add the two chiral matrices above as Checks separating the two carriers. Convention 2 should say which statements are Hermitian and which are real-symmetric.

## R04 (P2) — `HasPSTAt` contradicts Convention 3

Location: `README.md` lines 52–55 ("Define PST at time `t` by `U_A(t)e_u = γ e_v` … Do not use the modulus statement as a shortcut") versus `Suggested.lean` lines 28–29 (`HasPSTAt A u v t := ‖amplitude A t u v‖ = 1`) and 45–49.

Claim: README and Lean agree on the definition of PST.

Witness: the Lean definition is the modulus statement the README forbids as a definition, and `hasPSTAt_iff_exists_phase` proves the README's definition as a theorem about it, the opposite direction. Without `hA` the modulus definition is not transfer: for `A = !![0, 1; 0, 0]` (`A² = 0`, so `U(t) = 1 − itA`), `amplitude A 1 1 0 = −i` has modulus `1`, so `HasPSTAt A 1 0 1` holds, while `U(1) e_1 = e_1 − i e_0` is not a multiple of `e_0`.

Repair: define `HasPSTAt A u v t := ∃ γ : ℂ, ‖γ‖ = 1 ∧ (unitaryEvolution A t) *ᵥ Pi.single u 1 = γ • Pi.single v 1` and state `hasPSTAt_iff_norm_amplitude (hA : A.IsHermitian) : HasPSTAt A u v t ↔ ‖amplitude A t u v‖ = 1`. On the witness the new definition fails and the equivalence is not claimed (no `hA`).

## R05 (P2) — statable headline theorems are absent from `Suggested.lean`

Location: `README.md` lines 213–224 (acceptance gates) against `Suggested.lean`, which states only unitarity, the modulus/phase equivalence and PST ⇒ strong cospectrality.

Claim: the file states the roadmap's headline theorems.

Witness: each of the following is statable at the pins with at most one simple definition, and none is stated or named as not statable:

- Antipodal hypercube PST at `π/2` and instantaneous uniform mixing at `π/4` (README line 220–221). A hypercube on `Fin n → Bool` with `Adj x y ↔ (Finset.univ.filter fun i => x i ≠ y i).card = 1` is a one-line `SimpleGraph` with decidable adjacency; `SimpleGraph.adjMatrix` and `SimpleGraph.isHermitian_adjMatrix` (`Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean` line 52) are at the pin. Computed: on `Q_3`, `U(π/2)` has antipodal entry `i` and every other entry of that column `0`; `|U(π/4)|²` has every entry `1/8`.
- End-to-end PST on `SimpleGraph.pathGraph n` (`Mathlib/Combinatorics/SimpleGraph/Hasse.lean` line 108) iff `n = 2` or `n = 3` (godsil-state-transfer line 794–796 and 845–861; christandl-pst-spin-networks line 386–388). Computed: `P_3` amplitude at `π/√2` is `−1`; `P_4` supremum of the end-to-end modulus over `t ≤ 40` is `0.9962`.
- Complete-graph search (README line 223): for `A = adjMatrix ℂ (⊤ : SimpleGraph V)` (`SimpleGraph.adjMatrix_top`, `AdjMatrix.lean` line 253), `H = −(1/n)A − |w⟩⟨w|` and the uniform start, the success probability is `sin²(t/√n) + cos²(t/√n)/n`, hence `1` at `t = π√n/2` (childs-goldstone-spatial-search line 272–284 for `L + NI = N|s⟩⟨s|`; the closed form follows from the two-dimensional reduction and is checked below for `n = 4, 16`).
- Godsil's ratio condition (godsil-state-transfer line 329–333, Theorem 5.1) and the PST characterisation (line 598–602, Theorem 10.1), statable once `spectralProjector` has the body of R02 and the eigenvalue support is `{λ | E_λ e_u ≠ 0}`.
- The average mixing matrix is doubly stochastic and no graph on at least three vertices is average uniform mixing (godsil-state-transfer line 1190–1191, Lemma 17.2; godsil-average-mixing-jcta line 77–80, Lemma 1.1), statable with a Cesàro limit of `fun T => (1/T) * ∫ t in (0:ℝ)..T, ‖amplitude A t u v‖^2`.

Repair: state these (with the hypercube, search-Hamiltonian and average-mixing definitions as real bodies), and for anything the author judges not statable say so in the module docstring with the missing carrier.

## R06 (P2) — the spectral projector theory restates Mathlib's Hermitian functional calculus

Location: `README.md` lines 105–108 ("projector orthogonality, completeness, Hermitian/idempotent laws") and line 98 (expansion `U(t) = Σ exp(−itλ) E_λ`); supplier list lines 76–77 does not name the calculus.

Claim: these are targets of this roadmap.

Witness at the pin: with `E_λ := hA.cfc (Set.indicator {λ} 1)`, idempotence and orthogonality are `cfc_mul` (indicator products), Hermitian-ness is `cfc_star`, completeness `Σ_{λ ∈ spectrum} E_λ = 1` is `cfc_sum` plus `cfc_const_one` (all in `Mathlib/Analysis/CStarAlgebra/ContinuousFunctionalCalculus/Unital.lean`, checked by `#check` at the pin), and the expansion is `Matrix.IsHermitian.spectral_theorem` (`Mathlib/Analysis/Matrix/Spectrum.lean` line 136) with `Matrix.exp_units_conj` and `Matrix.exp_diagonal` (`Mathlib/Analysis/Normed/Algebra/MatrixExponential.lean` lines 156 and 84). The OperatorTheory family on main also owns "finite-dimensional point-spectral subspaces/projectors" (`TauCetiRoadmap/OperatorTheory/README.md` lines 110–113; `PrincipalAngles` target PA-C17 `pointSpectralSubspace`).

Repair: in `## Exact supplier contracts` name these declarations; keep as this roadmap's own only what is new (local support, matrix-element formulas `(E_λ)_{uu}`, cospectrality, strong cospectrality, basis-insensitivity as a consequence of the `cfc` form), and add one agreement target: `E_λ` is the orthogonal projection onto `pointSpectralSubspace (Matrix.toLin' A) {λ}` of PrincipalAngles.

## R07 (P2) — suppliers are cited by pull-request number, without sections

Location: `README.md` lines 33, 37, 82, 85, 249–250 (`[equitable-roadmap]: …/pull/257`, `[operator-roadmap]: …/pull/126`).

Claim: the consumed material is owned and named.

Witness: pull request 126 was merged on 2026-10-08; its content is the `OperatorTheory` roadmap on main (sub-roadmaps `SelfAdjointSpectralTheory`, `SpectralSubspacePerturbation`, `PrincipalAngles`, `MatrixSpectralStatistics`). Pull request 257 is the open draft `EquitableOperatorReduction` (head 62d083f), whose Layer 3 states `exp(tA) E = E exp(tQ)` (`exp_intertwines` in its `Suggested.lean`, line 56) and whose Layer 4 states the residual bounds. The README names neither roadmap nor section, so the dependency check sees no edge (`depcheck: 156 roadmaps, 1060 edges, 0 problem(s)` is silent about this roadmap's suppliers), and the consumed statements (README lines 129–130, 185–186, 190) are unowned on paper.

Repair: replace the links by "EquitableOperatorReduction, Layer 3 (exact exponential intertwining)" and "Layer 4 (residual bounds)", and "OperatorTheory/SpectralSubspacePerturbation, Part C (Davis–Kahan)" or "PrincipalAngles" as appropriate, each in `## Exact supplier contracts` with what is assumed. EquitableOperatorReduction is not yet in the merge order; as a new-folder pull request it is a legal supplier and the check will place this roadmap after it.

## R08 (P2) — computational decision procedures and optional scope

Location: `README.md` lines 210–211 ("Computational decision procedures may accompany the theory, but their soundness and completeness must be proved").

Claim: algorithms are in scope, optionally.

Witness: the planning principles exclude computational algorithms, and "may accompany" is optional scope. The same paragraph's "A table of isolated computed examples is not a replacement for a family theorem" is right and sufficient.

Repair: delete the sentence; the mathematics of a decision criterion (for example the ratio condition as an `iff`) stays as a target.

## R09 (P3) — imports

Location: `Suggested.lean` lines 1–3; gate rules `imports`, `mathlib-subimports`, `no-import-mathlib`.

Witness: `import Mathlib.Analysis.Matrix.Spectrum`, `import Mathlib.Analysis.Normed.Algebra.MatrixExponential`, `import Mathlib.Combinatorics.SimpleGraph.AdjMatrix`. The repair of R02 needs `HermitianFunctionalCalculus`, which these do not import (my first probe failed on `Matrix.IsHermitian.cfc` for that reason).

Repair: the single line `import Mathlib`. Elaboration with it passes (checked).

## R10 (P3) — `metadata.toml` missing

Location: `TauCetiRoadmap/SpectralQuantumWalks/`; gate rule `metadata`.

Repair: add `metadata.toml` with `topic = "math.CO"` (sibling roadmaps use one `topic` line, e.g. `TauCetiRoadmap/OperatorTheory/metadata.toml`).

## R11 (P3) — process residue and narrative

Location: `README.md` line 13 ("a tested catalogue"; gate rule `residue`), lines 14–16 ("Existing proofs in Graphplay show that a substantial portion is reachable"), lines 226–239 ("A full local build at that commit completed successfully (3,975 jobs)", "The Graphplay author is coordinating this roadmap"), `Suggested.lean` lines 8–10 ("These probes", "not exhaustive").

Claim: the README is timeless.

Repair: cut the build report and the coordination sentence; keep Graphplay as one line under `## References` as provenance (a cited repository at a commit), and replace "catalogue" by "library". In the Lean docstring use the house form "<title>: target signatures" and name the headline theorems that are not statable (R05).

## R12 (P3) — no targets, locators, API lists or Checks

Location: `README.md` lines 88–211; gate rule `target-ids` ("layered README states no targets").

Claim: the README is in roadmap form.

Witness: there is no `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, no `### k.n` target with hypotheses, no `*Needs:*` line, no API bullets, no `**Checks.**` list, no `### Examples`/`### Dependencies`, no `## Downstream consumers` (DiscreteQuantumWalks at its open head says it consumes this roadmap's graph-family definitions), and no locator at any claim; `## References` lists titles without theorem or page numbers. Indefinite scope: "where available" (line 79), "when … is proved in the library" (line 194), "where they illustrate a general theorem" (line 206), "only with complete matrix formulas" (line 177). Locators that the open sources support, for the author's use: PST symmetry and `2τ` periodicity godsil-state-transfer Lemma 1.1 (line 53, p. 2); phase relation Lemma 2.1 (line 115, p. 4); `±` relation Corollary 2.2 (line 126); eigenvalue support Lemma 2.3 (line 140); minimal period Lemma 3.1 (line 167, p. 5); `P_3` Lemma 4.1 (line 221, p. 7); Cartesian powers Theorem 4.3 (line 300, p. 8); ratio condition Theorem 5.1 (line 329, p. 9); periodic graphs Theorem 5.2 (line 336); PST characterisation Theorem 10.1 (line 598, p. 16); bipartite Corollary 10.3 (line 618); walk matrices and PST Lemma 11.1, Theorem 11.4 (lines 650, 685); PGST Lemma 13.1 (line 770, p. 21); products Lemma 16.1–16.2 (lines 1031, 1069, pp. 27–28); average uniform mixing Lemma 17.2 (line 1190, p. 31); paths' average mixing Theorem 17.3 (line 1216). Note that Godsil writes `H(t) = exp(itA)`; the roadmap's `exp(−itA)` is its complex conjugate for real `A`, which should be said once in `## Conventions`.

Repair: rewrite in the house shape with those locators; each definition with API bullets and at least three Checks (the computed values in the table below are candidates).

## R13 (P3) — search convention versus the cited source

Location: `README.md` lines 67–69 (Convention 7, `H(A, γ, w) = −γ A − |w⟩⟨w|`) and line 247.

Witness: childs-goldstone-spatial-search defines the walk with the Laplacian `L = A − D` (line 145–146) and the search Hamiltonian from `L`; for a `k`-regular graph `−γL = −γA + γk·I`, so the two conventions agree up to a scalar shift only on regular graphs. On the complete graph both give the two-dimensional rotation (line 272–284), and the computed success probability under the README's convention is `1` at `π√n/2` for `n = 4, 16`.

Repair: say in Convention 7 that the adjacency form is chosen, that it agrees with the Laplacian form of Childs–Goldstone on regular graphs up to a phase, and cite §III.A for the complete graph.

## R14 (P3) — Layer 4 and Layer 7 claims without their theorems

Location: `README.md` lines 157–166 and 201–206.

Witness: "rationality for integral symmetric matrices" is godsil-average-mixing-jcta Lemma 2.3 (line 111, p. 4) and, for unitary `U`, Theorem 10.1 (line 825, p. 19); "positive semidefiniteness, trace and rank bounds" is Lemma 2.2 (line 98: eigenvalues in `[0, 1]`); "exact relations and separations" should name Godsil's Lemma 17.2 (no average uniform mixing on `≥ 3` vertices) with the hypercube as its Check (computed `Q_2`: average mixing entries `3/8, 1/8, 1/8, 3/8` per row). For paths, PST end-to-end only for `P_2, P_3` (sources in R05) and PGST on `P_n` iff `n + 1` is a prime, twice a prime, or a power of two (godsil-kirkland-severini-smith-pgst line 68–70). The cycle classification has no source in the README; computed: `C_4` reaches modulus `1`, `C_5` at most `0.647` and `C_6` at most `0.866` over `t ≤ 40`.

Repair: state each as a target with hypotheses and the locator above; cite a source for cycles.

## R15 (P3) — binders dropped from `spectralProjector` and `StronglyCospectral`

Location: `Suggested.lean` lines 32 and 36; the worker's signature check and my `#check` show both without `[Fintype V] [DecidableEq V]`.

Repair: follows from R02 (a real body mentions the instances). After the edit, `#check @StronglyCospectral` must show both instance binders.

## Verified sound

Gate: the worker's gate at 162e2af fails on `sorry-data`, `residue`, `imports`, `mathlib-subimports`, `no-import-mathlib`, `target-ids`, `metadata`; `build=0`, `depcheck=0`, `outside-folder=0`. `git diff --stat origin/main...HEAD` outside the roadmap folder: empty. Dependency check run by me: `depcheck: 156 roadmaps, 1060 edges, 0 problem(s)`; no UPWARD or CYCLE line (and no edge for this roadmap at all, see R07). This roadmap is last in the merge order; its only pull-request supplier, EquitableOperatorReduction, is not yet in the order.

Elaboration: `lake env lean` on `Suggested.lean` as submitted: four `sorry` warnings, no errors. Signature check: the eight elaborated types agree with the worker's `signatures.md`; two lost binders (R15). One-tactic probe on a scratch copy: `simp [unitaryEvolution]`, `rfl`, `simp [HasPSTAt, amplitude]`, `simp [StronglyCospectral]`, `simp_all` each leave the three sorried theorems open, so none is padding by that test. Statability probe with `import Mathlib`: the body `hA.cfc (Set.indicator {lam} 1)` elaborates with both instance binders (R02).

Library declarations opened at the pin: `Matrix.IsHermitian.cfc` (HermitianFunctionalCalculus.lean:132), `cfc_eq` (:143), `instContinuousFunctionalCalculus` (:97); `Matrix.IsHermitian.eigenvalues` (Spectrum.lean:60), `eigenvectorUnitary` (:82), `spectral_theorem` (:136); `Matrix.exp_diagonal` (MatrixExponential.lean:84), `exp_conjTranspose` (:95), `exp_add_of_commute` (:130), `exp_units_conj` (:156), `exp_neg` (:177); `hasDerivAt_exp_smul_const` (needs a `NormedRing` instance on matrices, which is local in Mathlib); `SimpleGraph.adjMatrix` (AdjMatrix.lean:238), `adjMatrix_top` (:253), `isSymm_adjMatrix` (:264), `adjMatrix_pow_apply_eq_card_walk` (:403); `SimpleGraph.isHermitian_adjMatrix` (LapMatrix.lean:52); `SimpleGraph.boxProd` (Prod.lean:43), `pathGraph` (Hasse.lean:108), `cycleGraph` (CycleGraph.lean:29), `circulantGraph` (Circulant.lean:29), `mulCayley` (Cayley.lean:36); `Matrix.kroneckerMap`, `mul_kronecker_mul` (Kronecker.lean:382); `Module.End.eigenspace` (Eigenspace/Basic.lean:405); `Submodule.starProjection` (Projection/Basic.lean:124). Not at the pin: a hypercube or Hamming graph, the adjacency matrix of `boxProd` as a Kronecker sum, Kronecker's simultaneous approximation theorem (only `AddCircle` density and Dirichlet approximation exist), the `IsStarNormal` matrix calculus. Tau Ceti at the pin has no quantum-walk, cospectrality or Kronecker-product material (grep of `TauCeti/`).

Ownership: `roadmaps grep` over main and the 365 open heads for quantum walk, state transfer, cospectral, average mixing, spatial search, hypercube, Hamming graph, circulant/Cayley spectra: no owner other than this pull request and its siblings. Sibling heads read: EquitableOperatorReduction (#257, 62d083f) owns partitions, compression, intertwining and residual bounds and explicitly disowns PST; DiscreteQuantumWalks (#259) owns discrete-time walks and consumes this roadmap for graph families; StructuredBlockOperators (#260) disowns quantum algorithms. No two `Suggested.lean` files declare the same fully qualified name. Kronecker's simultaneous approximation theorem is unowned elsewhere, so it is correctly a target here. Ownership against open pull requests whose files the brief did not give was not checked beyond the grep index.

Sources: the worker's seeded sample was empty (the README has no targets), so I checked the roadmap's claims against the open-access texts fetched through the sources service: godsil-state-transfer (arXiv 1102.4898): Lemmas 1.1, 2.1, 2.2, 2.3, 3.1, 4.1, Theorems 4.3, 5.1, 5.2, 10.1, Corollary 10.3, Lemma 11.1, Theorem 11.4, Lemma 13.1, Lemmas 16.1–16.2, 17.2, Theorem 17.3; christandl-pst-spin-networks (quant-ph/0411020): paths `N = 2, 3` (line 386–388), hypercube antipodal transfer at `π/2` (line 526–530), `C_4` as `Q_2` (line 539–544); childs-goldstone-spatial-search (quant-ph/0306054): Laplacian convention (line 145), complete graph (line 272–284); godsil-average-mixing-jcta (arXiv 1103.2578): Lemmas 1.1, 2.2, 2.3, Theorems 9.1, 9.3, 10.1; godsil-kirkland-severini-smith-pgst (arXiv 1201.4822): main theorem (line 68–70). Every statement the README makes that these sources cover is supported with the hypotheses noted in R03 (real symmetry) and R13 (Laplacian convention).

Adversarial table (values computed by hand or by a pure-Python matrix exponential; `U(t) = exp(−itA)`):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `unitaryEvolution` (Convention 1) | `A = 0`; `K_2`, `t = π/2`; chiral `!![0,i;−i,0]`, `t = π/2`; non-Hermitian `!![0,1;0,0]`, `t = 1` | `U = 1`; `U = !![0,−i;−i,0]`; `U = !![0,1;−1,0]`; `U = !![1,−i;0,1]` (not unitary) | sign and orientation pinned; `hA` needed for unitarity | none |
| `amplitude` orientation | `K_2`: amplitude `0 → 1` | `U 1 0 = −i` (Godsil's `exp(+itA)` gives `+i`) | agrees with README line 47–48 | note the sign in locators (R12) |
| `HasPSTAt` | `K_2` at `π/2`; `!![0,1;0,0]`, `u = 1, v = 0, t = 1` | `‖−i‖ = 1`; `‖−i‖ = 1` but `U e_1 = e_1 − i e_0` | modulus definition is not transfer without `hA` | R04 |
| `unitaryEvolution_unitary` | Hermitian: `Uᴴ = exp(itAᴴ) = exp(itA)`, `U(t)U(−t) = exp(0) = 1` | identity holds via `exp_conjTranspose`, `exp_add_of_commute` | true | none |
| `hasPSTAt_iff_exists_phase` | unitary column of norm `1` with an entry of modulus `1` | remaining entries `0`; converse by `‖γ‖ = 1` | true both directions with `hA` | none |
| `spectralProjector` | `λ ∉ spectrum`; `K_2`, `λ = ±1`; chiral 2×2, `λ = 1` | `0`; `½!![1,±1;±1,1]`; `½!![1,i;−i,1]` | intended object is `cfc (indicator {λ})` | R02 |
| `StronglyCospectral` | `K_2` ends; `P_3` ends; chiral 2×2 | `E_1 e_0 = E_1 e_1`, `E_{−1} e_0 = −E_{−1} e_1`; `E_0 e_0 = −E_0 e_2`, `E_{±√2} e_0 = E_{±√2} e_2`; `E_1 e_0 = (−i) E_1 e_1` | `±1` form is the real-symmetric notion | R01 |
| `stronglyCospectral_of_hasPSTAt` | chiral 2×2 at `π/2` | PST holds (`U e_0 = −e_1`), no `eps ∈ {±1}` | false | R01 |
| Layer 2 PST symmetry, `2t` periodicity | chiral 3-cycle `A = (2π/(3√3))·!![0,i,−i;−i,0,i;i,−i,0]` | `U(1) e_0 = e_2`, `U(1) e_2 = e_1`, `U(2) e_0 = e_1` | false for Hermitian, true for real symmetric | R03 |
| Layer 1 cospectrality by closed walks | `P_3`: ends vs centre | `(A²)_{00} = 1`, `(A²)_{11} = 2`; ends: all `(A^k)_{uu}` equal by the mirror automorphism | discriminates | none |
| Convention 5 average mixing | `Q_1`; `Q_2` | `M = ½J`; rows `(3/8, 1/8, 1/8, 3/8)`, sums `1`, while `|U(π/4)|² = ¼` everywhere | uniform instantaneous but not average: README consistent, Godsil 17.2 | none |
| Hypercube gates (README 220–221) | `Q_3` | antipodal amplitude at `π/2` is `i`, other entries of the column `0`; `|U(π/4)|²` entries all `1/8` | true | state in Lean (R05) |
| Cartesian product factorisation | `Q_n = K_2^{□n}` | antipodal amplitude `(−i)^n`; `n = 3` gives `i` (matches) | true | none |
| Paths | `P_3` at `π/√2`; `P_4`, `t ≤ 40` | amplitude `−1`; supremum `0.9962` | PST only `P_2, P_3`; PGST on `P_4` | R05, R14 |
| Cycles | `C_4`, `C_5`, `C_6`, `t ≤ 40` | max modulus `1`, `0.647`, `0.866` | only `C_4` among these | R14 (source needed) |
| Ratio condition (Godsil 5.1) | `K_2`; `P_4` | `(1−(−1))/(1−(−1)) = 1`; `(θ_1−θ_2)/(θ_1−θ_4) = 1/(2φ)` irrational | consistent with PST on `K_2`, none on `P_4` | none |
| Complete-graph search, `γ = 1/n` | `n = 4`; `n = 16`; closed form | `p(π) = 1.0000`; `p(2π) = 1.0000`; `p(t) = sin²(t/√n) + cos²(t/√n)/n` | exact | state in Lean (R05); R13 |
| Transition probabilities doubly stochastic | chiral 3-cycle, `t = 1` | row sums of `|U|²` all `1` | true for Hermitian | none |

## Not verifiable

- Godsil–Royle, *Algebraic Graph Theory*; Brouwer–Haemers, *Spectra of Graphs*; Godsil, *Periodic graphs* (README line 243–245): cited without a theorem or page, so there is nothing to check at a locator; not fetched.
- Graphplay at commit 822204a (README line 228–236): a code repository, not a mathematical source; its claims ("sorry-free", "3,975 jobs") were not checked and should not be in the README (R11).
- Ownership against open pull requests whose files were not provided: not checked beyond the `roadmaps grep` index.

## Source issues

- none
