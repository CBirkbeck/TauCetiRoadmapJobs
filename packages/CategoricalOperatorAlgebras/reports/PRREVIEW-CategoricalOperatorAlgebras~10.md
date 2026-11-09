# Review of CategoricalOperatorAlgebras (pull request #888 at 2b38621)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` (2163 lines) and `Suggested.lean` (51 lines) at `2b38621`. Since `7a2845f`, the README has changed by 183 lines; `Suggested.lean` and `metadata.toml` have not. The source sample was drawn fresh: 15 of the 94 lines in CA1–CA10 that carry a page locator, using `shuf` seeded with the head SHA followed by `-10`, with no target chosen by its heading. Every passage was read, changed or not.

There are four findings:
- one P2: ownership of the CA1a/CA2a objects, still not settled with the QuantumGroups heads;
- three P3s in the new CA9 central-triviality material.

## Previous findings

- **Previous R01 (P2), "fully faithful ⇒ centrally free": repaired.**
  - Lines 1742–1745 now read: "For a unitary fusion category C and R the hyperfinite II∞ or III₁ factor, prove that a cocycle action α of C on R is centrally free exactly when it is fully faithful (Henriques–Penneys 2020, Lemma 3.6 and Corollary 3.8, p. 13)". This matches `HenriquesPenneys2020` lines 618–620.
  - Masuda–Tomatsu 2009, Theorem 4.12 is now a target (lines 1680–1699), with its proof route. HP2020 Lemma 3.9 is cited at lines 1756–1758, and `L(F₂)⊗̄B(ℓ²)` is a negative-control Check (lines 1859–1869).
  - The new text has three P3 defects of its own: R02, R03 and R04.
- **Previous R02 (P2), three open owners of the CA1a/CA2a objects: not repaired.** Lines 40–46 and 2057–2059 are unchanged. QuantumGroups #1649 has moved to `21777da` and still builds the objects. Carried below as **R01**.
- **Previous R03 (P3), `MonoidalFunctor`: repaired.** Lines 62–63, 101–104, 367–369, 470, 560, 956 and 967 now cite `Functor.Monoidal`, `NatTrans.IsMonoidal` and `LaxMonoidalFunctor`. All three resolve at the pin (see Verified sound), and no backticked `MonoidalFunctor` remains.
- **Previous R04 (P3), Example 6.16: repaired.** Lines 1276–1277 read "(Examples 6.15 and 6.16, p. 28)", and line 2110 reads "Examples 6.15–6.16 (p. 28)". In `HartglassPenneys2014II`, Example 6.16 is at line 1277, on the page whose marker is at line 1237 (p. 28).

## R01 (P2) — The CA1a/CA2a objects still have three open owners: this pull request, QuantumGroups #1649 and #1705

**Location.** `README.md` lines 40–46: "C*-categories, their finite additive and Karoubi completion and the finite-Hilbert and Hilbert-module examples (CA1a), and C*-tensor categories … signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". Lines 2057–2059 repeat this under Downstream consumers.

**Claim.** This roadmap is the only owner of these objects, and QuantumGroups consumes them.

**Witness.** In `TauCetiRoadmap/QuantumGroups/README.md`:
- #1649 at `21777da`: §0.1 (lines 170–207) builds the C*-category axioms, the dagger Karoubi completion, `Hilb_f`, standard solutions and `bar(r) r=ε φ_X` (line 194). Lines 34–35 say nothing is imported from this roadmap.
- #1705 at `0d7cbcc`: §0.2 (lines 220–268) builds the same objects and never names this roadmap.

**Repair.** QuantumGroups is on main, so it comes before this roadmap (position 227) in the supply direction. Both of its revisions now own these objects in Layer 0, and they do so to remove main's citation of CA1a/CA2a (main line 42). So follow that direction:
- In CA1a and CA2a, cite "QuantumGroups Layer 0" for the overlap. Cite the layer rather than a subsection, because the heads number it §0.1 and §0.2. The overlap is:
  - the C*-category axioms, finite linking algebras, finite orthogonal sums and projection splittings;
  - the dagger Karoubi completion and its universal property, and automatic contractivity;
  - `Hilb_f` and the Hilbert-module category;
  - C*-tensor categories, standard solutions and `d(X)`;
  - the signed self-duality `r̄r=εφ_x` and invariance of its sign.
