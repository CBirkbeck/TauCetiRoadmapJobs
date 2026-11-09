# Review of AlgebraicVectorBundles (pull request #1221 at 66f47d3)

**Verdict:** needs changes

## R01 (P2) — The determinant is multiplicative only on direct sums; extensions have no owner

**Location.** `TauCetiRoadmap/AlgebraicVectorBundles/README.md:401–406` (§3.2): "For finite locally free `E` and `F`, construct the isomorphism `det(E ⊞ F) ≅ InvertibleSheaf.tensorProduct (det E) (det F)` … (Hartshorne, *Algebraic Geometry*, II, Exercise 5.16(d), for constant ranks)".

**Claim.** §3.2 states only the split case. The exercise it cites gives `det E ≅ det E′ ⊗ det E″` for every short exact sequence of locally free sheaves, and this roadmap's declared consumer needs exactly that form. No roadmap, on main or at an open head, owns multiplicativity of `det` on short exact sequences of finite locally free sheaves. PadicMeasuresIwasawaAlgebras §5.1 owns only the ring-level version for perfect complexes. Narrowing the statement below its source leaves the consumer's prerequisite unowned.

**Witness.** On main, `TauCetiRoadmap/SchemeAndStackFoundations/Suggested.lean:2562–2566` defines `K0.det` on the exact `K₀` through `TauCetiRoadmap.AlgebraicVectorBundles.determinantObj`, with `map_conflation := by sorry`. On `ℙ¹_k` the Euler sequence `0 → 𝒪(−1) → 𝒪² → 𝒪(1) → 0` does not split (`Hom(𝒪(1), 𝒪²) = 0`).

**Repair.** In §3.2, construct the following for every short exact sequence `0 → E′ → E → E″ → 0` of finite locally free sheaves:
- an isomorphism `det E′ ⊗ det E″ ≅ det E`, given locally by `e′ ⊗ ẽ″ ↦ e′ ∧ ẽ″` for any lifts `ẽ″` and independent of the lifts;
- its naturality for isomorphisms of short exact sequences;
- its compatibility with `FiniteLocallyFreeSheaf.pullbackDetIso` (see R04).

Cite Hartshorne II, Ex. 5.16(d), and Knudsen–Mumford, Chapter I. Keep the direct-sum isomorphism and its sign law `(−1)^(rank E · rank F)` as the split case. Also:
- add the Euler-sequence Check;
- name SchemeAndStackFoundations' `K0.det` under Downstream consumers;
- extend the first item of the Suggested.lean docstring's list of statements that cannot be stated at the pins to the extension form.

Test on the refuting instance: ranks `1 + 1 = 2`; `det 𝒪² = 𝒪` and `𝒪(−1) ⊗ 𝒪(1) = 𝒪`, so the isomorphism exists for the non-split sequence. The split specialisation reproduces the §3.2 Check `E = F = 𝒪_X` (sign `−1`).

## R02 (P2) — Layers 1 and 2 have a second owner in AdicSpacesPartIII

**Location.** `README.md:513–514`: "AdicSpacesPartIII uses the tensor comparison of Layer 1 and flat base change of internal Hom from Layer 2". Scope and ownership, `README.md:30–33`, claims both.

**Claim.** AdicSpacesPartIII does not consume §1.1. Its target *internal-hom-sheaf-of-modules* (§F0.8) states and proves two comparisons for every morphism of ringed spaces:
- the tensor comparison, which strictly contains §1.1;
- the flat internal-Hom comparison, which strictly contains the second statement of §2.1.

AdicSpacesPartIII also lists this roadmap's L0A/L0B among its suppliers, so neither roadmap can cite the other. The scheme case therefore has two owners.

