# FIX-PKG-LogicAndDefinabilityInNumberTheoryPartII~8

Findings of REV-PKG-LogicAndDefinabilityInNumberTheoryPartII~7. There is one review, so the ids are plain. Files changed: `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md`, and the `locator` of the `stacks` entry of `packages/LogicAndDefinabilityInNumberTheoryPartII/sources.toml`. `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

## F01 (P3) — applied differently

- **Scope.** Added QuadraticFormInvariantsPartII §2.5 and a ClassicalAdicEtaleCohomology §11.2 bullet. AnalyticNumberTheoryPartI §0.21 goes into the "On main" bullet, not a new bullet.
- **Contracts.** Added §2.5 (Springer) to the QuadraticFormInvariantsPartII paragraph and §11.2 under "other earlier roadmaps". JacobianChallenge §F.1 and AnalyticNumberTheoryPartI §0.21 go under "roadmaps on main".
- **Names.** Supplier declarations are fully qualified.

Why "differently": AnalyticNumberTheoryPartI is on main (its folder is in the content checkout), so it belongs under "on main", not "other earlier roadmaps" as the review proposed. The supplier names are written in full (`TauCetiRoadmap.QuadraticFormInvariantsPartII.anisotropic_extendScalars_of_odd_finrank`, `TauCetiRoadmap.ClassicalAdicEtaleCohomology.field_cohomological_dimension_transcendence`) so they cannot be read as names of this roadmap. JacobianChallenge F.1 needs a rational point, so the contract calls it the *pointed* curve case of 0.8a.

**Evidence.**
- ClassicalAdicEtaleCohomology §11.2 (open, earlier in the merge order) states `cd_ℓ(L) ≤ cd_ℓ(K) + trdeg_K(L)` for every field extension and every prime ℓ, with infinite values allowed.
- AnalyticNumberTheoryPartI §0.21 on main: "There is a real `B` …" for `x ≥ 2`.
- QuadraticFormInvariantsPartII §2.5: `anisotropic_extendScalars_of_odd_finrank`, inseparable extensions included.
- JacobianChallenge §F.1: the Abel–Jacobi morphism for a pointed curve, and `isAlbanese_abelJacobi`.

**Pattern search.** Every roadmap the README cites was counted in the scope and the contracts. After the change every roadmap occurs in both, and every QuadraticFormInvariantsPartII, LocalFieldsRamificationPartII and EllipticCurves section cited in the body occurs in the scope.

## F02 (P3) — applied

- "Dittmann–Pop, proof of Proposition 5.1, p. 16, citing Matsumura, Theorem 11.5" → "Dittmann–Pop, proof of Proposition 5.1, p. 16" (§6.3).
- Same pattern in §1.4: "(Jannsen, p. 5, citing Jannsen–Saito)" → "(Jannsen, p. 5)". Jannsen–Saito is also a work the manifest does not record.

The remaining locators carry both claims:
- Stacks tag 031T, and `dittmann_pop line 711` for its use.
- `jannsen_hasse lines 195–197`: vanishing of `H^a` for every smooth projective `X` and `0 < a ≤ 4`. That is the README's "`d ≤ 4`" with `a = d`.

## F03 (P3) — applied

- Every chapter-level citation became "Stacks, Theorem 54.14.5, tag 0BGP" together with §54.1 (tag 0ADX), which supplies the theorem's condition (4). The changed places are Conventions, §1.4 and its Needs, §1.5 and its Needs, the Layer 1 Dependencies, §5.4 and its Needs, the Layer 5 Dependencies, the References and the manifest `locator`.
- §1.4 now gives the argument: the model is projective, and regular implies smooth over `𝔽₂`.
- §1.5 now gives the argument for the generic fibre and for flatness.

**Evidence.** The Resolution of Surfaces chapter text was fetched for `stacks` (tag 0BGP):
- Lines 1880–1888: Theorem 14.5, condition (4) ⇔ resolution by normalized blow-ups.
- Lines 33–38 (§1, tag 0ADX): (4) holds for 2-dimensional schemes of finite type over a field or over a Dedekind domain of characteristic zero.
- Lines 1752–1759: Definition 14.2, so the resolution is proper over `Y`.

**Correction to the review's wording.** For §5.4 the review proposed nothing beyond the locator. My first wording, "changes nothing outside finitely many closed points", is false. For example `Y: x²w = y²z` in `ℙ³` is the closure of the normal chart `y = 1` (`z = x²w`, an `𝔸²`), but it is non-normal along the line `x = y = 0` at infinity. The final wording, "an isomorphism over the normal affine model away from finitely many closed points", is true.

## Adversarial pass on the changed text

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.4, `d = 2` model by 0BGP | `K = 𝔽₂(s,t)`; `K = Frac 𝔽₂[s,t,u]/(u²+st)`; `K = 𝔽₄(s,t)` | `Z = ℙ²`, regular, no blow-up. Second: partials `(t, s, 2u = 0)`, singular only at `s = t = u = 0`, one point, normal (hypersurface, R1), so (4) holds. Third: `ℙ²_{𝔽₄}` over `𝔽₂` is regular and smooth because `𝔽₄/𝔽₂` is separable; it is not geometrically connected, which Jannsen's theorem does not need | holds | none |
| §1.5, regular proper flat model | `E: y²z = x³ − xz²` over `ℤ` | mod 2 the gradient is `(x²+z², 0, y²)`, giving `(1:0:1)`; at `x = 1+a` the local equation `y² − 2a − 3a² − a³ ∈ 𝔪²`, so a singular closed point in the fibre at 2. The generic fibre `E/ℚ` is smooth and untouched. `𝒳` is integral and dominant over `Spec ℤ`, hence torsion-free and flat | holds | wording on normalization added |
| §5.4, resolution keeps `O_v` | `A′ = 𝔽₂[s,t]`, `t`-adic `v`; `Y: x²w = y²z` | `ℙ²`: nothing changes, and `O_v` is the local ring of `{t = 0}`. For `Y`, `x²−y²z ∈ (x,y)²` at the generic point of `x = y = 0`, so `Y` is not normal along a curve at infinity, yet it is an isomorphism over the chart `y = 1` | new wording true, old draft false | wording fixed |
| 0.6(c) with ClassicalAdicEtaleCohomology §11.2 | `k = ℚ(i)`, `K = k(t)`, `r = 1`, `ℓ = 2` | `cd₂(k) ≤ 2`, so `cd₂(K) ≤ 3 < 4 = r + 3`. A 4-fold Pfister form has invariant in `H⁴ = 0` and is isotropic. `⟨⟨1,1,1,1⟩⟩` is isotropic since `−1 = i²` | holds | none |
| 0.11(a) with §0.21 | `x = 100` | `Σ_{p≤100} 1/p ≈ 1.8028`; `log log 100 + B ≈ 1.527 + 0.2615 = 1.789`; difference `0.014 ≤ C/4.61` | `O(log log x)` follows | none |
| 0.6(a)–(b) with §2.5 | `⟨1,1⟩/ℚ`, `L = ℚ(∛2)`; `⟨1,t⟩/𝔽₃(t)`, `s³ = t` | degree 3: stays anisotropic; `−t = s²·(−s)`, and `−s` is not a square in `𝔽₃(s)` | Springer covers purely inseparable odd steps | none |
| 0.8a with JacobianChallenge F.1 | `ℙ¹`; elliptic curve `(E, O)` | `Jac = 0`, every pointed map is zero (agrees with the 0.8a Check `Alb_{ℙⁿ} = 0`); `a` is an isomorphism and `φ = f∘a⁻¹` | pointed curve case only | "pointed" added |
| §1.4 remark (Jannsen p. 5) | `d = 4`, `d = 5` | `a = d = 4 ≤ 4` is covered; `5` is not. `H_d` still assumes `RS(𝔽₂)` for `d > 3`, because the model's existence is conditional | consistent | none |

## Checks

- **Elaboration.** `lake env lean packages/LogicAndDefinabilityInNumberTheoryPartII/Suggested.lean`, run from the content checkout, exits 0. The only output is eight "declaration uses `sorry`" warnings, at lines 54, 62, 73, 81, 93, 113, 128 and 139. The file was not changed.
- **Signatures.** `#check @name` was run for all ten declarations in one scratch copy, elaborated once, exit 0. Every elaborated type is identical to the worker's `signatures.md` up to the display of the opened `FirstOrder` namespace. Each agrees with its README statement (§§0.1, 0.2, 0.8, 0.10(e), 0.13, 0.14(b), 5.7, 6.9, 8.4, 8.5). No binder was lost and nothing changed.
- **Citations.** `roadmaps resolve` on the README finds no unresolved cross-roadmap citation and no unresolved Lean name.
- **Dependency check:**

```text
depcheck: 241 roadmaps, 2262 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

## For the maintainer

- **`stacks` manifest entry.** Only the `stacks` `locator` changed. Its fetch fields still record the Varieties chapter (tag 056V). The Resolution of Surfaces chapter was read through the sources service against a scratch copy of the manifest; on the live manifest the service would have replaced the entry's url and sha256.
- **Names.** No name of this roadmap changed.
- **New supplier citations.** ClassicalAdicEtaleCohomology is the only supplier cited here that is still an open pull request; it is earlier in the merge order.
- **Ownership against open pull requests** was checked through the roadmap service index only.
- **Suspicious text.** None was found in the review.
