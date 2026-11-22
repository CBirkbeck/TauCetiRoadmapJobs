# Review of HopfieldNetworks (pull request #2955 at 54ec582)

**Verdict:** accepted

**Summary.** Accepted: both false Check sentences of the previous review are repaired, and the new mathematics the repair adds (the bound `2ⁿ − 1` is attained for `n = 1, 2` and for no `n ≥ 3`, with the explicit six-change example for `n = 3`) was recomputed and is correct. There are no findings, no small corrections and one format note, not blocking. The scope question (a machine-learning subject whose binary-layer theorems carry no refereed locator) remains for the human reviewers.

## N01 — The period-two theorem of 3.1 still has no bibliographic entry

The attribution to Goles and coauthors is now marked "named only", which is accurate, but the References give Hopfield's paper in full and no paper for 3.1, so a reader still cannot look the theorem up. A bibliographic entry (authors, title, journal, year), marked named only as Hopfield's is, would be enough; this review did not open any paper of Goles either.

## Previous findings

- R01 — repaired: "The bound is attained for `n = 1, 2` and for no `n ≥ 3`", with explicit chains for `n = 1, 2, 3` and a parity argument; the search result `1, 2, 4` is now a separate Check. All recomputed.
- R02 — repaired: "every changing update changes the energy by exactly `E(new) − E(old) = 2 s_i h_i − 2 W i i`, and this is negative (at most `−2`)". Recomputed: the largest change in the stated range is `−2`.
- N01 (format note) — partly repaired: both attributions are marked "named only", Hopfield (1982) has a full entry; Goles has none (N01 above).
- N02 (format note) — repaired: the definition is `IsStableState` and the theorem `exists_isStableState_asyncTraj`, in both files; no declaration of that name at either pin or in another roadmap.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 2.1 Check: bound attained, `n = 1` | `W = 0`, `θ = 1`, spin `−1` | field `1`, spin becomes `1`, energies `1, −1`; one change `= 2¹ − 1` | holds | none |
| 2.1 Check: bound attained, `n = 2` | off-diagonal `−1`, `θ = (0, −2)`, spins `(1, 1)`, schedule `1, 2, 1` | fields `−1, −1, 1`; spins `(−1,1), (−1,−1), (1,−1)`; energies `3, 1, −1, −3`; three changes | holds | none |
| 2.1 Check: not attained for `n ≥ 3` | parity argument reread; `n = 3` exact longest chain | single flips alternate `Π s_i`; `Σ_x Π s_i · E = 0` for degree `≤ 2 < n`, alternating sum of a full chain is nonzero; longest chain `6 < 7` | holds | none |
| 2.1 Check: `n = 3` example | off-diagonal `−1`, `θ = (−3, −1, 1)`, spins `(1,1,1)`, schedule `3, 2, 1, 2, 3, 2` | fields `−1, −1, −1, 1, 1, −1`, all against the spin; energies `6, 4, 2, 0, −2, −4, −6`; six changes | holds | none |
| 2.1 Check: exact search | symmetric, entries `{−1, 0, 1, 2}`, diagonal `≥ 0`, `θ ∈ {−1, 0, 1}ⁿ` | longest chains `1, 2, 4` for `n = 1, 2, 3` | holds | none |
| 1.3 Check: brute force | symmetric `{−2..2}`, diagonal `≥ 0`, `θ ∈ {−1,0,1}ⁿ`, `n ≤ 3` | `E(new) − E(old) = 2 s_i h_i − 2 W i i` in every case; maximum `−2` | holds | none |
| 2.2 Check: round robin (reworded pointer) | the search range of the second Check of 2.1, all initial configurations, length `n · 2ⁿ + n` | 0 unstable endpoints | holds | none |
| 2.2 `exists_isStableState_asyncTraj` (renamed) | elaborated type; one-tactic probe | type unchanged but for the name, carries `[Fintype ι] [DecidableEq ι]`, `hW`, `hdiag`, `hu`; `rfl`, `simp`, `simp` with unfolding, `decide` leave it open | holds | none |

The rows for the statements the change does not touch stand as in the previous review, of `163f10d`.

- Source locators checked against the text: 1 new (RAMSAUER20 line 65, printed page 2, cites Hopfield 1982 for binary Hopfield networks; its bibliography, lines 5267–5268, gives volume 79(8), pages 2554–2558, as the new References entry does).
- Library declarations: `IsStableState` searched in the pinned Mathlib and Tau Ceti and in the open roadmaps and those on main: declared only here.
- Dependency check: `depcheck: 169 roadmaps, 1975 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head. Elaboration: `Suggested.lean` elaborates with twelve `sorry` warnings and nothing else; single `import Mathlib`, no `set_option`.
- `#check @IsStableState` and `#check @exists_isStableState_asyncTraj` compared with 1.2 and 2.2 of the README: agree.
- Pull request text read against the head: no sentence is contradicted (it names neither the old definition name nor the replaced Check sentences; "Hopfield (1982) and Goles were not opened" still holds); nothing changed outside the folder.

Overlap check: read QuantumOptimization, ConstructiveFieldTheoryPhi4; spins of a Boolean configuration and the Ising energy are shared with QuantumOptimization, owner QuantumOptimization 1.1 (cited and copied by declaration here); nothing shared with ConstructiveFieldTheoryPhi4. The change adds no object.

Source independence: changed passages only; 3 passages compared with 1 source (the attribution sentence of 1.3, the Hopfield entry of the References, the new Check of 2.1, against RAMSAUER20), none shared beyond bibliographic data; largest share RAMSAUER20, 16 of 21 locators; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layer 5 states and sharpens Theorems 1, 2, 4 and 5 of Ramsauer et al. (arXiv 2020, ICLR 2021) on the modern Hopfield network, the model behind attention layers; Layers 1–4 are the classical convergence results the README attributes to Hopfield and to Goles and coauthors. Rests on the README and on RAMSAUER20 pp. 3–4.

## Not verifiable

- The attributions to Hopfield (1982) and to Goles and coauthors: the README marks both as named only and neither paper was opened; nothing in the roadmap depends on them.

## Source issues

- **Misprint** in RAMSAUER20 at the proof of Theorem A9, eq. (405), printed page 57: the source bounds ε by a quantity carrying a factor `M`; it should be `ε ≤ e (N − 1) exp(−β Δ_i)`, without `M`, as eqs. (402)–(404) require; affects nothing.

## For the human reviewers

- **Scope.** The subject is the theory of neural associative memories. The sources are an ICLR 2021 paper (RAMSAUER20) and a textbook chapter (MACKAY03); the six binary-layer theorems (1.3 to 4.2) carry proof routes and no refereed locator (README References, last two entries).
- **Licence.** MACKAY03 was read on the author's page; each page is marked on-screen viewing only (MACKAY03 line 5). The README takes from it locators and two two-neuron counterexamples (Checks of 1.3 and 3.1), restated with a citation.
- **Not tested.** `Suggested.lean` was not compared with public Lean formalisations of Hopfield networks; none was opened. The description says no outside formalisation was used.
