# Review of DiamondEtaleCohomology (pull request #922 at 9e9df99)

**Verdict:** accepted

## Previous findings

- R01 — repaired: the nine own function-style names are gone from the README and from every open head and main (`roadmaps grep` finds none). Plain notation replaces them: “the modified topological transcendence degree `trdeg.mod(K,L)`”, “the geometric transcendence dimension `dim.trg(f)`”, “the point cohomological dimension `cd_ℓ(y)`”, and prose for the C7 and C8.42 predicates.
- R02 — repaired: `README.md:269` reads “| C4 | Imported properness API, partial properness and canonical compactification |”, which matches `README.md:16` (“imported without restatement”) and `README.md:1203`.

## Verified sound

Incremental re-review of the 64 changed lines since `e465c50`: the R01/R02 repairs in C7.1, C7.11, C7.13, C8.10–C8.19, C8.28, C8.31, C8.40–C8.42, C8.47–C8.48 and C9.14, and the reworded C4.15. `Suggested.lean` and `metadata.toml` are unchanged.

Notation: `P = Spa(C,O_C)`, where `C` is algebraically closed perfectoid of characteristic `p`. `S = Spa(C,C⁺)` has rank two, with open point `η` and closed point `s`, and sheaves on it are written `(F_s → F_η)`. `D₂ = P ⊔ P`, `M = 𝔽_ℓ` with `ℓ ≠ p`, `G` is the Gauss field `C(T)^{a∧}`, and `𝔻` is the closed unit disc.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| C4.15 (i)–(iii) | `{η} → S` | `R⁺` = integral closure of `C⁺ + m_C` = `C⁺`, so the compactification is `S`. `S → S` is partially proper, small and a diamond | holds, ECD Cor. 18.8 p. 105 |
| C4.15 limits | empty limit; `{η} ×_S {η}` | compactification of `id_S` is `S` (terminal kept). The product compactifies to `S`, and `S ×_S S = S` | holds |
| C4.15 morphisms | `f: {η} → S` over `S`; fold `D₂ → P` | first: `f` qc and not onto, `f̄ = id_S` proper and onto, consistent with “whenever” (no converse claimed). Fold: onto and qproét, `f̄` = fold, finite, so proper | holds |
| C7.1 restriction predicate | `Z = ∅`; `Λⁿ`; `⊕_ℕΛ`; `(M→0)` on `S` | true with value `0`; true with value `Λⁿ`; false (stalk not f.g.); true on `{s}`, false on `S`, since `(M→0) ≇ (N→N)` | holds |
| C7.11 filtration predicate | `P ≡ false`; simple modules in `𝔽_ℓ`-vector spaces | `F = 0`: `n = 0` works, any `F ≠ 0` fails. `𝔽_ℓ²`: length 2. `𝔽_ℓ^(ℕ)`: none. Constant `M` on `S`: `(0→M) ⊂ (M→M)`, cokernel `(M→0)` | holds |
| C7.13 spectral form | point, `Λ[0]`; `ℤ[ε]/ε²`, `Λ/ε`; `S`, `(Λ→0)` | perfect; `Tor_n = Λ/ε` for all `n`, so not perfect; strata `{s}`, `{η}` with values `Λ` and `0`, both perfect | holds |
| C8.10 `trdeg.mod` | `E = L`; `K = L`; `K ⊂ G` | `≤ topologicalTrdeg`; `0`; `1`, since a residue extension of transcendence degree 1 bars `0`. The wrong model (supremum over all `E`) gives `∞` | holds |
| C8.11 | `n = 0, 1` | `0 = 0`; `1 = 1` (Gauss) | holds |
| C8.12 | `K = L = M`; `C ⊂ G ⊂ C(T,U)^{a∧}` | `0 ≤ 0 + 0`; `2 ≤ 1 + 1` | holds |
| C8.13 | identity square; `L = K′ = G` | `0 ≤ 0`; `0 ≤ 1` | holds |
| C8.14–C8.15 | `id_P`; `𝔻 → P`; empty source | `dim.trg` values `0`, `1` (Gauss point), `⊥`. `relDim` values `0`, `1` (Gauss over rank 2), `⊥`. All inequalities hold | holds |
| C8.16–C8.18 | `Spa(G) → P`; `g = Spa(G) → P` with `f = id`; empty `Z` | `1 = trdeg.mod(C,G)`; `1 ≤ 1 + 0`. Empty `Z`: `⊥ ≤ ⊥ + x = ⊥` in `WithBot ℕ∞`. C8.17 along `∅ → P`: `⊥ ≤ 1` | holds |
| C8.19 | `⊔_{n≥1} 𝔻ⁿ → P`; identity | each component is bounded by `n` and the supremum is `∞`, so locally finite with no global bound; identity `0` | holds |
| C8.28 `cd_ℓ(y)` | `P`; `K = 𝔽_p((t^{1/p^∞}))^∧` | `P`: `G_y = 1`, value `0`. `K`: `cd_p = 1` (Artin–Schreier class of `1`), and for `ℓ ≠ p`, `cd_ℓ = cd_ℓ(G_{𝔽_p((t))}) = 2`. C8.41 does not apply: `K` contains no algebraically closed field | holds |
| C8.31 | `S`, `F = (M→0)` | `cd_ℓ(η) = 0`; `H⁰ = M`, `Hⁱ = 0` for `i > 0` (closed point, `i_*` exact) | holds |
| C8.40 | `C = C′`; Gauss; radius `r ∉ |C^×|` | `0+0 ≤ 0`; `1+0 ≤ 1`; `0+1 ≤ 1` | holds |
| C8.41 | `id_P`; `𝔻 → P` at the Gauss and type-3 points | `0 ≤ 0`; `cd_ℓ ≤ 1 + 0 ≤ 1`; `cd_ℓ ≤ 0 + 1 ≤ 1` | holds |
| C8.42 carrier of `sp_n(X)` | `S`, `n = 0, 1, 2`; two discrete points; `∅` | chains `2, 3, 4`, nondegenerate `2, 1, 0`; degree-1 chains `2`, both constant; all degrees empty | holds |
| C8.47–C8.48 | `S`, `U = {η}`, `F = (M→0)`; `U = S` | `d = 0`, `e = cd_ℓ(η) = 0`, `Hⁱ = 0` for `i > 0`; `F = 0` | holds |
| C9.14 | `D₂ → P`, `d = e = 0` | `H⁰ = M²`, `H^{>0} = 0` | holds |

