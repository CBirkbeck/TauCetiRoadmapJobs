# Review of EnhancedDerivedSheaves (pull request #1630 at 9158199)

**Verdict:** needs changes

Incremental re-review of the 59 lines changed since `4a36a4c` (`scratch/changes.md`: 29 in `README.md`, 30 in `Suggested.lean`, nothing outside the folder). Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (the `lake-manifest.json` revisions). `README:N` and `Suggested.lean:N` refer to the two files of `TauCetiRoadmap/EnhancedDerivedSheaves/`. The only finding is the description-only item carried from r14; every repair in the folder is correct, and no repair introduced a new problem.

## R01 (P3) — The description is still wrong about the change and still states no order with #1330 or #1891

Location: the pull-request description (`scratch/pull-request.md`, data), line 22: "Amendment of the merged roadmap EnhancedDerivedSheaves (README only; no Lean change, so no importer is affected)." Nothing in the description names #1330 or #1891.

Claim: the description tells the approver what changes and how this pull request is ordered against the open pull requests that touch the same objects.

Witness: `git diff --stat origin/main...HEAD` changes `Suggested.lean` (this head alone adds the definition `derivedCompleteModules` and restates `derivedCompleteModules_weakSerre`, `Suggested.lean:271`–`285`). `roadmaps list`: #1330 is open (draft, `856fe7a`) and conflicts with this head in both files; #1891 (`bdbf9b3`), `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:1831`–`1832`, still says `MonoidalCategory.IsInvertible` is "built here", while `README:3027` names §0.3 its single owner.

Carried from r14 R01 (r13 R01, r12 R05, r11 R01, r10 R03, r9 R03, r8 R02, r7 R08). No repair report marked it not actionable. The folder side is correct; the item is the description's text alone.

Repair, in the description:
- Replace "README only; no Lean change, so no importer is affected" by: "`README.md` and `Suggested.lean` are revised. `Suggested.lean` is rewritten in module form with the single Tau Ceti import `TauCeti.Algebra.Homology.DerivedCategory.KInjective`. No roadmap imports it, and no roadmap cites a declaration it drops."
- Say that this head supersedes #1330, which is to be closed rather than merged after it.
- Say that #1891 must cite `MonoidalCategory.IsInvertible` of EnhancedDerivedSheaves §0.3 in place of "built here" at its `README:1831`–`1832`, and that #1891 is to be rebased after this pull request.

## Previous findings

- R01 — not repaired: the description still reads "README only; no Lean change, so no importer is affected" and names neither #1330 nor #1891. Carried as R01.
- R02 — repaired: `README:2734` names the sheaf statement *derivedCompleteSheaves_weakSerre* and `README:2736` scopes `derivedCompleteModules_weakSerre` to `X = Set`, any ideal, with the four Mathlib closure classes; `README:2762`/`:2764` do the same for *isAdicCompleteSheaf_iff_derivedComplete_separated* and the point case with `I.FG`. `Suggested.lean:279` now states all four clauses (zero, kernels, cokernels, extensions), so the name "weakSerre" is earned. `README:2760` (*Needs:* of *derivedComplete_iff_cohomology*) follows the renaming.
- R03 — repaired: `README:460` attributes the bounded-below case to `CochainComplex.isKInjective_of_injective` and `CochainComplex.Plus.modelCategoryQuillen.exists_quasiIso_injective` via `cm5a`; `README:92` lists them with the scoped Quillen model and `Functor.rightDerivedFunctorPlus`; `README:636` reads E1.2's unbounded model as the extension of Mathlib's bounded-below one, with the fibration classes compared; `README:644` adds the ℤ/4 negative control; `README:476` and `:646` carry the names on the *Needs:* lines.
- R04 — repaired: `HodgeStructuresPartII` and `ExcursionOperatorsAndSpectralAction` no longer occur in the README (`grep`: 0 hits; `ExcursionOperatorsAndSpectralActionPartII` was never cited).

## Verified sound

