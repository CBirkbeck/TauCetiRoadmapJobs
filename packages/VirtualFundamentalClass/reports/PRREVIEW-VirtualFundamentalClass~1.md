# Review of VirtualFundamentalClass (pull request #1996 at 8a54d41)

**Verdict:** needs changes

Six blocking findings (P2) and eight P3 findings. The gate passes and the dependency check is clean. `Suggested.lean` elaborates with no output. The P2 findings are about who owns rational Chow groups of Deligne–Mumford stacks, hypotheses missing from the definition of an obstruction theory and from the local complete intersection statement, the generality of the relative theory in Layer 9, and a proof step taken from Behrend–Fantechi that fails as written.

## R01 (P2) — Rational Chow groups of DM stacks have two prospective owners

- **Location.** `TauCetiRoadmap/VirtualFundamentalClass/README.md:275–281`: "Build Vistoli's dimension-graded rational Chow groups for separated Deligne–Mumford stacks … Extend proper pushforward, flat pullback, localization, and exterior products to these rational stack Chow groups". Chern classes are at lines 282–285.
- **Claim.** Layer 2 owns rational Chow groups of DM stacks, together with pushforward, pullback and Chern classes.
- **Witness.** StableReductionPartII is open pull request #1841 and sits at line 314 of the merge order, before this roadmap at line 397. Its `README.md:102` declares `gap:stack-chow-grr` on SchemeAndStackFoundations for rational Chow groups, proper pushforward and Chern classes on a smooth DM stack.
- **Repair.** Settle one owner that comes earlier in the merge order.
  - **Recommended.** With the current order the owner is SchemeAndStackFoundations. Under Exact supplier contracts write: "What SchemeAndStackFoundations must provide (gap:dm-stack-chow): Vistoli's rational Chow groups `A_*(X)_ℚ` of separated DM stacks locally of finite type over a field, with proper pushforward, flat pullback, homotopy invariance and Chern classes of vector bundles." Put the same slug in `plan.json`. Keep in Layer 2 only what is specific to Behrend–Fantechi: the zero-section and regular-local-immersion Gysin maps, the bivariant classes, and the descent of Vistoli's rational equivalence.
  - **Alternative.** Keep ownership here and place VirtualFundamentalClass before StableReductionPartII in the merge order. That is possible because all its suppliers are on main. StableReductionPartII then repoints its gap here.
  - Either way, the Scope section must say which owner was chosen.

## R02 (P2) — Obstruction theories are defined without Condition (⋆)

- **Location.**
  - `README.md:45–47`: "Define an obstruction theory as a morphism `φ : E → L_X` in the derived category inducing an isomorphism on `H⁰` and a surjection on `H⁻¹`."
  - `README.md:374–376`.
  - `Suggested.lean:28–32`: the sketch takes `E : DerivedCategory (EtaleModules X)` with no condition.
- **Claim.** These two conditions define an obstruction theory, and that definition is equivalent to `𝔑_X → h¹/h⁰(E∨)` being a closed immersion.
- **Witness.** Take `X = Spec k`, `E = ⊕_ℕ O_X[1]` and `φ = 0`. Then `H⁰(φ)` is `0 ≅ 0` and `H⁻¹(φ)` is `k^(ℕ) ↠ 0`, so φ qualifies. But `H⁻¹(E)` is not coherent, so `h¹/h⁰(E∨)` is not an algebraic cone stack (BehrendFantechi1997 line 674, Prop. 2.4, p. 20, needs (⋆)).
- **Repair.** Add the standing condition of Behrend–Fantechi Def. 4.4 (BehrendFantechi1997 line 1139, p. 34), which refers to Def. 2.3 (line 670, p. 20): `E ∈ D(O_{X,ét})` with `Hⁱ(E) = 0` for `i > 0` and with `H⁰(E)`, `H⁻¹(E)` coherent.
  - Make the change in end goal 2, in Layer 6 item 1, and in the docstring sketch.
  - The witness then fails the hypothesis, because `H⁻¹(E)` is not coherent.
  - Perfect obstruction theories satisfy the condition automatically.