The rows for untouched statements stand as in the previous review, of `e465c50`. The seeded sample, “Perfectoid field-test reduction”, lies outside the diff (`README.md:2773–2797` is unchanged) and stands as verified there.

- **Gate and build:** `gate … --base origin/main` passes every check (`depcheck=0`, `residue=0`, `statement-hygiene=0`, `outside-folder=0`). `lake env lean` on `Suggested.lean`: exit 0, exactly six `declaration uses sorry` warnings (lines 46, 80, 116, 131, 148, 173). No file outside the folder changed.
- **Dependency check:** `depcheck: 245 roadmaps, 2214 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Locators checked:** 4, in ECD (arXiv 1709.07343v4): Corollary 18.8 at ECD lines 4335–4347 (pp. 105–106), which matches C4.15 part by part; Definitions 21.5 and 21.7 at lines 5054–5070 (p. 123); Definition 21.10 at lines 5099–5102 (p. 124). ECD itself writes `dim.trg f` and `cd_ℓ y`, so the new notation is the literature's.
- **Library names and signatures:** opened at the Mathlib pin: `Topology/Spectral/ConstructibleTopology.lean:47` (`WithConstructibleTopology`, used by C8.42) and `Topology/KrullDimension.lean:37` (`topologicalKrullDim`). The `signatures.md` lead on `compactGeneration_spectral` is a false positive: its elaborated type carries `[inst_2 : HasDerivedCategory (TopCat.Sheaf (ModuleCat Λ) X)]`.
- **Cross-roadmap citations:** `AdicSpace.relDim` (C8.15) is a target of AdicEtaleGeometry §A2.6 on main (its README, line 7457). DiamondSixOperations cites `§C4.15` only as a whole and C8.16–C8.19, C8.41 and C8.48 by number, and it already writes `dim.trg`, so the renaming breaks no citation.
- **Title and description:** checked against the head. The title matches the README heading. The head contradicts no sentence of the summary block or the prose; each was checked: cutoff presentability (`README.md:884`, `:911`), arbitrary-rank stalks (`:37`), commutative `Λ` with noetherian only for constructibility (`:39`, `:1965`), compact = perfect-constructible (C9.8), the consumers (Downstream consumers), no second cohomology carrier (`:18`), the three files, and no roadmap import in the Lean. No section, headline or supplier changed since `e465c50`, so the description has nothing new to state.
- Remark: code spans that swallow a prose comma (C8.11, C8.12, C8.17, C8.18, C8.40, C8.41 “`C complete`”, C9.14) were there before this change; the renaming did not touch them. `dim.trg(f)` names both the adic invariant (C8.14) and the diamond invariant (C8.16), as ECD line 5063 does; in every use, the kind of map fixes which one is meant.

Overlap check: read DiamondSixOperations, VStackSheavesAndLisseCategories, ClassicalAdicEtaleCohomology, AdicCoefficientsAndComparisons, FarguesFontaineDiamonds, DiamondsAndVStacks, EnhancedDerivedSheaves and PerfectoidSpaces. Shared objects and owners: canonical compactification and the diamond `dim.trg` belong to this roadmap (C4.13–C4.15, C8.16), and DiamondSixOperations consumes them. Classical `dim.tr` belongs to ClassicalAdicEtaleCohomology (analytic pseudo-adic spaces, a different object). Properness belongs to DiamondsAndVStacks §D4.11, which this roadmap imports.

Source independence: changed passages only. 3 passages were compared with 1 source, ECD: C4.15 against Corollary 18.8, and the C8.14/C8.16/C8.28 definitions against Definitions 21.5, 21.7 and 21.10. At most 6 consecutive words are shared (“`Y` and `Y′` are small `v`-stacks”, forced by the statement). Largest share: ECD, about 295 of 350 locator mentions. Contents were not compared, since no layer was added, removed or reordered.

## Not verifiable

- Scheiderer 1992 and Huber 1996: as in the previous review, both are paywalled and the sources service finds no legal copy. This diff touches neither citation.

## Source issues

- none

## For the human reviewers

- **Not tested.** No review of this folder has compared the layers with ECD's contents. C0–C8 sit beside ECD §§14–21 in order. `README.md:7` says the locators prescribe no order; the description says “The route follows Scholze's *Étale cohomology of diamonds*”.
