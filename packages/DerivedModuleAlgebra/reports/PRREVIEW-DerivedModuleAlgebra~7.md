# Review of DerivedModuleAlgebra (pull request #1701 at 272504b)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DerivedModuleAlgebra/README.md` and `TauCetiRoadmap/DerivedModuleAlgebra/Suggested.lean` at `272504b0bb87`. The pins are those of `lake-manifest.json`. The gate passes and the dependency check reports no problem. `Suggested.lean` elaborates with 19 `sorry` warnings and no other message. Every sorried theorem survives the one-tactic probe.

There are six findings: one P2 and five P3.
- The P2 (R01) is a headline that can be stated at the pins but is missing. The module docstring gives a reason for leaving out §§0.3 and 0.14–0.17 that does not apply to them.
- The new §1.3 Check uses the wrong witness, and another Check of this README refutes it (R02).
- The other four findings are citation and text repairs (R03–R06).

The previous review's R01–R05 and R07 are repaired. Its R06 and R08 are partly repaired.

## R01 (P2) — Illusie's décalage (§0.17) and the resolution independence of §0.3 can be stated at the pins but are missing

**Location.** `Suggested.lean:57–58`: “the cotangent complex, its powers and the deformation classes (§§0.1–0.25): the simplicial polynomial resolution and the full complex `L_(B/A)` are targets of §§0.1 and 0.4”. Also README:1584–1587 (“for a flat discrete module `N`, `L∧ⁿ(N[1]) ≃ Γⁿ(N)[n]`”) and README:1097–1101.

**Claim.** No headline of §§0.1–0.25 can be stated, because §0.1's resolution and `L_(B/A)` are missing.

