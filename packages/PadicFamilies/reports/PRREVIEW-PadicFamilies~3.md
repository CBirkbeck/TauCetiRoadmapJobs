# Review of PadicFamilies (pull request #1019 at 511de39)

**Verdict:** needs changes

Incremental re-review of the 56 changed lines since `f3b762c`, plus the merge from main that moved the Mathlib and Tau Ceti pins. The three findings of the previous review are repaired. The new class-set citations in Layer 5 point to supplier sections and declarations that do not exist at the suppliers' heads (R01, P1). The targeted build now fails the gate on Lake's module-system warning (R02). Three smaller P3 items come from the same edits or from the pin move.

## R01 (P1) — Layer 5's class-set supplier is cited at sections and declarations that do not exist

**Location:** `TauCetiRoadmap/PadicFamilies/README.md:97`, "`GL2AutomorphicRepresentationsAndTransfer`, §R17.3.8b (*Quaternionic level forms, evaluation and norms*) … `quaternionLevelForms_finite` … `HilbertModularVarietiesAndShimuraCurves`, §R18.5.16b (*Class-set refinement fibres*), `exists_equiv_refinementFiber` … `card_doubleCoset_eq_sum_card_orbits`". The same two citations appear at lines 17, 2682, 2684, 2686, 2703, 2713, 2717, 2739, 2743, 2757, 2761, 2769 and 2991.

**Claim:** GL2AutomorphicRepresentationsAndTransfer §R17.3.8b and HilbertModularVarietiesAndShimuraCurves §R18.5.16b supply open-level class-set finiteness, representatives, refinement maps and their fibres `Γ_x\U/U′`, and level forms with restriction and trace, under the four named declarations.

**Witness:**
- GL2AutomorphicRepresentationsAndTransfer at its head `8d94672`, README:83 and :88, says that the identifiers R17.3.8a–d name no target of that roadmap, and that R17.3.8b resolves to QuaternionicModularForms §2.1.
- HilbertModularVarietiesAndShimuraCurves at its head `cd70693` goes straight from §R18.5.16a (README:2353) to §R18.5.16c (README:2382).
- `roadmaps grep --fixed` finds `quaternionLevelForms`, `quaternionLevelForms_finite`, `exists_equiv_refinementFiber`, `card_doubleCoset_eq_sum_card_orbits` and both italic titles only in this README. The citation resolver missed them because its only hits are self-hits.

