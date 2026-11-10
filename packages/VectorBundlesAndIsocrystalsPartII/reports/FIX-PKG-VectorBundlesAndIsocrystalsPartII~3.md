# FIX-PKG-VectorBundlesAndIsocrystalsPartII~3

Repair of the five findings of REV-PKG-VectorBundlesAndIsocrystalsPartII~2. All five were verified against the sources, the roadmap's own definitions and the cited roadmaps; all five are right and repaired. Edited: `packages/VectorBundlesAndIsocrystalsPartII/README.md`, `packages/VectorBundlesAndIsocrystalsPartII/Suggested.lean`, `packages/VectorBundlesAndIsocrystalsPartII/sources.toml` (two locator strings). `design/plan.json` and `metadata.toml` are unchanged (no supplier gap was added or removed).

## R01 (P1) — applied

Verified. CN25 line 1061 defines `E_α` as the normalized `p^n`-th root of `exp(p^n αX)`, so at odd `p` `E_1` is a `p`-th root of `exp(pX)` (formally `exp(X)`, not a Tate series), and at `p = 2` `E_2` is a square root of `exp(4X)`. The old §3.4 put `E_1` in `1 + pℤ_p{X}` and adjoined `E_1^(1/p^n)` at level `n`, which makes level 0 non-trivial and the first geometric degree `p²`.

Change (§3.4): old "tower adjoins `p^n`-th roots of `E_1` (`E_2`); `E_1 ∈ 1 + pℤ_p{X}`; `Γ` identified with `ℤ_p` through `ψ_1`; coefficient = invariant part of the value at `γ`; eigenlines `C{X}E_1^(1/p)`, `C{X}E_2^(1/2)`" → new "base unit `A = exp(pX) = E_1^p` (`exp(4X) = E_2²` at 2); level `n ≥ 1` adjoins `μ_(p^n)`, `p^(1/p^n)`, `A^(1/p^n)`; `κ = pψ_1` (`4ψ_1 = 2ψ_2`); coefficient divided by `ψ_1(γ)`; eigenlines `C{X}E_1`, `C{X}E_2`; Needs adds §3.3". §3.1 now states the normalization `χ_a(σ)^♭ = ε^(ψ_a(σ))` via the compatible roots `E_(a/p^k)` and gains a Check on the lattice `ψ_1(H_C) = p^(−1)ℤ_p` (`(1/4)ℤ_2`). The first-level Check now reads 6/3/18 at `p = 3` with `E_1^(1/p)` as the negative control (9, 54), and 2/2/4 at `p = 2`. The coefficient of `ψ_1` is renamed `λ` so that `g` denotes only the primitive of the bound. Layer 3 Examples gain the `p = 3` first-level example. The framed `B₂` parameter 1 of §3.7 is unchanged: `(σ−1)(v̂ log[E_1^♭]) = v̂·t·ψ_1(σ)` holds for whatever lattice `ψ_1` has.

Other places checked for the same construction: §3.2 (its `Y_n` use `E_(1/p^n)` and `E_(2/2^n)`, already the roots of `A`), §3.3 Checks (`E_2 = E_1²` at `p = 2`, `ψ_1(σ) = 1` lies in `(1/4)ℤ_2`), §§3.6–3.8 (only `ψ_1` and the `B₂` normalization, unaffected). No other occurrence.

## R02 (P2) — applied

Verified. PadicPeriodRings §1.1 (`TauCetiRoadmap/PadicPeriodRings/README.md`, "The Galois action on `ℂ_p`", at the head of its open pull request) owns the extension of each `σ` to `ℂ_p` by `UniformSpace.Completion.map σ`, its uniqueness, isometry, composition law and joint continuity. Its `Suggested.lean` defines the same map. PadicPeriodRings is earlier in the merge order and already a supplier here.

