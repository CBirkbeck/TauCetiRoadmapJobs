# Repair report: FIX-DESIGN-CohomologyOfGroups~2

Files changed: `packages/CohomologyOfGroups/design/README.md`, `packages/CohomologyOfGroups/design/plan.json`,
`packages/CohomologyOfGroups/sources.toml`. One review (`REV-DESIGN-CohomologyOfGroups`), fourteen
findings; every finding was verified on the mathematics before editing. The design stage has no
`Suggested.lean`, so no Lean declaration was added, changed or elaborated.

## F01 (P1) — applied

Changed: 3.1 "if every `C_p` is flat … both isomorphisms" → two clauses: flat `C_p` gives
`C ⊗ M ≃ M` and `H^G_n(C; M) ≅ Hₙ(G, M)`; projective `C_p` gives `M ≃ Hom_k(C, M)` and
`H_G^n(C; M) ≅ Hⁿ(G, M)`. Telescope Check added; plan 3.1 matches.
Verified: `(1,0,1,0,…)` is not `(a_i − 2a_{i+1})`, since `a₀` would be `−1/3 ∈ ℤ₂`; so `H_G^2 ≠ 0`.

## F02 (P2) — applied

Changed: "with the long exact sequences … of 2.2" → API bullets: sequences in `C` need degreewise
exactness after `⊗ M` / `Hom_k(−, M)` (split over `k`; `M` flat / injective; `C''_p` flat /
projective); sequences in `M` need flat / projective `C_p`. Check: `ℤ →2 ℤ → ℤ/2` ⊗ `ℤ/2`. 2.2
unchanged.

## F03 (P1) — applied

Changed: 3.6 "`Hₙ(A ∗ B, M) ≅ Hₙ(A, M) ⊕ Hₙ(B, M)` for `n ≥ 1`" → "for `n ≥ 2`, every `M`; degree one
`0 → H₁(A,M) ⊕ H₁(B,M) → H₁(A∗B,M) → M → M_A ⊕ M_B → M_{A∗B} → 0`; direct sum when the action is
trivial". Sign-module Check added; plan updated.
Verified: `ℤ ∗ ℤ` with `−1` actions has `H₁ = ker(−2m_a − 2m_b) ≅ ℤ`, factors `0`, kernel `2ℤ`.

## F04 (P1) — applied

Changed: 5.1 pins `×` to the Eilenberg–Zilber shuffle (`[g] × [h] = [(g,1)|(1,h)] − [(1,h)|(g,1)]`);
4.6 defines the evaluation by the sign-free Kronecker formula; the cohomological cross product's
"`(−1)^{|y||a|}⟨x,a⟩⟨y,b⟩`" → "`⟨x,a⟩⟨y,b⟩`", with the `(1,1)` Check (value `1`); plan `cross_eval`.
Verified: on normalized cocycles only the identity shuffle survives; `⟨dφ, c⟩ = ⟨φ, ∂c⟩` with
Mathlib's differentials.

## F05 (P1) — applied

Changed: 6.5 "`(−1)^{qp'}`" → "`(−1)^{pq'}`" (README, plan); Check now computes `y ∪ x ↦ +x·y`,
`x ∪ y ↦ −x·y`; 6.2 states that restriction applies to `A*_p`-representatives (or HS53's shuffle
sum).
Verified: HS53 line 692 and 696 (exponent `i'j`); with `d₁ = (−1)^q d` the derivation rule is off by
`(−1)^{q'}` for the old sign; plain restriction of `x̃ ∪ ỹ` is `0`, of `ỹ ∪ x̃ ∈ A*_1` is `+x·y`.

## F06 (P1) — applied