## R03 (P2) — The relative theory over a base that is not DM has no owner for `L_{X/Y}` or its Gysin maps

- **Location.**
  - `README.md:439–442`: "For `f : X → Y` of relative Deligne–Mumford type, define `𝔑_{X/Y} = h¹/h⁰((L_{X/Y})∨)` … When `Y` is smooth".
  - `README.md:309–311`: "globalize `L_{X/Y}` to schemes and algebraic spaces …, then to Deligne–Mumford stacks".
  - `README.md:286–287`: "representable regular local immersions of Deligne–Mumford stacks".
- **Claim.** Layers 2 and 3 supply what Layer 9 and end goal 5 use.
- **Witness.**
  - Behrend–Fantechi §7 (BehrendFantechi1997 line 1647, p. 49) takes `Y` to be any smooth algebraic stack, not necessarily DM.
  - The consumer GromovWittenTheory (#1998, `README.md:270–271`) works relative to `Mpre`.
  - For `Spec k → B𝔾_m`, no layer builds `L_{X/Y}` or the Gysin map `v^!` over the base.
- **Repair.** Choose one of two routes.
  - **Add targets.**
    - Layer 3: construct `L_{X/Y}` for a morphism of relative DM type to an algebraic stack, by smooth-atlas base change and descent on `X_ét`, with `h¹ = 0`. Include its transitivity triangles over `Y` and cite a source for the cotangent complex of a morphism of algebraic stacks.
    - Layer 2: construct the bivariant groups `A*(X → Y)` for such morphisms, flat orientations, and the class `[v]` of a regular local immersion of algebraic stacks acting on Chow groups of DM stacks (BehrendFantechi1997 lines 1618–1640, pp. 48–49).
    - On the witness: `L_{Spec k/B𝔾_m} = k`, because `Spec k → B𝔾_m` is a `𝔾_m`-torsor, and the class is `[pt] ∈ A_{−1+1}`.
  - **Restrict instead.** Limit end goal 5 and Layer 9 to DM bases, and record that the relative-over-`Mpre` use in GromovWittenTheory is not supplied.

## R04 (P2) — The Example 7.6 item needs a relative class over a base that is not smooth

- **Location.**
  - `README.md:464–467`: "with `V` and `W` smooth … If `i` is also a regular local immersion … prove that the resulting virtual class is the zero-section intersection of `C_{X/V}` in `g^*N_{Y/W}`".
  - Layer 9 builds the class only "When `Y` is smooth and pure of dimension `d`" (lines 441–445), and end goal 5 says the same (lines 59–63).
- **Claim.** The class named in the item exists.
- **Witness.**
  - Take `W = 𝔸²`, `Y = V(xy)` (a regular embedding, but singular), `V = W` and `h = id`.
  - Behrend–Fantechi give `0^![C_{Y/W}] = [Y] ∈ A₁(Y)` (BehrendFantechi1997 line 1740, Ex. 7.6, p. 52).
  - Layer 9 defines no class for this `Y`, because `Y` is not smooth.
- **Repair.** State the relative construction as Behrend–Fantechi do (line 1644, p. 49): `Y` an algebraic stack of pure, constant dimension `d`, with `𝔠_{X/Y}` pure of dimension `d`. Keep `Y` smooth where Gysin maps along `Y` are used (Props. 7.2 and 7.5). On the witness the class is `[x-axis] + [y-axis]`.

## R05 (P2) — Resolution independence relies on a proof step that fails as written

- **Location.** `README.md:404–406`: "Given two global resolutions, construct a common dominating resolution and use smooth pullback plus zero-section Gysin compatibility to prove equality of the resulting classes."
- **Claim.** Two global resolutions are dominated by a third one through chain maps.
- **Witness.**
  - The proof of Prop. 5.3 (BehrendFantechi1997 line 1303, p. 39) assumes, without loss of generality, that both resolutions map to `E•` by chain maps.
  - On `ℙ¹`, `F• = [O(−2) →0 O]` has the automorphism `id + ε` with `ε ∈ Ext¹(O, O(−2)) ≅ k`. No chain map represents it.
- **Repair.** State the step as follows. For an isomorphism `F• ≅ H•` in `D(O_X)`, there is a third global resolution `K•` with chain quasi-isomorphisms `K• → F•` and `K• → H•` that realise it.
  - Prove this when `X` has the resolution property: resolve a roof by a bounded-above complex of vector bundles, then truncate to two terms using perfect amplitude `[−1,0]`.
  - Then either add the resolution property as a hypothesis, or cite a source that removes it.
  - `ℙ¹` has the resolution property, so the repaired step covers the witness.

## R06 (P2) — Recovering `[X]` for a local complete intersection needs constant dimension

- **Location.**
  - `README.md:57–58`: "Recover the ordinary fundamental class for a local complete intersection equipped with its cotangent-complex obstruction theory."
  - `README.md:414–416`.
- **Claim.** `[X, L_X]vir = [X]` for every local complete intersection.
- **Witness.** `X = Spec k ⊔ 𝔸¹_k` is a local complete intersection. The rank of `L_X` is 0 on the point and 1 on the line, so there is no `n` with `[X, L_X]vir ∈ A_n(X)`. Layer 7 requires constant virtual rank.
- **Repair.** Add "of pure dimension `n`" (equivalently, `L_X` of constant rank). The statement is then `[X, L_X]vir = [X] ∈ A_n(X)_ℚ` (BehrendFantechi1997 line 1321, p. 39).
  - Check to add: for `X = Spec k[ε]/(ε²)`, `n = 0` and the class is `2[pt]`.

## R07 (P3) — The README departs from the house shape

- **Location.** The whole README. Its headings are "Suggested homes", "## The end goals", "## Standing conventions", "## Inventory: …", "### Layer k", "## Acceptance criteria and worked examples", "## Ordering and work packages" and "## Boundary of this roadmap".
- **Claim.** The README is in TauCetiRoadmap form.
- **Witness.** Compare SchemeAndStackFoundations §5.5 on main. This README has none of:
  - a `**Summary.**` paragraph;
  - `## Scope and ownership`;
  - `## Exact supplier contracts` with From-subsections;
  - `## How to read the build`;
  - `### k.n` subsections;
  - `*Needs:*` lines;
  - `**Checks.**` lists;
  - per-layer `### Examples` and `### Dependencies`;
  - `## Downstream consumers`.
- **Repair.** Restructure:
  - Add a Summary paragraph.
  - Write a Scope and ownership section that absorbs "Inventory: what is missing" and "Boundary".
  - Add Conventions.
  - Write Exact supplier contracts with the subsections From Mathlib, From Tau Ceti and From TauCetiRoadmap.X.
  - Add How to read the build.
  - Use `## Layer k` headings with `### k.n` targets written as prose and ending in `*Needs:*`.
  - Give each definition API bullets and at least three Checks. The definitions are stack dimension, cone, cone stack, `h¹/h⁰`, `𝔑_X`, `𝔠_X`, obstruction theory, perfectness, global resolution and the virtual class. The worked examples here can supply many of the Checks.
  - End each layer with Examples and Dependencies.
  - Add Downstream consumers naming GromovWittenTheory.

## R08 (P3) — Claims have no locators, and the source version and hypotheses are not pinned

- **Location.** For example `README.md:361–363`: "Prove `𝔠_X` is pure of stack-dimension zero and its abelian hull is `𝔑_X`. Prove the local complete intersection characterization". Apart from "§5", "§7", "Proposition 5.3" and "Example 7.6", no claim in the README has a locator.
- **Witness.**
  - The available locators are: Behrend–Fantechi Thm. 3.11 (p. 29), Prop. 3.12 (p. 30), Prop. 3.13 (p. 30, which assumes finite type), Thm. 4.5 (p. 35), Props. 5.5–5.10 (pp. 40–43) and §7 (pp. 49–52).
  - Stacks tag 0AFR allows any finite-type group `G`.
  - Stacks tag 08SL proves only the direction from local complete intersection to perfect amplitude.
- **Repair.**
  - Put the theorem and page at each claim, and say whether the numbering is that of arXiv v1 or of Invent. Math.
  - Layer 0: cite Stacks 0AFL–0AFR and drop "smooth" from the quotient formula. A Check: `dim Bμ_p = 0` in characteristic `p`.
  - Layer 3: cite Stacks 08SL for "local complete intersection ⇒ perfect amplitude `[−1,0]`", cite a source for the converse, and write "perfect amplitude".
  - Layer 3: cite Illusie III Cor. 3.1.3 for the comparison with a local embedding (BehrendFantechi1997 line 946).
  - Layer 5 product formula: add finite type, or justify dropping it.
  - State whether Behrend–Fantechi's standing quasi-separatedness (line 169, p. 5) is kept.

## R09 (P3) — The inventory misstates what the pins contain and misses pinned carriers

- **Location.**
  - `README.md:160–162`: "Tau Ceti supplies derived tensor, derived internal Hom, perfect complexes on schemes, and the affine cotangent complex".
  - `README.md:168`: "`RingTheory.ReesAlgebra.reesAlgebra`".
  - `README.md:145–146`: "add the groupoid-valued condition needed here".
- **Witness.**
  - None of the four constructions in line 160 exists at the Tau Ceti pin. There is only `TauCeti/Algebra/Homology/DerivedCategory/Perfect.lean`, about perfect objects in abelian categories.
  - Mathlib's declaration is the root-level `reesAlgebra` (`Mathlib/RingTheory/ReesAlgebra.lean:40`).
  - `TauCeti.AlgebraicGeometry.Chow.ChowGroup` exists at the pin and is not cited.
- **Repair.**
  - Attribute these constructions to the roadmaps that specify them: tensor and internal Hom to EnhancedDerivedSheaves §0.3, perfect complexes to E1.8 (`PerfectDerived`), and the cotangent complex to DerivedModuleAlgebra §0.4.
  - Write `reesAlgebra`.
  - Cite the pinned carriers:
    - `TauCeti.AlgebraicGeometry.Chow.ChowGroup` (`TauCeti/AlgebraicGeometry/Chow/Basic.lean`) and `Chow.pushforward` (`Chow/ClosedImmersion.lean`);
    - `TauCeti.AlgebraicGeometry.SchPseudofunctor` (`Stack/Basic.lean`);
    - `Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean`).
  - The groupoid-valued stack is SchemeAndStackFoundations §1.18 `StackInGroupoids`, and the small étale site of a space is its §1.10.
  - Align "Suggested homes" with the pinned directories `AlgebraicGeometry/Stack/` and `AlgebraicGeometry/Chow/`.

