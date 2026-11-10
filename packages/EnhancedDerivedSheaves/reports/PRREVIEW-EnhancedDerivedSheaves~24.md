# Review of EnhancedDerivedSheaves (pull request #1630 at dc57fee)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/EnhancedDerivedSheaves/` at `dc57fee`, the head the previous review also read. The folder has not changed since then, so the only change is in the pull request's description. The pins are Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. `README:N` refers to this folder's README at this head. One wording defect remains, and it is in a target's proof description. The gate passes, the dependency check is clean, and the elaboration and every computed row below pass.

## R01 (P3) — "connective" is used for the tower terms `L_n ∈ D^{≥−n}`

**Location:** `README:2258`, *postnikovCompletion_adjunction*: "The adjunction is proved on mapping spaces: truncation adjunction identifies maps into the connective objects `L_n`, but the full derived Hom complexes are not identified degree by degree."

**Claim:** the terms `L_n` of a tower in `D̂(X)` are connective, and the truncation adjunction identifies maps into them.

**Witness:** `README:2983` defines connective as cohomology in degrees `≤ 0`, but `L_n ∈ D^{≥−n}` (`:2246`). For example, the constant tower `ℤ[−1]` on `Set` has `L₀ = ℤ[−1]`. For the connective `L = K = ℤ[1]`: `π₀ Map(K, L) = ℤ`, but `Map(τ^{≥0}K, L) ≃ ∗`.

**Repair:** replace "maps into the connective objects `L_n`" with "maps into the objects `L_n ∈ D^{≥−n}`: `Map(K, L_n) ≃ Map(τ^{≥−n}K, L_n)`". The repaired claim holds on the instance above. In the README's own Check (`README:2262`), `K = ℤ[1]` and `L₀ = ℤ[0] ∈ D^{≥0}` give contractible mapping spaces on both sides, while `H¹ RHom(K, L₀) = ℤ` still separates the two RHom complexes.

## Previous findings

- r23 R01, the description misstated the change and gave no order against #1330: **repaired.**
  - The description now reads "`README.md` and `Suggested.lean` are both revised. `Suggested.lean` is in module form, with the single Tau Ceti import `TauCeti.Algebra.Homology.DerivedCategory.KInjective`. No other roadmap imports it. Every dropped name that another roadmap cites is mapped to its pinned Tau Ceti declaration in Scope and ownership." This is the requested wording.
  - Its merge-order block now states a rule for #1330: "Also changed by #1330 (tdupu). … whichever of the two merges second is rebased onto the first."
  - `git diff --stat origin/main...HEAD` confirms `README.md | 1435` and `Suggested.lean | 585`.

## Verified sound

**Gate, order, worktree.**
- `HEAD` is `dc57fee` and the worktree is clean. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty.
- I reran `gate … --base origin/main`. It exited 0 with every counter 0 and ended with `OK`; the worker's run also reports `build=0`.
- The dependency check (`gate --depcheck … --movable --pr 1630`) exited 0 with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 236 roadmaps, 2296 edges, 0 problem(s)
```

**Elaboration, signatures, padding.**
- `lake env lean` on a scratch copy of `Suggested.lean` exits 0. The only warnings are 10 "declaration uses `sorry`", at lines 101, 121, 148, 184, 196, 207, 219, 248, 262 and 279.
- `#check @` of all 17 declarations matches the README statements. Every section binder (`[Category.{v} A] [Abelian A] [IsGrothendieckAbelian.{w} A]`, `[MonoidalCategory C]`) is present, so the six "dropped binder" leads in `signatures.md` are false positives. Nothing was changed.
- One-tactic probe: each `sorry` was replaced by `first | rfl | (simp; done) | infer_instance | (aesop; done)`. All 10 theorems fail, so none is padding by that test.
- A scratch check confirms the universe claims. `DerivedCategory (ModuleCat.{u} R)` and `DerivedCategory (Sheaf X.smallEtaleTopology (ModuleCat.{u} Λ))` have Hom types in `Type u` under the file's instance.

