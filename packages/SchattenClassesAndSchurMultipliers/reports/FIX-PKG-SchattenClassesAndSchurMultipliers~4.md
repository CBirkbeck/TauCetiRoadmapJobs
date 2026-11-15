# FIX-PKG-SchattenClassesAndSchurMultipliers~4

One review was resolved: `REV-PKG-SchattenClassesAndSchurMultipliers~3`, with one finding, F01.
Its "For the human reviewers" section (two licence notes) raises no finding, and nothing was
changed because of it.

## F01 (P3) — applied

**Verification.** The finding is right. In this README §2.3 is "Transposition" (line 866) and
§2.5 is "Conditional expectation of bounded functions". On main, NoncommutativeIntegration §2.3 is
"The complex method and Calderón's upper method", and it contains the regularisation and the
operator estimate `‖T‖_θ ≤ ‖T‖₀^(1−θ)‖T‖₁^θ`. Its §2.5 is "Interpolation of semifinite Lp
couples" and its §1.5 is the Schatten identification `Lᵖ(B(H), Tr) = S_p`. At the head of its
open pull request, BochnerSpaces §4.2 is "Fubini's theorem" (`exists_fubiniEquiv`, σ-finite `μ`,
`ν`, `1 ≤ p < ∞`), and §7.5 proves the divisibility of atomless finite measures.

**Changes requested by the review** (old → new):
- (a) §1.3 route: "regularisation of §2.3 … (§2.5 with §1.5) … operator estimate of §2.3" →
  "regularisation of NoncommutativeIntegration §2.3 … (NoncommutativeIntegration §2.5 with its
  §1.5) … operator estimate of NoncommutativeIntegration §2.3".
- (b) §9.3: "(through §1.5)" now names NoncommutativeIntegration §1.5. The clause now also states
  what is consumed. The couple is that of `L^∞(ℝⁿ) ⊗̄ F_k` with trace `∫ Tr`. Its `Lᵖ` norm on
  bounded `g` is `‖g‖_{Lᵖ(S_p^k)}`, by the pointwise functional calculus; §1.5 covers only
  `k = 1`. The couple `(S₁, B)` uses NoncommutativeIntegration §1.5 for `B(H)`.
- (c) Layer 4 Dependencies: "NoncommutativeIntegration §2.3, §2.5, §2.6 through §1.3" →
  "through §1.3 of Layer 1, NoncommutativeIntegration §1.5, §2.3, §2.5 and §2.6". §1.5 was added
  because the `*Needs:*` line of §1.3 lists it.
- (d) Scope, BochnerSpaces bullet: "§7.1 applies §7.5 …; §11.3 uses §4.2" → "§7.1 applies
  BochnerSpaces §7.5 …; §11.3 uses BochnerSpaces §4.2".

