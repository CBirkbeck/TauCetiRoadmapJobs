# Review of ArcTopologyAndDescent (pull request #1755 at dfd2dd1)

**Verdict:** accepted

Incremental re-review of the 12 README lines changed since 678e3cb (9 insertions, 3 deletions; `Suggested.lean` is unchanged). The one previous finding is repaired, the repair introduces no new problem, and this round raises no finding. :robot: Independent AI review.

## Previous findings

- R01 — repaired: lines 71–75 now add a Tau Ceti contract block, "The finite étale pseudofunctor FEt of §6.6 is assembled from the following pinned declarations". It names `SchPseudofunctor` (line 37), `FiniteEtaleScheme` (66), `equivOfIsSepClosed` (197), `pullback` (51), `pullbackId` (78), `pullbackComp` (96) and the two component lemmas (84, 103). Line 57 adds `AlgebraicGeometry.Scheme.etaleTopology` (line 40).

## Verified sound

**Scope and gate.**
- Head `dfd2dd1c5cae79641691f075647ff4e89dde222d` confirmed; the worktree is clean.
- `git diff --stat 678e3cb..HEAD` touches only `TauCetiRoadmap/ArcTopologyAndDescent/README.md` (12 lines). `git diff --stat origin/main...HEAD` outside the roadmap folder is empty.
- Pins: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5` in `lake-manifest.json`, matching the `.lake/packages` checkouts and the README's two pin lines (50 and 69).
- I re-ran the gate on this head. Every scanner reports 0 (set_option, sorry-data, statement-hygiene, readme-ids-missing, depcheck, stray-files, outside-folder and the rest), then `OK`. The worker's gate on the same head also reports `build=0`.
- The folder holds only `README.md`, `Suggested.lean` and `metadata.toml`.
- The standalone dependency check returned exactly:

```text
depcheck: 239 roadmaps, 2428 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. ArcTopologyAndDescent is line 103 of the merge order. The new edges point only at the pins: Mathlib `Scheme.Etale`, `Scheme.etaleTopology`, `GrothendieckTopology.HasEnoughPoints`, and Tau Ceti `Stack.Basic`, `FiniteEtale.Basic` and `FiniteEtale.Fiber`.

**Lean.**
- `lake env lean TauCetiRoadmap/ArcTopologyAndDescent/Suggested.lean` gives exactly five `declaration uses sorry` warnings, at lines 67, 79, 101, 123 and 134, and nothing else.
- The file has no diff since 678e3cb. The worker's elaborated signatures for its 10 declarations show no lost binder, so the `#check @name` comparison of earlier rounds still holds. I did not repeat it.
- Imports are `Mathlib` and `TauCeti.RingTheory.Huber.TopologicallyFiniteType.Basic` only. This matches the new sentence that "the acceptance file imports none of" the FEt declarations.
- The module docstring's §6.6 item says the headline lacks "the pseudofunctor assembled from Tau Ceti's finite etale base change". That is still accurate: the only Tau Ceti files mentioning `Pseudofunctor` are `AlgebraicGeometry/Stack/Basic.lean` and `AlgebraicGeometry/Descent/QuasicoherentSheaf.lean`, and the latter is the quasi-coherent pseudofunctor.

**Pinned declarations opened for the changed lines (17).**

Mathlib at `1b1ccf4b`:

