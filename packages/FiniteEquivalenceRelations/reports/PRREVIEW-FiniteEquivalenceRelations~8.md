# Review of FiniteEquivalenceRelations (pull request #1929 at 22fb4a2)

**Verdict:** accepted

Incremental re-review of the 42 lines changed since d6cebfb (README only; `Suggested.lean` is unchanged). There are no findings. Both findings of the previous review are repaired as requested, and the repairs introduce nothing new.

## Previous findings

- R01 — repaired: line 486–487, “*Needs:* 0.2, 1.3, 3.1, Mathlib `Ideal.Quotient`, `MvPolynomial`, `Module.finrank`.” after the non-effectivity target; lines 502–503, “*Needs:* 0.1, 1.1; 1.3 to read the conclusion as effectivity.” after `eq_differenceIdeal_of_sq_eq_bot`.
- R02 — repaired: Summary lines 16–17 state the square-zero theorem; Owned here lines 38–40 name it (3.2); How to read the build lines 210–215: “the non-effectivity of 3.2 and the obstruction of 3.3 are finite computations.”

## Verified sound

**The changed passages.**

- Summary, lines 16–17: “for `k` a field and `A = k ⊕ V` with `V` an ideal and `V² = 0`, every equivalence ideal `I` equals `J(B)`”. `B = A^R` is fixed at line 8. No finiteness is claimed, which matches the Lean signature (`Suggested.lean` lines 267–269: `V ^ 2 = ⊥`, `∀ a, ∃ c, a - algebraMap k A c ∈ V`, `IsEquivIdeal k A I`, conclusion `I = differenceIdeal k A I`, no `FiniteDimensional`).
- Owned here, lines 38–40, and How to read the build, lines 210–211: the same statement, both pointing at 3.2. They agree with the target at lines 489–503 and with the module docstring (`Suggested.lean` lines 34–37).
- *Needs:* of `not_isEffectiveEquivalenceRelation_raicuArtin` (lines 486–487). The statement (`Suggested.lean` lines 252–255) uses `raicuArtinRelation`, the image of `raicuIdeal` (3.1) under the quotient map (0.2), over `MvPolynomial (Fin 2) k ⧸ raicuArtinIdeal k`. The route goes through the criterion of 1.3 and a rank comparison (`Module.finrank`). Each listed item is used and nothing used is missing (1.1 enters through 1.3).
- *Needs:* of `eq_differenceIdeal_of_sq_eq_bot` (lines 502–503). The route (lines 493–502) uses `I ⊆ ker μ`, the ideal property and `incl₁₃ (I) ⊆ incl₁₂ (I) + incl₂₃ (I)` (0.1) and `invariants`, `differenceIdeal` (1.1). It uses no Raicu ideal, no restriction, no `MvPolynomial`, no `finrank`. 1.3 is needed only for the sentence “when `A` is finite-dimensional, this is effectivity by 1.3”, as the line says.
- Layer 3 Dependencies (line 580, “Layers 0 and 1; Mathlib `MvPolynomial`, `ZMod`, `AddMonoidAlgebra`”) still covers both *Needs:* lines.
- No process word, pull-request number, LaTeX delimiter or new backticked name entered with the change. The only backticked names of this roadmap in the changed lines, `eq_differenceIdeal_of_sq_eq_bot` and `differenceIdeal`, are declared in `Suggested.lean`.

**Gate, build and order.**