## R10 (P3) — The `Suggested.lean` docstring does not name the headlines it cannot state, and it carries a catalogue of names

- **Location.**
  - `Suggested.lean:13–16`: "The remaining DM-stack Chow, geometric cotangent, cone-stack, obstruction-theory, and virtual-class types do not yet exist at the repository pins."
  - Lines 21–50: commented signatures.
  - Line 59: "-- No compiled targets yet".
- **Witness.**
  - The required form names each headline that cannot be stated, together with the carrier it lacks.
  - Lines 21–50 are a catalogue of names.
  - "yet" and "until the owning layers provide their types" are process words.
  - Lines 6–9 promise statements that the file does not contain.
- **Repair.** Rewrite the docstring:
  - Title it "…: target signatures" and say that the roadmap is `README.md`.
  - Say that no headline can be stated at the pins, then give one line per headline with the carrier it lacks:
    - Thm. 3.11 (intrinsic normal cone);
    - Thm. 4.5 (obstruction theory as a closed immersion);
    - Def. 5.2 and Prop. 5.3 (construction and independence of the class);
    - Props. 5.5–5.10 (basic properties);
    - §7 (relative theory).
  - The missing carriers are DM stacks, the cotangent complex, cone stacks and Chow groups of DM stacks. At the pin Tau Ceti has only `SchPseudofunctor`, `Spaces.IsAlgebraicSpace` and the scheme-level `Chow.ChowGroup`.
  - Delete the commented code block and line 59.

