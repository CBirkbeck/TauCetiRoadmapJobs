# Review of TracesOnCStarAlgebras (pull request #2464 at 9cb51ba)

**Verdict:** accepted

**Summary.** Accepted: this head repairs the one finding of the previous review (the Summary now states the K-theory isomorphism of Layer Tr4 for a densely defined lower semicontinuous trace) together with both small corrections and the format note, and the repairs introduce no new problem. This was an incremental re-review of the 66 README lines changed since `1d9b51d`; `Suggested.lean` is unchanged. There are no small corrections and no format notes; one licence question, carried from the previous review, is left for a human.

## Previous findings

- R01 — repaired: "Layer Tr4 proves that, for a densely defined lower semicontinuous trace, the inclusions `J_p ⊆ B` induce isomorphisms on `K₀` and `K₁`" (Summary, lines 14–16); Tr3 now reads "the trace ideals of a semifinite lower semicontinuous trace".
- C01 — repaired: "for a Dixmier trace `Tr_ω` of NoncommutativeGeometry N4 with a dilation-invariant `ω` (Tau Ceti `TauCeti.dixmierTrace`, additive on positive operators for such `ω`)" (Tr4.2, lines 540–541); the Tr4 Examples line 580 says the same.
- C02 — repaired: the description's Tr4 bullet now opens "For a densely defined lower semicontinuous trace, `K_*(J_p) ≅ K_*(B)`" and names "Dixmier traces with a dilation-invariant `ω`".
- N01 — repaired: "Thomsen [KMS], Theorem 1.1.1, for semi-weights; Kustermans–Vaes, Theorem 1.6, for lower semicontinuous weights; lower semicontinuous traces are both" (Tr1.2, lines 149–151).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Summary, Tr4 sentence (against Tr4.1) | `C[0,1]`, `∫ f t⁻¹dt`; `(K, Tr)` | first is not densely defined (`f(0) = 0` on `𝔪⁺`), so excluded; `K₀(S_p) = ℤ = K₀(K)` | holds; hypothesis equals Tr4.1's, line 488 | none |
| Summary, Tr3 sentence (against the standing hypothesis of Layer Tr3) | point trace on `C[0,1]` (`∞` off `f(x₀) = 0`) | semifinite and lsc; `J₁ = 𝔪 = {f(x₀) = 0}` | agrees with line 366 | none |
| Tr1.2 Combes, attribution (`IsTrace.lowerSemicontinuousOn_iff`) | a lsc trace against Thomsen's four axioms | additive gives subadditive; `τ(b) = τ(a) + τ(b − a) ≥ τ(a)`; `c = 0` gives `τ(0) = 0`, the `0·∞ = 0` convention; lsc assumed | a lsc trace is a semi-weight and a lsc weight; thomsen-kms lines 156–162, 207–212; kustermans-vaes lines 188–190 | none |
| Tr4.2 Dixmier-trace Check | `diag(1/(j+1))`; rank-one `e`; `S = diag(1/(j+1))`, `T = −S` | `Tr_ω = 1`; `Tr_ω(e) = 0`; `a + b ∈ L^(1,∞)`, `a, b ≥ 0` forces `a, b ∈ L^(1,∞)`; `K_N(S) + K_N(T) ≤ K_{2N}(S+T)` with `ω(m(2N)) = ω(m)` gives additivity | densely defined trace, `τ_* = 0` on `K₀(K) = ℤ[e]`, `Tr_ω ≠ 0`; needs dilation invariance as now stated | none |

The rows for the untouched statements stand as in the previous review, of `1d9b51d`.

- Source locators checked against the text: 2 in the changed passages (thomsen-kms Theorem 1.1.1 with the definition of a semi-weight, lines 156–162 and 207–212; kustermans-vaes Theorem 1.6, lines 188–190). Seeded sample: of the thirteen targets only 1.2 and 4.2 fall in changed passages; both are in the table.
- Library declarations opened at the pins: `TauCeti.dixmierTrace` (`TauCeti/Analysis/OperatorIdeal/Family/DixmierTrace.lean` line 91; its header, lines 41–43, says additivity on positive operators needs dilation invariance, and the file proves `dixmierTrace_add_le`, `dixmierTrace_eq_zero_of_rank_le` and `dixmierTrace_diagonalCLM_eq_one` for every `ω`); `TauCeti.GeneralizedLimit.IsDilationInvariant` (`TauCeti/Analysis/Normed/Order/GeneralizedLimit.lean` line 177).
- Cross-roadmap citations resolved on main (`62bb15a`): NoncommutativeGeometry N4, which proves additivity of `Tr_ω` on positive operators for a dilation-invariant `ω` (README line 785) and gives the non-additive control for general data (line 803); OperatorKTheory K3.5 as cited in Tr4.1, unchanged.
- Dependency check: `depcheck: 182 roadmaps, 2074 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is not yet in the merge order and is placed after its last supplier. The automatic checks all passed at this head.
- Elaboration of `Suggested.lean`: 25 `sorry` warnings and nothing else; the file is byte-identical to the one read at `1d9b51d`, so the elaborated signatures and the one-tactic probe stand as recorded there.
- Change outside the roadmap folder: none. No machine path and no `set_option` in the folder.
- Pull request text against this head: a new roadmap, four layers, 25 `sorry`s, pins Lean v4.36.0-rc2, TauCeti `2fd255d`, Mathlib `1b1ccf4` (manifest agrees); the Tr3 and Tr4 bullets carry the hypotheses of the layers. Nothing contradicted, nothing left unstated.
- No layer was added, removed or reordered, so the arrangement was not compared again.

Overlap check: read AmenableTracesOnCStarAlgebras, HilbertModules, NoncommutativeGeometry, SchattenClassesAndSchurMultipliers, NoncommutativeIntegration; nothing shared (as in the previous review; the change touches only the citation of NoncommutativeGeometry N4, which owns Dixmier traces and is cited, not restated).

Source independence: changed passages only; 3 passages compared with 2 sources (thomsen-kms, kustermans-vaes), none shared; largest share dixmier1963, 12 of 26 locators; contents not compared again, no layer having changed (previous result: independent).

Research link: Tr3–Tr4 are the trace ideal `N ∩ L¹(N,τ)` and its K-theory used by Hochs–Kaad–Schemaitat (2018) for the semifinite Fuglede–Kadison determinant, the homomorphism `τ_* : K₀(K_N) → ℝ` of Kaad–Nest–Rennie (2007), and Thomsen's (2022) pairing of densely defined traces with `K₀`; rests on hks §6, knr §6 and thomsen-wtk §4, which were read.

## Not verifiable

- Roe, *Lectures on K-Theory and Operator Algebras*, Lectures 14–16: not opened; the README consumes it only through OperatorKTheory §3.5.
- thomsen-kms Theorem D.1.16: the statement is damaged in the extracted text; Lemmas D.1.14–D.1.15, which the README cites, are legible. Not touched by this change.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md`, in the References, links Roe's lecture notes on a `wpmucdn.com` host serving a `sites.psu.edu` page; the copy was not opened and the host's status as an author page was not settled.