**Library declarations resolved at the pins.**
- 154 dotted Mathlib names from the README were checked by `#check` with no error cap. All resolve, except namespaces, notation (`X.Etale`), and Tau Ceti or roadmap names.
- Each of the 92 `TauCeti.*` names matches a declaration in the pinned Tau Ceti sources (grep by name). 23 key ones were checked by `#check` with their modules imported, among them:
  - `TauCeti.IsReplete.epi_pi_map` and `TauCeti.iterateFrobeniusEquiv_symm_mem_frobeniusRootIdeal`;
  - `TauCeti.exists_surjective_mvPowerSeries_spanFinrank` (field `k`, `IsAdicComplete 𝔪`, `𝔪.FG`, as `README:874` says);
  - `TauCeti.isZero_Tor_succ_of_perfectRing` (all three rings perfect, as `README:846` says);
  - `TauCeti.IsRegularRing.hasProjectiveDimensionLE` and `TauCeti.KInjectiveDGCategory.dgNerveHomotopyCategoryEquiv`.
- Mathlib facts the README relies on, opened at the pin:
  - `GrothendieckTopology.W.monoidal` needs `HasFunctorEnrichedHom`/`HasEnrichedHom` for all presheaves, and `W.transport_isMonoidal` needs `G` full, cover-dense and continuous with essentially surjective pushforward (`Mathlib/CategoryTheory/Sites/Monoidal.lean:119–153`). These are exactly the hypotheses the §0.2 route discharges.
  - `isGrothendieckAbelian_sheaf_smallEtaleTopology` is `IsGrothendieckAbelian.{u}`, through `AffineEtale.sheafEquiv` (`Mathlib/AlgebraicGeometry/Sites/AffineEtale.lean:139–150`).
  - The `SheafOfModules` instance is for `C : Type u`, `SmallCategory C`, `RingCat.{u}` (`Mathlib/CategoryTheory/Abelian/GrothendieckAxioms/SheafOfModules.lean:24`).
  - `IsRegularRing` extends `IsNoetherianRing` (`Mathlib/RingTheory/RegularLocalRing/Defs.lean:93`).
  - `HasDerivedCategory.standard` gives `HasDerivedCategory.{max u v}`.

**Duplication by object.**
- Grep of both pins finds no K-injective existence in Grothendieck categories. Tau Ceti's `exists_quasiIso_isKInjective` is for `ModuleCat` only, and Mathlib's `Algebra/Homology/GrothendieckAbelian.lean` gives only the Grothendieck structure on complexes.
- The pins have no global `HasDerivedCategory` instance, no monoidal hypothesis for the étale site, no converse of Kunz's theorem and no perfect projective-dimension or Tor bound (`TauCeti/RingTheory/Perfect/`).
- The pins have no derived-completeness notion and no invertible-object predicate for monoidal categories. Tau Ceti's `SheafOfModules.IsInvertible` is local triviality, a different notion.
- Tau Ceti's `TauCeti.PowerSeries.isRegularLocalRing` is the one-variable case only, so citing PerfectoidSpaces P7.16a `powerSeries_regular_field` for `κ⟦x₁,…,x_e⟧` is right.
- `roadmaps grep` over main and the open heads finds no second owner of `MonoidalCategory.IsInvertible`, the Grothendieck K-injective theorem, the global instance, the étale `IsMonoidal` hypothesis or the converse of Kunz. CrystallineCohomology cites `isRegular_of_frobenius_flat` from here.
- EtaleCohomologyFoundations at #1891 states invertibility as `(MonoidalCategory.tensorLeft T).IsEquivalence`, defines no predicate, and cites §0.3 (`README:1940` there).

