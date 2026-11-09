# Review of CategoricalOperatorAlgebras (pull request #888 at c3fc64a)

**Verdict:** needs changes

This head repairs R03 and R04 of the previous review and most of R02. R01 is unchanged on both sides: the CA1a/CA2a objects still have two owners, this folder and the QuantumGroups revision #1705. The full pass found one new P3 defect: CA2a does not cite two pinned Tau Ceti results that it uses, and it writes `U` for the grading groupoid without defining it (R02). The gate passes, the dependency check reports 0 problems, and all 15 sampled locators are exact.

## R01 (P2) — CA1a/CA2a still have two open owners: this folder and the QuantumGroups revision #1705

Re-raised from the previous review's R01. No repair report marks it settled, and this head does not touch it.

**Location.** `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` lines 40–46: "C*-categories, their finite additive and Karoubi completion … (CA1a), and C*-tensor categories … unitary dual functors and signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". The Downstream consumers bullet at lines 2253–2259 repeats it.

**Claim.** CA1a and CA2a are the single owner of these objects, and QuantumGroups consumes them.

**Witness.** QuantumGroups #1705 has moved from `4a56324` to `7c3e850`. Its README lines 33–41 say: "Section 0.2 is the single home of C*-categories … the balanced unitary dual functor and signed self-dualities … CategoricalOperatorAlgebras CA1a–CA2a … consume these objects from §§0.2–0.3". Its lines 1795–1798 repeat this. The sign law `bar(r) r=ε φ_X` is defined both at #1705 line 306 and at line 444 here.

**Status.** This README agrees with main and with the other open heads:
- main's QuantumGroups README cites CA1a/CA2a as a supplier at line 42 (supplier table) and line 253 ("Use CA2a's balanced unitary dual functor");
- TemperleyLiebOperatorAlgebras #867 at `ba43cc7` consumes CA1a/CA2a (lines 320–326, 1336, 1369);
- QuantumGroups #1649 at `7b6238f` leaves the general theory here (lines 33–35).

Only #1705 claims the objects, and neither description states an order between #888 and #1705.

**Repair.** Choose the order and state it in this pull request's merge-order paragraph; the README itself names no pull request.
- **This roadmap first** (the order main assumes). No README edit. The paragraph names the QuantumGroups revision as later. That revision deletes its §§0.2–0.3 ownership claim and cites CA1a/CA2a and TemperleyLiebOperatorAlgebras Layer 3.
- **The QuantumGroups revision first.** Once it has merged:
  - at lines 40–46, replace "have their single home here" for the overlapping objects by a citation of QuantumGroups §0.2;
  - delete the QuantumGroups bullet at lines 2253–2259;
  - keep here what §0.2 does not build: W*-categories and W*-Cauchy completion, the grading groupoid for a nonsimple unit, Penneys's Theorem A and the braided sign law.

**Tested.** Under the first option the sign ε has one definition (line 444). Every reader, on main or at an open head, already cites CA2a for it: main's QuantumGroups lines 42 and 253, and #867 lines 320–326. The dependency check prints 0 problems at this head. The second option adds an edge to QuantumGroups, which is on main, and the check allows edges to main.

## R02 (P3) — CA2a leaves two pinned results uncited and uses an undefined `U`

**Location.**
- Lines 449–451: "retaining the negative Frobenius–Schur sign as distinct data. On a simple self-dual object prove the sign is independent of the normalized unitary identification".
- Lines 471–474: "by uniqueness of the Frobenius–Perron character (PivotalSpherical Layer 5; the comparison is stated with Penneys, Definition 2.10)". The PivotalSpherical contract (lines 160–163) lists "Layers 0–4, 6 and 9" and Layer 11. CA2a's *Needs* (lines 572–573) and the CA2 Dependencies (line 663) list "Layers 0–6".
- Line 494: "these automorphisms are the homomorphisms `U→ℂˣ`". `U` is defined nowhere in the README.

**Claim.** The sign's independence of r is proved here. Uniqueness of the Frobenius–Perron character comes from a PivotalSpherical layer that the supplier contracts do not list.

