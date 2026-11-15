# FIX-PKG-IgusaVarietiesAndTorsionConcentrationPartII~6

This round repairs the one finding of REV-PKG-IgusaVarietiesAndTorsionConcentrationPartII~5. I checked it against the roadmap's own definitions (§8.4), the cited source passage and the supplier definitions, and it is correct.

Files changed:

- `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md` (§8.5 only)

`Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged. §8.5 has no Lean counterpart. No new source is cited, and no supplier gap is added or changed.

## F01 (P2) — applied

**Verification.** The finding is correct. In §8.4, `𝕋^S` is the restricted tensor product of the `ℤ`-valued spherical Hecke rings at `q ∈ Spl_{𝒦/ℚ} ∖ (S ∪ {ℓ})`. Its maximal ideals with finite residue field can have any residue characteristic, including the prime `q` below `v`. The Conventions use such ideals: torsion localization at an ideal not containing `ℓ` is zero, and §8.9's Checks localize at `𝔪_2` with `ℓ = 3`. The constant term of `P_v` is `(−1)^n q_v^{n(n−1)/2} T_{n,v}`. If `q ∈ 𝔪` and `n ≥ 2`, it vanishes modulo `𝔪`, so `0` is a root and `λ ↦ q_v^{n−1}λ⁻¹` is undefined.

I recomputed the reviewer's witness. The degree character of `GL_2(ℚ_5)` has `T_1 ↦ 6` and `T_2 ↦ 1`, and it is `ι`-invariant because `G(ℚ_q)` is unimodular. Modulo 5 both polynomials are `X² − X`, with roots `{0, 1}`. Item (2) only works in residue characteristic `ℓ`, because it takes its roots in `𝔽̄_ℓ`, but the API bullet and the coefficient calculation in the proof had no such hypothesis.

CS17's proof of Theorem 6.3.1 applies the dual-eigenvalue rule only to eigensystems in `𝔽_ℓ`-cohomology (CS17 line 4465, CS17 lines 4470–4478). So the source does not support the unrestricted bullet.

**What changed (old → new).** Item (2): roots "in `𝔽̄_ℓ`" → under `q ∉ 𝔪`, nonzero roots in an algebraic closure of `κ(𝔪)`, compared through the new `ῑ : κ(𝔪) ≅ κ(𝔪^∨)`. The `𝔽̄_ℓ` form is the case `ℓ ∈ 𝔪`. Item (3) uses `θ ∘ ῑ⁻¹`. Proof: the constant term is a unit. API bullet: same hypothesis. Three new Checks.

Details:

- *Kept unrestricted, as the review asks:* `ι` is a ring involution. For every finite-residue maximal ideal, `𝔪^∨` is maximal and `ῑ` is a field isomorphism. The formula `ι(T_{i,v}) = T_{n,v}⁻¹T_{n−i,v}` also stays general.
- *Item (2) and its proof:* The proof now says why the roots are nonzero. `λ_1⋯λ_n ≡ q_v^{n(n−1)/2}T_{n,v}` is a product of two units, `q_v` by hypothesis and `T_{n,v}` by §8.4. The coefficient calculation carries `P_v` mod `𝔪^∨` to `κ(𝔪)` by `ῑ⁻¹`, which replaces `T_{i,v}` by `ι(T_{i,v})`, and inverts `q_v` only under the hypothesis.
- *Item (4) proof:* It now says that the eigenvalues of `ρ_{𝔪^∨}` at `𝔭_i` are `q_v^{n−1}λ_j⁻¹`, with `q_v` a unit of `𝔽̄_ℓ` because `𝔭_i ∤ ℓ`.
- *New Checks:*
  - the degree character modulo 5, as a negative control (`q ∈ 𝔪_5`, roots `{0, 1}`, the rule fails);
  - the same character modulo 3 (`X² + 2`, `{1, 2} ↦ {2, 1}`);
  - an `n = 1` character into `𝔽_9` with values of order dividing 4. Here `𝔪^∨ = 𝔪` but `ῑ` is the Frobenius, so the root modulo `𝔪^∨` is `−a` through `ῑ⁻¹` and would be `a` through the identity. This Check pins the transport convention.

**Where I differ from the suggested repair.** The review suggests stating the general rule under `q_v ∉ 𝔪`. I state it under `q ∉ 𝔪`, which is equivalent because `q_v` is a power of `q` and `𝔪` is prime. I do not narrow the rule to ideals containing `ℓ`. It holds at every ideal with `q ∉ 𝔪`. For example, the degree character modulo 2 at `q = 5` gives `X² + 1 = (X + 1)²` with roots `{1, 1}`, and `5·1⁻¹ ≡ 1`. Requiring `ℓ ∈ 𝔪` would therefore be narrower than the truth, so it appears only as the `𝔽̄_ℓ` specialization.

**Same pattern elsewhere.** I searched the whole README for the reciprocal-root rule (`λ⁻¹`, `q_v^{n−1}`, `e_i(λ)`, "roots of `P_v`", `𝔪^∨`):

- The Layer 8 Examples paragraph (`q_v = 7`, `ℓ = 11`) and the Worked examples (`{1, 2} ↦ {7, 9}`) are in characteristic `ℓ = 11` with `q = 7 ≠ 11`, so they are valid and unchanged.
- §8.7 API (invariance under `𝔪 ↦ 𝔪^∨`) applies to residual representations into `GL_n(k)` with `char k = ℓ`, so it is unchanged.
- §11.4 assumes `RΓ(Ig^b, 𝔽_ℓ)_𝔪 ≠ 0`, so it applies the rule only to ideals containing `ℓ`. §§11.5–11.6 and the Layer 11 Examples (`ρ_{𝔪^∨} ≅ ρ_𝔪^∨ ⊗ ε̄^{1−n}`) also apply it only to such ideals, since they assume `H^*(S_K, 𝔽_ℓ)_𝔪 ≠ 0`. §11.5 already uses "a fixed embedding `𝕋^S/𝔪 ↪ 𝔽̄_ℓ`", which matches the new `θ`. None of these needs a change.
- The §8.4 API states the constant term of `P_v` in `𝕋^S[X]`, which is correct as stated.
- The parent IgusaVarietiesAndTorsionConcentration §5.1 states its eigenvalue rule only for Galois-type ideals, so it does not have the defect. IntegralHeckeAndGaloisDeterminants §3b.1 realizes Galois type over the residue field itself. That fits the transport through `θ ∘ ῑ⁻¹`.

### Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| `ῑ : κ(𝔪) → κ(𝔪^∨)` is a field isomorphism, every residue characteristic | `𝔪_5 = deg⁻¹(5ℤ)`; `q = 7, ℓ = 11` system; `n = 1` character into `𝔽_9` with `χ(T_{1,v}) = a`, `a² = −1` | `deg ∘ ι = deg` gives `𝔪_5^∨ = 𝔪_5`, `ῑ = id_{𝔽_5}`. `𝔽_11` is a prime field, so `ῑ = id` and `𝔪^∨ ≠ 𝔪`. For `𝔽_9`, `χ(ι(T)) = a⁻¹ = a³ = Frob(a)`, so `𝔪^∨ = 𝔪` and `ῑ = Frob ≠ id` | Holds; the `𝔽_9` row shows the transport is necessary and became a Check |
| (2), roots nonzero under `q ∉ 𝔪` | `e_2 = q_v T_{2,v}` at three ideals | `q = 7, ℓ = 11`, roots `{1, 2}`: `e_2 = 2`, `7·5 = 35 ≡ 2`. `𝔪_3`: `e_2 = 1·2 = 2`, `5·1 ≡ 2`. `𝔪_5` (excluded): `e_2 = 0 = 5·1 mod 5` | Nonzero exactly when `q ∉ 𝔪`; added to the proof |
| (2), rule `λ ↦ q_v^{n−1}λ⁻¹`, `n = 2` | `𝔪_5`; `𝔪_3`; `deg mod 2`; `q = 7, ℓ = 11`, `{1, 2}` and `{3, 6}`; over `ℚ` | `𝔪_5`: `X² − X`, roots `{0, 1}`, rule undefined at 0 and `1 ↦ 0`. `𝔪_3`: `X² + 2`, `{1, 2} ↦ {2·1, 2·2} = {2, 1}`. Mod 2: `X² + 1`, `{1, 1} ↦ {1, 1}`. Dual polynomial `X² − 5X + 8`: `49 − 35 + 8 = 22 ≡ 0`, `81 − 45 + 8 = 44 ≡ 0`, roots `{7, 9}`. `{3, 6} ↦ {28, 14} ≡ {6, 3}`. Over `ℚ`, `{1, 5} ↦ {5, 1}` | Fails only when `q ∈ 𝔪`; hypothesis `q ∉ 𝔪` added; negative control added |
| (2), `n = 1`, no hypothesis | `q ∈ 𝔪` allowed; `𝔽_9` character | Root `T_{1,v}` (a unit) `↦ T_{1,v}⁻¹`, exponent `n − 1 = 0`. `𝔽_9`: `a ↦ a⁻¹ = −a`, and reading through the identity would give `a` | Exemption stated |
| Coefficient exponent `i(i−1)/2 + n(n−1)/2 − (n−i)(n−i−1)/2 = i(n−1)` | `n = 2`, `i = 0, 1, 2`; `n = 3`, `i = 1, 2, 3` | `0 + 1 − 1 = 0`; `0 + 1 − 0 = 1`; `1 + 1 − 0 = 2`; `0 + 3 − 1 = 2`; `1 + 3 − 0 = 4`; `3 + 3 − 0 = 6` | Correct; text kept |
| (3), embedding `θ ∘ ῑ⁻¹` for `𝔪^∨` | `n = 1`, the `𝔽_9` character, `ℓ = 3` | `ρ_𝔪^∨(Frob_v) = θ(a)⁻¹ = θ(−a)`. Through `θ ∘ ῑ⁻¹`: `θ(ι(T) mod 𝔪) = θ(a⁻¹) = θ(−a)`, which matches. Through `θ` alone: `θ(a)`, which does not | Embedding made explicit |
| (4), `q_v` a unit of `𝔽̄_ℓ` at `𝔭_i ∤ ℓ` | `p = 7, ℓ = 11`; `𝔭_i` above `ℓ` | `7 ≢ 0 mod 11`. A place above `ℓ` is excluded by "not above `S ∪ {ℓ}`" | Clause added |
| Degree character Check: `deg(T_{1,v}) = q_v + 1`, `deg ∘ ι = deg` | `GL_2(ℚ_5)` | `K diag(5, 1) K` holds `5 + 1 = 6` left cosets. `deg(ι(T_1)) = deg(T_2⁻¹)deg(T_1) = 1·6 = 6`; `deg(ι(T_2)) = 1`. `[K : K ∩ gKg⁻¹] = [K : K ∩ g⁻¹Kg]` by unimodularity | Correct |
| Generality (README versus Lean) | — | §8.5 has no Lean counterpart. The README rule holds for every finite-residue maximal ideal with `q ∉ 𝔪`, not only those containing `ℓ` (mod-2 row) | No Lean change |

## Checks run

- **Elaboration.** `lake env lean packages/IgusaVarietiesAndTorsionConcentrationPartII/Suggested.lean`, run from the content checkout, exited with code 0. Its only output was the two expected `declaration uses 'sorry'` warnings, at lines 79 and 91. There are no `TauCeti.*` imports to build.
- **Signatures.** I put `#check @name` for all four declarations (`IsStrongGenericAt`, `IsCompletelySplitStrongGenericPrime`, `infinite_setOf_isCompletelySplitStrongGenericPrime`, `infinite_setOf_isStrongGenericAt_degree_one`) in one scratch copy and elaborated it once. Every elaborated type keeps `[Field F] [NumberField F] [Field L] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}` and the representation `r : Gal(L/F) →* GL (Fin n) k`. The two theorems also keep their existential starting-place hypotheses. The types agree with §§8.7–8.8 of the README. Nothing changed.
- **Dependency gate.** `gate --depcheck … --movable` output: `depcheck: 245 roadmaps, 2248 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citation resolver.** `roadmaps resolve` on the README reports no cross-roadmap citations and no Lean names that it cannot find anywhere.
- **Ownership.** The repair adds no new object or construction. It adds a hypothesis to a target this roadmap already owns (§8.5), so no ownership question arises. Every citation in §8.5 is the same as before.
- **Sources.** No new source is cited and `needs-references.toml` was not written. The locators used are CS17 line 4465 and CS17 lines 4470–4478, both already in the manifest's CS17 entry.
- **Gate failures listed in the brief.** None.

## For the maintainer

- No name of this roadmap changed. No section was renumbered, and no id that other roadmaps cite was dropped.
- The parent IgusaVarietiesAndTorsionConcentration §5.1 does not have this defect, because it states the eigenvalue rule only for Galois-type ideals.
- The review contains no suspicious instructions.