**Cross-roadmap citations resolved on main (`f8836c4`) and at #1701.**
- DerivedModuleAlgebra §§0.I.1, 0.K.1, 0.2, 0.4, 0.13–0.17, 1.1, 1.1.1 and 1.2–1.5 exist on main.
  - Its `derivedCompleteness` takes any ideal (`Suggested.lean:904` on main), as E4.1 says.
  - At #1701 (`8dcba8a`), `hasLeftDerivedFunctor₂_tensor` and `nonempty_derivedTensorHomAdj` take `[HasDerivedCategory.{w} (ModuleCat.{u} R)]` as a hypothesis, which is the instance-genericity `README:466` and `:775` rely on. The description names #1701 as merging first.
  - #1701 maps `DerivedDeRham.derivedTensor`, `moduleDerivedHom` and `koszulCompletionTower` to their new places.
- SchemeAndStackFoundations: §§0.1, 0.4, 0.9, 0.17, 0.24, 0.25, 1.6–1.11, 2.1, 2.2, 2.5, 2.6, 2.17, 2.18, 4.12 and 4.13 exist.
  - `Coherent.instHasDerivedCategoryModules` is `HasDerivedCategory.standard` (`Suggested.lean:1521`).
  - `Coherent.DQCoh.affineEquiv` asserts only `Nonempty (D(A) ≌ DQCoh (Spec A))` under the standard instance (`:1534`), as `README:949` says.
- BordismFormalGroups F6.5 item 1 contains the four quoted sub-lanes (`README:1546`, `:1823`, `:1944`, `:2005` there).
- Also resolved: PerfectoidSpaces P0.1, P0.2, P0.14 (`Almost.Algebra.isUnramified_iff_exists_idempotent` at `:2068`), P0.15 and P7.16a (`:17433`); AdicSpacesPartII §R0.19.10; GeneralizedCohomology G2 items 1–7 and G3; AlgebraicTopology Stage 6 item 0 ("Countable inverse-system algebra"); JacobianChallenge Layer C; StableReduction Layer 2.
- `citations.md` lists no cross-roadmap citation found nowhere. Its 22 Lean-name leads are names declared in `Suggested.lean` or in DerivedModuleAlgebra, SchemeAndStackFoundations or PerfectoidSpaces.
- `overlaps.md` reports no dropped id and no id that only an open revision defines. #1187 is ordered after this pull request in the description.
- #1330 (draft, `856fe7a`) rewrites E1.6 to consume PurityOfBranchLocus §0.3. This head instead uses `TauCeti.IsRegularLocalRing.of_hasProjectiveDimensionLE` (`README:20`). The description's rule, "whichever of the two merges second is rebased onto the first", covers the conflict.

**Seeded sample (§§0.1–0.4), read at the locators.**
- §0.1: HA Definition 1.3.5.8 and Proposition 1.3.5.9, p. 125 (`HA line 4739`, `4743`); Proposition 1.3.5.21, p. 129 (`HA line 4874`: presentable, t-structure compatible with filtered colimits); Stacks Theorem 19.12.6, tag 079P (`StacksInjectives line 883`: functorial, termwise monomorphic, injective terms, K-injective).
- §0.2:
  - Tag 079P as above.
  - Stacks pages read online: Lemma 21.17.11, tag 06YS (existence only, not functoriality, which the README adds as part of the target); Lemma 18.26.1, tag 0GMW (sheafification of the presheaf tensor product); Lemmas 18.27.1 and 18.27.7, tags 03EM and 03EP.
  - HA Proposition 4.1.7.4, p. 486 (`HA line 18583`).
- §0.3:
  - HA Example 4.1.7.6, p. 487 (`HA line 18605`); Theorem 7.1.2.13, p. 1212 (`HA line 46530`); Remark 7.1.1.16, p. 1206 (`HA line 46277`, discrete R, left modules, as Conventions states).
  - Tag 08TB is Section 13.34, read online.
  - More on Algebra 07KW = 15.88.1 (p. 231), 07KY = 15.88.10, 091D = 15.89.1, 091N, 091V = 15.93.10, 0920 = 15.93.18, 0G1U = 15.93.20 and 0923 = 15.95.2 (`StacksMoreOnAlgebra line 10638`, `10814`, `10946`, `11993`, `12163`, `12293`, `12344`, `12520`).
