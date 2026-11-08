# Review of ConformalMappingPartII (pull request #1407 at 57f0e04)

**Verdict:** needs changes

Incremental re-review of the 52 lines changed since 62e73fb (README lines 133, 322, 367, 764; `Suggested.lean` docstring, `RootsCover.halfPlaneForm`, `free_deck_presentation`), the passages that cite them (§§1.5, 1.8, 1.10, 6.1–6.3, 4.6, 8.1, Conventions), the two previous findings, the gate and the elaboration.

## R01 (P2) — The zero-balanced connection formula is still absent from `Suggested.lean` although it is statable at the pins

**Location:** `TauCetiRoadmap/ConformalMappingPartII/Suggested.lean:21–25`: “The continued zero-balanced connection formula and uniform cusp asymptotic lack the constructed continued hypergeometric branch. No stand-in for these constructions is stated here.” Also `README.md:133`: “the continued connection formula and the uniform cusp asymptotic require constructed maps or carriers absent at the pins”, and §4.6 (`README.md:644–651`).

**Claim:** The round-4 finding R01 asked for two statable headlines; this head states the deck-group presentation but not the connection formula, and the docstring still calls it unstatable. The content of §4.6 is (a) the zero-balanced series is analytic on the slit unit disc and (b) it equals the native `ordinaryHypergeometric a a (2a) (1 − x)` wherever both converge; §4.6's own last sentence names (b) as the target (“identify the continued solution with the native series on their common domain”). The “continued branch” §4.6 lacks is the series itself, a real-bodied `tsum` of native terms, so nothing is missing at the pins and no stand-in is involved: (a) and (b) together are the full continuation statement by the identity theorem.

**Witness:** A scratch file importing `TauCetiRoadmap.ConformalMappingPartII.Suggested` at this head elaborates the definition and theorem below with `sorry` as the only warning (`lake env lean`, exit 0 for these declarations). The identity was checked numerically in round 4 at (a, x) = (1/2, 0.01), (1/4, 0.05), (3/4, 0.2): both sides 2.352715816780, 1.390163183039, 1.702460198286.

```lean
/-- The zero-balanced series of §4.6 with the principal logarithm. -/
def zeroBalancedSeries (a x : ℂ) : ℂ :=
  Complex.Gamma (2 * a) / Complex.Gamma a ^ 2 *
    ∑' k : ℕ, (Polynomial.eval a (ascPochhammer ℂ k)) ^ 2 / ((k.factorial : ℂ) ^ 2) *
      x ^ k * (-Complex.log x + 2 * (Complex.digamma (k + 1) - Complex.digamma (k + a)))

/-- §4.6: analytic on the slit disc and equal to the native series on the lens. -/
theorem zero_balanced_connection (a : ℂ) (ha : 0 < a.re) :
    AnalyticOnNhd ℂ (zeroBalancedSeries a) (ball 0 1 \ {x | x.re ≤ 0 ∧ x.im = 0}) ∧
    ∀ x : ℂ, ‖x‖ < 1 → ‖1 - x‖ < 1 →
      ordinaryHypergeometric a a (2 * a) (1 - x) = zeroBalancedSeries a x := by sorry
```

