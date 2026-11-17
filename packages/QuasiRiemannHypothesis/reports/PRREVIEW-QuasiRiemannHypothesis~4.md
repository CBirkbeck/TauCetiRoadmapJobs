# Review of QuasiRiemannHypothesis (pull request #2468 at ad76bbf)

**Verdict:** accepted

No finding. Incremental re-review of the 90 lines of `TauCetiRoadmap/QuasiRiemannHypothesis/README.md` changed since `1958ba8`; `Suggested.lean` is unchanged.

## Previous findings

- R01 — repaired: §8.2 (README lines 1646–1661) defines parabolic elements, cusps, `Γ_c`, finite type, `U_c` and `Λ_c` for a discrete `Γ ⊂ SL₂(ℂ)`, cites KleinianGroups Layers 0–2, and carries the `π`-conjugate Check; supplier contract, *Needs:* lines and Dependencies added.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §8.2 parabolic normal form, the factor common to all `x` | `σ' = σ·(a b; 0 a⁻¹)` | `(a b; 0 a⁻¹)⁻¹ (1 x; 0 1) (a b; 0 a⁻¹) = (1 a⁻²x; 0 1)`: every `x` scaled by `a⁻²`, so `ℝ`-independence does not depend on `σ` | holds | none |
| §8.2 cusp and finite type (`kubota1968` §2, lines 118–153) | `SL₂(ℤ[i])` at `∞`; a cocompact group; `−(1 1; 0 1)`, `−(1 i; 0 1)` as the two parabolics | `x = 1, i` independent; closure meets `ℙ¹(ℂ)` in `∅`, finite type with `h = 0`; squares `(1 2; 0 1)`, `(1 2i; 0 1)` still span rank 2 | holds | none |
| §8.2 stabilizer structure `U_c`, `Λ_c`, index `|U_c|` | `SL₂(ℤ[i])`, `c = ∞`; wrong model "parabolic elements form the group" | kernel of `(u x; 0 u⁻¹) ↦ u` is `Λ_∞ = ℤ[i]`, image `{±1, ±i}`, index 4; `u²Λ = Λ` forces `u² ∈ μ₄ ∪ μ₆`; `−(1 1; 0 1)(1 −1; 0 1) = −1`, trace `−2`, not parabolic | holds; the Check excludes the wrong model | none |
| §8.2 Check, `T = (1 π; 0 1)` | `T (1 0; 1 1) T⁻¹` | `(1 π; 0 1)(1 0; 1 1) = (1+π, π; 1, 1)`; times `(1 −π; 0 1)`: `(1+π, −π²; 1, 1−π)`, determinant `1 − π² + π² = 1`; `T(ℙ¹(ℚ(i))) = {∞} ∪ (π + ℚ(i))` | holds | none |
| §8.2 agreement with BianchiModularForms §0.4 (open head, README lines 453–462) | finite-index `Γ ≤ SL₂(𝓞_K)` | parabolic fixed point is the double root of `cz² + (d − a)z − b` over `K`, so in `ℙ¹(K)`; §0.4 takes orbits `Γ \ ℙ¹(K)` and the same stabilizer | holds | none |
| §8.2 essential cusp is a property of the orbit | `c ↦ γc` | `Γ_{γc} = γ Γ_c γ⁻¹`, `χ(γ δ γ⁻¹) = χ(δ)` | holds | none |
| §8.3 `U_i` against §8.2 `U_c` (untouched text the change cites) | `SL₂(ℤ[i])` | both `{±1, ±i}`; `φ(1) = π(−1/4)/(π/4) = −1` with `|U|⁻¹ = 1/4` | consistent | none |
| §8.4 `h` orbits with representatives `κ_1, …, κ_h` (`kubota1968` §4, lines 238–240) | `SL₂(ℤ[i])`, `χ = 1` | `h = 1`, `Φ` is `1 × 1`, `|φ(1)| = 1` | holds | none |
| Supplier contract "From TauCetiRoadmap.KleinianGroups" | Layers 0, 1, 2 at the open head | `isometry_smul`, `SMulInvariantMeasure`, `volume_eq_withDensity`; `properlyDiscontinuousSMul_of_discrete`, `hasFundamentalDomain_of_discrete`, `IsCofinite`; `isFundamentalDomain_dirichletDomain`, centre with trivial stabilizer | each clause is stated there | none |