**Repair:** cite the owner. QuaternionicModularForms (#934, head `f7ed2fe`, merge order 70, already in this pull request's merge-order chain) states every item line 97 lists:
- §0.3 *Class-set refinement* (README:345): finiteness of `Cl(U)` for every open `U`, representatives, surjective refinement maps.
- Its *Refinement fibres* paragraph (README:353): the fibre over `ΓxU` is `Γ_x\U/U′`, the class-count formula, and compatibility with change of representative and with composite refinements.
- §2.1 *Forms on `D_fˣ` and their Banach structure* (README:606), *Finiteness* (README:615) and *Levels* (README:619): the evaluation equivalence, finiteness and the free rank `#Cl(U)·r` under trivial stabiliser action, representatives `c_iu`, injective restriction, and `tr∘res = [U:U′]`.

The edit:
- Replace each "GL2AutomorphicRepresentationsAndTransfer §R17.3.8b" by "QuaternionicModularForms §2.1" (and §0.3 where finiteness or refinement maps are meant).
- Replace each "HilbertModularVarietiesAndShimuraCurves §R18.5.16b" by "QuaternionicModularForms §0.3, *Refinement fibres*".
- Delete the four backticked names and the two invented italic titles.
- Keep HilbertModularVarietiesAndShimuraCurves §R18.5.16a for the maximal order and the splittings. That section exists: items 2–3 there give `j_v(R_v) = O₀(𝔭_v^0) = M₂(O_v)` for a maximal order at every split place.

With these citations, line 97 checks against QuaternionicModularForms README:345–381 and 606–661 sentence by sentence. HilbertModularVarietiesAndShimuraCurves itself consumes those QuaternionicModularForms sections (its README:134). AutomorphicGaloisRepresentations (#1007, README:312) describes a §R18.5.16b that its supplier does not contain either. That is outside this folder, but it shows the section was never added.

## R02 (P3) — The targeted build fails the gate on Lake's module-system warning

**Location:** `TauCetiRoadmap/PadicFamilies/Suggested.lean:1`, `import Mathlib` in a non-`module` file.

**Claim:** the gate passes.

**Witness:** `gate … --build` at this head reports `build=2 FAIL`, twice the same line: "`Suggested.lean`: imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file". The merge from main moved the pins to Mathlib `1b1ccf4` on `leanprover/lean4:v4.36.0-rc2`. Without `--build` every other counter is 0. `lake env lean` reports only the three `sorry` warnings.

**Repair:** use the module form that the sibling `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/Suggested.lean` uses at its head:
- line 1 `module`;
- then `public import Mathlib`;
- `public section` before `namespace TauCetiRoadmap.PadicFamilies`;
- a closing `end` after the namespace's `end`.

Tested on a scratch copy with exactly these four edits: `lake env lean` gives exactly three warnings, `declaration uses sorry` at the three theorems, and no error. Rerun the gate with `--build`. I grade this P3 rather than a failed build: the build completes and every statement elaborates, and the only non-`sorry` output is Lake's warning about the file's form. While the gate fails, the folder cannot be accepted.

## R03 (P3) — The supplier contract names pins the roadmap no longer builds against

**Location:** `TauCetiRoadmap/PadicFamilies/README.md:35`, "At Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, use …".

**Claim:** these are the pins.

**Witness:** `lake-manifest.json` at this head pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, brought in by the merge of `origin/main`.

**Repair:** replace the two hashes by the current ones, or write "At the pinned Mathlib and Tau Ceti". I re-located every library declaration the README names at the new pins (table below). All of them still exist with the meaning the README states, so no other text changes. The one API change at the new pin (`CategoryTheory.End` is now a structure with field `asHom`) is already handled by the `e.asHom` edit at `Suggested.lean:109`.

## R04 (P3) — §5.6 still uses the notation the edit removed from §§5.2–5.5

**Location:** `TauCetiRoadmap/PadicFamilies/README.md:2773`, "suppose `U/(U∩F^×)` acts freely on `D^×\G^D(A_f)`".

**Claim:** the hypothesis is stated in the roadmap's notation.

**Witness:** the edit replaced `D^×\G^D(A_f)/U` by `Cl(U) = D^×\D_f^×/U` in §§5.2–5.5 (lines 2682, 2717, 2743, 2761). `grep -F 'G^D'` now finds only line 2773, and `G^D(A_f)` is defined nowhere in the README.

**Repair:** write "acts freely on `D^×\D_f^×`". With the identification of §5.2, `D_f^× = GL₂(𝔸_{F,f})`, this is Skinner–Wiles's `G^D(𝔸_f)`, so the hypothesis does not change.

## R05 (P3) — §4.4's dependency line omits the construction its new locator names

**Location:** `TauCetiRoadmap/PadicFamilies/README.md:2508` ("the construction itself is that of `SelmerIwasawaCohomology`, §§2.21 and 3.8–3.10") and line 2510 ("This uses §4.2; §4.3; `SelmerIwasawaCohomology`, §§3.8–3.10; `SelmerIwasawaCohomology`, §§3.8–3.10; `SelmerIwasawaCohomology`, §3.9; …").

**Claim:** the dependency line lists what the statement and route of §4.4 use.

**Witness:** the route applies "the lower-tier Selmer fibre construction", which is SelmerIwasawaCohomology §2.21 *Selmer complex as a mapping fibre* (its README:849, head `ebadda3`). §2.21 is missing from line 2510, while §§3.8–3.10 appear twice and §3.9 a third time.

**Repair:** "This uses §4.2; §4.3; `SelmerIwasawaCohomology`, §2.21; `SelmerIwasawaCohomology`, §§3.8–3.10; `SelmerIwasawaCohomology`, §3.14."

## Previous findings

- R01 — repaired: README:43 "Its §2.2 (*Finite local factors*) supplies the finite local factors of `B`"; :91 "the theta sequence (*The theta exact sequence*) … decency of a refinement (*Criticality and decency*) … (*Secondary and family L-functions*)"; :128 `characterEisenstein_stabilized_qExpansion`; :1636 "§4.16, *Characteristic series of a compact complex representative*".
- R02 — repaired: README:2508 "[Ochiai](#ochiai), §1, pp. 116–117, for the local conditions, and [EPW](#epw), Definition 3.2.1(2), p. 24, for the shape of the condition at `p`" (its dependency line is R05).
- R03 — repaired: README:17 "Layer 2a is the general eigenvariety machine, for an arbitrary `(Pr)` module with a commuting Hecke algebra, and owns [Buzzard](#buzzard), §§4–5, in that generality; AutomorphicGaloisRepresentations §0.3 is its earlier quaternionic instance".

## Verified sound

### Repairs of the previous findings, resolved at the suppliers' heads

| Citation at this head | Where it resolves | Result |
|---|---|---|
| IntegralHeckeAndGaloisDeterminants §2.2 *Finite local factors*, *Specified idempotent summands* | #1689 `0609cf2`, README:2868, :2877, inside §2.2 (README:2843–2902) | present |
| ModularSymbolsPadicLFunctions §3.0 *The theta exact sequence*, *Criticality and decency*, *Secondary and family L-functions*, map `Θ_k` | #968 `1c1215a`, README:1937 (`Θ_k(μ)(g)=μ(g^(k+1))`), :2051, :2108, all before §3.1 at :2137 | present |
| DirichletPadicLFunctions §5.9, `characterEisenstein_stabilized_qExpansion`, arithmetic-family interpolation, conditional low-weight comparison | #1039 `016e54c`, README:1748–1765; `Suggested.lean:372` | present |
| LocallyAnalyticDistributions §4.16 *Characteristic series of a compact complex representative* | #854 `473fb50`, README:3088 ("finite nonalternating product … not an invariant of the homotopy class"), inside §4.16 (:3035–3226) | present, and matches §2a.15's "without alternating exponents" |
| EPW Definition 3.2.1(2), p. 24 | epw lines 1134–1138 (arXiv v1 PDF page 24): the condition at `v_p` is the kernel of restriction to `H¹(I_{v_p}, Ā″⊗ωⁱ)`, the Greenberg shape | supports the narrowed claim |
| SelmerIwasawaCohomology §§2.21, 3.8–3.10, 3.14 | #869 `ebadda3`, README:849, :1511, :1537, :1562, :1631 | present (R05 for the dependency line) |
| AutomorphicGaloisRepresentations §0.3 *Quaternionic finite-slope families* | #1007 `4ac373d`, README:1205; its sources (README:1294–1295) are Buzzard §5, Lemmas 5.4–5.6, Construction 5.7, Lemmas 5.9–5.10; no citation of PadicFamilies anywhere in it | the scope sentence is accurate and creates no back-edge |
| HilbertModularVarietiesAndShimuraCurves §§R18.3.1, R18.3.4, R18.3.5, R18.3.6, R18.3.22, R18.5.16a | #1005 `cd70693`, README:2754, :2830, :2842, :2854, :3167, :2353 | present |

The supplier heads were confirmed current with a read-only lookup: #931 `8d94672`, #1005 `cd70693`, #934 `f7ed2fe`, #1007 `4ac373d`.

### Gate, dependency check, folder

- Gate without `--build` (my run): every counter 0, `OK`. With `--build`: `build=2 FAIL` (R02). The worker's gate file agrees. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PadicFamilies'` is empty, and the folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- Dependency check (my run):

```text
depcheck: 240 roadmaps, 2444 edges, 0 problem(s)
```

  It shows no UPWARD, CYCLE or `moved:` line. Merge-order positions: this roadmap 168. Suppliers: IntegralHeckeAndGaloisDeterminants 27, IntegralIwasawaTheory 29, NoncommutativeAndEquivariantIwasawa 30, PhiGammaModulesAndIwasawaCohomology 32, ArithmeticGaloisDuality 47, FiniteFlatGroupsAndIntegralPadicHodgeTheory 50, SelmerIwasawaCohomology 55, DeformationAndDerivedPatchingAlgebra 65, QuaternionicModularForms 70 (the R01 repair target), LocallyAnalyticDistributions 71, ModularCurvesPartII 79, GlobalGaloisDeformations 81, DirichletPadicLFunctions 87, AlgebraicModularFormsAndSerreWeights 93, GL2AutomorphicRepresentationsAndTransfer 94, ModularSymbolsPadicLFunctions 115, WeightsInEtaleCohomology 144, HilbertModularVarietiesAndShimuraCurves 157, SerreWeightAndLevelOptimisation 160, AutomorphicGaloisRepresentations 162 (scope mention only). Consumers come later: OrdinaryAutomorphicFormsAndModularityLifting 169, OverconvergentAutomorphicForms 251, PadicFamiliesPartII 256, ModularIwasawaMainConjectures 365.
- No declared gaps: no `gap:` slug in the README and no readable `design/plan.json`.
- Overlaps: `overlaps.md` lists no open pull request that changes this roadmap and no dropped id. This pull request drops no heading. The edit removes every citation of QuaternionicModularForms; R01 restores the correct ones.

### Lean form, at the new pins

- `lake env lean TauCetiRoadmap/PadicFamilies/Suggested.lean` gives exactly three warnings, `declaration uses sorry` at lines 53, 89 and 115. The file has a single `import Mathlib`, no `set_option`, no `lemma`, no sorry'd data, and three real-bodied definitions.
- The `#check @` scratch file for all six declarations elaborates. The elaborated types are identical to `signatures.md`, and each agrees with its README statement (§0a.19, §0a.22, §0a.0.2, §0a.17, §0a.25). The flagged "dropped" binders are `HasDerivedCategory` in `CompleteFlatComplex` and `IsLocalRing` in `HasFiniteProjectiveModel`, which those predicates do not use. `perfect_complex_ordinary_projector` keeps an unused `HasDerivedCategory` instance. Nothing changed from the previous round.
- The one Lean change, `π ≫ ι = e.asHom`, adapts to the new pin: `CategoryTheory.End` is now `structure End … where of :: asHom : X ⟶ X`, with `mul f g := .of (g.asHom ≫ f.asHom)` (`Mathlib/CategoryTheory/Endomorphism.lean:34–60`). Idempotence, `t^{n!}` and `R[t]`-membership do not depend on the multiplication order, so the statement means what it meant before.
- One-tactic probe: with `simp` in place of each `sorry`, the scratch copy leaves all three goals unsolved (probe lines 66, 109, 136). There is no padding.
- Headlines are unchanged: §0a.22, §0a.17 and §0a.25 are stated. The docstring (lines 15–33) names the arithmetic headlines that are not statable at the pins. At the new Tau Ceti pin, `grep` still finds no `Igusa`, `igenvariet`, `verconvergent`, `Hida` or `Robba` carrier.

### Library declarations re-located at the new pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`)

| Declaration | File:line |
|---|---|
| `IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean:57` |
| `LinearMap.isCompl_iSup_ker_pow_iInf_range_pow`, `eventually_isCompl_ker_pow_range_pow`, `eventually_iInf_range_pow_eq` | `Mathlib/RingTheory/Artinian/Module.lean:316`, `:307`, `:197` |
| `LinearMap.eventually_iSup_ker_pow_eq` | `Mathlib/RingTheory/Noetherian/Defs.lean:176` |
| `Ideal.finite_quotient_pow`, `IsLocalRing.finite_quotient_iff` | `Mathlib/RingTheory/Ideal/Quotient/Index.lean:103`, `Mathlib/RingTheory/LocalRing/Quotient.lean:132` |
| `nonempty_sections_of_finite_cofiltered_system`, `…_inverse_system`, `Functor.sections` | `Mathlib/CategoryTheory/CofilteredSystem.lean:79`, `:111`, `Mathlib/CategoryTheory/Types/Basic.lean:221` |
| `Module.AEval'`, `LocalizedModule`, `LocalizedModule.mk`, `IsLocalizedModule` | `Mathlib/Algebra/Polynomial/Module/AEval.lean:194`, `Mathlib/Algebra/Module/LocalizedModule/Basic.lean:88`, `:100`, `:536` |
| `CharacterModule` | `Mathlib/Algebra/Module/CharacterModule.lean:43` (still `A →+ AddCircle (1 : ℚ)`, algebraic) |
| `FractionRing`, `MvPowerSeries`, `IsDedekindDomain.FiniteAdeleRing` | `Mathlib/RingTheory/Localization/FractionRing.lean:744`, `Mathlib/RingTheory/MvPowerSeries/Basic.lean:86`, `Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean:95` |
| `isArtinian_of_finite`, `IsArtinian.bijective_of_injective_endomorphism` | `Mathlib/RingTheory/Artinian/Module.lean:116`, `:164` |
| `LinearMap.IsProj`, `isProj_iff_isIdempotentElem`, `linearProjOfIsCompl` | `Mathlib/LinearAlgebra/Projection.lean:553`, `:566`, `:346` |
| `Function.Exact.linearMap_ker_eq`, `Submodule.torsionBySet`, `Module.annihilator`, `Submodule.mapQ` | `Mathlib/Algebra/Exact/Basic.lean:310`, `Mathlib/Algebra/Module/Torsion/Basic.lean:182`, `Mathlib/RingTheory/Ideal/Maps.lean:869`, `Mathlib/LinearAlgebra/Quotient/Basic.lean:170` |
| `Finite.exists_ne_map_eq_of_infinite`, `Nat.dvd_factorial`, `Nat.self_le_factorial`, `Nat.factorial_dvd_factorial`, `Function.iterate_add`, `Function.iterate_mul` | `Mathlib/Data/Fintype/Pigeonhole.lean:75`, `Mathlib/Data/Nat/Factorial/Basic.lean:82`, `:133`, `:77`, `Mathlib/Logic/Function/Iterate.lean:72`, `:85` |
| `HomologicalComplex.homologyMap`, `LinearMap.charpoly`, `LinearMap.aeval_self_charpoly`, `Module.End.pow_apply`, `Submonoid.powers`, `IsIdempotentElem` | `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean:329`, `Mathlib/LinearAlgebra/Charpoly/Basic.lean:44`, `:88`, `Mathlib/Algebra/Module/LinearMap/End.lean:141`, `Mathlib/Algebra/Group/Submonoid/Membership.lean:313`, `Mathlib/Algebra/Group/Idempotent.lean:37` |
| `HeckeRing.GL2.Newform`, `HeckeRing.GL2.heckeUNat` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`, `TauCeti/NumberTheory/ModularForms/HeckeSlash/BadPrime/Basic.lean:54` |

### Seeded source sample in the changed passages

| Target | Locator checked | Result |
|---|---|---|
| 3.6 the `θ` exact sequence (README:2175 changed) | bellaiche09 lines 1053–1077 (§3.2.3, PDF p. 27) | The sequence `0→D_{−2−k}(k+1)→D_k→V_k→0` with its determinant twist, `ρ_k(μ)=∫(Y−zX)^k dμ`, and the left-exact symbol sequence are as stated. The README's "(k+1)-st differentiation" corrects the source's misprint, and its dagger model repairs a fixed-radius gap (Source issues). |
| 5.8 control (depends on §5.2's carrier) | sw lines 1157–1168 (Proposition 3.7, printed p. 37) | Hypotheses `λ|_{Z(U)} = ψε^μ`, `μ ≥ 0`, `ψ`, `φ` finite order; weight `(μ+2)·t`; `T(ℓ)`, `S(ℓ)` eigenvalues at `ℓ∤p` with `U_ℓ` maximal; `ε` through reciprocity on `Z(U)`. All as stated. |
| 5.9 density (depends on §5.8) | sw lines 1171–1190 (definition of algebraic primes, Lemma 3.8, Corollary 3.9, printed p. 38) | Weight-2 algebraic primes containing a minimal `Q` are Zariski dense; the corollary is as stated. The source's proof uses its Corollary 3.4 integrality, which is the README's §5.7. |

The other seeded targets (0.1, 0.15, 0.16, 0.17, 1.4, 1.5, 1.7, 2.2, 2.7a, 3.4a, 4.5, 4.8) lie in passages this diff leaves unchanged. Their rows are carried forward from the previous report below, and their texts were not re-read this round. The previous report read hida (0.15) and ochiai/klz (4.5, 4.8) at the stated locators.

### Adversarial pass

Rows marked "prev." are carried forward from the previous report (`PRREVIEW-PadicFamilies_r2`, *Computed adversarial pass*) for statements this diff leaves untouched, with the values computed there. Rows marked "new" are recomputed for every changed statement and for the targets the findings touch. All other rows of the previous report (0a.0.1–0a.16, 0a.18, 0a.20–0a.21, 0a.23–0a.24, 0a.26, 0.2–0.14, 1.1–1.3, 1.6, 1.8–1.12, 2a.1–2a.14, 2a.16–2a.17, 2.1, 2.3–2.10, 3.0–3.3, 3.5, 3.7–3.13, 4.0.1–4.3, 4.6–4.7, 4.9, 5.1, 5.3–5.5, 5.7, 5.9a–5.14) are carried forward unchanged from that report.

| Statement | Instance | Left / constructed | Right / competing | Result |
|---|---|---|---|---|
| new: README:97, §5.2 refinement fibres | `G₀ = S₃`, `Γ = ⟨(01)⟩`, `U = S₃`, `U′ = ⟨(12)⟩` | `(01)` swaps `U′`, `(01)U′` and fixes `(02)U′`, since `(01)(02) = (02)(12) = (0 2 1)`: 2 classes | `[U:U′] = 3`; coset count 3, single class 1 | Fibre = orbit set `Γ_x\U/U′`, as line 2686 says; content correct, citation wrong (R01). |
| new: §5.2 fibre bound "at most `[U_a:U_b]`" | `F = ℚ(√5)`, `p = 3` inert, icosian maximal order (class number 1), `U = GL₂(Ô_F)`, `U_1 = U(3)` | `Γ_1 = 𝒪_D^× = O_F^×·2I` acts on `GL₂(𝔽₉)` through `H = 2I·𝔽₉^×`, `|H| = 120·8/2 = 480` (φ mod 3 has order 8; reduction injective on `2I`) | `#X(U_1) = 5760/480 = 12 ≤ [U:U(3)] = 80·72 = 5760` | Bound holds and is strict; the points are classes `xu`. |
| new: §2.1 of the supplier, `tr∘res = [U:U′]` (README:97) | Hurwitz level, `U′ = U∩U₁(3)`, trivial coefficients | `(tr res f)(x) = Σ_{u∈U/U′} f(xu) = 8 f(x)` | `#Cl(U′) = 1`, not 8 (QuaternionicModularForms README:372–375) | Restriction injective; trace identity independent of the class count. |
| new: §§5.2–5.5 maximal order and splittings | `F = ℚ(√5)` vs `F = ℚ` | ramified set `{∞₁, ∞₂}`, even: `D` exists, split at every finite `v`; maximal ⇒ level 1 ⇒ `j_v(R_v) = O₀(𝔭_v⁰) = M₂(O_v)` (HMVSC §R18.5.16a items 2–3) | over `ℚ` the set `{∞}` has odd size: no such `D` | "even degree" is necessary and present at 2682, 2717, 2743, 2761. |
| new: §5.6 freeness hypothesis | rename check | §§5.2–5.5 use `D^×\D_f^×` | line 2773 uses undefined `G^D(A_f)` | R04. |
| new: §4.4 locator | epw Definition 3.2.1(2) | `H¹_{f,S}(ℚ_{∞,v_p}) = ker(H¹(ℚ_{∞,v_p}, Ā⊗ωⁱ) → H¹(I_{v_p}, Ā″⊗ωⁱ))` | §4.4's "specified Greenberg … local maps": unramified on the quotient | Locator supports the shape at `p`; prev. row `[O —π³→ O]`: `H² = O/π³`, length 3, carried. |
| new: §3.6 `Θ_k` (README:2175) | `k = 1`; `k = 0`, `r = 1`, `μ(1) = 0`, `μ(zⁿ) = 1` | `Θ_1(δ₀)(z²) = 2! = 2`; kernel of `d²` on degree `≤ 1` has dimension 2 `= dim V_1` | source's "k-th derivative": kernel of `d` on degree `≤ 1` has dimension 1 `≠ 2`; at fixed radius the preimage has moments `1/(n+1)`, `|1/pᵃ|_p = pᵃ` unbounded | Retain `(k+1)`-st derivative and the dagger model. |
| new: §0.12 low-weight comparison (README:909) | `k = 2`, `ψ = φ = 1`, `p = 5`: `E₂(z) − 5E₂(5z)` | constant `−(1/24)(1−5) = 1/6`; `a₅ = σ₁(5) − 5σ₁(1) = 1` | `Σ_{d|5, 5∤d} d = 1` | Stabilised difference, as DirichletPadicLFunctions §5.9 requires; no holomorphic level-one `E₂`. |
| new: §2a.15 representative product (README:1636–1657) | identity disk `A —id→ A`, `Ũ = (a, a)`; single degree `M⁰ = A`, `Ũ = a` | `P̃ = (1 − aX)²` with zero cohomology | alternating product would give 1; single degree `P̃ = 1 − aX` | Matches LocallyAnalyticDistributions README:3088 ("nonalternating", representative-dependent). |
| new: §3.4 decency citation (README:2106–2114) | `f = Δ`, `p = 11` | φ-eigenvalues of `(ad ρ_f)^∨(1)`: `11⁻¹·{1, 1, α/β, β/α}`, `|α| = |β| = 11^{11/2}` | all of complex absolute value `1/11 ≠ 1` | `D_cris(…)^{φ=1} = 0`, so `H¹_f = H¹_g`; claim retained. |
| new: §3.14 secondary L-functions (README:2338) | `L = a₀ + a₁t + a₂t²`, unit `1 + ct` | coefficients `a₀, a₁ + ca₀, …` change | vanishing order (flag) unchanged | Only the flag is intrinsic, as stated. |
| new: Lean §0a.17 `perfect_complex_ordinary_projector` (`e.asHom`) | `C = ℤ₅²[0]`, `t = U = (1 1; 0 5)` | `U^m = (1, (5^m−1)/4; 0, 5^m) → (1, −1/4; 0, 0) = e` as `m = n! → ∞`; `e² = e` | `D = ℤ₅[0]`, `π = (1, −1/4)`, `ι = (1,0)ᵀ`: `π ≫ ι` (π then ι) `= e.asHom`, `ι ≫ π = 1`; `t = 0` gives `e = 0`, `D = 0` | Uniqueness: `End` is a finite `R`-module, `𝔪`-adically separated (Krull), so the limit is unique. Retain. |
| prev.: 0a.19 local finiteness (Lean def) | `I = 0`, `M = 𝔽₂[X]`, `T = ×X` vs `T = 1` | orbit of 1 spans `{1, X, X², …}`: not finitely generated | `T = 1`: span `{1}` | Retain. |
| prev.: 0a.22 locally finite projector (Lean) | completed `⊕ℤ₃eᵢ`, `T eᵢ = 3ⁱeᵢ` | `T^{n!}e₀ = e₀`; `T^{n!}eᵢ` has valuation `i·n!` | `e` = projection to `ℤ₃e₀`; no `N` with `T^{N!} = e` | Retain pointwise limit. |
| prev.: 0a.25 derived independence (Lean) | `C₀ = ℤ₃[0]`, `C₁ = ℤ₃[0] ⊕ (ℤ₃ —1→ ℤ₃)`, `T₁ = (1, 3)` | `e₁ = (1, 0)`, `D₁ = ℤ₃[0]` | `Q(ι₀) α Q(π₁) = id` | Retain. |
| prev.: 0.1 Katz functions | `E₄` over `ℤ/25`; `Δ` over `ℤ/5` | `240 ≡ 15 mod 25`, `E₄ ≡ 1 mod 5` | `Δ ≢` constant mod 5 | Retain. |
| prev.: 0.15 components | `Λ × Λ` | idempotents `(1,0)`, `(0,1)` | product 0, sum 1 | Retain. |
| prev.: 0.16 compactness | `∏ℤ₃` vs `ℚ₃` | limit `∏ℤ₃` | `ℚ₃/3ⁿ = 0`, limit 0 | Retain profinite hypothesis. |
| prev.: 0.17 odd-prime control | `11a1` at `p = 3`; `p = 2` | `a₃ = −1` unit | `(1 ± ι)/2` needs `1/2 ∉ ℤ₂` | Retain `p` odd. |
| prev.: 1.4 trivialisations | `θ′ = 2θ` over `ℤ₅` | basis `e/2` | measure `×2` | Retain opposite rules. |
| prev.: 1.5 measure | `U_p` on `{∞, a/pʳ}` | additivity after `U_p^{−r−1}` | fails without `U_p^{−r}` | Retain normalisation. |
| prev.: 1.7 congruence module | `A = {(a,b): a ≡ b mod pⁿ}`; `O[[t]]/(ϖ²t)` | `Ψ = ℤ/pⁿ`; `Ψ = O/ϖ` | IKM `Ψ_A(M) = 0` | Retain finite length. |
| prev.: 2.2 family symbols | `T: K⟨T⟩ → K⟨T⟩` at `T = 0` | kernel 0 | kernel `K` after | Retain compact-support argument. |
| prev.: 2.7a cuspidal comparison | `full = M ⊕ boundary` | full: `M` | cuspidal: `M` | Retain localisation. |
| prev.: 3.4a finite-slope periods | `T_x/I = E[ε]/ε²` | rank one over dual numbers | residue only: insufficient | Retain. |
| prev.: 4.5 Euler system | `C₂`, `P(X) = 1 − aσ + bσ²`, `a=1, b=0` | `P(σ) = ((1,−1),(−1,1))` | scalar replacement fails | Retain geometric Frobenius. |
| prev.: 4.8 divisibility | `v_𝔭(P_τ) = 2`, `k = 3` | defect 6 | bound `n` false | Retain. |
| prev.: 5.2 projector | `U(pᵃ)`, `a ≥ 1`; `a = 0` | eigenvalue `N𝔭`, `(N𝔭)^{n!} → 0` | `N𝔭 + 1` unit | Retain positive level. |
| prev.: 5.8 control | `Sym¹`, `U = diag(1,5)` | kernel `5ⁿY ≠ 0` | zero ordinary factor mod `5^m` | Retain. |
| prev.: 5.9 density | `ζ_{pⁿ} − 1`; `ε² = 0` | infinitely many kernels | `ε` invisible | Retain. |

Every changed Check and worked example I evaluated agrees with its section. R01 is a citation defect, not a mathematical one: each statement on line 97 is true and is proved where QuaternionicModularForms states it.

## Not verifiable

- Seeded targets 0.1, 0.16, 0.17, 1.4, 1.5, 1.7, 2.2, 2.7a, 3.4a: their passages are unchanged since `f3b762c`, so their sources were not re-read in this incremental round. The previous report's *Not verifiable* items (Dasgupta–Darmon–Pollack Definition 3.1 and Proposition 3.2; Bellaïche's 2011 author version; Diamond; Wiles 1995; the Hida primaries; Kisin Proposition 8.7; Coleman–Mazur; Skinner–Wiles `+` superscripts in OCR) still stand.
- R02's repair was tested by elaboration only. A gate run with `--build` on the edited file needs the edit in the pull request.

## Source issues

- **Misprint** in bellaiche09 at §3.2.3, p. 27: the source says `Θ_k` is dual to the `k`-th derivative map; it should be the `(k+1)`-st derivative, whose kernel on polynomials of degree `≤ k` is `V_k`, of dimension `k+1`; affects nothing.
- **Gap** in bellaiche09 at §3.2.3, p. 27: the source asserts exactness of `0→D_{−2−k}(k+1)→D_k→V_k→0` (citing Stevens) without naming a radius; at fixed radius `D[1]`, `k = 0`, the moments `1/(n+1)` are unbounded; it should be stated for overconvergent distributions or with radius loss; affects a stated result.