## R11 (P3) — The README backticks Lean names that `Suggested.lean` does not declare

- **Location.**
  - `README.md:97–98`: "`IsPerfect φ` and `HasGlobalTwoTermResolution E` are different predicates".
  - Line 103: "`virtualFundamentalClass`".
  - Lines 387–388: "`HasGlobalTwoTermResolution E` … `PerfectObstructionTheory`".
- **Witness.** `Suggested.lean` declares nothing (lines 57–61). Its commented sketch uses `GlobalTwoTermResolution`, `ObstructionTheory` and `IsPerfect`, but never `HasGlobalTwoTermResolution` or `PerfectObstructionTheory`.
- **Repair.** Write these in prose: "perfectness", "existence of a global two-term resolution", "the virtual class", "a perfect obstruction theory".

## R12 (P3) — Process narrative and optional scope

- **Location.**
  - `README.md:135–136`: "…adopts compatible replacements when either dependency changes."
  - Line 494: "smallest executable test".
  - Lines 519–520: "should begin only after … pass the worked examples".
  - Lines 522–524: "Register separate intentions … rather than claiming the whole roadmap."
  - Line 94: "Codimension notation may be supplied".
- **Witness.** House rules require a timeless README: no claims, intentions or scheduling, and nothing optional. The word "executable" presents a Check as a computation.
- **Repair.**
  - Delete the sentence at lines 135–136.
  - Delete the scheduling and intention advice at lines 519–524. The Dependencies lists carry the build order.
  - Write "the smallest test of".
  - Either make codimension grading for pure-dimensional stacks a target, or delete the sentence.

