# FIX-DESIGN-VirtualFundamentalClassPartII~15

Findings of REV-DESIGN-VirtualFundamentalClassPartII~14: two, both P3.

## F01 (P3) — applied

Changed: 8.4 "Let `B` be a smooth connected separated curve over `k`" → "a smooth connected curve over `k`,
separated or not: a connected `k`-scheme of finite type, smooth of dimension one, hence a stack of
Convention 1". The route gains one sentence saying where separatedness would have entered. Two Checks
are added: the `L` witness and connectedness. The plan's 8.4 `statement`, `hypotheses` and `tests` are
changed to match.

**Verification.** The finding is right. I went through each step of 8.4's route with `B` not separated:

- **The immersion.** `i_b : {b} → B` is a closed point of a regular scheme, so it is a regular immersion
  of codimension one. Its flat base change `η_b` along `𝔐 × B → B` is one too.
- **8.2.** The base `𝔐 × B` is an algebraic stack of Convention 7: locally of finite type, quasi-separated
  (`B` is locally Noetherian), and of pure dimension `m + 1`. 8.2 asks no separatedness of its base.
- **4.1.** `B` is a scheme of finite type whose diagonal is a quasi-compact immersion. So it is a stack
  of Convention 1, which explicitly allows `L` ("the line `L` with a doubled origin is a stack that is
  not separated"). 4.1 pushes forward along every proper morphism of such stacks, and `X → B` is proper.
- **The class on `B`.** `A_1(B) = ℤ·[B]` because `B` is integral of dimension one: a connected normal
  locally Noetherian scheme is integral.
- **4.2.** 4.2 takes a regular local immersion of algebraic stacks locally of finite type. Its
  flat-base-change bullet (`η_b^! = i_b^!`) and its commutation with proper pushforward need no
  separatedness. `i_b^![B] = [{b}]` is its fourth API bullet, since `B` is equidimensional.
- **5.4.** The degree is taken on `X_b`, which is proper over `κ(b)` by base change.

li-tian1998 Theorem 4.2 (line 1472) assumes an irreducible smooth curve. The README's statement is
more general and is proved by the route above, which cites the source for the conservation-of-number
reduction only.

**The added Checks, computed.**

- *The witness.* `B = L`, `X = Z(x² − t·y²) ⊆ ℙ¹ × L` with `char k ≠ 2`, `E = L_{X/L}` of rank `0`.
  - `X → L` is finite and flat of degree `2`.
  - Over `0₁` and over `0₂` the fibre is `Spec k[x]/(x²)`, an lci of length `2`, whose class with its
    cotangent complex is `2·[pt]` (VirtualFundamentalClass §7.6).
  - Over a closed point with `t ≠ 0` the fibre is finite étale of degree `2`.
  - In the route: `n = 2` and `i_{0_j}^!(2·[L]) = 2·[0_j]`.
- *Connectedness.* `B = 𝔸¹ ⊔ 𝔸¹` with `X` the first copy and `E = L_{X/B} = 0` gives counts `1` and `0`.

**Departure from the proposed wording.** "Curve" is spelled out as "a connected `k`-scheme of finite
type, smooth of dimension one". The route needs `B` to be a stack of Convention 1, which is of finite
type, so that `A_1(B)_ℚ` and 4.1's pushforward to `B` exist. The line with infinitely many origins
(not quasi-compact) is excluded. The Stacks Project's "curve" is separated, so the bare word would
have been ambiguous.

**Same pattern.** I checked every remaining separatedness hypothesis in the README. Each is used:

- 1.3: Vistoli's degree is defined for separated dominant morphisms. Its Check on `L → 𝔸¹` shows what
  goes wrong otherwise.
- 5.1: Poincaré duality needs a separated `T`. Its Check on `t : L → 𝔸¹` shows this.
- 5.4: properness, hence separatedness, is what makes the degree exist.
- 5.2: the separated stack with a Keel–Mori coarse space is an example clause, not a hypothesis.
- 6.2: "when `X` is separated" is the agreement with VirtualFundamentalClass.

8.4 was the only unused instance, as the review says.

## F02 (P3) — applied

Changed:

- 9.5 "For `X` projective of pure dimension, as in AlgebraicGromovWittenTheory §4.3," → "For `X` proper
  of pure dimension (projective in AlgebraicGromovWittenTheory §4.3)". It now also says why `F_t` is
  proper and that the degree is taken on the proper `X_{κ(t)}`.
- 9.1 "stated for projective `X`" → "stated for proper `X`".
- The plan's 9.5 `statement` is changed to match.
- A negative-control Check is added: `ℙ¹ × 𝔸¹`.

**Verification.** The finding is right. Each step of the curve-class sentence was checked:

- **`F_t` is proper.** `C_t` is proper over `κ(t)` and `X` is separated.
- **`β` exists.** `β = F_{t*}[C_t]` is the proper pushforward of SchemeAndStackFoundations §5.2. Its
  layer conventions (read on main) are "schemes locally of finite type over one fixed field" and
  "degrees of zero-cycles are taken on proper schemes only".
- **The degree on `X`.** §5.2 defines `deg : CH_0(X) → ℤ` for `X` proper over `k`.
- **The projection formula.** §5.3 `proper_pushforward` gives
  `f_*(c_1(f^*L) ∩ α) = c_1(L) ∩ f_*α` for proper `f`.
- **The degree on `C_t`.** §5.3 `c1_degree_curve` gives it on the proper curve `C_t`.

No ample sheaf enters. AlgebraicGromovWittenTheory §4.3 (read at its open head) works with projective
`X`, since it states "independence from the projective embedding". So the parenthesis names it as the
projective case. The phrase "that of AlgebraicGromovWittenTheory §4.3" becomes "the formula of …",
because for a proper non-projective `X` that roadmap builds no class.

**The added Check, computed.** It shows the hypothesis cannot be weakened further, from proper to
separated:

- `X = ℙ¹ × 𝔸¹` and `F` the inclusion of `ℙ¹ × 0`. `F` is proper.
- `F^*T_X = O(2) ⊕ O`, so `δ = 2` and `ℓ = 2`.
- The virtual dimension is `0 + 2 + 2 = 4`. This is `dim(PGL₂ × 𝔸¹)`, with `H¹ = 0`.
- But `β = [ℙ¹ × 0] = div(t) = 0`, and `A_0(X) ≅ A_{−1}(ℙ¹) = 0` by homotopy invariance. So no degree on
  `A_0(X)` recovers `δ = 2`.

The 9.5 sentence on targets that are not separated now also covers separated non-proper targets.

**Not added.** The review's positive witness (a fibre of Hironaka's threefold) is not made a Check. It
would need a source for the construction that the manifest lacks. It tests nothing that the proof
above does not already show: no step uses an ample sheaf.

