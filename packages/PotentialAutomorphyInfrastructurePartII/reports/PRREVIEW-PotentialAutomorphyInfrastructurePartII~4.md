# Review of PotentialAutomorphyInfrastructurePartII (pull request #2135 at cbae37a)

**Verdict:** accepted

This is an incremental re-review of the 8 lines of `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md` changed since `4777c48`: the §10.5 route, two new §10.5 Checks, the §10.5 *Needs:* line and the Layer 10 Dependencies line. `Suggested.lean` is unchanged. The previous report's only finding is repaired and the repair introduces no new problem. The gate passes. This report has no findings.

## Previous findings

- R01 — repaired: line 2183 now says "replace `E` by `E′ = E(ζ_{p^M})` … the lifting rings over `O′` are not claimed to be domains, and the component form of §4.8 is used instead of its domain corollary", followed by the Galois-orbit argument.

## Verified sound

**Gate, order, Lean.**
- I reran the gate at `cbae37a`. Every counter is 0 and it ends `OK`. The worker's run, which includes the targeted build, also reports `build=0`.
- The dependency check prints `depcheck: 235 roadmaps, 2133 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- The diff against `origin/main` outside the folder is empty.
- `lake env lean` on `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/Suggested.lean` exits 0 with no messages.
- The file declares nothing, so the one-tactic probe and the `#check @name` comparison have nothing to run on. Its docstring lists 12 headline theorems, each with the carriers it lacks; this is unchanged since `3924a02`.

**The repair, step by step (line 2183).**
1. *Why the domain statement holds only over `O`.* Hypothesis (ii) is genericity for the ramification index `e` of `O`, and the polynomial depends on `e` (LLHLM23 lines 5001–5002 and 5078–5079). LLHLM23, Theorem 3.7.1 (lines 2584–2593) constructs its open set `U(e)` from the valuations `1 ≤ l ≤ e` and requires `e!ẽ!` to be invertible on it (lines 2616–2623). So for `e′ ≥ p`, no `µ` is generic modulo `p` for `e′`. The route is right not to ask for domains over `O′`.
2. *Change of coefficients.* The lifting ring over `O′` is `R_w ⊗_O O′`, from LocalGaloisDeformationRings §3.7 at the head of its open pull request ("Potentially semistable rings under change of coefficients"). That section says the generic quotients commute with finite scalar extension and that components can split. Then `B = A ⊗_E E′` is the generic fibre over `O′`.
3. *Minimal primes lie over `(0)`.* `B` is free over the domain `A`, so it is flat and has going-down. Its minimal primes therefore contract to `(0)`.
4. *Transitivity.* `E′/E` is Galois, and `B^G = A` because invariants of `E′` commute with `A ⊗_E –`. Hence `G` acts transitively on the primes over `(0)`, which are the minimal primes.
5. *The `E`-point lies on every component.* The kernel of the `E′`-point coming from the `E`-point `r|G_{L_w}` is `𝔭B`, which is `G`-stable. It contains one minimal prime, so it contains every `G`-translate of it, that is, all of them.
6. *Consequence for §4.8.* `f′` is `O′`-valued and lies on some component of `Spec B`. `r|G_{L_w}` lies on every component, so the component hypothesis of §4.8 holds.
7. *Roots of unity at `R`.* `E(ζ_{p^M})`, with `M` the largest `v_p(Nw − 1)`, supplies the roots of unity that §4.8 (line 1168) and §4.6(ii) require at each place of `R`.
8. *Pinned declarations behind steps 3–4.* The two commutative-algebra steps are owned by Mathlib at the pin:
   - `Algebra.HasGoingDown.of_flat` (`Mathlib/RingTheory/Ideal/GoingDown.lean:154`) with `Ideal.exists_ideal_le_liesOver_of_le` (line 50);
   - `Algebra.IsInvariant.exists_smul_of_under_eq` (`Mathlib/RingTheory/Invariant/Basic.lean:150`), under `Algebra.IsInvariant` (`Mathlib/RingTheory/Invariant/Defs.lean:34`). That predicate asserts only that fixed points come from `A`; the converse is `smul_algebraMap`.

**Changed lines, each read with what cites it.**
- *Needs:* of §10.5 adds two citations, and both resolve:
  - PotentialAutomorphyInfrastructure §2.5, "Auxiliary soluble and cyclic extensions", at the head of its open pull request. It builds cyclic and CM extensions with prescribed local behaviour and uses PotentialModularityAndCompatibleSystems §2.16 for soluble prescribed completions.
  - LocalGaloisDeformationRings §3.7.
  - Both were already in the supplier contracts (PotentialAutomorphyInfrastructure §§2.3, 2.5; LocalGaloisDeformationRings §§3.2, 3.4, 3.7, …).
  - This repairs the remark of the previous report on the missing §2.5.
- Layer 10 Dependencies adds the same two items.
- Both suppliers are earlier in the merge order (lines 87 and 193, against 282 for this roadmap), and both are new-roadmap pull requests listed in the description's `depends-on` block.
- The notation `A`, `B` is local to the route. The Conventions' `A = k⟦T⟧` is scoped to Layers 7–8 (line 138).