| Declaration | File:line | What it says at the pin | README claim |
| --- | --- | --- | --- |
| `AlgebraicGeometry.Scheme.Etale` | `AlgebraicGeometry/Morphisms/Etale.lean:153` | `MorphismProperty.Over @Etale ⊤ X`; Q = ⊤ admits every X-morphism | line 57: étale objects, all X-morphisms ✓ |
| `AlgebraicGeometry.Scheme.etaleTopology` | `AlgebraicGeometry/Sites/Etale.lean:40` | `abbrev … := grothendieckTopology @Etale`. Through `Sites/Pretopology.lean:45` this is `(precoverage P).toGrothendieck`, and `Sites/MorphismProperty.lean:77` makes `precoverage P = jointlySurjectivePrecoverage ⊓ P.precoverage` with no finiteness clause (`ofArrows_mem_precoverage_iff`, `:83`) | line 57: jointly surjective étale families, no quasi-compactness ✓ |
| `AlgebraicGeometry.Scheme.smallEtaleTopology` | `Sites/Etale.lean:50` | `X.smallGrothendieckTopology (P := @Etale)` on `X.Etale` | line 57: induced on X.Etale ✓ |
| `AlgebraicGeometry.Scheme.pointSmallEtale` | `Sites/EtalePoint.lean:63` | a point of `smallEtaleTopology S` for `s : Spec (.of Ω) ⟶ S`, with `[Field Ω] [IsSepClosed Ω]` (variables at `:32`) | line 57 ✓ |
| `CategoryTheory.GrothendieckTopology.HasEnoughPoints` | `CategoryTheory/Sites/Point/Conservative.lean:257` | there exists a `w`-small `ObjectProperty` of points that is a conservative family | line 57: "small conservative family" ✓ |
| instance `HasEnoughPoints.{u} (smallEtaleTopology S)` | `Sites/EtalePoint.lean:157` | built from `isConservativeFamilyOfPoints_pointSmallEtale'` (`:147`), with points at separable closures of residue fields; `S : Scheme.{u}` is arbitrary, with no noetherian hypothesis | line 57 ✓ |
| `CategoryTheory.Over.pullback`, `Over.pullbackId`, `Over.pullbackComp` | `CategoryTheory/Comma/Over/Pullback.lean:59, 105, 109` | within `namespace CategoryTheory.Over` (lines 42, 50–187); `pullbackComp f g : pullback (f ≫ g) ≅ pullback g ⋙ pullback f` | line 65 line numbers ✓ |

Tau Ceti at `2fd255d9`:

| Declaration | File:line | What it says at the pin | README claim |
| --- | --- | --- | --- |
| `TauCeti.AlgebraicGeometry.SchPseudofunctor` | `AlgebraicGeometry/Stack/Basic.lean:37` | `abbrev … := Pseudofunctor (LocallyDiscrete Scheme.{u}ᵒᵖ) Cat.{u, u + 1}` | line 73: carrier type only, no stack condition ✓ |
| `TauCeti.FiniteEtaleScheme` | `AlgebraicGeometry/FiniteEtale/Basic.lean:66` | `(finiteEtaleSchemeProperty S).FullSubcategory`, where `finiteEtaleSchemeProperty S : ObjectProperty (Over S)` is `(@IsFinite ⊓ @Etale).overObj` (`:44`) | line 74 ✓ |
| `TauCeti.FiniteEtaleScheme.equivOfIsSepClosed` | `FiniteEtale/Basic.lean:197` | `(K : Type u) [Field K] [IsSepClosed K] : FiniteEtaleScheme (Spec (.of K)) ≌ FintypeCat.{u}`; `equivOfIsSepClosed_functor` (`:207`) says the functor is `finiteSpec` of the coordinate algebra | line 74 ✓ |
| `TauCeti.FiniteEtaleScheme.pullback` | `FiniteEtale/Fiber.lean:51` | `(f : T ⟶ S) : FiniteEtaleScheme S ⥤ FiniteEtaleScheme T`, lifted from `Over.pullback f`; `pullback_obj_obj` (`:66`) and `pullback_map_hom` (`:72`) hold by `(rfl)` | line 75: equal to `Over.pullback f` on objects and morphisms ✓ |
| `pullbackId`, `pullbackId_hom_app_hom` | `Fiber.lean:78, 84` | `pullback (𝟙 S) ≅ 𝟭 _`; the component lemma holds by `(rfl)` | line 75 ✓ |
| `pullbackComp`, `pullbackComp_hom_app_hom` | `Fiber.lean:96, 103` | `(f : T ⟶ S) (g : S ⟶ U) : pullback (f ≫ g) ≅ pullback g ⋙ pullback f`; the component lemma holds by `(rfl)` | line 75 ✓ |
| the rest of `Fiber.lean` | lines 51–194, 25 declarations | `pullback*`, `fiber*`, `fiberIdIso*`, `pullbackCompFiberIso*`: none is a pseudofunctor or a unit or associativity law | line 75: "assembles no pseudofunctor … states no coherence law" ✓ |

**Supplier sections resolved on main (eaf17b1).**
- EtaleCohomologyFoundations §F.0.2 (README lines 200–219) says, for any scheme X, to use `TauCeti.FiniteEtaleScheme X` and to "supply pullback, … effective descent and finite-group quotients on this carrier". Its supplier table (line 39) says §F.0.2 uses the Tau Ceti carrier.
- So the changed scope row 28 is consistent with its supplier: "the finite étale carrier with its base change, both already in Tau Ceti at the pin … and effective descent". The carrier and base change are Tau Ceti's; the descent is ECF's.
- Contract line 117 is consistent with this. It names the carrier by its Tau Ceti name and credits §F.0.2 with descent "on this carrier".