**Witness.** Main `TauCetiRoadmap/AdicSpacesPartIII/README.md:3771–3774` ("Prove `SheafOfModules.pullbackTensorIso` (`f^*(F ⊗ G) ≅ f^*F ⊗ f^*G` for any morphism of ringed spaces) … `SheafOfModules.pullbackInternalHomIso` (for `f` flat …)"); its *Needs:* line, `:3787`, cites "AlgebraicVectorBundles layers L0A and L0B".

**Repair.** Move ownership to this roadmap, which is AdicSpacesPartIII's supplier. State three results for a morphism of ringed spaces (Mathlib `SheafOfModules.pullback`), the generality of Stacks 01CD, 02N4 and 0C6I:
- §1.1's tensor comparison;
- §2.1's exactness of flat pullback;
- §2.1's flat internal-Hom comparison.

In Suggested.lean, state the general form on Tau Ceti's oplax `SheafOfModules.pullback φ` (TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Pushforward.lean) if it elaborates; otherwise keep the `Scheme.Modules` forms and say in the docstring what is missing. Rewrite the Downstream consumers sentence to say that AdicSpacesPartIII §F0.8 *internal-hom-sheaf-of-modules* (a)–(b) cites these targets. Its restatement there is then deleted in that roadmap.

## R03 (P2) — The stalk computations behind the routes of §§1.1, 2.1 and 3.1 have no owner

**Location.** `README.md:277–280` (§1.1): "One route compares stalks: … because sheafification, inverse image and extension of scalars commute with stalks and with tensor products". The same reduction appears at `:320–322` (§2.1, exactness) and `:379–380` (§3.1).

**Claim.** All three routes need the stalk of `f^* G` and, for §3.1, the stalks of the sheaf powers. Neither is a target here, a supplier section, or a declaration at either pin. Mathlib defines module pullback only as an abstract left adjoint, with no stalk description, and Tau Ceti computes stalks only of tensor products. No *Needs:* line names these inputs.

**Witness.** Mathlib `Algebra/Category/ModuleCat/Sheaf/PullbackContinuous.lean:53` defines `pullback := (pushforward φ).leftAdjoint`. Stacks Tag 0098 (Sheaves, Lemma 26.4, p. 32) is the needed formula `(f^*G)_x = G_{f(x)} ⊗ 𝒪_{X,x}`. Searches of Mathlib and Tau Ceti at the pins find no such declaration.

**Repair.**
- Add to Layer 1 a target: the stalk of `Scheme.Modules.pullback f G` at `x` is `G_{f(x)} ⊗_{𝒪_{Y,f(x)}} 𝒪_{X,x}`, naturally in `G` (Stacks, Tag 0098).
- Add to §3.1 a target: the stalks of `SheafOfModules.symmetricPower` and `SheafOfModules.exteriorPower` are the powers of the stalk (Stacks, Tag 01CH).
- Name both in the *Needs:* lines of §1.1, §2.1 (exactness) and §3.1, together with Tau Ceti `tensorStalkEquiv` (TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Stalk.lean:132).
- Add to §2.1's *Needs:* the pinned restriction lemmas its route uses: `Scheme.Opens.isIso_pullbackIhomComparison_app` (…/Pullback/InternalHom/Restriction.lean:63) and `Scheme.Hom.isIso_pullbackIhomComparison_app_comp_iff` (…/Pullback/InternalHom/Coherence.lean:125).

Test on the refuting instance: the Check of `README.md:302–305` (`j_! 𝒪_U` on `𝔸¹_k`, pulled back to a point) is computed exactly by the Tag 0098 stalk formula together with `tensorStalkEquiv`. It gives `κ(x)` on both sides for `x ∈ U` and `0` at the origin.

## R04 (P3) — §3.2 names the fixed-rank pullback comparison for the locally-constant-rank determinant

**Location.** `README.md:410–411`: "Prove compatibility with pullback through `FiniteLocallyFreeSheaf.pullbackDeterminantIso`". The same name appears in the *Needs:* line at `:413` and in the inventory at `:78–79`.

