# Review of CategoricalOperatorAlgebras (pull request #888 at 0dceabc)

**Verdict:** needs changes

This is a full review: the folder changed by 191 lines since `3375f9e`, the head of the previous review. Nothing outside the folder changed.

- The previous review's R02 is repaired. Its R01, about who owns the CA1a/CA2a objects, is not, and is carried here as R01 (P2).
- R02 and R03 are new (P3). Mathlib and Tau Ceti already provide carriers that CA2b, CA3, CA4 and CA6 use without naming them: native module categories, modules and bimodules over monoid objects, and the twist and ribbon structure of a braided pivotal category.
- R04 is new (P3): two citations use informal roadmap names.
- **Checks passed:**
  - The gate passes, and the dependency check prints 0 problems.
  - `Suggested.lean` elaborates with no diagnostic.
  - All 15 sampled locators match their sources.
  - The adversarial pass, including the new Checks of CA6 and CA10, found no false statement.

## R01 (P2) — CA1a/CA2a still have three open "single home" claims: this folder and both QuantumGroups revisions

Carried from the previous review's R01. No repair report marks it settled, so this is not a re-raise.

**Location.** `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` lines 40–46: "C*-categories, their finite additive and Karoubi completion … (CA1a), and C*-tensor categories … unitary dual functors and signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". Downstream consumers, lines 2423–2429, repeats it.

**Claim.** This roadmap is the only owner of the CA1a/CA2a objects, and QuantumGroups consumes them.

**Witness.** Both open QuantumGroups revisions still claim the same objects:

- **#1705 at `96014ab`** (unchanged):
  - lines 33–42: "Section 0.2 is the single home of C*-categories … the balanced unitary dual functor and signed self-dualities … CategoricalOperatorAlgebras CA1a–CA2a … consume these objects";
  - line 307 states the sign-invariance target again;
  - lines 1796–1799 list this roadmap as a consumer.
- **#1649, now at `50d79b7`** (it was `b3b2d26` at the previous review):
  - README lines 29–43: "Layer 0 … is the single home of the following objects. Section 0.1 owns C*-categories … signed self-dualities … CategoricalOperatorAlgebras CA1a–CA2a … consume these objects";
  - line 219 states the sign-invariance target again;
  - lines 1709–1711 list this roadmap as a consumer.

On main (`3090489`), QuantumGroups line 42 still cites "CategoricalOperatorAlgebras CA1a,CA2a" as a supplier, and line 106 says these categories "belong to CategoricalOperatorAlgebras". TemperleyLiebOperatorAlgebras #867 consumes CA1a/CA2a (lines 320–325).

The description's merge-order paragraph names only AlgebraicKTheory and OperatorKTheory, so nothing orders this pull request against either revision.

**Repair.** Choose one owner and state the order in the pull request description. The README names no pull request either way.

- **This roadmap first.** This is the order that main and #867 assume.
  - Keep the README as it is.
  - Name both QuantumGroups revisions in the description as later.
  - Each revision then cites CA1a/CA2a, and `ε=ν₂(x)` from CA2a, instead of its single-home sentence and sign target:
    - #1705: lines 33–42, 307 and 1796–1799;
    - #1649: lines 29–43, 219 and 1709–1711.
- **A QuantumGroups revision first.**
  - The two revisions must first agree with each other: #1649 puts these objects in §0.1 and #1705 in §0.2.
  - After that revision merges, edit this README:
    - in lines 40–46, cite that section for the overlapping objects;
    - delete the bullet at lines 2423–2429;
    - keep here what QuantumGroups does not build: W*-categories, the grading groupoid for a nonsimple unit, Penneys's Theorem A, and the comparison `ε=ν₂(x)` with `TauCeti.frobeniusSchurIndicator`.
- **The description's other stale text.** While editing the description, also fix:
  - the Validation paragraph, which reports "5 admitted-target warnings" and a Suggested.lean "byte-exact to the previously validated public prototype". At this head `Suggested.lean` changed and declares nothing, and elaboration prints no warning;
  - the dependency list, which cites pull-request numbers such as "#889" and "#57" for roadmaps that are now on main.

**Tested.** Under the first option, ε has one definition (README line 503) and one comparison with `ν₂` (lines 508–514). The texts agree on the sign:

