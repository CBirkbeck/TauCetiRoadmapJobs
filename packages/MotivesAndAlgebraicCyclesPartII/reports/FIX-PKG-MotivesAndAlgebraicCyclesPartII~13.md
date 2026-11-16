# FIX-PKG-MotivesAndAlgebraicCyclesPartII~13: repair report

Review settled: `REV-PKG-MotivesAndAlgebraicCyclesPartII~12` (two findings, both P3). Files changed: `packages/MotivesAndAlgebraicCyclesPartII/README.md` only. `Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are unchanged: no new gap, no new source.

## F01 (P3) — applied

The finding is right. In the route of §7.5, `A` is regular noetherian: it is a quotient of a Tate algebra `C⟨T₁, …, T_m⟩`, and noetherianity of that algebra is Tau Ceti `TauCeti.MvPowerSeries.isNoetherianRing_isRestricted_subring`, elaborated at the pin. But `A` is neither a valuation ring nor a smooth `C`-algebra (witness `C⟨T⟩`). So gap:valuation-ring-k-regularity does not give `K(A) ≃ KH(A)`. On main, SchemeKTheoryOperations §5.2 (its line 1820) gives `NK_n(X) = 0` in every degree for regular noetherian `X`.

**Changes.**
- §7.5 Route: "`A` (a regular ring)" → "`A` (a regular noetherian ring, noetherian as a quotient of a Tate algebra, Tau Ceti `…isNoetherianRing_isRestricted_subring`: by SchemeKTheoryOperations §5.2 applied to `A[T₁, …, T_n]`, each map `K(A[T₁, …, T_n]) → K(A[T₁, …, T_{n+1}])` is an equivalence, so every structure map of `K(A ⊗ ℤ[Δ^•])` is one and `K(A) ≃ KH(A)`)".
- §7.5 *Needs*: §3.8 → §§3.8, 5.2, plus the Tau Ceti name.
- Layer 7 *Dependencies*: §§3.1, 3.3, 3.8 → §§3.1, 3.3, 3.8, 5.2, plus the Tau Ceti name.
- SchemeKTheoryOperations contract: new entry §5.2 (`NK_n(X) = 0` for regular noetherian `X`; iterated, `K(X) ≃ K(X × Aⁿ)`).
- Scope: adds "homotopy invariance of the K-theory of regular noetherian schemes" and §5.2.

**Pattern.** I searched the README for every use of `KH`, homotopy invariance and regularity. One more place derives `KH = K` from regularity: the first Check of §7.4 ("As `ℤ_p`, `𝔽_p` and `ℚ_p` are regular noetherian, `KH = K` on them"). It now cites SchemeKTheoryOperations §5.2. The §7.4 route and its third API bullet, §7.1 and §7.3 use only valuation rings, and gap:valuation-ring-k-regularity covers those, so I left them unchanged.

I also added a bullet to the "From Tau Ceti" contract stating the exact hypotheses of `TauCeti.MvPowerSeries.isNoetherianRing_isRestricted_subring`: a normed division ring with `IsUltrametricDist` and `CompleteSpace`, finite `σ`, every `c i > 0`, and Mathlib's `MvPowerSeries.IsRestricted.subring c`. The Scope bullet on Tau Ceti now has a matching sentence.

## F02 (P3) — applied

The finding is right. Old Check 3 described an element whose colimit norm `r` is approached by stage norms `r + 1/n`. That is exactly the first Check's phenomenon in seminormed rings, where `ℤ[T]_{r′} → ℤ[T]_r` stays weakly compact. So it did not separate the two categories. I replaced it with the review's witness in my own wording. With `Z_n = ℚ_p⟨x₁, …, x_n⟩`, `Z = ℚ_p⟨x₁, x₂, …⟩` and `z = Σ pⁿ x_n`, the composite `ℤ⟨T⟩_{r′} → ℤ⟨T⟩₁ → Z` (`T ↦ z`) factors through no `Z_n`. The new Check also says why seminormed rings escape this: their colimit is the uncompleted union, which does not contain `z`.

**Pattern.** The other appeal to compact assembly is the route of §1.1 (README line 278). It applies §0.1 to seminormed rings and handles completion through approximate relations. It makes no claim about Banach rings, so it is unchanged. The route sentence of §0.1 ("The assertion is not made for Banach rings") agrees with the new Check.

## Checks run

- `lake env lean packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, run from the content checkout: exit 0, no output. The file is unchanged: `import Mathlib`, the module docstring, an empty namespace.
- `#check @name` audit: `Suggested.lean` declares nothing, so there is nothing to compare. I elaborated `#check @TauCeti.MvPowerSeries.isNoetherianRing_isRestricted_subring` in a scratch file against the pinned Tau Ceti. Result: `∀ {σ} {c : σ → ℝ} [∀ i, Fact (0 < c i)] {K} [NormedDivisionRing K] [IsUltrametricDist K] [CompleteSpace K] [Finite σ], IsNoetherianRing ↥(MvPowerSeries.IsRestricted.subring c)`. This matches the new contract bullet. `MvPowerSeries.IsRestricted.subring` is Mathlib/RingTheory/MvPowerSeries/Restricted.lean:159 at the pin.
- Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 257 roadmaps, 2448 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. Lean names outside TauCetiRoadmap were not checked by the tool on this host; I checked the one new name by elaboration (above).
- House style: the changed lines contain no LaTeX delimiters, no machine paths and no process vocabulary.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §7.5 route: `A` regular noetherian, `K(A) ≃ KH(A)` by §5.2 | `A = C`; `A = C⟨T⟩`; `A = 0`; negative control `C[ε]/ε²` | `C`: field, `m = 0`, `NK = 0`. `C⟨T⟩`: PID; `(T)`, `(T − 1)` incomparable, so not a valuation ring; not finitely generated over `C`; §5.2 applies, the valuation gap does not. `0`: `K(0) = 0 = KH(0)`. `C[ε]/ε²`: not regular, `[1 + εT] ≠ 0` in `NK₁` (SchemeKTheoryOperations §5.6 Check), so `K ≠ KH`; it is excluded because its `A_{≤1}` is not the completion of a smooth `O_C`-algebra | Regularity is needed and holds; applied. |
| Noetherian: `A` is a quotient of `C⟨T₁, …, T_m⟩` | `R = O_C[x]/J` finitely presented smooth; `A_{≤1} = R̂` | `O_C⟨x⟩ → R̂` is onto (onto mod `π`, both `π`-adically complete); `A = R̂[1/π]`, since `|π^k a| ≤ |π|^k |a| ≤ 1` for `k` large; so `A = C⟨x⟩/I`. Hypotheses of the Tau Ceti theorem: `C` complete, ultrametric, `c = 1 > 0`, `σ = Fin m` finite (also `m = 0`) | Holds. |
| Simplicial step: all structure maps of `K(A ⊗ ℤ[Δ^•])` are equivalences | `n = 0, 1, 2` | `ℤ[Δⁿ] ⊗ A ≅ A[T₁, …, T_n]`; `A[T₁, …, T_n]` is regular noetherian (Hilbert basis, regularity of polynomial rings); `A → A[Δⁿ]` is an equivalence on `K` by §5.2 iterated; face maps are `A`-algebra maps, so 2-out-of-3 gives that they are equivalences; realization is `K(A)` | Holds. |
| §7.4 Check 1 with §5.2 | `ℤ_p`, `𝔽_p`, `ℚ_p` | DVR, field, field: regular noetherian, so `NK = 0`; `fib(K(ℤ_p) → K(𝔽_p))` has `π₀ = 0` (`K₀` iso `ℤ → ℤ`, `K₁` onto `ℤ_p^× → 𝔽_p^×`) and `π₋₁ = 0`; the fibre variant gives `ℚ_p^×/(1 + pℤ_p) ≅ ℤ × 𝔽_p^×`, with `p = 2`: `ℚ₂^×/(1 + 2ℤ₂) = ℤ`, `𝔽₂^×` trivial | Values unchanged; citation added. |
| Contract §5.2 | `X = Spec k`; `X = Spec k[ε]/ε²` | `K(k) ≃ K(k[T])`; dual numbers not regular, `NK₁ ≠ 0` | Hypothesis "regular" is necessary, as stated. |
| §0.1 new Check 3 | `p = 2`, `p` odd; `r′ = 1` excluded; the same tower in seminormed rings | `|z| = sup_n p^{−n} = 1/p ≤ 1`; coefficient of `x_{n+1}` is `p^{n+1}`, `|p^{n+1}|_p = p^{−n−1} ≠ 0`, so `z ∉ Z_n`; `ℤ → ℚ_p` contractive as `|m|_p ≤ 1 ≤ |m|`; `ℤ⟨T⟩_{r′} → ℤ⟨T⟩₁` contractive as `Σ|a_i| ≤ Σ|a_i| r′^i`; a factorization through `Z_n` would send `T` to `z`; in seminormed rings the colimit `∪ Z_n` has no element `z`, so no map `T ↦ z` exists and nothing fails there | Separates the two categories; applied. |

## Ownership and maintainer notes

- Homotopy invariance of the K-theory of regular noetherian schemes is owned by SchemeKTheoryOperations §5.2 on main. This roadmap cites it and states nothing about it.
- Noetherianity of Tate algebras is at the Tau Ceti pin (`TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Groebner.lean`).
- No other roadmap's ownership changes. No name this roadmap defines changed: `Suggested.lean` declares nothing.
- No new source, so `sources.toml` is unchanged, and nothing is requested in `needs-references.toml`.
- No text in the review asked for anything outside this package. Its "For the human reviewers" section (the retracted `affinoid-line-bundles` announcement; ownership of compactly assembled ∞-categories against the open PresentableInfinityCategories) lists no finding, so I changed nothing for it.