**Claim.** `pullbackDeterminantIso f r` is a natural isomorphism of functors on `FixedRank Y r`. It cannot apply to `det (E ⊞ F)` when `E` or `F` has non-constant rank, the situation of the Check at `:423–425`. The pinned comparison for `det` is `pullbackDetIso`, which the README never names. Downstream consumers (`:515–516`) relies on that comparison for `determinantObj`.

**Witness.** Tau Ceti `VectorBundle/Determinant/Pullback.lean:76` declares `pullbackDeterminantIso (f) (r : ℕ) : determinant Y r ⋙ … ≅ FixedRank.pullback f ⋙ determinant X r`. Line `:156` declares `pullbackDetIso (f) (E : FiniteLocallyFreeSheaf Y) : (InvertibleSheaf.pullback f).obj (det E) ≅ det …`.

**Repair.** Replace the name in §3.2 and its *Needs:* line with `FiniteLocallyFreeSheaf.pullbackDetIso`. Add `pullbackDetIso` (VectorBundle/Determinant/Pullback.lean) to the determinant item of Scope and ownership. Test: on `Spec k ⊔ Spec k` with `rank E = (1, 2)`, only `pullbackDetIso` applies.

## R05 (P3) — §3.3 states a theorem with no source locator

**Location.** `README.md:431–433` (§3.3): "prove that `det E` is the associated sheaf of the ring-level determinant of PadicMeasuresIwasawaAlgebras §5.1, as an isomorphism of graded lines".

**Claim.** The affine identification carries no literature locator. PadicMeasuresIwasawaAlgebras §5.1 supplies the ring-level object, not the sheaf comparison.

**Witness.** Stacks Tag 01I8 (Schemes, Lemma 7.2(2), p. 11) proves `(∧ⁿ M)~ ≅ ∧ⁿ(M~)` canonically on `Spec R`, which is the constant-rank case of §3.3.

**Repair.** Add "(Stacks Project, Tag 01I8, in constant rank; the clopen rank decomposition of PadicMeasuresIwasawaAlgebras §5.1 in varying rank)" to the claim, and add Tag 01I8 to References. Test: `A = k × k`, `P` of rank `(1, 2)` (the Check at `:447–448`). Tag 01I8 applies on each factor, giving `∧¹` and `∧²`.

## R06 (P3) — Names this pull request drops are still cited by SchemeAndStackFoundations, with no mapping

**Location.** `README.md:250–257`, the label lines for L1A and L2A. They give Tau Ceti file paths but no names.

**Claim.** Main's Suggested.lean declared `pullbackQuasicoherentAlgebra` and `linearSpecScheme` under this roadmap's namespace, and this pull request deletes them. SchemeAndStackFoundations still cites both, and neither name exists in the pinned Tau Ceti, so the citations break when this merges.

**Witness.** Main `TauCetiRoadmap/SchemeAndStackFoundations/README.md:160` ("AlgebraicVectorBundles L1A (`pullbackQuasicoherentAlgebra`)") and `:6773` (`AlgebraicVectorBundles.linearSpecScheme X`). The open head #1656 has the same citations at lines 167, 496 and 7267; #1276 at lines 169, 422 and 6778.

**Repair.**
- To the L1A line add: "(`pullbackQuasicoherentAlgebra` is Tau Ceti's `QuasicoherentAlgebra.pullback`)".
- To the L2A line add: "(`linearSpecScheme` is Tau Ceti's `linearSpec` followed by the forgetful functor of `QuasicoherentLinearScheme X`)".

Both targets resolve at the pin (RelativeSpec/PullbackAlgebra.lean; VectorBundle/LinearScheme.lean:175).

## R07 (P3) — The Summary inventories the library instead of saying what this roadmap builds

**Location.** `README.md:3–12`: "Tau Ceti develops algebraic vector bundles over an arbitrary scheme `X` as far as … In several of these the library assumes a quasi-coherent input …".