Changed: Layer 6 Examples "`E₃` is the column `p = 0` and the row `q = 0` … `Hₙ(ℤ/4, 𝔽₂) = 𝔽₂`" →
"`d₂y = x²`, `d₂(xᵖy^q) = q x^{p+2}y^{q−1}`, `E₃ = 𝔽₂[x, y²]/(x²)` in columns `0, 1` and even rows,
`E₃ = E_∞`, one `𝔽₂` per total degree, `Hⁿ(ℤ/4, 𝔽₂) = 𝔽₂`".

## F07 (P2) — applied

Changed: 7.2 "If `P` is abelian" → "If `P` is abelian and `G` acts trivially on `M`", with the
Burnside-fusion reason; `C₂ × S₃` counterexample added as a Check; plan statement, hypothesis, test.
Verified: `N_G(P) = P`; `c_{(23)}` moves `e₃` to `e₂` on `⟨z⟩`; invariants dimension `1 + 2 = 3`,
stable classes `dim H¹(P, 𝔽₂) = 2`.

## F08 (P1) — applied

Changed: 8.5 Check "`SL₂(𝔽_q)` for odd `q` … periodic" → "`q = p^f` odd: Sylow 2 quaternion, Sylow
`ℓ ≠ p` cyclic, 2-period 4; Sylow `p ≅ (ℤ/p)^f`, cyclic iff `f = 1`; `SL₂(𝔽₉)` not periodic";
plan test.
Verified: unipotent `C₃²` of order `9 = |SL₂(𝔽₉)|₃` (`720`); Hutchinson13 line 494 assumes `ℓ ≠ p`.

## F09 (P2) — applied

Changed: 6.2 and supplier contracts "`…PageXIsoGradedOfFinite`" → "`CochainComplex.filtrationSpectralSequencePageXIsoEInfty`
and `CategoryTheory.Abelian.SpectralObject.EInftyIsoCokernel`", with `F_t = A_{−t}`, classical
`E_r^{p,q}` at `(2p + q + 1, −p − 1)` on page `r + 1`, hypotheses from page `max(q + 3, p + 2)`; 6.1
API "bounded per degree"; new 6.2 Check.
Verified: `Filtered/Convergence.lean:118` needs `F a = ⊥`; `Filtered/Stabilization.lean:83`.

## F10 (P2) — applied differently

Changed: "Local restatements" paragraph and fictitious consumers → Scope owner bullets; supplier
contracts for SchemeKTheoryOperations §6.7, K3BlochGroups §§4.1, 5.2, MappingClassGroups… §1.1,
IntegralIwasawaTheoryPartII §0.7; comparisons in 2.1, 2.3, 3.2, 4.6, 7.2, 8.1; imports in 5.4, 6.2,
6.6, 6.7 (now `m ≥ 2`), 8.4 (Swan, quaternion resolution); duplicates in 6.8, 8.1 deleted.
Differently: InductionRestrictionPartII RS.0.1 is cited in Scope and 6.8 only, as nothing consumes it
after the duplicate's deletion; StableHomotopyKTheory §3.29 (Hopf for perfect groups) was found and
named in Scope. Each owner was read at its head; all are earlier in the merge order.

## F11 (P3) — applied

Changed: 4.6 "the second `cor` homological and the first cohomological" → "the first `cor` is the
homological corestriction `Hₙ₋ₚ(H, P) → Hₙ₋ₚ(G, P)` and the second the cohomological corestriction
`Hᵖ(H, M) → Hᵖ(G, M)`" (README and plan `cap_transfer`).

## F12 (P3) — applied differently

Changed: locators at 1.3 (Brown82 Ch. III), 2.2 (CE56 Ch. XVII), 3.1 (Brown82 Ch. VII), 1.5 (HS53
line 129–141), cohomological Künneth (Loh19 line 5985–5994, statement only), 6.9 (HS53 line 854–856,
sequence only); "transgression of 6.5" → 6.6; gap users "6.3, 6.5" → "6.3, 6.4".
Differently: HS53 §5 (lines 239–288) filters by group degree, the other sequence, so 3.2 cites the
HS53 §4 bicomplex and Brown82 Ch. VII instead.