**Witness.** Both results are pinned at Tau Ceti `2fd255d9`:
- `TauCeti.frobeniusSchurIndicator` (`TauCeti/CategoryTheory/Monoidal/Pivotal/FrobeniusSchur.lean:287`) is the indicator `ν_n(V)`: the trace of the rotation, in any k-linear pivotal category. The previous review's R02 repair list named it.
- `TauCeti.eq_frobeniusPerronChar` (`TauCeti/CategoryTheory/Semisimple/FrobeniusPerron.lean:133`): a character `SplitK0 C →+* ℝ` that is nonnegative on the simple basis is the Frobenius–Perron character.

**Repair.**
1. In the From Tau Ceti bullet, add:
   - `TauCeti.CategoryTheory.Monoidal.Pivotal.FrobeniusSchur`: `TauCeti.frobeniusSchurIndicator`;
   - `TauCeti.CategoryTheory.Semisimple.FrobeniusPerron`: `TauCeti.frobeniusPerronDim` and `TauCeti.eq_frobeniusPerronChar`.

   Then change "Layers 0–2, 6 and 9" to "Layers 0–2, 5, 6 and 9".
2. Replace the sentence at lines 450–451 by: "On a simple self-dual object prove `ε=ν₂(x)`, the indicator `TauCeti.frobeniusSchurIndicator ℂ x 2` of the induced pivotal structure, so that ε does not depend on the normalized unitary identification."
3. Add the first two values under **Tested** below as a CA2a Check.
4. At line 473, cite `TauCeti.eq_frobeniusPerronChar` in place of "PivotalSpherical Layer 5". In the PivotalSpherical contract write "Layers 0–6 and 9", as lines 572–573 and 663 already do.
5. At line 479, name the groupoid: "Construct the universal grading groupoid `U` from …".

**Tested.**
- **ν₂ needs a simple object.** In `Hilb_fd` the object ℂ² is not simple. Its self-dualities give `ε(J)=−1` and `ε(J′)=+1`, but `ν₂(ℂ²)` is the trace of the flip on `ℂ²⊗ℂ²`, which is 2.
- **ν₂ needs the induced pivotal structure.** In `Hilb(ℤ/2)` with the pivotal structure of the unitary dual functor, `ε(g)=+1=ν₂(g)`. The structure twisted by `χ(g)=−1` has `ν₂(g)=−1`, because the rotation uses `φ_g` once. Repair 2 states the comparison for the induced structure for this reason.
- **The Frobenius–Perron route.** In `Hilb(ℤ/2)`, the standard left-dimension character takes the values `(1,1)` on `(1,g)`. It is nonnegative, so it equals FPdim. The twisted character takes `(1,−1)` and is excluded.
- **A negative control for lines 468–470.** Yang–Lee has `d(τ)=(1−√5)/2<0`. Its universal grading group is trivial (`[τ][τ]=[1]=[τ]`), so it has only that pivotal structure. Its global dimension is `(5−√5)/2≈1.38`, while `FPdim=(5+√5)/2≈3.62`. So it is neither `TauCeti.IsPseudoUnitary` nor pseudounitary in the sense of line 468, and the equivalence claimed at lines 468–470 holds there.

## Previous findings

- **R01: not repaired.** Lines 40–46 and 2253–2259 are unchanged, and #1705 keeps its claim at its new head. The finding is carried above as R01.
- **R02: repaired except for one item.** The folder now does what the previous repair asked:
  - The From Tau Ceti bullet lists the pinned pivotal modules. Lines 119–122 read: "Tau Ceti's implementation of PivotalSpherical Layers 0–2, 6 and 9 is consumed as stated at the pin; its pivotal classes are stated over `[RigidCategory C]` with no braiding".
  - CA2a builds on them. Lines 431–436 read "Construct the `TauCeti.PivotalCategory` instance that the unitary dual functor induces", and lines 417–419 transport left duals "through `TauCeti.leftDualIsoRightDual`".
  - Pseudounitarity and the grading groupoid are compared with `TauCeti.IsPseudoUnitary` (lines 468–478) and with `TauCeti.universalGradingGroup` (lines 481–485).
  - The closing references clause no longer plans the unbraided comparison (lines 2387–2392).

  `TauCeti.frobeniusSchurIndicator` from the repair list is still missing. It is carried in R02 above.
