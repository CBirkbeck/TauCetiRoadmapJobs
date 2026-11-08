# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at e083f44)

**Verdict:** needs changes

This is a full review at the same head as the previous review; the folder has 0 changed lines since then. The gate passes. There are two blocking findings. R01 is still open. R02 is new: Tau Ceti at the current pin now carries a carrier that makes one more headline statable.

**Previous findings, one by one.**
- **R01 of the previous review (P2), two owners of local Lefschetz and local duality: not repaired.** `README.md:23` still reads "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 … and owns none of these statements". PurityForFlatCohomology's pull request has moved to head 08c5cf24, and that head still owns §§1.4–1.5. It is raised again as R01 below.

## R01 (P2) — Local Lefschetz and local duality on regular local rings still have two owners

**Location:** `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 for the hypersurface step of its bound of the étale depth by the virtual dimension, and owns none of these statements." Also `README.md:1570` (Downstream consumers: "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)").

**Claim:** §§5.7, 6.11, 6.12, 7.1 and 7.3 are owned here, and PurityForFlatCohomology consumes §7.3 and owns none of them.

**Witness:** At #1840, head 08c5cf24 (2026-11-08 19:58), `TauCetiRoadmap/PurityForFlatCohomology/README.md`:
- `:187–188` and `:2888` name this roadmap as the importer of §§1.4–1.5.
- `:956` (§1.4) restates §7.1, §6.11 and the regular case of §6.12.
- `:1009` (§1.5) restates §7.3.
- `:1048` (§1.6) cites its own §1.5.

The latest commit, 08c5cf24 ("answer the review comment on ownership and coordination"), leaves these lines unchanged.

**What decides the direction.** PurityForFlatCohomology's own review (PRREVIEW-PurityForFlatCohomology~6, "Ownership against open work") says the change belongs in this pull request, because that roadmap is earlier in the merge order. In the same paragraph it concedes that its §1.4 states Gabber's affine Lefschetz theorem and the existence of dualizing complexes "without a route", and that "#1743 Layers 0–6 is the only plan of the machinery behind them". The mathematics settles the direction:
- §1.4(a) there is ILO XV Corollaire 1.2.4 restricted to regular rings, which is §5.7/§7.1 here.
- §1.4(b) there is ILO XVII Théorème 0.9, which is §6.10/§6.11 here.
- Their proofs need uniformization, oriented descent and Gabber finiteness. Only Layers 0–5 here plan those. The *Needs* there (EtaleCohomologyFoundations §F.5, LefschetzPencilsAndVanishingCycles §0.10, SchemeAndStackFoundations §§0.21, 2.15) supply none of them.

So owning §1.4 at PurityForFlatCohomology's present position leaves it without an owned prerequisite. Moving that roadmap after this one is allowed and obstructs nothing:
- I took its current README, replaced "§1.5" in the §1.6 *Needs* (`:1048`) with "EtaleDualityAndPerverseSheavesPartII §7.3", and ran the movable dependency check. Output: `moved: PurityForFlatCohomology moved in the merge order from #217 to #384, right after its last supplier EtaleDualityAndPerverseSheavesPartII`, then `depcheck: 238 roadmaps, 2350 edges, 0 problem(s)`.
- Without `--movable` the same text gives one line, `UPWARD: PurityForFlatCohomology (#217) -> EtaleDualityAndPerverseSheavesPartII (#384)`. The project's rule treats a `moved:` line as no defect.
- `roadmaps grep --readme-only PurityForFlatCohomology` over main and the 466 open heads finds no roadmap that consumes it as a supplier. The hits are only this roadmap, #1840 itself, LocalPurity in #1808 (a supplier of it), GroupSchemesOverABase #1522 (an overlap note), and the SchemeAndStackFoundationsPartII and PerfectoidQuotientsPartII packages (consumer notes).