- Keep here what Layer 0 does not build:
  - W*-categories and W*-Cauchy completion;
  - unitary dual functors and Penneys's Theorem A;
  - the grading groupoid and spherical states;
  - the braided sign law.
- Rewrite lines 40–46 and 2057–2059 to match. Keep the ids CA1a and CA2a: TemperleyLiebOperatorAlgebras #867 (`7cf3fee`) cites them at lines 106–107, 323–329, 1322, 1335 and 1339.
- Name the QuantumGroups revision in the description's merge-order paragraph.

Keeping ownership here instead would require QuantumGroups, the earlier roadmap, to consume this later one. That is the upward edge both revisions remove.

**Test object.** The sign ε of a simple self-dual object. It is defined today at this README's lines 390–392, at #1649 line 194 and at #1705 lines 245–246. After the repair only QuantumGroups Layer 0 defines it, and CA2a cites it.

## R02 (P3) — CA9 uses the type III index and the basic-extension tower, but names no supplier for either

**Location.** `README.md`:
- lines 1556–1557: "E_ρ=ρφ_ρ a conditional expectation, standard/minimal index d_ρ²";
- lines 1694–1696: "Popa's criterion for central non-triviality of the tower inclusions `M⊂M_n` of a finite-index endomorphism σ of R_III₁";
- the *Needs:* line at 1871–1872 and Dependencies at 1888–1889, which list only Subfactors 1.1–1.2 and 9.1–9.2.

**Claim.** CA9 needs no Subfactors index theory, and the type III tower `M⊂M_n` exists somewhere.

**Witness.** On main, Subfactors 2.5 owns the index of an expectation, including type III, as `Ind(E)=E⁻¹(1)` (line 553). Subfactors 2.4 owns sector dimension over properly infinite factors (line 499). Subfactors 2.1 builds the basic construction only from a trace-preserving `E_N` (line 389). No roadmap builds a type III basic extension.

**Repair.**
- Add Subfactors 2.4–2.5 to CA9's *Needs:* line and Dependencies.
- Add a CA9 target constructing the tower `σ(M)⊂M⊂M₁⊂⋯` of a finite-index endomorphism of an infinite factor, from Subfactors 2.5's inverse weight `E⁻¹`. Identify `M⊂M₁` with `σ̄(M)⊂M`, the identification Masuda–Tomatsu 2009 uses in the proof of Corollary 4.19 (`MasudaTomatsu2008` line 1671, p. 38).

**Tested.** For `σ=id⊕id`, `σ(M)=M⊗1⊂M⊗M₂(ℂ)` has minimal index 4, which equals `d(σ)²=2²`. Stating this value needs Subfactors 2.5's `Ind`.

## R03 (P3) — Four of the new CA9 statements are narrower than their sources

**Location.** `README.md`:
- lines 1663–1669: "On an infinite factor prove … (Theorem 4.6, p. 31), … (Lemma 4.7, p. 32), and that every modular endomorphism … is centrally trivial (Lemma 4.11, p. 34)";
- lines 1690–1694: "On R_III₁ prove … (Definition 4.13 and Lemma 4.15, p. 36); prove Izumi's criterion …".

**Claim.** Lemmas 4.7 and 4.11 hold on infinite factors, and Lemma 4.15 and Izumi's criterion are stated on R_III₁.

**Witness.** In `MasudaTomatsu2008`:
- Lemma 4.7 (line 1422) and Lemma 4.11 (line 1513) assume only that M is a factor.
- Lemma 4.15 (line 1606) assumes an infinite factor.
- Theorem 4.16 (Izumi, line 1639) holds for every type III₁ factor.

Of the three results in the first quoted sentence, only Theorem 4.6 (line 1401) assumes an infinite factor.

**Repair.**
- Keep "on an infinite factor" for Theorem 4.6 only.
- State Lemmas 4.7 and 4.11 for every factor, Lemma 4.15 for every infinite factor, and Theorem 4.16 for every type III₁ factor with separable predual.
- Keep R_III₁ for Theorem 4.18 and Corollary 4.19, which need hyperfiniteness.
- Add as a Check the README's own III_λ object, described under Tested.