## R13 (P3) — The cone convention admits objects with no vertex or of infinite type

- **Location.** `README.md:115–118`: "A cone over `X` is the relative spectrum of a graded quasi-coherent `𝒪_X`-algebra generated in degree one, with its vertex and `𝔸¹`-action."
- **Witness.**
  - `S = O_X × O_X` placed in degree 0 is generated in degree one vacuously, and `Spec S = X ⊔ X` has no vertex section.
  - `S = Sym(⊕_ℕ O_X)` gives `𝔸^∞_X`, which is not of finite type.
  - Behrend–Fantechi require `S₀ = O_X` and `S₁` coherent (BehrendFantechi1997 line 186, p. 5).
- **Repair.** Add the conditions `S₀ = O_X` and `S₁` coherent. Add the Checks "`X ⊔ X` is not a cone" and "`𝔸^∞_X` is not a cone".

## R14 (P3) — Undefined or ambiguous vocabulary

- **Location.**
  - `README.md:417–418`: "prove invariance under proper equivalence".
  - Lines 503–505: "the degree of the virtual class agrees with the ordinary scheme-theoretic length".
  - Line 335: "the Picard stack".
  - Line 374: "obstruction theory".
- **Witness.**
  - "Proper equivalence" is not a standard term.
  - Over `k = ℝ`, `X = Spec ℂ` has scheme-theoretic length 1 but degree 2.
  - SchemeAndStackFoundations uses "Picard stack" for line-bundle moduli (§3.7) and "obstruction theories" for deformation functors (§4.5).
- **Repair.**
  - Write "equivalence of proper DM stacks".
  - Write "equals `dim_k Γ(X, O_X) = Σ_x length(O_{X,x})·[κ(x):k]`".
  - Write "strictly commutative Picard stack (Behrend–Fantechi §2)".
  - Add one sentence that distinguishes Behrend–Fantechi obstruction theories from those of SchemeAndStackFoundations §4.5.

## Verified sound

**Gate and build.**
- The full gate on this head reports every check at 0, then `OK`:

  ```text
  gate VirtualFundamentalClass: set_option=0 … sorry-data=0 … imports=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 … outside-folder=0 source-material=0 OK
  ```

  The worker's run adds `build=0`.
