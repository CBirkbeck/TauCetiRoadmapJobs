# FIX-DESIGN-QuasiRiemannHypothesis~3: repair of the design review

Review answered: `REV-DESIGN-QuasiRiemannHypothesis~2` (8 findings: 1 P1, 1 P2, 6 P3). Files changed:
`packages/QuasiRiemannHypothesis/design/README.md`, `packages/QuasiRiemannHypothesis/design/plan.json`
(11 layers, 55 targets, 140 tests, `gaps = []`), `packages/QuasiRiemannHypothesis/sources.toml` (two
locators). No target was added or removed and no section was renumbered. The displays that the text
layers drop (conjugation bars, Kubota's (12), (17), (23), (25), `openai2026quasiRH` (4.12), (5.7), (5.9))
were read from page images of the cached files of the same sources.

## F01 (P1) — applied

§8.7: `τ(±λ^(3n−4)cd³) = g(λ², c)…` (and the three other cases) → `conj g(λ², c)`, `conj g(ωλ², c)`,
`conj g(ω²λ², c)`, `conj g(1, c)`; `θ(H_j(z, v)) = … d_j(μ)…` → the expansion of `θ̄` (character `κ̄_P`), `d_j(μ)` = conjugate
of the `θ ∘ H_j` coefficient at `−μ`; `g̃ = g(1, c)/|c|` defined; Check 1 → `d₀(λ⁻³nb³) = 3^(5/2)|b| g̃(n)` with the witness.

Evidence: `patterson1977` printed p. 152 (Theorem 8.1) and p. 154 ((8.8)–(8.9)) print every Gauss sum
under a bar; `dunnradziwill2024` (5.7), p. 17, likewise, and (5.16), p. 19, gives the conjugate expansion
through `conj d_j(−μ)`; `openai2026quasiRH` (5.7), p. 27, expands `θ̄`, and (5.9), p. 28, is "the
coefficient in `θ̄`". Computed at `c = 1 + 3ω` (`𝓞/c = 𝔽₇`, `ω ↦ 2`): `g̃(c) = 0.89595 − 0.44415i`,
`g̃³ = 0.18898 − 0.98198i = −α(c)`, `|g̃ − conj g̃| = 0.8883`.

Same pattern elsewhere: §9.2's route now moves cusps "by the automorphy of `θ̄` (character `κ̄_P`)";
Layer 8 Examples (`τ(λ⁻³) = 3^(5/2) conj g(1, 1) = 3^(5/2)`, real). §9.2's `d_t` are §8.7's `d_j`, so they
are now the `θ̄`-coefficients, as `openai2026quasiRH` (5.2) uses them. §8.7 Check 3 also said "fails at
`d = 2`"; `2` is not primary, so it is now the primary `d = −2` (`9|d| = 18 > 12.98`). `plan.json` 8.7
statement, locator and tests `n0_coefficient`, `cusp_coeff` updated.

## F02 (P2) — applied

§5.1 "costs any prescribed positive power of `Z` on a fixed half-plane" → "if `N𝔯 ≤ Z^B` … `|D_𝔯|`,
`|D_𝔯|⁻¹ ≪_{K,σ₀,B,ε} Z^ε` on `Re s ≥ σ₀`"; §5.3 "the reciprocal bound passes to `1/ζ_K`" → "`|1/ζ_K(s)| ≤
|ℒ(s)|⁻¹` on `Re s ≥ 0`, since `|(s − 1)/(s + 1)| ≤ 1`", with `t = Im s` made explicit.

Same pattern, found by a scan of every run of ≥ 8 consecutive words shared with the cached sources
(bibliographic titles excluded) and each confirmed in context: Summary (Mellin integral "containing the
reciprocal of"), §3.2 ("a Gaussian in the sum of two heights", now the inequality (4.12) itself, read
on printed p. 18), §3.4 opening sentence, §4.6 ("finite sum of products of characters", now
`Σ c_(θ,θ') θ(a)θ'(b)`; "on coprime pairs this is sextic reciprocity"), §6.3 ("replaced by its primitive
inducing character"), §9.2 ("conductors supported on"), §10 preamble ("every prime of norm at most a
fixed"), §10.6 ("compact set of real contour parameters"). `plan.json` 5.1, 5.3, 6.3 updated. After the
edit no non-bibliographic run exceeds 7 words, except the title phrase "quasi-Riemann hypothesis — a
zero-free half-plane", which names the subject.

## F03 (P3) — applied differently

Contract: "`mem_support_of_ramified`: a prime in the conductor ramifies" → `abelianConductor`,
`isAdmissibleModulus_abelianConductor`, `isAdmissibleModulus_iff_abelianConductor_dvd`,
`conductorExponent_eq_zero_of_isUnramified`. §2.1's route now proves that the conductor has exponent `0`
at every `v ∤ n a` (local units are norms there, so lowering that exponent keeps admissibility), citing
`milnecft2020` V Theorem 3.5 and Remark 3.8, p. 158.

Why differently: the review's gloss of ClassFieldTheory §13.1 `abelianConductor_eq_lcm` ("a maximum of
local conductor exponents") is not what that target states. On main (ClassFieldTheory README line 2093)
it is the maximum of the `v`-exponents of the conductors of the subfields `L^{ker ψ}`, which does not by
itself give exponent `0` at an unramified place. The needed direction follows from pinned declarations:
`TauCeti/NumberTheory/ClassFieldTheory/Local/Conductor/Basic.lean` line 125 and
`…/Global/AdmissibleModulus/Basic.lean` lines 193, 200, 208. The review's reading of
`mem_support_of_ramified` is right (`Ramification.lean` line 147: ramified ⇒ in every admissible
modulus); it is dropped from the contract, the §2.1 *Needs:* line and `plan.json` 2.1. `sources.toml`
and References now list `milnecft2020` Chapter V, Theorem 3.5 and Remark 3.8, p. 158.

## F04 (P3) — applied

§8.1 route "the product formula … gives `(c/(1+bc))_n = 1`" → a place-by-place computation from
ClassicalArithmeticCompletion §1.52 (product formula) and §1.43 (tame symbol), including the review's
step `((1 + bc)/𝔭_v)_n^(v(c)) = 1` at `v ∣ c`, `v ∤ n`. §1.59 is replaced by §§1.43, 1.52 in *Needs:*,
"Consumed", the contract, `plan.json` 8.1 and the supplier list.

Evidence: ClassicalArithmeticCompletion README (main) line 1888: §1.59 assumes `(a)`, `(b)`, `(n)` pairwise
coprime, while `n ∣ c` here. §1.59 had no other use in this roadmap. The contract also gains §1.38,
which §2.2 cites and the contract omitted.

## F05 (P3) — applied

§11.2 "It is unchanged by passing to the primitive character" → "`χ(n) = χ*(n)` for `n` prime to `q`, and
the least `n` with `χ(n) ∉ {0, 1}` is prime to `q`, so *leastNonOne* `χ* ≤` *leastNonOne* `χ`; equality can
fail (modulo `12`: `2` against `5`)". The modulo-12 Check now also names the primitive value. `plan.json`
11.2 api `primitive` updated.

## F06 (P3) — applied differently

§8.3: `χ_ij` is now defined, `χ_ij(c, d) = χ(σ_i γ σ_j⁻¹)` (`kubota1968` (23), p. 267). The sum now uses
the conjugate `χ̄_ij`, and the normalization is `|U_i|⁻¹`, where `U_i` is the finite group of diagonal
parts `u` of the cusp stabilizer. The vacuous `s = 3` Check is replaced by the computed `SL₂(ℤ[i])`
value `φ(1) = −1`.

Why differently: Kubota's factor `1/2` ((12), (17), (25), pp. 264–267) rests on his standing hypothesis
that the cusp stabilizers are `±` a lattice (p. 264; §4, p. 266). The review's wording ("up to `±1`")
contradicts its own Check: `SL₂(ℤ[i])` has `diag(i, −i)` in the stabilizer of `∞`, so the cosets are
the rows up to four units. Counting up to `±1` gives `φ(1) = −2`. Computed:
`Σ_{0<N(c)≤3600} #(ℤ[i]/c)^× N(c)^(−4) = 4.352670 = 4ζ_K(3)/ζ_K(4)`, and
`φ(1) = π(−1/4)/(π/4) = −1`. For `(Γ₂, κ_P)`, `U = {±1}`
(`diag(ω, ω²) ∉ Γ₂`, as `ω ≡ 1 − λ (mod 3)` is not in `ℤ/3`), so Kubota's `1/2` is the case used there.
`plan.json` 8.3 statement, api and tests updated.

## F07 (P3) — applied

Scope ("Consumed, not redefined"): added "MaassForms §7.3 states the Fourier–Bessel expansion for
`PSL₂(ℤ[i])` with trivial character; §8.2 here is the expansion for a cofinite `Γ` with a unitary
character at an essential cusp, and agrees with it under `μ = n/2`". §8.2 gains the Check: dual lattice
`(1/2)ℤ[i]`, `ě(μz) = e(Re(nz))`, `4π|μ| = 2π|n|`, `K_{s−1} = K_{ir}`. `plan.json` 8.2 test `picard_maass`.

Evidence: MaassForms §7.3 read at its open head (`roadmaps show MaassForms`).

## F08 (P3) — applied

§9.3: the lattice `A = 𝓞` or `λ⁻⁴𝓞`, `Σ_{μ ∈ A}` → `Λ`, `Σ_{μ ∈ Λ}` (the exponent `A` unchanged). §5.4:
"`N_{F/ℚ}` being positive on `F^×`" → "`N_{K/ℚ}` being positive on `K^×`". A search of §2.1 and Layers
5–7, which are stated over a general `K`, found no other `F` for `K`: the remaining `F`s there are explicit
`K = F` instances.

## Checks run

Dependency check (exact output):

```text
candidate: QuasiRiemannHypothesis is not in the merge order yet; checked as if placed after BianchiModularForms (the intake inserts it when its design is accepted)
depcheck: 261 roadmaps, 2605 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

`roadmaps resolve` on the edited README: no cross-roadmap citation and no Lean name found nowhere.
It does not check names outside the roadmaps, so the newly cited Tau Ceti names were checked by hand
at the pin, with their namespace (`TauCeti.ClassFieldTheory`): `abelianConductor` (`Global/AdmissibleModulus/Basic.lean`
193), `isAdmissibleModulus_iff_abelianConductor_dvd` (200), `isAdmissibleModulus_abelianConductor` (208),
`conductorExponent_eq_zero_of_isUnramified` (`Local/Conductor/Basic.lean` 125), and
`Ideal.powerResidueSymbolIdeal_mul_right` (`NumberField/PowerResidueSymbol/Ideal.lean` 145).

There is no `Suggested.lean` at the design stage, so nothing was elaborated and no `#check` file was
needed. No gate failures were listed for this round.

`sources.toml`: `milnecft2020` locator + "Chapter V, Theorem 3.5 and Remark 3.8, p. 158" (printed page
confirmed, the cached text's page 167); `openai2026quasiRH` locator + "(5.7)-(5.10), pp. 27-28". No new
source, so no `needs-references.toml`.

Ownership against open pull requests: no new construction was added. The only shared object is the
Fourier–Bessel expansion on `ℍ³`: MaassForms §7.3, open, for `PSL₂(ℤ[i])` with trivial character, and
this roadmap §8.2 for a general `(Γ, χ)`. That split is now recorded in the scope section; it is a
deferral note, not a supplier edge.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §8.7 `τ`, `n = 0` | `μ = λ⁻³(1 + 3ω)`, `d = 1` | printed `τ = 3^(5/2) conj g̃ = 13.9665 + 6.9236i`; `θ̄`-coefficient `13.9665 − 6.9236i = 3^(5/2) g̃` ((5.9)); unbarred `τ` would give `θ̄`-coefficient `3^(5/2) conj g̃` | bar forced | F01 |
| §8.7 `d_j` from `θ̄` | conjugation of `ě`; parity of `τ` | `conj exp(4πi Re μz) = exp(−4πi Re μz) = ě(−μz)`; `τ(−μ) = τ(μ)` (`±` in every case), so `d₀ = conj τ` | holds | F01 |
| §8.7 bound with `|b|` | `μ = λ⁻⁴(−2)³` (`n = 1`, `b = −2` primary, `k = −4`) | `|τ₁| = 18 ≤ 27·3^(−2/3)·2 = 25.96`; without `|b|`: `12.98 < 18`; `d = 2` is not primary (`2 ≢ 1 mod 3`) | Check corrected | F01 |
| §8.7 Example | `μ = λ⁻³`, `c = d = 1` | `conj g(1, 1) = 1`, `τ = 3^(5/2) = 15.588`, real | holds | F01 |
| §8.7 Example `γ_2 = χ_c(λ)² g̃` | `c = 1 + 3ω`, `λ ↦ 5` in `𝔽₇` | `γ_2 = −0.83262 − 0.55384i = (5/c)_3 g̃`; the inverse cube root of unity gives `−0.0633 + 0.9980i` | holds | none |
| §5.1 consequence | `B = 0`; `Z < 1`, `B > 0`; `ε' = ε/B` | `𝔯 = 𝓞`, `D = 1 ≤ Z^ε` (`Z ≥ 1`); `Z^B < 1 ≤ N𝔯`: no `𝔯`, vacuous; `N𝔯^(ε/B) ≤ Z^ε` | holds | F02 |
| §5.3 `1/ζ_K` | `s = 0, 2, −1/2, 1` | `|(s−1)/(s+1)| = 1, 1/3, 3`; at `−1/2` the ratio exceeds `1`, so `Re s ≥ 0` is needed; at `s = 1` `1/ζ_K` has the removable value `0` | holds | F02 |
| §3.2 joint bound (4.12) | split `|u + T| ≤ |T|/2` or not; `T = 0` | first part `≤ √π (1 + |T|/2)^(−J−N)(1 + 5|T|/2)^J A`, second `≪ e^(−T²/8)(1 + |T|)^J A`; at `T = 0` both sides finite | holds | F02 |
| §4.6 expansion on `T × T` | `T` trivial; `T = ℤ/2` | one constant `c = R(1, 1)`; `|T̂ × T̂| = 4` constants | holds | F02 |
| §2.1 conductor support | `(ℚ, 2, 5)`; `(ℚ, 2, −1)`; `(F, 6, −1)` | `ℚ(√5)`: exponent `0` at `2 ∣ na`, conductor `5`; `ℚ(i)`: `4∞`, real place needed; `F(ζ₁₂) = ℚ(ζ₁₂)`: ramified over `F` only above `2` | holds | F03 |
| §8.1 route | `F`, `n = 3`, `N = 9`; `ℚ(i)`, `n = 2`, `N = 4` and `N = 2` | `v_λ(81) = 8 ≥ 2·2 + 1 = 5`; `v_(1+i)(16) = 8 ≥ 5`; at `N = n = 2` only `1 + bc ≡ 1 (mod 4)` is known, and `5` is no square in `ℚ₂(i)` | holds; `n² ∣ N` needed | F04 |
| §8.1 tame step | `v ∣ 1 + bc`; `v ∣ c`, `v ∤ n` | `(c, 1+bc)_v = (c/𝔭)^(−v(1+bc))`, product `(c/(1+bc))_n⁻¹`; `((1+bc)/𝔭)^(v(c)) = 1^(v(c)) = 1` | holds | F04 |
| §11.2 bullet | `χ` modulo `12` from `(·/3)`; `χ` modulo `5`, `χ(2) = i` | `χ* = (·/3)`: `2`, `χ`: `5`; primitive: `2 = 2` | `≤` holds, `=` fails | F05 |
| §8.3 `φ` | `SL₂(ℤ[i])`, `χ = 1` | `Σ_{N(c)≤3600} = 4.352670`, `4ζ_K(3)/ζ_K(4) = 4.352670`; `φ(1) = −1`; factor `1/2` gives `−2`, no factor `−4` | holds with `|U_i|⁻¹` | F06 |
| §8.3 `U_i` | `Γ₂` at `∞`; `−1 ∈ Γ` | `diag(ω, ω²) mod 3` has `ω ≡ 1 − λ ∉ ℤ/3`, so `U = {±1}`; `χ(−1) = 1` at an essential cusp | holds | F06 |
| §8.2 Picard Check | `μ = (1 + i)/2`, `n = 1 + i` | `ě(μx) = e(Re((1+i)x))`; `4π|μ| = 2π√2 = 2π|n|`; dual `ℤ[i]` keeps only `n ∈ 2ℤ[i]` | holds | F07 |
| §5.4 bullet | `K = ℚ(i)`; `K = ℚ(√2)` | `N(a + bi) = a² + b² > 0`; `N(1 + √2) = −1` | holds | F08 |
| §9.3 tail | `A > 1`; `A = 1` | dyadic shells: `Σ_i (1 + 2^iU/a)(2^iU)^(−A) ≪ (1 + a⁻¹)U^(1−A)`; at `A = 1` the `a⁻¹` part is `Σ_i 1/a`, divergent | holds | F08 |

## For the maintainer

- No section, layer or target number changed; no id that other roadmaps cite was dropped.
- Citations changed: ClassicalArithmeticCompletion §1.59 is no longer cited; §§1.38, 1.43, 1.52 (all
  on main) are. MaassForms §7.3 (open) is named in the scope section only, not as a supplier.
  ClassFieldTheory §13.1 `abelianConductor_eq_lcm` is not cited (F03).
- No text in the review asked for anything outside this job; nothing suspicious was found.