**Seeded sample.** Of the 15 sampled targets, only §10.5 lies in a changed passage. I read it against its sources:
- LLHLM23, Theorem 9.2.1, p. 137 (lines 6226, 6233–6250): the six hypotheses (i)–(vi) match lines 6235–6246.
- The source's proof (lines 6249–6250) refers to Theorem 7.3.2 and to LLHLM20, Proposition 6.0.2. That proposition is on pp. 98–99 (lines 5132, 5170–5231). There the local rings are geometrically integral (lines 5222–5224), which the Galois-orbit argument replaces.
- Theorem 7.3.2(2) is on p. 111 (lines 5001–5007) and Remark 7.3.4 on p. 112 (lines 5022–5026).
- The other 14 targets lie in untouched text. They were read at their locators in the earlier full review and were not reopened here.

**Adversarial pass.**

Rows for the changed statements, with computed values:

| Statement | Instance | Values computed on each side | Result |
|---|---|---|---|
| §10.5 route, enlargement | `E = ℚ₅`; places `w ∤ 5` with `v₅(Nw − 1) ∈ {1, 2}` (`Nw = 11`, `Nw = 101`) | `M = 2`, `E′ = ℚ₅(ζ₂₅)`, `[E′ : E] = e′ = 20`; §4.8 needs 5th and 25th roots of unity: both in `E′`; `5 > n` and `25 > n` at the two places, so `n ≤ 4` | holds |
| §10.5 route, no domain over `O′` | same | `U(20)` has `20!` invertible (LLHLM23 line 2619) and `5 ∣ 20!`, so no `µ` is generic mod 5 for `e′ = 20`; (ii) gives genericity only for `e = 1` | route correctly uses the component form |
| §10.5 route, Galois orbit | `p = 3`, `A = ℚ₃[x, y]/(x² + xy + y²)`, `E′ = ℚ₃(ζ₃)` | discriminant `−3` has odd valuation, so `A` is a domain; `B` has minimal primes `(x − ζ₃y)`, `(x − ζ₃²y)`, swapped by `Gal = ℤ/2`; the `ℚ₃`-point `(0, 0)` has kernel `(x, y)B ⊇` both; the `E′`-point `(ζ₃, 1)` lies on one only | holds |
| §10.5 route, minimal primes over `(0)` | same | `B` free of rank `2` over `A`; 2 minimal primes, both contracting to `(0)` since `A` is a domain; `2 ≤ \|G\| = 2` | holds |
| §10.5 route, component hypothesis of §4.8 | `r` `O`-valued, `f′` `O′`-valued | `f′ ∘ r_𝔪\|G_{L_w}` lies on some component `C` of `Spec B`; `r\|G_{L_w}` lies on all, hence on `C` | holds |
| §10.5 route, degenerate `M = 0` | `r`, `π` unramified away from `p` | no places, `E′ = E(ζ₁) = E`, `G = 1`, `B = A` a domain, `R = ∅` in §4.8 | holds trivially |
| §10.5 route, `p = 2` | excluded | (v) needs `ζ_p ∉ F̄^{ker ad r̄}`, but `ζ₂ = −1 ∈ F` | `p` odd, so `e′ ≥ 2` |
| New Check 1 (line 2193) | `p = 3, M = 1`; `p = 5, M = 2` | `e′ = 2`, `e′ = 20`; against `e = 1` | holds |
| New Check 2 (line 2194) | `A = ℚ_p[x, y]/(x² − py²)` | `√p ∉ ℚ_p`, so `A` is a domain; over `ℚ_p(√p)` the components are `x = ±√p·y`; `(0, 0)` lies on both; `(√p, 1)`: `p − p = 0`, on `x = √p·y` only | holds |
| LocalGaloisDeformationRings §3.7 as used | `O′/O` finite free | `(R_w ⊗_O O′)[1/p] = A ⊗_E E′ = B`, reduced since `E′/E` is separable; "components can split" there agrees with Check 2 | holds |

Rows carried from the previous report (`4777c48`) for statements this diff leaves untouched:

| Statement | Instance | Values (as computed there) | Result |
|---|---|---|---|
| §10.2 (D0) | `N = 2`, `ξ_τ = (0, 4)` | `a_ξ = −4`, `b_ξ = 5`, bound `11`; strict form excludes `ℓ = 11` | holds |
| §10.2 (D1) | `N = 2` | `2(N + 1) = 6`; first odd `ℓ` is `7` either way | holds |
| §4.8 hypothesis at `R` | `l = 5`, `n = 6`, `Nv = 11`; `Nv = 251` | `5 ∥ 10`, `5 < 6`: excluded; `250 = 2·5³`, `125 > 6`: allowed | holds |
| §4.8 against §4.6(ii) | `l = 3`, `n = 2`, `Nv = 4` | `3 ∥ 3`, `3 > 2` | consistent |
| §10.5 route, valuation | `p = 5`, `q = 11`, `k = 1` | `11⁵ − 1 = 2·5²·3221`, `v₅ = 2 = k + 1` | holds |
| §8.5 | `n = 2`, `\|R\| = 1` | `nD − 9 > nD − d₀` iff `d₀ > 9` | consistent |
| §8.5 against §8.8 | counts | `nD − rn(n + 1) − 5 < nD − rn(n + 1) − 3` | consistent |
| §7.7 | `n = 2`, `S(B) = {v₀}`; `S(B) = ∅` | bound `2[F⁺ : ℚ] − d₀`; `d₀ = 0` gives `n[F⁺ : ℚ]` | holds |
| §2.2(3) | `d = 1` | `µ₂` acts trivially, `P_𝒮 = R^univ_𝒮` | holds |
| §8.15 locator | NT21 | statement p. 73, proof to p. 75 | holds |