- §0.4: Stacks 21.19.1, tag 07A6, is in §21.19 "Cohomology of unbounded complexes" (online).
- Also read at the locators:
  - More on Algebra 091P, 091T (p. 263) and 091U (p. 264, "any ideal"), and 0A5W–0A65 (p. 189).
  - BS-proet 3.1.1 (p. 16), 3.2.1 (p. 17), 3.3.2 (p. 18), 3.3.3 and 3.3.4 (p. 19), 3.4.2 and 3.4.7 (p. 21), 3.4.14 (p. 23), 3.5.3 (p. 24), 3.5.7 (p. 25).
  - BS17 3.16–3.18 (p. 14), 6.14 (p. 26), 11.10 (p. 42), 11.29 (p. 47), 11.31–11.32 (p. 48), 11.33 with footnotes 24–25 and 11.35 (pp. 49–50).
  - HA 1.3.4.25 (p. 119), 1.4.4.1 (p. 154), 1.1.1.9 (p. 19), 1.3.1.6 and 1.3.1.10 (pp. 81–82).

**Adversarial computations.**

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | `hasKInjectiveResolutions` (`:101`) | `ModuleCat ℤ`; acyclic K; the `ℤ/4` complex `Pⁱ = A`, `d = 2` | Tau Ceti's instance agrees (both are Props). An acyclic K resolves to a K-injective acyclic `I ≃ 0`. P is termwise injective but not K-injective (a contraction needs `1 = 2(h_n+h_{n+1})` in `ℤ/4`), so the resolution is not P itself. | Pass |
| 2 | `locallySmall_localization_quasiIso` (`:121`) | `ModuleCat.{u} R`; `SheafOfModules.{u} O` | Mathlib gives `Type (u+1)`; the K-injective argument gives `Type u`, matching `HasExt.{u}` | Pass |
| 3 | §0.1 instance Check (`README:477`) | `Q(ℤ/p)⟦−1⟧ ⟶ Q(ℤ)`; `⟦1⟧` | `Ext¹(ℤ/p, ℤ) = ℤ/p`; `Ext⁻¹ = 0` | Pass |
| 4 | §0.1 cone Checks (`:461`) | `cone(0 : A → A)`, `cone(id)` | `H⁻¹ = H⁰ = A`; zero in all degrees | Pass |
| 5 | `smallEtaleTopology_W_isMonoidal` (`:148`) | `X = ∅`; `Spec k ⊔ Spec k` | For ∅ every sheaf is 0, so W is all maps (closed under ⊗). For `Spec k ⊔ Spec k` the presheaf tensor gives `Λ⁴` and the sheaf tensor `Λ²` on `X`-sections. | Pass |
| 6 | Koszul Check (`README:511`) | `K = [ℤ →id ℤ]`, degrees 0, 1 | Unsigned swap: `dτ(e₀⊗e₁) = −e₁⊗e₁ ≠ τd(e₀⊗e₁) = e₁⊗e₁`. Koszul: both are `−e₁⊗e₁`. | Pass |
| 7 | Étale flat Check (`:524`) | `(ℤ/2)_X` over `ℤ/4` | `Tor_i^{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` for all `i ≥ 0` | Pass |
| 8 | §0.3 tower Check (`:554`) | `K_i = [ℤ → ℤ/ℓ^{i+1}]` | `H⁰(K_i) = ℓ^{i+1}ℤ` (not ML), `lim¹ = ℤ_ℓ/ℤ = H¹([ℤ → ℤ_ℓ])`, `H¹(K_i) = 0` | Pass |
| 9 | `isInvertible_iff_isUnit_toSkeleton` (`:184`) | `𝟙`, `ℤ/2` in `ModuleCat ℤ`; `Λ_X[1]` | `𝟙`: both true. `ℤ/2`: kills ℚ, and `ℤ/2 ⊗ Y` is 2-torsion, so both false. `ε(Λ_X[1]) = −1 ≠ 1` when `2 ≠ 0`. | Pass |
| 10 | §0.4 Checks (`:615`–`:617`) | identity morphism; two squares | identity exchange; mate pasting is `mateEquiv_vcomp` | Pass |
| 11 | `isRegular_of_frobenius_flat` (`:196`) | `𝔽_p[t]`; `𝔽_p[ε]/ε²`; `𝔽_p[t^{1/p^∞}]`; zero ring | `𝔽_p[t]`: free of rank p, and regular. `𝔽_p[ε]/ε²`: not flat. `𝔽_p[t^{1/p^∞}]` is flat but excluded by `IsNoetherianRing`. The zero ring is excluded, since `CharP` forces `p ∣ 1`. | Pass |
| 12 | `perfect_projectiveDimension_le` (`:207`) | `P₀ = k`, `R = k`; `P₀ = 𝔽_p[t]`, `R = P` | First pair: bound 1, true value 0. Second pair: `R/J_t` has `pd = 2 = d + 1`, since `J_t` is flat, countably generated and not finitely generated, so not projective. The bound is attained. | Pass |
| 13 | `perfect_torDimension_le_two_mul_dim` (`:219`) | `(k[x,y]/(xy))_perf`; dimension 0 | `Tor₂(R/(x), R/(y)) = (y)/yJ ≅ k ≠ 0`, `Tor₃ = 0` by `0→J→R→R→R/(x)`. In dimension 0 R is a product of perfect fields, so `Tor_{≥1} = 0`. The radical kernel contracts to `J₀ ⊂ P₀`, so `R = (P₀/J₀)_perf`, inside BS17's domain. | Pass |
| 14 | *frobeniusFlat_completion* route (`README:885`) | Frobenius twist | `Tor₁^Â(κ, F_*Â) = Tor₁^A(κ, F_*Â) = Tor₁^A(A/𝔪^{[p]}, Â) = 0` by flat base change along F, then flatness of `Â` | Pass |
| 15 | Cohen non-uniqueness Check (`:880`) | `𝔽_p(t)⟦T⟧`; `𝔽_p(t)` | `t ↦ t`, `t ↦ t+T` both section reduction; `𝔪 = 0` gives one section | Pass |
| 16 | `isDerivedComplete_iff_derivedCompleteness` (`:248`) | `I = ⊤`; `I = 0`; `ℤ`, `(p)`, `M = ℤ`; `ℤ[x₁,…]` | `I = ⊤`: f = 1 forces `M = 0` on both sides. `I = 0`: identity map, and `Localization.Away 0 = 0`, so both sides hold. `M = ℤ`: `lim¹ = ℤ_p/ℤ = Ext¹(ℤ[1/p], ℤ)`, both fail. `ℤ[x₁,…]`: `R/I` passes, R fails at `x₁` (`y₀ ≡ Σ_{i<k} x₁^i` mod `x₁^k` for all k is impossible). | Pass |
| 17 | `isAdicComplete_iff_derivedComplete_separated` (`:262`) | `I = ⊤`, `I = 0`, `ℤ` at `(p)`, `coker ψ` | `I = ⊤`: both say `M = 0`. `I = 0`: both true. `ℤ`: LHS false, RHS false (not derived complete). `coker ψ`: `ē₀ = pᵏē_k ≠ 0`, so it is not separated, and both sides are false. | Pass |
| 18 | `derivedCompleteModules_weakSerre` (`:279`) | `ℤ ⊂ ℤ_p`; `ℤ_p/ℤ`; `·p` on `ℤ_p` | ℤ and `ℤ_p/ℤ` (uniquely p-divisible) are not complete. The kernel 0 and the cokernel `𝔽_p` are complete. | Pass |
| 19 | E1.6 nodal Check (`README:903`) | p = 2, 3 | `yJ` has y-exponents `> 1` for every p, so `y ∉ yJ` | Pass |
| 20 | E1.9 base-change Check (`:1214`) | `B = k[t,ε]/(tε, ε²)` | Both sides are `k[0]`; `Tor₂^B(B/ε, B/t)`: `A²→(t,0)A→0A→tA` gives `H₂ = k` | Pass |
| 21 | E2.4 window (`:2321`) | `b ≡ 0`, `m = 0`; `m = −3` | `N = 1`; `N = 4`; the vanishing indices for `j = m−1, m, m+1` match the triangle | Pass |
| 22 | E5:animation.1 Check (`:2033`) | comma category of the diagonal at (one, one) | Script: 13 objects, 40 arrows, boundary ranks 12 and 26, `H₀ = ℚ`, `H₁ = ℚ²` | Pass |
| 23 | E5:descent Checks (`:1948`–`:1949`) | `𝔽_p[x_i]/(x_i^{i+1})`; `ab+cd=1` | `x_m^m ∈ I^m` is nonzero, so no index. `(a, c) = (1)`; dimension 4, so index ≤ 5. | Pass |
| 24 | E2:towers Check (`:1545`) | `ℚ[t]`, `|t| = −2` | Fibre tower `A[2(n+1)]`: `H^j` vanishes for n large, but the transitions `t^{n+1}` are nonzero | Pass |
| 25 | E4 Checks (`:2687`, `:2755`) | `ℤ[1/p][−1]`; `f = 0` | `RHom = ℤ[1/p][−1]`, so π is zero but `T ≠ 0`. `K_A(0) = K ⊕ K[1]` with transitions `0^{m−n}`, so `Rlim = K`. | Pass |
| 26 | *postnikovCompletion_adjunction* (`:2258`, R01) | `K = ℤ[1]`, `L₀ = ℤ`; connective `L = ℤ[1]` | `RHom(K, L₀) = ℤ[−1]` with `H¹ = ℤ`, both maps contractible. For connective `L`, `π₀ Map(K, L) = ℤ ≠ π₀ Map(τ^{≥0}K, L) = 0`. | Wording fails (R01) |

