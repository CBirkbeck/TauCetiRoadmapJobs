# Review of PDE (pull request #1614 at f019834)

**Verdict:** accepted

🤖 Independent AI review, incremental: 15 changed lines in `TauCetiRoadmap/PDE/` since da293a8 (README only, 8 insertions and 7 deletions: the Lane G header's revision clause and the Poincaré-normalization bullet, which are the two P3 repairs the previous review asked for), nothing changed outside the folder and `Suggested.lean` byte-identical to the previous head. One finding, P3; no blocking finding remains. The worker's gate at this head passes every check, the dependency check reports no problem, and `Suggested.lean` elaborates at the branch pin with exactly one diagnostic, the intended `sorry`.

## R01 (P3) — The rewritten Poincaré bullet's `W^{1,p}_Γ` and Poincaré–Wirtinger clauses omit the regularity of `Ω`

**Location:** `TauCetiRoadmap/PDE/README.md:104–106`: "on `W^{1,p}_Γ(Ω)` for `Ω` bounded and connected and a boundary part `Γ` of positive measure (Poincaré–Friedrichs, Lane G); and modulo constants for `Ω` bounded and connected (Poincaré–Wirtinger, zero mean)."

**Claim:** As written, both clauses assert the inequality for every bounded connected open `Ω`. Both need a regularity hypothesis as well (G.30 has it through "admissible", G.31 and G.32 say "bounded Lipschitz"); the wording the previous review proposed carried main's omission, and this bullet is the only place in the file that states the two inequalities without it.

**Witness:** Rooms and passages in the plane: rooms `R_k`, squares of side `2^{−k}`, in a row, consecutive rooms joined by a passage `P_k` of length `2^{−k}` and width `2^{−k(p+2)}`; `Ω` is bounded (total length `4`) and connected. Let `u_k = 0` on rooms before `R_k`, `1` on `R_k` and beyond, linear across `P_{k−1}`. Then `‖∇u_k‖_p^p = 2^{−k(p+2)} · 2^{−k} · 2^{kp} = 2^{−3k}`, while `‖u_k‖_p^p ≥ (4/3)·4^{−k}(1 − o(1))` and the mean of `u_k` is `O(4^{−k})`, so `‖u_k − mean‖_p^p / ‖∇u_k‖_p^p ≥ c · 2^{k} → ∞` (Poincaré–Wirtinger fails), and with `Γ` the side of `R_0` away from `P_0` (positive `μHE[1]`), `u_k ∈ W^{1,p}_Γ` for `k ≥ 1` (it vanishes on all of `R_0`) with `‖u_k‖_p^p / ‖∇u_k‖_p^p → ∞` (Poincaré–Friedrichs fails). On a bounded Lipschitz domain both hold, as G.30–G.31 state.

**Repair:** "on `W^{1,p}_Γ(Ω)` for `Ω` bounded, connected and Lipschitz and an admissible boundary part `Γ` of positive measure (Poincaré–Friedrichs, Lane G); and modulo constants for `Ω` bounded, connected and Lipschitz (Poincaré–Wirtinger, zero mean)". The `W^{1,p}_0` clause needs no regularity and stays as it is.

## Previous findings

- R01 — repaired: the parenthesis naming revision `a318838` is gone; the header now reads "as Tau Ceti implements them on its main branch, later than the pinned revision; `Suggested.lean` uses none of them" (`README.md:533–535`). The claim re-resolves on Tau Ceti main today (below). No process word remains in the folder.
- R02 — repaired: the alternatives "of finite measure, or bounded in one direction" now attach to the `W^{1,p}_0` clause only; the `W^{1,p}_Γ` clause says "`Ω` bounded and connected and a boundary part `Γ` of positive measure", the Wirtinger clause "`Ω` bounded and connected" (`README.md:103–106`). The strip witness of the previous review is now excluded. The regularity word both clauses still lack is this report's R01.

## Verified sound

**Scope and gate.** HEAD is `f019834452df4d5e467bcead845417ed0ede9f9e`; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PDE'` is empty and the worktree is clean. Against main the pull request changes only `README.md` and `Suggested.lean` of the folder; `PROGRESS.md`, `STATUS.md` and `metadata.toml` are main's own files. `git diff da293a82 HEAD -- TauCetiRoadmap/PDE/Suggested.lean` is empty. The worker's gate at this head: every check 0, `OK` (`set_option`, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, lean-lines, forbidden, readme-ids-missing, empty-sections, round-labels, long-fences, depcheck, stray-files, dirty, outside-folder, source-material, build). A grep of the README for `a318838`, "revision", "checked at", "so far", "to be checked", "current", "removed", "checkpoint", "handoff", "packet" and `#NNNN` finds only the word "revision" in the new header clause, used timelessly. The changed lines contain no source passage, no algorithm, no LaTeX delimiter, no pull-request number.

**Elaboration at the branch pin** (Tau Ceti `a91d3aa`, Mathlib `6b7abb3c`, the pins of the worktree's `lake-manifest.json`): `lake env lean` on `Suggested.lean` gives exactly `Suggested.lean:270:8: declaration uses 'sorry'` (3 s). The Lean file is unchanged since da293a8, so the previous review's `#check` of its two declarations (theorem keeps `[FiniteDimensional ℝ F]`, `[MeasureSpace F]`, `[BorelSpace F]`, `[IsAddHaarMeasure volume]`, `[Fact (1 ≤ p)]`, no `p ≠ ∞`) and its one-tactic probe (`rfl`, `simp [w1pVanishingOnSubmodule, W1p0, w1p0Submodule]`, `ext u; simp [...]` all fail) carry forward; no new padding and no new headline is possible without a Lean change. The imports are `import Mathlib` and `import TauCeti.Analysis.Sobolev.W1p.Zero`, whose object file is present at the pin.

**Supplier order.** The dependency check:

    depcheck: 203 roadmaps, 1652 edges, 0 problem(s)

No UPWARD or CYCLE line. The diff adds no `*Needs:*` line and no supplier citation; Lane G still cites only Lanes A and D of this roadmap, Tau Ceti and Mathlib.

**The Lane G header's claim, re-resolved.** On Tau Ceti main at `7ed979d` (2026-11-04T06:35Z): `Analysis/Sobolev/LipschitzDomain/Basic.lean:482` `def IsLipschitzDomainWith (Omega : Set (WithLp 2 (ℝ × E))) (L : ℝ≥0) : Prop`; `Analysis/Sobolev/LipschitzDomain/Trace/Frontier.lean:219` `def W1p.frontierTrace (hp : p ≠ ∞) …`, with `w1p0Submodule_le_ker_frontierTrace` at `:258`. The pin `a91d3aa` is dated 2026-10-05 and has no `LipschitzDomain/` directory and neither name (grep of the pinned `TauCeti/` tree is empty), so "on its main branch, later than the pinned revision" is exactly right. The remaining six names were read at `333c9e4` by the previous review with their hypotheses; the diff does not touch the sentences that cite them.

**Seeded sample.** All three targets lie in main's text that this diff leaves unchanged. "Fredholm alternative for compact operators" (`README.md:7`, also `:23`, `:118`, `:319`, `:592`): Mathlib at the pin has `Analysis/Normed/Operator/Compact/FredholmAlternative.lean` with `hasEigenvalue_or_mem_resolventSet (hT : IsCompactOperator T) (hμ : μ ≠ 0)` at `:164` and `hasEigenvalue_iff_mem_spectrum` at `:221`, which is the alternative the README invokes. "Carleson project" (`README.md:196`, `:273`, `:670`): main's text, the repository reference unchanged. "Lane A comes first" (`README.md:676–682`): main's paragraph with the one Lane G sentence "Lane G needs only Lanes A and D", unchanged since the previous review, consistent with G.28–G.32 citing only A.6 and D.16–D.19. Lane G's Bauer–Pauly–Schomburg locators (`bauer-pauly-schomburg-2016`, arXiv 1511.06697: strong pairs §2.1 p. 6, Definitions 2.3–2.6 p. 5, Lemma 3.1 p. 7 with Appendix A p. 22) were verified in the previous round and their sentences are untouched.

**Ownership and duplication.** The diff introduces no new object: the bullet restates the normalisation principle for inequalities that Lane A.5 and Lane G.30–G.31 own, and the header renames nothing. The previous review's grep over main and the open roadmap pull requests for `W^{1,p}_Γ`, "vanishing on a boundary part", "Poincaré–Friedrichs", mixed and Neumann problems and spectra found hits only in this folder; nothing in the 15 lines changes that.

**Adversarial table.** Rows for the changed statements are computed here; rows for the statements the diff leaves untouched carry the previous report's values (PRREVIEW-PDE~7).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Poincaré bullet, `W^{1,p}_0` clause (`README.md:103–104`), changed | `Ω = ℝ × (0,1)` (bounded in one direction), `Ω` of finite measure in `ℝⁿ`, `Ω = ℝⁿ` | strip, `p = 2`: `‖u‖₂ ≤ (1/π)‖∂_y u‖₂` from the one-dimensional inequality on `(0,1)` with zero ends; finite measure, `1 ≤ p < ∞`: Hölder gives `W^{1,p}_0 ⊆ W^{1,q}_0` for `q < min(n,p)`, Gagliardo–Nirenberg–Sobolev gives `‖u‖_{q*} ≤ C‖∇u‖_q ≤ C|Ω|^{1/q−1/p}‖∇u‖_p`, and `q* = nq/(n−q) ≥ p` for `q` near `min(n,p)`, so `‖u‖_p ≤ |Ω|^{1/p−1/q*}‖u‖_{q*}` closes (`n = 1` directly: `‖u‖_p ≤ |Ω|^{1/p}‖u‖_∞ ≤ |Ω|‖u'‖_p`); `ℝⁿ`: `u_R = φ(·/R)` has ratio `R‖φ‖/‖∇φ‖ → ∞` | all three alternatives true for `W^{1,p}_0`, `p < ∞`; the `ℝⁿ` failure is the bullet's own remark | none |
| Poincaré bullet, `W^{1,p}_Γ` clause (`:104–105`), changed | strip `ℝ × (0,1)`, `Γ = (0,1) × {0}`, `u_R = φ((x−3)/R)`; `Ω = (0,1) ∪ (2,3)`, `Γ = {0}`, `u = 1_{(2,3)}`; `(0,1)`, `Γ = {0}`; rooms and passages with `Γ` a side of `R_0` | strip: ratio `R‖φ‖_p/‖φ'‖_p → ∞`, now excluded by "bounded"; disconnected: `‖u‖ = 1`, `‖∇u‖ = 0`, excluded by "connected"; `(0,1)`: `|u(x)| ≤ x^{1−1/p}‖u'‖_p`, so `C = 1`; rooms: `‖u_k‖_p^p ≥ (4/3)4^{−k}(1−o(1))`, `‖∇u_k‖_p^p = 2^{−3k}`, ratio `≥ c·2^k → ∞` on a bounded connected `Ω` | the two repairs hold; regularity missing | R01 |
| Poincaré bullet, Wirtinger clause (`:105–106`), changed | strip with `u_R = φ((x−3)/R) − φ((x+3)/R)` (mean zero); `(0,1) ∪ (2,3)` with `u = ±1` (mean zero); `(0,1)`; rooms and passages | strip: ratio `→ ∞`, excluded by "bounded"; disconnected: `‖u‖_p = 2^{1/p}`, `‖∇u‖ = 0`, excluded by "connected"; `(0,1)`, `p = 2`: `C = 1/π` (first Neumann eigenvalue `π²`); rooms: mean of `u_k` is `O(4^{−k})`, `‖u_k − mean‖_p^p/‖∇u_k‖_p^p ≥ c·2^k → ∞` | the repair holds; regularity missing | R01 |
| Lane G header (`:533–535`), changed | the two cited Tau Ceti files on main today; the pinned tree | `IsLipschitzDomainWith` at `Basic.lean:482`, `W1p.frontierTrace` at `Trace/Frontier.lean:219` on main `7ed979d` (2026-11-04); pin `a91d3aa` dated 2026-10-05, zero hits for either name; `Suggested.lean` imports only `W1p.Zero` and uses `W1p0`/`w1p0Submodule` | claim exact; no process word | none |
| G.28 admissible parts | as PRREVIEW-PDE~7 | corner chart rotated by `π/4`, `Γ = {s < 0}` side, base dimension 1; oscillating `Γ` has no half-line preimage; `∅`/`∂Ω` over none/all | sound | none |
| G.29 definition, `1 ≤ p ≤ ∞` | as PRREVIEW-PDE~7 | `Γ = ∂Ω` generators equal the test functions of `Ω` by cutoff/extension by zero; `Γ = ∅` gives all ambient restrictions | sound | none |
| G.29 bullet 1 and the Lean theorem | as PRREVIEW-PDE~7 | `⊥`: both zero; `⊤`: both the closure of `C_c^∞(F)`; `rfl`/`simp`/`ext; simp` fail | true at every `p`; not padding | none |
| G.29 bullets 2–3 | as PRREVIEW-PDE~7 | `denseRange_restrictL_ofTestFunctionₗ_top` needs `p ≠ ∞`, bounded Lipschitz; half-space translation-and-cutoff route, easy inclusion `W_Γ ⊆ {trace = 0 on Γ}` | sound | none |
| G.30 Poincaré–Friedrichs, Peetre route | as PRREVIEW-PDE~7 | `ker ∇` = a.e. constants on connected `Ω`; constant `c ∈ W_Γ` has trace `c` on `Γ`, so `c = 0` when `μHE[n−1] Γ > 0`; `(0,1)`: `C = 1`; `Γ = ∅`: `1 ≤ C·0` false | sound; "admissible" carries the Lipschitz hypothesis | none |
| G.31 mixed and pure Neumann | as PRREVIEW-PDE~7 | `(0,1)`, `f = cos πx`: `u = cos(πx)/π² + c`; `f = 1`: `u'(1) − u'(0) = −1 ≠ 0`, no solution; `a(1,1) = 0` for `Γ = ∅` | sound | none |
| G.32 resolvent route and acceptance Check | as PRREVIEW-PDE~7 | `‖R‖ ≤ 1`, `(Rf,f) > 0`, `μ ∈ (0,1]`, `λ = 1/μ − 1`; Neumann on `(0,1)`: `λ_m = m²π²`; square with `Γ = {0}×(0,1)`: `sin(πx/2)`, `λ₁ = π²/4`; `λ = 0` iff a nonzero constant, excluded iff `μHE[n−1] Γ > 0` | sound | none |
| Lean binders and generality | as PRREVIEW-PDE~7 | theorem keeps `FiniteDimensional`, `BorelSpace`, `IsAddHaarMeasure`, `Fact (1 ≤ p)`; no `p ≠ ∞`; README says "every `p`" | README and Lean agree | none |

**Cross-roadmap citations resolved.** The diff adds none; Lane G cites no other roadmap. Main's GeometricMeasureTheory citations are outside this pull request's change (previous report's R06, inherited from main).

## Not verifiable

- Gröger, Math. Ann. 283 (1989): paywalled (uncertified); cited as a work only, no Lane G statement depends on a locator into it. Unchanged this round.
- The Carleson repository's contents beyond its landing page: main's text, not read this round.

## Source issues

- none