## F13 (P2) — applied

Changed: 4.2 ↔ 4.3 (connecting maps and uniqueness before identities) and 5.2 ↔ 5.3 (universal
coefficients before cohomological Künneth), with every Needs line, prose reference and plan
id/prerequisite updated; the UCT identification of the evaluation is only in the UCT target. No
roadmap cites these ids, so no old-to-new table; no plan prerequisite points forward.

## F14 (P3) — applied

Changed: API bullet lists added in README and plan for 3.1, the cohomological cross product, 5.4,
6.1, 6.6, 7.2 and 8.4 (`p`-period), each stating hypotheses and conclusions; existing Checks kept.

## Checks run

Dependency gate (after all edits):

```text
candidate: CohomologyOfGroups is not in the merge order yet; checked as if placed after IntegralIwasawaTheoryPartII (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2179 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean
name found nowhere. `sources check packages/CohomologyOfGroups/sources.toml`: 0 problem(s). New pinned
names verified by hand at the pins: `CochainComplex.filtrationSpectralSequencePageXIsoEInfty`,
`CategoryTheory.Abelian.SpectralObject.EInftyIsoCokernel`, `TauCeti.ContCohomology.IsTransgressionLift.cocycle`
(and `IsTransgressionLift.sub_apply_one`, which normalizes a lift at `1`). No `Suggested.lean` exists at
this stage, so the `#check @name` audit and elaboration do not apply; nothing was elaborated.

