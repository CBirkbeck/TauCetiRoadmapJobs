# Review of CategoricalOperatorAlgebras (pull request #888 at 3375f9e)

**Verdict:** needs changes

This is a full review of a head that has not changed since the previous review: nothing in the folder changed and nothing outside it.

- **R01 (P2), carried and widened.** The previous review found two open owners of the CA1a/CA2a objects. There are now three. QuantumGroups #1649 moved from `9b3ff6c` to `b3b2d26` and now also calls its Layer 0 "the single home" of these objects. #1705 still does, and so does this README.
- **R02 (P3), new.** The pinned Tau Ceti already has part of the Drinfeld centre that CA6 and CA10 use: the duality by mates, the pivotal and spherical structure, the simple unit and Hom-finiteness. The supplier contract does not cite these declarations. CA6 plans the duality by mates again, and CA10 attributes the two pinned facts to PivotalSpherical Layer 11.
- **Gate and build.**
  - The gate passes, and the dependency check prints 0 problems.
  - `Suggested.lean` elaborates with no diagnostic.
  - All 15 sampled locators match their sources.
  - The adversarial pass found no false statement or Check.

## R01 (P2) — Three open single-home claims for CA1a/CA2a: this folder and both QuantumGroups revisions

Carried from the previous review's R01. No repair report marks it settled.

**Location.** `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` lines 40–46: "C*-categories, their finite additive and Karoubi completion … (CA1a), and C*-tensor categories … unitary dual functors and signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". The QuantumGroups bullet of Downstream consumers (lines 2303–2309) repeats this.

**Claim.** This roadmap is the only owner of the CA1a/CA2a objects, and QuantumGroups consumes them.

**Witness.** Two open revisions of QuantumGroups both claim the same objects.

- **#1705 at `96014ab`** (unchanged since the previous review):
  - lines 33–42: "Section 0.2 is the single home of C*-categories … the balanced unitary dual functor and signed self-dualities … CategoricalOperatorAlgebras CA1a–CA2a … consume these objects";
  - lines 1796–1799 repeat this;
  - line 307 asks to "Prove invariance of the sign on a simple self-dual object", the target this README proves at lines 471–477.
- **#1649 at `b3b2d26`** (new since the previous review; at `9b3ff6c` it left this theory to this roadmap):
  - lines 29–43: "Layer 0 … is the single home of the following objects. Section 0.1 owns C*-categories … signed self-dualities … CategoricalOperatorAlgebras CA1a–CA2a … consume these objects from §§0.1–0.2";
  - §0.1 (line 192 on) plans them;
  - line 219 repeats the sign-invariance target;
  - lines 1702–1704 list this roadmap as a consumer.

On main (`3090489`), QuantumGroups line 42 still cites "CategoricalOperatorAlgebras CA1a,CA2a" as a supplier. TemperleyLiebOperatorAlgebras #867 at `ba43cc7` consumes CA1a/CA2a (lines 106, 320).

The merge-order paragraph of this pull request names only AlgebraicKTheory and OperatorKTheory, so nothing orders it against either QuantumGroups revision.

**Repair.** Pick one owner and state the order in this pull request's description. The README names no pull request either way.

