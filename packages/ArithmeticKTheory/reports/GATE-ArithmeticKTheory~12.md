# Human-review response for ArithmeticKTheory

The seven rows of the review's supplier table are H01–H07. The conflation of stage order with the whole-PR sequence is H08, the consumer-only catchall is H09, the status of the earlier reply is H10, and Finding 2 is H11. Every point concerns the pull-request description or discussion, neither of which is part of the branch. Neither `TauCetiRoadmap/ArithmeticKTheory/README.md` nor `TauCetiRoadmap/ArithmeticKTheory/Suggested.lean` contains a defect named by these points. The branch therefore stays at `76f1a28` with no commit. The corrected description text is collected under "Corrected description entries". It is a proposed correction: it has not yet been applied to the description.

## H01 (CBirkbeck) — answered

Confirmed at the indexed heads. AlgebraicKTheory (#1142, `e5df75b`) A0–A1 is consumed at `TauCetiRoadmap/StableHomotopyKTheory/README.md:55` (#1227, `00bfbf7`). Its A2/A4/A5 is consumed at `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:9` and `:63` (#1281, `afe02e8`). It is also the §F.0 input of NoncommutativeAndEquivariantIwasawa (`TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:98`, #1307, `3ec4ff3`). This roadmap reaches that input by the stage path ArithmeticGaloisDuality R02.4 → #1307 §F.3 (`:1716`) → §F.2 (`:516`) → §F.0. The description still omits #1142 and the precedences #1142 → #1227 and #1142 → #1281. The README already records this inheritance at `TauCetiRoadmap/ArithmeticKTheory/README.md:398-400`, so nothing on the branch changes.

## H02 (CBirkbeck) — answered

Confirmed: TangentialBordism (#942, `bf9da30`) B4.1–B4.2 supplies the Steenrod squares and the mod-2 Adams tower consumed at `TauCetiRoadmap/StableHomotopyKTheory/README.md:59`. Its §B4 is also cited at `TauCetiRoadmap/AInfCohomology/README.md:410` (#1044). The description needs #942 and #942 → #1227, keeping the supplier's bounded-below, finite-type convergence hypotheses.

## H03 (CBirkbeck) — answered

Confirmed: LFunctions (#248, `affb2d0`) Layers 3–5 supply the continued Dedekind, Dirichlet and finite-order Hecke functions, their functional equations, Euler-factor comparisons and class-number formulas. These are consumed at `TauCetiRoadmap/IntegralIwasawaTheory/README.md:41` and in the needs line at `:720` (#1306, `5d2ed25`). The description needs #248 and #248 → #1306.

## H04 (CBirkbeck) — answered

Confirmed: LinearFormsInLogarithms (#451, `fd8774c`) §8.10 supplies qualitative Baker–Brumer independence on the small exponential disc at `TauCetiRoadmap/IntegralIwasawaTheory/README.md:41`, and the strong-Leopoldt layer uses it at `:582`. The description needs #451 and #451 → #1306, keeping the disc, algebraicity and rational-independence hypotheses.

## H05 (CBirkbeck) — answered

Confirmed: CFSGBasicProperties (#446, `3e30589`) T0–T2 supplies the simplicity criterion and the restricted ordinary/graph-twisted perfectness rows of `TauCetiRoadmap/ReductiveGroupsPartII/README.md:386-395` (#785, `1383569`). The description needs #446 and #446 → #785, keeping the small-field restrictions.

## H06 (CBirkbeck) — answered

Confirmed: ChevalleyGroups (#447, `99cf6aa`) C2–C4 supplies the integral big cell and the field-point centre at `TauCetiRoadmap/ReductiveGroupsPartII/README.md:385-395`, on the chosen datum's character lattice. The description needs #447 and #447 → #785.

## H07 (CBirkbeck) — answered

Confirmed: `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:116-120` takes the AL.0–AL.1 adapters of AutomorphicLFunctionsAndLocalFactors (#924, `5d22a23`) through ClassicalArithmeticCompletion's on-main contract (`TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:271-273`). There, only the relevant prefixes precede #1307 §§6.1 and 7.9–7.18. At the stage level this roadmap reaches neither those stages nor AL.0–AL.1:
- Its own ClassicalArithmeticCompletion inputs, §§1.14–1.15 and 1.35 (with §1.25), have needs lines `:765`, `:804`, `:1152` and `:1406`. These cite only Mathlib, ClassFieldTheory Layers 6–7, 10 and 14, and GlobalQuadraticForms Layer 4.
- Its suppliers cite #1307 only at §F.3 (ArithmeticGaloisDuality, `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:3380`, #858, `09ad340`) and §F.4 (SelmerIwasawaCohomology, `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:893`, #869, `1fa1c7d`). The needs of those sections (`TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:1716`, `:1745`) and of their prerequisites do not include §§6.1 or 7.9–7.18.

So #924 belongs in the description as a stage-qualified prerequisite of #1307, not as a prerequisite of any stage consumed here.

## H08 (CBirkbeck) — answered

Correct: the arrow chain is a whole-PR sequence. It puts #1307 before #792 and #856, although `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:120` requires the AA.2.4 and §2.7 prefixes before its §§6.1 and 7.9–7.18. The corrected merge block below states this stage relation separately from the whole-PR sequence. The same check shows that the seven rows do not make a whole-roadmap closure: the supplier contracts of roadmaps the description already lists cite at least eleven further new-roadmap pull requests by other authors (located under "Evidence"). The corrected Dependencies paragraph therefore says that it lists direct stages and first-level inherited suppliers, not full transitive closures.

## H09 (CBirkbeck) — answered

Correct: the claim "everything else named in the README is a consumer" is refuted by `TauCetiRoadmap/ArithmeticKTheory/README.md:398-400` (AlgebraicKTheory, inherited) and `:466-470` (HomotopySpheres Stage 9, item 2, a direct supplier). A scan of every roadmap name in the README finds exactly these two that are not on main, not in the description's Dependencies list and not consumers. K3BlochGroups (`:4805`) is the only consumer named. The replacement sentence is in the block below.

## H10 (CBirkbeck) — answered

Status at head `76f1a28`: the README and Suggested.lean did not change for the earlier six omissions or for the catchall, and this response changes neither. The description read for this response still has none of the seven entries and still has the catchall sentence. Nothing in this response is an applied description edit. The text below is the proposed correction.

## H11 (CBirkbeck) — answered

A sentence in a reply, such as "The worker must add AlgebraicKTheory #1142 to the description", reports a proposed correction. It does not authorize an action and does not show that an edit was made. This response states each correction as text with its status (not applied). It performed no GitHub write. The review's own "Suggested fix" is treated in the same way: as proposed content, checked against the cited lines above.

## Corrected description entries

Proposed replacement for the Dependencies tail and an addition to the merge block. Every relation was verified at the heads cited in H01–H08 and under "Evidence".

```text
Roadmaps on main are cited by name. Direct prerequisites are the supplier stages in the README's
Exact supplier contracts, including HomotopySpheres Stage 9, item 2 (#284 or #1287). Inherited
prerequisites from other authors' new-roadmap pull requests (supplying stages -> receiving roadmap):
#1142 AlgebraicKTheory A0-A1 -> #1227; A2/A4/A5 -> #1281; A0-A4 -> #1307 F.0
#942 TangentialBordism B4.1-B4.2 -> #1227; B4 -> #1044
#248 LFunctions Layers 3-5 -> #1306
#451 LinearFormsInLogarithms 8.10 -> #1306
#446 CFSGBasicProperties T0-T2 -> #785
#447 ChevalleyGroups C2-C4 -> #785
#992 GlobalHolomorphicFunctions GH0.3, #887 SmoothBundlesConnections B1.5,
  #896 CharacteristicClasses C1.2 -> #848
#934 QuaternionicModularForms 0.1-0.2 -> #792
#417 PointProcesses Layer 0, #397 RandomMatrices Milestone 8,
  #894 TopologicalKTheory T1.6, T2.3, T4.7-T4.8, T5 -> #851 (T1.5-T1.6 also -> HomotopySpheres)
#1104 AbhyankarLemma 0.1-0.3, 1.1, 3.3-3.4 -> #857, #873; #1103 PurityOfBranchLocus 0.1, 2.1-2.2 -> #857
#899 GroebnerGeometry G4 -> #1199
#253 ZerosOfLFunctions Layer 1, items 5-6 -> #869
Stage qualification: the AA.2.4 prefix of #792, the 2.7 prefix of #856 and the AL.0-AL.1 prefix of #924
precede #1307 6.1 and 7.9-7.18 only. The #1307 stages reached from this roadmap (F.0-F.4) do not use them.
Full transitive closures of these roadmaps are not enumerated. Downstream consumers are those in the
README's Downstream consumers section.
```

## Evidence

The additional first-level suppliers in H08 and in the block above were located and read at their receiving roadmaps:
- `TauCetiRoadmap/ComplexComparisonPartII/README.md:522`, `:547` and `:570` (#848): GH0.3, C1.2 item 2 and B1.5.
- `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:294-295` (#792): QuaternionicModularForms §§0.1–0.2.
- `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:191-193`, `:214`, `:225` and `:226` (#851): TopologicalKTheory, PointProcesses and RandomMatrices.
- `TauCetiRoadmap/CrystallineCohomology/README.md:446` and `:459` (#857), and `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:194` (#873): PurityOfBranchLocus and AbhyankarLemma.
- `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:31-33` (#1199): GroebnerGeometry G4.
- `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:135` (#869): ZerosOfLFunctions Layer 1, items 5–6.
- `TauCetiRoadmap/HomotopySpheres/README.md:88` (#284) and `:91` (#1287): TopologicalKTheory T1.5–T1.6.

The roadmap index marks all of these as new-roadmap pull requests, and none is on main (`e174139`), including in nested folders.

The same scan gave further names that are not inherited prerequisites, so they are excluded:
- Folders on main: CharacterTheory, CompactGroups, LieGroups, LieHighestWeight, RootSystems, SemisimpleAlgebras, SpinRepresentations, InductionRestriction and ClassicalGroups.
- Outbound or downstream mentions: KleinianGroups (`TauCetiRoadmap/ArithmeticLocallySymmetricSpaces/README.md:486`) and PadicHodgeTheory (`TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:488`).

Ownership was not changed. Every inherited construction stays with the owner named above, and no construction, declaration or supply edge was added or moved here. Ownership was checked through the roadmap index and the sibling checkouts given for this job. Citations were checked at the open heads listed in the index and on main `e174139`; the citation check reports no missing cross-roadmap citation or Lean name for this README.

Suggested.lean is byte-identical at `76f1a28`, so the earlier mechanical `#check @name` comparison stands and no scratch elaboration was repeated. The four declarations are at lines 42, 47, 53 and 66. Their binders (CommRing, IsDedekindDomain, Field, Algebra, IsFractionRing, arbitrary S; class-group torsion; primality, oddness, class-number nondivisibility, k ≥ 1) agree with README §§1.1 and 7.2.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `sUnitSubmonoid`, Suggested.lean:42 | ℤ with S=∅ and S={(2)}; the field 𝔽₃ | At S=∅, 1/2 ∉ ℤ, so 2 is excluded; at S={(2)}, 2·(1/2)=1 puts 2 in, while v₃(1/3)=−1 keeps 3 out. In 𝔽₃ the height-one spectrum is empty, S.integer = 𝔽₃, and the submonoid is {1,2} (2·2=1); 0 is excluded. | Separates allowed denominators; field case correct | None |
| `integer_isLocalization_iff`, :47 | ℤ, S={(2)}: M=⟨2⟩, {1}, ⟨6⟩; S=∅, M={1} | ⟨2⟩: ℤ[1/2] true / 2∈(2) true. {1}: ℤ≠ℤ[1/2] false / 1∉(2) false. ⟨6⟩: ℤ[1/6]≠ℤ[1/2] false / 6 not a unit since v₃(1/6)=−1, false. S=∅: ℤ=ℤ true / vacuous true. | Both directions agree on all four | None |
| `integer_isLocalization_of_torsion_classGroup`, :53 | ℤ[√−5], S={𝔭}, 𝔭=(2,1+√−5) | Cl≅ℤ/2 is torsion; 𝔭²=(2), so 2 lies in the submonoid; 𝔭 is the only prime over 2; a²+5b²=2 has no solution, so 𝔭 is not principal. | Torsion suffices without principality | None |
| `regularPrime_dividedBernoulli_num`, :66 | (3,1), (5,2), (5,5), (7,6); controls (37,16) and k=0 | B₂/1=1/6; B₄/2=−1/60 (case p−1 ∣ 2k); B₁₀/5=1/66 (index divisible by p); B₁₂/6=−691/16380 with 691≡5 mod 7. Control B₃₂/16=−7709321041217/8160 with 7709321041217=37·208360028141 (37 irregular). k=0 gives B₀/0=0 in ℚ, numerator 0. | Conclusion holds on the regular cases; both failing controls are excluded by the hypotheses | None |
| AL.0 trace-character signs, forwarded input in H07 | x=1/3 in ℚ | Stated signs: ψ_∞(1/3)·ψ₃(1/3)=e^(2πi/3)·e^(−2πi/3)=1, other places 1. Equal signs: e^(4πi/3)≠1. | Only opposite signs give a character trivial on ℚ | None |
| H07 stage path through ClassicalArithmeticCompletion | Needs lines of §§1.14, 1.15, 1.25, 1.35 | 0 of 4 cite AL.0–AL.1, AA.2.4 or ArithmeticGaloisRepresentations §2.7 | This roadmap's direct use does not reach #924 | None |
| H07 stage path through #1307 | Needs of §§F.3, F.4 and their prerequisites F.0–F.2, 0.2–0.4, 0.11 | 0 cite §6.1, §§7.9–7.18 or the forwarding contract; §F.0 cites AlgebraicKTheory A0–A4 | #924 is stage-qualified to #1307; #1142 is reached | None |
| H09 catchall | Every roadmap name in the README (29 names; a further hit, Regularity, is a heading word) | Not on main, not in Dependencies and not a consumer: AlgebraicKTheory (:399) and HomotopySpheres (:466); K3BlochGroups (:4805) is the one consumer | Catchall false at exactly two names | None |

## Build and gates

`lake build TauCetiRoadmap.ArithmeticKTheory.Suggested` exited 0:

```text
⚠ [8976/8976] Built TauCetiRoadmap.ArithmeticKTheory.Suggested (10s)
warning: TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:47:8: declaration uses `sorry`
warning: TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:53:8: declaration uses `sorry`
warning: TauCetiRoadmap/ArithmeticKTheory/Suggested.lean:66:8: declaration uses `sorry`
Build completed successfully (8976 jobs).
```

The movable dependency check exited 0 with no UPWARD, CYCLE or moved line:

```text
depcheck: 55 roadmaps, 638 edges, 0 problem(s)
```

The gate against origin/main exited 0. The worktree is clean at `76f1a28`.

```text
gate ArithmeticKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Policy greps on Suggested.lean: `set_option` 0, imports exactly `import Mathlib`, `lemma` 0, sorry'd data 0. The README has 0 pull-request references.
