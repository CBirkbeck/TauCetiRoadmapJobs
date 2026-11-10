# Review of EtaleCohomologyFoundations (pull request #1891 at 0cefadf)

**Verdict:** accepted

Incremental re-review of the 41 lines changed since `ae30823` (README only; `Suggested.lean` is unchanged). Both findings of the previous report are repaired, the repairs introduce no new problem, and no finding remains. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with only `sorry` warnings.

## Previous findings

- R01 — repaired: the description's merge-order paragraph now reads "This revision makes EtaleCohomologyFoundations the owner of the point count over finite extensions … and two open roadmaps change with it", naming WeilConjectures `extensionPointCount` and DeligneWeightsAndPurity `finiteFieldPointCount` with their replacements.
- R02 — repaired: `README.md` lines 633–645 pass "from `X_{k̄}` to `X_{k^sep}` first" along a universal homeomorphism (§F.0.4, Stacks 0BQN), then descend along "`X_{k^sep} = lim X_{k'}`"; the *Needs:* line (653–654) lists §F.0.4.

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** My run at `0cefadf` with `--base origin/main` printed `set_option=0 … statement-hygiene=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0; the worker's run also has `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check.** `depcheck: 236 roadmaps, 2271 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The one new edge is internal (§F.0.4 → §F.0.2, and §F.0.A2 → §F.0.4); §F.0.2 (line 312) precedes §F.0.4 (line 467), which precedes §F.0.A2 (line 613), and §F.0.2 does not cite §F.0.4, so there is no cycle between sections.
- **Elaboration.** `lake env lean TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean` exits 0; its only output is `declaration uses sorry` at lines 76, 123, 141, 156, 169, 183. The file is byte-identical to the one the previous report probed (`#check @name` for all eight declarations, one-tactic padding probe); nothing to re-compare.

### Changed passages

- **§F.0.4, finite étale covers (lines 498–503).**
  - The finiteness criterion is correct. For a universal homeomorphism `f : X → Y` and étale `V → Y`, the maps `V_X → V` and `V_X ×_X V_X → V ×_Y V` are universal homeomorphisms, so quasi-compactness, closedness of the diagonal's image and universal closedness pass in both directions between `V → Y` and `V_X → X`; with étale (locally quasi-finite), proper is finite. Essential surjectivity onto finite étale `X`-schemes comes from SchemeAndStackFoundations §0.23a's equivalence on all étale objects.
  - The fibre of `V_X` at `x̄` is the fibre of `V` at `x̄ ≫ f`, so the fibre functors agree and the automorphism groups are identified without a connectedness hypothesis; the README correctly restricts the Stacks locator to connected `X`, `Y`.
  - Stacks 0BQN is Proposition 58.8.4 (`stacks-0BMY` lines 838–842): base change is an equivalence of finite étale covers for every universal homeomorphism; the `π₁` isomorphism is stated for connected schemes. Its proof starts from "integral, universally injective, surjective" (lines 843–844), the characterisation the README quotes; Tau Ceti has it as `isUniversalHomeomorphism_iff_isIntegralHom_universallyInjective_surjective` (`TauCeti/AlgebraicGeometry/Morphisms/UniversalHomeomorphism.lean` line 162).
  - Ownership. SchemeAndStackFoundations §0.23a on main (`README.md` lines 1508–1564) constructs the equivalence of small étale sites and says nothing on finite étale covers or `π₁`. Tau Ceti at the pin has `IsUniversalHomeomorphism` but no statement on `FiniteEtaleScheme` along one (searched `AlgebraicGeometry/FiniteEtale`, `Morphisms/UniversalHomeomorphism.lean`, `Frobenius/Perfection.lean`, `Frobenius/Etale.lean`). `roadmaps grep '0BQN|0BTW'` finds only this README. This roadmap owns `EtaleFundamentalGroup`, so it is the owner.
  - `TauCeti.FiniteEtaleScheme` is at `TauCeti/AlgebraicGeometry/FiniteEtale/Basic.lean` line 66; `EtaleFundamentalGroup.map` is declared in `Suggested.lean` line 97.