- The dependency check output is `depcheck: 239 roadmaps, 2349 edges, 0 problem(s)`. It has no UPWARD, CYCLE or moved line.
- `lake env lean TauCetiRoadmap/VirtualFundamentalClass/Suggested.lean` exits 0 with no output.
- No `#check` comparison was needed, because the file declares nothing. For the same reason the one-tactic padding probe has nothing to test.
- The pull request changes nothing outside the folder.

**Headline theorems.** The headlines are:
- H1: Thm. 3.11, the intrinsic normal cone is pure of dimension 0 with abelian hull `𝔑_X`.
- H2: Thm. 4.5, obstruction theories correspond to closed immersions.
- H3: Def. 5.2 and Prop. 5.3, construction and independence of `[X,E]`.
- H4: Props. 5.5–5.7 and 5.10.
- H5: §7, the relative class with Props. 7.2–7.5 and Ex. 7.6.
- H6: the interface (not a theorem).

None of them can be stated at the pins. Tau Ceti has only `SchPseudofunctor` (`Stack/Basic.lean:37`), `Spaces.IsAlgebraicSpace` (`AlgebraicSpace/Basic.lean:195`) and scheme-level `Chow.ChowGroup` (`Chow/Basic.lean:295`). There are no DM stacks, no cotangent complex on schemes, no cone stacks and no Gysin maps. A scheme-only stand-in would be forbidden. So an empty file is correct, and only the docstring needs repair (R10).

**Library declarations opened at the pins.** All of these exist as cited:
- `Functor.IsFibered` (`Mathlib/CategoryTheory/FiberedCategory/Fibered.lean:65`)
- `Pseudofunctor.IsStack` (`Mathlib/CategoryTheory/Sites/Descent/IsStack.lean`)
- `fppfTopology` and `fpqcTopology` with their subcanonical instances (`Mathlib/AlgebraicGeometry/Sites/Fpqc.lean:54, 76, 88, 98`), plus `Etale.lean` and `Small.lean`
- `Abelian X.Modules` (`Mathlib/AlgebraicGeometry/Modules/Sheaf.lean:47`)
- `AlgebraicCycle` (`Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`)
- `reesAlgebra` (`Mathlib/RingTheory/ReesAlgebra.lean:40`)
- `Kaehler/` and `Extension/Cotangent/`
- `SchemeWeilDivisor.toAlgebraicCycle` (`TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean:75`)

**Cross-roadmap citations resolved on main.** All of the following resolve and say what the README claims:
- SchemeAndStackFoundations Layer 1: §§1.18–1.22, including `StackInGroupoids`, `IsDeligneMumford` and §1.22 `Stacks.QCoh` on the fppf ringed site.
- SchemeAndStackFoundations Layer 5: §5.1, §5.4, and §5.5 (`normalCone`, `deformationToNormalCone`, `Chow.gysin`, `zeroSection_gysin_eq_homotopy_inverse`).
- AlgebraicVectorBundles L1A (relative Spec) and L2B.
- DerivedModuleAlgebra §§0.1–0.17 and §0.25 (cotangent obstruction theory for square-zero lifts).
- EnhancedDerivedSheaves §0.3 and E1.8 (`PerfectDerived`).
- JacobianChallenge.

**Sources.** Six Stacks links fetched and resolve as described: 026N, 04X8, 08MZ ("the lisse-étale and the flat-fppf sites"), 08P5, 02P3 and 0EDR.

**Ownership by object.** I searched 466 open pull requests and main.
- **Stack dimension, `h¹/h⁰` of complexes, cone stacks, the intrinsic normal cone, Behrend–Fantechi obstruction theories, and the globalised cotangent complex.** There is no other owner.
  - DerivedModuleAlgebra stops at rings.
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory uses `L` only for affine group schemes.
  - DerivedDeRhamCohomology works only on quasisyntomic sites.
