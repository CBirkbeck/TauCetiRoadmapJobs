# FIX-PKG-GaloisActionOnEtaleCohomology~2

Repair round on the findings of `REV-PKG-GaloisActionOnEtaleCohomology` (one review, eight findings). Files changed: `packages/GaloisActionOnEtaleCohomology/README.md`, `Suggested.lean` (one docstring), `sources.toml` (two new entries, four locators), `design/plan.json` (the `detail` of the existing gap only).

## F01 (P1) — applied differently

Changed: contract §1.1 line drops "and `H^n(Spa(K, 𝒪_K), F) ≅ H^n_cont(G_K, F_ξ)`". §2.5 gains a first statement: this isomorphism for any `Λ`, natural, compatible with connecting maps (dejongvanderput1996 Cor. 3.3.2 line 1201; stacks03N1 Lemma 59.2 line 4229). The `E_2` sentence cites it; Scope records ownership; two Checks were added and the collapse Check rewritten.

Evidence: ClassicalAdicEtaleCohomology §1.1 at its head states the discrete-module equivalence as a target. It has the cohomology identification only in a Check (line 205) and the paragraph after it. The route differs from the suggestion: it uses universal δ-functors (ProfiniteCohomology §§10.3–10.4), because the torsor route presupposes §2.5's own claim that the torsor's module structure is the stalk action.

## F02 (P2) — applied

Changed: §1.1 gains the bullet **Inverse image and tensor** (`g⁻¹(M ⊗ᴸ N) ≅ g⁻¹M ⊗ᴸ g⁻¹N`, settings (a)–(c), units, associativity, composition; stacks01FQ Lemmas 21.18.1/21.18.4, lines 1451, 1525). The cup product is redefined via `Hom(Λ, W[i])` and §0.3, without "lax monoidal `RΓ`". §1.4 now cites §1.1's cup product, and the unbounded-tensor Check computes both sides.

Evidence: EnhancedDerivedSheaves §§0.1–0.4 on main (lines 425–506) and E1.4 never state monoidality of inverse image.

## F03 (P3) — applied

Changed: §1.4 "milneLEC §12, page 81, and §17, page 114" → "stacks03N1 Section 56, Tag 03QW, line 3966; milneLEC Theorem 14.9 and Remark 14.10, pages 96–97, lines 3834–3866; §14, page 99, line 3940". §2.2 "milneLEC §12, page 81" → "Corollary 12.2, page 81, line 3237". References and manifest updated.

Evidence: page 81 is Cor. 12.2 (stalks of `R^r π_*`) and page 114 is proper base change in topology; Theorem 14.9 has `F(Y)` as a left `G`-module.

## F04 (P3) — applied

Changed: §4.4 (c) adds "vanishing above `2d` is ClassicalAdicEtaleCohomology §8.4 applied to `Y^an → Spa(K, 𝒪_K)` with §2.3, or EtaleCohomologyFoundations §F.3.0 (`VanishingCycles.etaleCohomologicalDimension`) with §4.2 (milneLEC Theorem 15.1, line 4133)". Finiteness locator → milneLEC Theorem 19.1 (a), line 4783. §F.3.0 was added to the Needs, Dependencies, contract and Scope.

Evidence: §F.3 on main gives finiteness only; §F.3.0 (main line 631) gives the bound.

## F05 (P3) — applied

Changed: at §4.4 (d) and in the gap sentence of the contracts, added "huber2007, Corollary 5.6, page 996, line 963 (Corollary 5.4, line 953, for compact supports), no hypothesis on the characteristic of `C`". Also added in References, `sources.toml` and the gap `detail` in `design/plan.json`; `needs` is unchanged.

Evidence: huber2007 lines 947–951 (algebraically closed `k`, any characteristic, torsion prime to the residue characteristic). Corollary 5.6 covers every qcqs finite-type `X`, so no hypothesis was added.

## F06 (P3) — applied

