# FIX-PKG-LocalLanglandsCorrespondenceForG2~8: repair report

Review settled: `REV-PKG-LocalLanglandsCorrespondenceForG2~7` (three findings). Files changed: `packages/LocalLanglandsCorrespondenceForG2/README.md`, `packages/LocalLanglandsCorrespondenceForG2/design/plan.json` (top-level `gaps` only), `packages/LocalLanglandsCorrespondenceForG2/sources.toml`. `Suggested.lean` is unchanged: no finding touches a declaration in it, and no headline was added or removed.

## F01 (P1) — applied differently

Confirmed on GF: archimedean factors through the archimedean correspondence (GF line 112–118, used at GF line 310), S contains the archimedean places (GF line 191), the uniqueness globalization is spherical at every finite v ≠ v₀ (GF line 288), and Lemma 2.5 uses the cubic E₆ pair Aut(D) × G₂ (GF line 321–356). ExceptionalThetaCorrespondencesForG2 at its open head: Layer 10 (§§10.1–10.7) has only the Albert E₇ pair; §10.7 matches infinitesimal characters only.

Old → new: §3.11 states the family over all F (isomorphism-compatible), fixes the real factors explicitly, adds rule (e), restricts (ii)(b) to split O; new route; §1.3(a′),(c); §1.4(ii); three gaps; Poincaré contract extended.

Where the proposed repair was changed, and why:

- Real factors: the suggested citation "AutomorphicFormsOnReductiveGroups §§2.4–2.5" does not supply Langlands parameters for real G₂; §2.5 constructs the correspondence for GL_n(ℝ), GL_n(ℂ) only. §3.11 therefore fixes Lif at a real place on the two classes the global property uses: for compact G₂ with highest weight λ, the parameter is `sgn ⊕ ⨁_α Ind((z/z̄)^⟨λ+ρ,α∨⟩)` over the long positive roots α; for spherical split G₂(ℝ), `1 ⊕ ⨁ χ_i^(±1)`. These are then read through the GL₇ correspondence of §2.5 and the archimedean factors AL.1.4 and AL.R.2.
- Uniqueness for Irr♥: the suggestion "S = {v₀} when θ(π) is supercuspidal" needs a cuspidality criterion that §10.5 does not have for a definite O (it covers only Steinberg or a regular real weight). The route therefore always takes S = {v₀, v₁} with St at v₁: §10.5 (Steinberg) gives cuspidality, and the families agree at St by (i).
- Rule (e), the ψ-change rule, was added to (i). Without it uniqueness is false. The components at v₀ of global characters are the ψ_F(b·) with b algebraic over ℚ. Multiplying the factors of one supercuspidal π by ω_τ(u), and only at the characters ψ_F(a·) with a transcendental, keeps rules (a)–(d) and property (ii), so it gives a second family. This is a new Check, and it is recorded in Notes on the sources.
- (ii)(b) is stated for split O. GF §2.7(b) identifies real components only at split real places (Loke–Savin), and the uniqueness argument uses (b) only for split O. Recorded in Notes on the sources.
- Route inputs the review did not list are now named:
  - global Jacquet–Langlands for degree-three algebras, needed by the existence half of (b): new gap `cubic-global-jacquet-langlands` on EndoscopicTransferAndUnitaryTraceComparison §4.7a. No supplier states it; global JL exists only for GL₂, in GL2AutomorphicRepresentationsAndTransfer R17.3.
  - globalization of a GL_r supercuspidal: AutomorphicLFunctionsAndLocalFactorsPartII §10.0;
  - the global cubic division algebra: ClassFieldTheory Layers 5 and 10, plus BorelRegulators §3.1 (period equals index);
  - the cubic subfield e = k(x), x ∈ D close to x₀ at v₀: τ′ is trivial on an open normal subgroup of PD_F×, so its PE×-fixed vector stays fixed by (e ⊗ k_v₀)×/k_v₀×. This avoids the non-central Skolem–Noether theorem, which is not at the pins: `TauCeti.skolemNoether` needs a central simple source.
- Gaps added on ExceptionalThetaCorrespondencesForG2: `cubic-jordan-global-theta` and `real-exceptional-theta-parameters`, with the explicit real parameters above. The `poincare-weak-containment` contract gains (a′) and instance (c); the README and `plan.json` agree on 18 slugs.

Pattern search: the same unowned-global-input pattern was looked for in §§1.4, 2.4, 3.1, 3.15, 6.4 and 8.1. §2.4 already uses §1.6(ii), and §3.15 already has its Steinberg-cuspidality contract, so no other occurrence remained.

## F02 (P2) — applied

Confirmed at the open head of SmoothRepresentationsOfLocalGroupsPartII: SRU.5, §5.3, items 5.4 (*unramified-principal-series-irreducibility*, Kato) and 5.5 (*spherical-generic-criterion*), for split, adjoint, quasi-simple G. AL.3.3.8 gives the Jacquet–Shalika bound. Old → new: the contract pgsp6-pgso8-unramified-theta is deleted from Scope, the supplier contracts, §8.1 *Needs*, Layer 8 Dependencies and `plan.json`. The §8.1 route now reads: Satake bound ⇒ coroot values in (q⁻¹, q) ⇒ X(s̃) irreducible ⇒ generic ⇒ §3.41. The fourth Check is replaced by the trivial-representation witness (q³, q², q).

## F03 (P3) — applied