- **The virtual classes of ImplicitAtlases, GromovWittenTheory #990 and SymplecticFieldTheory** are Pardon's topological classes, a different object.
- **EquivariantIntersectionTheory #1685** builds integral equivariant Chow groups of global quotients, a different object.
- **GlobalShtukasAndFunctionFieldLanglands §1.4** uses the lisse-étale site for ℓ-adic sheaves but does not own the ringed site.
- **GromovWittenTheory #1998** consumes this roadmap by name. The merge order lists a GromovWittenTheory at line 305; that ordering belongs to its own review.
- **Overlaps file.** No open pull request changes this roadmap, and no cited id is dropped elsewhere.

**Adversarial table.**

| Statement | Instances tried | Values computed (source / README) | Result | Change |
|---|---|---|---|---|
| Rank and sign convention, `h¹/h⁰(E∨)=[E₁/E₀]` | `Spec k`, `E=[k² →0 k⁵]` | rank `5−2=3`; `dim [k²/k⁵] = 2−5 = −3 = −rank` (BF p. 38); reversed quotient gives `+3` | holds | none |
| Gate L0: stack dimension | `[𝔸²/𝔾_m]`; `B𝔾_m`; `Bμ_p` in characteristic `p` | `2−1=1`; `−1`; `0−0=0` (Stacks 0AFR, any finite-type `G`) | holds; README is narrower (smooth `G`) | R08 |
| Gate L1: affine normal cone | `k[x,y]/(xy) ⊃ (x,y)` | `gr = k[a,b]/(ab)` of dimension 1 = `dim B`; `Sym(I/I²) = k[a,b]` | holds | none |
| Gate L2: grading of `0^!` | `E=𝔸^r` over a point; `O(1)` on `ℙ¹` | `A_r(𝔸^r) → A_0`, `[𝔸^r] ↦ [pt]`; `0^!0_*[ℙ¹] = c₁(O(1))∩[ℙ¹] = [pt]` | holds | locator (R08) |
| Layer 2: degree of `BG` | `G=ℤ/2` | `deg[BG] = 1/2` | holds | none |
| Gate L3: comparison with a local embedding | `Spec k[x]/(x²) ⊂ 𝔸¹`, characteristic ≠ 2 | `τ≥−1 L = [(x²)/(x⁴) → O dx]`; `H⁰ = k` = Kähler; `H⁻¹ = (x)/(x²) ≅ k` | holds | cite Illusie III 3.1.3 |
| Layer 3: `L_X` has perfect amplitude `[−1,0]` "exactly" for local complete intersections | hypersurface; `Spec k[x,y]/(x,y)²` | lci ⇒ perfect (Stacks 08SL); converse not in 08SL | converse has no locator | R08 |
| Gate L4: presentation from a resolution | `F• = [O →0 O]` on a point | `h¹/h⁰ = [𝔸¹/𝔾_a]`, dimension `0 = −rank` | holds | none |
| Thm. 3.11 (pure dimension 0) | `Spec k[x]/(x²) ⊂ 𝔸¹` | `C = X×𝔸¹`, dimension 1; `[C/T_M]` has dimension `1−1 = 0` | holds | none |
| Thm. 3.11 (abelian hull) | node cone | hull of `Spec k[a,b]/(ab)` is `Spec k[a,b] = N` | holds | none |
| Prop. 3.12 (lci ⇔ `𝔠=𝔑`) | smooth `𝔸¹`; point in the node | `𝔠 = 𝔑 = BT`; the point in `k[x,y]/(xy)` is not lci and `C ⊊ N` | holds | none |
| Gate L5: atlas independence | two local embeddings | closed substack of an intrinsic `𝔑_X`; equality is local (BF Cor. 3.9) | holds | locator |
| Def. 4.4 / Thm. 4.5 (obstruction theory) | `E = ⊕_ℕ O[1]` on `Spec k` | README's conditions hold; `H⁻¹` not coherent, so (⋆) fails | README admits it | R02 |
| Prop. 5.5 (no obstructions) | `𝔸¹`, `E=Ω`; control `E=Ω⊕O[1]` | virtual dimension 1, class `[X]`; control: printed BF condition holds but virtual dimension 0 and class `c₁(O)∩[X] = 0` | README (`H⁻¹=0`) holds; BF misprint | Source issues |
| Prop. 5.6 (locally free obstructions) | `ℙ¹`, `E = Ω ⊕ O(−1)[1]` | `Ob = O(1)`; virtual dimension `1−1 = 0`; class `c₁(O(1))∩[ℙ¹] = [pt]`; `Ob` is automatically locally free | holds | none |
| Virtual-class degree `rkF₀−rkF₁` | `F• = [O² → O⁵]` | `5−2 = 3 = rk E` | holds | none |
| Prop. 5.3 (independence) | add `[K ≅ K]`; `ℙ¹`, `[O(−2) →0 O]`, `id+ε` | `(rkF₀+rkK)−(rkF₁+rkK) = n`, same class; `ε ∈ H¹(O(−2)) ≅ k` is not a chain map | statement holds; route has a gap | R05 |
| Example after Prop. 5.3 (lci) | `Spec k[ε]/(ε²)`; `Spec k ⊔ 𝔸¹` | class `2[pt]`, degree `2 = dim_k`; ranks 0 and 1, no `n` | needs constant dimension | R06 |
| Prop. 5.7 (products) | `Spec k[ε]/(ε²)` squared | `2[pt]×2[pt] = 4[pt]`; `dim_k = 4` | holds | finite type (R08) |
| Zero locus of a section | `ℙ²`, `O(2)`, smooth conic; `s=0` | virtual dimension `2−1 = 1`; `i_*[X] = 2[line] = c₁(O(2))∩[ℙ²]`; `s=0`: class `2[line]` in `A₁` | holds | none |
| Degree in virtual dimension 0 | `Spec ℂ` over `ℝ` | degree 2; length 1; `dim_ℝ = 2` | wording ambiguous | R14 |
| Cone convention | `S = O_X×O_X` in degree 0 | `X⊔X` has no vertex | admits a wrong model | R13 |
| §7 relative class | `Spec k → B𝔾_m` | `L_{X/Y} = k`; class `[pt] ∈ A_{−1+1}`; no layer builds it | unowned generality | R03 |
| Ex. 7.6 | `W=𝔸²`, `Y=V(xy)`, `V=W` | BF: `[Y] ∈ A_{1+2−2}`; README: `Y` not smooth, so no class | inconsistent | R04 |

