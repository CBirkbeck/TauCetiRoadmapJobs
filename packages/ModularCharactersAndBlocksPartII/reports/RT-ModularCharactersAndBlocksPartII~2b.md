<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16826#issuecomment-6900419386 -->
Red team round 2 pass b (claude) of 0234184

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P2) the route of §4.2 inducts through a subgroup that need not be normal

   - **Location.** `packages/ModularCharactersAndBlocksPartII/README.md:937–939`: "Route: induction on
     `|S|`, the last step being §3.4 (b) for the prime-order group `S_{m−1}`, with the transitivity of
     the congruence through `C ≤ C_Γ(S_{m−1})`".
   - **Claim.** After the last step (`S_{m−1}` on `Γ`), the induction hypothesis applies to the
     remaining chain `S ⊵ ⋯ ⊵ S_{m−1}`, which carries `λ` to `λ_{m−1} ∈ Irr(C_Γ(S_{m−1}))`.
   - **Witness.** It needs `S_{m−1} ⊴ S`. Monomial `S = D₈ ≤ GL₂(3)` on `Γ = C₃²`, series
     `D₈ ⊵ V₄ ⊵ ⟨diag(1,−1)⟩ ⊵ 1`: the swap moves `C_Γ(S₂) = C₃ × 1` to `1 × C₃`. Same step:
     glauberman line 546.
   - **Repair.** Replace the sentence by: "Route: induction on `|S|`, through the first term of the
     series. `S₁ ⊴ S` has index `p`. The induction hypothesis for `S₁` acting on `Γ`, with the series
     `S₁ ⊵ ⋯ ⊵ S_m = 1` and `λ₁ ∈ Irr(C_Γ(S₁))`, gives a sign `ε₁` with
     `(Λ_C(λ)|_{C_Γ(S₁)} − ε₁ λ₁)/p` zero or a character of `C_Γ(S₁)`. §3.4 (b) with `B = 1`, for the
     group `S/S₁` of order `p` acting on `C_Γ(S₁)` with fixed subgroup `C`, where `λ` is the cyclic
     correspondent of `λ₁`, gives a sign `ε₀` with `(λ₁|_C − ε₀ λ)/p` zero or a character of `C`.
     Restricting the first to `C` and adding, `(Λ_C(λ)|_C − ε₁ ε₀ λ)/p` is a virtual character of `C`
     whose multiplicities away from `λ` are those of `Λ_C(λ)|_C` divided by `p`, and whose
     multiplicity at `λ` is `([Λ_C(λ)|_C, λ] − ε₁ ε₀)/p ≥ 0`, as `[Λ_C(λ)|_C, λ] ≥ 0` is `≡ ε₁ ε₀`
     modulo `p`." The `*Needs:*` line (§§3.4, 4.1) is unchanged.
     Tested on the refuting instance: `S₁ = V₄ ⊴ D₈`, `C_Γ(V₄) = 1 = C`, `λ = λ₁ = 1`, `ε₀ = 1`;
     inside `V₄` the first term `⟨diag(1,−1)⟩` is normal, `V₄/⟨diag(1,−1)⟩` inverts `C₃ × 1`,
     `λ₂ = 1`, `Λ_C(1) = 1`, and `(1|_C − 1)/2 = 0`. On `SL(2,3)`: `S₁ = 1`, `ε₁ = 1`, `ε₀ = −1`,
     `(2 sgn + sgn)/3 = sgn`.

