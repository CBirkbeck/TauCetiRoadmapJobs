# Review of QuantumErrorCorrection (pull request #2732 at e5ad54a)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed by hand on degenerate and small instances (no qubits, one qubit, `Q = ⊥`, `dim Q = 1`, `t = 0`, `2t ≥ n`, the five-, seven-, nine- and four-qubit codes) and every source locator was read in the three cited texts; all agree with the README and with `Suggested.lean`, which elaborates with `sorry` as its only warning. There are two format notes and no small correction. One point is left for the human reviewers: the general Singleton bound of 5.2 rests on the roadmap's own proof route, since the cited sources state it without proof.

## N01 — The scope section dates itself by saying which roadmaps are "not on main"

In "Scope and ownership" (lines 550–559) the two related roadmaps are introduced as "an open roadmap, not on main", three times. A reader a year from now cannot tell whether that still holds. Naming the roadmap and its section and saying that nothing here depends on it carries the same information without the status.

## N02 — One line of `Suggested.lean` exceeds 100 characters

Line 205 (the statement of `cssCode_eq_span`) is 103 characters long; breaking after `Submodule.span ℂ` fixes it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `pauliOp`, product rule | one qubit `Z·X`, `X·Z`; `n = 0`; general `e_t` | `X(a)Z(b)X(a')Z(b')e_t = (−1)^(b·a')(−1)^((b+b')·t) e_(t+a+a')`; `ZX = −XZ`; `XZ` rows `(0,−1),(1,0) = −iY`; wrong sign gives `XZ = −XZ` | holds | none |
| 1.1 adjoint bullet | `a·b = 0`, `a·b = 1` | `(XZ)† = ZX = (−1)^(a·b)XZ`; `(iXZ)² = −(−1)^1 = 1`; `(XZ)² = 1` when `a·b = 0` | holds | none |
| 1.2 symplectic form, commutation | `X⊗X` vs `Z⊗Z`; `X` vs `Z`; dot-product variant | sign `(−1)^(b·a' + b'·a)`; `ω = 2 = 0`; `ω = 1`; plain dot product gives `0` on anticommuting `X, Z` | holds; variant excluded | none |
| 1.3 Pauli basis | one qubit expansion; trace | `α = (p+u)/2, β = (q+r)/2, γ = (p−u)/2, δ = (r−q)/2` solves the four entries; `tr(P†P) = 2^n` | holds | none |
| 1.4 weight | `XZ` on one qubit; `X⊗Z`; splitting | `1` (sum of Hamming norms gives `2`); `2`; support of size `≤ t₁+t₂` splits with sign `+1` | holds | none |
| 2.1 detectable, correctable | repetition code, bit flips; `I, Z₁`; `Q = ⊥`; `dim Q = 1`; `ι` empty | `X_iX_j e_000` has weight 2, orthogonal to code, `c = 1`; `⟨Z₁⟩ = 1` vs `−1`; trivial cases correctable with `R = 1` | holds | none |
| 2.2 Knill–Laflamme | both directions; infinite `κ`; `Q = ⊥`; nine-qubit code | forward `c_kl = Σ_r conj(l_rk) l_rl`; converse `ΣR†R = ΣP_(W_m) + P_⊥ = 1`, `R_m F_m' ψ = δ√d_m ψ`; rank `1+9+9+3 = 22`, `23` Kraus operators | holds | none |
| 2.3 correct `t` iff detect `2t` | `t = 0`; `[[4,2,2]]`, `t = 1`; `2t ≥ n` | `{I}` correctable iff `I` detectable; `X₁X₂` commutes with `XXXX`, `ZZZZ`, not in `G`: undetectable; rank-one projection gives `1` vs `0` | holds | none |
| 3.1 stabilizer dimension | `{1,−1}`; cube roots of unity; `{1, iXZ}`; `n = 0`; five-qubit | `0·2 ≠ 2^n`; `0·3 ≠ 2`; `Y(1,i) = (1,i)`, `1·2 = 2`; `G = {1}`, `1·1 = 1`; `2·16 = 32` | holds; both hypotheses needed | none |
| 3.2 symplectic image | `V = 0`; `V = 0 × 𝔽₂^n`; span of `(1,0),(0,1)` | whole space; line of `e_0`, `1·2^n = 2^n`; commutator of `cX`, `c'Z` is `−1` | holds, both directions | none |
| 3.3 detection criterion | `(a,b) = 0`; generator `XZZXI`; `IIZXZ` on five qubits | `1 ∈ G`; acts as `1`; commutes with all four generators (position-wise signs `++`, `−−`, `−−`, `++`), weight 3 so not in `G` (all weights 4): undetectable | holds, both directions | none |
| 4.1 CSS dimension and span | Steane; nine-qubit; `C₁ = C₂ = 0`, `n = 2` | `2^(4+4−7) = 2`; `k₁ = 3, k₂ = 7`, `2^(3+7−9) = 2`; code `0`, formula would need `dim·4 = 1` | holds; hypothesis needed | none |
| 4.2 CSS distance | no containment; `C = 0`; nine-qubit | code `0` detects all; `d = 0` makes hypothesis false; `d(C₁) = 3`, `d(C₂) = 2`, nine weight-2 words of `C₂` all in `C₁^⊥` | holds without containment | none |
| 5.1 Hamming bound | five-qubit; Steane; `[[4,2,2]]`; `t = 0`; `t ≥ n` | `2·16 = 32`; `2·22 = 44 ≤ 128`; `4·13 = 52 > 16` and degenerate; `K ≤ 2^n`; sum `= 4^n` | holds | none |
| 5.2 Singleton bound | five-qubit `t = 2`; `[[4,2,2]]`; Steane; line of `e_0`; `2t ≥ n` | `2·16 = 32`; `4·4 = 16`; `32 ≤ 128`; `1·4 > 2` so `K ≥ 2` needed; route gives `K² r_A r_B ≤ r_A r_B r_C²`, `K ≤ 2^(n−2t)`, `C = ∅` forces `K ≤ 1` | holds | none |

