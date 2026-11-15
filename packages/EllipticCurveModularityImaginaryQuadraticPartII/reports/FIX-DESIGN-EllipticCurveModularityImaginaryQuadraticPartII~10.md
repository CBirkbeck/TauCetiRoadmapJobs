# FIX-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~10

This round repairs the six findings of REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~9 (design, round 9): one P2 and five P3. All six were checked and found correct.

Files edited: `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md` and `design/plan.json`. `sources.toml` is unchanged: no source was added or fetched. The review's "For the human reviewers" section (scope, licences) was not acted on.

## F01 (P2) — applied

Verified. CaptainSude26 lines 248–250 and 259–263 match §4.2 clause by clause. Lines 335–341 match §5.3 (route and first Check), and lines 520–529 match §7.2(a).

Change: the three routes and the Check are rewritten in our own words and in a different order, with every input kept.
- §4.2 now defines a *detecting* element first, then proves one exists.
- §5.3 now argues through `tr ρ(σ) = 2`, `det ρ(σ) = 1` and ring maps.
- §7.2(a) now names the field `K₁`, the integer `n₀` and the set `Σ₀` explicitly.

The suggested texts were checked before use. In §4.2 one point needed correcting: `ρ̄(G_F)` is only conjugate to `SL₂(𝔽₅)`. The route therefore takes `g ∈ ρ̄(G_F)` corresponding to `diag(2, 3)`, and defines "detecting" by `κ(σ) ∉ (Ad ρ̄(σ) − 1)M`, which is invariant under conjugation. The route now also says why the primes below `Q_N` split in every imaginary quadratic subfield.

**Pattern.** A mechanical scan compared the README with all eight cached sources. It looked for shared runs of 28 or more letters, ignoring spaces and punctuation. Besides the three passages above, it found these runs close to a source, now reworded:
- §5.4 Check 2, "source and target lie on matching components…" (CaptainSude26 line 491, nearly a full sentence).
- §5.4 route, "no component labels at `P`" (line 492).
- §5.1 condition (i), a 16-word run (line 271).
- §5.1 perfectness bullet (lines 380–382).
- §3.5 Check 3 (lines 222–223).
- §7.3 statement and Check 2, "residual Frobenius has diagonal entries" (line 534).
- §7.5(c), the opens (lines 566–567). This bullet also had a small error, now fixed: §7.4 is applied over `K`, so the split-multiplicative open sits at `v`, not "at the places above `v`".
- §2.2, the list of lifting inputs (CaptainSude26 lines 646–649) and "changing the coefficient prime after each row" (LeHung26 line 264).
- §2.1(a) (LeHung26 line 336), whose clauses are reordered.

What remains after the edits is standard terminology, titles in the References, and formula phrases such as "has characteristic polynomial `(X − 1)²`". plan.json tests `hecke_torus_poly`, `tangent_ramified_class` and `tate_nonsplit` and statements 2.1 and 7.3 were reworded to match.

## F02 (P3) — applied

Verified. At the head of ArithmeticGaloisRepresentations, Layer 1 is "continuous representations and integral models" (its line 768). Layer 2 is "decomposition groups, inertia and Weil–Deligne representations" (line 1600), and §2.1 "Decomposition groups" is at line 1617.

Change: "ArithmeticGaloisRepresentations Layer 1 (decomposition groups)" → "§2.1 (decomposition groups)". This is cited at section precision, in four places:
- the supplier contracts;
- the §1.2 *Needs* line;
- Layer 1 *Dependencies*, which had omitted this supplier and now lists it;
- plan.json: the target 1.2 prerequisite and the supplier sections list.

## F03 (P3) — applied differently

Verified. The Weil part of the parameter is unramified at a split multiplicative place and ramified at a potentially good place with nontrivial inertia.

Change: "Weil semisimplification alone cannot distinguish the first two" → the first two already differ in the Weil part. What `N` changes is the degree: without `N` the factor would be `((1 − T)(1 − q_v T))⁻¹`; with `N` it is `(1 − T)⁻¹`. At `q_v = 4` these are `((1 − T)(1 − 4T))⁻¹` and `(1 − T)⁻¹`.

Why differently: the suggested wording, "that of the reducible unramified principal series", is imprecise. The `N = 0` parameter with eigenvalues `1, q_v` belongs to the one-dimensional constituent of that principal series, not to the principal series itself. The Check therefore states only local factors. plan.json test `local_factor_degrees` is updated.

