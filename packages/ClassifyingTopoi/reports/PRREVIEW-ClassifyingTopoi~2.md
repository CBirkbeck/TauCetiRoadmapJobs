# Review of ClassifyingTopoi (pull request #1997 at f78f0a4)

**Verdict:** needs changes

One finding, P3. This is a full review of the repaired head (743 changed lines since 6dadd76). All ten findings of the previous review are repaired (the check is finding by finding below). The gate passes on the worker's run; `Suggested.lean` elaborates with exactly 18 `sorry` warnings and no error; none of the 18 sorried theorems closes with one tactic; the adversarial pass (table below) refutes nothing. The one defect left is a stale section number in the Research context, introduced when the new 2.2 shifted the numbering of Layer 2.

## Repairs of the previous review (at 6dadd76)

- **R01 (P1), classifying category unowned.** Repaired. README 2.2 (lines 419–456) defines 𝒞_T "without a proof system" (objects `(n, φ)` Horn, morphisms term tuples identified semantically over models in every `Sheaf K (Type u')`), states (a) models ↔ `IsFiltering` functors for `⊥` (GrothendieckTopoi 2.5) and (b) the normal form `GeometricFormula.exists_interp_eq_iSup_exs`, with Elephant D1.4, D1.3.10 and Caramello Thm 17.6 p. 81. 2.2 is in the *Needs:* of 2.3 (line 494), 3.1 (609), 3.2 (629) and 4.1 (744). "Provable"/"provably" no longer occur in the README; "proof system" occurs only in Out of scope (line 98) and in 2.2's "without a proof system" (line 425). (b) is stated in `Suggested.lean` lines 265–270; (a) is named in the module docstring (lines 27–29) as not statable for lack of `IsFiltering`.
- **R02 (P2), 4.1 and 4.3 existential.** Repaired. `ringOp`, `forgetPresheaf`, `genericRingPresheaf` (naturality proved, lines 504–539) and `genericRing` (543–545) are defined; 4.1 is `IsClassifyingSite commRingTheory.{u} ⊥ genericRing.{u}` (568–570) and 4.3 is stated on `genericRing.{u}.map (sheafToPresheaf ⊥ _ ⋙ presheafToSheaf zariskiTopology _)` (600–604). README 4.1 (lines 725–730) and 4.3 (794–797) match, and 4.1 gained the wrong-model Check `x ↦ x + 1` (lines 761–764).
- **R03 (P2), `Language.{u, u}`.** Repaired. `exists_isClassifyingSite` (274–277) and `isOfPresheafType_of_isHorn` (329–331) take `L : Language.{u₁, u₂}` and `T : GeometricTheory.{max u₁ u₂ u} L`; Convention 1 (lines 111–118) states it. Checked in a scratch file against the built module: `isOfPresheafType_of_isHorn.{0, 0, 1} commRingTheory.{1}` and `exists_isClassifyingSite.{0, 0, 1} intervalTheory.{1}` elaborate (the previous head rejected both).
- **R04 (P3), Tau Ceti's `L_{∞ω}`.** Repaired. Scope cites `BoundedFormulaInf` and `Realize` with the reason for a positive syntax (lines 82–88); 1.2 defines `toInf` and `realize_toInf` (README 263–272, Lean 114–127) with three Checks (284–293). At the pin, Tau Ceti's `⊓` is `(φ.imp ψ.not).not` and `ex` is `φ.not.all.not` (`TauCeti/ModelTheory/Infinitary/Syntax.lean:136, 149`), as the Scope says.
- **R05 (P3), API for 2.3–2.5.** Repaired. 1.3 lists `Isomorphic` reflexive/symmetric/transitive and `IsModel` invariant (lines 314–318); 1.4 lists `map` along `𝟭` and composites and `map` of isomorphic structures (351–355); the *Needs:* of 2.4 (520), 2.5 (547–548) and 2.6 (570) name them; the "naturally along inverse images" clause of 2.6 is gone (565–569).
- **R06 (P3), finitely presented rings.** Repaired. `CommRingCat.isFinitelyPresentable_under`, `_hom` and `essentiallySmall_of_le` are in the Mathlib contract (184–186) and the *Needs:* of 4.1 (747–748); the converse is the target `finitePresentation_of_isFinitelyPresentable` (README 731–734, Lean 549–551); 𝒞_{commRingTheory} ≃ `FPRing.{u}ᵒᵖ` is in the 4.1 route (736–740).
- **R07 (P3), Borceux–Dejean item.** Repaired: "Theorem 1 (3), p. 134, and Proposition 2, p. 135" at lines 583–584 and 653–656. BorceuxDejean (cache `6c1c29b7…`) lines 99–106: item (3) is the equivalence criterion, (4) the presheaf equivalence; Proposition 2 at line 134, p. 135.
- **R08 (P3), chapter-level locators.** Repaired: every Mac Lane–Moerdijk citation now carries a section and page range (lines 235, 307, 349, 398, 483, 628, 650, 684, 736, 772, 797), 4.1 with Proposition 5.1; Makkai–Reyes carries pp. 272–297 (482); Hakim carries Chapitre III, §3, pp. 41–49 (798). The texts are paywalled (Not verifiable).
- **R09 (P3), size Check.** Repaired: lines 504–511 take `Type u` itself as the symbols, with the `ULift.{u + 1} Bool` case as the contrast.
- **R10 (P3), right versus left `G`-sets.** Repaired: Convention 5 (lines 146–151) gives the equivalence `g · x = x · g⁻¹` between presheaves on `SingleObj G` and `Action (Type u) G`, carrying evaluation to the forgetful functor; Convention 4 (139–140) compares across it.