The rows for all other statements, and for the 11 declarations of `Suggested.lean`, stand as in the previous review, of `1958ba8`.

- Source locators read against the text: 3 (`kubota1968` §2, pp. 262–263, lines 118–167; §§2–3, pp. 262–264; §4, p. 265, lines 237–240); each is at the stated section and page.
- Cross-roadmap citations resolved: KleinianGroups Layers 0, 1, 2 (open head, a new roadmap folder by another author) and BianchiModularForms §§0.3–0.4 (open head); all exist with the cited content.
- Gate at this head: every check passes (`depcheck=0`, `outside-folder=0`, build OK). Dependency check: `depcheck: 248 roadmaps, 2574 edges, 0 problem(s)`. Outside-folder diff: none.
- Elaboration: `lake env lean` on `Suggested.lean` gives 10 `declaration uses 'sorry'` warnings and nothing else; the file is unchanged since `1958ba8`, so signatures and the padding probe stand.
- Pull-request text: title, summary block and prose agree with the head; the prose names KleinianGroups Layers 0–2 as the new open supplier and what §8.2 now defines.
- Remark, no change asked: in the `T`-conjugate Check (README lines 1681–1684) "none of which" is read as the points of `π + ℚ(i)`; `∞` itself is a point of every `ℙ¹(K)`.
- Remark, no change asked: the generated `depends-on` block lists four open suppliers and not KleinianGroups, which the generated `merge-order` block and the prose do name.

Overlap check: read ExplicitNumberFields, BianchiModularForms, CongruenceSpectralGap, CharacterSumsOverFiniteFields, MaassForms, ZerosOfLFunctions, LFunctions, AnalyticNumberTheoryPartIII (the results-and-headings list is empty), and KleinianGroups for the changed passage; Möbius action, discreteness, cofiniteness, Dirichlet domains: owner KleinianGroups Layers 0–2; cusps of subgroups of `GL₂(K)`: BianchiModularForms §0.4; cusps and stabilizers of a general discrete subgroup of `SL₂(ℂ)` and groups of finite type: no other owner (KleinianGroups mentions cusps only for Bianchi groups, Layer 3), so this roadmap, §8.2.

Source independence: changed passages only; 4 passages compared with 1 source (`kubota1968` lines 118–167, 237–248), none shared beyond the mathematical terms (the roadmap is English, the source German, and §8.2 restates the stabilizer as `(u x; 0 u⁻¹)` rather than translating); largest share `openai2026quasiRH`, 67 of 149 locators as before; no layer added, removed or reordered, so the contents comparison stands: independent.

Research link: Layer 10 is Theorem 3.1 of the OpenAI 2026 preprint, the first stage of its `7/8` theorem, retold by Liu (2026); Layer 11 gives Vinogradov's conjecture (Tao 2015, Conjecture 1.1); Layers 6 and 8 are the tools of Blomer–Goldmakher–Louvel (2014) and Dunn–Radziwiłł (2024). Rests on the README and those sources.

## Not verifiable

- `kubota1968` §1, lines 95–106: the table of normal forms is lost in the extraction, so §8.2's "trace `±2`, `γ ≠ ±1`" was checked as the standard definition, not read in the source.
- `kubota1968` §2 gives the stabilizer only as "a `ℤ²` of finite index"; the form `(u x; 0 u⁻¹)` with `u` a root of unity was checked by computation, not read there.
- The items of the previous review's list are unchanged and were not re-read.

## Source issues

- none

## For the human reviewers

- Scope: the headline `11/12` half-plane rests on `openai2026quasiRH`, which README line 32 calls "an unrefereed preprint" (repository `openai/math`, revision `adc7f12`), and on `liu2026improved` (arXiv 2610.12234v2). No refereed source for it is named in the README or the cached texts.
- Licence: `openai2026quasiRH` and `openai2026quasiRHalt` were fetched from `raw.githubusercontent.com/openai/math` (line 2 of each text). The licence of that repository was not read.
- Licence: `liu2026improved` line 25 says its result is formalized in Lean ("[Liu26]"). `Suggested.lean` was not compared with that formalization.
- Supplier order: KleinianGroups, now a supplier of §§8.2–8.4, is an open pull request by another author (#432) and is not a line of the merge-order file; the dependency check reports no problem.