- **This roadmap first** (the order main and #867 assume):
  - Keep the README as it is.
  - Name both QuantumGroups revisions in the description as later.
  - Each revision then drops its single-home sentence and its sign-invariance target (#1705 lines 33–42, 307, 1796–1799; #1649 lines 29–43, 219, 1702–1704) and cites CA1a/CA2a, with `ε=ν₂(x)` from CA2a.
- **A QuantumGroups revision first:**
  - The two revisions must first agree with each other: #1649 puts these objects in §0.1 and #1705 in §0.2.
  - After the agreed revision merges:
    - lines 40–46: replace "have their single home here" for the overlapping objects with a citation of that QuantumGroups section;
    - delete the bullet at lines 2303–2309;
    - keep here what QuantumGroups does not build: W*-categories, W*-Cauchy completion, the grading groupoid for a nonsimple unit, Penneys's Theorem A, the braided sign law and the comparison `ε=ν₂(x)` with `TauCeti.frobeniusSchurIndicator`.
- **The description's Validation paragraph.** While editing the description, fix this paragraph too. It still reports "5 admitted-target warnings" and calls `Suggested.lean` "representative and non-exhaustive". At this head the file declares nothing and elaborates with no warning.

**Tested.** Under the first option, ε has one definition (line 466) and one invariance theorem (lines 471–477). The three texts' sign conventions agree:

- #1705 line 309 and #1649 line 245 both give the SU(2) fundamental object ε=−1.
- On Q₈ ⊂ SU(2), `ν₂=(1/8)Σχ(g²)=(2·2+6·(−2))/8=−1`, which agrees with CA2a's ε.

The dependency check prints 0 problems at this head under either option.

## R02 (P3) — The pinned Tau Ceti centre API is not in the supplier contract; CA6 plans part of it again and CA10 attributes it to a roadmap

**Location.**
- `README.md` lines 114–177 ("From Tau Ceti") list no `Monoidal.Center` module.
- CA6, lines 1056–1062: "construct dagger/tensor and duality by mates, and identify `Z†(C)=Z_C(C)` for α=id as the full subcategory of the native `Center` … Prove dagger, tensor and duality by mates preserve that condition".
- CA10, lines 2175–2182: "Finite semisimplicity, Hom-finiteness, finitely many simple classes and simple unit of the native `Center C` are PivotalSpherical Layer 11 … construct its … canonical spherical unitary dual functor".
- CA10 Needs (line 2289) and Dependencies (line 2299) name no Tau Ceti declaration.

**Claim.** The duality by mates on the native centre is planned here. The simple unit and Hom-finiteness of `Center C` come from a roadmap. The centre's pivotal structure is not mentioned.

**Witness.** Tau Ceti at the pin (`2fd255d`) already has all of these:

| Declaration | File and line |
|---|---|
| `CategoryTheory.HalfBraiding.rightDual` | `TauCeti/CategoryTheory/Monoidal/Center/Rigid.lean:251` |
| `CategoryTheory.Center.rigidCategory` (duals and mates computed in C) | `Rigid.lean:382` |
| `CategoryTheory.Center.pivotalCategory` (components `pivotalIsoApp X.1`) | `Pivotal.lean:113` |
| `CategoryTheory.Center.sphericalCategory` | `Pivotal.lean:194` |
| `CategoryTheory.Center.instSimpleUnit` | `Simple.lean:54` |
| `CategoryTheory.Center.instFiniteDimensionalHom` | `Preadditive.lean:225` |
| `CategoryTheory.Center.instAbelian` | `Abelian.lean:62` |

**Repair.**
1. Add a bullet to "From Tau Ceti" for `TauCeti.CategoryTheory.Monoidal.Center.{Preadditive, Abelian, Rigid, Pivotal, Simple}` that names the seven declarations above. Add "and the parts of Layer 11 listed below" to the sentence on Tau Ceti's implementation of PivotalSpherical.
2. In CA6:
   - State that the relative mate construction for a dagger tensor functor α:C→E specializes, at α=id, to `CategoryTheory.HalfBraiding.rightDual` and `CategoryTheory.Center.rigidCategory`.
   - For `Z†(C)`, the new target is only that the pinned dual half-braiding of a unitary half-braiding is unitary.
3. In CA10:
   - Take Hom-finiteness, the simple unit and the abelian structure of `Center C` from the pin.
   - Keep PivotalSpherical Layer 11 for finite semisimplicity, finitely many simple classes and `dim Z(C)=(dim C)²`.
   - Add the target that the pivotal structure induced by `Z†(C)`'s canonical spherical unitary dual functor is the restriction of `CategoryTheory.Center.pivotalCategory`. This mirrors what CA2a does for C with `TauCeti.PivotalCategory`.
   - Add these declarations to CA10's Needs and Dependencies.

**Tested on** `C=Hilb(ℤ/2)`:
- The README's own Check gives `Z(C)` four simple objects.
- Under `Center.pivotalCategory`, every simple `(g,β)` has dimension `dim_C(g)=1>0`, so that structure is pseudo-unitary.
- `TauCeti.PivotalCategory.eq_of_leftDim_eq_frobeniusPerronDim` (on the fusion category `Z(C)` over ℂ) then makes it the structure induced by the canonical spherical unitary dual functor. So the identification asked for holds, with both sides computed.

## Previous findings

- **R01: not repaired, and widened.** Lines 40–46 still read "(CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". #1705 at `96014ab` keeps its lines 33–42, 307 and 1796–1799. #1649 has since moved to `b3b2d26` and makes the same claim at lines 29–43. Carried as R01.

## Verified sound

### Gate, dependency check, build and folder

- **Gate.** `gate … --base origin/main` at `3375f9e` printed `gate CategoricalOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited 0. The worker's run adds `build=0`.
- **Dependency check.** `gate --depcheck … --movable --content …` printed `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` exits 0 with no diagnostic. The file declares nothing, so neither the `#check @name` comparison nor the one-tactic padding probe has anything to run on.
- **Folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.OA"`, accepted by the gate's metadata check).

### `Suggested.lean` against the pins

The module docstring lists each headline with the carrier it lacks. I searched the pinned Mathlib (`1b1ccf4`) and Tau Ceti (`2fd255d`) with plain `grep -a` for each missing carrier:

| Carrier searched for | Hits |
|---|---|
| dagger category or C*/W*-category | none (Tau Ceti's 37 `Dagger` files are Monsky–Washnitzer dagger algebras) |
| hyperfinite factor | none |
| Cuntz–Pimsner algebra | none |
| planar algebra | none |
| interior tensor product of `CStarModule` | none |
| operator K-theory | none (the `K₀` hits are Grothendieck groups of rings and categories) |
| stable rank | none |
| von Neumann factor | none (the `IsFactor` hits are `IsFactorSet` and `Flow.IsFactorOf`) |

So every headline the docstring names (CA2a, CA2b, CA3–CA10) is correctly declared not statable. No statable headline is missing.

The docstring's claim about what the libraries do have also holds:
- Mathlib: `MonObj`, `EndMonoidal`, `HalfBraiding`, `Center`, rigid categories, `CStarModule`, `VonNeumannAlgebra` and `CompletelyPositiveMap`.
- Tau Ceti: pivotal structures with traces and the universal grading group.

### Library declarations opened at the pins

**Tau Ceti, 24 names, all present.** Each is under `TauCeti/CategoryTheory/`:

| Declaration | File and line |
|---|---|
| `exactPairingCongrLeft_evaluation` | `Monoidal/Rigid/Basic.lean:73` |
| `doubleRightDualFunctor` | `Monoidal/Rigid/DualFunctor.lean:325` |
| `PivotalCategory` | `Monoidal/Pivotal/Basic.lean:76` |
| `pivotalIsoApp` | `Basic.lean:93` |
| `leftDualIsoRightDual` | `Monoidal/Pivotal/LeftDual.lean:67` |
| `dualFunctorIso` | `LeftDual.lean:167` |
| `leftTrace`, `rightTrace`, `leftDim`, `rightDim` | `Monoidal/Pivotal/Trace.lean:88`, `:93`, `:97`, `:101` (valued in `𝟙_ C ⟶ 𝟙_ C`) |
| `SphericalCategory` | `Monoidal/Pivotal/Spherical.lean:69` |
| `PivotalCategory.instTorsor` | `Monoidal/Pivotal/Torsor.lean:120` |
| `universalGradingGroup` | `Monoidal/Grading/Universal.lean:53` (presented by `[S][T]=[U]` for nonzero `U→S⊗T`) |
| `universalGradingGroup.liftEquiv` | `Universal.lean:106` |
| `PivotalCategory.characterEquiv` | `Monoidal/Pivotal/Grading.lean:49` |
| `frobeniusSchurIndicator k V n` | `Monoidal/Pivotal/FrobeniusSchur.lean:287` (n : ℕ+, the trace of the rotation operator, 0 when not finite free) |
| `SplitK0.leftDimChar` | `Monoidal/Pivotal/Character.lean:97` |
| `SplitK0.frobeniusPerronChar` | `Semisimple/FrobeniusPerron.lean:128` |
| `SplitK0.eq_frobeniusPerronChar` | `FrobeniusPerron.lean:133` (hypothesis: nonnegative on simples) |
| `frobeniusPerronDim` | `FrobeniusPerron.lean:198` |
| `IsPseudoUnitary` | `Monoidal/Pivotal/PseudoUnitary/Basic.lean:73` |
| `IsPseudoUnitary.of_leftDim_eq_frobeniusPerronDim` | `Basic.lean:131` |
| `PivotalCategory.eq_of_leftDim_eq_frobeniusPerronDim` | `Basic.lean:167` |
| `IsPseudoUnitary.existsUnique_pivotalCategory` | `Monoidal/Pivotal/PseudoUnitary/Existence.lean:161` |

The variable blocks match the README's contract:
- `characterEquiv` needs `[IsAlgClosed k]`, `[IsFiniteSemisimpleCategory C]` and `[Simple (𝟙_ C)]` (`Grading.lean:41–45`).
- `leftDimChar` needs `[IsAlgClosed k]` and a pivotal structure (`Character.lean:76–77`).

**Mathlib, 20 names, all present.** Each is under `Mathlib/`:

| Declaration | File and line |
|---|---|
| `MonObj`, `Mon` | `CategoryTheory/Monoidal/Mon.lean:72`, `:251` |
| `EndMonoidal` | `CategoryTheory/Bicategory/End.lean:27` |
| `HalfBraiding`, `Center` | `CategoryTheory/Monoidal/Center.lean:53`, `:72` |
| `ExactPairing`, `HasRightDual`, `exactPairingCongrLeft`, `RigidCategory` | `CategoryTheory/Monoidal/Rigid/Basic.lean:78`, `:237`, `:597`, `:733` |
| `Functor.Monoidal`, `LaxMonoidalFunctor` | `CategoryTheory/Monoidal/Functor.lean:387`, `:1281` |
| `NatTrans.IsMonoidal` | `CategoryTheory/Monoidal/NaturalTransformation.lean:46` |
| `MonoidalPreadditive` | `CategoryTheory/Monoidal/Preadditive.lean:38` |
| `MonoidalLinear` | `CategoryTheory/Monoidal/Linear.lean:33` |
| `Bicategory` | `CategoryTheory/Bicategory/Basic.lean:61` |
| `Karoubi` | `CategoryTheory/Idempotents/Karoubi.lean:43` |
| Day convolution | `CategoryTheory/Monoidal/DayConvolution.lean` |
| `CStarModule` | `Analysis/CStarAlgebra/Module/Defs.lean:73` |
| `VonNeumannAlgebra` | `Analysis/VonNeumannAlgebra/Basic.lean:70` |
| `CompletelyPositiveMap` | `Analysis/CStarAlgebra/CompletelyPositiveMap.lean` |

### Supplier citations resolved

All suppliers come earlier in the merge order or are on main:
- `ORDER.txt` positions: VonNeumannAlgebras 5, CStarAlgebras 7, HilbertModules 8, OperatorKTheory 9, Subfactors 208, this roadmap 229.
- On main (`3090489`): FreeProbability, PivotalSpherical and OperatorAlgebraDynamics.

| Citation | Found where |
|---|---|
| CStarAlgebras C1–C5, C4.2 Stinespring | main, ll. 232–1270 |
| HilbertModules H1 `CStarModule Aᵐᵒᵖ E` | main, l. 23 |
| HilbertModules H3: interior tensor, imprimitivity, linking algebra `K_B(E⊕B)`, Rieffel, Morita invariance of simplicity | main, ll. 262–319 |
| VonNeumannAlgebras V4–V6, V11 (dual action `θ_s(u_t)=exp(ist)u_t`, `Tr∘θ_s=exp(s)Tr`) | main, ll. 3264–3268 |
| VonNeumannAlgebras V11 `T(M)` | main, l. 3071 |
| VonNeumannAlgebras V12 `Ct(M)` | main, l. 3408 |
| VonNeumannAlgebras V13b semidiscrete tensor permanence, III₀/III₁ classification | main, ll. 3821, 4020–4022 |
| VonNeumannAlgebras V13b `Ct(R_(0,1))=Int(R_(0,1))` and `ker mod=closure Int(R_(0,1))` (the flip of `R_II∞⊗̄R_II∞`) | main, ll. 4036–4037 |
| Subfactors 1.1–1.2, 2.1–2.5 (2.5's inverse weight `E⁻¹:N′₊→M̂′₊`, l. 546), 3.2–3.3, 5.1, 6.1–6.4, 7.1–7.2, 8.1–8.2, 9.1–9.2 | main, all headings present |
| FreeProbability F2–F4 (noncrossing pairings and Wick formula, l. 343) | main |
| OperatorAlgebraDynamics D6 owns `O_n` | main, l. 590 |
| OperatorKTheory K2.3 (continuity, Morita invariance for σ-unital algebras, full-corner maps), K3.2, K7.6 (Cuntz algebras) | #866 at `1377338`, ll. 599–628, 761, 1903 |
| PivotalSpherical Layer 8 (indicators) | main, ll. 506–535 |
| PivotalSpherical Layer 11 (Hom-finiteness, simple classes, simple unit, `dim(Center C)=(dim C)²`) | main, ll. 626–695 |

The consumers named in the README cite CA1a/CA2a consistently:
- QuantumGroups on main, lines 42 and 253;
- TemperleyLiebOperatorAlgebras #867, lines 320–325 and 1336–1369.

Subfactors on main (lines 72–73 and 1722–1727) defers Q-systems and planar-to-C*-algebra completions to this roadmap.

`overlaps.md` lists no other pull request changing this folder and no dropped or revision-only id; the citation resolver lists nothing missing.

### Duplication and ownership

I searched every open roadmap pull request and main (`roadmaps grep`) for these objects:

| Object | Owners other than this roadmap |
|---|---|
| Q-systems | #867 only cites this roadmap; HabiroNahmSeries and RefinedTraceMethods use the phrase for other objects |
| Cuntz–Pimsner/Katsura | none |
| C*/W*-categories, unitary dual functors | QuantumGroups #1649 and #1705 (R01); #867 consumes them from here |
| tube algebra | ArcTopologyAndDescent, unrelated |
| anchored planar algebras, bicommutant categories | none |
| Ocneanu ultrapower | none |
| centrally free actions | VonNeumannAlgebras V13b (main, l. 4043): Connes's Rokhlin theorem for single automorphisms of R |

On the last row: CA9's Tomatsu theorem is the tensor-category generalization of that Rokhlin theorem. V13b's asymptotic centralizer (main, l. 4088) is defined for one fixed state, while CA9's `C^ω` asks for every predual functional, so the two are different objects.

The only duplications found are R01 and R02.

### Seeded sample (15 targets, seed `PRREVIEW-CategoricalOperatorAlgebras~19`, drawn from 85 locator-bearing claims)

| # | README claim | Source line, page | Agrees |
|---|---|---|---|
| 4 | Penneys Theorem A, p. 3: three canonical bijections | `Penneys2018` 122–125, p. 3 | yes, the same three sets and equivalences |
| 8 | Penneys Theorem C, p. 4: shaded planar C*-algebras ↔ `(C,∨,X)` with `1=1₊⊕1₋`, `X=1₊⊗X⊗1₋` | `Penneys2018` 165–187, p. 4 | yes; the README's "finite direct sum of alternating words" is needed because a single word lies in one corner `1_±C1_∓` |
| 9 | §4 dictionary, p. 23: connected ↔ simple `1_±` | `Penneys2018` 1061–1065, p. 23 | yes |
| 19 | JP *Operator algebras* Theorem 4.28, p. 39: Stinespring `θ=v†π(·)v` | `JonesPenneys2017Operator` 1958–1962, p. 39 | yes |
| 23 | JP *Realizations* Corollary 7.14, p. 62 | `JonesPenneys2017Realizations` 3091–3096, p. 62 | yes: unital *-algebra transformations ↔ normal state-preserving N–N-bilinear *-homomorphisms |
| 25 | JP *Realizations* Theorems 7.2–7.3, pp. 58–59 | `JonesPenneys2017Realizations` 2948, 2965, pp. 58–59 | yes |
| 39 | HP II §6, p. 25, and Corollary 6.8, p. 27: index `δ²` | `HartglassPenneys2014II` 1146–1147, p. 25 (II₁ tower recalled from GJS); 1217, p. 27 | yes |
| 45 | HP II Remark 5.17, p. 25: `[f(0)]≠[f(2)]` in TL(√2) | `HartglassPenneys2014II` 1127–1131, p. 25 | yes, and the README Check reproduces it |
| 57 | MT2009 Corollary 4.19, p. 38 | `MasudaTomatsu2008` 1664–1674, p. 38 | yes; the README's route (Lemma 4.15 for `σ̄`, Theorem 4.18 with n=1, `σ_(nt)` excluded by T={0}) is that proof and the one at 1676–1681 |
| 60 | Tomatsu Remark 2.17(1), p. 16 | `Tomatsu2018` 723–726, p. 16 | yes: strong ⇔ central freeness via MT2007 Lemma 8.2 |
| 69 | MT2009 Theorem 4.6, p. 31 | `MasudaTomatsu2008` 1401–1407, p. 31 | yes: infinite factor; composition, subobjects, sums, conjugates |
| 70 | MT2007 Lemma 8.3, p. 65, with Definition 8.1(4), p. 64 | `MasudaTomatsu2007` 3071–3072, p. 65; 3035–3036, p. 64 | yes; the README's remark that a∈M commutes with `M_ω` matches the form `βω(x)a=(x⊗1)a` |
| 76 | MT2009 Theorem 4.18, p. 37 | `MasudaTomatsu2008` 1656–1663, pp. 37–38 | yes: hyperfinite III₁, `σ∈End(M)₀`, n∈ℕ; statements (1)⇔(3); Popa's centrally free origin stated at 1652–1655 |
| 78 | HP2020 Lemma 3.6 and Corollary 3.8, p. 13 | `HenriquesPenneys2020` 608–624, p. 13 | yes: II∞ or III₁, unitary fusion C |
| 82 | HPT *Classification* Lemma 3.7, p. 10 | `HPT2023Classification` 459–460, p. 10 | yes; the hypothesis that Ψ^Z is fully faithful holds for CA10's identity lift `Z(C)→Z†(C)` |

### Headline locators checked beyond the sample

| Locator | Source line, page | Result |
|---|---|---|
| Katsura Theorem 8.6 | `Katsura2004` 764–771, p. 18 | no separability assumed (697–699) |
| HP I Theorem 5.23 | `HartglassPenneys2014I` 1732–1733, p. 39 | standing connected setting at 1520 |
| HP I Theorem 5.25 | `HartglassPenneys2014I` 1753–1754, p. 40 | — |
| HP I Notation 2.11 (countable) | `HartglassPenneys2014I` 297, p. 8 | — |
| HP I Definition 5.17 | `HartglassPenneys2014I` 1528–1535, p. 35 | `a=(μ(s(ε′))/μ(t(ε′)))^(1/4)` |
| CHJP Theorem 3.36 | `CHJP2021` 1131, printed p. 26 | arXiv v2 offset of 13: PDF p. 39 carries printed page 26 (line 1138) |
| CHJP Corollary 3.37 | `CHJP2021` 1164, printed p. 27 | — |
| CHJP Theorem A and Lemma B | `CHJP2021` 122, 131, p. 3 | — |
| JP *Q-systems* Theorem A | `JonesPenneys2017Qsystems` 36–53, p. 1 | "normalized irreducible Q-systems"; simple unit in footnote 1 |
| HPT *Anchored* Theorem A | `HPT2023Anchored` 94, p. 3 | — |
| HNP Theorem A | `HNP2024` 37, p. 2 | — |
| HP2015 Lemma 3.4 | `HenriquesPenneys2015` 886, p. 16 | — |
| HP2020 Theorem 3.10 | `HenriquesPenneys2020` 651–655, p. 14 | both type II or both III₁ |
| Tomatsu Theorem D | `Tomatsu2018` 76–80, p. 2 | Irr(C) countable as a standing assumption at 337 |
| MT2009 Corollary 3.16(3)–(4) | `MasudaTomatsu2008` 1329–1332, p. 29 | — |
| MT2009 Lemma 4.15 | `MasudaTomatsu2008` 1606, p. 36 | infinite factor |
| HPT *Classification* Theorem 3.8 | `HPT2023Classification` 486, p. 10 | — |
| HPT *Classification* Corollary 3.9 | `HPT2023Classification` 537, p. 11 | — |
| HPT *Classification* §4 | `HPT2023Classification` 802–808, p. 16 | real objects, Z(C)^rev |
| HPT *Classification* Lemma 4.1 | `HPT2023Classification` 821, p. 16 | — |
| Penneys Proposition 3.24 | `Penneys2018` p. 16 | — |
| Penneys Corollary 3.26 | `Penneys2018` p. 18 | — |
| Penneys Definition 2.10 | `Penneys2018` 341, p. 8 | — |
| Penneys Lemma 3.19 | `Penneys2018` p. 14 | — |
| Penneys Lemma 3.20 | `Penneys2018` 665, p. 14 | — |

### Adversarial table

Values computed by hand and, where marked (†), by a short script.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| CA1a C*-identity | `f=diag(2,1)`: operator and Hilbert–Schmidt norms | operator: `‖f†f‖=4=‖f‖²`; HS: `‖f‖₂²=5`, `‖f†f‖₂=√17≈4.123`† | sound; the Check separates the norms |
| CA1a idempotent vs projection | `e(x,y)=(x+y,0)` | `e²=e`, `‖e‖=√2`, retract norm √2; adjoint of `t↦(t,0)` is `(x,y)↦x` | sound |
| CA1a W* sums | ℓ² column with entries `1/n` vs `1/√n` | `Σ1/n²=π²/6` (morphism); `Σ1/n=∞` (none) | sound |
| CA1a W* criterion | `B=C([0,1])` vs `B=ℂ` | projections of `C([0,1])` are only {0,1}; `End(ℂ²)=M₂(ℂ)` | sound |
| CA1b nondegeneracy | `A=ℂ²` acting on `X=ℂ` by `(a,b)↦a`, and the zero action | `A⊗_A X≅ℂ` vs `0` | sound |
| CA1b reversal | ℂⁿ imprimitivity bimodule | dims `n²` and `1` | sound |
| CA2a sign and indicator, `ε=ν₂(x)` | ℂ² with J, J′; ℂ; `Hilb(ℤ/2)` with χ=±1; Q₈ and S₃ 2-dimensional irreducibles | `J²=−1`, `J′²=+1`†; on ℂ `J²=|c|²=1`; `ν₂(ℂ²)=tr(flip)=2`; `Hilb(ℤ/2)`: `ν₂=+1` standard and `−1` twisted; Q₈ `ν₂=−1`†; S₃ `ν₂=+1`† | sound; `φ_x⁻¹∘(r⁻¹)∨=εr⁻¹` follows from `r̄r=εφ_x` with `r†=r⁻¹` |
| CA2a sign law | `J⊗J` under the flip | `(J⊗J)²=(+1)` = `(−1)(−1)` | sound |
| CA2a Theorem A (Penneys) | `Hilb(ℤ/2)`; `End†(Hilb_fd⊕Hilb_fd)` | `Hom(ℤ/2,ℝ>0)={1}` and `Hom(ℤ/2,ℂ×)={±1}`; pair groupoid gives a family t>0 | sound |
| CA2a spherical state | t=4 | equal weights give `1` vs `1/4`; weights 1/5 and 4/5 give `2/5=2/5`†; the condition is symmetric for X and X* | sound |
| CA2a pseudounitary ↔ `IsPseudoUnitary` | fusion C over ℂ | positive left dims → real character → `eq_frobeniusPerronChar` → FP dims → `of_leftDim_eq_frobeniusPerronDim` | sound, pinned at `Basic.lean:131, 167` |
| CA2b Theorem C (Penneys) | `u₁—w—u₂` | `P_(0,+)=ℂ²`, `P_(0,−)=ℂ`; TL Gram `det=δ²(δ²−1)`, equal to 2 at δ=√2† | sound |
| CA3 Q-system normalisations | `M_n(ℂ)` with `⟨x,y⟩=n⁻¹Tr(x*y)` | `i†i=1`, `mm†=n²` (sum over the middle index gives `n·n`); after `m′=n⁻¹m`: `m′m′†=1`, `i′†i′=n²`; wrong `d_Q⁻¹` gives `n⁻²` | sound |
| CA3 morphism rescaling | `f:ℂ→M_n` | `f′(1)=n·1=i₂′(1)`, while unscaled `1≠n·1`; also `m₂′(f′⊗f′)=n m₂(f⊗f)=f′m₁` | sound |
| CA3 completion (CHJP 3.36, 3.37, A, B) | row ⊗ column vectors over `M_n` | balanced range of dim 1 inside `n²` | sound, locators on printed pp. 26, 27, 3 |
| CA4 CP and Stinespring | transpose on M₂; trace on M₂ | flip has eigenvalue −1; K=M₂ has dim 4; density `½·1` has rank 2, so it is not a vector state | sound |
| CA4 GNS normalisation | `Q=H=a=1` | `α†α=d_a(d_Q/d_H)f†g=f†g`; `α=d_a^(1/2)d_H^(−1/2)λ̃` gives `α†α=⟨f,g⟩` | sound |
| CA5 realization (JP Theorem A) | `N⊆N⋊ℤ/2`; `N⊆N⋊ℤ` | `d_Q=2`; infinite index, discrete, not compact | sound |
| CA6 anchored (HPT Theorem A) | `Hilb(ℤ)` vs `Hilb(ℤ/2)` on `Hilb_fd`; `P[0]=ℂ²`; `x=ℂ^k` | infinite vs 2-term support; `‖(1,0)‖²=ψ(1,0)=1/2`; `dim P[n]=kⁿ` vs `k^(2n)` | sound |
| CA7 Katsura 8.6 | `ℂⁿ` over ℂ; zero action; `ℓ²(I)` with I uncountable | `J_X=ℂ`, `K₀(O_n)=ℤ/(n−1)`, `K₁=0`; n=1 gives `K₀=K₁=ℤ`; zero action gives `J_X=0`, while omitting `(kerφ)^⊥` collapses `O_X` to 0; `φ(1)` not compact, so `K₀=ℤ`, `K₁=0` | sound |
| CA7 weighted moments | μ(v)=16, μ(w)=1 | `a=2`, `τ(x†x)=a²μ(w)=4=a⁻²μ(v)`†; reciprocal gives 1/4 and 64†; in general both equal `√(μ(v)μ(w))` | sound |
| CA7 HP I 5.23 and 5.25 | one edge; one loop; countable star; uncountable star | `a_μ(v)=1<16`, `a_μ(w)=16>1`; loop `1≮1`; star centre `∞>2`, leaves `2>1`, so A=∅; `K₀` free on vertices by continuity | sound; "connected" matches the source's standing setting (l. 1520) |
| CA8 HP II Theorems A–C | TL(√2), A₃ | `√2=δ·1`, `1+1=δ·√2`; `τ_*(0,1,0)−τ_*(1,0,0)=√2−1∈(0,1)`; `[p₀]−[p₂]` has trace 0 | sound |
| CA8 Watatani (Corollary 6.8, Theorem 6.13) | `ℂ⊂ℂ²` with `E=(a+2b)/3`; `N(δ²)` | quasi-basis returns `(5,7)` for `x=(5,7)`†; `Ind=(3,3/2)`; `N(2)=3`, `N((3+√5)/2)=3`, `N(3)=4`, `N(4)=5`† | sound |
| CA9 HNP Theorem A, transpose | `F=−⊗ℂ^k`; `F(c₁,c₂)=(0,c₁)` | `HS(c⊗ℂ^k,d)≅HS(c,d⊗(ℂ^k)‾)`; dims 6 vs 1 for `c=(ℂ²,ℂ)`, `d=(ℂ,ℂ³)` | sound |
| CA9 End_rev and corner model | M₂, `u=diag(1,i)`, `v` the flip; M=ℂ | `uv=[[0,1],[i,0]]`, `vu=[[0,i],[1,0]]`, not proportional†; `Hom(pt→{1,2})` has dim 2 in `M₃` | sound |
| CA9 canonical extension | II∞ amplification, n=2 | `ρ̌(u_t)=2^(−it)u_t`, `ρ̃(u_t)=u_t`, wrong phase gives `2^(−2it)`; `τ∘φ_ρ=τ/2` | sound |
| CA9 cocycle conventions | `α_Xα_Y=Ad(c)α_(X⊗Y)` expanded on X,Y,Z; `G` on `C^rev` | both bracketings give `c_(X,Y)c_(X⊗Y,Z)=α_X(c_(Y,Z))c_(X,Y⊗Z)`; `c_(X,Y)=u_(Y,X)†` from `u_(Y,X)F_XF_Y=F_(Y⊗X)u_(Y,X)` | sound |
| CA9 basic extension index | `id⊕id`; λ=1/5 | `Ind=4`, `E₁(e)=1/4`; non-minimal `Ind=1/a+1/b=25/4`† | sound |
| CA9 HP2020 3.6, 3.8 and 3.10 (II/III₁ restriction) | `R_λ`, λ=0.3 | `λ^(it₀)=−1`†, so `σ_(t₀)=⊗Ad(diag(1,−1))`; t₀ is not in `T(R_λ)` | sound; centrally trivial and not centrally free, as the Checks say |
| CA9 Tomatsu Theorem D (factor case) | `Hilb(ℤ)` on R_III₁; `L(F₂)⊗̄B(ℓ²)` | `σ_(nt)` outer for n≠0; `b⁻ⁿhaⁿ` distinct by abelianization, so the swap is outer, but `M_ω=ℂ` | sound |
| CA10 tube algebra and centres | `Hilb_fd`, `Hilb(ℤ/2)`, `Hilb(ℤ/3)`, `Hilb(S₃)` | dims 1, 4, 9, 36†; S₃ simple dims 1,1,2,3,3,2,2,2 with squares summing to 36† | sound |
| CA10 HPT *Classification* (Lemma 3.7, Theorem 3.8, Corollary 3.9, §4) | unit with `r=±id`, `u=i·id`; `C=Hilb_fd` | `ūru⁻¹=(−i)r(−i)=−r`; `E≃M` | sound |
| R01: CA1a/CA2a owner | this README; #1705; #1649; main; #867 | single-home claims here (l. 45), #1705 (ll. 33–42), #1649 (ll. 29–43); main l. 42 consumes | three owners (R01) |
| R02: centre API | `Center(Hilb(ℤ/2))` | 4 simples of dim 1 under `Center.pivotalCategory`, so pseudo-unitary and unique | pinned and uncited (R02) |

## Not verifiable

- **Kosaki 1986 (§3, Lemma 3.2), Popa 1995 (Theorem 3.5(ii), Corollary 4.4) and Izumi 1993 (Theorem 3.5).** The manifest records them as `uncertified` (paywalled). The README cites them through the secondary statements I checked: Burns Proposition 2.1.21, MT2009 Theorem 4.18 (`MasudaTomatsu2008` 1652–1663) and MT2009 Theorem 4.16 (1639–1642).
- **Journal pagination.** I did not compare page numbers with the journal versions of Katsura, Masuda–Tomatsu and Izumi 2003, whose publisher pages are paywalled. The README's reference entries cite the arXiv versions that were read.

## Source issues

- **Misprint** in HartglassPenneys2014II at Theorem C, p. 3: the source says the positive cone `K₀(A₀)^+` consists of the classes in `K₀(A_k)` with positive trace. It should say classes in `K₀(A₀)`, as in Corollary 5.18 on p. 25. Affects nothing.
- **Misprint** in HPT2023Classification at §1 (Introduction), p. 2: the arXiv v1 text lists the hyperfinite factor types as II₁, III∞ and III₁. It should say II₁, II∞ and III₁, as in the abstract (p. 1) and §4 (p. 16). Affects nothing.