## Not verifiable

- **Vistoli 1989, Invent. Math. 97.** The DOI resolves only to a paywalled page, so the citation is recorded as uncertified. Not checked: rational Chow groups and bivariant groups of DM stacks, and the canonical rational equivalence (Lemma 4.6, Defs. 3.10 and 5.1 as cited by Behrend–Fantechi).
- **Illusie, LNM 239 and 283.** Paywalled. Not checked: III Cor. 3.1.3 and the converse of the local complete intersection characterisation.
- **Fulton, *Intersection Theory*, and Laumon–Moret-Bailly, *Champs algébriques*.** Commercial books with no open copy, so they were not fetched.
- **Behrend–Fantechi, Invent. Math. 128.** Paywalled. I read arXiv v1, so I could not check that its theorem numbering agrees with the published version.

## Source issues

- **Misprint** in BehrendFantechi1997 at Proposition 5.5, p. 40: the source says the hypothesis is the vanishing of the degree-one cohomology sheaf of `E•`, which Condition (⋆) already forces; it should be `h⁻¹(E•) = 0`, equivalently `h¹(E•∨) = 0`, as in Prop. 7.3(1); affects a stated result.
- **Misprint** in BehrendFantechi1997 at Example 7.6, p. 52: the source says to intersect with the zero section of `g*N_{Y/X}`; it should be `g*N_{Y/W}`, the normal bundle of `Y` in `W` named in the preceding sentence; affects nothing.
- **Gap** in BehrendFantechi1997 at the proof of Proposition 5.3, p. 39: the source assumes without argument that both global resolutions map to `E•` by chain maps; it should construct a roof through a third resolution, for instance under the resolution property; affects the proof.