## F04 (P3) — applied

Verified. Take `P = {v₁, v₂}` and frame only `v₁`. The inflated class vanishes on `G_L` and is nonzero, so by §4.1 it is ramified at `v₂`, and §3.5(b) gives `L_{v₂}^⊥ = H¹_ur`. The class is therefore excluded.

Change: "If a protected place were put into the framing set" → "If every protected place were put into the framing set `T`, no dual condition would remain at a place of `P`". A sentence is added explaining why framing only part of `P` does no harm. plan.json test `tw_framed_P_fails` is updated.

§4.3 Check 3 already speaks of framing "the protected places", that is all of them, and is consistent.

## F05 (P3) — applied differently

Verified. With `d = 1` the statement says nothing, and `d = 3q` is not invertible in the residue field. NeronModelsAndSemistableAbelianVarieties §3.12 asks for `N ≥ 3` invertible in `k`. The parent's §6.1 holds for every `N ≥ 1`.

Change: "for an odd `d ≠ q`" → "for an integer `d ≥ 3` prime to `q` (`d = 3` will do, as `q ≥ 7`)".

Why differently: the review asked for a prime `d ≥ 3`. §3.12 does not need `d` prime, so the general condition is stated, with `d = 3` as the witness.

Pattern: `grep -w odd` finds no other parity condition used in place of invertibility. The remaining occurrences are "odd characteristic" (supplier §7.7), "odd prime" (§3.3), odd-degree cohomology (Mathlib) and the new Conventions sentence.

## F06 (P3) — applied

Verified by a scan of every backticked occurrence, listed by section. Changes:
- **§1.1:** `E`, `ι`, `φ` → `K'`, `c`, `β`. The intermediate field, the complex conjugation and the complex embedding no longer use the Conventions letters for the curve, the coefficient isomorphism and the Frobenius lift. plan.json 1.1 (statement, hypotheses, test `cm_intermediate_real_subfield`) is updated.
- **Conventions:** a sentence fixes where each reused letter occurs: `η, ψ, χ` (and `V_η, V_ψ, V_χ`), `ψ` in §3.4, the tuple `χ` in Layer 5, `χ_(h(t))` and `w`.

The same defect also affected other Conventions letters. All are repaired:
- `p`: the parent's prime (Summary, Layer 1 Examples, Layers 2, 7, 8) versus a coefficient prime (Layer 3, the coefficient conventions, the supplier obligations, `p = 5`). A Conventions sentence now says so.
- `D`: `Ad(U)` in Layer 3 versus the curve `D_t` and the field `G_D` of the parent's §7.4 in Layer 7. A sentence was added to the `ad⁰` bullet, and §7.1 now writes "the families `D_t` and `A_t`".
- `K`: levels `K`, `K_v`, `K^P` in Layer 5 and the supplier obligations. A sentence was added to the `Iw_v` bullet.
- `c`: the matrix entry in §3.1 becomes `X = [[x, y],[z, −x]]` and the cocycle in §3.5 Check 2 becomes `ξ` (plan test `tangent_cocycles`).
- `k`: the integer `k` of `U^(5k)` in §6.1 Check 2 is removed (plan test `prep_conjugate_ramified`).

The scan was rerun after the edits:
- `η` occurs in the Conventions, How to read the build, Layer 2 and §8.1.
- `ψ` occurs in Layer 2 and §3.4.
- `χ` occurs in Layer 2, Layer 5 and two supplier contracts.
- The reflection `w` occurs only in the Conventions and §7.1.
- `ι` and `φ` no longer occur in §1.1.
- `D` alone occurs only in the Conventions and Layer 3.
- Bare `c` is complex conjugation everywhere.

## Checks run

Dependency check, after the edits:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2249 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