**Headline coverage.**
- The README's headlines are:
  - the enhancement `D∞(O)` with its operations;
  - K-injective resolutions, the global instance and local smallness;
  - the étale tensor hypothesis and invertible objects;
  - the converse of Kunz and the perfect homological bounds;
  - Postnikov completion and descent;
  - Kan extensions, adjoints and localizations;
  - derived completion and reconstruction;
  - the higher-algebra layers;
  - `Mod_{HR}(Sp) ≃ D(R)`.
- Ten are stated. The docstring names each unstated family and the missing carrier (lines 49–78). No stand-in is used.

## Not verifiable

- HTT, SAG, Liu–Zheng, Nikolaus–Scholze, Mathew, ECD, Ramzi, Efimov, Robalo, Fargues–Scholze and Bhatt's papers are not in the source cache and were not re-read this round. Their locators are outside the seeded sample.
- The Stacks chapters Cohomology on Sites, Modules on Sites, Derived Categories, Simplicial Spaces and Cohomology of Spaces were checked by tag and result number on the Stacks website. The chapter-PDF page numbers were not checked.
- Ownership against open pull requests was checked with `roadmaps grep` over the heads indexed on 2026-11-10 and with the overlap report; HigherToposTheory (#1901) was not read in full.

## Source issues

- **Error** in BS-proet at Lemma 3.3.2, proof, p. 18: the source says truncation adjointness gives `RHom(F_{n+1}, G_n) = RHom(F_n, G_n)` for towers in `D̂(X)`; it should say this only after `τ^{≤0}`: for `F = Ψ(ℤ[1])` and `G` constant at `ℤ`, `RHom(F₁, G₀) = ℤ[−1]` while `RHom(F₀, G₀) = 0`; affects the proof.
- **Misprint** in BS-proet at Proposition 3.3.3, proof, p. 19: the source says `H^i(∏_n I_n) = ∏_{n≥i} H^i(I_n)` for `i ∈ ℕ`; it should use degree `−i`, where the factors with `n < i` vanish, and treat positive degrees with the full product; affects the proof.
- **Misprint** in BS-proet at Lemma 3.4.14, p. 23: the source calls derived I-complete modules an abelian Serre subcategory; it should say weak Serre (kernels, cokernels, extensions), since `ℤ ⊂ ℤ_p` is not closed under submodules; affects nothing.