- #1705 (line 309) and #1649 (README line 245) both give ε=−1 for the SU(2) fundamental object.
- For the 2-dimensional representation of Q₈ ⊂ SU(2), `ν₂=(1/8)Σχ(g²)=(2·2+6·(−2))/8=−1`, the same as CA2a's ε.

The dependency check prints 0 problems at this head.

## R02 (P3) — Mathlib's module-category and bimodule carriers are not named; CA2b, CA3 and CA4 plan them again

**Location.**
- "From Mathlib" (lines 107–119) names no module-category or module-object API.
- CA2b, lines 696–699: "Construct pivotal right module C*-categories over a unitary multitensor category: dagger action functors with unitary module associators/unitors … Develop module functors".
- CA4, lines 888–890: "Construct monoid/algebra objects, left module categories and free modules c⊗A. Reuse CA2's right-module API through the tensor-reversing opposite, with explicit action/associator comparisons."
- CA3, lines 779–796: P–Q bimodules with actions `λ`, `ρ`, composed by a projection range shown to be "the balanced coequalizer".

**Claim.** Module categories, module functors, the passage between left and right actions, free modules and the one-object bimodule bicategory are all constructed here, with no native carrier named.

**Witness.** At Mathlib `1b1ccf4`:

| Declaration | File and line |
|---|---|
| `MonoidalLeftAction` | `Monoidal/Action/Basic.lean:120` |
| `MonoidalRightAction` | `Monoidal/Action/Basic.lean:434` |
| `selfRightAction` | `Monoidal/Action/Basic.lean:485` |
| `MonoidalLeftAction.monoidalOppositeLeftAction` | `Monoidal/Action/Opposites.lean:70` |
| `Functor.LeftLinear`, `Functor.RightLinear` | `Monoidal/Action/LinearFunctor.lean:156`, `:318` |
| `ModObj`, `Mod` | `Monoidal/Mod.lean:62`, `:230` |
| `Bimod` | `Monoidal/Bimod.lean:79` |
| `Bimod.tensorBimod` | `Monoidal/Bimod.lean:342` |
| `Bimod.monBicategory` | `Monoidal/Bimod.lean:979` |

At Tau Ceti `2fd255d`: `TauCeti.freeMod` and `TauCeti.freeModAdjunction` (`Monoidal/Mod/Free.lean:49`, `:134`).

**Repair.**
1. Add these declarations to "From Mathlib" and "From Tau Ceti".
2. **CA2b.** A pivotal right module C*-category is a `MonoidalRightAction` carrying the added dagger, unitarity and trace data. Module functors are `Functor.RightLinear` with unitary lineators. The regular module is `selfRightAction`.
3. **CA4.**
   - Take left module categories to be `MonoidalLeftAction`.
   - Replace "Reuse CA2's right-module API through the tensor-reversing opposite, with explicit action/associator comparisons" with a citation of Mathlib's `Action/Opposites.lean` constructions.
   - Cite `TauCeti.freeMod` and `TauCeti.freeModAdjunction`, through the monoidal opposite, for the free right modules `c⊗A` of Jones–Penneys Theorem 3.8.
4. **CA3.**
   - In the one-object case, make a P–Q bimodule a Mathlib `Bimod P Q` that satisfies the Frobenius and separability equations.
   - When C has coequalizers, prove that the range of `p` is `Bimod.tensorBimod`'s coequalizer, so that QSys(C) is a sub-bicategory of `Bimod.monBicategory`. A unitary multitensor category has coequalizers, and in a rigid category tensoring is a left adjoint.

**Tested on** CA3's own Check: `Q=M_n(ℂ)` in `Hilb_fd`, with X the row vectors and Y the column vectors.
- `TensorBimod.X` is the coequalizer of `X⊗Q⊗Y ⇉ X⊗Y`, which is `ℂⁿ⊗_(M_n)ℂⁿ≅ℂ` via `x⊗y↦xy`.
- So it has dimension 1, as the README's projection range does.

## R03 (P3) — CA6's "ambient pivotal twist" and "ribbon V" name no carrier; the pinned Tau Ceti twist and ribbon API is not in the contract