Other checks:
- **Citation resolve:** three leads, `LeHung26, §4.4`, `OpenAI26, §9.4` and `CaptainSude26, §4`. All three are source keys, not roadmaps, so they are false positives. No Lean name is reported. ArithmeticGaloisRepresentations §2.1 resolves.
- **Supplier text re-read this round:**
  - ArithmeticGaloisRepresentations Layer 2 and §2.1.
  - NeronModelsAndSemistableAbelianVarieties §3.12 (`N ≥ 3` invertible in `k`).
  - The parent's §6.1 (`N ≥ 1`) and §7.4 (the field `D`, the `G_D` image).
  - GlobalGaloisDeformations §5.6 (detecting conjugacy classes, padding class, avoidance set `B`, residue degree one).
  - CrystallineLocalGlobalCompatibilityCM §8.6 (PGL₂ Hecke image as a quotient, finite-cover descent with bounded nilpotent kernel) and §8.7 (hypotheses: `p` odd, `ζ_p ∈ F`, `ρ̄_𝔪` absolutely irreducible, rank-one coefficients with trivial reduction).
- **Shape:**
  - No LaTeX delimiters and no machine paths.
  - plan.json parses.
  - No section, layer or target id was renamed or dropped.
  - Every definition keeps its API bullets and at least three Checks.
- **Lean:** a design has no `Suggested.lean`, so no `#check` comparison was run and no declaration changed.