- **§F.0.4, new Check (lines 512–517).** Recomputed, see the table.
- **§F.0.A2, proof sketch (lines 633–645).**
  - 0BTW is Lemma 58.14.2 (`stacks-0BMY` lines 1763–1767), and 0BTX's proof reduces to perfect `k` through it (lines 1777–1778) before using 0BTV (lines 1795–1797). 0BTV (lines 1753–1758) requires qcqs schemes with affine transition maps, as the sketch now says.
  - SGA 1 IX 6.1 is on printed p. 195 (`sga1` lines 7733–7746) and reduces to perfect `k` by Corollary 4.11 (line 7761); Corollary 4.11 is on printed p. 187 (lines 7426, 7431–7433), for a faithfully flat, quasi-compact, radicial morphism.
  - `X_{k̄}` connected gives `X_{k^sep}` connected (surjective image), so 0BQN's `π₁` clause applies.
- **§F.0.A2, new Check (lines 670–675).** Recomputed, see the table.
- **Seeded sample.** Of the sampled targets, only "The fundamental groups of a field and of `𝔾_m`" and "Decomposition and inertia groups of a cover" adjoin the change; neither is touched or made wrong by it. The others are untouched and were verified in earlier reports.
- **Overlaps and citations tools.** No other open pull request changes this roadmap; no dropped id in either direction; no cross-roadmap citation is unresolved. The twelve Lean-name leads are the four `VanishingCycles.*` theorems of `Suggested.lean` and supplier names resolved in earlier reports; the change touches none.
- **Headlines.** The six sorried headlines are unchanged. The new `π₁` invariance along a universal homeomorphism is an input to `arithmeticExactSequence`, not an end theorem, and is rightly left to the README.

### Adversarial table

Rows for the changed statements (computed this round):

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Finite étale equivalence and `π₁` isomorphism along a universal homeomorphism (F.0.4) | `Spec k^perf → Spec k`, `k = 𝔽_p(t)`; nilpotent thickening `Spec k → Spec k[ε]`; `Spec 𝔽_{p²} → Spec 𝔽_p`; identity; `X = Y = ∅`; disconnected `Y` | `k^perf/k`: `Gal` of both is the same group, degree-`p` Artin–Schreier field stays a field. `k[ε]`: finite étale algebras are `B ⊗ k[ε]`, same category. `𝔽_{p²}/𝔽_p`: `Γ = 2Ẑ → Ẑ`, index 2, not an isomorphism, and the map is excluded (self-product has 2 points). Identity: identity. `∅`: both categories terminal. Disconnected: fibre functors still correspond, since fibre of `V_X` at `x̄` = fibre of `V` at `f(x̄)`. | true | none |
| Artin–Schreier Check (F.0.4) | `y^p − y − t` over `k = 𝔽_p(t)` and over `k_n = 𝔽_p(u)`, `u = t^(1/pⁿ)` | Over `k`: `b^p − b = t` forces `p·v_∞(b) = −1`, impossible. Over `k_n`: `t − u = ℘(u^(p^(n−1)) + … + u^p + u)`, so `t ≡ u` mod `℘(k_n)`, and `u ∉ ℘(k_n)` by the same valuation count (`p·v(b) = −1`). So irreducible of degree `p` over `k^perf = ⋃ k_n`. `𝔽_{p²} ⊗ 𝔽_{p²} = 𝔽_{p²} × 𝔽_{p²}`: 2 points. | true | none |
| Proof sketch of `arithmeticExactSequence` (F.0.A2) | `k` perfect; `k = 𝔽_p(t)`, `X = Spec k`; `X = Spec k(t^(1/p))` | Perfect: `k^sep = k̄`, first step is the identity. `Spec k`: `lim X_{k'} = Spec k^sep`, `Spec k̄ → Spec k^sep` universal homeomorphism, both `π₁ = 1`. Third: next row. | true | none |
| Imperfect-field Check (F.0.A2) | `k = 𝔽_p(t)`, `L = k(t^(1/p))`, `X = Spec L` | `L ⊗_k k^sep = k^sep[y]/(y^p − t)`, a field since `t ∉ (k^sep)^p` (`t^(1/p)` is inseparable of degree `p` over `k`); it is purely inseparable over `k^sep`, hence separably closed, `π₁ = 1`. `L ⊗_k k̄ = k̄[y]/((y − t^(1/p))^p)`: one point, nilpotent `y − t^(1/p) ≠ 0`. `Gal(L^sep/L) ≅ Γ_k` by restriction. Sequence `1 → 1 → Γ_L ≅ Γ_k → 1`: exact. | true | none |