Change: `galoisAct` deleted from `Suggested.lean`; `SemilinearRep.act_smul` and the `hη` hypothesis of `fundamental_extension_surjective` now use `UniformSpace.Completion.map σ` directly. No roadmap module is imported. README: the Scope sentence that claimed ownership of `galoisAct` (and "No other roadmap constructs these objects") now owns only `SemilinearRep`. A new deferral bullet names PadicPeriodRings §§1.1–1.2. The "API of `galoisAct`" block is gone; Conventions write `σ̂` for the supplied action. The four Checks are restated as `SemilinearRep` Checks, with a `p = 2` witness `σ̂(i) = −i`. The PadicPeriodRings supplier contract adds §§1.1–1.2. The Mathlib rows, the §0.2/§1.8 Needs lines and the Layer 0/1 Dependencies now cite PadicPeriodRings §1.1 instead of `galoisAct`.

`SemilinearRep` is kept: no roadmap on main or at an open head defines continuous semilinear `ℂ_p`-representations as an object. PadicHodgeTheory §4.4 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7 take them as the input of the Sen functor. They do not construct them.

## R03 (P3) — applied

Verified. CN25 Definition 3.5 (line 599) defines curvature `> 0` by `Hom(W, V₁) = 0`. For `q : C → C/ℚ_p` and a BC map `f : C/ℚ_p → C`, `f∘q` is multiplication by some `a` with `a·1 = 0`, so `f = 0`. Also `ht(C/ℚ_p) = −1`, and CN25 Corollary 3.20 (lines 866–869) excludes negative curvature at positive height only, so curvature `> 0` is consistent. `C/ℚ_p = B₁/ℚ_p` is the first case of CN25 Proposition 4.25 (line 1423).

Change (§5.2 Checks): old "`C/ℚ_p` has curvature `< 0` and is not covered" → new bullet: `C/ℚ_p` has curvature `> 0` and is covered. Restriction `(M₂/M₁)[t] → M₂/M₁` is the inclusion of the `t`-torsion, so `Hom = 0`; for `P = [0 → C]` it is the identity of `C`. The suggested wording "identity on `M₂/M₁`" was made exact: by §4.12 the source group is `(M₂/M₁)[t]`, not `M₂/M₁`. Other `C/ℚ_p` statements (lines on height −1, §§6.1, 6.6, 6.7) already treat it as outside nonpositive curvature and are consistent.

## R04 (P3) — applied

Verified: Fontaine03 line 2134 begins printed p. 337 and Proposition 4.4 is at line 2138. Change (§0.3): "Proposition 4.4, p. 336" → "p. 337".

Same pattern, checked by mapping every Fontaine03 heading to its printed page (`page N` ↔ p. `284 + N`):
- §1.3: `π_t` and `t′` are on p. 296, at lines 477–481 (§2.1 starts at line 475, page 12). `χ^(α)` is in §2.3, line 896, p. 306. The generalized invariants `W_(i,n)` are in §2.5, line 990, p. 308. The statement locator "§§2.1–2.2, pp. 297–311" → "§2.1, p. 296, §2.3, p. 306, and §2.5, p. 308"; the proof-route locator "§2.1, p. 297" → "§2.1, p. 296".
- §1.9: Théorème 4.1 is at lines 1816–1820, on p. 329 only (p. 330 starts at line 1826). "pp. 328–329" → "p. 329".
- `sources.toml` Fontaine03 locator: "§1.4, Theorems A–C … §2.1, p. 306 … Theorem 4.1, pp. 328–329" → "§§1.3–1.4, Theorems A–C, pp. 290–291; §2.1, p. 296; §2.3, p. 306; §2.5, p. 308; §4, Theorem 4.1, p. 329, Propositions 4.2 and 4.4, pp. 333 and 337; §§5–6". Théorème A (line 213) is in §1.3, and §1.4 starts at line 257.

Checked and kept: Théorème A p. 290, A′ p. 291, B and C p. 291, D pp. 291–292 (the definition of "presque scindée" is on p. 291, line 278), §1.2 p. 289, §1.4 p. 291, Proposition 4.2 p. 333, p. 340, Théorème 2.14 p. 309, Propositions 6.4–6.5 p. 357, Théorème 6.1 p. 355.

## R05 (P3) — applied

Verified. Main's `TauCetiRoadmap/AlgebraicVectorBundles/README.md` has Layers 1–4: Layer 1 is pullback along morphisms of ringed spaces, Layer 2 is flat pullback and base change of internal Hom. It has no L0–L2 labels. Its Scope lists the pinned Tau Ceti module-sheaf and vector-bundle foundations it consumes.