**Location.**
- CA6, lines 1055–1056: "Require identity, substitution, anchor-braiding and twist laws, with the ambient pivotal twist".
- Line 1066: "For ribbon V define sphericality".
- Line 1127: "When V is ribbon, prove spherical objects correspond exactly to spherical chosen states".
- "From Tau Ceti" (lines 120–210) and CA6's *Needs:* (lines 1173–1176) name none of the declarations below.

**Claim.** The twist that enters the anchored-tangle laws, and the ribbon condition, are left undefined. In particular, the README does not say which pivotal structure the twist is built from.

**Witness.** Tau Ceti `2fd255d` already has all of these:

| Declaration | File and line |
|---|---|
| `TauCeti.BalancedCategory` | `Monoidal/Braided/Balanced.lean:53` |
| `TauCeti.balancedOfBraidedPivotal`, with twist `θ_X=φ_X≫u_X⁻¹` (HPT eq. (3)) | `Monoidal/Pivotal/Balanced.lean:60` |
| `TauCeti.RibbonCategory` | `Monoidal/Braided/Ribbon.lean:37` |
| `TauCeti.pivotalBalancedEquiv` | `Monoidal/Pivotal/OfBalanced.lean:114` |
| `TauCeti.sphericalCategory_of_ribbonCategory` | `Monoidal/Pivotal/Ribbon.lean:95` |

**Repair.**
1. Add these modules and declarations to "From Tau Ceti".
2. In CA6:
   - Define the ambient twist as that of `TauCeti.balancedOfBraidedPivotal V`, taken for the pivotal structure that V's chosen unitary dual functor induces (CA2a).
   - Read "ribbon V" as `TauCeti.RibbonCategory` for that balanced structure.
   - Add the target that this twist is unitary.
   - Add the sVec computation below as a Check.
3. Add the declarations to CA6's *Needs:* and Dependencies.

**Tested on** sVec, the unitary symmetric fusion category `Hilb(ℤ/2)` with braiding −1 on the odd generator f:
- **Canonical symmetric pivotal structure.** It gives `dim f=−1`, and `TauCeti.balancedOfBraidedPivotal_twist_eq_refl` gives twist `id`.
- **Structure of the unitary dual functor.** It gives `dim f=+1`. It differs from the canonical one by `χ(f)=−1`, so its twist is `θ_f=−1`.

So the twist laws depend on which pivotal structure is meant, and the repair fixes it.

## R04 (P3) — Two citations use informal roadmap names

**Location.**
- Line 1238: "General Cuntz generators retain Dynamics D6/OperatorKTheory K7 ownership."
- Line 1645: "Use VNA V4.Normality's normal representation amplification".

**Claim.** "Dynamics" and "VNA" are not roadmap names, and the README does not define either abbreviation.

**Witness.**
- The README itself writes "OperatorAlgebraDynamics D6" at lines 56 and 1321.
- `TauCetiRoadmap/VonNeumannAlgebras/README.md` on main has the target "V4.Normality" (line 1124).

**Repair.**
- Line 1238: write `OperatorAlgebraDynamics D6`.
- Line 1645: write `VonNeumannAlgebras V4.Normality`.

**Tested.** Both targets exist under those names on main:
- OperatorAlgebraDynamics line 590: "D6 owns the universal unital C*-algebra O_n";
- VonNeumannAlgebras line 1124: "V4.Normality — consequences of the positive criterion".

## Previous findings

- **R01 (single home of CA1a/CA2a): not repaired.**
  - Lines 40–46 are unchanged and still say "(CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a".
  - #1705 keeps its claim at `96014ab`.
  - #1649 moved to `50d79b7` and keeps its claim at README lines 29–43.
  - Carried as R01.