**Witness.** §§0.3 and 0.14–0.17 work with modules and use neither of these. Both theorems below elaborate against Mathlib's `AlgebraicTopology.DoldKan.Γ₀`, `ModuleCat.exteriorPower.functor`, `SimplicialObject.whiskering` and Tau Ceti's `DividedPowerAlgebra.homogeneousSubmodule`. Three roadmaps consume the décalage, among them PrismaticCohomology (#1057, README:131).

**Repair.**
1. Add `public import TauCeti.RingTheory.DividedPowerAlgebra.Homogeneous` and `open scoped Simplicial`.
2. State the following two theorems. Put the first under a new `/-! ## Layer 2: … -/` comment. The second belongs to Layer 1.

```lean
/-- **Illusie's décalage for a flat module** (README 0.17; [SAG], Proposition 25.2.4.2,
pp. 1704–1707). Let `N` be a flat `R`-module and `X = Γ₀(N[1])` the Dold–Kan simplicial module of
`N` placed in homological degree one. The alternating face complex of the levelwise exterior
power `⋀ⁿ X` has homology `Γⁿ_R(N)` in degree `n` and zero in every other degree. -/
theorem exteriorPower_decalage (R : Type u) [CommRing R] (N : ModuleCat.{u} R)
    [Module.Flat R N] (n : ℕ) :
    let X := (AlgebraicTopology.DoldKan.Γ₀ (C := ModuleCat.{u} R)).obj
      ((HomologicalComplex.single (ModuleCat.{u} R) (ComplexShape.down ℕ) 1).obj N)
    let Y := ((SimplicialObject.whiskering (ModuleCat.{u} R) (ModuleCat.{u} R)).obj
      (ModuleCat.exteriorPower.functor.{u} R n)).obj X
    let K := (AlgebraicTopology.alternatingFaceMapComplex (ModuleCat.{u} R)).obj Y
    (∀ k, k ≠ n → IsZero (K.homology k)) ∧
      Nonempty (K.homology n ≅
        ModuleCat.of R (DividedPowerAlgebra.homogeneousSubmodule (R := R) (M := N) n)) := by
  sorry

/-- **Levelwise functors preserve weak equivalences of projective simplicial modules**
(README 0.3; Dold–Puppe, Satz 1.15 and §4, 4.1–4.6, pp. 227–229). For an arbitrary, not
necessarily additive, functor `F` and a map `f` of degreewise projective simplicial modules that
is a quasi-isomorphism on alternating face complexes, the levelwise map `F(f)` is again one. -/
theorem quasiIso_whiskering_of_projective (R R' : Type u) [CommRing R] [CommRing R']
    (F : ModuleCat.{u} R ⥤ ModuleCat.{u} R') {X Y : SimplicialObject (ModuleCat.{u} R)}
    [∀ n, Projective (X _⦋n⦌)] [∀ n, Projective (Y _⦋n⦌)] (f : X ⟶ Y)
    [QuasiIso ((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat.{u} R)).map f)] :
    QuasiIso ((AlgebraicTopology.alternatingFaceMapComplex (ModuleCat.{u} R')).map
      (((SimplicialObject.whiskering (ModuleCat.{u} R) (ModuleCat.{u} R')).obj F).map f)) := by
  sorry
```

3. Name `DerivedDeRham.exteriorPower_decalage` in §0.17 and `DerivedDeRham.quasiIso_whiskering_of_projective` in §0.3.
4. Narrow the docstring bullet to the cotangent complex and deformation theory (§§0.1, 0.4–0.13, 0.25). Then say that the functors `LF`, `L∧ⁿ`, `LSymⁿ` and `LΓⁿ` on `D^(≤0)` are constructions of §§0.3 and 0.14–0.16.

**Test.** Both theorems elaborate in a scratch copy, with 21 `sorry` warnings and no other message. The décalage values agree with the §§0.14 and 0.17 Checks:
- `n = 0` gives `R` in degree 0, which is `Γ⁰`.
- `n = 1` gives `N` in degree 1.
- `N = 0` gives zero for `n ≥ 1`.
- Over `F₂` with `N = F₂` and `n = 2`, the homology is `Γ²(F₂) ∋ γ₂(1)` in degree 2, although `⋀²F₂ = 0`.

For the second theorem, the augmentation from `Γ₀([ℤ →2 ℤ])` to the constant `ℤ/2` is a quasi-isomorphism. Under `F = (−)⊗²` its image is not one: `H₁ = ℤ/2` against `0`. So projectivity of `Y` is needed.

## R02 (P3) — The new §1.3 Check uses the wrong witness, and the §1.1.1 Check refutes it

**Location.** README:1940: “A definition testing only `n = 0` would admit `ℤ[1]` as `ℤ`-complete at `I = ℤ`.”

**Claim.** `ℤ[1]` passes the test with `n = 0` and every `f ∈ I`.

**Witness.** Take `f = 2 ∈ I`. Then `Hom(ℤ[1/2], ℤ[1]) = Ext¹_ℤ(ℤ[1/2], ℤ) = ℤ_2/ℤ ≠ 0`. This is the README's own Check at README:1839–1841, `H¹ RHom_ℤ(ℤ[1/p], ℤ) = ℤ_p/ℤ`.

**Repair.** Replace the sentence by: “A definition testing only `n = 0` would admit `ℤ[−1]`, `ℤ` in cohomological degree 1, as `ℤ`-complete at `I = ℤ`. Every `Hom(ℤ[1/f], ℤ[−1])` vanishes, while `Hom(ℤ[−1], ℤ[−1]) = ℤ` at `f = 1`, `n = −1`.”

**Test.**
- `Hom(ℤ[1/f][0], ℤ[−1]) = Ext^(−1) = 0` for every `f`, so the `n = 0` test admits `ℤ[−1]`.
- In `derivedCompleteness` (`Suggested.lean:181–183`), `f = 1` and `n = −1` give the identity of `ℤ⟦−1⟧`, which is nonzero. So the full definition rejects it.

## R03 (P3) — Pinned Tau Ceti and Mathlib results are restated in §§0.2.2, 0.3, 1.E.0 and 1.M.1–1.M.2 without being cited

**Location.**
- README:1015–1017: “construct the natural shuffle map and prove that it and Tau Ceti's natural Alexander–Whitney map … are inverse chain homotopy equivalences”.
- README:2427–2429: “Construct an essential injective hull of `k` inside an injective module containing it … biduality for modules of finite length follows by induction on the length”.
- README:1099 and README:2229.

**Claim.** None of these is at the pins.

**Witness.**
- `SSet.shuffle` and `SSet.eilenbergZilberHomotopyEquiv` are in `TauCeti/AlgebraicTopology/SimplicialSet/Shuffle.lean:689` and `EilenbergZilber.lean:761`. This is the Eilenberg–Zilber theorem for free simplicial modules on simplicial sets.
- `TauCeti.injective_applyₗ_of_injective` is at `RingTheory/MatlisDuality/FiniteLength.lean:102`. It says evaluation is injective for every module.
- `TauCeti.exists_isInjectiveEnvelope_submodule` is at `Envelope/Existence.lean:59`.
- `TauCeti.Huber.IsPseudoCoherentOver` is at `Algebra/Module/PseudoCoherent/Basic.lean:89`.

**Repair.**
1. §0.2.2 and row 114: say that Tau Ceti proves the case of free simplicial modules on simplicial sets (`SSet.shuffle`, `SSet.eilenbergZilberHomotopyEquiv`), and that this section extends it to arbitrary simplicial modules. Add both names to the *Needs* line as a proof route.
2. §0.3: cite Mathlib's `SimplicialObject.Homotopy.whiskerRight` (`Mathlib/AlgebraicTopology/SimplicialObject/Homotopy.lean:102`) for “`F` preserves simplicial homotopies”. Cite `SimplicialObject.Homotopy.toChainHomotopy` (`…/SimplicialObject/ChainHomotopy.lean:157`) as well.
3. §§1.M.1–1.M.2 and row 119: cite `TauCeti.injective_applyₗ_of_injective` as the injectivity half of both biduality headlines. Also cite `TauCeti.IsInjectiveEnvelope.length_linearMap` (`:139`), `TauCeti.residueFieldLinearMapEquiv` (`:57`, the Check `D(k) = k`) and `TauCeti.exists_isInjectiveEnvelope_submodule`. Replace §1.M.1's proof-sketch steps by these citations, and add them to its *Needs* line, which now lists Mathlib only.
4. §1.E.0: say that for a module in degree zero, `IsPseudoCoherent` is `TauCeti.Huber.IsPseudoCoherentOver R M ⊤` with `IsPseudoCoherentOver.exists_quasiIso_single₀` (`PseudoCoherent/ChainComplex.lean:41`). Cite `IsPseudoCoherentOver.of_isNoetherianRing` (`Basic.lean:391`) at the `k[ε]/(ε²)` Check (README:2356).

**Test.**
- The lattice-path sign of `SSet.shuffle` (`Shuffle.lean` docstring) gives `+(s₁x, s₀y) − (s₀x, s₁y)` in bidegree (1,1). This is the formula fixed at `Suggested.lean:126–127`.
- For `R = k` and `M = ⊕_ℕ k`, `injective_applyₗ_of_injective` gives the injectivity that the §1.M.1 Check (README:2456–2457) asserts.

## R04 (P3) — The table mapping old Lean names to sections misses five names that other roadmaps cite

**Location.** README:59 lists only `CompactCoefficients.Tower`, `.toModuleFunctor`, `.limComparison` and `.limOneComparison`. Neither `Algebra.CotangentComplex.smooth` nor `.regularQuotient` appears anywhere in the README.

**Claim.** Every dropped name that another roadmap cites has a line in the table.

**Witness.**
- Main's EnhancedDerivedSheaves README:2940 cites “(`Algebra.CotangentComplex.smooth`, `.regularQuotient`)”. So do the heads of #1330 (README:2944) and #1630 (README:3007).
- ArithmeticGaloisDuality (#858) README:531–532 cites `CompactCoefficients.Tower.lim` and `.limOne`.
- StableHomotopyKTheory (#1227) README:2459 cites `CompactCoefficients.Tower.shift`.

**Repair.** Add rows:
- `Algebra.CotangentComplex.smooth` → §0.12;
- `Algebra.CotangentComplex.regularQuotient` → §0.13;
- `CompactCoefficients.Tower.lim`, `.limOne` and `.shift` → `TauCeti.ModuleTower.lim`, `.limOne` and `.shift` over `ℤ`.

**Test.** These names were found with `roadmaps grep` over every name declared in main's `Suggested.lean` and every own name in main's README that this head drops. No other cited name lacks a resolution: `DerivedDeRham.derivedCompletion` and `completionUnit` resolve to the signatures at README:1898–1901.

## R05 (P3) — Mechanical deletion of Lean names has left broken sentences

**Location.**
- README:1240–1243: “the class of an extension is its / the morphism obstruction … `d₀ − d₁` / .”
- README:1343: “images under `DerivedCategory.Q` of chain maps the first transitivity map and the second transitivity map”.
- README:1653: a sentence beginning “the flat specialization”.
- README:2089: “the displayed underlying-unit equation as displayed above”.
- README:1061–1062: “with homotopy inverse the shuffle map; this is the headline”.

**Claim.** The prose of §§0.5, 0.8, 0.25, 1.6 and 0.2.2 is complete and matches the Lean.

**Witness.** Main's README:914–917 reads “its `morphismObstruction` for the identity map … (`morphismObstruction_cocycle`)”. The head deleted the names without rejoining the sentence. `bisimplicialDiagonalComparison` (`Suggested.lean:135–142`) does not fix the inverse map.

**Repair.**
- “is its morphism obstruction for the identity map, normalized … in the order `d₀ − d₁`.” on one line.
- “of chain maps, the first and second transitivity maps, induced by …”.
- Capitalise “The flat specialization”.
- “satisfying the underlying-unit equation above”.
- At README:1061–1062: “is a chain homotopy equivalence; this is the headline `DerivedDeRham.bisimplicialDiagonalComparison`. Its homotopy inverse is the shuffle map constructed here.”

## R06 (P3) — The pull-request description still misdescribes this head

**Location.** The pull-request description, quoted as data: “README only; `Suggested.lean` is unchanged”, and the summary block's “Roby representability (`PD.robyRepresentability`)”.

**Claim.** The description matches the change.

**Witness.** `git diff --stat origin/main...HEAD` shows `Suggested.lean | 1521`. The head deletes 113 declarations of main's `Suggested.lean` and states 19 theorems. `PD.robyRepresentability` exists neither on main nor at this head.

**Repair.** Delete “README only; `Suggested.lean` is unchanged”. In one sentence, list what this head adds and removes, and point to the mapping table (README:38–73). Replace `PD.robyRepresentability` with `DividedPowerAlgebra.homogeneousLawEquiv`. This completes the previous review's R08: the README part of that finding is repaired.

## Previous findings

- **R01 (P2), completion reflector: repaired.**
  - `Suggested.lean:215–220` states `derivedCompleteness_isRightAdjoint` “for a finitely generated ideal `I`, the inclusion … has a left adjoint”.
  - README:1891–1894 and 1917–1918 name it.
  - The docstring bullet is narrowed (`Suggested.lean:61–63`).
- **R02 (P2), Eilenberg–Zilber: repaired.**
  - `Suggested.lean:120–121` adds “`(e X Y).inv = SimplicialObject.alexanderWhitney X Y`”.
  - `Suggested.lean:135–142` states `bisimplicialDiagonalComparison`, with both imports (lines 7–8).
  - README:1036–1040 and 1076–1081 and row 114 cite the Tau Ceti declarations.
- **R03 (P3), K-flat replacement: repaired.** The theorem and its import are deleted. README:802–808 cites `CochainComplex.kFlatResolution` and its three instances.
- **R04 (P3), padding: repaired.** `isCompletelyFlatModule_of_flat` is deleted, and README:2132–2134 cites `ModuleCat.isZero_Tor_succ_of_flat`. The replacement `isCompletelyFlatModule_of_isAdicComplete` (`Suggested.lean:256–263`) and the forward direction `isAdicComplete_of_isCompletelyFlatModule` are stated.
- **R05 (P3), uncited Koszul and Matlis declarations: repaired.** README:655–662, 679–688 and 2461–2469, and rows 113 and 119, cite them. The further uncited results are R03 above.
- **R06 (P3), old → new names: partly repaired.** README:38–73 adds the table. Five cited names are still missing (R04 above).
- **R07 (P3), locators: repaired.**
  - README:1452–1453 now reads “pp.18–19; for polynomial rings, §4, Lemma 4.7 (Tag 08QH), p.6”. This is StacksCt line 228, on p.6.
  - README:2196–2197 now gives “Theorem 3.1 … Remark 3.2, pp.217–218; Lemmas 4.4 and 4.5(2), pp.220–221; Corollary 4.8(3) and Remark 4.9, p.223”. This is BMS19 lines 751, 784, 872, 888, 963 and 973.
- **R08 (P3), AlgebraicTopology title and description: partly repaired.** README:30–31, 106 and 123–124 now cite “*Countable inverse-system algebra*”. This resolves on main (AlgebraicTopology README:954, with the homotopy-commuting squares at :980). The description is not updated (R06 above).

## Verified sound

**Heads, gate, dependencies.**
- The worktree is at `272504b0bb8765321a401b1e0e615e4657ee7f7e`, and nothing in it was changed.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The re-run gate prints every counter as 0 and ends in `OK`.
- Dependency check, with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 238 roadmaps, 2358 edges, 0 problem(s)
```

- The only roadmap supplier is AlgebraicTopology, which is on main. No supplier gap is declared.
- `PROGRESS.md`, `STATUS.md` and `metadata.toml` are generated files and pass `stray-files`.

**Elaboration, binders, probes.**
- `lake env lean` on `Suggested.lean` gives exactly 19 “declaration uses `sorry`” warnings.
- The 29 elaborated types in `signatures.md` keep every binder. I compared each with its README statement and found no mismatch. The universes `HasDerivedCategory.{w}`/`.{w'}` of `derivedLimit_isTriangulated` match README:1726–1727.
- Replacing each of the 19 `sorry` by `first | rfl | infer_instance | simp | trivial` leaves 19 errors.
- Targeted searches find no completely-flat, décalage, bisimplicial Eilenberg–Zilber or reflector declaration at the pins. So no theorem is padding.

**Library declarations opened at the pins (35, counting the ten named in R01 and R03).**
- Tau Ceti:
  - `SimplicialObject.alexanderWhitney` (`AlexanderWhitney.lean:172`, Koszul-sign target) and `alexanderWhitney_naturality` (:222);
  - `diag`, `doubleComplex` and `diagAlexanderWhitney` (`Bisimplicial.lean:83, 143, 313`), with `d₁ + (−1)^p d₂` as the README says;
  - `SSet.shuffle`/`eilenbergZilberHomotopyEquiv` (R03);
  - `koszulComplex.map` (`Basic.lean:270`, `⋀ⁿ g`), `smulHomotopy` (:331), `homologyZeroEquivSpan` (:399), `tensorIso`/`tensorIsoAppend` (`Tensor.lean:319, 340`) and `exactAt_of_isWeaklyRegular` (`Regular.lean:140`). No mapping-cone or DG-algebra clause is present, as README:683–684 says;
  - `kFlatResolution.quasiIso_π` (`Resolution.lean:301`);
  - `ModuleCat.isZero_Tor_succ_of_flat` (`Tor.lean:233`, flat first argument, matching `IsCompletelyFlatModule`);
  - `AdicCompletion.torsionModule` (`Torsion.lean:95`);
  - `IsKInjective.exists_homotopyEquiv` (`KInjective.lean:66`);
  - `IsInjectiveEnvelope` (`Envelope/Basic.lean:95`);
  - `bijective_applyₗ` (`FiniteLength.lean:155`) and `isArtinian_of_finite_adicCompletion_linearMap` (`Artinian.lean:100`);
  - `columnFiltrationSpectralSequenceFirstPageXIso` (`Bicomplex.lean:446`, page 2 at `(−k−2p, p)`);
  - `DerivedCategory.Bounded.perfect_iff` (`DerivedCategory/Perfect.lean:192`). This concerns arbitrary projectives in `Dᵇ`, so it is not a duplicate of `IsPerfect`.
- Mathlib: `ModuleCat.exteriorPower.functor` (`ExteriorPower.lean:105`), `DoldKan.Γ₀` (`FunctorGamma.lean:321`) and `SimplicialObject.whiskering` (`SimplicialObject/Basic.lean:216`).
- The AffineCrystalline citation of §1.1 resolves: `CechNerveData` and `rightDerivedLimIsoCech` are at AffineCrystalline `Cohomology/CechDerived.lean` lines 15–34 and 74.

**Seeded sample (15 targets, all verified).** The README flags no locator as unverified.

| Target | Lines read | Result |
| --- | --- | --- |
| 0.2 | StacksMA 6709 (60.1, p.144), 6725 (60.5), 6741 (60.7, p.145), 6753 (60.8, any filtered colimit), 6781 (60.10, flat terms, p.146), 6824 (60.12), 6846 (60.13, p.147) | Exact |
| 0.2.2 | DoldPuppe 422 (Satz 2.9, p.213), 567–582 (Satz 2.15 with the AW and shuffle components, p.217), 583 (2.16, pp.217–218); StacksSites 4324–4339 (Rem. 21.39.11, Tag 08QD, pp.96–97) | Exact |
| 0.3 | DoldPuppe 902–966 (§4 from p.227; 4.5 and 4.7 on p.228); StacksSimp 2128 (Rem. 14.26.4, Tag 019M); SAG 62226 (25.2.1.2, p.1698), 62247 (25.2.1.3, p.1699) | Exact |
| 0.5 | StacksDefos 56 (2.1, p.2), 127 (2.2, p.3), 161 (2.3, p.4), 177 (2.4, p.4); GR 1454–1480 (2.5.4–2.5.7, p.30) | Exact |
| 0.6 | StacksCt 206 (4.5, p.5), 933 (11.3, p.21); StacksDefos 161; Bhatt12 1188–1191 (Rem. 6.6, eq. (6), p.25); GR 1672 (2.5.30, p.34), 1946–1949 (3.2.1, (3.2.2), p.41) | Exact |
| 0.8 | StacksCt 704 (Prop. 7.4, p.16) | Exact |
| 0.10 | StacksCt 456 (§6, p.11), 519 (6.2, p.12; hypothesis `B ⊗^L A′ = B′`) | Exact |
| 0.14 | SAG 62288–62295 (25.2.2.2, p.1700), 62365 (25.2.3.1, p.1702), 62398–62408 (25.2.3.2–3, p.1703), 62412–62420 (25.2.3.4); BL22 10001 (B.1, p.225), 10042 (B.5, p.226) | Exact; SAG's signed coinvariants are corrected in the README (Source issues) |
| 0.15 | SAG 62262 (25.2.2.1, p.1699), 62414 (25.2.3.4(1)); DoldPuppe 994 (4.10, p.229) | Exact |
| 0.25 | StacksCt 1408–1414 (16.1, p.31), 1676 (21.1, p.37); StacksAlg 11014–11019 (10.99.8, pp.233–234); StacksDefos 56; GR 1685 (2.5.32, p.35), 1986–2016 ((3.2.7)–(3.2.10), 3.2.11, pp.41–42) | Exact |
| 1.1 | StacksMA 10946 (89.1, p.238), 10971 (89.3), 10983 (89.4, p.239), 11108 (89.10, p.241), 11124, 11133 (89.11–12, p.242) | Exact |
| 1.1.1 | StacksMA 8707–8726 (§15.75, (75.0.1)–(75.0.2), 75.1, p.189); StacksSites §21.35 | Exact |
| 1.5 | StacksMA 12496, 12520 (95.1–2, p.271), 12535, 12557 (95.3–4), 12717 (96.1, p.275), 12739 (96.2, p.276), 12749, 12756 (96.3–4); Prisms 399–400 (footnote 5, p.10: the regular-sequence and Noetherian cases) | Exact |
| 1.8 | BMS19 850–855 (Def. 4.1 with ordinary `A/pA`, p.220), 895 (4.6, p.221), 908–919 (4.7(1)–(2), pp.221–222), 958 (4.8, p.223) | Exact; both Lean statements match 4.7 clause by clause |
| 1.9 | BMS19 751–765 (3.1 and assertion (1), p.217), 784 (3.2, p.218), 872 (4.4, p.220), 888–891 (4.5(2), p.221), 963 (4.8(3)), 973 (4.9, p.223) | Exact |

**Cross-roadmap citations and ownership.**
- AlgebraicTopology Stage 6 item 0 resolves on main (README:954, 980). AlgebraicTopology's Stage 5.1 (README:856) owns only the singular Eilenberg–Zilber theorem, so it is not a second owner of §0.2.2.
- RepresentationTheory/ArtinAlgebras on main defers Matlis duality over local rings to §1.M.2 (README:61).
- Main's PerfectoidSpaces README:10970–10972 cites 20 names; every one resolves through the table, the signatures at README:1898–1901 or `Suggested.lean`.
- `roadmaps grep` for Eilenberg–Zilber, Matlis, “completely flat” and décalage finds only consumers or different statements. PrismaticCohomology (#1057) README:1481 concerns bounded prisms.
- No other `Suggested.lean` uses the namespace `TauCetiRoadmap.DerivedModuleAlgebra`.
- `overlaps.md` reports no pull request changing this roadmap. The §1.T.1 ids it lists are mapped at README:34–36.

**Adversarial table.** Every row below was computed in this review.

| Statement | Instances | Values on each side; wrong model excluded | Result |
| --- | --- | --- | --- |
| `simplicialTensorComparison` (1,1) | `x ∈ X₁`, `y ∈ Y₁` | `d∇(x⊗y) = s₀(dx)⊗y − x⊗s₀(dy) = ∇(dx⊗y − x⊗dy)` for `+s₁x⊗s₀y − s₀x⊗s₁y`. The opposite sign gives `−s₀(dx)⊗y + …` and is not a chain map. `AW∘∇ = id − s₀d₁x⊗s₀d₀y`, homotopic to `id`. | True |
| same, free case | `X = R[K]`, `Y = R[L]` | the SSet lattice-path sign gives the same (1,1) formula | Consistent (R03) |
| `bisimplicialDiagonalComparison` | constant `P`; `Z = X⊗Y` with `X = Y = Γ₀(A[1])` | homology `P` in degree 0 on both sides; `A` in degree 2 on both sides | True |
| `nonempty_bicomplexSecondPageIso` | `p = k = 0`; column 0 only | `E²₀₀ = H₀(Tot)` on both sides; `H_k(C)` at `(−k, 0)` on both sides | True |
| `derivedLimit_isTriangulated` | `K_n = ℤ`, `×p` | fibre `Rlim → ∏ℤ → ∏ℤ`: `H⁰ = 0`, `H¹ = ℤ_p/ℤ` | True |
| `derivedCompleteness` + 4 laws | `I = 0`; `I = A`; `(p) ⊂ ℤ` | `A[1/0] = 0`, all objects complete; `Hom(A[n], M) = H^(−n)M`, only `0`; `ℤ_p` complete, `ℚ_p` not (`1 ↦ 1`) | True |
| `derivedCompleteness_isRightAdjoint` | the same three | left adjoints `id`, `0`, `ℤ ↦ ℤ_p` with `ℤ[1/p] ↦ 0` | True |
| §1.3 Check (R02) | `ℤ[1]`, `f = 2`; `ℤ[−1]` | `Ext¹(ℤ[1/2], ℤ) = ℤ_2/ℤ ≠ 0`, so the `n = 0` test rejects `ℤ[1]`; `Ext^(−1) = 0` for all `f` but `End(ℤ) ≠ 0` at `n = −1` | Check false; repaired witness tested |
| `IsCompletelyFlatModule` | `ℤ`/`ℤ` at `(p)`; `F_p`/`ℤ`; `ℤ_p` | flat, so yes; `Tor₁ = F_p ≠ 0`, so no; yes | Correct |
| `isAdicComplete_of_isCompletelyFlatModule` | `ℤ_p`; `M = A = ℤ/4`, `p = 2`; `A = F_p`; `A = ℚ`, `p = 2` | all conclusions hold; `M ⊗ A[2] → M[2]` sends `1⊗2 ↦ 2`, iso `ℤ/2 ≅ 2ℤ/4`; `span{p} = 0` and every clause holds; `span{p} = ⊤` forces `M = 0` | True |
| `isCompletelyFlatModule_of_isAdicComplete` | `ℤ/2` over `ℤ/4`; `∏ℤ/pⁿ` over `ℤ_p` | `hflat` fails at `n = 2` and `Tor₁ = ℤ/2`, so the conclusion fails as well; `hM` fails and `Tor₁ = M[p] ≠ 0` | Hypotheses needed |
| `IsPerfect`, closure laws | `A = k×k`, `eA`; `cone(×2 on ℤ[0])` | perfect, with no bounded free model (Euler ranks `(1,0)`); finite free two-term | True |
| `ringTowerLimit_jacobson` | `k[t]/tⁿ⁺¹`; `k[x_i]/(x_i²)` | `1+t` is a unit; the kernel is locally nilpotent but `I^r ≠ 0` | True |
| `pseudoCoherent_residueCriterion` | `[k[[t]] →t k[[t]]]`; zero ring; `a > b` | fibre `[k →0 k]` in `[−1,0]`; no residue fields and every module is `0`; `K ⊗^L κ(m) = 0` for all `m` forces `K = 0` | True |
| Matlis biduality | `ℤ_p`, `E = ℚ_p/ℤ_p`; `ℤ_(p)`; `R = k`, `⊕k` | `D(ℤ_p) = E`, `D(E) = ℤ_p`; `D(E) = ℤ_p` is not finite over `ℤ_(p)`, so completeness is needed; excluded by finiteness | True |
| décalage (R01) | `n = 0, 1`; `N = 0`; `F₂`, `n = 2` | `R` in degree 0; `N` in degree 1; `0`; `Γ²(F₂) ∋ γ₂(1)` in degree 2, although `⋀²F₂ = 0` | True; statable |
| §0.3 invariance (R01) | `Γ₀([ℤ →2 ℤ]) → ℤ/2`, `F = ⊗²` | `H₁ = ℤ/2` against `0` without projectivity of `Y` | Hypothesis needed |
| 0.2 (sample) | `F_p ⊗^L F_p`; `(ℤ/4, ×2)` | `H⁰ = H^(−1) = F_p`; termwise `F₂` in every degree against derived `0` | True |
| 0.3 | `F = ⊗²`, `M = ℤ/2`; constant `F` | `H^(−1) = Tor₁ = ℤ/2`; `R′[0]` | True |
| 0.5 / 0.6 | `ℤ/4 → F₂`; `ℤ/9 → F₃` | `Exal = Hom(2ℤ/4, F₂) = F₂`, and the sum of two copies is `0`; `3 mod 9 ↦ 1`, order 3 | True |
| 0.8 / 0.10 | `ℤ → ℤ → ℤ/3`; `ℤ → F_p`, `A′ = F_p` | second map an iso on `H^(−1) = ℤ/3`; ordinary pushout `0` against `F_p[1]`, with `Tor₁ = F_p` | True |
| 0.14 / 0.15 / 0.16 | `Be` over `F₂`; `ℤe`; `F_p e` | `∧² = 0` against signed coinvariants `F₂`; `Sym² = ℤe²`; `γ_p(e) ≠ 0 = e^p` | True |
| 0.25 | `ℤ/4 → F₂`, `c = 0`, `B′ = F₂[ε]` | kernel `F₂ε`, `JB′ = 0`, `B′/JB′ ≠ B`, not flat | Canonical `c` needed |
| 1.1 / 1.1.1 | `[ℤ → ℤ/pⁿ⁺¹]`; `RHom(ℤ/p, ℤ)` | `H¹(Rlim) = ℤ_p/ℤ` although every `H¹ = 0`; `H¹ = ℤ/p` | True |
| 1.5 | `k[x,y]/(xy)`; `ℤ_p ⋉ ℚ_p/ℤ_p` | Noetherian, giving `k[[x,y]]/(xy)`; naive `ℤ_p[0]` against `H^(−1) = ℤ_p`, not split in `D(A)` | True |
| 1.9 | `ℤ_p → ℤ_p×ℤ_p`; `ℤ_p → F_p` | the Čech complex splits; `Tor₁(F_p,F_p) ≠ 0` | True |

No restriction to good primes, flat inputs or finite residue fields is introduced. The computations cover the zero ring, the unit and zero ideals, characteristic 2, the cases `p = 0` and `p` a unit, non-flat modules and unbounded towers.

## Not verifiable

- NSW, Proposition 2.1.1 and Lemma 2.2.4 (§S.1 and the docstring of `nonempty_bicomplexSecondPageIso`). The sources service resolves the author-page link to the book's landing page. The indexing was checked against Tau Ceti instead (`Bicomplex.lean:446`).
- IllusieCC, Chapter II, 1.2.6.2 (§0.9), and the Illusie errata. Outside the sample; the Springer volume has no open copy.
- Ownership against open pull requests was checked with `roadmaps grep` only, for the objects named above.

## Source issues

- **Error** in SAG at Construction 25.2.2.2, p.1700 (repeated in Proposition 25.2.3.4(2), p.1703): the source takes the exterior power to be signed-permutation coinvariants and asserts the usual free basis; it should use the quotient by alternating relations including `x⊗x`, since for a free rank-one module over `ℤ` signed coinvariants give `ℤ/2`; affects a stated result.
- **Error** in StacksMA at the opening paragraph of §15.96, Tag 0BKH, printed p.275: the source says the derived completion of `A = ℤ_p ⊕ ℚ_p/ℤ_p` at `(p)` is `ℤ_p[1] ⊕ ℤ_p[0]`, computation omitted; it should say this splitting holds only after restriction to `D(ℤ_p)`, since in `D(A)` every map from the completion to `ℤ_p[1]` vanishes; affects a stated result.