**Tested.** On `R_λ`, `σ_(t₀)` is irreducible and modular, hence centrally trivial. It is not inner, since `t₀∉T(R_λ)`. Lemma 4.15 therefore makes `(id⊕σ_(t₀))(R_λ)⊂R_λ` not centrally non-trivial. This is an instance outside R_III₁ that the narrowed statement omits.

## R04 (P3) — Izumi's and Popa's criteria are cited only through Masuda–Tomatsu's restatements, and V13b's central triviality is not cited

**Location.** `README.md` lines 1692–1696: "prove Izumi's criterion … and Popa's criterion … in the forms of Theorems 4.16 and 4.18 (p. 37)". The References entry at lines 2134–2144 repeats this. The definition at lines 1661–1663 does not mention VonNeumannAlgebras V13b.

**Claim.** Masuda–Tomatsu 2009 is the source for these two targets, and the central-triviality notion here is new.

**Witness.**
- `MasudaTomatsu2008` line 1638 recalls Theorem 4.16 from Izumi [16, Theorem 3.5]. Lines 1652–1655 take Theorem 4.18 from Popa [29, Theorem 3.5(ii), Corollary 4.4], which Popa proves for centrally free subfactors. Neither theorem is proved in that paper.
- V13b on main (line 4036) owns `Ct(R_(0,1))=Int(R_(0,1))`.

**Repair.**
- At the claim and in the References, cite Izumi, *On type II and type III principal graphs of subfactors*, Math. Scand. 73 (1993), Theorem 3.5.
- Likewise cite Popa, *Classification of subfactors and their endomorphisms*, CBMS 86 (1995), Theorem 3.5(ii) and Corollary 4.4.
- Say that the centrally non-trivial form of Popa's criterion is Masuda–Tomatsu's extension (p. 37).
- After Definition 4.1, add one clause: on automorphisms, this is V13b's centrally trivial automorphisms.

**Tested.** Instance: `R_II∞` and an automorphism α. Here the Definition 4.1 notion and V13b's agree: both say α acts trivially on the central sequence algebra. V13b's `Ct(R_(0,1))=Int(R_(0,1))` is the automorphism case of the README's II∞ characterization.

## Verified sound

**Gate, build and form.**
- My run of `gate … --base origin/main` at `2b38621` exits 0 and ends `OK`. Every counter is 0: `set_option`, `blob`, `latex`, `tex`, `prnum`, `sorry-data`, `sorry-examples`, `residue`, `private-paths`, `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`, `statement-hygiene`, `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `outside-folder`, `source-material`. The worker's run also reports `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- `lake env lean TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` exits 0 in 13 s, with no diagnostic.
- Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`.
- The Lean file is `import Mathlib`, one module docstring titled "target signatures", and an empty `namespace TauCetiRoadmap.CategoricalOperatorAlgebras`. It has no declaration, so there was nothing to `#check` and no one-tactic probe to run, and nothing is padding.
- `roadmaps resolve` on the README finds no unresolved citation or Lean name.