**Ownership and overlaps.**
- `roadmaps grep 'FiniteEtaleScheme\.pullbackComp|SchPseudofunctor'` and `roadmaps grep -i 'finite étale pseudofunctor|finiteEtalePseudofunctor'` ran over main and all 472 open heads.
  - The only finite étale pseudofunctor on schemes is FEt here, §6.6.
  - AdicEtaleGeometry's `Huber.finiteEtalePseudofunctor` (main, line 2680) lives on Huber pairs.
  - The SchemeAndStackFoundations revisions mention `SchPseudofunctor` only for quasi-coherent sheaves and stacks in groupoids.
- `scratch/overlaps.md` lists:
  - no other open pull request changing this roadmap;
  - no dropped id;
  - no id that only an open revision defines.
- The worker's three `resolve` leads:
  - PerfectoidSpacesPartII §RA.2 is a board design, unchanged; main has only `PerfectoidSpaces`.
  - `Etale.artinSchreier_vanishing` is in SchemeAndStackFoundations on main, line 3692.
  - `Topos.isQuasiseparated_iff_of_cover` is in AdicSpacesPartII on main, line 8039.
- The four declared gaps are untouched by the diff.

**Sampled target in the changed passages.**
- §6.2 (Strict-henselization detection of descent) depends on the changed Mathlib bullet, which now says "§6.2 uses it" of the enough-points instance.
- The locator holds. BM21 Lemma 5.1 is at BM21 line 1519, on p. 37 (page marker at line 1505, the next at line 1551). Its hypotheses are a ring Λ and a finitary `D(Λ)^(≥0)`-valued functor with étale descent. Its conclusion is descent for f when every base change to a strict henselization is of F-descent. Both match the README sentence.
- The source proof (BM21 lines 1522–1534) regards both sides as sheaves on the small étale site and concludes by enough points. That is the route at README line 896 through `pointSmallEtale` and the `HasEnoughPoints` instance.
- The other fourteen seeded targets (§§2.3, 2.7, 3.4, 3.5, 3.10, 4.1, 4.2, 4.3, 6.1, 7.5, 9.1, 9.2, 11.2, 11.3) neither change nor cite a changed line. They were not re-verified in this incremental round.
- The README flags no locator as unverified.