Changed: §0.1 Check "up to the `ℚ_p`-isomorphism … an isometry" → "`CompletedAlgClosure ℚ_[p]` and `PadicComplex p` are the same type with the same normed-field structure; `PadicComplex.isAlgClosed`". `Suggested.lean` docstring "up to an isometric `ℚ_p`-isomorphism" → "agrees with … the same normed field". The §0.2 Check citing "the isometry of §0.1" now uses an isometric `K`-isomorphism.

Evidence: Mathlib `Complex.lean` lines 54, 67, 137; `rfl` checked for types and `NormedField` instances.

## F07 (P3) — applied

Changed: "the open unit disc" → "the closed unit disc, `char K = 0`", with the value recomputed. The classes of `1 + aT^m` (`m` prime to `p`, `|p|^{p/(p−1)} < |a| < 1`) are independent in `𝒪^×/𝒪^{×p} ⊆ H¹(X_C, μ_p)`, so `H¹(X_C, ℤ/p)` is infinite. Kummer classes show `H¹(X_C, ℤ_p)` is not finitely generated.

Evidence: §4.3 assumes qcqs; no other occurrence of the open disc exists.

## F08 (P3) — applied

Changed: `sources.toml` `sga4half` `locator = "Arcata"` → `"Arcata; Rapport"`.

## Checks