**Gate, order, worktree.**
- `HEAD` is `9158199623fb90bf2d947b397ea8040839fc4352`; the worktree is clean; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty.
- My rerun of `gate … --base origin/main` exits 0 with every counter zero and prints `OK`, as the worker's gate does.
- The dependency check (`gate --depcheck … --movable`, exit 0) prints the line below: no UPWARD, CYCLE or `moved:` line.

```text
depcheck: 239 roadmaps, 2349 edges, 0 problem(s)
```

- No roadmap of the never-cite list occurs in the README.

**Elaboration, signatures, padding.**
- `lake env lean …/Suggested.lean` exits 0 with exactly 10 warnings, all `declaration uses sorry`, at lines 101, 121, 148, 184, 196, 207, 219, 247, 262 and 279.
- `#check @derivedCompleteModules` and `#check @derivedCompleteModules_weakSerre` (`scratch/probe/OneTactic.lean`): `{R : Type u_1} [CommRing R] (I : Ideal R)` and `ObjectProperty (ModuleCat R)` in both, as `README:2736` states; neither is in a section with `variable`s, so no binder can be lost. The remaining 20 signatures are the ones r14 checked and are unchanged.
- One-tactic probe (`first | infer_instance | rfl | decide | simp | aesop | exact?`) on the two E4.3 theorems, on a scratch copy: both leave the goal open (`aesop` exhausts, `exact?` finds nothing; the four conjuncts `ContainsZero`, `IsClosedUnderKernels`, `IsClosedUnderCokernels`, `IsClosedUnderExtensions` remain). Not padding. The other 8 sorried theorems are untouched since r14's probe.
- `derivedCompleteModules` has a real body on the native carrier `ObjectProperty (ModuleCat R)` and exists only to make the weak-Serre headline statable; it is the kind of definition the Lean rules keep.
- Form: one module docstring (its headline list names "the telescope, classical-completeness and weak-Serre comparisons", matching the file), `theorem` only, no `set_option`, no sorried data, imports `Mathlib` plus one existing Tau Ceti module.

**Pinned declarations opened for the changed passages (file and line at the pins).**
- `CochainComplex.isKInjective_of_injective (L) (d) [L.IsStrictlyGE d] [∀ n, Injective (L.X n)] : L.IsKInjective`, `Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean:134`, any abelian `C`: as `README:460`, `:92` and `:636` say.
- `CochainComplex.Plus.modelCategoryQuillen.cm5a (n) [K.IsStrictlyGE (n+1)] [L.IsStrictlyGE n]` under `[EnoughInjectives C]`: factorization into a monomorphic quasi-isomorphism followed by a `degreewiseEpiWithInjectiveKernel`, `Mathlib/Algebra/Homology/Factorizations/CM5a.lean:646`.
- `CochainComplex.Plus.modelCategoryQuillen.exists_quasiIso_injective (K) (n) [K.IsStrictlyGE n]`: a quasi-isomorphism into a complex with injective terms, strictly `≥ n`, `CM5a.lean:668`; its proof goes through `exists_mono_quasiIso_injective` (`:659`) and `cm5a` (`:664`), so "from the factorization `cm5a`" at `README:460` is right.
- The scoped instances of `CochainComplex.Plus.modelCategoryQuillen`: weak equivalences `quasiIso` (`Mathlib/Algebra/Homology/ModelCategory/Injective.lean:45`), cofibrations `monomorphisms` (`:50`), fibrations `degreewiseEpiWithInjectiveKernel` (`:56`), the `ModelCategory` instance (`:205`), all under `[Abelian C]` and `[EnoughInjectives C]`: as `README:92` and `:636` describe.
- `IsGrothendieckAbelian.enoughInjectives : EnoughInjectives C`, `Mathlib/CategoryTheory/Abelian/GrothendieckCategory/EnoughInjectives.lean:381` (Stacks 079H): "with enough injectives, which a Grothendieck abelian category has" at `README:460`.
- `CategoryTheory.Functor.rightDerivedFunctorPlus`, `Mathlib/Algebra/Homology/DerivedCategory/RightDerivedFunctorPlus.lean:47`, the comparison named at `README:460` and `:593`.
- `ObjectProperty.ContainsZero` (`∃ Z, IsZero Z ∧ P Z`, `Mathlib/CategoryTheory/ObjectProperty/ContainsZero.lean:38`), `IsClosedUnderKernels` and `IsClosedUnderCokernels` (kernels, respectively cokernels, of morphisms between `P`-objects lie in `P`, `ObjectProperty/Kernels.lean:76`, `:123`), `IsClosedUnderExtensions` (`P X₁`, `P X₃`, `S.ShortExact` give `P X₂`, `ObjectProperty/Extensions.lean:42`): exactly the four clauses `README:2736` and `Suggested.lean:279` state, and the kernel and cokernel clauses quantify over maps whose source and target are both in the class, as the Check at `README:2739` says.
- Mathlib's `IsAdicComplete I M` is `IsHausdorff ∧ IsPrecomplete`, that is bijectivity of `M → lim M/IⁿM`, as `README:2764` says; the statement at `Suggested.lean:262` is unchanged since r14.