## R01 (P3) — Stale section number: the duality is 2.5, not 2.4

**Location.** `TauCetiRoadmap/ClassifyingTopoi/README.md` line 840: "The duality of 2.4 makes the lattice of quotients of a theory a coHeyting algebra, the subtopoi of its classifying topos".

**Claim.** After the insertion of 2.2 (the classifying category), the duality theorem between quotients and finer topologies is 2.5 ("Quotients and finer topologies", line 534); 2.4 is uniqueness (line 513). Every other reference was renumbered (Convention 1 line 111 "2.3 and 3.1", line 224 "an instance of 2.5", line 799 "Route: 2.5", Dependencies line 594–595); this one was not.

**Witness.** Lines 534 and 542–544: "### 2.5 Quotients and finer topologies … This is the duality theorem between quotients of a geometric theory and subtopoi of its classifying topos".

**Repair.** Line 840: "The duality of 2.5 makes the lattice of quotients …".

## Verified sound

**Gate, build, order.**
- The worker's gate at f78f0a4 passes every check (`scratch/gate.md`). A hand-run gate reproduces 0 on every check except `depcheck=1` with the line "NOT IN ORDER: ClassifyingTopoi (insert it after its last supplier)": the public merge-order file does not list this new roadmap yet, which the brief says is not a finding before the design is accepted.
- The dependency check against the candidate order: "depcheck: 236 roadmaps, 2262 edges, 0 problem(s)", no UPWARD, CYCLE or `moved:` line. The candidate order lists ClassifyingTopoi at line 401 and SchemeAndStackFoundations is on main; GrothendieckTopoi (#1520) and LocallyPresentableCategories (#1926) are new-roadmap pull requests, named as suppliers by roadmap name and section only.
- `lake env lean` on `Suggested.lean`: 18 warnings, all "declaration uses `sorry`", no error, 12 s.
- Nothing outside the folder changes (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClassifyingTopoi'` is empty); `metadata.toml` has `topic = "math.CT"`.
- Form: `module`, `public import Mathlib`, `public import TauCeti.ModelTheory.Infinitary.Semantics` (the module exists at Tau Ceti 2fd255d9), one module docstring naming the not-statable headline 2.2 (a) and what it lacks, `theorem` only, no `set_option`, no `lemma`, no `#check`, no sorry'd data, docstrings on all 68 declarations.

**Signature pass.** I read the worker's elaborated types of all 68 declarations (`scratch/signatures.md`) against the README. The seven "dropped binder" leads are all `[Category.{v} E]`, present in each type as `Category.{u_3, u_4} E`: false positives. Universes: `IsClassifyingSite` ties `T : GeometricTheory.{u}`, `C : Type u` and `Sheaf J (Type u)`; `exists_isClassifyingSite` and `isOfPresheafType_of_isHorn` are polymorphic in the language's universes with the site in `Type (max u₁ u₂ u)`; `MoritaEquivalent` takes theories over languages in independent universes. Nothing changed.

**Padding probe.** On a scratch copy every `sorry` was replaced by `first | rfl | simp | infer_instance | trivial | decide | exact ⟨⟩`; all 18 fail (18 errors). Every definition is used by a stated headline; no declaration restates a definition or mirrors a Check.

**Headline theorems** (Summary, lines 11–31), all stated: 1.2 `realize_hom`, `realize_toInf`; 1.3 `isModel_ofStructure_iff`; 1.4 `IsModel.map`; 2.2 (b) `exists_interp_eq_iSup_exs`; 2.3 `exists_isClassifyingSite`; 2.4 `exists_equivalence`; 2.5 `exists_quotient_topology`, `exists_quotient_theory`; 3.1 `isOfPresheafType_of_isHorn`; 3.2 `isClassifyingSite_genericObject`; 3.3 `isClassifyingSite_genericTorsor`, `moritaEquivalent_torsorTheory_iff`; 3.4 `isClassifyingSite_genericInterval`; 4.1 `isClassifyingSite_genericRing`, `finitePresentation_of_isFinitelyPresentable`; 4.2 `isSheaf_forget_zariskiTopology`; 4.3 `isClassifyingSite_localRingTheory`. Not statable and so named in the docstring: 2.2 (a), which needs GrothendieckTopoi's `IsFiltering`. The classifying category 𝒞_T is a README target (a site), as the rules want.

**Sources read at their locators.**
- Caramello, « Lattices of theories », arXiv:0905.0299v1 (cache `294c646c…`, glyph-coded text decoded locally; page `N` begins at the `=== page N ===` marker): Proposition 2.1 (2-dimensional Yoneda) line 346, p. 5, cited at 2.4; Definition 3.5 line 1412, p. 14 (Morita equivalence = equivalent classifying topoi, equivalently equivalent model categories naturally in `E`), cited at 2.6; Theorem 3.6 line 1436, p. 15 (quotients ↔ subtopoi) and Remark 3.7 line 1830, p. 19 (the diagram `T'-mod(E) ≃ Geom(E, Sh(C_T, J))` for `J ⊇ J_T`), cited at 2.5 and 2.3; Theorem 17.6 line 7908, p. 81, whose proof cites Proposition D1.3.10 at line 7975 for axioms `ψ ⊢ ⋁ᵢ ∃xᵢ θᵢ` with `ψ`, `θᵢ` cartesian and `θᵢ ⊢ ψ`, cited at 2.2 (a), (b), 2.3 and 3.1. All as the README says.
- Borceux–Dejean (Numdam, cache `6c1c29b7…`): Theorem 1 line 99 (printed p. 134), items (3) line 103 and (4) line 105; Proposition 2 line 134 (p. 135). As cited.
- SchemeAndStackFoundations §2.9 on main (`README.md` line 3582): `bigSheaf F` on the big site over `S`, `bigSheaf_isSheaf` for Zariski, étale, fppf and fpqc, `bigSheaf_structureSheaf` with underlying abelian sheaf `𝔾_a`. The contract (lines 203–206) and 4.2 (770–778) describe it correctly; §2.9 is unchanged at the open heads #1656 (line 4122) and #1276 (line 3627). The adapter route (coverage argument, then the sheaf condition on the generating families) is sound: `zariskiTopology` is the topology generated by the pullback-stable presieves `{A → A[1/fᵢ]}`, and Mathlib's `Presieve.isSheaf_coverage` (`Sites/Coverage.lean:402`) reduces the sheaf condition to those presieves, where it is the equalizer `A = eq(∏ A[1/fᵢ] ⇉ ∏ A[1/fᵢfⱼ])` of `𝔾_a`.

**Adversarial table** (values computed by hand; rows marked Lean were run in a scratch file importing the built module).

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conv. 2 / 1.1 `ex` binds the last variable | ℤ, `ex (var 0 = var 1 * var 1)` at `4`, `2` (Lean) | at 4 the goal becomes `4 = 2 * 2`, closed; at 2 it becomes `2 = a * a`, refuted by `|a| ≤ 1 ⇒ a² ≤ 1`, `|a| ≥ 2 ⇒ a² ≥ 4` | sound |
| 1.1 `bot` | context 0, any structure (Lean) | `∃ i : PEmpty, …` is `False` | sound |
| 1.2 `IsSetModel` | `{⟨0, top, ex top⟩}` on `PEmpty`, `PUnit` (Lean) | false, true | sound |
| 1.2 `toInf` on `bot` and on the torsion formula | `PEmpty`-indexed; `ULift ℕ` at `1` in ℤ/6 and ℤ | no pair `⟨PEmpty, x⟩`, all branches `⊥`: false. Branch `k = 5`: `6 · 1 = 0` in ℤ/6, true; in ℤ `(k+1) · 1 ≠ 0` for all `k`, false | sound |
| 1.2 `realize_hom` | ℤ ⊂ ℚ, `ex (var 0 * var 1 = 1)` at 2 | ℤ: no `y` with `2y = 1`; ℚ: `y = 1/2`. Negation would go true → false | sound |
| 1.3 `interp` of `equal`, `iSup` | `Bool` diagonal; `{0} ∨ {0}` in ℤ | 2 of 4 pairs; image has 1 element, coproduct 2 | sound |
| 1.3 `IsHom`, `Isomorphic` | `n ↦ 2n` on ℤ; `𝟙 Bool` from `P = ∅` to `P = {true}` | `funMap 1`: `2 ≠ 1`. `∅ ⊆ {true}` but not conversely | sound |
| 1.4 `IsModel.map` | `X ↦ X × X`; `X ↦ Bool × X` | constants `(f,f)`, `(t,t)`; `(f,t)` is neither. `|Bool × 1| = 2`, not terminal | sound |
| 2.1 `IsClassifyingSite` (ii) not implied by (i) | `Discrete Bool`, `⊥`, `U` terminal, `K` one-point | `Hom(F, G) = ∅` (component `PUnit ⟶ PEmpty`), one homomorphism `𝟙 PUnit` | sound |
| 2.2 𝒞_T hom-sets | `commRingTheory`, `(1, x² = x) ⟶ (1, top)` and `(1, top) ⟶ (1, top)` | `ℤ[x]/(x² − x)` identifies `x`, `x²`; `ℤ[x]` does not (`2 ≠ 4` in ℤ) | sound |
| 2.2 𝒞_∅ for the empty language | `(n, top) ⟶ (m, top)` | terms are variables: maps `Fin m → Fin n`; `𝒞_∅ ≃ FinSetᵒᵖ`, presheaves on it = functors `FinSet → Set`, `y(1, top) =` inclusion | sound, agrees with 3.2 |
| 2.2 (b) normal form, index universe | `and`, `iSup`, `ex`, atoms | product, sigma, `m + 1`, `PUnit`: all in `Type u` | sound |
| 2.3 universe Check | symbols `Type u`; `ULift.{u+1} Bool` | distinct subterminals inject `Type u` into a `u`-small set: impossible; two symbols: presheaves on the square of the arrow category | sound |
| 2.3 route | axiom family `(n + mᵢ, θᵢ ∧ χ') ⟶ (n, χ)` | projection is a morphism of 𝒞_∅ since `χ'` weakens `χ`; matches Caramello line 7967–7983 | sound |
| 2.4 | `G = ℤ/2` | centre `{0, 1}`: two isomorphisms `U.map 𝟭 ≅ U` | sound |
| 2.5 | `T ∪ {⊤ ⊢ bot}`; `J' = J` | empty sieve covers, `J' = ⊤`; `T' = T` | sound |
| 2.6 decidable objects | `FinSet` vs `FinInj` | both Cauchy complete (idempotent injection = identity); `Fin 2 ⟶ Fin 1` not mono | sound |
| 3.1 Horn | `commRingTheory`, `localRingTheory`, `torsorTheory G` (Lean) | Horn; not Horn (`0 = 1 ⊢ bot`, `bot` is an `iSup`); not Horn (`ex top`) | sound |
| 3.1 products | `ℤ/2 × ℤ/2` at `(1, 0)` | `x`, `1 − x = (0, 1)` non-units | sound |
| 3.2 variance | site `FintypeCat.Skeleton` | functors on `FinSetᵒᵖ ≃ FinBool`: Boolean algebras | sound |
| 3.3 action | `f ≫ g = g * f` (Lean, `rfl`); `𝔖₃`, `a = (12)`, `b = (23)` | postcomposition `x ↦ g * x` is a left action; `ab ≠ ba` so precomposition is not natural | sound |
| 3.3 Morita iff | `ZMod 4` vs `(ZMod 2)²` | orders `{1,2,4,4}` vs `{1,2,2,2}` | sound |
| 3.4 Conv. 6 | `δ 1`, `δ 0` at `0`; `σ 0`, `σ 1` on `0,1,2` (Lean, `decide`) | `0`, `1`; `0,0,1` and `0,1,1`; for `a ≤ b` put `h = a + b`: `σ0 ∘ h = a`, `σ1 ∘ h = b`, so the image is the pointwise order | sound |
| 3.4 `0 = 1 ⊢ bot` | `Δ[1]` at level `n` | `|Hom(⦋n⦌, ⦋1⦌)| = n + 2`, constants differ | sound |
| 4.1 `FPRing` | `⟨0,⊥⟩`, `⟨0,⊤⟩`, `⟨1,⊥⟩`; `E₁₂E₂₁` | ℤ initial, `0` terminal, `ℤ[X]` represents the forgetful functor; `E₁₁ ≠ E₂₂` | sound |
| 4.1 wrong model | `x ↦ x + 1` | zero `1`, addition `a + b − 1`: a different ring object on the same presheaf | sound Check |
| 4.2 | zero ring (Lean); ℤ with `{2, 3}`; `{ℤ → ℤ[1/2]}` | `⊥ ∈ zariskiCovers` via `s = ∅`; `3 − 2 = 1`, equalizer ℤ; sheaf condition would force `ℤ ≅ ℤ[1/2]` | sound |
| 4.3 local rings | ℤ at 3; ℤ/6 at 3; ℤ/4; zero ring | `3`, `−2` non-units; `3`, `4` non-units; local; `0·0 = 1` so only `0 = 1 ⊢ bot` excludes it | sound |
| 4.3 route | generators of `zariskiTopology` | `g₁ + h = 1`, `h = g₂ + ⋯ + g_k`: binary cover `{A[1/g₁], A[1/h]}` then induction in `A[1/h]`; `k = 1` an isomorphism, `k = 0` the zero ring | sound |
| 4.3 sheafified generic ring | the functor `sheafToPresheaf ⊥ ⋙ presheafToSheaf zariskiTopology` (Lean) | `PreservesFiniteLimits` by instance; `IsLeftAdjoint` from `sheafBotEquivalence.toAdjunction` | sound |

**Library declarations opened at the pins** (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9): `IsFinitelyPresentable` (`Presentable/Finite.lean:49`), `CommRingCat.isFinitelyPresentable_under` (`Algebra/Category/Ring/FinitePresentation.lean:169`), `isFinitelyPresentable_hom` (:175; the file has no converse), `essentiallySmall_of_le` (`CommAlgCat/FiniteType.lean:118`), the `HasColimitsOfShape (Sheaf J D)` instance (`Sites/Limits.lean:214`), `piObjIso` and `piObjIso_hom_comp_π` (`FunctorCategory/Shapes/Products.lean:33, 38`), `Types.productIso` (`Limits/Types/Products.lean:193`), `compatibleRingOfRing` (`ModelTheory/Algebra/Ring/Basic.lean`), `FintypeCat.Skeleton.incl` (`FintypeCat.lean:253`), `SimplexCategory.isTerminalZero` (`SimplexCategory/Basic.lean:898`), `AsSmall.equiv` (`Category/ULift.lean:181`), `sheafBotEquivalence` (`Sites/Sheaf.lean:438`), `Presheaf.IsSheaf` (:76), `Subobject.exists` (`Subobject/Basic.lean:736`), `Presieve.isSheaf_coverage` (`Sites/Coverage.lean:402`), `Coverage.toGrothendieck` (:257), `SingleObj.comp_as_mul` (`SingleObj.lean:76`, `f ≫ g = g * f`), `Scheme.zariskiTopology` and `subcanonical_zariskiTopology` (`AlgebraicGeometry/Sites/BigZariski.lean:47–57`, the big site on schemes: not a duplicate of the small site on `FPRingᵒᵖ`). Tau Ceti: `BoundedFormulaInf` (`Infinitary/Syntax.lean:75`, constructors `equal`, `rel`, `iSup`, `all`, `imp`), `⊤`/`⊥`/`⊓`/`ex` (:126–149), `Realize` (`Semantics.lean:76`), `realize_top`, `realize_inf`, `realize_ex`, `realize_iSup` (:134, 142, 158, 117).

**Cross-roadmap citations resolved** (all present).
- GrothendieckTopoi at #1520: Scope "classifying topoi of geometric theories" out of scope (line 100); Conventions 1 and 4 (105–135); 1.1 (263), 1.2 (285, frame property and `Subobject.exists`), 2.1 (380), 2.2 (410, with the Sierpiński and `B G` Checks at 427–433), 2.4 (455), 2.5 (493, `IsFiltering`, "when `C` has finite limits, `J`-filtering means left exact and …"), 4.2 (646, subtopoi ↔ `J' ≥ J`), 6.1 (912); Layer 1 Examples `B G = Action (Type u) G` (367–370); Lean `IsGrothendieckTopos` (:103), `GeometricMorphism` (:173), `homEquivInverse` (:228), `IsFiltering` (:293), `nonempty_geometricMorphism_equiv_isFiltering` (:314), `nonempty_point_equivalence` (docstring :49).
- LocallyPresentableCategories at #1926: Scope lines 88–92 (classifying topoi outside), 1.5 (line 360), 3.1 (557), 3.4 (631), 3.5 (658); its Downstream consumers (984) names ClassifyingTopoi for exactly 1.5, 3.1, 3.5.
- SchemeAndStackFoundations §2.9 on main (above). AdicSpacesPartIV line 1670 (classifying topos of a Galois group), DGAInfinity, HilbertModules and GrothendieckEulerForms (Morita in other senses) as described.
- No roadmap on main or at an open head cites ClassifyingTopoi.

**Ownership.** `roadmaps grep` over main and the 458 open heads for classifying topoi, geometric theories/logic, Horn theories, object classifier, torsor theories, intervals, syntactic sites, presheaf type, Morita equivalence of theories, `FPRing`/finitely presented rings, Zariski topos and ring objects: no second owner. HigherToposTheory (#1901) has the ∞-categorical object classifier of HTT 6.1.6, a different object; TotallyDistributiveTopoi (#1927) has nothing on classifying topoi. CommRingFactorizationSystems (#453, on the never-cite list) states only the forward direction (finitely presented ⇒ finitely presentable, now Mathlib's) and local finite presentability; the converse `finitePresentation_of_isFinitelyPresentable` is owned here only. `scratch/overlaps.md`: no other pull request changes this folder, no dropped ids either way.

**Note, not a finding.** The pull-request description predates the repair (it still says 15 headlines and that 4.1 and 4.3 are stated existentially); the folder is what was reviewed.

## Not verifiable

- Mac Lane–Moerdijk, *Sheaves in Geometry and Logic*, VIII.2–VIII.8 and X.1–X.6 with the page ranges and Proposition VIII.5.1: paywalled (Springer; the book and chapter pages redirect to an authorization endpoint, so even the public table of contents was not read). The section attributions are consistent with the book's standard contents but were not checked against the text.
- Johnstone, *Elephant*, D1.1, D1.2, D1.3.10, D1.4, D3.1: paywalled (OUP); D1.3.10 confirmed only through Caramello's citation (line 7975).
- Makkai–Reyes, LNM 611, pp. 272–297; Hakim 1972, Chapitre III §3, pp. 41–49; Moerdijk LNM 1616; Joyal–Tierney: paywalled; the last two are cited in Scope only.
- Caramello 2017 (OUP) book numbering: the README cites the arXiv v1 numbering, which was checked.

## Source issues

- **Misprint** in Caramello2009Lattices (arXiv:0905.0299v1) at the proof of Theorem 17.6, p. 81 (cache line 7954): the source writes the classifying topos of a cartesian theory as the category of covariant functors on its cartesian syntactic category; it should be the presheaf category on that category, equivalently functors on finitely presented models; affects nothing.