## Adversarial pass (changed statements)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.1 (renamed `K'`, `c`, `β`) | `K = ℚ(i)`, `L = ℚ(ζ₂₀)`, `K' = ℚ(i, √5)`; non-abelian: `K = K⁺(i)` with `K⁺` cut out by `x³ − 4x + 1` | fixed field of `c` in `K'` is `ℚ(√5)`, index 2; disc `256 − 27 = 229` not a square, so the closure group is `S₃ × C₂` with `c = (1, −1)` central; `β∘σcσ⁻¹ = conj∘β = β∘c` | holds; `ℚ(√5) ⊉ K` stays the non-example |
| §1.2 *Needs* (AGR §2.1) | `F_w = K_v = ℚ_q` | decomposition groups `D_w ⊆ D_v` with equality when the completions agree | the cited section supplies it |
| §2.3 Check 1 | `q_v = 4`; split multiplicative versus additive potentially good | `(1 − T)(1 − 4T) = 1 − 5T + 4T²`; `ker N` is the eigenvalue-1 line, factor `(1 − T)⁻¹`; additive: an inertia element of finite order in `SL₂` with eigenvalues `ζ, ζ⁻¹ ≠ 1` gives `V^I = 0`, factor `1` | Weil parts differ (unramified versus ramified); `N` lowers the degree from 2 to 1 |
| §3.1 commutators (renamed) | `X = [[x, y],[z, −x]]` | `UX − XU = [[z, −2x],[0, −z]]`, `UᵀX − XUᵀ = [[−y, 0],[2x, y]]`; both zero forces `x = y = z = 0` when `2 ∈ k^×` | holds |
| §3.5 Check 2 (`ξ`) | `q_v = 11` | `Σ_{i<11} Dⁱ = 2(1 + ⋯ + D⁴) + D¹⁰ = 1`; `Z¹ = 3 + 1 = 4`, `B¹ = 2`, `H¹ = 2` | holds |
| §3.5 Check 3 | `a(f,0) + b(0,e)`: `(a, b) = (1, 0)`, `(0, 1)` | pairing with `(0,e)` is `a·⟨(f,0),(0,e)⟩`, nonzero for `(1,0)`; `⟨(0,e),(0,e)⟩ = 0` (alternating) | in `L_v^⊥` iff `a = 0` iff zero image in `H¹(I_v, M) = M/(D − 1)M` |
| §4.2 route | `g ↔ diag(2,3)`; conjugate `σ' = hσh⁻¹`; `F = ℚ(ζ₂₀)`, `q = 41` | `Ad(g)`: `e ↦ 2·3⁻¹e = 4e`, `f ↦ 4f`, `h ↦ h`, so `W = ke ⊕ kf`; `κ(γσ₀) = κ(γ) + κ(σ₀)`; `κ(σ') = hκ(σ) + (1 − Ad ρ̄(σ'))κ(h)`, so the condition is conjugation-invariant; `41 ≡ 1 mod 20`, `41 = 5² + 4²` splits in `ℚ(i)` | holds; existence of `σ₀` or `γσ₀` checked in both cases `κ(σ₀) ∈ W`, `∉ W` |
| §4.2 Check 2 | `P = {v}`; `P = {v₁, v₂}` with `v₁` framed | `g = diag(2,3)` has order 4, so `H¹(⟨g⟩, M) = 0`; with `v₂` unframed the inflated class is ramified at `v₂` (§4.1) and fails `L_{v₂}^⊥` | every protected place framed: `H_Q ≠ 0`; part framed: excluded |
| §5.1 (i) (reworded) | `F = ℚ(ζ₂₀)`; quadratic subfields `ℚ(i)`, `ℚ(√5)`, `ℚ(√−5)` | `5 = (2+i)(2−i)` splits in `ℚ(i)`; `2` ramifies in `ℚ(i)`, `ℚ(√−5)` and is inert in `ℚ(√5)` | `(i)` fails for `ℚ(ζ₂₀)` at `2`, same as the old wording; "two places" equals "splits" |
| §5.1 perfectness bullet | the supplier's hypothesis list | `p = 5` odd, `ζ₅ ∈ F`, `ρ̄` with image `SL₂(𝔽₅)` absolutely irreducible, `O(χ⁻¹) ⊗ k = k` since `χ_v ≡ 1 mod ϖ` | all hypotheses of §8.7 met |
| §5.3 route and Check 1 | `u ∈ O_{F_v}^×`; `χ_v(u) = ζ₅` | trivial coefficients: `diag(u,1)`, `diag(1,u)` act as 1, `P_{v,σ} = X² − 2X + 1`, so `tr = 2`, `det = 1`; character `χ_v⁻¹(a/d)`: `χ_v(u)⁻¹` and `χ_v(u)`, roots `ζ₅^{∓1} ≠ 1` | holds; nonreduced quotients covered because §3.4 is over `CNL_O` |
| §5.4 route and Check 2 | `P` | §4.3: protected places have no factor in `R^loc_T` | no component choice at `P`; matching at `S₅^cr` and `S₅^st` unchanged |
| §6.1 Check 2 | ramification index `e = 5k` | `U^e = (U⁵)^k = 1` | trivial residual inertia, as stated |
| §7.2(a) | `m_v = 1, 5, 7`; `q` split completely in `K₁` | `v(q_A) = 3m_v + v(λ(s)) = 3, 15, 21` once `λ(s)` is a unit; `m_v = 5` excluded; `K₁ ↪ K_v = ℚ_q` | holds; `Σ₀` finite (bad primes of `E`, prime factors of `n₀`, finitely many degenerate fibres) |
| §7.2(b) | `d = 1`, `3q`, `3`, `4` with `q = 7` | `d = 1` fails `N ≥ 3`; `3q` is not a unit mod `q`; `3, 4` satisfy `N ≥ 3`, `N ∈ k^×` | `d ≥ 3` prime to `q` is exactly §3.12's hypothesis |
| §7.3 statement | `v(q_A) = 3`, residual Frobenius `[[1,1],[0,1]]` | `φτ^x ↦ [[1, 1 + 3x],[0,1]]`; `x = 3` gives `10 ≡ 0` | identity after the tame-lift change |
| §7.3 Check 2 | non-split twist | Frobenius `↦ −[[1,b],[0,1]]`, inertia unchanged `[[1, v(q_A)],[0,1]]` | still protected; component is Steinberg times the unramified quadratic character |
| §7.5(c) | `t ∈ Ω_v`, `Ω_{v'}` of §7.2 | `A_t ∈ Y_ρ̄(K_v)`, split multiplicative with `v(Δ_min) = 3m_v`, `5 ∤ 3m_v`; good at `v' ≠ v` | both opens nonempty; `A'` from §7.4 is protected above `v` (§7.3) and good above `v^c` |
| Conventions scope sentences | mechanical scan of backticked tokens per section, before and after | listed under F06 | every claimed location is true |

## Citations and ownership

No new object, target, carrier or supplier was added. Every repair rewords, corrects or relabels existing text. No ownership search was needed, and ownership against open pull requests is unchanged from the previous round.

One citation changed: ArithmeticGaloisRepresentations Layer 1 → §2.1. It was resolved at that roadmap's open head. No citation of a roadmap later in the merge order was added.

## For the maintainer

- No id that other roadmaps cite was renamed or dropped. No section moved. There are no new supplier gaps: `gap:acc-torsion-inertial-comparison` is unchanged.
- No Lean names are affected.
- Letters renamed inside the roadmap:
  - §1.1: `E → K'`, `ι → c`, `φ → β`;
  - §3.1: matrix entries `(a, b, c) → (x, y, z)`;
  - §3.5: cocycle `c → ξ`.

  Other roadmaps cite these sections by number only, so nothing outside is affected.