Change (Scope): "AlgebraicVectorBundles, Layers L0–L2: generic sheaf-theoretic … pullbacks" → "AlgebraicVectorBundles, Scope and ownership and Layers 1–2: module-sheaf pullback with its strong monoidal comparison, flat pullback exactness and internal-Hom base change; its scope names the pinned Tau Ceti foundations". No Needs line used the old labels.

Same pattern: `sources.toml` (Schneiders99 locator) cited "LocallyAnalyticDistributions L0". That roadmap's left heart is §0.0, "Nonarchimedean topology, exact categories and completed tensors", in its Layer 0, so the label became "§0.0". Every other letter-prefixed label in the README was checked against its roadmap and resolves: PerfectoidSpaces P1/P3/P6 on main, PerfectoidTowers §P9.6, ArithmeticGaloisDuality §§R02.1.3/D7.4/R02.2.1 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2.

## Checks

**Elaboration.** `lake env lean packages/VectorBundlesAndIsocrystalsPartII/Suggested.lean`, run from the content checkout: exit 0. The only warnings are `Suggested.lean:62:8` and `Suggested.lean:85:8: declaration uses sorry`. No `TauCeti.*` import; nothing needed building.

**Signatures.** A scratch copy with `#check @SemilinearRep`, `#check @SemilinearRep.act_smul`, `#check @semilinearRep_equivariant_map_smul` and `#check @fundamental_extension_surjective` elaborated once. Compared with Conventions, §0.2 and §1.8, every binder is present: `[Fact p.Prime]`, `[FiniteDimensional ℚ_[p] K]`, finite `ℂ_p`-dimension and `IsModuleTopology` on `W₁`, `W₂`, `W`, `[CompleteSpace E]`, `[FiniteDimensional ℚ_[p] V]`, `finrank ℂ_[p] W = 1` and all `q`/`η` hypotheses. The only change is `galoisAct p σ` → `UniformSpace.Completion.map ⇑σ` in `act_smul` and `hη`. This is the same map by definition, since `galoisAct` was defined as it.

**Dependency check** (prescribed command, `--movable`):

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

**Citations.** `roadmaps resolve` on the README found no unresolved cross-roadmap citation and no unresolved Lean name.

**Ownership.** Checked against main and the open heads with `roadmaps grep`/`roadmaps show`, by object:
- the completed Galois action: PadicPeriodRings §1.1 (R02);
- semilinear `ℂ_p`-representations: no constructor elsewhere;
- `galoisAct`: cited by no roadmap.

## Adversarial pass on the new and changed text