- **R03: repaired.** Lines 1179–1188 read: "For a countable graph, the standing setting of Hartglass–Penneys I (Notation 2.11, p. 8), prove: if Λ is connected and `A(Λ,μ)=∅` then …". The star Checks at lines 1220–1230 keep the compact-intersection claim for countably many leaves and use the uncountable star for K-theory only. This matches the source: `HartglassPenneys2014I` line 297 (countable graphs), line 1520 (connected), and lines 1721–1722 (Lemma 5.21 is extended "by embedding").
- **R04: repaired.** `Suggested.lean` lines 38–44 now list "pairwise strong Morita equivalence of the `A_k` …, `A₀` simple, uniquely tracial and of stable rank one, … the positive cone `K₀(A₀)^+` and scale `Σ(A₀)` given by the trace". They add the missing carriers "imprimitivity bimodule or strong Morita equivalence of C*-algebras". At the pins, the only `Imprimitivity` declarations are permutation-group ones (`TauCeti/GroupTheory/Perm/Imprimitivity`).

## Verified sound

### Gate, build and form

- **Gate.** My run of `gate … --base origin/main` at `c3fc64a` prints `gate CategoricalOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.
- **Folder.** `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md` (2394 lines), `Suggested.lean` (57 lines) and `metadata.toml` (`topic = "math.OA"`). The branch's `lake-manifest.json` pins Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`, the same as main.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 4 s with no diagnostic. The file declares nothing, so there is no per-declaration `#check`, no one-tactic probe and no padding.
- **Docstring.** Each headline's missing carrier is missing at the pins:
  - no dagger, C*- or W*-category; Tau Ceti's `RingTheory/Dagger` is about dagger algebras of rings;
  - no planar algebra, Jones or Watatani index, hyperfinite factor, Connes fusion or Cuntz–Pimsner algebra;
  - no operator K-theory under `TauCeti/Analysis/CStarAlgebra`;
  - no operator conditional expectation; the one `expectation` is the matrix partial trace in `QuantumSpin/LocalAlgebra.lean:385`.

  The new CA2a clause is right: `TauCeti.universalGradingGroup` is the one-object case of the groupoid. So no headline is statable.
- **Policy greps.** The README has no process words, pull-request numbers, LaTeX delimiters or `lemma`.

### Dependency check