**Adversarial table.** Fresh rows for every changed statement come first, then the inherited rows, each citing the review that computed it.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Line 57: `Scheme.etaleTopology` has no quasi-compactness condition | X = ⊔_{n∈ℕ} Spec k with its component inclusions; X = Spec ℤ with {Spec ℤ[1/2], Spec ℤ[1/3]} | `ofArrows_mem_precoverage_iff` needs only joint surjectivity and étaleness. The infinite family covers, and no finite subfamily does. The two-member family covers: (2) ∈ D(3), (3) ∈ D(2), (p) and (0) are in both | claim exact | none |
| Line 57: `etaleTopology` is the topology of FEt's étale stack property | universes; X = ⊔_{n∈ℕ} Spec k | The topology is on `Scheme.{u}`, the base of `SchPseudofunctor`. FEt(⊔ Spec k) = ∏_n FinSet, and descent along the inclusions is effective because finite morphisms are affine and étale families are fpqc | consistent with §6.6 (line 914) | none |
| Line 57: `Scheme.Etale` has all X-morphisms | X = Spec k; objects Spec k and Spec k ⊔ Spec k | Q = ⊤. Hom_X(Spec k ⊔ Spec k, Spec k) has 1 element (the fold map); Hom_X(Spec k, Spec k ⊔ Spec k) has 2 | claim exact | none |
| Line 57: `pointSmallEtale` at a geometric point | s : Spec ℂ → Spec ℝ; U = Spec ℂ and U = Spec ℝ étale over ℝ | fibre = Hom_ℝ(Spec ℂ, U): 2 elements for Spec ℂ (identity and conjugation), 1 for Spec ℝ | stalk functor as stated | none |
| Line 57: the enough-points instance has no noetherian hypothesis | S = Spec V, V of rank two (not noetherian); S = Spec ℤ | Points are indexed by s ∈ S at separable closures of κ(s): 3 points for Spec V; for Spec ℤ, ℚ^sep at (0) and 𝔽_p^sep at (p). `S : Scheme.{u}` is arbitrary at `EtalePoint.lean:32` | claim exact | none |
| Line 65: `Over.pullback`, `pullbackId`, `pullbackComp` line numbers | grep at the pin | 59, 105, 109, all within `namespace Over` (50–187) | exact | none |
| Line 73: `SchPseudofunctor` | the type and its fields | `Pseudofunctor (LocallyDiscrete Scheme.{u}ᵒᵖ) Cat.{u,u+1}`, an `abbrev` with no `IsPrestack` or `IsStack` field | "only a carrier type" exact | none |
| Line 74: universes of `FiniteEtaleScheme S` | `Over S` for `S : Scheme.{u}` | Objects carry a `Scheme.{u} : Type (u+1)`, so they live in Type (u+1). Morphisms carry `left : Y ⟶ Y'` in Type u, and the `Discrete PUnit` component is in Type 0, so max u 0 = u. `FullSubcategory` keeps the hom universe | fits `Cat.{u,u+1}` | none |
| Line 74: `equivOfIsSepClosed` and Check 1 of FEt | K = ℂ; objects ∅, Spec ℂ, Spec (ℂ × ℂ) | `finiteSpec` (by `equivOfIsSepClosed_functor`, `Basic.lean:207`) gives the prime spectra of 0, ℂ, ℂ × ℂ with 0, 1, 2 points | matches Check 1 (empty ↦ empty set, Spec Ω ⊔ Spec Ω ↦ two elements) | none |
| Line 75: `pullback f` equals `Over.pullback f` | f : Spec ℂ → Spec ℝ; X = Spec ℂ over ℝ | `pullback_obj_obj` holds by `rfl`. (pullback f).obj X = Spec (ℂ ⊗_ℝ ℂ) ≅ Spec (ℂ × ℂ), 2 points over 1 | exact; agrees with Check 2 of FEt | none |
| Line 75: direction of `pullbackComp` | f : Spec ℂ → Spec ℝ, g : Spec ℝ → Spec ℚ | (f ≫ g)ᵒᵖ = gᵒᵖ ≫ fᵒᵖ, so the pseudofunctor's `mapComp gᵒᵖ fᵒᵖ` is F(f ≫ g) ≅ F g ⋙ F f, which is exactly `pullbackComp f g : pullback (f ≫ g) ≅ pullback g ⋙ pullback f` | consistent | none |
| Line 75: component lemmas hold definitionally; no coherence in the module | `Fiber.lean:84, 103`; its 25 declarations | Both proofs are `(rfl)`. No declaration is a pseudofunctor or relates `pullbackComp` to `pullbackId` or to itself | exact; §6.6 owns the assembly | none |
| Scope row 28 | ECF main lines 39 and 200–219 | ECF uses `TauCeti.FiniteEtaleScheme X` and supplies effective descent "on this carrier"; Tau Ceti has the carrier and `pullback` at the pin | single owner for each object | none |
| §6.2 locator and route (sampled) | BM21 lines 1505, 1519–1534, 1551 | Lemma 5.1 is on p. 37; hypotheses Λ, finitary `D(Λ)^(≥0)`, étale descent; proof by enough points of the étale site | exact | none |
| Line 99 (now 105), Scope row 27, Conventions 44: directions of the étale functors (carried from r5) | `f : X ⟶ Y`; G = `Over.pullback f` | G : Y.Etale ⥤ X.Etale (V ↦ V ×_Y X); `G.sheafPullback : Sh(Y_ét) → Sh(X_ét)` is left adjoint to `G.sheafPushforwardContinuous`; `J.overPullback A U` is restriction | directions match f⁻¹ ⊣ f_* and restriction | none |
| §0.23a only for universal homeomorphisms (carried from r5) | fold map X ⊔ X → X; Spec k → Spec k[ε]/ε² | the fold map has 2 points over 1, so it is not a universal homeomorphism; the thickening is | consistent | none |
| `mapPullbackAdj` for étale f; §10.0 torsion bullet (carried from r5) | P = `@Etale`, Q = ⊤; h : U → X étale | (h⁻¹F)(V) = F(V → U → X), and V → X is affine étale, so n_V kills the section | holds | none |
| §6.6 FEt definition, Checks 1–3, étale stack property from ECF §F.0.2, three-pseudofunctor statement (carried from r5) | Spec ℂ → Spec ℝ; ℚ̄ over ℚ; Y = {a,b} × Spec ℂ | ℂ ⊗_ℝ ℂ ≅ ℂ × ℂ; Aut(f*) ≅ ℤ/2; the swap gives 1 point and the identity gives 2; Spec ℚ̄ → Spec ℚ is not finite | correct | none |
| §6.6 arc stack target and its Checks; route via `IsStack.of_precoverage` (carried from r5, r4) | rank-two aic V; Spec k → Spec k[ε]/ε²; the empty family | V_p ⊗_V V/p = κ(p) and all four categories are FinSet; the Čech nerve is constant and h_{A¹} fails; FEt(∅) is terminal | correct | none |
| §§3.3, 4.6, 6.1 locators (carried from r5) | BM21 lines 703, 712, 1009, 1030, 1145, 1322, 1556 | pp. 17, 17–18, 25, 25, 28–29, 32, 38 | exact | none |
| §5.1 remark; §9.7 noetherian Check (carried from r4) | κ < κ′; B = k + t·k[t,x] | B[x] = k[t,x], and x·k[x] is infinite-dimensional | correct | none |
| §9.7, §9.10, monomial Check, §9.8, §2.2 supplier comparison (carried from r3 and the second review) | A = ℤ, t = 2; A = k[t,tx,x²]; t = 1; A = B = 0; j = 0..3 over 𝔽₂, 𝔽₃ | ℤ^tic = ℤ; x ∈ A^tic = k[t,x]; B = A; all zero; x ∉ A^tic at n = (c+1)² | correct | none |
| §§0.1, 0.5, 0.6, 1.1, 1.6, 1.7, 2.3, 2.5, 2.7, `IsSchemeArcCover`, `arc_spectral_characterization`, `isSchemeArcCover_of_isLimit` (carried from the first review) | k algebraically closed; ℚ; 𝔽₂ × 𝔽₃; zero ring; rank-two V; k[ε]/ε² → k; the 8 subsets of {0,p,m}; ∅ → Spec k | T² − 2 has no root in ℚ; (V/p)_p = κ(p); V → V_p × V/p is arc but not v; inverse images are open exactly for ∅, {0}, {0,p} and all of {0,p,m}; the limit hypothesis is needed | correct | none |
| §§3.1, 3.6–3.8, 3.10, 4.1, 4.3–4.5, 5.1–5.2, 7.3, 7.6, 8.1, 8.5, 8.8, 9.2, 9.4, 9.9; `IsPerfectFpScheme`, `QcqsPerfectFp`, `arcCover_iff_universallyEffectiveEpi` (carried from the first review) | `D(Λ)^(≥0)`; lexicographic rank two; Λ = ℤ/4; 𝔽_p[ε]/ε²; p = 1, 0, 4; t = 0, a unit, a field K | Tor_i(ℤ/2, ℤ/2) = ℤ/2; ε^p = 0 kills injectivity; p = 1 and p = 0 force ∅, p = 4 admits Spec 𝔽₂; E_t(K) = 0 ≠ RΓ(Spec K) | correct | none |
| §10.0 predicates, §§10.1–10.2, 10.5–10.7, `affinoid_artin_grothendieck`, §§11.1, 11.4–11.5, 12.2, 12.6–12.7 (carried from the first review) | n = 0; K⟨T⟩/(T²); ℤ/6; ⊕ ℤ/ℓ^r; ℓ = 1, 0; ‖2‖ = 1/2; I = (2,3) | values K, 0 and a nonzero square-zero class; the zero sheaf only for ℓ = 1; the residue hypothesis fails for ℓ = 2 over ℚ₂ | correct | none |

**Shape.**
- The changed scope row, Mathlib bullets and Tau Ceti block add no process words, pull-request numbers, machine paths or LaTeX. "At the pin" is the phrasing used across 37 roadmaps on main.
- No backticked name of this roadmap's own was added. Every new backticked name is a pinned Mathlib or Tau Ceti declaration and resolves at the stated file and line.

## Not verifiable

- HUB96 remains settled as uncertified; nothing in this change cites it.
- The first review's limitation on the precise definitions of RYD10's E_qc, E_sep,qc and E_fin carries forward; that declared contract is untouched.
- PerfectoidSpacesPartII exists only as a board design; its target was read in an earlier round and is unchanged.

## Source issues

- none