**Same pattern.** I checked every other "projective" in the README. Each is a hypothesis its source uses:

- 9.1, the existence of `Mor_𝔅(𝒞, X)`: behrend1997 lines 129–138.
- 9.1's second API bullet: the Hilbert scheme of SchemeAndStackFoundations §4.14.
- 9.2: behrend-fantechi1997's product family over a projective `C`.
- Layer 9 Examples: behrend-fantechi1997 Proposition 6.2.
- Downstream consumers: AlgebraicGromovWittenTheory's own case.
- 5.3: Edidin–Graham's quasi-projective `X`.
- 1.1: rydh2015.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 8.4, `B` separated or not | `B = L`, `Z(x² − t·y²)` | counts `2` at `0₁`, `2` at `0₂`, `2` at `t ≠ 0`; `(X → L)_*[X]^vir = 2·[L]`, `i_{0_j}^!(2·[L]) = 2·[0_j]` | holds without separatedness | hypothesis dropped; Check added |
| 8.4, connectedness | `B = 𝔸¹ ⊔ 𝔸¹`, `X` the first copy, `E = 0` | counts `1` and `0` | hypothesis needed | Check added |
| 8.4, finite type of `B` | line with ℕ origins | not quasi-compact, so not a stack of Convention 1; `A_1(B)` and 4.1 to `B` undefined | finite type needed by the route | stated |
| 8.4, empty and degenerate | `X = ∅`; `X = B = 𝔸¹`, `E = 0` | `0` everywhere; `1` everywhere | holds | none |
| 8.4, existing Checks recomputed | `x² − b y²` over `𝔸¹`; `{xb = 1}`; `ℙ¹ × B`, `E = Ω` | `2, 2, 2`; `1` vs `0`; `m + r = 1`, no degree | unchanged by the edit | none |
| 9.5, curve class for proper `X` | Hironaka fibre `ℓ` | `F^*T_X = O(2) ⊕ O ⊕ O(−1)`, `δ = 1 = −K_X·ℓ`; `χ = 4 = 0 + 1 + 3` | holds; no ampleness used | hypothesis weakened |
| 9.5, separated non-proper `X` | `ℙ¹ × 𝔸¹`, `F = ℙ¹ × 0` | `δ = 2`, `β = div(t) = 0`, `A_0(X) = 0`, vdim `4 = dim PGL₂ × 𝔸¹` | the formula fails; properness needed | negative-control Check added |
| 9.5, projective case | `ℙ^r`, degree `d`, `g = 0` | `δ = (r + 1)d = c_1(O(r + 1))·d`; vdim `(r + 1)d + r + n − 3` | holds | none |
| 9.5, point and non-pure targets | `X = Spec k`; `X = Spec k ⊔ ℙ¹`, `F` constant | `β = 0`, `δ = 0`; `β = 0`, `δ = 0`, `ℓ = 0` | holds | none |
| 9.5, non-separated target | `P = ℙ¹` with a doubled point, chart inclusion | `F` not proper, no `β`; `δ = 2`, vdim `3` | covered by "not separated" | none |

## Checks

- **Dependency check** (`gate --only VirtualFundamentalClassPartII`), output:

      candidate: VirtualFundamentalClassPartII is not in the merge order yet; checked as if placed after StableReductionPartII (the intake inserts it when its design is accepted)
      depcheck: 239 roadmaps, 2253 edges, 0 problem(s)

  There is no UPWARD and no CYCLE line.
- **Citation resolver** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name
  found nowhere. The one cross-roadmap citation the edit adds, VirtualFundamentalClass §7.6 in 8.4's new
  Check, was read at its head ("gives the ordinary fundamental class" for a pure-dimensional local
  complete intersection). It is already in the supplier contract (§§7.1–7.7) and was already cited by a
  Check of 6.3.
- **`Suggested.lean`.** This is a design: the package has no `Suggested.lean`, so no `#check` comparison
  was run and no Lean name changed. The edits add no backticked Lean name. `plan.json` parses as JSON
  and changed only in the 8.4 and 9.5 entries.
- **Gate failures listed in the brief:** none.

## Ownership, sources and notes for the maintainer

- **Ownership.** No construction, target or supplier edge is added, so no ownership question arises.
  The edits only weaken two hypotheses and add Checks. No section number or target id changed.
- **Sources.** No source was fetched, the manifest is unchanged, and no `needs-references.toml` was
  written.
- **Consequences for other roadmaps.** AlgebraicGromovWittenTheory (a consumer) cites 8.4 and 9.5.
  Both now hold under weaker hypotheses, so nothing it relies on changes.
- **Untrusted text.** The review contained no instruction outside its findings.