**Exact repair:** Add the definition and theorem to the Layer 4 section of `Suggested.lean` (with `0 < a.re` or the README's `a ∈ [1/4, 3/4]`; either excludes the poles of Γ(2a)), name both in README §4.6 so the gate's README–Lean agreement sees them, and reword the module docstring and README line 133 so that what is called unstatable is only what still lacks a carrier: the marked polygon (as now written) and the uniform cusp asymptotic of §8.1, which the docstring should describe precisely as lacking the inverse ratio `s_N` continued past the common convergence domain (for M ≥ M₀ with M₀ < 1/e and 0 < |x| < e^{−MN}, the point 1 − (1 − x)^N can leave the unit disc, so §8.1 genuinely needs continuation beyond the lens; naming it as unstatable is acceptable once that is said).

## R02 (P3) — Two horodisc theorems cited without their namespace (round-4 R02, not repaired)

**Location:** `TauCetiRoadmap/ConformalMappingPartII/README.md:107`: “`Subgroup.CuspDatum` in `TauCeti.Analysis.Complex.Fuchsian.Cusp.Datum` records the width and full stabilizer. Consume its `disjoint_smul_horodisc_horodisc` and `mem_stabilizer_of_mem_horodisc_of_smul_mem_horodisc` in `TauCeti.Analysis.Complex.Fuchsian.Cusp.Horodisc`”; the same unqualified citation (“`TauCeti.Analysis.Complex.Fuchsian.Cusp.Horodisc` precise invariance”) at the §8.3 and §8.5 *Needs:* lines (`README.md:964`, `README.md:994`).

**Claim:** Every other library declaration in the supplier contracts is cited by its fully qualified name. “Its” reads as dot-notation on `Subgroup.CuspDatum`, but that structure is in `namespace Subgroup` (`TauCeti/Analysis/Complex/Fuchsian/Cusp/Datum.lean:53,167`) while the two theorems are in `namespace TauCeti.Subgroup.CuspDatum` (`TauCeti/Analysis/Complex/Fuchsian/Cusp/Horodisc.lean:78,209,224`), so the implied name does not exist and the hypotheses they carry are not stated.

**Witness:** At this head, `#check @Subgroup.CuspDatum.disjoint_smul_horodisc_horodisc` fails with `Unknown constant`, while `#check @TauCeti.Subgroup.CuspDatum.disjoint_smul_horodisc_horodisc` elaborates to a statement with `[DiscreteTopology Γ]`, `0 ≤ A`, `D.width * D'.width ≤ A * A'` and `g • D'.cusp ≠ D.cusp`, and `#check @TauCeti.Subgroup.CuspDatum.mem_stabilizer_of_mem_horodisc_of_smul_mem_horodisc` to one with `[DiscreteTopology Γ]` and `D.width ≤ A`.

**Exact repair:** Write `TauCeti.Subgroup.CuspDatum.disjoint_smul_horodisc_horodisc` and `TauCeti.Subgroup.CuspDatum.mem_stabilizer_of_mem_horodisc_of_smul_mem_horodisc` at README line 107, noting the discreteness and the width hypotheses above, and cite the same two names at the §8.3 and §8.5 *Needs:* lines in place of “precise invariance”.

## Previous findings

- R01 — partly repaired: `free_deck_presentation` and `RootsCover.halfPlaneForm` are stated and named in README §§1.8 and 6.3, and the docstring now says what the polygon lacks; the connection formula is still absent and still called unstatable (R01 above).
- R02 — not repaired: README line 107 still reads “Consume its `disjoint_smul_horodisc_horodisc` and `mem_stabilizer_of_mem_horodisc_of_smul_mem_horodisc`”; the diff does not touch it (R02 above).

No repair report after round 4 marks either finding not actionable; the only such ruling on the board (F06 of the second red-team repair, a merge-order edit) does not recur: the outside-folder diff at this head is empty.

## Verified sound

**Mechanical evidence.** HEAD is 57f0e041115a4b18a6c4c769c7878f87f11a1b98, the worktree is clean, `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ConformalMappingPartII'` is empty. The worker's gate at this head passes every scanner, the dependency check and the targeted build (`build=0 OK`). Fresh `lake env lean` on `TauCetiRoadmap/ConformalMappingPartII/Suggested.lean` exits 0 in 6.8 s with exactly 15 warnings, all `declaration uses sorry`, at lines 59, 69, 89, 105, 152, 162, 180, 195, 202, 215, 229, 249, 260, 272, 283 (14 in round 4 plus the new line 215). A scratch file with `#check @name` for all 28 roadmap declarations and the six library names the diff cites elaborated; the new declarations keep their binders: `RootsCover.halfPlaneForm : {N : ℕ} → RootsCover N → UpperHalfPlane → ℂ`, and `free_deck_presentation : ∀ {N : ℕ} (F : RootsCover N), …` with `t`, `r`, `φ` as `have`-bindings and the three conjuncts exactly as README §6.3 states them (`2 ≤ N` lives in `RootsCover.level`, so N = 0, 1, where cot(π/2) = 0 makes `t` the identity and `φ` non-injective, are excluded). Nothing was changed. One-tactic probe: replacing the `sorry` of `free_deck_presentation` by `simp` leaves the whole goal unsolved; `halfPlaneForm` has a real body on native carriers; no padding. No `set_option`, no sorried data, no `lemma`, imports unchanged (`import Mathlib` plus three existing `TauCeti.*` modules). Only pull request #1407 declares `halfPlaneForm` or `free_deck_presentation` across main and the open heads (`roadmaps grep --lean-only`).

The dependency command reports exactly

```text
depcheck: 235 roadmaps, 2067 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line; `ConformalMappingPartII` is line 232 of the merge order; the diff adds no supplier (its only new citation is Mathlib's Schwarz lemma).

**Changed passages against the sources and the pins.**

| Passage | Checked | Result |
|---|---|---|
| §1.5 (README 322) | `Mathlib/Analysis/Complex/Schwarz.lean:261`: `Complex.norm_deriv_le_one_of_mapsTo_ball` needs `DifferentiableOn ℂ f (ball c R)`, `MapsTo f (ball c R) (closedBall (f c) R)`, `0 < R`, concludes `‖deriv f c‖ ≤ 1`. | Applied to the lift φ of the cover of Ω through the cover of Ω′ (φ(0) = 0, R = 1): R(Ω,a) = R(Ω′,a)·‖φ′(0)‖ ≤ R(Ω′,a). The equality case at line 291 is indeed not needed; the new wording is correct. |
| §1.8 API bullet (README 367) | Conventions line 32: C(z) = i(1+z)/(1−z); C⁻¹(τ) = (τ−i)/(τ+i): C(C⁻¹(τ)) = i·(2τ)/(2i) = τ; C(1/2) = 3i, C⁻¹(3i) = 1/2. | `halfPlaneForm F τ = F.toFun ((τ − i)/(τ + i))` is F∘C⁻¹, so F̃_N(C(z)) = F_N(z) as the bullet says. |
| §6.2–6.3, `free_deck_presentation` | CDT-journal lines 2795–2828 (Proposition 5.2.1 and proof, printed p.674): stabilizer of i∞ generated by τ ↦ τ + 2cot(π/2N), Γ̃_N free on t̃_N and its conjugates by powers of r̃_N; `TauCeti/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup/FinTwo.lean:137`: `upperRightHom x` is the transvection τ ↦ τ + x; `TauCeti/Analysis/SpecialFunctions/Trigonometric/MatrixFinTwo.lean:134`: `rotation θ = !![cos θ, sin θ; −sin θ, cos θ]`; `Mathlib/Analysis/Complex/Trigonometric.lean:87`: `Real.cot`; `TauCeti/Topology/Compactification/OnePoint/ProjectiveLine.lean:189` (PSL action on `OnePoint ℝ`) and `Mathlib/Topology/Compactification/OnePoint/ProjectiveLine.lean:144`: `g • ∞ = ∞ ↔ g 1 0 = 0`. | Matches the source and the pins; values below. |
| §6.3 N = 2 sentence (README 764) | t = [[1,2],[0,1]], r = rotation(−π/2) = [[0,−1],[1,0]], u = r t r⁻¹ = [[1,0],[−2,1]]; Γ(2)/±1 is free on τ+2 and [[1,0],[2,1]] = u⁻¹; the oriented N = 2 cover is 1 − 2λ∘C, whose deck group is Γ(2)/±1 exactly (λ(i) = 1/2, λ(i∞) = 0). | Correct: the lower-triangular unipotent with entry −2, the plane with ±1 removed. |
| Docstring and README 133 | Marked polygon: the Dirichlet domain `TauCeti.dirichletDomain` exists at the pin but the identification with the marked 2N-gon and its side pairings is a construction, so naming it unstatable with that reason is acceptable. Connection formula: statable (R01). Cusp asymptotic: needs s_N beyond the lens (R01's repair wording). | One of the three claims is wrong (R01). |

**Why the statement is made for `RootsCover N` and not for the source's normalization.** The source pins F̃_N by “a cusp of value 1 at i∞ and F̃_N(i) = 0” (CDT-journal lines 2338–2341). That does not pin it: for N = 2 take F̃ = 1 − 2λ, γ = [[1,0],[2,1]] ∈ Γ(2) with γ·i = (2+i)/5, and h(τ) = (τ+2)/5 fixing ∞ with h(i) = γ·i; then F̃∘h has value 0 at i and limit 1 at i∞, but its stabilizer of ∞ is generated by h⁻¹(τ+2)h = τ + 10, not τ + 2. The roadmap's orientation F_N′(0) > 0 is the normalization that does pin the cover: the inverse germ F′(0)⁻¹J_N has real coefficients, so F_N is real and increasing on (−1, 1), F_N(F′(0)⁻¹J_N(x)) = x on [0, 1) and J_N(x) → γ_N = F′(0) (§§5.4–5.5), so the radial limit at 1 is 1 and the cusp at i∞ is the one whose parabolic, with its rotations, generates Γ_N from the radial loops of π₁(ℂ∖μ_N, 0); the Dirichlet-domain count then forces h_N. The README's sentence at line 764 (“the statement is made for `RootsCover N` and not for an arbitrary pointed cover”) is the right scoping; the gap is the source's (Source issues).

**Adversarial table.** New rows for the changed statements carry computed values (double precision, `witness.py` in the scratch directory). Rows for statements the diff leaves untouched are carried from the round-4 report (`PRREVIEW-ConformalMappingPartII~4`, its table of 59 rows), with their values abbreviated and that report cited; nothing in the diff touches them.

| Statement | Instances and values | Result |
|---|---|---|
| `RootsCover.halfPlaneForm` (new) | C⁻¹(i) = 0 so halfPlaneForm F i = F(0) = 0; C⁻¹(3i) = 1/2; C⁻¹(τ) → 1 as τ → i∞ along the imaginary axis (value 1 by Conventions line 32); C⁻¹(τ) ∈ 𝔻 for Im τ > 0 since |τ−i| < |τ+i|. | keep |
| `free_deck_presentation`, widths | h_N = 2cot(π/2N) = 2.000000, 3.464102, 4.828427, 12.627503 at N = 2, 3, 4, 10; cusp geometry: C(e^{iπ/N}) = −1.000000, −1.732051, −2.414214, −6.313752 = −cot(π/2N), so the two sides of the ideal 2N-gon at the cusp 1 are Re τ = ∓cot(π/2N) and the pairing translation has length h_N; h_N ≤ 4N/π (§8.6) holds at all four. | keep |
| `free_deck_presentation`, rotation | r = rotation(−π/N) fixes i (r·i = i at N = 2, 3, 4, 10), acts on the disc as multiplication by ζ_N⁻¹ (ratio w/z at z = 0.3+0.2i equals −1, −0.5−0.866025i, −i, 0.809017−0.587785i), and r^N = −I (projective identity), so the N conjugates r^k t r^{−k}, k = 0,…,N−1, are the parabolics at the N cusps ζ_N^{−k}. | keep |
| `free_deck_presentation`, N = 2 freeness | u = r t r⁻¹ = [[1,0],[−2,1]]; tu = [[−3,2],[−2,1]] ≠ ut = [[1,2],[−2,−3]] projectively, so the image is non-abelian; Γ(2)/±1 = ⟨τ+2, [[1,0],[2,1]]⟩ is free of rank 2 and equals ⟨t, u⟩. | keep |
| `free_deck_presentation`, stabilizer clause | All 13 120 reduced words of length ≤ 8 in t^{±1}, u^{±1} at N = 2: every word with vanishing lower-left entry is a power of t (0 violations); `smul_infty_eq_self_iff` makes `g • ∞ = ∞` exactly that entry's vanishing. | keep |
| `free_deck_presentation`, degenerate N | N = 1: cot(π/2) = 0, t = 1, `FreeGroup (Fin 1) → PSL` not injective; N = 0: `Fin 0` empty, range trivial, but `RootsCover 0` has no cusp structure. Both excluded by `RootsCover.level : 2 ≤ N`. | keep |
| `free_deck_presentation`, wrong normalization | The source's normalization admits F̃∘h with h(τ) = (τ+2)/5 (value 0 at i, limit 1 at i∞) whose stabilizer of ∞ is τ ↦ τ + 10 ≠ τ + 2: the statement would be false for an arbitrary cover with F(0) = 0 and radial limit 1; `RootsCover.oriented` excludes it. | keep; source gap |
| §1.5 monotonicity (changed citation) | 𝔻 ⊂ 2𝔻 at 0: 1 ≤ 2; cover 2z of 2𝔻 through itself: φ = id, ‖φ′(0)‖ = 1 ≤ 1. | keep |
| Conventions; 0.1–0.6; 1.1–1.4; 1.7; 1.8 `RootsCover`; 1.9–1.12; 2.1–2.9; 3.1–3.8; 4.1–4.8; 5.1–5.8; 6.1, 6.2, 6.4–6.8; 7.1–7.10; 8.1–8.7; 9.1–9.19 | Untouched by the diff; carried from the round-4 report with its values: e.g. jet of z² is (0,0,2); S(z²)(1) = −3/2; J₂ = u + u³/4 + 2u⁵/15 + …; γ₂ = 4.376879230453 = Γ(1/4)⁴/(4π²), γ₃ = 2.581056539840; N⁶E_N → ζ(3)²/8 = 0.1806; half rotation 1 − F₂(iz)² = 1/(1 − F₂(z)²) = 1.2111859623 at z = 0.1; T(1/(4z), 1/2) = −log 2; Shimizu minimum h₃(|a|+|c|) = h₃ over words ≤ 6; cusp height 47.2 ≥ 20.3 at (N, M) = (10, 2); the three means at N = 2 differ by ≤ 0.0965 < log 4; C* = 7 for the finite completion. | keep (round 4) |

**Cross-roadmap and library citations in the changed passages, resolved at this head.** §6.3 *Needs:* FuchsianOrbifolds Layer 2 (`TauCetiRoadmap/FuchsianOrbifolds/README.md:235` on main, hyperbolic polygons and cofinite groups); §6.2 Layer 3 (`README.md:263`); §1.8 cites ConformalMapping L4 (`Completed/ConformalMapping/README.md:102–127`). `Subgroup.CuspDatum` fields at `Cusp/Datum.lean:167–177` with `zpowers_generator` (full stabilizer), as §6.2 says. The `citations.md` leads are not findings: TeschlODE §1.2 and McMullenRS §16 are sources, not roadmaps; the six Lean names are the roadmap's own and are all declared in `Suggested.lean` (`halfPlaneForm` now at line 139).

**Source sample.** Of the seeded targets, only 1.8 falls in the changed passages; its locator (CDT-journal line 2342, Definition 5.1.1, printed p.667) was reopened and supports the bullet. The changed §6.3 was reopened at CDT-journal lines 2795–2828 (Proposition 5.2.1, printed p.674; page marker line 2780 is printed 674). The other seeded targets (0.2, 1.6, 2.1, 3.2, 4.1, 4.6, 6.1, 7.1, 7.2, 8.2, 8.6, 8.7, 9.16, 9.18) are untouched by the diff and were read in rounds 1–4; §4.6 was reread at CDT-journal line 2654 for R01 and its hypotheses are unchanged.

## Not verifiable

- **Hem88**, Theorem 3.1 (pp.97–115): settled as waived; cited by locator only (§§1.7, 2.5), untouched by the diff.
- **KR16**, §1: settled as uncertified; cited by locator only (§8.7), untouched by the diff.
- The uniform constants (C(M₀), N₀, the absolute C of §9.19) are proof targets; the sampled values are falsification checks, not certificates.

## Source issues

- **Gap** in CDT-journal at §5.1 preamble to Definition 5.1.1, printed p.667 (lines 2338–2341): the source says moving a cusp of value 1 to i∞ and requiring value 0 at i pins the cover exactly; it should also fix which cusp of value 1 (for N = 2, conjugating by τ ↦ (τ+2)/5 keeps both conditions and changes the width at i∞ from 2 to 10), for instance by F_N′(0) > 0; affects a stated result (Proposition 5.2.1's width).