| Statement | Instances tried | Values computed | Result / change |
| --- | --- | --- | --- |
| §3.4 `A ∈ 1 + pℤ_p{X}` (odd), `1 + 4ℤ_2{X}` (p = 2) | p = 3, k = 1, 2, 3, 6, 9; p = 2, k = 1, 2, 3, 4 | v₃(3ᵏ/k!) = 1, 2, 2, 4, 5; v₂(4ᵏ/k!) = k + s₂(k) = 2, 3, 5, 5 | All ≥ 1 (resp. ≥ 2) and tend to ∞; stated |
| `E_1`, `E_2` not in `C{X}` | coefficient of `X^(pʳ)` in exp(X) (p = 3); of `X^(2ʳ)` in exp(2X) | v₃(1/3ʳ!) = −(3ʳ−1)/2 → −∞; v₂(2^(2ʳ)/(2ʳ)!) = 1 | Neither tends to ∞; stated |
| First level, odd p | p = 3 | [ℚ₃(ζ₃,3^(1/3)):ℚ₃] = 6; [C{X}[E_1]:C{X}] = 3; total 18; with `E_1^(1/3)` 9 and 54 | Check rewritten |
| First level, p = 2 | p = 2 | μ₂ ⊂ ℚ₂; [ℚ₂(√2):ℚ₂] = 2; [C{X}[E_2]:C{X}] = 2; total 4 | Check added |
| `κ = pψ_1`, `κ = 4ψ_1 = 2ψ_2` | σ with σ(A^(1/pⁿ)) = ζ_(pⁿ)^c A^(1/pⁿ) | odd: χ_1(σ)^♭ = (ζ_p^c, ζ_(p²)^c, …) = ε^(c/p), so ψ_1 = c/p, κ = c; p = 2: χ_1(σ)^♭ = ε^(c/4), χ_2(σ)^♭ = ε^(c/2) | Lattices p⁻¹ℤ_p, (1/4)ℤ₂, (1/2)ℤ₂; §3.1 Check added |
| Coefficient of ψ_1 | cocycle ψ_1; zero cocycle; γ with κ(γ) = 1 | ψ_1(γ) = 1/p (1/4); value/ψ_1(γ) = 1; unchanged value would give 1/p (1/4); zero gives 0 | Divided by ψ_1(γ); Check rewritten |
| Eigenlines | C{X}E_1 at p = 3; C{X}E_2 at p = 2; C{X}E_1^(1/3) | γ acts by ζ₃, so ‖(γ−1)⁻¹‖ = 3^(1/2) ≤ 3; by −1, so 2 = 2; by ζ₉, so 3^(1/6) | Check rewritten; comparison with the constant p only as "at most" |
| B₂ parameter (§3.7) under the new lattice | v = 1; split extension | (σ−1)(v̂ log[E_1^♭]) = v̂ t ψ_1(σ) gives λ = 1; split gives 0 | Unchanged |
| §3.3 Check with new lattice | p = 2, ψ_1(σ) = 1 | 1 ∈ (1/4)ℤ₂; ψ_2(σ) = 2; χ_2 = χ_1² | Consistent, unchanged |
| `SemilinearRep` over `UniformSpace.Completion.map σ` | σ = id; K = ℚ_p, χ(σ) = a, p odd; p = 2, χ(σ) ≡ 3 mod 4; trivial action on ℂ_p | map id = id; σ̂(ζ_p) = ζ_p^a ≠ ζ_p for a ≢ 1; σ̂(i) = −i; trivial action gives ζ_p = ζ_p^a, false (i = −i, false) | Checks restated; p = 2 witness added |
| ℂ_p(1) vs ℂ_p | equivariant ℂ_p-linear f(x) = bx | b ∈ H⁰(G_K, ℂ_p(−1)) = 0 | f = 0; unchanged |
| §5.2 `C/ℚ_p` | P = [0 → C]; P = [0 → B₂]; dense Pair | Hom(C/ℚ_p, C) = 0 (a·1 = 0); ht = −1 ≤ 0; restriction C → C is the identity; tB₂ ↪ B₂ injective; (M₂/M₁)[t] ↪ M₂/M₁ injective | Curvature > 0, covered, Hom = 0; Check fixed |
| §0.3 locator | Fontaine03 lines 2134–2142 | Printed p. 337 header at 2135; Prop. 4.4 at 2138 | p. 337 |
| §1.3 locators | Fontaine03 lines 475–481, 896, 987–990 | Pages 12, 22, 24, i.e. printed 296, 306, 308 | Fixed |
| §1.9 locator | Fontaine03 lines 1816–1826 | Thm 4.1 at 1816 on page 45 (printed 329); page 46 starts at 1826 | p. 329 |
| Scope deferral to AlgebraicVectorBundles | Its headings at lines 388, 472, 620, 805 | Layers 1–4 only, no L-labels | Layers 1–2 |

## For the maintainer

- `TauCetiRoadmap.VectorBundlesAndIsocrystalsPartII.galoisAct` is deleted. No roadmap on main or at an open head cites it; the only `galoisAction` hits are unrelated declarations of other roadmaps.
- The action of `G_K` on `ℂ_p` is now consumed from PadicPeriodRings §§1.1–1.2. That roadmap is still an open pull request and earlier in the merge order; it was already a supplier, so no new dependency edge arises.
- §3.1 now fixes the normalization of `ψ_a` explicitly. As a result `ψ_1` is `p⁻¹ℤ_p`-valued at odd `p` and `(1/4)ℤ_2`-valued at `p = 2`. Consumers that read `ψ_1` as `ℤ_p`-valued should use `κ` of §3.4. CstConjectureForDaggerVarieties imports the Layer 2–6 objects, not `ψ_1`, so nothing there changes.
- No suspicious instruction was found in the review text or in any fetched roadmap.
