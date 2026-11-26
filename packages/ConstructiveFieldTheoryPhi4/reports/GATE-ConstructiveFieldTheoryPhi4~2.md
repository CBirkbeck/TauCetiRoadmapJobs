# GATE-ConstructiveFieldTheoryPhi4~2: answers to the human review

One comment needs answering: kim-em's follow-up of 2026-11-26T05:55:07Z on head `3a2e7f1`. It makes five points, numbered H01–H05 below, and ends with the recommendation "(a) approve", which needs no reply of its own. Each point was checked against the files at `3a2e7f1`, against the content repository's main at `1d48986`, and against the cached source texts. All five hold, so they are answered without edits. One fact in H02 has changed since the comment was written: GibbsMeasuresAndTheIsingModel is now on main. `TauCetiRoadmap/ConstructiveFieldTheoryPhi4/README.md` and `Suggested.lean` are unchanged, and nothing was committed.

## H01 (kim-em) — answered

The scales are real throughout Layer 7, as stated:

- `ReachabilityScheme.L : ℕ → ℝ` (`Suggested.lean` line 609), with `one_le`, `tendsto_L` and `le_R : L n ≤ (R n k : ℝ)` (lines 617, 619 and 621) and integer volumes `R : ℕ → ℕ → ℕ` (line 611).
- `latticePoint`, `blockSecondMoment` and `rescaledField` take `L : ℝ` (lines 581, 587 and 594), and the block is `box d ⌊L⌋₊` (line 588).
- `gff_reachable` takes `L : ℕ → ℝ`, `1 ≤ L n` and `Tendsto L atTop atTop` (lines 702–703).

The Check at README line 623 was recomputed. At d = 1 and L = 3/2, `⌊3/2⌋₊ = 1` and `Λ_L = {−1, 0, 1}`. Independent Ising spins give Σ = 3. Exactly three lattice points have `1_Q(x/L) = 1`, so `⟨T_{1_Q,L}²⟩ = 3/3 = 1`, while the block V_2 gives Σ = 5 and 3/5. The block matches the source's `Λ_R = [−R, R]^d` and lattice spacing `a = 1/L` (`aizenman-duminilcopin-2021` lines 111 and 151; (1.15) at lines 161–166).

## H02 (kim-em) — answered

The boundary is stated from both sides. Since the comment, GibbsMeasuresAndTheIsingModel has merged to main (commit `11262d88` in `1d48986`), so the README's citations were checked against main rather than an open head.