2. **F02** (P3) the remark on `ε'` in §3.4 names `|A| = 2` where every even order behaves the same

   - **Location.** `README.md:859–860`: "when `|A|` is odd, `θ₀ = 1` and `ε' = ε(χ)`, while for
     `|A| = 2` the sign `ε'` may differ from `ε(χ)` by `θ₀(a) = −1`".
   - **Claim.** The dichotomy is odd order against order `2`.
   - **Witness.** `θ₀² = 1` allows the character of order `2` for every even `|A|`: `A = C₄`, `θ₀` of
     kernel `C₂`, generator `a`, `θ₀(a) = −1`, so `ε(χ) = ε' θ₀(a) = −ε'`. The statement (a) at
     `README.md:856` already covers this; only the remark omits orders `4, 6, …`.
   - **Repair.** Replace "while for `|A| = 2` the sign `ε'` may differ from `ε(χ)` by `θ₀(a) = −1`" by
     "while for `|A|` even `θ₀` may be the character of order `2`, and then `ε' = −ε(χ)`, as
     `θ₀(a) = −1` at a generator `a`; this already occurs for `|A| = 2`". Tested: `|A| = 4` gives
     `ε(χ) = −ε'`; `|A| = 3` gives `θ₀ = 1`; `3^{1+2}_+` with `|A| = 2`: `χ̂(a) = −1`, `ε = −1`,
     `(ε', θ₀(a)) = (1, −1)` or `(−1, 1)`.

Two new findings, S01 (P2) and S02 (P3), both in proof routes or remarks of the README; no
statement, no Lean declaration and no `*Needs:*` edge is false. All five findings of round 1 are
repaired at this head and the repairs introduced no error. Both files were read in full
(`packages/ModularCharactersAndBlocksPartII/README.md`, 1805 lines;
`packages/ModularCharactersAndBlocksPartII/Suggested.lean`, 344 lines). No Lean was run.

## Round 1 findings at this head