**Dependency check.** `gate --depcheck … --movable --content …` prints `depcheck: 238 roadmaps, 2323 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Merge order: VonNeumannAlgebras 5, CStarAlgebras 7, HilbertModules 8, OperatorKTheory 9, Subfactors 206, this roadmap 227. TemperleyLiebOperatorAlgebras (243) is a consumer.
- On main: QuantumGroups, FreeProbability, PivotalSpherical, OperatorAlgebraDynamics, CStarAlgebras, HilbertModules, VonNeumannAlgebras and Subfactors.
- No gaps are declared. `overlaps.md` lists no dropped id and no other pull request changing this roadmap.

**Headline theorems.**
- CA2a: Penneys Theorem A.
- CA2b: Penneys Theorem C, and Coles–Huston–Penneys–Srinivas Theorem A.
- CA3: Chen–Hernández Palomares–Jones–Penneys Theorem 3.36, Corollary 3.37 and Theorem A.
- CA4: *Q-systems* Theorem A.
- CA5: *Realizations* Theorem 5.35 and Corollary 7.14.
- CA6: *Anchored* Theorem A.
- CA7: Katsura Theorem 8.6, and Hartglass–Penneys I Theorem 5.25.
- CA8: Hartglass–Penneys II Theorems A–C, Corollary 6.8 and Theorem 6.13.
- CA9: HNP Theorem 7.4, HP2015 Theorem 3.5, HP2020 Theorem 3.10, and the factor case of Tomatsu's Theorem D.
- CA10: the HPT §4 bijection.

The docstring names each of them with the carrier it lacks. Fixed-string searches of both pins return 0 files for each of `Dagger`, `CStarCategory`, `WStarCategory`, `PlanarAlgebra`, `CuntzPimsner`, `hyperfinite`, `QSystem`, `Watatani`, `FusionCategory`, `Pivotal`, `Ultrapower` and `TypeIII`. Tau Ceti's `K₀` files are homological Euler characteristics, not operator K-theory. So no headline is statable at the pins, and a file that declares nothing is correct.

**Library declarations opened at the pins (22):**
- Mathlib monoidal functors and transformations: `Functor.Monoidal` (`Mathlib/CategoryTheory/Monoidal/Functor.lean:389`), `Functor.LaxMonoidal` (`:65`), `LaxMonoidalFunctor` (`:1302`), `NatTrans.IsMonoidal` (`Mathlib/CategoryTheory/Monoidal/NaturalTransformation.lean:46`), and `Category (LaxMonoidalFunctor C D)` (`:183`, monoidal transformations as morphisms).
- Mathlib centre and monoids: `HalfBraiding` (`Monoidal/Center.lean:53`), `Center` (`:72`), `MonObj` (`Monoidal/Mon.lean:72`), `EndMonoidal` (`Bicategory/End.lean:24`), `Bicategory` (`Bicategory/Basic.lean:61`).
- Mathlib rigid and linear structure: `ExactPairing`, `HasRightDual` and `exactPairingCongrLeft` (`Monoidal/Rigid/Basic.lean:77, 236, 596`), `MonoidalPreadditive` (`Monoidal/Preadditive.lean:35`), `MonoidalLinear` (`Monoidal/Linear.lean:33`), `Karoubi` (`Idempotents/Karoubi.lean:43`).
- Mathlib analysis: `CStarModule` (`Analysis/CStarAlgebra/Module/Defs.lean:72`), `WithCStarModule` (`…/Module/Synonym.lean:59`), `VonNeumannAlgebra` (`Analysis/VonNeumannAlgebra/Basic.lean:67`), `CompletelyPositiveMap` (`Analysis/CStarAlgebra/CompletelyPositiveMap.lean:50`).
- Tau Ceti: `TauCeti.exactPairingCongrLeft_evaluation` (`TauCeti/CategoryTheory/Monoidal/Rigid/Basic.lean:44`), and the modules `Rigid/Functor.lean` and `Rigid/DoubleDual.lean`.

**Cross-roadmap citations resolved (main at `39d3d609`; open heads as named):**
- **VonNeumannAlgebras (main).**
  - V4 (line 970), with `V4.Normality` (line 244); V5 (1339); V6 (1495).
  - V11 (2785), with `T(M)`, `S(M)`, the Connes spectrum and its identification with `log(S(M)∖{0})` at lines 3071–3086, and `T(R_λ)=(2π/log λ)ℤ` at line 3082.
  - V12 (3388): tracial ultraproduct only (line 3435), so the general Ocneanu ultrapower is correctly owned here.
  - V13a/V13b (3690, 3740), with `ker mod = closure Int(R_(0,1))` at line 4037. This is the input for the flip in the II∞ route.
- **Subfactors (main).** 1.1 (308), 1.2 (340), 2.1–2.5 (387–536), 3.2 (697), 3.3 (774), 5.1 (1021), 6.1–6.4 (1089–1210), 7.1–7.2 (1248, 1272), 8.1–8.2 (1384, 1425), 9.1–9.2 (1507, 1529).
- **HilbertModules (main).** H1 126, H2 179, H3 262.
- **CStarAlgebras (main).** Layers 1–5 at 232–1110.
- **FreeProbability (main).** F2 184, F3 255, F4 353.
- **PivotalSpherical (main).** Layers 0–4 (257–387), 9 (537) and 11 (626).
- **OperatorAlgebraDynamics (main).** D6 (491), owning `O_n` (line 590).
- **OperatorKTheory, #866 at `1377338`.** K2.3 (599: continuity at 604, Morita invariance at 619), K3.2 (761), K4–K7 (932, 1127, 1301, 1496).
- **QuantumGroups.** Main lines 42, 61, 253 cite CA1a/CA2a. #1649 and #1705 are as in R01.
- **TemperleyLiebOperatorAlgebras, #867 at `7cf3fee`.** Cites CA1a/CA2a at the lines given in R01.
- **Ownership sweep.** `roadmaps grep` over 468 heads and main for Q-system, anchored planar, W*-category, Cuntz–Pimsner, unitary dual functor, tube algebra, Watatani, bicommutant category, centrally free, Ocneanu, C*-category, dagger category, centrally trivial and canonical extension. The hits outside this roadmap are:
  - the QuantumGroups heads (R01);
  - #867, a consumer;
  - VNA V13b's automorphism notions (R04);
  - unrelated "Ocneanu compactness", "Ocneanu trace", q-series and "tube" uses.

**Source sample (15 lines).** Each was read at its locator in the cached arXiv text, and all 15 support the README as written:
- **377:** `Penneys2018` Proposition 3.24 (line 730, p. 16) and Corollary 3.26 (line 826, p. 18).
- **521:** `CHPS2018` Theorem A (line 103, p. 3), with the body statement at line 424 (§2.3 at line 420, p. 10).
- **623:** `CHJP2021` Theorem 3.36 (line 1131) and Corollary 3.37 (line 1164), on printed pp. 26 and 27 (footers at lines 1138 and 1174). This matches the README's "printed page numbers" note.
- **704:** `JonesPenneys2017Operator` Theorem 3.8 (line 976, p. 22).
- **828:** `JonesPenneys2017Realizations` Theorems 7.2 (line 2948, p. 58) and 7.3 (line 2965, p. 59), and Corollary E (line 235, p. 6).
- **1003–1004:** `Katsura2004` Proposition B.5 (line 1032, p. 24, with no separability) and Proposition 8.1 (line 715, p. 17).
- **1034:** `HartglassPenneys2014I` Definitions 5.17–5.18 (lines 1528–1538, p. 35).
- **1224:** `HartglassPenneys2014II` Theorem A (line 81, p. 2) and Corollary 4.16 (line 642, p. 15).
- **1261:** Lemma 6.6, Proposition 6.7 and Corollary 6.8 (lines 1211–1217, p. 27).
- **1300:** Remark 5.17 (line 1127, p. 25).
- **1352:** `HNP2024` Theorem A (line 37, p. 2) and Theorem 7.4 (line 1540, p. 38, `A↦A-Mod`).
- **1373:** `HenriquesPenneys2020` Theorem A (line 80, p. 2) and Theorem 5.18 (line 1276, p. 28).
- **1562:** `Tomatsu2018` §2.2 (table of contents, line 157: p. 5) and `MasudaTomatsu2008` §2.4 (line 173, p. 5).
- **1616:** `Tomatsu2018` Proposition 2.7 (line 457, p. 10) and §2.4 (p. 8).

**New CA9 locators, all checked at the text:**
- `MasudaTomatsu2008`:
  - Definition 4.1 (line 1364, p. 30), Theorem 4.6 (1401, p. 31), Lemma 4.7 (1422, p. 32);
  - Propositions 4.8–4.9 (1464, 1478, p. 33), Lemmas 4.10–4.11 (1494, 1513, p. 34);
  - Theorem 4.12 (1534, p. 35), Definition 4.13 (1580) and Lemma 4.15 (1606), both p. 36;
  - Theorems 4.16 and 4.18 (1639, 1656, p. 37) and Corollary 4.19 (1664, p. 38).
- `MasudaTomatsu2007` Definition 8.1 (line 3030, p. 64) and Lemma 8.3 (line 3071, p. 65).
- `HenriquesPenneys2020` Lemma 3.6, Theorem 3.7, Corollary 3.8 and Lemma 3.9 (lines 608–631, p. 13).
- `HenriquesPenneys2015` Lemma 3.4 (line 886, p. 16) and Theorem 3.5 (line 910, p. 17).
- `HenriquesPenneys2020` Theorem 3.15 and Corollary 3.16 (lines 776, 789, p. 16) and Theorem 6.8 (line 1866, p. 37).

### Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 377 balanced solutions (Penneys 3.24/3.26) | simple c, π trivial | rescale ev, coev by inverse scalars so `π(gr c)·ev ev†=coev†coev`; unique up to a phase (lines 733–736) | supported, applies objectwise | none |
| 521 CHPS Theorem A | P over itself | basepoint `1₊`, `Tr(id)=1`; fusion graph = principal graph; §2.3 says "indecomposable … simple basepoint" | supported | none |
| 623 CHJP 3.36/3.37 | `Q=1⊕g` in `Hilb(ℤ/2)` | `X=n₀1⊕n₁g`: `X⊗X̄=(n₀²+n₁²)1⊕2n₀n₁g`; `n₀²+n₁²=1=2n₀n₁` has no solution in ℕ | Q does not split, so completion is needed | none |
| 704 JP Theorem 3.8 | `A(a)=Hom(a,1)` | cyclic module = C with basepoint 1 | supported | none |
| 828 Realizations 7.2–7.3, Corollary E | `N⊆N⋊ℤ/2` | `d_Q=2=[M:N]`; intermediate objects ↔ intermediate subfactors | supported | none |
| 1003–1004 Katsura B.5, 8.1 | `X=ℂⁿ`, n=1,2,3 | first map `1−n`: n=1 gives `ℤ`,`ℤ`; n=2 gives `0`,`0`; n=3 gives `ℤ/2`,`0` | supported | none |
| 1034 HP I Definitions 5.17–5.18 | `μ=(16,1)`; loop | `a=16^(1/4)=2`: moments `4=4`; reciprocal `a=½`: `¼` vs `64`; loop `T=L+L†` | supported | none |
| 1224 HP II Theorem A | shaded TL | `A_(n,±)∼A_(n+1,∓)` (line 83); `A₀∼A_k` (line 642) | supported | none |
| 1261 HP II 6.6–6.8 | TL(√2) | `[A₁:A₀]=δ²=2` (line 1274); `N(2)=3` | supported | none |
| 1300 HP II Remark 5.17 | `f(0)`, `f(2)` in TL(√2) | `Tr=1` for both; `τ_*([p_f0]−[p_f2])=0`, classes differ | supported | none |
| 1352 HNP Theorem 7.4 | handedness | source `A↦A-Mod` (left); README right modules, "there with left modules" | consistent | none |
| 1373 HP2020 Theorem A | semisimple rigid C | line 1276: every fully faithful rep extends uniquely to a positive one | supported | none |
| 1562 ultrapower | `M_n`, `L(F₂)`, R | `M_n^ω=M_n`, `(M_n)_ω=ℂ`; `L(F₂)_ω=ℂ`; `R_ω≠ℂ` | supported | none |
| 1616 Tomatsu Proposition 2.7 | inner amplification n=2 | `d_ρ=r=2`, `τ∘φ_ρ=τ/2`; same rank ⇒ approximately unitarily equivalent | supported | none |
| CA2a Theorem A (headline) | `Hilb(ℤ/2)`; `End†(Hilb_fd⊕Hilb_fd)` at t=4 | `χ²=1⇒χ=1` in `ℝ>0` (`±1` in `ℂ×`); `dim_L=2`, `dim_R=½`: ratio 4, product 1; weights (⅕,⅘): `2/5=2/5`; equal weights: `1` vs `¼` | as stated | none |
| CA2a sign law | `J(a,b)=(−b̄,ā)`, `J⊗J`; ℂ | `J²=−1`; `(J⊗J)²=+1=(−1)(−1)`; on ℂ `J²=|c|²=1` | as stated | none |
| CA2b Theorem C (headline) | `u₁—w—u₂`; TL Gram | `P_(0,+)=ℂ²`, `P_(0,−)=ℂ`; `det=δ²(δ²−1)`: 2 at δ=√2, 0 at δ=1 | as stated | none |
| CA3 normalisation | `M_n`, `⟨x,y⟩=n⁻¹Tr(x*y)` | `m†(z)=nΣz_il e_ij⊗e_jl`, `mm†=n²`; `m′=n⁻¹m`: `m′m′†=1`, `i′†i′=n²`; wrong `d_Q⁻¹m`: `n⁻²` | as stated | none |
| CA3 morphism rescaling | `f:ℂ→M_n` | `f′=nf`; `f′(1)=n·1=i₂′(1)`; unscaled: `1≠n` | as stated | none |
| CA4 Theorem A (headline) | trivial object; `½Tr` on `M₂` | `d_Q=1`; Stinespring `dim K=4`; density `½·1` has rank 2, so not a vector state | discriminating | none |
| CA5 (headline) | `N⋊ℤ/2`, `N⋊ℤ` | `d_Q=2`; ℤ: connected, infinite index, not compact | as stated | none |
| CA6 (headline) | `V=C=Hilb_fd`, `x=ℂ^k`; `Hilb(ℤ)` | `dim P[n]=k^n` vs `k^(2n)`; `Hilb(ℤ)` support infinite | discriminating | none |
| CA7 Katsura 8.6 (headline) | `ℓ²(I)`, I uncountable | `φ(1)` not compact ⇒ `J_X=0` ⇒ `K₀=ℤ`, `K₁=0` | as stated | none |
| CA7 HP I 5.25 (headline) | one loop; uncountable star | loop: `C([−2,2])`, `K₀=ℤ`, `K₁=0`; star: `a_μ(c)=∞`, leaves `2>1`, `A=∅` | as stated | none |
| CA8 Theorems B–C and 6.13 (headline) | TL(√2); `δ²=2,3,4` | `K₀=ℤ³`; `√2−1∈(0,1)` lies in Σ; `N(δ²)=3,4,5` | as stated | none |
| CA8 Watatani Check | `ℂ⊂ℂ²`, `E=(a+2b)/3` | `Ind=(3,3/2)`; `E=(a+b)/2`: `2·1` | as stated | none |
| CA9 HNP 7.4 (headline) | `F=−⊗ℂ^k`; pairs | `F^t=−⊗(ℂ^k)‾`; pairs: `dim HS(ℂ²,ℂ³)=6` vs `dim HS(ℂ,ℂ)=1` | discriminating | none |
| CA9 HP2015 3.5 / Lemma 3.4 (headline) | `M_n`; `R_λ` | `M_n⊗̄R₁≅R₁≠M_n`; `R_λ⊗̄R₁≅R_λ` | type I correctly excluded | none |
| CA9 HP2020 3.10 (headline) | `R_λ`: `σ_(t₀)` vs `id⊗α` | centrally trivial vs centrally free, so not isomorphic | II/III₁ restriction needed and present | none |
| CA9 Theorem D (headline) | factor M | `Z(M)=ℂ`, so the invariant state is automatic; countable `Irr(C)` | as stated | none |
| Definition 4.1 | product flip on `R_II₁`; `L(F₂)⊗̄B(ℓ²)` | `α^ω[(v_n)]=−[(v_n)]≠[(v_n)]`; full factor `M_ω=ℂ`, so every ρ is centrally trivial | discriminating | none |
| Lemmas 4.7 and 4.11 | finite factor R | source assumes "a factor" (lines 1422, 1513); `End(R)_m=Int(R)⊂Cnd(R)` | README narrows to infinite factors | R03 |
| Lemma 4.15 | `R_λ`, `ρ=σ_(t₀)` | non-inner, irreducible, centrally trivial ⇒ `(id⊕ρ)(R_λ)⊂R_λ` not centrally non-trivial | README narrows to R_III₁ | R03 |
| `T(M)={0}` for III₁ | `R_λ`; III₁ | `λ^(2it₀)=1`, so `2t₀∈T` and `t₀∉T`; III₁: `σ_T^ψ=id` ⇒ `Γ⊆(2π/T)ℤ≠ℝ` | sound | none |
| Theorem 4.12, II∞ | `ρ=Ad u` | `Hom(id,ρ)=ℂu`; flip has `mod=1`, so approximately inner by V13b line 4037 | sound | none |
| Theorem 4.12, III₁ | `σ_t⊂ρρ̄`, t≠0 | `σ_(nt)⊂ρρ̄` for all n; distinct since `(n−m)t∉T={0}`; finite index ⇒ t=0 | = lines 1676–1681 | none |
| HP Corollary 3.8, converse | II∞; III₁ | II∞: `α_X` inner ⇒ `α_X≅α₁`; III₁: `d(X)=1`, `Xⁿ≅1` ⇒ `σ_(nt)` inner ⇒ t=0 | sound | none |
| HP Corollary 3.8, forward | `t∈Hom(id,α_X)` | `tx=α_X(x)t` on M extends to `M_ω`, so central freeness gives t=0; Frobenius gives full faithfulness | sound | none |
| III_λ Check | λ=½ | `t₀=π/log 2`; `λ^(it₀)=e^(−iπ)=−1`; `σ_(t₀)²=id`; `t₀∉(2π/log 2)ℤ` | correct | none |
| `Hilb(ℤ)` on R_III₁ Check | t=1 | `σ_n` outer for n≠0, since `T={0}`; modular ⇒ centrally trivial | correct | none |
| `L(F₂)⊗̄B(ℓ²)` Check | `b⁻ⁿhaⁿ` | equality for n≠m gives `h⁻¹bʲh=aʲ`; abelianization `(0,j)=(j,0)` ⇒ j=0 | φ outer; correct | none |
| CA9 minimal index | `σ=id⊕id` | `M⊗1⊂M⊗M₂`: minimal index `4=d(σ)²`; needs Subfactors 2.5 `Ind` | supplier not named | R02 |
| Popa's tower `M⊂M_n` | type III `σ(M)⊂M` | Subfactors 2.1 needs a trace-preserving `E_N` (line 389) | no owner | R02 |
| Izumi/Popa targets | MT2009 p. 37 | lines 1638, 1652–1655: restatements only; Popa proved the centrally free case | primary sources missing | R04 |
| Single owner of ε | this README; #1649; #1705 | lines 390–392; line 194; lines 245–246 | three definitions | R01 |
| CA10 classification (headline) | unit object, `r=±id` | `u=i·id`: `ū r u⁻¹=(−i)(−i)r=−r` | conjugate | none |
| CA10 tube algebras | `Hilb(ℤ/2)`, `Hilb(ℤ/3)`, `Hilb(S₃)` | dimensions 4, 9, 36; `D(S₃)`: `1+1+4+9+9+4+4+4=36` | as stated | none |
| Mathlib names | the three cited names | `Functor.lean:389`, `NaturalTransformation.lean:46`, `Functor.lean:1302` | resolve | none |

## Not verifiable

- **Popa's criterion.** Popa, *Classification of subfactors and their endomorphisms* (CBMS 86, AMS 1995), Theorem 3.5(ii) and Corollary 4.4, is an AMS book with no legal open copy found. So I could not check the statement R04 asks the README to cite. In particular, I could not check that Popa's proof carries over from centrally free to centrally non-trivial subfactors, which `MasudaTomatsu2008` lines 1654–1655 assert without proof.
- **Izumi 1993.** I did not fetch Izumi, Math. Scand. 73 (1993), Theorem 3.5, because the README does not cite it. MT2009 attributes Theorem 4.16 to it.
- **Tomatsu's strong-freeness quantifiers** (`Tomatsu2018` lines 718–720). The extraction renders both `M^ω` and `M_ω` as "Mω", so the README's reading at lines 1585–1587 cannot be checked against the text. Central freeness, which the theorems use, is unambiguous (line 716).
- No manifest was edited.

## Source issues

- **Gap** in `HartglassPenneys2014I` at Theorem 5.25, p. 40: the source proves the infinite case by writing the graph as an increasing union of finite subgraphs, which exists only for countable graphs; it should use the directed system of finite edge-subgraphs; affects the proof.
- **Misprint** in `HPT2023Classification` at §1, p. 2: the source lists the factor types as II₁, III∞ or III₁; it should be II₁, II∞ or III₁, as its abstract and §4 state; affects nothing.
- **Misprint** in `HartglassPenneys2014II` at Theorem C, p. 3: the source writes the positive cone of `K₀(A₀)` as a subset of `K₀(A_k)`; it should be a subset of `K₀(A₀)`; affects nothing.