Confirmed: GS line 1549–1570 (proof of Lemma 12.4) does not use Proposition 10.7; §3.12 follows from §§3.9 and 3.10 and §10.30 (GS line 576–579); the route of §3.13 never uses §3.11. Old → new: "§1.6" is removed from §1.7 *Needs*, and "§3.11" from the *Needs* of §§3.12 and 3.13. §2.4 now cites "SRU.5, §5.3, *spherical-generic-criterion*" at the step, in its *Needs* and in Layer 2 Dependencies. §5.2 keeps "§1.6, §1.7".

## Checks run

- `lake env lean packages/LocalLanglandsCorrespondenceForG2/Suggested.lean` (from the content checkout): exit 0. The only diagnostics are `declaration uses 'sorry'` at 118:8 and 137:8.
- `#check @` scratch file over the five declarations (`octonionAut`, `octonionRep`, `griess_conjugacy`, `sumSquaresSeven`, `spin7_not_acceptable`), elaborated once. The types are unchanged from the worker's signature list: `octonionRep` keeps `[Group Γ]`, `griess_conjugacy` keeps both semisimplicity hypotheses and the intertwiner, and `spin7_not_acceptable` keeps `Finite Γ`. They agree with README §§0.0 and 0.8, and nothing changed.
- Dependency check, output exactly: `depcheck: 240 roadmaps, 2269 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name that is missing.
- Residue scan of the README (process words, pull-request numbers, paths, LaTeX delimiters): 0 hits.
- Ownership: `roadmaps grep` for cubic-period globalization, Prasad–Schulze-Pillot and G₂ × GL_r factors found no other owner on main or at the open heads. §1.3(c) and §3.11 stay here, and the generic inputs are supplier contracts. Board packages were not searched beyond the index. The new citations of open roadmaps (BorelRegulators, AutomorphicLFunctionsAndLocalFactorsPartII, SmoothRepresentationsOfLocalGroupsPartII, ExceptionalThetaCorrespondencesForG2, EndoscopicTransferAndUnitaryTraceComparison) were resolved at their heads, and all of them are earlier in the merge order.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §3.11 real factor, compact | λ = 0; λ = ω_a | long coroots b∨, a∨+b∨, a∨+2b∨: ρ gives 1, 2, 3; short coroots a∨, a∨+3b∨, 2a∨+3b∨ give 1, 4, 5. λ = ω_a gives 1, 3, 4. det Ind((z/z̄)^m) at j = −1, so the zero weight carries sgn | Weights 0, ±1, ±2, ±3 match §3.15 and the Gross–Savin weight-4 lift (HC parameter (3, 2, 1)); Check added |
| §3.11 real factor, split spherical | trivial rep | 1 ⊕ \|·\|^(±1) ⊕ \|·\|^(±2) ⊕ \|·\|^(±3) | Agrees with rule (a) and with §3.2 |
| Rule (e) vs rule (a) | torus data | ∏ over 1, χ_i^(±1) of χ(a)^r = 1; ω_τ(a)⁷; \|a\|^(7r(s−1/2)) | Consistent with §3.10 |
| Uniqueness without (e) | ψ_F(a·), a transcendental | ω_τ(u)-modification keeps (d), since ω_τ = ω_τ₁ ω_τ₂ | Counter-family exists, so (e) was added |
| Uncontrolled place | §1.4(i) | R_π R_z = 1 is solved by (2, 1/2) | §1.4(ii) is needed; Check added |
| Irr♥ uniqueness, θ(π) supercuspidal, S = {v₀} | definite O | §10.5 has Steinberg/regular-weight alternatives only | St at v₁ always |
| §1.4(ii) | ℚ, S = {p, ∞}; ℚ, S = {p, p′} | 0 and 1 free real places | Hypothesis "a real place outside S"; Check added |
| §1.3(c) | D split; δ = 1; χ∘Nrd nontrivial on e× | PGL₃ split, so no compact quotient; constant function; no fixed vector | Restricted to D division; Check added |
| §8.1 bound | trivial rep; component of Σ; q = 2 | (q³, q², q): \|λ₁\| = q³ > q^(1/2), coroot of ε₁−ε₂ = q; \|λ_iλ_j^(±1)\| ∈ (1/2, 2) ∌ 2, 1/2 | Components are generic in every characteristic |
| §2.4 citation | trivial rep | spherical, not generic, X(ρ) reducible | Consistent with 5.5 |
| `cubic-global-jacquet-langlands` | Π′ = χ∘Nrd | JL = χ∘det, L = ∏_j L(s + j − 1, χ) | "shifted cuspidal L-functions" holds |

## For the maintainer

- New supplier gaps: on ExceptionalThetaCorrespondencesForG2, `cubic-jordan-global-theta` (Layer 10, with Layer 5) and `real-exceptional-theta-parameters` (Layer 10, §10.7); on EndoscopicTransferAndUnitaryTraceComparison, `cubic-global-jacquet-langlands` (§4.7a). The `poincare-weak-containment` gap on AutomorphicFormsOnReductiveGroups now has three instances. The gap `pgsp6-pgso8-unramified-theta` on MetaplecticAutomorphicForms is withdrawn.
- New supplier edges: BorelRegulators §3.1, AutomorphicLFunctionsAndLocalFactorsPartII §10.0, ClassFieldTheory Layer 10, SmoothRepresentationsOfLocalGroupsPartII SRU.5 and AutomorphicLFunctionsAndLocalFactors AL.1.4, AL.R.2 and AL.3.3.8. All are earlier in the order or on main.
- No section id was renumbered. §1.4 now has statements (i) and (ii), and §1.3 has (a′) and (c), so citations of "§1.4" and "§1.3" stay valid. No Lean name changed.
- Sources: the GF locator now lists §2.4, Lemma 2.5, §2.7 and §2.8, and its `cited_for` is extended. No new source was fetched and no text is missing.