- **R02 (pinned centre API): repaired.**
  - **"From Tau Ceti".** Lines 186–210 now name `CategoryTheory.Center.instFiniteDimensionalHom`, `…instAbelian`, `CategoryTheory.HalfBraiding.rightDual`, `CategoryTheory.Center.rigidCategory`, `…pivotalCategory`, `…leftDim_f`, `…sphericalCategory` and `…instSimpleUnit`, with their hypotheses.
  - **CA6.** Lines 1097–1099 say "At α=id this is the pinned construction, `CategoryTheory.HalfBraiding.rightDual` … and it is not built again". The new target (lines 1103–1113) is only the unitarity of the pinned dual half-braiding.
  - **CA10.** Lines 2249–2254 take the abelian structure, Hom-finiteness and simple unit from the pin. Lines 2259–2271 add the requested target: the pivotal structure induced by the unitary dual functor is the restriction of `CategoryTheory.Center.pivotalCategory`. *Needs:* and Dependencies list the declarations.
  - **Checked against the pin.** Every description matches its source:
    - `HalfBraiding.rightDual` is stated for left rigid C (`Rigid.lean:247–251`).
    - `rightDualβHom_rightDual` expresses the component at `Uᘁ` as the mate of `β_U`, between `rightDualTensorIso` (`Rigid.lean:183`).
    - `instSimpleUnit` assumes that `forget` preserves monomorphisms (`Simple.lean:54`).

## Verified sound

### Gate, dependency check, build and folder

- **Gate.** `gate … --base origin/main` at `0dceabc` printed `gate CategoricalOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited 0. The worker's run adds `build=0`.
- **Dependency check.** `gate --depcheck … --movable --content …` printed `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` exits 0 with no output. The file declares nothing, so neither the `#check @name` comparison nor the one-tactic padding probe has a declaration to run on.
- **Folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Text scan.** A grep for process words, pull-request numbers and LaTeX delimiters in the README finds nothing.

### Headline theorems and `Suggested.lean`

The Summary and the module docstring list the same ten headline groups: CA2a (Penneys Theorem A), CA2b (Theorem C), CA3, CA4, CA5, CA6, CA7 (Katsura 8.6 and the K-theory of free graph algebras), CA8, CA9 and CA10. Each headline is stated on a dagger, C*- or W*-category, or on an operator-algebra carrier.

I searched both pins (`grep -r` over the Mathlib and Tau Ceti sources) for each missing carrier:

| Carrier searched for | Hits |
|---|---|
| dagger category class | only `TauCeti/RingTheory/Dagger/DaggerAlgebra.lean`, the Monsky–Washnitzer dagger algebras |
| C*-category or W*-category | none |
| planar algebra | none |
| Cuntz–Pimsner or Toeplitz algebra | none |
| hyperfinite factor | none |
| `IsFactor` | none |
| operator K-theory | none |
| interior tensor product of `CStarModule` | none |
| stable rank | none |

So "none statable" holds, and no headline is forced through a stand-in. The docstring's new clause, that Tau Ceti has "the rigid, pivotal and abelian structures of the Drinfeld centre", matches the pin.

### Library declarations resolved at the pins (29)

A scratch file importing Mathlib and the 13 Tau Ceti modules involved elaborated with exit 0, with one `#check @name` per declaration below.

**Cited by the README:**

| Declaration | File and line |
|---|---|
| `CategoryTheory.HalfBraiding.rightDual` | `Center/Rigid.lean:251` |
| `CategoryTheory.HalfBraiding.rightDualβHom_rightDual` | `Center/Rigid.lean:183` |
| `CategoryTheory.Center.rigidCategory` | `Center/Rigid.lean:382` |
| `CategoryTheory.Center.pivotalCategory` | `Center/Pivotal.lean:113` |
| `CategoryTheory.Center.leftDim_f` | `Center/Pivotal.lean:183` |
| `CategoryTheory.Center.sphericalCategory` | `Center/Pivotal.lean:194` |
| `CategoryTheory.Center.instSimpleUnit` | `Center/Simple.lean:54` |
| `CategoryTheory.Center.instFiniteDimensionalHom` | `Center/Preadditive.lean:225` |
| `CategoryTheory.Center.instAbelian` | `Center/Abelian.lean:62` |
| `TauCeti.SplitK0.eq_frobeniusPerronChar` | `Semisimple/FrobeniusPerron.lean:133` |
| `TauCeti.PivotalCategory.eq_of_leftDim_eq_frobeniusPerronDim` | `Pivotal/PseudoUnitary/Basic.lean:167` |

`eq_of_leftDim_eq_frobeniusPerronDim` needs an abelian, Hom-finite, finite semisimple, simple-unit ℂ-linear rigid category with finitely many simple classes (variables at lines 60–62 and 150). For `Center C`, CA10 takes finite semisimplicity and finite simple classes from PivotalSpherical Layer 11, which on main (lines 626–700) owns exactly those.