Rows carried from the previous report (r10, at `ae30823`; statements untouched by the diff):

| Statement | Values (r10) | Result |
| --- | --- | --- |
| `arithmeticExactSequence` statement (F.0.A2) | `Spec k`: `1 → 1 → Γ_k ≅ Γ_k → 1`; `Spec 𝔽_{p²}/𝔽_p` excluded by connectedness; doubled wedge excluded by `QuasiSeparatedSpace` | true |
| Quasi-separatedness Check (F.0.A2) | `e = (1 \| 1,0 \| 1,0,0 \| …)`; `φe − e`, `φ²e − e` nonconstant | true |
| Weak Serre class as five Mathlib classes (F.0.1) | `coker ℓ = ℤ/ℓ` not free; `IsSerreClass` gives all five | true |
| `cohomologyProperty` triangulated (F.1) | cone of `ℓ`: `H⁻¹ = H⁰ = ℤ/ℓ` | true |
| Smooth base change (F.2.2) | `⨆ Spec ℚ` with `ℤ/n`; `ℤ/p` in characteristic `p` excluded | true |
| Compactifiable restriction (0.8) | wedge chart not quasi-compact, no compactification | true |
| Invertible objects (F.5) | `Λ(1) ⊗ Λ(−1) ≅ Λ`; `Λ ⊕ Λ` not invertible unless the category is zero | true |
| `nagataCompactification` (G.2) | `𝔸¹ ⊂ ℙ¹`; doubled origin; `⨆_ℕ Spec k` | true |
| `etaleCohomologicalDimension` (F.3.0) | `ℙ¹_k̄`: `H² = ℤ/ℓ(−1)`, `H³ = 0`; `∅` | true |
| `affineArtinVanishing` (F.3) | `𝔸¹`, `ℤ/p`: `H¹ ≠ 0`, `H² = 0` | true |
| `finite_H_constantSheaf` (F.3) | `𝔾_m`: `H⁰ = H¹ = ℤ/ℓ` | true |
| `subsingleton_ellAdicCohomology` (F.4.4) | `ℙ¹`: `H² = ℤ_ℓ`, `H³ = 0` | true |
| `EtaleFundamentalGroup`, `.map` (F.0.2) | `Gal(K^sep/K)`; `𝔽_{p²}/𝔽_p` image of index 2 | true |
| Decomposition and inertia groups (F.0.A1) | `zⁿ`: `\|I\| = n`; purely inseparable `f = 2` | true |
| Tame character (F.3a) | `t₃\|_{I'} = e·t'₃` | true |
| Frobenius comparison (F.10.2b) | `μ_5` over `𝔽_2`: `ζ³` vs `ζ²` | true |
| Scheme.Hom.pointCount (F.10.1) | `Spec 𝔽_{q²}`: `0` at `r = 1`, `2` at `r = 2` under all three definitions; the description now names the two consumers | true |

### Library declarations and citations opened this round

- Tau Ceti (`2fd255d9`): `TauCeti/AlgebraicGeometry/Morphisms/UniversalHomeomorphism.lean` lines 64, 153, 162; `Frobenius/Perfection.lean` lines 64, 78; `FiniteEtale/Basic.lean` line 66; `FiniteEtale/Fiber.lean` lines 51, 117.
- SchemeAndStackFoundations on main, §0.23a, `README.md` lines 1508–1564 (resolved; hands sheaf transport to this roadmap).
- Sources: `stacks-0BMY` lines 838–850, 1753–1800; `sga1` lines 7426–7433, 7733–7770.

## Not verifiable

- Nothing in the changed passages. The uncertified items of earlier reports (SGA 4, SGA 4½, Huber 1996, Fujiwara 2002, Ribet 1976) are untouched.

## Source issues

- **Misprint** in sga1 at Exposé IX, proof of Théorème 6.1, p. 195: the source says the reduction passes to the separable closure of `k` in the algebraic closure; it should be the perfect (purely inseparable) closure, as Corollary 4.11 and the conclusion "`k` perfect" require; affects nothing.
- **Error** in sga1 at Exposé IX, Théorème 6.1, p. 195: the source says the sequence of fundamental groups is exact whenever the closed fibre is quasi-compact and geometrically connected; it should also assume it quasi-separated, as the limit isomorphism left to the reader requires; affects a stated result.