**Sources for the changed passages, read in the cache with pages recomputed from the page markers.**
- Stacks, More on Algebra (`ab691797`): Lemma 15.93.1, tag 091P, line 12005, p. 261 (criteria per element `f`, including the telescope map (7) and the cohomology criterion (4)); Proposition 15.93.5, tag 091T, line 12115, p. 263 (`I` finitely generated; complete iff derived complete and `⋂ IⁿM = 0`), as `README:2764` and the docstring at `Suggested.lean:258` cite; Lemma 15.93.6(1), tag 091U, line 12125, p. 264 (any ideal; weak Serre subcategory), as `README:2736` and the docstring at `Suggested.lean:274` cite. Its proof (lines 12128–12136) is the route `README:2736` describes: the two-term complex `(M → N)` is derived complete, its cohomology is `ker` and `coker` by 091P (3)⇔(4), and extensions come from the long exact Ext sequence.
- Stacks, Injectives (`8042e600`): Theorem 19.12.6, tag 079P, line 883, p. 19, unchanged citation at `README:460`.
- BS-proet (`ae0960a2`): Proposition 3.4.2 and Remark 3.4.3, lines 979–984, p. 21; Lemma 3.4.13, line 1089, and Lemma 3.4.14, line 1097, p. 23; proof of 3.4.2, line 1131, p. 24. The locators of the two renamed sheaf targets (`README:2734`, `:2762`) are unchanged and correct.
- The seeded sample 0.1–0.4 falls in the change only at `README:460` (Section 0.2) and `README:593` (Section 0.4): the new sentences cite Mathlib declarations, checked above, and the unchanged 079P locator, checked above.