- Source locators checked against the text: 19 of 19 (Gottesman 11, Calderbank–Rains–Shor–Sloane 5, Knill–Laflamme 3), all at the stated theorem, equation and printed page.
- Library declarations opened at the pins: 27 Mathlib names in their cited files and 8 Tau Ceti names (`Set.hammingMinDist` at `MinimumDistance/Basic.lean` line 45 with value `0` on subsingletons, line 56; `Set.hammingMinDist_le_hammingNorm` line 157; `Submodule.euclideanDual` line 42; `finrank_add_finrank_euclideanDual` line 195; `Matrix.partialTraceRight` line 51, `partialTraceLeft` line 153; `LinearCode` line 31).
- Cross-roadmap citations resolved: CStarAlgebras 4.3 on main; AlgebraicCodingTheory under `Completed/`; QuantumOptimization 3.1 and BoundsOnCodes 1.1 at their open heads (named as related, not as suppliers).
- Duplication by object: no Pauli operators, stabilizer codes, Knill–Laflamme conditions or binary symplectic form in the pinned Mathlib or Tau Ceti, nor in any other roadmap on main or open.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: 14 `sorry` warnings, nothing else; no `set_option`, no sorry'd data. One-tactic probe (`simp`; `rfl`, `infer_instance`, `decide`) closes none of the 14 theorems. All 27 elaborated types compared with the README; `IsDetectable` drops `[DecidableEq ι]`, which it does not use.
- Headline theorems: all listed in the README overview are stated in `Suggested.lean`; none is declared not statable.
- Pull request text read against the head: 14 theorems, 13 definitions, two Tau Ceti imports, the locators listed and the supplier statements all agree.

Overlap check: read BoundsOnCodes, QuantumOptimization, EntropyAndSourceCoding, AlgebraicCodingTheory; nothing shared. QuantumOptimization 3.1 owns the single-site `X_i` on `ι → Bool`, this roadmap the general `X(a)Z(b)` on `Fin n → ZMod 2`; BoundsOnCodes 1.1 owns the Hamming-ball count, used here only inside the proof of 5.1.

Source independence: 19 locators and 6 further passages compared with 3 sources, none shared; largest share Gottesman2009, 11 of 19 locators; contents compared with Gottesman2009: independent (Layer 1 ↔ end of §3.1, Layers 2 and 5 ↔ parts of §2.2, Layer 3 ↔ §2.3, Layer 4 ↔ §3.1; not in order, and the order here is forced by the dependencies of Layers 3 and 4 on 1 and 2).

Research link: The targets are the foundational theorems of quantum coding theory as stated in Knill–Laflamme (1997), Calderbank–Rains–Shor–Sloane (1998) and Gottesman (2010), on which stabilizer, CSS and later code constructions build; rests on the README's references and the three texts read.

## Not verifiable

- none

## Source issues

- **Error** in KnillLaflamme1997 at Theorem 5.1, printed page 26: the source says a code with `k` codewords on `r` qubits correcting `e` errors has `r ≥ 4e + ⌈log k⌉`; it should be restricted to `k ≥ 2`, since a one-dimensional code meets conditions (19)–(20) for every `e`; affects a stated result.

## For the human reviewers

- Scope: the Singleton bound 5.2 for arbitrary dimension `K ≥ 2` and every `t` is proved by the README's own rank route; KnillLaflamme1997 Theorem 5.1 states it without proof and Gottesman2009 (p. 8) proves only `k = 1`.
- Scope: the description states that the roadmap was drafted and reviewed by AI agents; the three sources are refereed publications read here in their arXiv versions.