**Named in R02 and R03:** the 18 declarations in their witness tables, plus `TauCeti.balancedOfBraidedPivotal_twist_eq_refl`.

### Cross-roadmap citations resolved

All suppliers are on main or earlier in the merge order. `ORDER.txt` positions: VonNeumannAlgebras 5, CStarAlgebras 7, HilbertModules 8, OperatorKTheory 9, Subfactors 208, this roadmap 229.

| Citation | Where found |
|---|---|
| PivotalSpherical Layer 8 (indicators) | main, lines 506–535 |
| PivotalSpherical Layer 10 (centre's canonical rigid/linear/abelian/pivotal structures) | main, lines 562–625 |
| PivotalSpherical Layer 11 (semisimplicity, Hom-finiteness, simple classes, simple unit, `dim Z(C)=(dim C)²`) | main, lines 626–700 |
| Subfactors 1.1–1.2, 2.1–2.5, 3.2–3.3, 5.1, 6.1–6.4, 7.1–7.2, 8.1–8.2, 9.1–9.2 | main, all headings present |
| FreeProbability F2–F4 | main, lines 184, 255, 353 |
| OperatorAlgebraDynamics D6 (`O_n`) | main, line 590 |
| HilbertModules H1–H3 | main, lines 126, 179, 262 |
| CStarAlgebras C1 | main, line 234 on |
| VonNeumannAlgebras V4.Normality | main, line 1124 |
| VonNeumannAlgebras V12 tracial ultrapower | main, line 3436 |
| VonNeumannAlgebras V13b | main, line 3740 |
| OperatorKTheory K2.3 (continuity, Morita invariance, full corners), K3, K7 | #866 at `1377338`, lines 599, 701, 1496 |

Consumers:
- QuantumGroups on main, lines 42 and 106;
- TemperleyLiebOperatorAlgebras #867 at `ba43cc7`, lines 320–325;
- CStarClassification is cited only as a deferral.

`overlaps.md` lists no other pull request changing this folder and no dropped or revision-only id; the citation resolver lists nothing missing.

### Duplication and ownership

`roadmaps grep` over main and every open pull request, for: single home of C*-categories, Q-system, unitary dual functor, anchored planar, Cuntz–Pimsner, bicommutant category, tube algebra, Ocneanu ultrapower and centrally free.

- **QuantumGroups #1705 and #1649** are the only other owners (R01).
- **#867** consumes CA1a/CA2a.
- **VonNeumannAlgebras** (main line 4043, #1041 line 4766): Rokhlin for single automorphisms of R. CA9's Tomatsu theorem is the tensor-category version.
- **VonNeumannAlgebras V12's ultrapower** (main lines 3436–3444) is tracial. CA9 builds the general Ocneanu ultrapower and relates it to V12.
- **RefinedTraceMethods** ("Q-system envelope", ∞-categorical), **HabiroNahmSeries** ("q-system") and **ArcTopologyAndDescent** ("tube algebras" of rings) name different objects.

The only duplications found are R01 (with an open roadmap) and R02–R03 (with the pins).

### Seeded sample (15 targets, seed `PRREVIEW-CategoricalOperatorAlgebras~20`, drawn from 95 locator-bearing claims)

| # | README line: claim | Source line, page | Agrees |
|---|---|---|---|
| 2 | 513: indicator as trace of `f↦φ_x⁻¹∘f∨` (NS Def. 3.1, p. 8) | `NgSchauenburg2007Pivotal` 360–378, p. 8 | yes: `T_VW(f)=j_V⁻¹∘f∨`, `ν_n=Tr(E_V^(n))` |
| 11 | 705: CHPS Theorem A body statement (§2.3, p. 10) | `CHPS2018` 420–427, p. 10 | yes; the README's normalisation `Tr_m(id_m)=1` is the source's (line 324) |
| 14 | 817: CHJP Theorem A and Lemma B (p. 3) | `CHJP2021` 122, 131–132, p. 3 | yes; the proof is §4 (contents line 25) |
| 18 | 903: JP *Operator* Theorem 4.18 (p. 35) | `JonesPenneys2017Operator` 1633–1634, p. 35 | yes: embedding into `B(H)`, `H∈Hilb(C)` |
| 19 | 905: JP *Operator* Theorem 4.28 (p. 39) | `JonesPenneys2017Operator` 1958–1962, p. 39 | yes: `θ=Ad(v)∘π` |
| 33 | 1225: Katsura Lemma B.2 and Prop. B.3 (p. 23) | `Katsura2004` 998–1025, p. 23 | yes: separable case by Brown's theorem, general case by separable sub-pairs and continuity; Prop. B.5 at 1032, p. 24 |
| 41 | 1303: HP I Notation 2.11 (p. 8), countable | `HartglassPenneys2014I` 297–298, p. 8 | yes |
| 42 | 1305: HP I Theorem 5.23 and Cor. 5.24 (p. 39) | `HartglassPenneys2014I` 1732–1746, p. 39 | yes; the source's standing setting is connected (1520) |
| 46 | 1409: HP II §6 (p. 25), GJS II₁ tower | `HartglassPenneys2014II` 1146–1147, p. 25; Cor. 6.8 at 1217, p. 27 | yes |
| 52 | 1467: HP II Cor. 4.17 (p. 15) | `HartglassPenneys2014II` 646, p. 15; Theorem B at 89, p. 3 | yes |
| 74 | 1935: MT2009 §4.2 (p. 33), modular endomorphisms | `MasudaTomatsu2008` 1481–1484, p. 33 | yes, for a factor of any type |
| 75 | 1938: MT2009 Lemma 4.7 (p. 32) | `MasudaTomatsu2008` 1422–1423, p. 32 | yes |
| 78 | 1949: MT2009 Theorem 4.6 (p. 31) | `MasudaTomatsu2008` 1401–1407, p. 31 | yes: infinite factor; composition, decomposition, sum, conjugation |
| 88 | 2074: HP2015 Theorems 5.10–5.13 (pp. 24–25) | `HenriquesPenneys2015` 1386, p. 24; 1455–1457, p. 25 | yes |
| 91 | 2310: HPT *Classification* Lemma 3.7 (p. 10) | `HPT2023Classification` 459–460, p. 10 | yes; its hypothesis, `Ψ^Z` fully faithful, holds for the identity lift |

### Adversarial table

Values were computed by hand. Those marked † were also computed by a short pure-Python script in the scratch directory: complex arithmetic, a permutation count, and quasi-basis evaluation.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| CA2a `ε=ν₂(x)` (sample 2) | `J(a,b)=(−b̄,ā)`, `J′(a,b)=(b̄,ā)` on ℂ²; Q₈ and S₃ 2-dim irreducibles; ℂ² (not simple) | `J²=−1`, `J′²=+1`†; Q₈ `ν₂=−1`†, S₃ `ν₂=+1`†; ℂ²: both signs occur while `tr(flip)=2`† | sound; simplicity is needed and stated |
| CA2a twisted pivotal structure | `Hilb(ℤ/2)` with `χ(g)=−1` | `ν₂(g)=−1`, `dim g=−1` against `+1` for the unitary dual functor | sound |
| CA2a Penneys Theorem A (headline) | `Hilb(ℤ/2)`; `End†(Hilb_fd⊕Hilb_fd)` at t=4 | `Hom(ℤ/2,ℝ>0)={1}`, `Hom(ℤ/2,ℂ×)={±1}`; equal weights give 1 vs 1/4, weights 1/5, 4/5 give `2/5=2/5` | sound |
| CA2a pseudounitary ↔ `IsPseudoUnitary` | fusion C over ℂ | positive real `leftDimChar` → `eq_frobeniusPerronChar` → FP dims → `of_leftDim_eq_frobeniusPerronDim`, `eq_of_leftDim_eq_frobeniusPerronDim` | sound, both at the pin |
| CA2b Penneys Theorem C (headline) | `u₁—w—u₂`; TL Gram matrix | `P_(0,+)=ℂ²`, `P_(0,−)=ℂ`; `det=δ²(δ²−1)`: 2 at δ=√2, 12 at δ=2† | sound |
| CA2b CHPS Theorem A (sample 11) | P as a module over itself; rescaled trace | basepoint `1₊`, `Tr(id)=1`; doubling Tr gives 2, excluded by the normalisation | sound |
| CA3 normalisations (headline) | `Q=M₂(ℂ)`, `⟨x,y⟩=½Tr(x*y)` | `i†i=1`, `mm†=4=n²`†; `m′=m/2` gives `m′m′†=1`, `i′†i′=4`; a `d_Q⁻¹` rescale gives `1/4`† | sound |
| CA3 completion and realization (sample 14) | `M_n=ℂⁿ⊗(ℂⁿ)‾`; rows ⊗ columns | `dim n·n=n²`; balanced range of dim 1 inside `n²` | sound |
| R02: CA3 range = `Bimod.tensorBimod` | `Q=M_n`, `Hilb_fd` | coequalizer `ℂⁿ⊗_(M_n)ℂⁿ≅ℂ`, dim 1, against the projection range, dim 1 | consistent; carrier unnamed (R02) |
| CA4 Theorems 4.18, 4.28 (samples 18–19) | `A=M₂(ℂ)`, θ = normalised trace | `K=M₂`, dim 4; density `½·1` has rank 2, so θ is not a vector state; transpose amplified by ℂ² has eigenvalue −1 | sound |
| CA4 JP *Q-systems* Theorem A (headline) | trivial object; `Q=H=a=1` | `d_Q=1`; `α†α=d_a(d_Q/d_H)f†g=f†g` | sound |
| CA5 JP *Realizations* Theorem A (headline) | `N⊆N⋊ℤ/2`; `N⊆N⋊ℤ` | `d_Q=2`; infinite index, connected, not compact | sound |
| CA6 HPT *Anchored* Theorem A (headline) | `Hilb(ℤ)` vs `Hilb(ℤ/2)` on `Hilb_fd`; `P[0]=ℂ²` with ψ the average; `x=ℂ^k` | support infinite vs 2 simples; `‖(1,0)‖²=1/2`, not 1; `dim P[n]=kⁿ`, not `k^(2n)` | sound |
| CA6 new: dual half-braiding in `Hilb(ℤ/3)` | `χ(h)=ω^h` | `|χ⁻¹(h)χ(h)−1|=0` for h=0,1,2†; `|χ⁻¹(h)|=1`†; reusing χ gives `χ(1)²=ω²=−0.5−0.866i`, `|ω²−1|=√3`† | sound; evaluation intertwines only with `χ⁻¹` |
| CA6 new: non-unitary centre object in `Hilb(ℤ)` | `(1,χ)`, `χ(h)=2^h` | `|χ(h)|=1/4,1/2,1,2,4` for h=−2…2†; isomorphisms are scalars, so the character is an invariant | sound: not in Z†(C), not isomorphic to it |
| CA6 new: unitarity of the pinned dual half-braiding | general unitary β, via `rightDualβHom_rightDual` | component at `Uᘁ` is `ν⁻¹(β_U)ᘁν`; `((β_U)ᘁ)†(β_U)ᘁ=(β_Uβ_U†)ᘁ=id`; transported along unitary `φ_V` to every V | sound; needs the unitary tensorator ν and `(f∨)†=(f†)∨`, both stated |
| R03: CA6 twist | sVec | unitary pivotal structure: `dim f=1`, `θ_f=−1`; canonical symmetric structure: `dim f=−1`, `θ=id` | convention left open (R03) |
| CA7 Katsura 8.6 (headline; sample 33) | `ℂⁿ` over ℂ; zero action; `ℓ²(I)`, I uncountable | `1−n` on ℤ: `K₀=ℤ/(n−1)`, `K₁=0`; at n=1 `K₀=K₁=ℤ`; zero action: `J_X=0`, and without `(kerφ)^⊥` the algebra `O_X` would be 0; uncountable I: `K₀=ℤ`, `K₁=0` | sound, no separability needed |
| CA7 weights, HP I 5.17–5.25 (headline; samples 41–42) | μ(v)=16, μ(w)=1; one loop; countable and uncountable stars; c=3 | `a=2`: 4 and 4†; `a=1/2`: 1/4 and 64†; `a_μ(v)=1<16`; loop `1≮1`, `A=∅`, `C([−2,2])`; star `a_μ(c)=∞`, leaves `2>1`; `τ_(3μ)(p_v)=48` | sound |
| CA8 HP II A–C, Cor. 4.17, §6 (headline; samples 46, 52) | TL(√2); `ℂ⊂ℂ²` with `E=(a+2b)/3` | `K₀=ℤ³`, `τ_*(p₁−p₀)=√2−1∈(0,1)`; quasi-basis returns `(5,7)` in both Watatani forms†, `Ind=(3,3/2)`; `N(δ²)=3,3,4,5` at 2, `(3+√5)/2`, 3, 4†; `[A_k:A_(k−1)]=δ²=2` | sound |
| CA9 canonical extension | II∞ amplification, n=2, t=1 | `ρ̌` phase `2^(−i)=0.769−0.639i`†, `ρ̃` phase 1†; a second negative phase gives `2^(−2i)` | sound |
| CA9 MT §4.2, 4.6, 4.7 (samples 74, 75, 78) | `R_λ`, λ=0.3; `id⊕id`; II∞ rank 2 | `λ^(it₀)=−1`†, `t₀∉T(R_λ)`; `d=2`, `Ind=4`, `E₁(e)=1/4`; non-minimal `Ind=25/4`, `E₁(e_E)=0.16`†; `τ∘φ=τ/2` on both sides of `[θρθ⁻¹]=[ρ]` | sound |
| CA9 HNP Theorem A, transpose (headline) | `F(c₁,c₂)=(0,c₁)`, `c=(ℂ²,ℂ)`, `d=(ℂ,ℂ³)` | `HS(c₁,d₂)` has dim 6, while `F^t=F` gives 1 | sound |
| CA9 HP2015 Theorems 5.10–5.13, 3.5 (headline; sample 88) | `ℓ²(ℕ)` in Hilb; `M_n⊗̄R_II₁` | `ℓ²⊗ℂᵏ≅ℓ²`; `Hilb_fd≠Hilb`; type I fails (`M_n⊗̄R_II₁≅R_II₁`) | sound |
| CA9 Tomatsu Theorem D, factor case (headline) | `Hilb(ℤ)` on `R_III₁`; `L(F₂)⊗̄B(ℓ²)` | `σ_(nt)` outer, modular, not centrally free; `b⁻ⁿhaⁿ` distinct, so the swap is outer while `M_ω=ℂ`; `uv≠c·vu` on M₂† | sound |
| CA10 tube algebra and HPT §4 (headline; sample 91) | `Hilb_fd`, `Hilb(ℤ/2)`, `Hilb(ℤ/3)`, `Hilb(S₃)` | tube dims 1, 4, 9†, 36† (by enumeration); `D(S₃)` dims `1,1,2,3,3,2,2,2`, sum of squares 36†; `r=±id` conjugate by `i·id` | sound |
| CA10 new: centre pivotal = `Center.pivotalCategory` | `Z(Hilb(ℤ/2))`; `Z(Hilb(S₃))`; twisted control | dims 1,1,1,1, `Σd²=4=(dim C)²`; S₃: 36; twisted: 1,1,−1,−1, still `Σd²=4` | sound; the negative control separates the structures |

## Not verifiable

- **Kosaki 1986 §3 Lemma 3.2, Popa 1995 Theorem 3.5(ii) and Corollary 4.4, and Izumi 1993 Theorem 3.5.**
  - The manifest records these as `uncertified` (paywalled), and none fell in this sample.
  - The README cites them through secondary statements:
    - Burns Proposition 2.1.21;
    - Masuda–Tomatsu 2009 Theorem 4.18 (`MasudaTomatsu2008` 1652–1663);
    - Masuda–Tomatsu 2009 Theorem 4.16 (1639–1642).
- **Journal pagination.** I did not compare page numbers with the journal versions of Katsura, Masuda–Tomatsu and Izumi 2003, whose publisher pages are paywalled. The README's references cite the linked arXiv versions, which are the ones read.

## Source issues

- **Misprint** in HartglassPenneys2014II at Definition 6.1, p. 25: the source says a quasi-basis satisfies `x=Σa_iE(xb_i)=ΣE(a_ix)b_i`; it should be Watatani's `x=Σa_iE(b_ix)=ΣE(xa_i)b_i` (for `D₂⊂M₂`, `x=e₁₂`, every `a·E(xb)` has zero second column); affects nothing.
