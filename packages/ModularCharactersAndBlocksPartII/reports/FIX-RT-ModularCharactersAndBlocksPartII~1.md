# FIX-RT-ModularCharactersAndBlocksPartII~1

Repair of red-team round 1 (passes a and b) of ModularCharactersAndBlocksPartII. Five P3 findings,
two of which overlap (1a/F01 and 1b/F01). All were verified against the cached sources and the
roadmap's own text, and all are applied. Only `packages/ModularCharactersAndBlocksPartII/README.md`
changed; `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged.

## RT-ModularCharactersAndBlocksPartII~1a/F01, RT-ModularCharactersAndBlocksPartII~1b/F01 (P3) — applied

§3.2: "Lemma 2 turns the norm identity" → "§3.1, which makes the sum over `a Γ` equal to
`|Γ : C|` times the sum over `a C`, turns …" (`c(λ)` → `m_λ`). §3.4: "as in the source, from
Lemma 2 … Lemma 3 (c)" → own route through §§1.2, 3.1–3.3, CharacterTheory §§3.6, 4.1; *Needs:*
gains §§2.2, 3.3, CharacterTheory §4.1. §4.3: "as in the source, by induction" → "induction".

## RT-ModularCharactersAndBlocksPartII~1a/F02 (P3) — applied

§4.3: "(glauberman line 543, Theorem 4 (b), (c))" → "line 542". §4.5: "(glauberman line 543,
Theorem 4, …" → "line 537". Verified in the cached text: 537 is the head of Theorem 4, 540 (a),
542 (b), 543 (c).

## RT-ModularCharactersAndBlocksPartII~1a/F03 (P3) — applied

Title "…, part ii — the glauberman correspondence …" → "…, Part II — the Glauberman correspondence
…", matching the `Suggested.lean` docstring, the README Summary's "Part II" and the capitalised
proper names of the titles on main.

## RT-ModularCharactersAndBlocksPartII~1b/F02 (P3) — applied

The §2.1 route used glauberman's ten letters (`S`, `c`, `d`, `e`, `r`, `n`, `i`, `j`, `f`, `h`,
lines 107–149) in its step order. It is replaced by the same argument in the roadmap's own words and
letters (`m = finrank F V`, `δ`, `k`): scalar cocycle, the two coboundary powers, coprimality,
rescaling by `δ^{−k}`, and uniqueness. The wording is my own, not the reviewer's.

## Notes on the repairs

- 1a/F01 and 1b/F01. Both reviews say the existing *Needs:* lines already listed every input. That
  is not quite true for §3.4. Written out, the route uses three more inputs: §3.3, for the values
  `χ̂(a t) = ±λ_a(t)` at the non-generators `a ∉ B`; §2.2, for the determinant normalisation that
  makes `χ̂ ≠ χ̂ ξ`; and the criterion "`|χ(g)| = χ(1)` makes `ρ(g)` scalar", for the kernel
  statement. So §2.2, §3.3 and CharacterTheory §4.1 were added to the §3.4 *Needs:* line, and
  CharacterTheory §4.1 to the Layer 3 Dependencies and to the CharacterTheory supplier contract.
  I checked CharacterTheory §4.1 on main: it owns diagonalisability with root-of-unity eigenvalues,
  the adapter that a semisimple endomorphism over `ℂ` with one eigenvalue is scalar, and the
  equality case of the triangle inequality for unit complex numbers.
- 1a/F02. The other Theorem 4 locators were already correct: §§4.2 and 4.5 at line 540 (a), the
  References at line 537, and `sources.toml` at line 537 with the proof of (b) at line 562.
- 1b/F02. The new route was checked step by step against glauberman lines 107–151, including the
  determinant `δ^{1 − k m} = 1` and the order of the scalar homomorphism, which divides both `m`
  and `|A|`.

## Pattern search

- "as in the source", and lemma numbers used without a source key: after the edits, none remain in
  the README. All remaining "Lemma/Theorem/Corollary N" occurrences are locators attached to a source
  key, or describe a supplier's citation.
- Routes that use a source's lettering: the §3.2 coefficient `c(λ)` was renamed. The new §3.4
  route uses `ξ` for the faithful character of `A/B` (the source uses `θ`) and does not number
  `θ₁`, `θ₂`. The block routes (§§7–8) were already found independent by pass b, and I left them
  as they are.
- Theorem 4 locators: every occurrence was checked (see F02).
- Not editable here: `design/plan.json` still records "Theorem 4 (b), (c), line 543" (target of
  §4.3) and "Theorem 4, line 543" (target of §4.5) in its per-target `where` fields. This job may
  edit only the plan's top-level `gaps` list, so the maintainer may want to correct those two
  fields to 542 and 537.

## Adversarial pass on the changed text

The statements are unchanged; only routes, one *Needs:* line, one Dependencies line, one supplier
contract clause, two locators and the title changed. Each new route step was instantiated.

| Statement / step | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.1: `m`-th power of the cocycle is a coboundary | general; `A = C₂`, `c(a,a) = −1` | `det T(a) det T(b) = c(a,b)^m det T(ab)` | holds | none |
| §2.1: `|A|`-th power is a coboundary (product over the last variable) | `A = C₂`, `c(a,a) = −1`, `E(x) = Π_g c(x,g)` | `E(1) = 1`, `E(a) = −1`; `c(a,a)² E(1) = 1 = E(a)²` | holds | none |
| §2.1: rescaling by `δ^{−k}`, `k m ≡ 1 (mod |A|)` | `SL(2,3)`: `m = 2`, `|A| = 3`, `k = 2`; `Γ = 1`, `V = ℚ`, `A = C₂`: `m = 1`, `k = 1` | `det(δ^{−2} T) = δ^{−4} δ = δ^{−3} = 1`; `det(δ^{−1} T) = 1` | holds | none |
| §2.1: route needs coprimality | `Q₈`, `A = C₂`: `m = 2`, `|A| = 2` | no `k` with `2k ≡ 1 (mod 2)`; matches the Check (no extension of determinant 1) | holds | none |
| §2.1: uniqueness | `SL(2,3)` | `h² = 1 = h³` gives `h = 1` | holds | none |
| §3.2: coset sum via §3.1 | `SL(2,3)`; `S₃ = C₃ ⋊ C₂` | `Σ_{g∈Q₈} |χ̂(ag)|² = 4 (1 + 1) = 8 = |Γ|`, `m_sgn = −1`, `Σ m_λ² = 1`; `S₃`: `3 · 1 = 3 = |Γ|`, `m_1 = 1` | holds | `c(λ)` → `m_λ` |
| §3.4: `χ̂ ξ ≠ χ̂`, norm 2 on `A × C` | `SL(2,3)`, `B = 1`, `ξ` faithful on `C₃` | det on `inr(A)`: `1` vs `ξ² ≠ 1`; restriction `ν = ξ × sgn − 1 × sgn`, `Σ |ν|² = 2 · 2 · |1 − ω|² = 12`, `12/6 = 2` | holds | none |
| §3.4 (a): product `ξ`, one factor of square 1 | `SL(2,3)`; `C₂` on `C₃ × C₅`, `χ = ψ × 1`; `3^{1+2}_+`, `C₂`; `Γ = 1` | factors `(ξ, 1)`: `θ₀ = 1`, `ε' = −1`, `χ̂(at) = −sgn(t)`; `(1, sgn)`: `θ₀ = 1`, `ε' = 1`; `(sgn, 1)`: both square to `1`, so `(ε', θ₀) = (1, sgn)` or `(−1, 1)`, both giving `χ̂(at) = −ω(t)`; `Γ = 1`: `(1, ξ)`, `ε' = 1` | holds; "at least one" (not "the one") is needed for `|A| = 2` | wording fixed to "at least one … such a factor" |
| §3.4 (b): `|A : B| Δ` and `[Δ, λ] ≥ 0` | `SL(2,3)`; `3^{1+2}_+` for both sign choices | `2 sgn + sgn = 3 sgn`, `Δ = sgn`, `[χ|_C, λ] = 2 = −1 + 3 · 1`; `(3ω − ω)/2 = ω`, `(3ω + ω)/2 = 2ω`, `3 = 1 + 2 · 1 = −1 + 2 · 2` | holds | none |
| §3.4 (b): kernel case via scalar `inr a` and §1.2 | `C₂` inverting `C₅` in `C₃ × C₅`, `χ = ψ × 1`; `Γ = 1`; `χ = 1` | `χ̂(a) = 1 = θ₀(a) χ(1)`, `a` trivial on `Γ/ker χ ≅ C₃`, `Γ = C₃ · C₅`; `Γ = 1 = C · ker χ`; `Γ = C · Γ` | holds; `ker χ` is `A`-invariant since `χ` is, and `A` is cyclic, so §1.2 applies | none |
| §3.4 Checks recomputed | the four Checks | `SL(2,3)`: `(2 sgn + sgn)/3 = sgn`; `χ = 1`: `ε' = 1`; `3^{1+2}_+`: `(3ω − ω)/2 = ω`; `C₃ × C₅`: `Γ = C₃ · C₅` | agree with the new route | none |
| §4.3 route | unchanged inputs | "as in the source" removed; §§4.2, 3.4 (b), 2.2, 3.2 still listed | holds | none |
| Theorem 4 locators | glauberman lines 537, 540, 542, 543 | head; (a); (b); (c) | §4.3 → 542, §4.5 → 537 | applied |

Context and generality: no Lean statement changed, so no binder or generality changed. The README
statements of §§2.1, 3.2, 3.4, 4.3 and 4.5 are word for word as before; only their routes and
locators changed.

## Checks run

- **Elaboration.** `lake env lean packages/ModularCharactersAndBlocksPartII/Suggested.lean`, run
  from the content checkout: 16 warnings "declaration uses `sorry`" (lines 61, 72, 87, 100, 113,
  155, 160, 170, 181, 194, 213, 249, 268, 293, 318, 334), no errors.
- **Signatures.** I put `#check @name` for all 20 declarations in one scratch copy and elaborated
  it once: 0 errors. `Suggested.lean` is unchanged and has no `variable` or `include` block, so
  every binder is in its own signature. The elaborated types agree with the README statements;
  nothing changed.
- **Dependency check.** Output of `gate --depcheck` (with `--movable`) on the final README:
  `depcheck: 246 roadmaps, 2245 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the final README: cross-roadmap citations found nowhere:
  none; Lean names found nowhere: none.

## For the maintainer

- No name that another roadmap cites changed. No Lean name changed. No section, layer or target was
  renumbered.
- New supplier input: CharacterTheory §4.1 (on main), for the kernel statement of §3.4. CharacterTheory
  was already a supplier, so no new dependency edge was added.
- Two `where` fields in `design/plan.json` still say line 543 (see the pattern search); I could not
  edit them in this job.
- No source was fetched and nothing was added to `needs-references.toml`. Every locator I used is in
  the cached glauberman text or already in the manifest.
- Ownership: the repairs introduce no new object, so ownership is unchanged.
- No suspicious instructions were found in the reviews or any other text read for this job.