| Finding | Status | Witness at `0234184` |
|---|---|---|
| 1a/F01, 1b/F01 (routes of §§3.2, 3.4, 4.3 named the source's lemmas or said "as in the source") | repaired | `README.md:821–823`: "and §3.1, which makes the sum of `|χ̂|²` over the coset `a Γ` equal to `|Γ : C|` times its sum over `a C`, turns the norm identity into `Σ_λ m_λ² = 1`"; `README.md:860–878`: own route through §§1.2, 3.1–3.3 and CharacterTheory §§3.6, 4.1; `README.md:954`: "Route: induction on `|S|`". No "as in the source" and no unkeyed lemma number remains (grep). |
| 1a/F02 (two Theorem 4 locators at line 543) | repaired | `README.md:952`: "glauberman line 542, Theorem 4 (b), (c)"; `README.md:995`: "glauberman line 537, Theorem 4, line 601, Corollaries 7–8". glauberman line 537 is the head, 540 (a), 542 (b), 543 (c). |
| 1a/F03 (title in lower case) | repaired | `README.md:1`: "# Roadmap: modular characters and blocks, Part II — the Glauberman correspondence and heights of characters". |
| 1b/F02 (route of §2.1 in the source's ten letters) | repaired | `README.md:663–673`: route with `m = finrank F V`, `δ`, `k`; no symbol of glauberman lines 107–149 other than the forced ones. |

New text introduced by the repair, recomputed (all hold):

| Step | Instance | Values | Result |
|---|---|---|---|
| §2.1: `δ^{−k}` rescaling, `k m ≡ 1 (mod |A|)` | `SL(2,3)`: `m = 2`, `|A| = 3`, `k = 2` | `det = δ · δ^{−4} = δ^{−3} = 1` | holds |
| §2.1: uniqueness | `h^m = 1 = h^{|A|}`, `gcd(m, |A|) = 1` | `h = 1` | holds |
| §3.2: coset sum through §3.1 | class of `a t` in `Γ ⋊ ⟨a⟩` has `|Γ|/|C_C(t)|` elements, `|C|/|C_C(t)|` of them in `a C` | ratio `|Γ : C|`; `|Γ| Σ m_λ² = |Γ|` | holds |
| §3.4: two unit complex numbers with `u − v = ±(1 − w)`, `w ≠ 1` | `(u, v) ∈ {(1, w), (−w, −1)}` for `+`, `{(w, 1), (−1, −w)}` for `−` | `u v = w` in all four; one of `u, v` is `±1` | "product is `ξ`", "one factor squares to `1`" hold (at a generator, hence on `A`) |
| §3.4 (b): `[χ|_C, λ] = ε' + |A : B| [Δ, λ] ≥ 0` | `ε' = 1`: `[Δ, λ] ≥ −1/|A : B| > −1` | `[Δ, λ] ≥ 0` | holds |
| §3.4 (b): kernel case | `χ̂(a) = θ₀(a) χ(1)` ⇒ `ρ̂(inr a)` scalar ⇒ `(a • g) g⁻¹ ∈ ker χ`; §1.2 with `H = ker χ`, `A` cyclic | `Γ = C · ker χ`; `C₂` inverting `C₅` in `C₃ × C₅`: `C₃ · C₅` | holds |
| CharacterTheory §4.1 (new supplier input) | on main, `TauCetiRoadmap/RepresentationTheory/CharacterTheory/README.md:715–722` | diagonalisability, single-eigenvalue adapter, equality case of the triangle inequality | exists as cited |

## The pass: declarations of `Suggested.lean`

No `variable` or `include` block: every binder is in its own signature. The elaborated types of the
worker's signature file were compared with the README statements, with no difference.

| Declaration (README §) | Context checked | Instances tried, values on each side | Result |
|---|---|---|---|
| `invariantIrreducibleCharacters` (1.1) | `[Group S] [Group Γ] [MulDistribMulAction S Γ]` | `C₃` on `C₇`, `r ↦ r²`: `s⁻¹ • r = r⁴`, only `1` invariant; `C₃` on `Q₈`: `{1, χ₂}`; `S = 1`: `Irr(Γ)` | holds |
| `existsUnique_canonicalExtension` (2.2) | finite, `hcop`; no solvability | `S = 1`: `ψ = χ`; `Γ = 1`: `ψ = 1`; `SL(2,3)`: twists have `det = λ² ≠ 1`; `S₃`: `1`, not `sgn` (`det = −1`); order-coprime ⇔ trivial on `S` (quotient by the normal closure of `S` has order dividing `|Γ|`) | holds |
| `canonicalExtension_values` (2.3) | `hψ`, `hψχ`, `hdet` tie `ψ` to `χ` | `SL(2,3)`: `2, −2, 0, −1, 1`; `χ̂ ω`: `−ω ∉ ℤ`; trivial `C₂` on `C₃`: `ℚ(ζ₃)` both sides | holds |
| `gallagher_bijOn` (2.4) | `N.Normal`, `hηθ` | `N = G`: `{θ}`; `N = 1`, `G = C₂`, `η = sgn`: swap; `Z(Q₈)`: no `η`, `1` against `4` | holds |
| `ncard_invariantIrreducibleCharacters` (4.4) | `[Group.IsSolvable S]`, `hcop` | `SL(2,3)`: `2 = 2 = 2`; `3^{1+2}_+ ⋊ C₂` (`(x,y,z) ↦ (−x,−y,z)` preserves `z + z' + x y'`): `3 = 3 = 3`; `C₂` on `S₃`: `3 ≠ 2`, excluded by `hcop` | holds |
| `existsUnique_restrict_pairing_not_dvd` (4.5) | `IsPGroup p S`, `hcop` | `S = 1`: `m = 1`; `SL(2,3)`: `2 ≡ −1 (3)`, `0`; `3^{1+2}_+`: `3 ≡ 1 (2)`; swap on `C₂²`: two candidates, excluded by `hcop`; `m = 0` excluded by `p ∣ 0` | holds |
| `IsGlaubermanFamily` (4.5) | `π` over `Type u`, `Type v`; `↥T, S ⧸ T : Type v`, `C_Γ(T) : Type u` | `T = ⊥`: `π(Γ,1)χ = χ` by the `p`-group law at the trivial group; `T = S`: `π(C,1) = id`; wrong model `1 ↔ sgn` on `Q₈`: `[χ₂|_C, 1] = 0`, excluded by law 2 | determines `π` on `Irr_S(Γ)` |
| `exists_isGlaubermanFamily`, `.apply_eq` (4.5) | both families at `.{u, v}` | `C₁₅` on `Q₈ × C₁₁`: both series give `sgn ↦ χ₂ × 1`; uniqueness through `T` of prime index: every `y ∈ C_Γ(S)` has an `x` since `C_{C_Γ(T)}(S/T) = C_Γ(S)` | holds |
| `.restrict_pairing_ne_zero`, `.adjoin_range_eq` (4.6) | solvable, `hcop` | `SL(2,3)`: `2 ≠ 0`, `ℚ = ℚ`; swap on `C₃²`: `ψ_a × ψ_a ↦ ψ_{2a}`, pairing `1`, `ℚ(ζ₃)` both sides | holds |
| `.exists_sign_of_isCyclic` (4.5) | `ha` makes `S` cyclic, hence solvable for `hπ` | `SL(2,3)`: `χ̂(a) = −1`, `χ̂(−a) = 1`, `ε = −1`; `S = 1`: `ε = 1`; `inr a · inl t = inl t · inr a` for `t ∈ C` | holds |
| `.index_mul_degree_eq` (5.1) | solvable, `hcop` | `4 · 1 = 2 · 2`; `9 · 1 = 3 · 3`; `θ = 1`, `C ≠ Γ`: `q = |Γ : C|` | holds |
| `IsBlockDefectGroup` (Conventions) | `e ∈ k[G]`, any field | `S₃`, `p = 2`: `1 + r + r²` ↦ `⟨t⟩`, `r + r²` ↦ `1`; `S₄`, `p = 3`, `χ₃`: `3/8, 1/8, −1/8, 0, −1/8 ↦ 0, 2, 1, 0, 1`, control `2·2 − 1 − 2 = 1`, defect group `1` | equals base `IsDefectGroup` (truncation to `C_G(P)`) |
| `blockCharacters` (Conventions) | `[IsDomain O]`, `K = FractionRing O` | `(1 + r + r²)/3`: `{1, sgn}` (`1 + ζ₃ + ζ₃² = 0` on `std`); `b = 0`: `∅`; `ℤ₂[C₃]`: one character `2, −1, −1` | holds |
| `brauer_height` (6.2) | complete DVR, `CharZero`, `hζ`, `CharP` residue | `S₃`, `p = 2`: `1, 1` and `2`; `A₅`: `1, 3, 3, 5`; `C₃` over `ℤ₂`: degree `2`, `ν = 1 ≠ 0`, excluded by `hζ`; `a − d` never truncates | holds |
| `fongReynolds`, `existsUnique_fongReynolds` (7.4) | `hT` is the idempotent stabiliser; `hBb`, `hB'b` covering | `S₃ ⊵ C₃`, `p = 2`: `{λ} ↦ {std}`; `p = 3`: `T = S₃`; `S₄ ⊵ V₄`, `p = 3`: `T = D₈`, two blocks to the two degree-`3` characters; uniqueness from injectivity of `B ↦ B^G` and `Irr(B) ≠ ∅` | holds |
| `reynolds_heights` (8.3) | `[D.Normal]`, `hD` | `SL(2,3)`, `p = 2`: `{0, 1} = {ν(1), ν(2)}`; `A₄`: `{0}`; `D = 1`: `{0}`; `ν(n) ≥ a − d` | holds (given the declared gap) |
| `reynolds` (8.4) | as above | `D₈`: height `1`, nonabelian; `A₄`: all `0`, `V₄` abelian; defect zero: true ↔ true | holds |

## The pass: README targets (values recomputed in this pass)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §1.2 route (stabiliser, two complements) | `A₅` on `𝔽₇⁵`; swap on `C₂²` | `5 · 3 ≡ 1 (7)`, constant vector `3c`; coset `{(1,0),(0,1)}` has no fixed point | holds with coprimality and one side solvable | none |
| §1.3 | `C₂²` on `𝔽₂³` | fixed vectors `2`, fixed characters `4`; per element `4 = 4`; orbits `(8+4+4+4)/4 = 5` | holds | none |
| §2.1 Check, `Q₈`, `A = C₂` | `(c ρ(i))² = −c² = 1` | `c = ±√−1`, `det = c² = −1` | holds | none |
| §3.1 | `D₈ = C₄ ⋊ C₂`; `(a t)^{k|Γ|}` | classes `{a, a x²}`, `{a x, a x³}`; `= a` | holds | none |
| §3.4 statement | `A = C₄` | `ε(χ) = −ε'` possible | remark incomplete | S02 |
| §4.1 Check, `C₁₅` on `Q₈ × C₁₁` | powers of `3` mod `11` | `3, 9, 5, 4, 1`; `C_Γ(C₃) = {±1} × C₁₁` | holds | none |
| §4.2 route | `D₈` on `C₃²`, series with a non-normal `S₂` | `C_Γ(S₂) = C₃ × 1` not `S`-stable | route fails as written; statement holds | S01 |
| §4.5 uniqueness | induction through `T` of prime index | base `S = 1`: `m ≠ 0` forces `π χ = χ` | holds | none |
| §4.6 Checks | swap on `C₃²`, `α` = inversion, `j = 2` | `ψ_{−2a} = ψ_{2a} ∘ α⁻¹`; `ψ_{4a} = ψ_a` | holds | none |
| §5.1 route | `S ⊵ T` of prime index | `θ(1) ∣ |Γ : C_T| π_T θ(1)`, `π_T θ(1) ∣ |C_T : C| θ*(1)` | holds | none |
| §6.1 Checks | `S₃`, `p = 2` | `B₀`: `1/3, 1/3, 0`; defect zero: `2/3 ≡ 0`, `−1/3 ≡ 1`, `λ = −1`; Osima `2/6 = 1/3` | holds | none |
| §6.2 route | `|𝒞| χ(x)/χ(1)` unit; `Φ_φ(1)/|G| ∈ O` | `ν(|𝒞|) ≤ ν(χ(1)) ≤ ν(|𝒞|)` | holds | none |
| §6.3 levels | `SL(2,3)`, `A₅` | `exp = 12`, `ℚ₂(ζ₁₂)`, `𝔽₄`; order of `2` mod `15` is `4`, `𝔽₁₆` | holds | none |
| §6.3 last Check | `𝔽₄[C₃]` | `(1 + α² r + α r²) + (1 + α r + α² r²) = r + r²` | holds | none |
| §7.1 | `S₃`, `p = 2, 3` | `λ_{B₀}(t) = 3 ≡ 1`; `p = 3`: `3 ≡ 0`, `2 ≢ 0` | holds | none |
| §7.2 | `S₃`, `C₃` | `ω_std = 2 · (−1)/2 = −1 = λ(r) + λ(r²)` | holds | none |
| §7.3 trace transfer | fibre of `G/D → G/DN` | `|DN : D| = |N : N ∩ D|`; `S₃ × C₂`: `π = 1, 0`, `D N/N = C₂` | holds | none |
| §7.4 heights | `a_G = a_T + ν(|G : T|)` | `h(ψ^G) = ν(ψ(1)) − (a_T − d) = h(ψ)` | holds | none |
| §7.5 Fong | `N = 1` | `p ∤ |G : P|` only for maximal defect: the hypothesis is present | holds | none |
| §8.3 | `p ∤ |T : N|`, `G = T` case | `B` the only block over `b`, so every `θ_ξ` lies under `Irr(B)` | holds | none |
| §9 Checks | `S₄`, `p = 2`; `SL(2,3)`, `p = 3` | heights `0, 0, 1, 0, 0`; `3 = 3`, `3 = 3` | holds | none |
| Conventions | `−ζ₃²`; `S₄` control | `e^{iπ/3}`, a primitive sixth root; `0·1 + 2·2 + 1·(−1) + 1·(−2) = 1` | holds | none |

## Verified sound

- **Counts.** Declarations read: 20 of 20 (4 `def`, 16 `theorem`). Targets read: 35 of 35
  (§§1.1–9.2), with Conventions and the supplier contracts. Locators opened in the cached texts in
  this pass: 55 (glauberman 16, martinez 20, sambale 6, reynolds 4, hartley-turull 5, geck 2,
  spath-vallejo 2), none wrong. Checks recomputed: those of the two tables above (about 60
  bullets); none false or vacuous; every definition has at least three. Sibling and supplier
  citations resolved: 5 roadmaps (below).
- **Policy and form.** `git diff --stat origin/main...HEAD` changes only
  `packages/ModularCharactersAndBlocksPartII/` (8 files). No `set_option`, `lemma`, `#eval`,
  sorry'd data, `True` placeholder, pull-request number or process word in the README or the
  docstrings (grep). Imports: `import Mathlib` and three `TauCeti.*` modules, each present at the
  pin and used. The leading `module` line matches the files on main.
- **Headlines and padding.** The 16 end theorems of `README.md:24–34` are the 16 theorems of
  `Suggested.lean`. The docstring names the three cited-not-proved propositions (§5.2, §§9.1–9.2).
  One-tactic probe: none restates a definition, follows from one pinned lemma, mirrors a Check or
  treats a boundary case; `reynolds` needs `reynolds_heights` plus the linear-characters
  criterion, and the second conjunct of `ncard_invariantIrreducibleCharacters` is independent of
  `exists_isGlaubermanFamily`.
- **Dependency check.** Output of the brief's `gate --depcheck` command:
  `depcheck: 246 roadmaps, 2245 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Suppliers, resolved now.**
  - ModularCharactersAndBlocks, open head
    (`TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`): Conventions, §§6.2, 7.1,
    7.2, 8.1, 8.2 read in full and found as the contract describes them (`b^G` defined "when such
    `B` exists" and proved defined when `C_G(D_b) ≤ H`; the Brauer-projection first main theorem
    over a splitting field; the second main theorem at the system of §1.1; domination for normal
    `p`-subgroups only; covering by orbit sums). It states no height, Osima formula, Min–Max
    theorem, domination for general `N`, Fong–Reynolds or Reynolds theorem (grep). Its
    `IsDefectGroup` takes `e` in the centre and uses `brauerProjection`; `IsBlockDefectGroup` here
    is the same condition on coefficients, in a different namespace.
  - InverseGaloisAndArithmeticFundamentalGroups, open head, earlier in the merge order: the
    target *Conjugacy of coprime complements* lies in IG.3.4 with the quoted hypotheses.
  - CharacterTheory on main: §§2.1, 3.5, 3.6, 4.1, 4.3, 4.4, 4.5 exist with the cited content.
  - InductionRestriction on main: Layer 7 is "projective representations, factor sets, and the
    Schur multiplier" and states no degree divisibility.
  - FiniteGroupExtensionSplitting on main leaves the conjugacy of coprime complements to another
    roadmap, so main has no earlier owner than IG.3.4.
- **Declared gap** `gap:clifford-multiplicity-dvd-index`: same slug in `design/plan.json` and in
  the README; precise; not provided at the pins (`FDRep.clifford_restrict_dvd_finrank` gives
  `dim V ∣ dim W` and the inertia index only; no other divisibility lemma under
  `TauCeti/RepresentationTheory/Induction/`).
- **Ownership.** `roadmaps grep` over main and the open heads: no other roadmap states the
  Glauberman correspondence, Gallagher's correspondence, Osima's formula, the Fong–Reynolds
  correspondence or heights of characters; FiniteGroupInvariants §6.2 has the Galois-orbit form of
  the permutation lemma, named here as not owned. The pinned Mathlib and Tau Ceti have none of
  these objects (grep for Gallagher, Glauberman, defect group). Ownership was checked against the
  open pull requests whose files the brief lists.
- **Pinned definitions relied on.** `TauCeti.irreducibleCharacters` is
  `{f | ∃ n ρ, ρ.IsIrreducible ∧ ρ.character = f}` on `Fin n → k`; `Subgroup.indClassFun` sums over
  `Quotient.out` representatives and depends on them off class functions (the headlines apply it
  to characters only); `TauCeti.IsPrimitiveIdempotent` has the three fields the README lists;
  `SemidirectProduct.inl_aut` reads `inl (φ g n) = inr g * inl n * inr g⁻¹`.
- **Narrowing, not raised.** §1.2 assumes `S` or `Γ` solvable where glauberman line 287 has every
  coprime action; the unrestricted form needs the odd order theorem, whose roadmap is later in the
  merge order, and no target here uses it.
- **Outside this pass's files.** `design/plan.json` still has "line 543" in the `where` fields of
  the targets of §4.3 and §4.5 (the README has 542 and 537).

## Not verifiable

- Locators into `isaacs`, `isaacs-1973`, `navarro-1998`, `navarro-2018` and `feit`: uncertified,
  cited by locator only. Two could not be confirmed from memory either: "navarro-1998, Chapter 3"
  for the equality `|D| = p^{d(B)}` of §6.2 (defect groups enter that book in its Chapter 4), and
  "navarro-1998, Theorem 5.9" for §8.1 (taken from martinez line 2013).
- Whether the theorem numbers of the arXiv texts of `kessar-malle`, `mnst`, `ruhstorfer` agree
  with the Annals versions the References name.
- Elaboration: no Lean was run; the comparison used the worker's elaborated signatures.

## Copyright, licences and scope

**Wording.** Set beside the sources in this pass: §3.3 (glauberman lines 370–374), §3.4 statement
and route (lines 375–400), §4.1 (lines 503–526), §§4.2–4.3 (lines 537–543), §4.4 (lines 601–628),
§4.6 and §5.1 (lines 636–644); §6.3 (martinez lines 719–726), §7.1 (lines 710–713), §7.4 (lines
1823–1834), §7.5 (lines 2222–2224, 2265–2296), §8.4 (lines 2328–2348); §8.3 (reynolds lines
531–540); §7.6 bullet (sambale lines 499–502); §2.2 (hartley-turull lines 304–305); §5.2 (geck
lines 29–36). No run of words is shared beyond formulas and standard names; the roadmap's letters
(`Γ`, `S`, `C`, `χ̂`, `ξ`) differ from the sources'.

**Arrangement.** `martinez` has the largest share. Layer 6 draws on its §§2.1, 3.1, 3.2; Layer 7
on §3.1, Lemma 4.4 and Lectures 7–9 in another order; Layer 8 on §§8.2, 9.3; Layer 9 on §9.3. No
layer maps onto one lecture. Layers 2, 3, 4 share their order with glauberman §§2, 3, 4 (lines 98,
265, 480); the `*Needs:*` lines force it (§3.2 needs §§2.2–2.4; §4.1 needs §3.2), and the scopes
differ (Lemma 3 and the permutation lemma are in Layer 1, Theorem 5 (e) in Layer 5, the uniqueness
law of §4.5 is not in that paper).

**Reuse.** No table, figure, exercise list or numerical data is taken over. No declaration matches
a public formalisation known to me.

Source independence: 16 passages compared with 6 sources (glauberman, martinez, reynolds, sambale, hartley-turull, geck), none shared; largest share martinez, 38 of 85 keyed line locators; contents compared with martinez: independent.

## Source issues

- **Gap** in glauberman at Theorem 4 (a), proof, printed p. 1478 (line 546): the source says the induction hypothesis applies to the character on the fixed points of the last nontrivial term of the series; it should induct through the first term, which is normal, since the last need not be; affects the proof.
- **Misprint** in martinez at §3.2, printed p. 18 (line 725): the source says height zero characters are those whose degree `p`-part equals the numerical defect; it should be those whose degree `p`-part equals `p^{a−d(B)}`; affects nothing.
- **Misprint** in martinez at §3.2, printed p. 18 (line 722): the source says the height is defined for every character in `Irr(G)`; it should be for every character in `Irr(B)`; affects nothing.
- **Misprint** in martinez at Theorem 9.8, proof, printed p. 61 (line 2337): the source says the heights in `B` coincide with the set of characters in `b`; it should be the set of heights of characters in `b`; affects nothing.
- **Gap** in martinez at Proposition 8.9, printed p. 54 (line 2003): the source says the proof of this refinement of Theorem 8.5 is omitted; it should be proved or cited, as the proof of Theorem 8.11 uses it; affects the proof.

## For the human reviewers

- **Licence.** `martinez`, the source with the largest share (38 of 85 keyed line locators), is
  unpublished course notes read from the author's page (`sources.toml`,
  `licence_class = "author-page"`); the main block results also carry refereed locators
  (`reynolds`, `sambale`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0234184c47a7849a00a0e15c6e96bb2e1001dcf1", "job": "RT-ModularCharactersAndBlocksPartII~2b", "model": "fable", "worker": "chris-x52"} -->