**Same pattern repaired elsewhere** (a supplier's section written bare, or one of this roadmap's
sections written bare inside a supplier's sentence):
- Scope, NoncommutativeIntegration bullet: the eight locators `(§1.5)`, `(§1.3)`, `(§1.4)`,
  `(§2.1)`, `(§2.3)`, `(§2.5)`, `(§2.6)` and `(§4.4)` → `(its §n)`.
- Scope, BochnerSpaces bullet: `(§7.4)`, `(§7.5)`, `(§4.2)` → `(its §n)`, and "§2.5 proves" →
  "Here §2.5 proves".
- Scope, AutomorphicSpectralTheory bullet: `(§0.8)` and `(§0.10)` → `(its §n)`; both mentions of
  §0.9 → "AutomorphicSpectralTheory §0.9", since "its" would be ambiguous next to
  VonNeumannAlgebras; "§2.2 proves it" → "§2.2 here proves it".
- Scope, UnboundedOperators: `(§5.1, UO-E01)` → `(its §5.1, UO-E01)`. This roadmap's own §5.1 is
  a different section.
- Scope, BanachSpaceTheory: "used in §6.4" → "used here in §6.4".
- Exact supplier contracts, AutomorphicSpectralTheory: "(§0.9 defines no second trace)" →
  "(AutomorphicSpectralTheory §0.9 defines no second trace)"; "§2.2 derives it from §0.8, §0.9" →
  "§2.2 here derives it from AutomorphicSpectralTheory §0.8, §0.9".
- Conventions: a new bullet, **Section references**. A bare section number is a section of this
  roadmap. A section of another roadmap is written with that roadmap's name. The one exception is
  a bullet key under a "From TauCetiRoadmap.X" heading. Witness: §2.3 here versus
  NoncommutativeIntegration §2.3.

**Pattern search after the edits.** Two scripted passes were run over every `§` reference in the
README.
1. Every reference whose number is not one of this roadmap's 45 sections. Each is either preceded
   by its roadmap's name (or "its" directly after the name, or a list continuing from that name)
   or is a bullet key under that supplier's contract heading. "Lafforgue–de la Salle §2" names a
   source.
2. Every unattributed reference to a number that also exists here (§1.3, §1.4, §2.1, §2.3, §2.5,
   §4.2, §4.3, §5.1, §7.3). Each was read in context. All are this roadmap's own sections or
   bullet keys under a supplier heading.

`Suggested.lean` cites only "README §n" and is unchanged.

## Checks

- **Elaboration.** `lake env lean packages/SchattenClassesAndSchurMultipliers/Suggested.lean`
  was run from the content repository. Exit code 0. There are 11 warnings, each "declaration uses
  `sorry`" (lines 97, 107, 120, 130, 143, 165, 177, 196, 207, 247, 276), and no other message. The
  file is unchanged this round.
- **Signatures.** A scratch copy of the file was elaborated with `#check @name` for each of the
  19 declarations. One spurious extra `#check @is`, produced by the line picker from a docstring
  line, gave its own unknown-identifier error and is not part of the file. The 19 types match
  `scratch/signatures.md` and the README statements. Every Schur theorem keeps `[SigmaFinite μ]`.
  The two continuous-symbol theorems keep `LocallyCompactSpace`, `T2Space`, `BorelSpace`,
  `IsFiniteMeasureOnCompacts` and `InnerRegularCompactLTTop`. `schurNorm_le_hmsNorm` keeps
  `1 ≤ n`, `1 < p` and `p ≠ ∞`. Nothing changed.
- **Dependency direction.** Output of the gate's depcheck:

      depcheck: 239 roadmaps, 2247 edges, 0 problem(s)

  There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name
  that is missing everywhere. The citations changed this round were checked at their copies.
  - NoncommutativeIntegration §1.5, §2.3, §2.5, §2.6, §4.4: headings on main.
  - BochnerSpaces §4.2, §7.4, §7.5: at the head of its open pull request, read through
    `roadmaps show`.
  - AutomorphicSpectralTheory §0.8, §0.9, §0.10: at its open head. §0.9 consumes the
    VonNeumannAlgebras V4 trace and defines no other.
  - UnboundedOperators §5.1 (UO-E01): on main, its line 900.
- **Gate failures.** None were listed for this round.

## Adversarial pass on the changed text

No statement changed: the edits change citations, route wording, one Dependencies line and one
Conventions bullet. Each was recomputed.

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.3 route, regularisation (NoncommutativeIntegration §2.3) | `H = ℓ²`, `p₀ = 1`, `p₁ = ∞`; is the identity in the closure of `S₁` in `B(H)` | for finite-rank `F` and a unit vector `e ∈ ker F`, `‖1 − F‖ ≥ ‖(1 − F)e‖ = 1`, so the closure is `S_∞ ≠ B(H)`; the regularised couple is `(S₁, S_∞)` | route correct; regularisation needed | citation named |
| §1.3 route, `[L¹(B(H)), B(H)]_θ = S_{p_θ}` (NoncommutativeIntegration §2.5 with §1.5) | `M₂`, `x = diag(3, 1)`, `θ = 1/2`, `f(z) = √10 (x/√10)^{2(1−z)}` | `f(1/2) = x`; `‖f(it)‖₁ = √10 · (9 + 1)/10 = √10`; `‖f(1 + it)‖_∞ = √10`; so the bound `√10 = ‖x‖₂` | holds | none |
| §1.3 worked example | `T(A) = Tr(A) E₁₁` on `M₂`, `p_θ = 2` | `C₀ = 1`, `C₁ = 2`, `θ = 1/2`, bound `√2 = 2^{1 − 1/2}`; norm at `1`: `‖T1‖₂ = 2`, `‖1‖₂ = √2`, ratio `√2` | sharp, as stated | none |
| Layer 4 Dependencies | `*Needs:*` of §4.2 → §1.3, §1.4; of §1.3 → NoncommutativeIntegration §1.5, §2.3, §2.5, §2.6; of §1.4 → its §2.6 | union `{§1.5, §2.3, §2.5, §2.6}`; the old line lacked §1.5 | completed | §1.5 added |
| §9.3 interpolation step | `C₀ = |F|` at `p = 1`, `C₁ = 1` at `p = ∞`, `θ = 1 − 1/p` | `C₀^{1−θ} C₁^θ = |F|^{1/p}`, the stated bound; the exchanged exponents would give `|F|^{1 − 1/p}`, wrong at `p = 4`, `|F| = 16`: `2` versus `8` | holds | none |
| §9.3 norm of `L^∞(ℝⁿ) ⊗̄ F_k` | `k = 2`, `g = diag(2, 1) 1_{[0,1]}` | `∫ Tr |g|^p = 2^p + 1 = ‖g‖_{Lᵖ(S_p^2)}^p`; the pointwise operator norm would give `2^p` | pointwise formula is the right one; §1.5 alone covers only `k = 1` | clause added |
| Scope, §7.1 applies BochnerSpaces §7.5 | Lebesgue on `[0, 2]`, `A = [0, 2]`, `t = 1/2`; restriction to `A` with `μ(A) = ∞` | `B = [0, 1]`, `ν(B) = 1 = t ν(A)`; the infinite case is excluded by restricting to a set of finite measure | hypotheses match (finite, atomless) | citation named |
| Scope, §11.3 uses BochnerSpaces §4.2 | `p = 2`, `X = ℂ`, Lebesgue on `ℝⁿ_z` and on `ℝⁿ_x × ℝⁿ_y`; counting measure on `{1, 2}` | `2 ∈ [1, ∞)`, Lebesgue measure σ-finite, `ℂ` complete; counting measure on `{1, 2}_z` and `{1, 2}²_{(x,y)}` with `F ≡ 1`: `‖F‖₂² = 8` on the product and `Σ_z ‖F(z, ·)‖₂² = 2 · 4 = 8` iterated | hypotheses match | citation named |
| Contracts, "AutomorphicSpectralTheory §0.9 defines no second trace" | its §0.9 at the head | it consumes the VonNeumannAlgebras V4 trace; rank-one `tr(v ↦ ⟨u, v⟩w) = ⟨u, w⟩` there, `Tr(w ⊗ u*) = ⟨u, w⟩` in V4.Core | same functional | citation named |
| Conventions, section references | §2.3 here; NoncommutativeIntegration §2.3 | "Transposition" (line 866) versus "The complex method and Calderón's upper method" (main) | witness correct | bullet added |

## Ownership and overlaps

The ownership claims are unchanged. No construction was added. Each newly named section belongs
to the roadmap that the Scope section already credits, so no object gained a second owner.
`scratch/overlaps.md` lists no second copy, no dropped id and no conflicting pull request.
Ownership against the open roadmap pull requests was checked through `roadmaps show`, `grep` and
`resolve`, as in the earlier rounds.

## For the maintainer

- No Lean name changed, and no section, layer or target id changed. No other roadmap is affected.
- The two declared supplier gaps are unchanged. In `design/plan.json` they are
  `sigma-finite-hilbert-schmidt-kernels` (AutomorphicSpectralTheory §0.8) and
  `semifinite-martingale-bmo-interpolation` (NoncommutativeIntegration, Part II).
- BochnerSpaces is cited at the head of its open pull request, a new roadmap folder by another
  author. Its §4.2, §7.4 and §7.5 are cited by those numbers there.
- No source was fetched or requested. `sources.toml` and `needs-references.toml` are untouched.