**Repair:** The two reviews contradict each other, so the operator should settle this once for both pull requests. The single-owner assignment the mathematics supports is:
- *In PurityForFlatCohomology (#1840, same author):*
  - Delete §§1.4–1.5 and the importer bullets at `:187–188` and `:2888`.
  - Add a `From TauCetiRoadmap.EtaleDualityAndPerverseSheavesPartII` contract citing:
    - §7.1 (or §5.7) for its §1.4(a);
    - §6.11 with §6.10 for §1.4(b);
    - §6.12 for §1.4(c);
    - §7.3 for local Lefschetz.
  - In §1.6 (the *Needs* at `:1048` and the route at `:1044`), cite "EtaleDualityAndPerverseSheavesPartII §7.3".
  - Run the movable dependency check, which gives the output quoted above.
- *In this folder:* no edit to lines 23 and 1570. They are correct once #1840 makes that change.

If the operator instead keeps ownership in PurityForFlatCohomology, then this folder must delete §§7.1–7.3, the regular case of §6.12, and the last two sentences of line 23, and cite its §§1.4–1.5. Its §1.4(a) would then still need this roadmap's §5.7, which is upward from its present position. That option therefore does not remove the move; it only splits the material.

## R02 (P2) — The local form of Gabber's affine Lefschetz theorem is statable at the pins but is not stated

**Location:**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/Suggested.lean:26–28`: "Affine Lefschetz, including the supplied trait theorem and its strict-local consequence, needs dimension functions and constructible étale sheaves; the quasi-excellent theorem also needs the quasi-excellence predicate."
- `README.md:64`: "No Tau Ceti module is needed by the headline signatures".
- `README.md:984` (§5.7).

**Claim:** Affine Lefschetz is a headline (Summary, line 3). The module docstring says it is not statable.

**Witness:** The pinned Tau Ceti has `class IsGRing` in namespace `TauCeti.Excellence` (`TauCeti/RingTheory/RegularLocalRing/GRing.lean:57`, module `TauCeti.RingTheory.RegularLocalRing.GRing`). ILO14 line 724 (I 5.5.1(ii), p. 13) states that a noetherian local ring is quasi-excellent exactly when it is a G-ring.

**Why this is the headline, not a stand-in.** §5.7's first sentence is ILO XV Corollaire 1.2.4 (ILO14 line 10362). ILO XV 1.2.1–1.2.3 (ILO14 lines 10341–10357) proves it equivalent to Théorème 1.1.2, and Exposé 0, Corollaire 8 states its henselian form (ILO14 line 396). It needs no dimension function and no constructible sheaf: the coefficients are the constant sheaf ℤ/n, and the hypotheses are a strictly local ring, its Krull dimension, quasi-excellence and an affine open. These are the carriers `cohomologicalDimension_le_of_strictlyLocal` already uses, plus `IsGRing`.

**Repair, tested:** Add the theorem after `cohomologicalDimension_le_of_strictlyLocal`, with the import `public import TauCeti.RingTheory.RegularLocalRing.GRing`. I elaborated exactly this in a copy in my scratch directory with `lake env lean` at the pins. The only warning is `declaration uses sorry`, and `#check` shows every binder. A one-tactic probe (`infer_instance`) fails.

```lean
/-- Gabber's affine Lefschetz theorem, local form: for a strictly henselian noetherian
local ring of dimension d that is quasi-excellent (for a local ring, a G-ring), every affine
open U and n invertible, H^q(U, ℤ/n) = 0 for q > d (ILO XV 1.2.4; ILO I 5.5.1(ii);
ILO14 lines 10362, 724). -/
theorem affineLefschetz_strictlyLocal
    (A : Type u) [CommRing A] [HenselianLocalRing A]
    [IsSepClosed (IsLocalRing.ResidueField A)] [TauCeti.Excellence.IsGRing A]
    (d : ℕ) (hdim : ringKrullDim A = d) (n : ℕ) (hn : IsUnit (n : A))
    (U : (AlgebraicGeometry.Spec (CommRingCat.of A)).Opens)
    (hU : AlgebraicGeometry.IsAffineOpen U) (q : ℕ) (hq : d < q) :
    Subsingleton
      (((CategoryTheory.constantSheaf U.toScheme.smallEtaleTopology AddCommGrpCat.{u}).obj
        (AddCommGrpCat.of (ULift.{u} (ZMod n)))).H q) := by
  sorry
```

Values checked on this statement:
- d = 0: U is ∅ or X, and H^q = 0 for q > 0.
- Strict trait with U = η: H¹ = ℤ/n(−1) ≠ 0 at q = d = 1, and H^q = 0 for q ≥ 2. The bound q > d is sharp.
- n = 1 gives the zero sheaf. n = 0 is excluded, because `IsUnit (0 : A)` fails in a local ring.

Then make the matching text changes:
- **§5.7 (`README.md:984–990`):** name `affineLefschetz_strictlyLocal`. Say that quasi-excellence of the local ring is `TauCeti.Excellence.IsGRing`, by ILO I 5.5.1(ii) (ILO14 line 724).
- **`README.md:64`:** cite the module and declaration in the From Tau Ceti contract.
- **Module docstring:** limit the affine-Lefschetz bullet to the general theorem (§5.6) and the trait theorem with its consequence (§5.5). Name the local form as stated. In the dimension-function bullet, drop "strict henselizations" and "regular-morphism interfaces" from the missing carriers. Tau Ceti has the strict henselization of a local ring (`TauCeti.RingTheory.StrictHenselization.*`) and `TauCeti.Excellence.RegularAlgebraMap`. What is missing is étale specialization between geometric points of a scheme.
- **Do not also state §7.1:** it is the case U = Spec R[1/f] of the same theorem, so it would be padding.

## R03 (P3) — §7.1's *Needs* lists a supplier its route does not use

**Location:** `README.md:1380`: "*Needs:* §5.7; ArcTopologyAndDescent §§8.6–8.9; Mathlib `IsRegularLocalRing`."

**Claim:** The completion comparison of ArcTopologyAndDescent is an input of §7.1.

**Witness:** The route at `README.md:1378` reads "Apply §5.7 directly to the affine open Spec R[1/f] … no comparison of this punctured-open cohomology for an arbitrary R with its maximal-ideal completion is asserted." §5.7's hypotheses (strictly local and quasi-excellent) hold for R as stated.

**Repair:** Delete "ArcTopologyAndDescent §§8.6–8.9" from §7.1's *Needs*. §7.2 keeps it, because there the supported completion comparison of CS24 Lemma 3.1.2 is used (CS24 line 1213). With the deletion, an implementer of §7.1 is not blocked behind ArcTopologyAndDescent.

## Verified sound

**Gate and dependency check.** I ran both on this head.
- Gate: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0. The worker's gate also reports `build=0`.
- Required dependency check, complete output: `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder lists 0 paths.

**Elaboration and signatures.**
- `lake env lean` on `Suggested.lean` exits 0 in 15 s. The only warnings are six "declaration uses `sorry`" (lines 65, 88, 181, 225, 262, 280).
- I put `#check @name` for all 9 declarations in one scratch copy and elaborated it once. Each elaborated type agrees with `scratch/signatures.md` and with its README statement:
  - characteristic, dimension, equidimensionality and residue equation for §1.1;
  - field algebra, `IsUnit (Nat.card G)` and the coefficientwise residue action for §1.2;
  - `2 ≤ d`, `ℓ ≠ p`, the p-fibre étale field and the invariant degree for §1.4;
  - `0 < ringKrullDim A` and the regular base with `dim B + 1 = dim A` for §1.6;
  - the extension chosen before the ideal family, with a regular mixed-characteristic base, for §1.7;
  - `0 < d`, `IsUnit ℓ`, affine-basis torsion and `2 * d ≤ q` for §5.8.
- No section binder was lost, and nothing changed.

**Padding probe.** `infer_instance` and `simp` on `Subsingleton (F.H q)` (§5.8) both fail, as does `infer_instance` on the R02 statement. The five Layer 1 theorems are existentials over algebra structures, presentations and extensions whose witnesses are the substance of Gabber's theorems. No declaration restates a definition, mirrors a Check or computes a value.

**Headline inventory** (README Summary and layers):
- Stated (6): Cohen–Gabber in equal characteristic, equivariantly and in mixed characteristic prime to ℓ; partial algebraization in both settings; Gabber's strict-local cd bound.
- Statable and absent (1): local affine Lefschetz (R02).
- Not statable, each named in the docstring with its missing carrier: weak and prime-to-ℓ uniformization (alteration topologies, snc pairs); oriented descent (oriented topoi); Gabber finiteness (constructible étale category); general affine Lefschetz and dimension functions (étale immediate specializations); top classes, pinned dualizing complexes, biduality and local duality (support functor, twists, RHom, exceptional inverse image); perverse t-structures (stalk and support functors); local Lefschetz (étale cohomology with supports); algebraic tilting (perfectoid henselian pairs, matched opens).
- At the pins, Mathlib has no constructible étale sheaves and Tau Ceti has no étale-site cohomology with supports. `TauCeti/Topology/Sheaves/SupportedCohomology.lean` is for sheaves on topological spaces.

**Library declarations opened at the pins.**
- Mathlib:
  - `Algebra.IsEtaleAt` (`Mathlib/RingTheory/Etale/Locus.lean:35`), formal étaleness of `Localization.AtPrime q`, as README line 60 says.
  - `CategoryTheory.Sheaf.H` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:57`), Ext from the constant sheaf `ULift ℤ`; at universe 0 it elaborates as `Sheaf.H.{0,0,0,1}`.
  - `CategoryTheory.constantSheaf` (`Mathlib/CategoryTheory/Sites/ConstantSheaf.lean:64`).
  - `HenselianLocalRing` (`Mathlib/RingTheory/Henselian.lean:95`, extends `IsLocalRing`).
  - `AlgebraicGeometry.Scheme.smallEtaleTopology` (`Mathlib/AlgebraicGeometry/Sites/Etale.lean:50`).
  - `Module.IsTorsionFree` (`Mathlib/Algebra/Module/Torsion/Free.lean:48`), scalar multiplication by regular elements is injective.
- Tau Ceti:
  - `TauCeti.Excellence.IsGRing` (`TauCeti/RingTheory/RegularLocalRing/GRing.lean:57`).
  - `TauCeti.Excellence.RegularAlgebraMap` (`…/RegularAlgebraMap.lean:54`), flat with geometrically regular fibres.
  - `TauCeti.Excellence.IsUniversallyCatenary` (`TauCeti/RingTheory/UniversallyCatenary.lean:56`).
  - `TauCeti.RingTheory.StrictHenselization.*` (pointed étale colimit).
- Mathlib and Tau Ceti contain no Cohen structure theorem, coefficient field, dimension function or quasi-excellence predicate beyond these, so the Layer 1 and Layer 5 targets duplicate nothing at the pins.

**Sources: seeded sample (15 targets), read at the locators.** ILO14 is arXiv v1; its file page equals the printed page + 6.

| Target | Text read | Outcome |
| --- | --- | --- |
| §0.3 | ILO14 lines 1394–1399 (II 3.1.1, p. 28), 1414–1421 (3.2.1, p. 29), 1499–1505 (3.2.3, p. 30) | X irreducible quasi-excellent; forms (1) and (2) and the ℓ = 1 Zariski clause as stated. |
| §0.5 | ILO14 lines 1887–1894 (III Déf. 4.2, p. 39), 1958–1970 (5.1, 5.2, p. 41), 2029–2036 (5.4, p. 42) | A excellent henselian; (i)–(iii) as stated. "iff" in (ii) follows from the symmetry of a-closeness. |
| §0.6 | ILO14 lines 1614–1634 (II 4.3.1–4.3.3, p. 33) | Agrees. The source's bounded-dimension clause says "excellent". The README's quasi-excellent version is the one VII 2.1 records (ILO14 lines 3588–3590). |
| §1.4 | ILO14 lines 2677–2681 (IV 4.2.2, p. 58), 2729–2740 (4.3.1, p. 59) | Hypotheses and (i)–(iii) agree with the README and with `MixedCohenGabberPresentation`. |
| §1.6 | ILO14 lines 2884–2892 (V 2.1.1–2.1.2, p. 64), 2900–2946 (proof, pp. 64–66), 2981–2982 (3.1.4) | The proof's base is B = k⟦t₁,…,t_{d−1}⟧ (line 2944), regular of dimension d − 1, which supports the Lean regular-base form. |
| §1.7 (Lean headline) | ILO14 lines 2957–2980 (V 3.1.1, 3.1.3, p. 66), 2996–3035 (proof) | The base is V^H⟦t₁,…,t_{d−2}⟧ (lines 3019, 3035) with ideals descended, which supports the Lean form. |
| §2.2 | ILO14 lines 3577–3582 (VII 1.1, p. 81), §§2–4 to p. 83 (line 3657) | Agrees. |
| §3.3 | ILO-final-XII lines 218–277 (XIIA 2.1.1–2.2.2, pp. 241–243) | Five generator types agree after the stated X/Y reversal. Source (iv) has Y factoring through proper S′ and (v) has X factoring through étale S′ (lines 249–251); README (iv)/(v) are those with the labels swapped. |
| §5.6 | ILO14 lines 10333–10336 (XV 1.1.2, p. 219) | X quasi-excellent with δ_X, f affine of finite type, F constructible: agrees. |
| §5.7 | ILO14 lines 10350, 10362 (XV 1.2.2, 1.2.4, pp. 219–220), 396–401 (Exposé 0, Cor. 8, p. 5) | Agrees. |
| §6.2 | ILO14 lines 12581–12600 (XVII Déf. 2.1.2, p. 263) | Agrees, including the pinning target in D⁺(x_ét, Λ). |
| §6.5 | ILO14 lines 13886–13895 (XVII §5.2, p. 287); G04 lines 26–31 (§1, p. 1), 72–80 (§2, p. 2), 139 (§5, p. 4), 465 (Thm 8.2, p. 11) | Monotonicity (p(y) ≥ p(x) for y in the closure of x) and both conditions agree. |
| §6.11 | CS24 lines 1367–1380 (proof of Lemma 3.2.3, p. 33); ILO14 lines 12220–12235 (XVII 0.9, p. 257), 12835–12837 (2.4.4.1, p. 267) | Agrees. 0.9's regular-morphism bullet has a misprint (Source issues). |
| §7.2 | CS24 lines 1361–1364 (3.2.3.1), 1207–1215 (Lemma 3.1.2, p. 30) | The supported completion clause is as used. |
| §8.4 | CS24 lines 774–777 (Lemma 2.2.4, pp. 19–20), 863–872 | The source needs no rank bound. The README's rank ≤ 1 is harmless. |
| §8.5 | CS24 lines 827–835 (Thm 2.2.7, p. 21), 800–807 (Thm 2.2.5, p. 20) | Hypotheses agree with §8.1. |
| §5.8 (Lean headline) | ILO14 lines 16193–16199 (XVIII-A 1.1, p. 331) | cd_ℓ is over ℓ-torsion (ℓ-primary) sheaves, matching `htors`. |
| §§1.1–1.2 (Lean headlines) | ILO14 lines 2276–2280 (IV 2.1.1, p. 50), 2419–2422 (2.2.2) | Torsion-free and residue isomorphism in 2.1.1. 2.2.2 sits in "§2.2, char > 0". The README's char-0 case follows from Hensel lifting of κ over κ^G, unique and hence G-stable, and from automatic separability. |

**Cross-roadmap citations resolved this round** (heading found at the cited number):
- Main:
  - SchemeAndStackFoundations §§0.7, 0.12–0.16, 0.20–0.22, 2.9–2.12, 2.15–2.16, 4.16–4.20.
  - EtaleCohomologyFoundations §§F.0.1–F.0.4, 0.7, F.1, F.2.1–F.2.4, F.3, 0.8–0.10, F.5, F.6, F.8. The six named targets are there: `VanishingCycles.etaleTateTwists` (:233), `ClassicalAlgebraic.supportLocalization` (:441), `ClassicalAlgebraic.lciCycleClass` (:1135), `ClassicalAlgebraic.smoothBoundaryPurity` (:1147), `VanishingCycles.etaleExceptionalInverseImage` (:1181), `VanishingCycles.smoothPurity` (:1202). These settle the six leads in `scratch/citations.md`.
  - AdicEtaleGeometry §§A1.14–A1.15; EnhancedDerivedSheaves §§0.1–0.4, E2, E2.6, E2.8; PerfectoidSpaces §P1.24.
- Open heads:
  - LefschetzPencilsAndVanishingCycles (#873, 072e6cd) §§0.2–0.5, 0.10, 6.2.
  - EtaleDualityAndPerverseSheaves (#1040, 23180d4) §§0.1, 0.2, 1.1, 2.1, 2.2, 2.4, 2.11.
  - ClassicalAdicEtaleCohomology (#875, fc1c03a) §5.4.
  - PerfectoidQuotients (#1042, 6fb01ee) §§0.4–0.6.
  - DeformationAndDerivedPatchingAlgebra (#1034, 1548fe7) §1.10.
  - AlgebraicModuliForArithmeticGeometry (#853, 4f0ad34) §§6.0–6.1.
  - AdicCoefficientsAndComparisonsPartII (#1796, d6d93fd) §§PA.0.2–PA.0.8, PA.0.11, PA.1.2–PA.1.4, PA.4.1–PA.4.8, PA.5.1–PA.5.4.
  - ArcTopologyAndDescent (#1755, dfd2dd1) §§1.3, 3.6, 8.6–8.9, 11.1–11.2, 11.5, 12.6.
- Board package: PerfectoidQuotientsPartII (`ORDER.txt` line 216, earlier than this roadmap at 384) §§Q5.1–Q5.3, Q6.2–Q6.7. Q6.2's hypothesis "ϖ♭ | ξ₀" is as README line 138 states. This settles the `citations.md` lead "found nowhere".
- `scratch/overlaps.md`: no dropped ids and no other pull request changing this roadmap; confirmed.

**Declared gaps.** The five slugs appear in `design/plan.json` with the same supplier and section as the README contracts: `ILLUSIE-2003` (LefschetzPencilsAndVanishingCycles 6.2), `equicharacteristic-cohen-coefficients` (DeformationAndDerivedPatchingAlgebra 1.10), `generic-constructibility-noetherian` (EtaleCohomologyFoundations F.3), `henselian-quasi-excellent-catenary` (SchemeAndStackFoundations 0.21), `elkik-finite-algebra-completion` (SchemeAndStackFoundations 0.14). Each `needs` is one statement with its hypotheses. Each is minimal:
- LefschetzPencilsAndVanishingCycles §6.2 states the trait perverse t-structure and nearby-cycle exactness, but not the affine support bound.
- SchemeAndStackFoundations §0.14 states only smooth lifting, on main and at #1656 and #1276.
- §0.21 has no henselization permanence.
- §F.3 is proper or field- and trait-based.

No supplier is `none`.

**Ownership against open work.** `roadmaps grep --readme-only` over main and the 466 open heads, by object:
- No other owner: "Cohen–Gabber", "partially algebraizable/partial algebraization", "potential/putative dualizing".
- Different objects:
  - "local uniformization": ArcTopologyAndDescent's characteristic-zero valuation presentation; Zavyalov's rigid-analytic theorem in ClassicalAdicEtaleCohomologyPartII.
  - "affine Lefschetz": RiemannianGeometry (differential-geometric).
  - "local Lefschetz": LocalPurity §1.4 on main, SGA 2 Lefschetz for finite étale covers.
  - "Theorem 2.2.7": Brinon–Conrad in PadicPeriodRings; the formal-glueing input in ArcTopologyAndDescent §8.6.
  - "perversity function": EtaleDualityAndPerverseSheaves §2.11, deferred in this Scope.
- The one second owner is PurityForFlatCohomology (R01).
- The h-topology of §0.8 (all schemes, proper surjective plus Zariski) differs from ArcTopologyAndDescent §1.3 (finitely presented schemes over a qcqs base), as the Scope states.

**Adversarial table.** Λ = ℤ/n with n invertible; grading is cohomological.

| Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| `cohenGabber_equalCharacteristic` (§1.1) | d = 0; k⟦x,y⟧/(y²−x³) at p = 2, 3; 𝔽_p(s)⟦x⟧ | **d = 0:** A = k, the power-series ring is k, the map is the inverse residue, degree 1, étale. **p = 2, t ↦ y:** rank 3, ∂/∂x(x³ − y²) = x² ≠ 0, separable. **p = 3, t ↦ x:** rank 2, ∂/∂y = 2y ≠ 0. **𝔽_p(s)⟦x⟧:** over k⟦x^p⟧ the generic fibre is purely inseparable, so the étale clause fails; over k⟦x⟧ degree 1. | Holds; the wrong parametrization is rejected. |
| `cohenGabber_equivariant` (§1.2) | μ₂ on k⟦x⟧, char ≠ 2; x ↦ x/(1+x) in char 2; k⟦x,y,z⟧/(xy,xz); char 0 | **μ₂:** t = x², rank 2, discriminant 4t ≠ 0. **Char 2:** σ²(x) = x/(1+2x) = x but 2 = 0 in κ, so `IsUnit (Nat.card G)` fails. **Mixed dimensions 2 and 1:** injective through the plane, line killed generically. **Char 0:** Hensel lift of κ/κ^G unique, hence G-stable. | Holds; no torsion-free claim, correctly. |
| `MixedCohenGabberPresentation` (§1.4) | ℤ_p⟦x⟧ identity model; t ↦ x^p; V = W[π]/(π^ℓ − p) with μ_ℓ | **Identity:** minimal primes of (p) = {(p)}, étale there, invariant degree 1. **t ↦ x^p:** p·x^{p−1} ∈ (p), not étale at (p): rejected. **μ_ℓ:** [Frac B : Frac A] = ℓ, B^H = A, invariant degree 1: accepted. | Discriminates; matches IV 4.3.1. |
| `PartialAlgebraization` (§1.5) | A a field; k⟦x₁..x_d⟧ with (x_i); B = A | **Field:** ringKrullDim B < 0 is impossible, so the type is empty. **Power series:** B = k⟦x₁..x_{d−1}⟧, C = B[x_d]. **B = A:** violates `lowerDimension`. | Discriminates. |
| `partialAlgebraization_equalCharacteristic` (§1.6) | k⟦x⟧, (x); k⟦x,y⟧/(xy), (x),(y); dim 0 | **k⟦x⟧:** B = k, C = k[x], 0 + 1 = 1. **Node:** B = k, C = k[x,y]/(xy). **Dim 0:** a reduced ring is a field and no presentation exists; excluded by `0 < dim`. | Holds. |
| `partialAlgebraization_mixedCharacteristic` (§1.7) | ℤ_p⟦x⟧, (x − p); p = 3, ℓ = 2 ramified; quadratic E | **ℤ_p⟦x⟧:** E = id, B = ℤ_p (char 0, residue p, regular, 1 + 1 = 2), C = ℤ_p[x], 𝔫 = (p, x). **Ramified:** B^H = W⟦x⟧, base W. **Quadratic E:** gcd(2,2) = 2 rejected, gcd(2,3) = 1 accepted. | Holds. |
| `cohomologicalDimension_le_of_strictlyLocal` (§5.8) | d = 1, 2; U = X, ∅; d = 0; unbounded ℓ-power group | **d = 1:** H¹(η, ℤ/ℓ) = ℤ/ℓ(−1) at q = 1 = 2d − 1; 0 for q ≥ 2. **d = 2:** H³(punctured) = H⁴_𝔪 = ℤ/ℓ(−2) ≠ 0 at q = 3; 0 for q ≥ 4. **U = X:** 0 for q ≥ 1. **d = 0:** H⁰ ≠ 0 at q = 0 = 2d, excluded by `0 < d`. **Unbounded group:** admitted by the affine test. | Sharp; hypotheses needed. |
| §5.7 / R02 statement | d = 0; strict trait, U = η; W(k̄)⟦x⟧[1/p] | **d = 0:** U ∈ {∅, X}, so H^q = 0 for q > 0. **Trait:** H¹ = ℤ/n(−1) ≠ 0 at q = d = 1; 0 for q ≥ 2. **d = 2:** 0 for q > 2. | Sharp; statable (R02). |
| §0.3 | Zariski cover; finite flat of degree prime to ℓ over integral henselian X | **Zariski:** Y = X. **Finite flat:** form (2) with Y = V = X. | Agrees with II 3.2.1/3.2.3. |
| §0.5 | Spec k⟦t⟧ vs Spec k, a = 1 | gr¹₁ is (t)/(t²) ≅ k vs 0. | Not 1-isomorphic, as stated. |
| §0.6 | X = ∅; xy = 0 with its node; Spec(k × k) | **X = ∅:** the empty family. **Node:** normalization, two members, one reduced point each. **k × k:** at least two members. | Correct. |
| §2.2 | cone xy = z², all characteristics | Charts y = xz₁², x = yz₂² are regular; the exceptional conic is smooth. | Correct. |
| §3.3 | blow-up of type (iv); D(t), D(t−1); Spec K → Spec k ← Spec K | **Type (iv):** (S′ → S′ ← S ×_S S′ = S′). **D(t), D(t−1):** (t, t − 1) = (1). **K ⊗_k K:** non-noetherian chain. | Correct. |
| §5.6 | Spec k̄; strict regular surface, U = X − V(f) | **Spec k̄:** Artin vanishing for q > dim supp F. **Surface:** H²(U) = H¹(k⟦y⟧, Λ(−1)) = 0, and 0 for q > 2. | Correct. |
| §6.2 | Spec k with δ ≡ 0, 1; strict trait with Λ(1)[2] and with Λ; ℤ/5 | **Spec k:** Λ, and Λ(1)[2]. **Trait:** RΓ_s(Λ(1)[2]) = Λ in degree 0; RΓ_η(Λ) is Λ in degree 0, not Λ(1)[2], so Λ is not putative. **ℤ/5:** 1 pinned automorphism vs 4 in D. | Correct. |
| §6.5 | strict trait, p = −2δ: Λ(1)[2] and Λ | **Λ(1)[2]:** restrictions in degree −2 ≤ −2 and ≤ 0; RΓ_η in degree −2 ≥ −2; RΓ_s = Λ in degree 0 ≥ 0, so it is in the heart. **Λ:** Λ\|η in degree 0 > −2, so not in D^{≤p}. | Correct; direction agrees with G04 line 29. |
| §6.11 | d = 0, 1, 2 | **d = 0:** Λ. **d = 1:** Λ(1)[2] with RΓ_s = Λ. **d = 2:** Λ(2)[4] with RΓ_x = Λ(−2)[−4](2)[4] = Λ in degree 0. | Correct (δ = d − codim). |
| §6.12 | strict trait, F = Λ, K = Λ(1)[2] | **i = 0, 1:** H⁰_x = H¹_x = 0 = Hom(H⁰ or H⁻¹ of K, Λ). **i = 2:** H²_x = Λ(−1) = Hom(Λ(1), Λ). | Correct. |
| §7.2 | d = 1, f = π; f = 0 | **d = 1:** H⁰_𝔪(j_!Λ) ⊆ H⁰_𝔪(Λ) = 0; the dual side is H²(η, Λ(1)) = 0. **f = 0:** the zero sheaf. | Correct. |
| §7.3 vs PurityForFlatCohomology §1.5 (R01) | DVR, f = π; k⟦x,y⟧, f = x; f = 0 | **DVR:** degree 0 is 0 ↪ ℤ/ℓ on both sides. **k⟦x,y⟧:** degree 2 is 0 → ℤ/ℓ(−1) on both sides. **f = 0:** the identity on both sides. | Same statement, two owners (R01). |
| §7.1 (R03) | d = 1, f = π; f = 0 | **d = 1:** H^i(η) = 0 for i > 1, from §5.7 alone. **f = 0:** empty open. | Completion unused (R03). |
| §8.4 | one rank-one factor; two factors, generic open; ϖ = 0 in char p | **One factor:** G in degree 0. **Two factors:** G², higher terms 0. **ϖ = 0:** generic open empty; whole spectrum G. | Correct. |
| §8.5 | A = 𝔽_p, ϖ = 0; A perfect and complete | **𝔽_p:** H⁰ = H¹ = ℤ/ℓ and H^{≥2} = 0 on both sides, including ℓ = p. **Perfect complete A:** the identity. | Correct. |
| §6.10 Check (G04 issue) | Λ = ℤ/6, tensoring with 𝔽₂ ⊕ 𝔽₃[1] on a strict trait | n₂ = −2, 0; n₃ = −3, −1; ⌊−n/2⌋ = 1, 0 for both. | Correct; refutes G04's single-shift sentence. |
| §5.1 | 𝔸¹_R at the closed point (πt − 1) | Closure dimensions 0 vs 2 across a height-1 step; −dim O gives −1, 0. | Correct. |
| §5.4 | 𝔸¹_k → Spec k | Rule (1) gives 1, 0; rule (2) gives 0, −1. | Correct. |

## Not verifiable

- **Ill03** (Théorème 2.4) and **Epp73** (Theorem 1.9) are settled as uncertified. They are cited through ILO14 XV 1.1.3 and IV 3.1.2 and K10, and I did not read them.
- I did not compare the published Astérisque pages with the README's ILO14 locators. The README states that it uses arXiv v1 printed pages, and I checked those.

## Source issues

- **Misprint** in ILO14 at Exposé XVII, Théorème 0.9 (arXiv v1), p. 257: the source says that for a flat morphism with geometrically regular fibres, f^!K is dualizing (text layer at ILO14 line 12233); it should be f^*K, as in XVII Proposition 4.1.1, p. 280 (line 13520); affects nothing.
- **Gap** in G04 at §8, p. 10: the source says the local cohomology of a dualizing complex over ℤ/n at each geometric point is ℤ/n with a single shift; it should say this holds for each prime-power factor separately, since 𝔽₂ ⊕ 𝔽₃[1] twists give different shifts for n = 6; affects nothing.