`gate --depcheck … --movable --content …` prints `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- This roadmap is at position 229 of the merge order. Its suppliers come earlier: VonNeumannAlgebras (5), CStarAlgebras (7), HilbertModules (8), OperatorKTheory (9) and Subfactors (208).
- FreeProbability, OperatorAlgebraDynamics, PivotalSpherical and QuantumGroups are on main.
- CStarClassification (230) and TemperleyLiebOperatorAlgebras (245) appear only as a scope deferral and a consumer.

No gaps are declared. `overlaps.md` and `citations.md` list nothing to act on.

### Library declarations

**Elaborated in one scratch file with `lake env lean`.** All 29 names elaborate:
- Mathlib (20 names):
  - categories and monoidal structure: `MonoidalCategory`, `MonoidalPreadditive`, `MonoidalLinear`, `MonObj`, `Mon`, `Functor.Monoidal`, `LaxMonoidalFunctor`, `NatTrans.IsMonoidal`;
  - bicategories and centres: `Bicategory`, `EndMonoidal`, `HalfBraiding`, `Center`;
  - duals and idempotents: `ExactPairing`, `exactPairingCongrLeft`, `HasRightDual`, `Idempotents.Karoubi`;
  - analysis: `CStarModule`, `WithCStarModule`, `VonNeumannAlgebra`, `CompletelyPositiveMap`.
- Tau Ceti (9 names): `TauCeti.exactPairingCongrLeft_evaluation`, `doubleRightDualFunctor`, `PivotalCategory`, `pivotalIsoApp`, `leftTrace`, `rightTrace`, `leftDim`, `rightDim`, `SphericalCategory`.

**Read from source at `2fd255d9`.** These modules' `.olean` files are not built. Each matches its description in the From Tau Ceti bullet (lines 114–159):

| Declaration | File and line | What it says at the pin |
|---|---|---|
| `TauCeti.leftDualIsoRightDual` | `Pivotal/LeftDual.lean:67` | `(ᘁX) ≅ Xᘁ` |
| `TauCeti.dualFunctorIso` | `Pivotal/LeftDual.lean:167` | monoidal, by `:195` |
| `TauCeti.PivotalCategory.instTorsor` | `Pivotal/Torsor.lean:120` | a torsor over `Aut (LaxMonoidalFunctor.of (𝟭 C))`, given `[Nonempty (PivotalCategory C)]` |
| `TauCeti.universalGradingGroup` | `Grading/Universal.lean:53` | presented by `[S][T]=[U]` for every nonzero `U→S⊗T` |
| `TauCeti.universalGradingGroup.liftEquiv` | `Grading/Universal.lean:106` | its universal property |
| `TauCeti.PivotalCategory.characterEquiv` | `Pivotal/Grading.lean:49` | assumes `IsAlgClosed k`, `Abelian`, `Linear k`, `IsFiniteSemisimpleCategory`, `Simple (𝟙_ C)` |
| `TauCeti.IsPseudoUnitary` | `Pivotal/PseudoUnitary/Basic.lean:73` | takes `[PivotalCategory C]`; `globalDim = FPdim` |
| `TauCeti.IsPseudoUnitary.existsUnique_pivotalCategory` | `Pivotal/PseudoUnitary/Existence.lean:161` | `∃!` structure with `leftDim = FPdim`, and it is spherical |

### Cross-roadmap citations resolved

**On main (`000abc1`):**
- VonNeumannAlgebras:
  - Layers 4, 5, 6, 11, 12 and 13 at lines 970, 1339, 1495, 2785, 3388 and 3688;
  - V13b at line 3740;
  - V4.Normality at line 244.
- Subfactors:
  - §§1.1–9.2 at lines 308–1529;
  - §2.4 includes Kosaki's sector version over properly infinite factors (line 499);
  - §2.5 has `E⁻¹` and `Ind(E)=E⁻¹(1)` (lines 546–554);
  - its scope (lines 72–73) leaves Q-systems and module C*-categories to this roadmap.
- HilbertModules H1–H3 at lines 126, 179 and 262.
- CStarAlgebras C1–C5 at lines 234–1230.
- FreeProbability F2–F4 at lines 184, 255 and 353.
- OperatorAlgebraDynamics D6 owns `O_n` (line 590).
- PivotalSpherical:
  - Layers 0–6, 9 and 11 at lines 257–626;
  - Layer 6 states pseudo-unitarity and ENO's Proposition 8.23 (lines 453–476).

**At open heads:**
- OperatorKTheory #866 at `1377338`: K1–K6 (lines 314–1261), K2.3 continuity and Morita invariance (line 599), K3.2 (line 761).
- TemperleyLiebOperatorAlgebras #867 at `ba43cc7`: consumes CA1a/CA2a.
- QuantumGroups #1649 at `7b6238f`: defers to this roadmap.
- QuantumGroups #1705 at `7c3e850`: the conflict in R01.

### Ownership by object

I ran `roadmaps grep` on main and at every open head for: grading groupoid, unitary dual functor, pseudounitary, Q-system, Cuntz–Pimsner, anchored planar, W*-category, Ocneanu ultrapower, tube algebra and Watatani.
- Only this roadmap owns these objects, apart from #1705's unitary dual functor (R01).
- The other hits are different objects:
  - HabiroNahmSeries #1427: Nahm q-systems;
  - RefinedTraceMethods #1493 line 3437: a "Q-system envelope" of ind-objects;
  - ArcTopologyAndDescent #1755 line 1652: rings called tube algebras.

### Seeded sample

I drew 15 of the 114 page-locator lines in CA1–CA10 with `shuf`, seeded with the head SHA followed by `-15`. All 15 are exact at the printed page and support the statement as written.

| README line | Target | Source line, page | Values computed | Result |
|---|---|---|---|---|
| 468 | Penneys Def. 2.10 | `Penneys2018` l. 341, p. 8 | `Hilb(ℤ/2)`: standard dims `(1,1)`, pseudounitary; twist `χ(g)=−1`: `(−1,−1)`, not | exact |
| 497 | Rem. 2.5, Rem. 2.11, Lemma 3.19 + paragraph | l. 281 p. 6; l. 345 p. 8; ll. 653–664 p. 14 | `Aut⊗(id)≅Hom(ℤ/2,ℂˣ)={±1}`; positive part `{1}=Hom(ℤ/2,ℝ>0)` | exact |
| 730 | CHJP Thm A, Lemma B, §4 | `CHJP2021` ll. 122, 131 p. 3; §4 at l. 1207 (p. 28) | `B=ℂ`, `Q=M₂`: `\|Q\|=M₂`, `X⊗_(M₂)X̄≅M₂`, dim 4 | exact |
| 1346 | HP II Thm C via Thms 5.1, 5.5, 5.14 | `HartglassPenneys2014II` l. 98 p. 3; l. 689 p. 17; l. 826 p. 19; l. 1105 p. 24 | TL(√2): `τ_*(a,b,c)=a+√2b+c`; cone `{τ_*>0}∪{0}` | exact |
| 1389 | Examples 6.15–6.16 | ll. 1266, 1277, p. 28 | `R⊂R⋊ℤ/2`: a 2-unitary basis forces `[1₂]=2[1₀]`, false at depth 2; nonabelian G: `\|VΓ₊\|≠\|VΓ₋\|`, so K₀ ranks differ | exact |
| 1412 | Remark 5.17 | ll. 1127–1131, p. 25 | `Tr f⁽⁰⁾=1=Tr f⁽²⁾` but `[f⁽⁰⁾]≠[f⁽²⁾]`, matching the Check's trace-0 class | exact |
| 1463 | HNP Thm A, Thm 7.4 | `HNP2024` l. 37 p. 2; l. 1540 p. 38 (`A ↦ A-Mod`, left modules) | `M=ℂ` and `M=M₂` give the same W*-category Hilb | exact |
| 1691 | MT2009 Cor. 4.19 (identification) | `MasudaTomatsu2008` ll. 1670–1671, p. 38 | `σ=id⊕ρ`: `σ̄(M)⊂M ≅ M⊂M₁` | exact |
| 1871 | Cor. 4.19 proof, Lemma 4.15 | l. 1606 p. 36; ll. 1668–1681 p. 38 | `[σσ̄]=[id]⊕[ρ]⊕[ρ̄]⊕[ρρ̄]`; the `σ_(nt)` are pairwise inequivalent for `t≠0` because `T={0}` | exact |
| 1908 | Tomatsu Thm D, Thm 5.7 | `Tomatsu2018` l. 76 p. 2; l. 2172 p. 47 | for a factor `Z(M)=ℂ`, so the invariant-state hypothesis (l. 79) is automatic | exact |
| 1934 | HP2020 Lemma 3.9 | `HenriquesPenneys2020` ll. 627–631, p. 13 | II∞: `id` has rank 1 and the 2-fold amplification rank 2 (`τ∘φ_ρ=τ/2`), so Tomatsu's Proposition 2.7 does not compare them; the README keeps irreducibility and `d_ρ=d_σ` (l. 630) | exact |
| 1956 | HP2020 Thm B, Thm 6.8 | l. 112 p. 3; l. 1866 p. 37; ll. 1385–1386 | types both II or both III₁; II₁ against III₁ excluded | exact |
| 2174 | HPT *Classification* Thm 3.8 | `HPT2023Classification` l. 486, p. 10 | `C=Hilb_fd⊆E`: `Z_C(E)=E`, and `E⊠Hilb_fd→E` is the identity | exact |
| 2181 | Cor. 3.9 | ll. 537–540, p. 11 | averaging object `X⊕gXg` in `Hilb(ℤ/2)` contains X | exact |
| 2192 | §4, Conjecture 1.1 | l. 63 p. 2; ll. 801–870 pp. 16–17; Lemma 4.1 l. 821 | the unit object's `r=±id` are conjugate; M is fusion by Lemma 4.1 | exact |

### Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| CA2a Penneys Thm A (headline) | `Hilb(ℤ/2)`; `Hilb(ℤ/3)`; `End†(Hilb_fd⊕Hilb_fd)`, t=4 | `χ(g)²=1, χ>0 ⇒ χ=1` (ℂˣ allows ±1); `χ³=1 ⇒ χ=1`; `dim_L=2`, `dim_R=½`, ratio 4, product 1 | sound | none |
| CA2a pseudounitary ⇔ `IsPseudoUnitary` (new, lines 463–478) | `Hilb(ℤ/2)`; Yang–Lee | `\|±1\|=1=FPdim`, standard structure pseudounitary, twist not; Yang–Lee `dim C=(5−√5)/2≈1.38 ≠ (5+√5)/2≈3.62`, only one pivotal structure, negative | both directions hold | none |
| CA2a Hilb(ℤ/2) twist Check (new, lines 540–546) | `χ(g)=−1` | `dim_L=dim_R=−1`: spherical, not pseudounitary, ratio `(−1)/(−1)=1` | sound | none |
| CA2a single point for unitary fusion (new, lines 499–503) | `Hilb(ℤ/3)`, `Hilb(S₃)` | `U=ℤ/3`, resp. `U=S₃` (pointed categories, U is the group); `ℝ>0` is torsion-free, so `Hom(U,ℝ>0)={1}` | sound | none |
| CA2a left duals as adjoints (new, lines 428–430) | `ev: x∨⊗x→1`, `coev: 1→x⊗x∨` | `(coev†, ev†)` has types `x⊗x∨→1`, `1→x∨⊗x`, i.e. `ExactPairing x∨ x`, so `x∨=ᘁx` | sound | none |
| CA2a sign ε vs pinned ν₂ (R02) | ℂ² in `Hilb_fd`; g in `Hilb(ℤ/2)`, standard and twisted | `ε(J)=−1`, `ε(J′)=+1`, `ν₂(ℂ²)=2`; `ε(g)=1=ν₂(g)`; twisted `ν₂(g)=−1` | pinned indicator uncited | R02 |
| CA2a FP uniqueness route (R02) | `Hilb(ℤ/2)` | standard character `(1,1)≥0`, equals FPdim; twisted `(1,−1)`, excluded | pinned lemma uncited; Layer 5 missing from contracts | R02 |
| CA2a/CA1a owner (R01) | this README; #1705; main QuantumGroups; #867; #1649 | lines 40–46, 444; #1705 ll. 33–41, 306; main l. 42, 253; #867 ll. 320–326; #1649 ll. 33–35 | two single-home claims | R01 |
| CA2b Penneys Thm C (headline) | `u₁—w—u₂`; TL Gram at δ=√2 | `P_(0,+)=ℂ²`, `P_(0,−)=ℂ`; `det=δ²(δ²−1)=2>0` | sound | none |
| CA3 normalizations | `Q=M_n`, n=2 | `mm†=n²=4`; `m′m′†=1`; `i′†i′=4`; `i′†m′=i†m`; wrong `d_Q⁻¹`: `n⁻²=¼`; `f′=2f`: `f′(1)=2·1=i₂′(1)` | sound | none |
| CA3 completion (headline) | `Hilb(ℤ/2)`, `Q=1⊕g`; `M_n` | `X=n₀1⊕n₁g`: `n₀²+n₁²=1=2n₀n₁` has no solution in ℕ; `M_n=ℂⁿ⊗(ℂⁿ)‾`, dim n² | sound | none |
| CA4 JP *Q-systems* Thm A, CP, Stinespring (headline) | trivial object; transpose on M₂; normalized trace of M₂ | `d_Q=1`; flip eigenvalue −1; minimal `K=M₂` (dim 4), trace not a vector state (density rank 2) | sound | none |
| CA5 JP *Realizations* Thm A (headline) | `N⋊ℤ/2`, `N⋊ℤ` | `d_Q=2`; ℤ: discrete, infinite index, not compact | sound | none |
| CA6 HPT *Anchored* Thm A (headline) | `V=C=Hilb_fd`, `x=ℂ^k`; `Hilb(ℤ)`; `P[0]=ℂ²` | `dim P[n]=k^n` vs `k^(2n)`; support infinite; `‖(1,0)‖²=½` vs 1 | sound | none |
| CA7 Katsura Thm 8.6 (headline) | `ℂⁿ`, n=1,2,3; zero action; `ℓ²(I)` uncountable | `(K₀,K₁)=(ℤ,ℤ),(0,0),(ℤ/2,0)`; `J_X=0`, `O_X=T_X`; `ℓ²(I)`: `(ℤ,0)` | sound | none |
| CA7 HP I Thm 5.25 (headline) | one loop μ=1; one edge (16,1); uncountable star | `C([−2,2])`: `(ℤ,0)`; `a=2`, `4=4`; `a=½`: ¼ vs 64; star `K₀` free on vertices by continuity | sound | none |
| CA7 HP I Thm 5.23 (repaired) | countable star; one edge; isolated vertex | `a_μ(c)=∞`, leaves `2>1`, `A=∅`; `v∈A` (1<16), locally finite, meets compacts; isolated v: `a=0<μ`, `p_v` compact on the vacuum | matches source (ll. 297, 1520, 1732) | none |
| CA8 HP II Thms A–C, Cor. 5.18 (headline) | TL(√2), A₃ | `K₀=ℤ³`; `[p₁]−[p₀]` trace `√2−1`, in Σ; `[p₁]` trace `√2`, in cone not Σ; `[p₀]−[p₂]` trace 0, in neither | sound | none |
| CA8 Watatani, Thm 6.13 | `δ²=2, (3+√5)/2, 3, 4`; `ℂ⊂ℂ²` | `N=3,3,4,5`; `Ind=(3,3/2)` vs `2·1`; basis count 2 in both | sound | none |
| CA9 HNP Thm A, transpose (headline) | Hilb, `F=−⊗ℂ^k`; pairs, `F(c₁,c₂)=(0,c₁)` | `F^t=−⊗(ℂ^k)‾`; dims 6 vs 1 for `c=(ℂ²,ℂ)`, `d=(ℂ,ℂ³)` | sound | none |
| CA9 existence and uniqueness (headline) | `R_λ`; `M_n`; `R_III₁` | `M_n⊗̄R_II₁≅R_II₁≠M_n`; `R_λ`: `σ_(t₀)` with `λ^(it₀)=−1` gives a modular generator, not isomorphic to the centrally free `id⊗α` | sound | none |
| CA9 Tomatsu Thm D, factor case (headline) | `Hilb(ℤ)` on `R_III₁`; `L(F₂)⊗̄B(ℓ²)` | `σ_(nt)` outer for n≠0, centrally trivial; flip outer (`b⁻ⁿhaⁿ` distinct), `M_ω=ℂ`, a=1 | sound | none |
| CA9 `T(R_III₁)={0}` route | `σ_T=Ad u`, `u=h^(iT)` | `ψ=φ(h⁻¹·)`: `σ_T^ψ=Ad(h^(−iT))∘Ad u=id`, so `Γ⊆(2π/T)ℤ≠ℝ` | sound | none |
| CA9 Kosaki basic extension | `σ=id⊕id`; `λ=1/5` | `Ind=4`, `E₁(e)=¼`; `Ind=5+5/4=25/4`, `E₁(e_E)=4/25` | sound | none |
| CA10 HPT *Classification* (headline) | `Hilb(ℤ/2)`, `Hilb(ℤ/3)`, `Hilb(S₃)`; `r=±id` | tube dims 4, 9, 36 = 1+1+4+9+9+4+4+4; `ū r u⁻¹=(−i)r(−i)=−r` | sound | none |

## Not verifiable

- **Kosaki 1986**, §3 and Lemma 3.2 (J. Funct. Anal. 66): recorded `uncertified`, paywalled. The README cites it through `Burns2011`, which I did not re-read this round; the previous review checked it.
- **Izumi 1993**, Theorem 3.5 (Math. Scand. 73): recorded `uncertified`. It is cited as recalled in `MasudaTomatsu2008` line 1638 (Theorem 4.16, p. 37), which I read.
- **Popa 1995**, Theorem 3.5(ii) and Corollary 4.4: recorded `uncertified`; no legal open copy. It is cited as recalled in `MasudaTomatsu2008` lines 1652–1663 (Theorem 4.18, p. 37), which I read.
- **Izumi 2003**, published page numbers (Amer. J. Math. 125): I could read only the arXiv text (`Izumi2003`). The README cites the arXiv printed pages and says so at line 2356.

## Source issues

- **Misprint** in `HPT2023Classification` at the introduction, printed p. 2 (line 81): the source lists the factor types as II₁, III∞ and III₁. It should read II₁, II∞ and III₁, as in its abstract (line 34) and §4 (line 803). Affects nothing.
- **Misprint** in `HartglassPenneys2014II` after Remark 4.18, printed p. 16 (lines 659–660): the source gives `A_n`, n≥3, as the principal graphs of TL(δ) for δ=2cos(π/k), k≥3. It should read k≥4, because k=3 gives δ=1 and graph A₂. Affects nothing.