## Adversarial pass (changed and added statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| 3.1 homology, flat | `k = ℤ/4`, `C = k ⊕ (ℤ/2→ℤ/4→ℤ/2)`, `M = ℤ/2`; standard resolution; zero ring | `H₂ = ℤ/2` vs `0` (non-flat, excluded); iso is `groupHomologyIso`; `0 = 0` | holds as stated |
| 3.1 cohomology, projective | telescope over `ℤ`; standard resolution | `H² ⊇ Ext¹(ℤ[1/2], ℤ) ≠ 0` vs `0` (excluded); free terms give iso | holds |
| 3.1 sequences | `ℤ →2 ℤ → ℤ/2` with `M = ℤ/2`, with `M = ℤ`; tree sequence | `0`-map not injective (excluded); `0→ℤ→2ℤ→ℤ/2→0` exact; split ✓ | holds |
| 3.6 free products | `ℤ∗ℤ` sign module; trivial `ℤ`; `A = B = 1`; `ℤ/2∗ℤ/2` | `H₁ = ℤ`, kernel `2ℤ`; `H₁ = ℤ²`, `M ↪ M²`; tail `0→M→M²→M→0` exact; `(ℤ/2)²` odd `n` | holds |
| 4.6 evaluation | degree 0/1 Mathlib differentials; torus | `λ(g⁻¹m) − λ(m)` both sides; `⟨x∪y,z⟩ = 1`, `⟨y∪x,z⟩ = −1` | holds |
| 4.6 cor labels | degree 0; `H = G` | both sides `Σ[μ(g·x⊗n)]`; identity | holds |
| 4.6 vs IntegralIwasawaTheoryPartII §0.7 | degrees 0, 1 | `κ(m)`; `φ(g)(m) = κ(1,g)(m)` | holds |
| 5.1 shuffle cross product | `p = q = 1`; exchange `τ` | `[(g,1)|(1,h)] − [(1,h)|(g,1)]`; `τ_*(a×b) = −b×a` | holds |
| cross evaluation | `ℤ×ℤ`, `(1,1)`; `H = 1` | `1 − 0 = 1`; `⟨pr₁^*x, a⟩ = ⟨x, a⟩` | holds; Koszul sign gives `−1` |
| 5.4 directed unions | `ℚ = ⋃(1/m!)ℤ`; non-directed cyclic cover of `S₃` | `colim ℤ = ℚ`, `Λ²ℚ = 0`; excluded | holds |
| 6.1 bound | `N = 1`; `N = G` | every `A_j ≠ 0`; `A_1 = 0` | per degree only |
| 6.2 convergence | `N = 1`, `G = ℤ/2`, `(0,0)`, `(2,0)` | page 3: `A_2` zero in degree 1, `C̄/A_{−1} = 0`; page 4: `A_5`, `C̄/A_0 = 0`; `E_∞ = 𝔽₂` | holds |
| 6.2 index map | classical `(0,0)` | Mathlib `(1,−1)`, piece `A_0H/A_1H` | holds |
| 6.5 sign | `ℤ×ℤ ⊃ 0×ℤ`; `𝔽₂` case | `y∪x ↦ +x·y`, `x∪y ↦ −x·y`; signs invisible | `(−1)^{pq'}` holds, `(−1)^{qp'}` fails |
| 6.6 degree one | `ℤ/2⊂ℤ/4`; split; `ℤ/3⊂ℤ/9` | nonzero; `0`; `df(2,1) = −1` | holds |
| 6.7 degree `m ≥ 2` | `2ℤ/4⊂ℤ/4`, `M = ℤ`, `m = 2`; `M = 𝔽₂`; `N = 1`, `N = G` | `0→ℤ/2→ℤ/4→ℤ/2→0`; inflation `x² ↦ u² = 0` (hypothesis fails); isomorphisms | holds |
| 6.7 homological | `ℤ/2⊂ℤ/4`, `ℤ` | `0→ℤ/2→ℤ/4→ℤ/2→0`, `1 ↦ 2` | holds |
| 6.8 Hopf | `ℤ/n`; `ℤ²`; free `F` | `0` (model `R/[F,R]` gives `ℤ`); `ℤ`; `0` | holds |
| Layer 6 example | `ℤ/2⊂ℤ/4`, `𝔽₂` | `E₃ = 𝔽₂[x,y²]/(x²)`, one class per degree | holds |
| 7.2 abelian, trivial action | `S₃`, `p = 3`; `C₂×S₃` twisted | invariants `0`, `ℤ/3` match `H²(3)`, `H⁴(3)`; `3 ≠ 2` (excluded) | holds |
| 8.1 integral instance | `ℤ/2`, `i = 1`; `i = 0` | `ℤ/2 = ℤ/2`; `0 ≠ ℚ/ℤ` (excluded) | holds |
| 8.4 quaternion, period | `Q₈`; `ℤ/2`; `S₃` | `Ĥ² = (ℤ/2)²`, `Ĥ⁴ = ℤ/8`, period 4; period 2; `H₃(S₃,ℤ_(3)) = ℤ/3 ↔ Ĥ⁴(3) = ℤ/3` | holds |
| 8.5 SL₂ Check | `q = 3, 5, 9` | Sylows `C₃,Q₈`; `C₅,C₃,Q₈`; `C₃²` | periodic, periodic, not |
| 2.1 reindexing | `b = −1`, `C = ℤ` in degree `−1`, `G = 1`; `n < b` | `H_{−1} = H₀ = ℤ`; `0` | agrees with K3BlochGroups §4.1 |

## For the maintainer

- Ownership against open pull requests was checked with the roadmap tools at the heads listed
  above. This design now consumes four open roadmaps earlier in the merge order
  (SchemeKTheoryOperations, K3BlochGroups, MappingClassGroupsAndCanonicalRepresentations,
  IntegralIwasawaTheoryPartII); the gate places it after IntegralIwasawaTheoryPartII. No notion was
  moved down from a later roadmap.
- Target ids 4.2/4.3 and 5.2/5.3 were exchanged; no other roadmap cites this design.
- No source was fetched or requested; no `needs-references.toml` was written. The manifest gained
  the HS53 Ch. II §3 locator and corrected `cited_for` lists (Loh19 4.2, HS53 5.3, Hutchinson13 8.5,
  CE56 8.5).