Rows carried, through the previous report, from the review at `3924a02`. These include the sampled §§3.1, 8.2 and 10.3:

| Statement | Instance | Values (as computed there) | Result |
|---|---|---|---|
| §3.1 | `L⁺ = ℚ`, `n = 2` | `((−1)^{n/2})^{[L⁺:ℚ]} = −1`: no form; unramified `L/L⁺` forces `[L⁺ : ℚ]` even | holds |
| §4.5 parity | `n = 1`, `[L⁺ : ℚ] = 2`, `µ` even | `q₀ = 2`, `dim R_∞ = dim S_∞ − 2` | contradiction, so `µ ≡ n` |
| §5.1 | multiplier conversion | `ρ^c ≅ ρ^∨ε^{1−n}µ` | consistent with §0.3 |
| §8.2 | `P = ℤ`, `R = ℤ/2`, `J = (2)` | `θ(J)R = 0 ⊂ (0)` | Check correct |
| §10.1 | `N = 2`, `d = 1`, `µ` odd | `χ(c_v) = +1`; shortfall `Nd = 2` | matches |
| §10.3 Check | `y² = x³ + 3x + 2` over `𝔽₅`, `ℓ = 7` | `α/β = 5 = q` mod 7; ratios `4, 1, 2`; `4·24·124 = 11904`, prime to 7 | Check correct |
| §10.4 | `λ^s = (0, 0)`; `(2, 1, 0)` | `(−1, −1)`; `(−2, −3, −4)` | holds |

The rows for §§1.5, 2.1, 3.8, 4.2, 4.6(ii), 5.6, 5.7, 6.1, 7.4, 7.6, 7.19 and 9.7 stand as recorded at `3924a02`.

**Headline theorems.** These are §§4.5–4.8, 5.1, 5.3, 5.5, 5.6–5.7, 6.1, 7.19, 8.7–8.8, 9.7, 10.2, 10.3 and 10.5. Each is named in the module docstring with the carrier it lacks. For §10.5 the missing carriers are tame inertial types, potentially crystalline representations of fixed type, and automorphic representations with a prescribed `K`-type. The change does not alter that §10.5 cannot be stated at the pins.

**Declared gaps.** `gap:generic-tame-pcris-domain` (line 213) asks for a domain over `O` with genericity for `e`. After the repair, the route uses it exactly there and nowhere over `O′`, so the gap stays precise and minimal. No other gap text changed.

**Overlaps and ownership.** `overlaps.md` lists no dropped id and no other pull request changing this folder. The change adds no target or object, only a route step and two Checks, so it raises no ownership question. Ownership against the other open pull requests was not checked again this round. The one lead in `citations.md`, PotentialAutomorphyDworkMotivesPartII §9.4 at line 66, is untouched text. It names a roadmap that is a board package and appears at line 243 of the merge order, before this roadmap.

**Sources opened this round (2).**
- LLHLM23: lines 314–330, 817–821, 930–935, 2575–2660, 4995–5026, 5070–5092 and 6226–6256.
- LLHLM20: lines 5165–5245.

**Remark on the description, untouched, no change asked.** The `depends-on` block now lists the pull requests of ModularityAndLanglandsExtensions and CompletedCohomologyAndLocalGlobalCompatibility. The generated `merge-order` chain still ends at PotentialAutomorphyInfrastructure.

## Not verifiable

- The items listed in earlier reports were not reopened, because the change does not touch them: the asserted source corrections, the results named in routes without a manifest entry, and the construction of §7.12.
- For `M = 1` (`e′ = p − 1 < p`), LLHLM23 does not say whether genericity for `e` implies genericity for `e′`. The repaired route does not need it.

## Source issues

- **Misprint** in LLHLM23 at Theorem 9.2.1, p. 137: the parenthetical in the conclusion attaches the weight and the `K`-type `σ(τ)` to the given `π`; it should attach them to the new `π′`; affects nothing.
- **Gap** in LLHLM23 at Theorem 9.2.1, p. 137: the source says the theorem follows from Theorem 7.3.2 by standard base change and patching; it should say how irreducibility, proved only for the ramification index `e`, survives adjoining the roots of unity that Ihara avoidance needs; affects the proof.