**Claim.** Statements of what the library already has belong only in Scope and ownership. Two thirds of the Summary lists Tau Ceti's coverage, which `:42–117` repeats in full.

**Witness.** The same list appears at `:3–12` and at `:42–117`: the monoidal closed `X.Modules`, dualizability, internal Hom, powers, determinant, relative Spec, graded algebras, linear schemes and total spaces.

**Repair.** Open the Summary with what is built and from what:
- strong monoidal pullback on all `𝒪_X`-modules;
- flat base change of internal Hom into an arbitrary target;
- power comparisons for every `𝒪`-module;
- the determinant of a direct sum or extension, with its sign;
- the graded-line comparison;
- the module-scheme recognition.

Then give the end theorems, and leave the Tau Ceti inventory in Scope and ownership only.

## Verified sound

**Gate and build.**
- The worker's gate at 66f47d3 passes every check (build=0). My rerun of `gate … --base origin/main` printed `OK` with every counter 0, including outside-folder, stray-files and dropped.
- `lake env lean` on Suggested.lean gives exactly four warnings, `declaration uses 'sorry'`, at lines 88, 103, 114 and 122, and nothing else.
- The worktree is clean. The diff outside `TauCetiRoadmap/AlgebraicVectorBundles/` is empty.

**Dependency check (verbatim).** `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`.
- This roadmap is on main and is not listed in ORDER.txt.
- Its only roadmap supplier is PadicMeasuresIwasawaAlgebras §5.1, on main. That section names "AlgebraicVectorBundles L0C" as its consumer (main README:3214), so the direction of supply is consistent.

**Signatures.** I elaborated `#check @name` for all 8 declarations in one scratch copy. Each type equals its README statement and none lost a binder:
- `isFiniteLocallyFree : (X : Scheme) → ObjectProperty X.Modules`;
- `FiniteLocallyFreeSheaf : Scheme → Type (u+1)`;
- `isFiniteLocallyFreeOfRank : (X : Scheme) → ℕ → ObjectProperty X.Modules`;
- `determinantObj : FiniteLocallyFreeSheaf X → InvertibleSheaf X`;
- `pullback_tensor_isIso : ∀ (f : Y ⟶ X) (E F : X.Modules), IsIso (δ (pullback f) E F)`;
- `isIso_pullbackIhomComparison_app_of_flat : ∀ (f : X ⟶ Y) [Flat f] (M N) [IsFinitePresentation M] [IsQuasicoherent M], IsIso ((pullbackIhomComparison M f).app N)`;
- `symmetricPower_pullback_isIso` and `exteriorPower_pullback_isIso : ∀ (f : X ⟶ Y) (n : ℕ), IsIso (…Comparison f n)`.

Nothing was changed in the folder.

**Padding probe.** I ran 9 one-tactic attempts on a scratch copy and none closed:
- `infer_instance` and `simp` on each of the four theorems;
- `NatIso.isIso_of_isIso_app _` on the exterior one.

**Docstring claims.**
- Line 101–102 says instance search cannot derive quasi-coherence from finite presentation. Confirmed: a probe without `[M.IsQuasicoherent]` fails with `failed to synthesize SheafOfModules.IsQuasicoherent M`.
- The extra binder is harmless, since `IsQuasicoherent` is a `Prop` class (Mathlib `Algebra/Category/ModuleCat/Sheaf/Quasicoherent.lean:247`).