- **Elaboration.** `lake env lean packages/GaloisActionOnEtaleCohomology/Suggested.lean` (from the content checkout): one warning, `declaration uses sorry` at line 119; no error. No `TauCeti.*` import, so nothing was built.
- **Signatures (`#check @name`).** All 3 declarations were put in one scratch file and elaborated once. `SpectralAlgClosure : (K : Type u) → [Field K] → Type u`; `CompletedAlgClosure` carries `[NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]`; `exists_galois_continuousAut_equiv` carries the same three binders and its four conjuncts. These are unchanged and match README Conventions and §0.2. The same file checked `CompletedAlgClosure ℚ_[p] = PadicComplex p := rfl` and the equality of their `NormedField` instances by `rfl`; both elaborate.
- **Dependency check.** Output: `depcheck: 207 roadmaps, 1919 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README: cross-roadmap citations found nowhere: none; Lean names found nowhere: none.
- **Sources.** Two works were fetched through the sources service, both certified open-repository: `stacks01FQ` (Stacks, Cohomology on Sites) and `huber2007` (Numdam). The first attempt at huber2007 through the DOI landing page failed; the Numdam PDF succeeded. The stale `needs-references.toml` entry it had written was deleted, so no text is missing.
- **Gate failures.** None were listed for this round.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.5 point: `Hⁿ(Spa(K,O_K),𝒢) ≅ H^n_cont(G_K, 𝒢_ξ)` | `K = C`; `K = ℚ_3`, `μ_4`, `n = 0`; `K = ℚ_2`, `μ_5`, `n = 2`; `K = 𝔽_p((t))`, `ℤ/p`, `n = 1`; `Λ = 0` | `G_C = 1`: both 0 in degree > 0 (Γ exact, A1.7). `μ_4(ℚ_3) = {±1}`, order 2 (`−1` not a square mod 3); without invariants, order 4. `ℤ/5` vs `H²(ℤ/5(−1)) = H⁰(ℤ/5(2))^∨ = 0` (`2² = 4 ≢ 1`). Artin–Schreier: `H¹(Spa K, ℤ/p) = K/℘K = H¹(G_K, ℤ/p)`. `Λ = 0`: both 0 | true, no char or coefficient hypothesis | new target, 2 Checks added |
| route: universal δ-functor | effaceability of `H^n_cont` | `A ↪ Coind_1^{G_K} A`, `a ↦ (g ↦ g·a)`: locally constant maps, a discrete module, acyclic (ProfiniteCohomology §10.4) | valid | none |
| §1.1 inverse image and tensor | `g = id`; `M = Λ`; `Λ = ℤ/4`, `M = N = ℤ/2`, `g : Spa(C) → Spa(K)`; noncommutative `Λ` | identity; unit iso; both sides `H^{−n} = Tor_n^{ℤ/4}(ℤ/2,ℤ/2) = ℤ/2` for all `n ≥ 0`, underived gives degree 0 only; `M_2(𝔽_2)`: not formed | true for commutative `Λ` | new bullet; Check extended |
| §1.1 cup product via `Hom(Λ, W[i])` | unit classes over `ℤ/4`; `x ∪ 1` | `1 ∪ 1` = generator of `H⁰ = ℤ/2 ⊗ ℤ/2 = ℤ/2`; `x ∪ 1 = x` | consistent with existing Checks | redefinition |
| §4.4 (c) vanishing | `d = 0` (`Y = Spec L`); `Y = ℙ¹`; `ℓ = p`, `char K = 0` | `H^q = 0` for `q > 0`; `H² = ℤ/ℓ(−1) ≠ 0`, `H³ = 0` (`2d = 2`); §8.4 has no torsion condition, §F.3.0 needs `ℓ` invertible in `K̄` (true) | true | locator added |
| §4.4 (d) gap | `char C = p`; residue char `p`, `n = ℓ ≠ p` | Huber 2007 §5 fixes `k` algebraically closed of any characteristic with torsion prime to the residue characteristic, matching the gap's `n` invertible in `O_C`; proper ⇒ qcqs of finite type, so Cor. 5.6 applies | no hypothesis to add | locator |
| §0.1 Check `C = PadicComplex p` | `K = ℚ_p`; finite `K/ℚ_p` | `rfl` on types and `NormedField` instances elaborates; for finite `K ≠ ℚ_p`, `AlgebraicClosure K` is a different type, so an isometric `K`-isomorphism is needed (§0.2 Check) | true | Check reworded; §0.2 Check reference fixed |
| §4.3 last Check | closed disc, `char K = 0`, `ℓ = p` | `u = ∏(1+aT^m)^{e_m}`: `|u−1| = |a|`; `|h| ≤ |p|^{1/(p−1)}` ⇒ `|(1+h)^p − 1| ≤ |p|^{p/(p−1)} < |a|`; else reduction of `(u−1)/a = Σ e_m T^m` would be a polynomial in `T^p` | `H¹(ℤ/p)` infinite; `H¹(ℤ_p)` not f.g. | replaced |
| §1.4 / §2.2 locators | milneLEC lines 3237, 3834–3866, 3940; stacks03N1 line 3966 | Cor. 12.2 = stalk as colimit; Thm 14.9 = `F(Y)` a left `G`-module and HS; p. 99 = HS for curves over `𝔽_q`; Tag 03QW = action through `Spec(σ)` | correct | replaced |

## Ownership

- **The point identification (§2.5).** `roadmaps grep` over main and all open heads finds it only in ClassicalAdicEtaleCohomology §1.1's Check (line 205 at its head). No roadmap owns it as a target, so this roadmap owns it, and Scope says so.
- **Inverse image and tensor (§1.1).** No roadmap on main or open states it for these sites: EnhancedDerivedSheaves §§0.1–0.4 and E1.4 do not, and DiamondEtaleCohomology cites Stacks 07A4 for diamonds only. It is stated here for settings (a)–(c), the sites this roadmap uses.
- Ownership against open pull requests was checked with `roadmaps grep` over every open head, and by reading ClassicalAdicEtaleCohomology at its head. Not all open roadmaps were read in full.

## For the maintainer

- No Lean name changed, and no section or target id was renamed or dropped.
- ClassicalAdicEtaleCohomology could promote its §1.1 Check `Hⁿ(Spa(K,O_K),F) ≅ H^n_cont` to a target. If it does, §2.5's first statement becomes a citation.
- `gap:proper-rigid-finiteness` now has a certified locator (huber2007 Corollary 5.6). It covers all qcqs finite-type spaces, so ClassicalAdicEtaleCohomology could close the gap at that generality.
- No suspicious instructions were found in the review text.