- I reran `gate … --base origin/main`: every count is 0, result `OK` (the worker's gate, with the targeted build, also passed).
- Dependency check with the brief's command: `depcheck: 236 roadmaps, 2262 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean`: exit 0, exactly 22 warnings, all “declaration uses `sorry`”.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/FiniteEquivalenceRelations'` is empty. `git diff --stat d6cebfb HEAD` touches only `TauCetiRoadmap/FiniteEquivalenceRelations/README.md` (23 insertions, 19 deletions).
- `overlaps.md` lists no other pull request changing this folder, no dropped id and no close roadmap. The resolver's four leads are those of the previous review and were resolved there: PerfectoidSpacesPartII §5.1 is a board package in the merge order, and the three `IsEquivIdeal.*` names are declared in `Suggested.lean`. The diff touches none of them.

**Signatures, padding, headlines.** `Suggested.lean` is byte-identical to the file the previous review read, at the same pins, so its `#check` comparison of all 46 declarations, its one-tactic probe (all 22 sorried theorems fail) and its list of headline theorems carry over. The worker's `signatures.md` reports 0 declarations with a lost binder at this head.

**Sources.** The diff changes no locator and no source-backed claim. The seeded sample (0.1–4.4) lies in untouched text; each locator was read by the previous review (its “Sources” list, kollar2012, raicu2010, stacks-groupoids, fga3, sga3-exp5 with line numbers). The one sampled target the diff touches, 3.2, changes only its *Needs:* lines; its sole locator, FGA III §2, p. 212-05, is fga3 lines 156–164, as recorded there.

**Adversarial table.** The first two rows are the statements whose passages the diff touches. The rest are carried from the previous report (PRREVIEW-FiniteEquivalenceRelations~7, “Adversarial table”), whose values stand because the statements are unchanged.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `eq_differenceIdeal_of_sq_eq_bot` (3.2; Summary, Owned here, *Needs:* changed) | `A = k[ε]`, any field, by hand, using only 0.1 and 1.1; `A = 0` | `A ⊗ A` has basis `1, ε⊗1, 1⊗ε, ε⊗ε`; `ker μ = span{ε⊗1 − 1⊗ε, ε⊗ε}`. `⊥`: `A^R = k`, `J = ⊥ = I`. `ker μ`: `A^R = A`, `J = ker μ = I`. `span{ε⊗ε}`: `incl₁₃ = ε⊗1⊗ε ∉ span{ε⊗ε⊗1, 1⊗ε⊗ε, ε⊗ε⊗ε}`, not transitive. `span{ε⊗1 − 1⊗ε + c·ε⊗ε}`: times `ε⊗1` gives `−ε⊗ε`, so the ideal is `ker μ`. Two equivalence ideals, both `I = J(A^R)`; agrees with the count 2 of the previous report. `A = 0`: `V = ⊤`, both sides `⊥` | true; the route needs only 0.1 and 1.1 |
| `not_isEffectiveEquivalenceRelation_raicuArtin` (3.2; *Needs:* restored) | the inputs of the route | `raicuArtinRelation` is `(raicuIdeal k).map (π ⊗ π)`: 3.1 and 0.2; `¬ IsEffectiveEquivalenceRelation` is reached from `I(Z) ≠ J(B(Z))` by 1.3; `52 > 51` in degree 5 is a `finrank` comparison (values of the previous report, 8 prime fields) | true; *Needs:* complete |
| `IsEquivIdeal` (0.1) and its Checks | `ker μ`; `⊥`; `⊤`; `k[t]/(t²)`; `k × k` | previous report: `1 ∉ ker μ`; `xz ∉ span{xy, yz}`; `(q,p) ∉ R` | hold |
| `map_quotient` (0.2) | `𝔞 = ⊤`, `(t)`, `(t−1)` | previous report: images `⊥`, `0` | true |
| `isEquivalenceRelation_iff`, `isEquivIdeal_iff_isSpecEquivRel` (0.3) | `T = A`, `(A⊗A)/I`, `A⊗A⊗A/(I₁₂+I₂₃)` | previous report: right exactness gives the triple ring | true |
| `invariants`, `differenceIdeal` (1.1) | `ker μ`; `⊥` over a field | previous report: `A^R = A`, `J = ker μ`; `A^R = k`, `J = ⊥` | hold |
| `isColimit_cofork` (1.2) | `I = ⊤`; `k × k`; `k[t]/(t²)` | previous report: `A^R = A`; `k`; `A` | true |
| 1.3 (two theorems, Example) | `A = 0`; `I = ⊤`; `k[t]/(t⁴)`; `k[x³, x⁵]` | previous report: `7 ∉ ⟨3, 5⟩`, identity for `u⁷ − v⁷` | true |
| 2.1 | `k × k`; `ker μ`; relation of 3.2 | previous report: ranks 2 and 1; 3.2 not flat | true |
| 3.1 (three theorems) | `𝔽₂, 𝔽₃, 𝔽₃₂₀₀₃` | previous report: `dim I₅ = 44 > 43 = dim J(B)₅` | true |
| 3.2 Checks (length ≤ 2, `I₁`, square zero) | `k`, `k × k`, `k[ε]`, `L/k`; `k[x,y]/m²` | previous report: 5 ideals over `𝔽₂`, 6 over `𝔽₃`, all effective | hold |
| `raicuCocycle_not_mem_differenceIdeal` (3.3) | `𝔽₃` | previous report: `∑ hᵢh₅₋ᵢ = 40`, no gap below degree 5 | true |
| `IsToric`, `eq_differenceIdeal_of_isToric` (3.4) | `σ = ℕ`; Raicu's `I` | previous report: `(x²−y²) = J(k[t²])`; Raicu's `I` not toric | true |
| 4.1 (two theorems) | `ℤ → ℚ`, `N = ℤ`, `ℤ/2`; `B = A × A` | previous report: equalizer `ℚ ≠ ℤ`; cofaces `(u,u,v,v)`, `(u,v,u,v)` | true |
| 4.2 (three theorems) | cokernel of `P → B⊗P`; `ℤ → ℚ`; `ℤ → ℤ × ℤ/2` | previous report: `coface₁ x − coface₂ x ↦ 1⊗[x]` | true |
| 4.3 (two theorems, three Checks) | every `k`, `I`; the node; `R*` | previous report: `A⊗_{A^R}A = A⊗A/J`; `C/(x+y) → k × k` not injective | true |
| `universally_effectiveEpi_iff` (4.4) | Tag 0EUA; `ℤ → ℚ`; the node | previous report | true |
| Conventions witnesses | `k = ℤ`, `A = 𝔽₂`; `B = A × A`; `k[t]` | previous report: `𝔽₂⊗_ℤ𝔽₂ = 𝔽₂`; `incl₁₂ + incl₂₃ = t⊗1⊗1 − 1⊗1⊗t` | hold |

**Library and cross-roadmap citations.** The diff adds no library declaration and no cross-roadmap citation. Those of the untouched text (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9; ModularCurves Layer 0C item 3; SchemeAndStackFoundations §§1.1, 1.5, 1.17; AlgebraicModuliForArithmeticGeometry §§3.1–3.3; PerfectoidSpacesPartII §5.1; DirectSummandsAndBigCohenMacaulay §0.1) were opened file and line by the previous review; `overlaps.md`, computed at today's index of the open heads, reports no dropped id among them.

**Ownership.** No new object is introduced by the change; the previous report's search by object (main, 458 open heads, board packages) stands, and `overlaps.md` lists no close roadmap at this index.

## Not verifiable

- As in the previous report: Olivier 1970, Joyal–Tierney 1984, Mesablishvili 2004a and 2004b, Venken 1971 and Philippe 1973 are paywalled or not online; they are cited for history or in Research context only.
- The unpublished lengths 3–4 search of Research context was not recomputed beyond the algebras listed in the previous report.

## Source issues

- none