- Every id that README line 732 cites exists on main with the subject the README gives it: Layers 1–3 (tail triviality and extremal measures, existence and specifications, uniqueness), §4.2 (the plus and minus states), §4.3 (uniqueness and the magnetization) and §5.2 (Peierls' argument).
- That roadmap's own Scope and ownership assigns to this one the GKS inequalities, Lee–Yang, FKG for real-valued spins, the free-boundary state, reflection positivity and the infrared bound (§§2.1, 3.1, 3.3, Layers 4–5). It also says "No result of it is used here" (its README lines 576–578).
- Its *Beyond this roadmap* section relies on our §3.1, through a ghost spin, and on our §2.1. Both are consistent with what those sections state: a ghost site with couplings `J_{xg} = h_x ≥ 0` is a ferromagnetic pair coupling on `V ∪ {g}`, which §3.1 covers.

## H03 (kim-em) — answered

Both corrections are in the text and are correct:

- **Layer 7 build guide.** README line 21 reads "Layer 7 combines Layers 1 and 6 … with 3.2 for the monotonicity of the block second moment in the volume", and the overview at line 15 says the same. This agrees with *Needs* of §7.1 (line 619) and with the Layer 7 Dependencies (line 683).
- **Potts locator.** Line 387 cites Duminil-Copin's Corollary 1.9 "for the free and monochromatic measures of the q-state Potts model, whose case q = 2 is the Ising model". The corollary is at `duminilcopin-2017-lectures` line 549, on p. 14 (the page runs from line 522 to line 562). It states convergence along `Λ_n = [−n, n]^d ∩ ℤ^d` (line 509), the same boxes as V_R here.

## H04 (kim-em) — answered

RelativisticQuantumFieldTheory is on main (commit `89c89691`). The sections the README consumes resolve there with the stated content:

- **§7.1** (its README line 4383): the heat integral, the multiplier `(4π²‖ξ‖² + m²)⁻¹`, exterior decay `exp(−c|x|)` for `0 < c < m`, and the radial massless kernel with its harmonic ambiguity classified.
- **§7.3 item 1** (line 4447): `G_m → G_0` for n ≥ 3 without subtraction.
- **§7.6** (line 4680): the massive reflected covariance.

Every supplier this README names is on main: StochasticCalculus §1.1, StandardDistributions §5.3, ZerosOfLFunctions §5.5 (`hadamard_of_orderLE_one`) and RelativisticQuantumFieldTheory. The dependency check reports no problem. The merge-order block itself is in the pull-request description, which this job does not edit.

## H05 (kim-em) — answered

Each part of Aizenman–Duminil-Copin's definition of a reachable field is specified at the source's generality:

- **§0.2 and §1.1.** The finite-volume Gibbs state (1.11)–(1.12) (`aizenman-duminilcopin-2021` lines 139–145).
- **§7.1.** The variables `T_{f,L}` and the block variance (1.14)–(1.15) (lines 159–166).
- **§7.2.** Definition 1.1 (lines 167–171): the double limit, volume first and then scale, along sequences in which the parameters vary.
- **§7.3 and §6.1–§6.4.** The realisation as a single random field in footnote 2 (lines 183–187), and the random-field and Gaussian vocabulary (1.4)–(1.7).

The limit `R/L → ∞` at fixed L in Definition 1.1 is the condition `R_{n,k} → ∞` as k → ∞ for each n.

## Verification

### Build

`lake build TauCetiRoadmap.ConstructiveFieldTheoryPhi4.Suggested`: `Build completed successfully (18258 jobs).` It printed 29 `declaration uses 'sorry'` warnings and no errors.

### Gate

`gate ConstructiveFieldTheoryPhi4: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

### Dependency check

`depcheck: 112 roadmaps, 1287 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.

### Citations and Lean names

`roadmaps resolve` on the README, against main at `1d48986` and 370 open heads, reports "None" for cross-roadmap citations and "None" for Lean names found nowhere.

The two leads in the job's citation list, `ReachabilityScheme.HasLimitLaw` and `ReachabilityScheme.fieldLaw` at README line 631, are declared in `Suggested.lean` (lines 646 and 637, inside `namespace ReachabilityScheme`).

### Elaborated signatures

`Suggested.lean` was not changed, so no new `#check` pass was run. The elaborated types of the Layer 7 declarations match H01 and README §§7.1–7.4:

- `latticePoint : {d} → ℝ → (Fin d → ℤ) → EuclideanSpace ℝ (Fin d)`;
- `blockSecondMoment : … → ℝ → ℕ → ℝ`;
- `rescaledField : {d} → ℝ → ℕ → ℝ → …`;
- `gff_reachable` with `(L : ℕ → ℝ)`, `∀ n, 1 ≤ L n`, `Tendsto L atTop atTop` and `∀ n k, L n ≤ ↑(R n k)`.

The signature list shows 0 dropped binders. Its four "elaboration errors" come from `#check` lines that the extraction built from docstring words (a `,` and an `and`), not from declarations of `Suggested.lean`.

### Ownership and sources

No construction was added, so no ownership question arises. The overlaps listing shows no open pull request that changes this roadmap and no dropped id. No new source was needed, and `needs-references.toml` was not written.

### Adversarial pass on the statements the answers rely on

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Block `Λ_L = [−L, L]^d ∩ ℤ^d = V_{⌊L⌋}` (`box d ⌊L⌋₊`) | d = 1: L = 1, 3/2, 2.999; d = 2: L = 3/2 | 3, 3, 5 and 9 points = `(2⌊L⌋ + 1)^d`; source `Λ_R = [−R, R]^d` | agrees | none |
| §7.1 `⟨T_{1_Q,L,Σ}²⟩ = 1` for R ≥ L | d = 1, J = 0, ρ_I: L = 3/2, R = 2; L = 2.999, R = 3 | `#{x : abs x ≤ L} = 3` against Σ = 3; 5 against Σ = 5; ratio 1. The ceiling block V_2 at L = 3/2 gives 3/5 | holds; the Check separates floor from ceiling | none |
| Potts locator, §4.2 | q = 2, free measure | Corollary 1.9 at `duminilcopin-2017-lectures` line 549, page 14 (lines 522–562); boxes `[−n, n]^d ∩ ℤ^d` at line 509 | matches | none |
| GibbsMeasuresAndTheIsingModel ids (Scope, line 732) | main `1d48986` | Layer 1 (its line 105), Layer 2 (207), Layer 3 (273), §4.2 (378), §4.3 (410), §5.2 (466); "No result of it is used here" (578) | all resolve | none |
| Ghost-spin use of §3.1 (their *Beyond*) | V = {x}, field h ≥ 0, ghost g | `⟨σ_x⟩_h = tanh h = ⟨σ_xσ_g⟩` with `J_{xg} = h ≥ 0`; Griffiths I gives `tanh h ≥ 0` | consistent with §3.1 | none |
| RelativisticQuantumFieldTheory §7.1 kernels (supplier contract, line 790) | d = 1, m = 1, x = 1; d = 3, 4 at m = 0 | `G_1(1) = e⁻¹/2`; `Γ(1/2)/(4π^{3/2}abs x) = 1/(4π abs x)` and `abs x^{−1}/(1 · 4π)` agree; d = 4: `1/(2 · 2π² abs x²) = 1/(4π² abs x²) = Γ(1)/(4π² abs x²)` | agrees with §7.1 Checks and README §7.4 Check 3 | none |
| §7.4 Check 1, `C_m(1_Q, 1_Q)` for d = 1 | m = 1; m → 0 | `(1/(2m)) · 2∫₀² (2 − u)e^{−mu} du = 2/m² − (1 − e^{−2m})/m³`; m = 1: `1 + e⁻² ≈ 1.135`; expansion `2/m − 4/3 + O(m)` | agrees | none |
| `gff_reachable` variance at a real scale | d = 1, m = 1, L = 3/2 | `(2 + 4/9)⁻¹ = 9/22`; `b = −(1 + 2/9) = −11/9`, `1/(2 abs b) = 9/22` | agrees | none |
| Definition 1.1 and the scheme of §7.2 | fixed n, R → ∞; parameters varying in n | `R/L_n → ∞` iff `R_{n,k} → ∞` at fixed `L_n ≥ 1`; ρ_n and J_n are indexed by n | matches the source's generality | none |