**Supplier citations and overlaps.**
- `README:2736` and `:2764` cite only Mathlib names and Section E4.1 (`README:2637`), which defines the telescope predicate `IsDerivedComplete` and exists.
- `overlaps.md`: #1187 (Tau Ceti bump chore) carries main's copy of `Suggested.lean` and bumps Tau Ceti to a revision older than the pin; it changes no content of this roadmap, so no order is needed beyond a rebase. #1330 is the conflict R01 names. No dropped id, no revision-only id, nothing this pull request drops that others cite.
- Ownership of the new definition: `roadmaps grep` for `derivedCompleteModules` and for an `ObjectProperty` of derived-complete modules finds no second owner; Mathlib at the pin has no derived-complete predicate (r14), and Tau Ceti at the pin has none (the post-pin `TauCeti.IsDerivedComplete` of r14's note is not an ancestor of `2fd255d9`).

**Remark on untouched text (no change requested).** `README:2736` says the kernel and cokernel clauses "need" the two-term complex of 091P. They also follow from the snake lemma alone, applied to `0 → ker g → M → im g → 0` and `0 → im g → N → coker g → 0` with the telescope maps (products of modules are exact); the sentence names Stacks' route, which is one valid route, and a *Needs:* line is not made mandatory by it.

**Adversarial computations.** Rows 1–11, 14–20 and 22–31 are the rows of r14 for statements the diff leaves untouched (values as computed there); rows marked "new" are computed at this head.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | `hasKInjectiveResolutions` (`Suggested.lean:101`) | r14 row 1 | `ModuleCat` instance, zero category `id`, étale sheaves via 079P | Pass (r14) |
| 2 | `locallySmall_localization_quasiIso` (`:121`) | r14 row 2 | `Hom_K(X,I)` in `Type w`; `locallySmall_max` needs `w = max u' v` | Pass (r14) |
| 3 | `hasDerivedCategory` (`:129`) | r14 row 3 | instance search returns it; `Localization.uniq` | Pass (r14) |
| 4 | `smallEtaleTopology_W_isMonoidal` (`:148`) | r14 row 4 | ∅, `Spec k`, two points: `Λ⁴` vs `Λ²` | Pass (r14) |
| 5 | Koszul Check `README:488` | r14 row 5 | `τd − dτ = 2dc⊗a ≠ 0`; sign `−1` on `K¹⊗K¹` | Pass (r14) |
| 6 | `isInvertible_iff_isUnit_toSkeleton` (`:184`) | r14 row 6 | `𝟙` T/T; `ℤ/2` F/F | Pass (r14) |
| 7 | `isRegular_of_frobenius_flat` (`:196`) | r14 row 7 | `𝔽_p[t]` T/T; `𝔽_p[ε]` F/F; `R = 0` excluded by `CharP` | Pass (r14) |
| 8 | `perfect_projectiveDimension_le` (`:207`) | r14 row 8 | `pd R/J_t = 2 = d+1`, sharp | Pass (r14) |
| 9 | `perfect_torDimension_le_two_mul_dim` (`:219`) | r14 row 9 | `Tor₂ ≅ k`, `Tor_{≥3} = 0`, `2d+1 = 3` | Pass (r14) |
| 10 | `IsDerivedComplete` (`:240`) | r14 row 10 | `ℤ_p` bijective; ℤ cokernel `ℤ_p/ℤ`; `ℤ[1/p]` kernel `(p^{−n})`; `I = 0` identity; `I = ⊤` kernel = constants | Pass (r14) |
| 11 | `isDerivedComplete_iff_derivedCompleteness` (`:247`) | r14 row 11 | ℤ: `Ext¹ = ℤ_p/ℤ ≠ 0` F/F; `ℤ/p` T/T | Pass (r14) |
| 12 (new) | `isAdicComplete_iff_derivedComplete_separated` (`:262`), docstring now 091T; `README:2764` | `ℤ_p`; ℤ; `coker ψ` of `README:2771`; 091T at line 12115 | `ℤ_p`: complete, derived complete, `⋂ pⁿℤ_p = 0` T/T; ℤ: separated, telescope cokernel `ℤ_p/ℤ ≠ 0`, `ℤ → ℤ_p` not onto F/F; `coker ψ`: derived complete by the cokernel clause of row 14, `ē₀ ∈ ⋂ pᵏM` nonzero, so `M → lim M/pᵏM` kills `ē₀` F/F; 091T is stated for finitely generated `I`, Lemma 15.93.5 sits between the markers of pp. 263 and 264, so p. 263 | Pass; locator and scope sentence right |
| 13 (new) | `derivedCompleteModules` (`:271`) | `I = 0`; `I = ⊤`; `ℤ_p`, ℤ over ℤ with `I = (p)` | `I = 0`: only `f = 0`, map `x ↦ x`, bijective, every module in the class; `I = ⊤`: `f = 1` gives `(xₙ) ↦ (xₙ − xₙ₊₁)`, kernel the constant sequences `≅ M`, so the class is `{0}`; `ℤ_p` in, ℤ out (row 10). Wrong model "bijective for a generating set of `I` only" is excluded by `∀ f ∈ I` (and would agree anyway by 091P, Lemma 15.93.3); wrong model "surjective only" admits `ℤ_p/ℤ` (row 15), excluded by `Bijective` | Pass |
| 14 (new) | `derivedCompleteModules_weakSerre` (`:279`), `README:2734`–`2741` | extension `0 → M₁ → M₂ → M₃ → 0`; `g : M → N`, `K = ker g`, `J = im g`, `C = coker g`; each telescope `T_•` for fixed `f ∈ I` | products exact, so `0 → M₁^ℕ → M₂^ℕ → M₃^ℕ → 0` is exact and the snake lemma gives `ker T₁ → ker T₂ → ker T₃ → coker T₁ → coker T₂ → coker T₃`; `T₁, T₃` bijective forces `ker T₂ = coker T₂ = 0`. From `0 → K → M → J → 0`: `ker T_K ↪ ker T_M = 0`, `coker T_K ≅ ker T_J`, `coker T_J = 0`; from `0 → J → N → C → 0`: `ker T_J ↪ ker T_N = 0`, `ker T_C ≅ coker T_J = 0`, `coker T_C ↞ coker T_N = 0`. So `K` and `C` are complete; zero is complete. Negative controls: `ℤ ⊂ ℤ_p` (ℤ not complete, row 10) and `ℤ_p ↠ ℤ_p/ℤ` (row 15) show sub- and quotient-closure fail, so `IsSerreClass` is rightly not claimed. Boundary classes `{0}` (`I = ⊤`) and all modules (`I = 0`) satisfy the four clauses (`README:2741`) | Pass, for every ideal, as 091U states |
| 15 (new) | Check `README:2740` (`0 → ℤ → ℤ_p → ℤ_p/ℤ → 0`, `I = (p)`) | telescope `T` of ℤ, of `ℤ_p`, of `ℤ_p/ℤ` | ℤ: `ker T = 0` (`x₀ = pⁿxₙ` for all `n`), `coker T ≅ ℤ_p/ℤ` via `(yₙ) ↦ Σ pⁿyₙ`, whose image of `T` is ℤ (telescoping sum) and whose kernel lies in the image (`xₙ = Σ_{m≥n} p^{m−n} yₘ ∈ ℚ ∩ ℤ_p = ℤ`); `ℤ_p`: bijective; `ℤ_p/ℤ`: `p` is onto since `ℤ_p = ℤ + pℤ_p` and injective since `px ∈ ℤ` with `x ∈ ℤ_p` gives `x = (px)/p ∈ ℚ ∩ ℤ_p = ℤ`, so `ker T ≅ ℤ_p/ℤ ≠ 0` (`xₙ₊₁ = p^{−1}xₙ`) and `coker T = 0`. Middle complete, ends not | Pass |
| 16 (new) | 0.2 bounded-below sentence `README:460`; E1.2 `README:636`, `:644`–`:646`; `README:92` | Mathlib at the pin; `P` over `ℤ/4` with `Pⁱ = ℤ/4`, `d = 2`; a degreewise epimorphism `p : K → L` of complexes strictly `≥ d` | `isKInjective_of_injective` at `KInjective.lean:134` needs `IsStrictlyGE d`; `exists_quasiIso_injective` at `CM5a.lean:668` needs `EnoughInjectives` and `IsStrictlyGE n`, supplied for Grothendieck abelian by `EnoughInjectives.lean:381`; `P`: `ker 2 = {0, 2} = im 2`, acyclic; `ℤ/4` is self-injective (its ideals `0 ⊂ (2) ⊂ (1)` are the annihilators of `(1) ⊃ (2) ⊃ 0`); every `h : Pⁿ⁺¹ → Pⁿ` is multiplication by `hₙ ∈ ℤ/4`, and `dh + hd = 1` on `Pⁿ` reads `2(hₙ₋₁ + hₙ) = 1`, even = odd in `ℤ/4`, impossible, so `P` is not contractible, hence not K-injective though termwise injective; `ker p` is strictly `≥ d` with injective terms, so K-injective by `isKInjective_of_injective`: the bounded-below fibrations agree with the unbounded ones | Pass |
| 17 | 0.2 Check `README:472` | r14 row 15 | étale `⨿_I X → X`, fibre of cardinality `|I|` | Pass (r14) |
| 18 | 0.2 Check `README:501`, 0.3 Check `:564` | r14 row 16 | `Tor_i(ℤ/2, ℤ/2)` over `ℤ/4` is `ℤ/2` for all `i` | Pass (r14) |
| 19 | 0.3 Checks `README:516`, `:530`–`:532` | r14 row 17 | `Tor₁ = ℤ/n`; `lim = ℤ_ℓ`, `lim¹ = 0`; `H¹ Rlim = ℤ_ℓ/ℤ` | Pass (r14) |
| 20 | 0.3 Checks `README:548`–`550`, `:573`–`575` | r14 rows 18–19 | completion `ℤ_ℓ`; `ℤ[1/ℓ]` not complete; `ε(Λ_X[1]) = −1` | Pass (r14) |
| 21 | 0.4 exchange direction `README:583`, E3 Check `:1341` | r14 row 20 | `fib(ℤ/p ⊗ᴸ ℤ/p → ℤ/p) = ℤ/p[1] ≠ 0` | Pass (r14) |
| 22 | E1.3 Check `README:658` | r14 row 22 | `π₀ = Ext¹ = ℤ/p`, `π₁ = ℤ/p` | Pass (r14) |
| 23 | E1.8 Check `README:950` | r14 row 23 | `0` vs `Tor₁ = ℤ/p` | Pass (r14) |
| 24 | E1.9 Check `README:1172`–`1177` | r14 row 24 | `Tor₂^B(A, C) ≅ k` | Pass (r14) |
| 25 | E2:towers Checks `README:1401`, `:1451`–`1456` | r14 row 25 | `lim¹ = ∏ℚ/⊕ℚ` | Pass (r14) |
| 26 | E2.4 window `README:2279` | r14 row 26 | `N = 1`, `N = 4` | Pass (r14) |
| 27 | E2.3 Checks `README:2212`, `:2220`, `:2234` | r14 row 27 | `RHom(ℤ[1], ℤ) = ℤ[−1]` | Pass (r14) |
| 28 | E4.5 inclusion `README:2845` | r14 row 28 | `I^{r(n−1)+1} ⊆ J_n ⊆ Iⁿ` | Pass (r14) |
| 29 | E5:animation Check `README:1991` | r14 row 29 | `H₁ = ℚ²` at `(one, one)` | Pass (r14) |
| 30 | E5 Checks `README:3002`, `:2955` | r14 row 30 | `H⁻¹ = H⁻² = k`; `H⁻¹ = εB` | Pass (r14) |
| 31 | E5:presentability Checks `README:1734`, `:1748` | r14 row 31 | `ΩΣS⁰ ≠ S⁰` | Pass (r14) |
| 32 (new) | Downstream consumers `README:3029`, `:3033`–`:3034` | `grep` on the README | 0 hits for `HodgeStructuresPartII`, 0 for `ExcursionOperatorsAndSpectralAction` outside `…PartII` (which was never cited) | r14 R04 repaired |
| 33 (new) | The description (`pull-request.md:22`) | `git diff --stat origin/main...HEAD`; `roadmaps list`; #1891 `README:1831` | `Suggested.lean` changed against "no Lean change"; #1330 open draft `856fe7a`; #1891 `bdbf9b3` "built here" | R01 |

## Not verifiable

- None was blocked. Every text consulted for the changed passages was read in the cache: Stacks More on Algebra, Stacks Injectives and BS-proet.
- Locators outside the changed passages were not re-read in this incremental round; r14 lists which it read and which it did not.

## Source issues

- **Error** in BS-proet at Lemma 3.4.14, printed p. 23: the source says the derived I-complete modules form an abelian Serre subcategory of Mod_R; it should be a weak Serre subcategory (closed under kernels, cokernels and extensions, not under subobjects: ℤ ⊂ ℤ_p); affects nothing (the proof establishes only the weak closure, and Remark 3.4.3 uses only that).