**Library declarations.**
- 108 names were checked with `#check` at Mathlib 1b1ccf4b and Tau Ceti 2fd255d9 with no error: every Mathlib name in the supplier contract, and every Tau Ceti name whose module is built.
- The other 24 were located in source with the file the README gives. Examples: `finiteProjectiveEquiv` at VectorBundle/Affine/Basic.lean:112, `gradedSymmetricAlgebraAdjunction` at …/SymmetricAlgebra/Adjunction.lean:320, `QuasicoherentLinearScheme.pullback` at VectorBundle/LinearScheme/BaseChange.lean:52, and all 13 `totalSpace…` names in VectorBundle/TotalSpace/*.
- Pinned facts the headlines extend, with file and line:

| Declaration | File and line at the pin | What it covers |
| --- | --- | --- |
| `isIso_pullback_δ_of_isQuasicoherent` | Modules/Pullback/Quasicoherent.lean:151 | tensor comparison, left factor quasi-coherent |
| `isIso_pullback_δ_of_isQuasicoherent_right` | Modules/Pullback/Quasicoherent.lean:172 | tensor comparison, right factor quasi-coherent |
| `Presentation.isIso_pullback_δ` | Sheaf/TensorProduct/Pullback/Presentation.lean:87 | tensor comparison, globally presented factor |
| `Scheme.Hom.isIso_pullbackIhomComparison_app` | Pullback/InternalHom/Flat.lean:115 | flat Hom base change, `N` quasi-coherent |
| `preservesKernel_pullback_of_flat` | Pullback/Flat.lean:162 | kernels, quasi-coherent terms only |
| `isIso_pullbackIhomComparison_of_exactPairing` | Pullback/InternalHom/Basic.lean:115 | Hom comparison, any target |
| `isIso_pullbackSymmetricPowerComparison_app` | SymmetricPower/Pullback/Quasicoherent.lean:52 | symmetric powers, quasi-coherent `M` |
| `isIso_pullbackExteriorPowerComparison_app` | ExteriorPower/Pullback/Quasicoherent.lean:53 | exterior powers, quasi-coherent `M` |
| `FiniteLocallyFreeSheaf.det` | Determinant/LocallyConstantRank.lean:62 | `⋀^{rank E}` at locally constant rank |
| `SheafOfModules.symmetricPower` | Sheaf/SymmetricPower/Basic.lean:60 | sheafified sectionwise power, so the stalk route applies |
| `Scheme.Modules.isFiniteLocallyFree` | VectorBundle/FiniteLocallyFree.lean:80 | `isLocallyFree ⊓ isFinitePresentation`, as the Conventions say |

- No headline is already at the pin.

**Headline theorems.**
- From the README's end theorems:
  1. the tensor comparison on all modules;
  2. flat Hom base change into an arbitrary target;
  3. symmetric and exterior powers commute with pullback on all modules;
  4. the determinant of a direct sum, with its sign;
  5. the affine graded-line comparison;
  6. linear schemes recognised among module schemes over `𝔸¹_X`.
- Items 1–3 are stated, as four theorems.
- Items 4–6 are named in the docstring with the missing carrier, and I confirmed each carrier is absent at the pins:
  - no sheaf exterior multiplication or biproduct determinant in Tau Ceti's ExteriorPower/ or Determinant/;
  - no `projectiveDeterminant` or graded-line declaration;
  - no weight grading attached to an `𝔸¹` action.

**The four alias declarations.** They are not needed by any headline, but they are kept because main's `SchemeAndStackFoundations/Suggested.lean:2` imports this module and uses all four (lines 1872, 2535, 2537, 2550, 2565). The open heads #1656 and #1276 of SchemeAndStackFoundations no longer import it, so the aliases can go once those merge. There is no fully-qualified-name clash with another roadmap.

**Sources: the seeded sample.** No locator is flagged as unverified. Each text below was read in a legally fetched Stacks chapter PDF.

| Target | Locator | Text read | Result |
| --- | --- | --- | --- |
| 1.1 | Tag 01CD | stacks-01CD line 1036: Modules Lemma 16.4, p. 22. For any morphism of ringed spaces and any modules, `f^*(F⊗G) = f^*F ⊗ f^*G` functorially. | Supports the statement; no flatness or quasi-coherence hypothesis. |
| 2.1 exactness | Tag 02N4 | stacks-02N4 line 1353: Modules Lemma 20.2, p. 28. Flat `f` makes `f^*` exact on all of `Mod(𝒪_Y)`; the proof is `f⁻¹` followed by `⊗ 𝒪_X`. | Supports it; the route matches. |
| 2.1 Hom | Tag 0C6I | stacks-0C6I line 1521: Modules Lemma 22.5, p. 32. `F` finitely presented and `f` flat, `G` arbitrary, give an isomorphism. | Supports `N` arbitrary, as stated. |
| 3.1 | Tag 01CI | stacks-01CI line 1404: Modules Lemma 21.3, p. 30. `f^*T(F) = T(f^*F)`, and likewise for Sym and ∧, for every `F`. | Supports it; Lemma 21.2 (01CH, line 1398) gives the stalks. |
| 3.2 | Hartshorne II Ex. 5.16(d) | not read (see below) | — |
| 3.3 | none | Tag 01I8, line 502: Schemes Lemma 7.2(2), p. 11 | Proposed in R05. |
| 4.1 grading | Tag 0EKK | stacks-0EKK line 1138: Groupoids Lemma 12.4, p. 25. A `𝔾_m`-action on an affine `X` gives a `ℤ`-grading, `A_n = {f : f_n = f}`. | The proof uses only the unit and associativity of the coaction, so it carries over to the monoid `𝔸¹` with polynomial coaction and an `ℕ`-grading, as stated. |
| 4.1 / Conventions | Tag 062M | stacks-062M line 350: Constructions Def. 6.2, pp. 8–9. Affine `π`, graded `π_*𝒪 = ⊕ E_n`, `E_0 = 𝒪`, `Symⁿ E_1 ≅ E_n`, grading-compatible morphisms; the footnote waives finite local freeness. | Matches "without finiteness". |
| 4.1 | Tag 062N | stacks-062N line 364: Constructions Lemma 6.3, p. 9. Anti-equivalence with QCoh; proof omitted. | Cited for linear schemes only; correct. |

**Adversarial pass.** The table below gives the values computed on each side.

| Statement | Instance | Left side | Right side | Result |
| --- | --- | --- | --- | --- |
| 1.1 tensor comparison | `Spec 𝔽_p → Spec ℤ`, `E = F = ℤ/p²` | `f^*(ℤ/p²) = 𝔽_p` | `𝔽_p ⊗ 𝔽_p = 𝔽_p` | iso ✓ |
| 1.1 | `𝔸¹_k`, `E = F = j_!𝒪_U`, point `x ∈ U` / origin | `κ(x)` / `0` | `κ(x)` / `0` | iso ✓; outside the pinned quasi-coherent case (`Γ(j_!𝒪_U) = 0`, stalks nonzero) |
| 1.1 | `E = 𝒪_X`, any `F` | `f^*F` | `𝒪_Y ⊗ f^*F = f^*F` | ✓ |
| 1.1 | `Y = ∅` | `0` | `0` | ✓ |
| 2.1 exactness | `Spec k[t]_(t) → 𝔸¹`, `j_!𝒪_U ↪ 𝒪` | closed pt `0 → R`, generic `k(t) → k(t)` | injective | ✓ |
| 2.1 exactness, flatness needed | closed point `i`, `t : 𝒪 → 𝒪` injective | `i^*t = 0 : k → k` | not injective | hypothesis needed ✓ |
| 2.1 Hom, flatness needed | `M = 𝒪/(t)` on `𝔸¹`, `f` = origin | `f^*Hom(M,𝒪) = 0` | `Hom(k,k) = k` | not iso; Check correct ✓ |
| 2.1 Hom, finite presentation needed | `M = 𝒪^(ℕ)`, `N = 𝒪`, `Spec ℚ → Spec ℤ` | `colim_m ∏ ℤ[1/m]` | `∏ ℚ`; `(1/p_i)` not hit | not surjective; Check correct ✓ |
| 2.1 Hom, non-quasi-coherent `N` | `M = 𝒪/(t)`, `N = j_!𝒪_U ⊕ 𝒪/(t)`, `f` = localization at 0 | skyscraper `k` at the closed point | `t`-torsion of `f^*N` = `k` at the closed point | iso ✓ |
| 2.1 Hom | `M = 0` / `M = 𝒪` | `0` / `f^*N` | `0` / `f^*N` | ✓ |
| 3.1 powers | `n = 0` | `f^*𝒪_Y` | `𝒪_X` | iso via `pullbackObjUnitToUnit` ✓ |
| 3.1 | `M = 𝒪²`, `n = 2`, `f` a point | `∧²`: `k`, `e₁∧e₂ ↦ e₁∧e₂`; `∧³ = 0` | `k`; `0` | ✓, sign `+` |
| 3.1 | `M = j_!𝒪_U`, point `x` / origin | `Sym²`: `κ(x)` / `0`; `∧²`: `0` | same | ✓ |
| 3.1 | `M = 𝒪/(t)`, origin, `n = 2` | `Sym² k = k`, `∧² k = 0` | `k`, `0` | ✓ |
| 3.2 sign | `E = F = 𝒪` | `det(swap) = −1` on `∧²𝒪²` | `comm = +1`, times `(−1)^1` gives `−1` | equal ✓ |
| 3.2 sign | `E = 𝒪²`, `F = 𝒪` | 3-cycle, `det = +1` | `(−1)^2 = +1`; the wrong sign `(−1)^(a+b)` gives `−1` | discriminates ✓ |
| 3.2 | `E = 0` | `det F` | `𝒪 ⊗ det F`, sign `+1` | ✓ |
| 3.2 | `Spec k ⊔ Spec k`, `rank E = (1,2)`, `F = 𝒪` | sign `(−1, +1)` | locally constant | ✓; needs `pullbackDetIso` (R04) |
| 3.2 extension | Euler sequence on `ℙ¹_k` | `det 𝒪² = 𝒪` | `𝒪(−1) ⊗ 𝒪(1) = 𝒪` | holds, not covered by §3.2 (R01) |
| 3.2 convention | `A = diag(2,1)` on `ℚ²` | `∧²A = 2` | the dual convention gives `1/2` | Check discriminates ✓ |
| 3.3 | `P = A` | parity 1, symmetry `−swap` | ungraded `+swap` | Check correct ✓ |
| 3.3 | `A = k×k`, rank `(1,2)` | parity `(1,0)` | `∧¹ ⊕ ∧²` | ✓ |
| 3.3 | `B = diag(t,1)` over `k[t]` | `det = t` | `t⁻¹ ∉ k[t]` | inverse convention excluded ✓ |
| 3.3 | `P = 0` | `A`, parity 0 | `∧⁰ = A` | ✓ |
| 4.1 grading | `𝔸¹`, `λ·v = λv` | `t ↦ t⊗s` | weight 1 | ✓ |
| 4.1 | `𝔾_a/𝔽₂`, `λ·v = λ²v` | `(λ+μ)² = λ²+μ²`; weight 2; `A₁ = 0` | `Sym(A₁) = 𝔽₂ → 𝔽₂[t]` not onto | module scheme, not linear ✓; over `ℚ`, `4 ≠ 2` ✓ |
| 4.1 | `α_p = Spec 𝔽_p[t]/(t^p)` | `(t⊗1+1⊗t)^p = 0`; `A_n = 𝔽_p tⁿ`, `n < p` | `𝔽_p[t] → 𝔽_p[t]/(t^p)` has kernel `(t^p)` | free generation needed ✓ |
| 4.1 degree zero | any module scheme | `0·v = 0` forces `f(v) = f(0_{p(v)})` | `A₀ = 𝒪_X` | ✓ (uses distributivity over `𝔸¹`) |
| 4.1 morphisms | `t ↦ t²` on `𝔸¹` | `(λv)² = λ²v²` | `≠ λv²`; weight `1 → 2` | neither equivariant nor graded ✓ |
| 4.1 addition | `a ∈ A₁` | `Δ(a) = b⊗1 + 1⊗c`, counit kills `A_{≥1}` | `b = c = a` | determined by the action ✓ |
| `isFiniteLocallyFreeOfRank` | `X = ∅` / `𝒪^r` / ranks `(2,1)` | true for all `r` / rank `r` / false for every `r` | matches the Conventions | ✓ |
| `determinantObj` | `𝒪^r` / `0` | `∧^r 𝒪^r ≅ 𝒪` / `∧⁰ 0 = 𝒪` | invertible | ✓ |

**Cross-roadmap citations resolved.**
- PadicMeasuresIwasawaAlgebras §5.1 on main, README:3172–3230: graded lines, parity `rank mod 2`, Koszul sign. Its Checks agree with §3.2/§3.3 (swap acts on `∧²A²` by `−1`; rank one is odd).
- The README's label lines (`:239–260`) give where L0A–L2B now resolve. That covers the dropped `§L0A`/`§L0B`/`§L0C` ids cited by:
  - AlgebraicModularFormsAndSerreWeightsPartII (#1822:9);
  - GeometricSatakeAndFusion (#1235:52, 62, 719, 744, 778, 953, 1044, 2249);
  - ExoticMonoidalStructuresAndAbstractAutomorphicity (#1737:13, 1112, 1127, 1201);
  - GenericDoublePointInterpolation (#1472:644, 860; its "affine finite-projective comparison" is `finiteProjectiveEquiv`);
  - GeneralAlgebraicKTheory (#1212:17);
  - AbundanceStatement (#545:66);
  - PhiGammaModulesAndIwasawaCohomology (#1310) and PrismaticCohomologyPartII (#1065), which I took from the overlap list without opening their heads.

  What each opened citation consumes is a mapped layer or a listed Tau Ceti file.
- Downstream consumers checked:
  - AdicSpacesPartIII on main, :3766–3787 (but see R02);
  - SchemeAndStackFoundations on main;
  - FaltingsFinitenessAndIsogenyTheorems (#1004:325, `determinantObj` "with pullback and product");
  - AbelianSchemesAndArithmeticModuli (#849:3853);
  - GroebnerGeometry, StableReduction, NilpotentOrbits, ReductiveGroups and SchubertGeometry, each of which cites this roadmap on main.
- The `roadmaps resolve` leads were none, and I found none either. Overlaps: no other open pull request changes this folder.

**Ownership by object.**
- The Layer 4 weight grading and recognition is not owned elsewhere. ReductiveGroups Layer 4 is diagonalizable groups over a field; SchemeAndStackFoundations #1656/#1276 own none of Layers 1–4.
- The sheaf direct-sum determinant appears nowhere else; PadicMeasuresIwasawaAlgebras is ring-level only.
- The only second owner found is R02.

**Pull request description.** The description still describes its first commit ("Only AlgebraicVectorBundles/Suggested.lean changes … No … README scope"). At this head the README is rewritten as well. This is not a finding about the folder; it is recorded for the human approver.

## Not verifiable

- **Hartshorne, *Algebraic Geometry*, II, Exercise 5.16(d)** (§3.2's locator). The book is a paywalled Springer text, not opened here, so I did not verify its wording, setting or hypotheses. R01 does not depend on it: its witness is the SchemeAndStackFoundations consumer and the Euler sequence.
- **Ownership against SchemeAndStackFoundations #1807, #1854 and #1808.** These appear in the overlap list, but the brief gives no checkouts for them, so ownership against them was not checked.
- **§3.3's graded-line comparison.** The ring-level objects of PadicMeasuresIwasawaAlgebras §5.1 are targets, not declarations, so nothing about §3.3 could be elaborated. It was checked by hand only (table rows 3.3).

## Source issues

- none
