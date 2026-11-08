# Review of CategoricalOperatorAlgebras (pull request #888 at 0f636ea)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` (1943 lines) and `Suggested.lean` at `0f636ea`. The previous review read the same head, so nothing in the folder has changed. Every passage was read again, and the source sample was drawn afresh: 15 targets, seed = head + 7.

## Previous findings

- **R01 (P2), two open owners of the CA1a/CA2a objects: not repaired.** Nothing has changed on either side. #1705 is still at `36f87533`: its lines 20–22 still say "Layer 0 owns … elementary C*-categories with standard conjugates", and its §0.2 "C*-categories and standard conjugates" (line 217) still builds the dagger with `‖f†f‖=‖f‖²`, the dagger Karoubi completion, standard conjugate solutions with `d(X)≥1` and `bar(r) r=ε φ_X`. #1649 is still at `968db790`, with its §0.3 at line 236. Neither head mentions "CategoricalOperatorAlgebras". The description's merge-order paragraph still names only #861, #1142 and #866, plus the checked #860. No repair report marks R01 as not actionable. It is carried below as R01.
- **R02–R05 of the report before last:** repaired, as the previous review recorded. Re-verified this round: Masuda–Tomatsu 2007 Lemma 8.2 at `MasudaTomatsu2007` line 3037 (p. 64), the general Katsura sequence, Henriques–Penneys 2015 Lemma 3.4 and Theorem 3.5, and PivotalSpherical Layer 11 on main.

## R01 (P2) — The C*-category and unitary-duality objects of CA1a and CA2a still have two open owners

**Location.** `README.md` lines 25–30: "C*-categories, their finite additive and Karoubi completion … (CA1a), and C*-tensor categories with solutions of the conjugate equations … (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". Also lines 1865–1867.

**Claim.** This roadmap is the single owner of these objects, and QuantumGroups consumes them.

**Witness.** On main this is true: `TauCetiRoadmap/QuantumGroups/README.md` line 42 cites "CategoricalOperatorAlgebras CA1a,CA2a". It is false at both open revisions of QuantumGroups:
- #1705 (`36f87533`), §0.2, line 217. It builds the dagger, the Karoubi completion with its universal property, standard conjugates, `d(X)≥1`, and the signed self-duality `bar(r) r=ε φ_X` with sign invariance.
- #1649 (`968db790`), §0.3, line 236. Same content.

Neither head cites this roadmap.

**Repair.** Unchanged, and nothing in this folder changes: it rightly keeps the ownership.
- **Preferred:** in #1705 and #1649, replace §0.2 (respectively §0.3) and the matching clause of their Layer 0 scope with citations of CA1a and CA2a, as main's line 42 does.
- **Otherwise:** state in this pull request's description that #1705 and #1649 are rebased to consume CA1a and CA2a before either merges.

**Test object.** A simple self-dual object's `bar(r) r=ε φ_X`. Today both #1705 line 243 and this README line 365 define it. After the repair only CA2a does.

## R02 (P3) — Most headline theorems carry their source only in the References, not at the claim

**Location.** Each of these headlines has no parenthesised locator in its sentence:
- line 391, CA2a, "Prove the canonical bijections between pseudounitary pivotal structures …";
- lines 593–599, CA3, "Q-system completeness iff every Q-system splits … QSys(QSys(C))≃QSys(C) … realization/inclusion biequivalence";
- lines 671–695, CA4;
- lines 781–787, CA5;
- line 874, CA6;
- lines 1017–1029, CA7, the free-graph trace, K-theory and `A(Λ,μ)`;
- lines 1109–1206, CA8, GJS index, `K₀(A_k)`, simplicity, ordered `K₀`, Watatani index and `N(δ²)` bases;
- line 1258, CA9, the biequivalence;
- line 1306, CA9, representation uniqueness;
- line 1802, CA10, the classification bijection.

Three more claims have a theorem number but no page: line 1519 "Tomatsu Proposition2.7" (the space is also missing), line 1595 "Tomatsu Theorem D", and line 1784 "Henriques–Penneys–Tener, Lemma 3.7".

**Claim.** Every theorem is sourced.

**Witness.** The house shape puts "the locator in parentheses at the claim". Here the theorem numbers sit only in the References list, at lines 1874–1935. CA2b (line 454) and CA7's Katsura targets (lines 937–967) show the required form.

**Repair.** Add these locators at the claims. Each was read in the cached text:
- **CA2a:** Penneys, Theorem A, p. 3 (`Penneys2018` line 122). For the uniqueness of balanced solutions (line 352), Proposition 3.24, p. 16, and Corollary 3.26, p. 18, with π=1.
- **CA3:** Chen–Hernández Palomares–Jones–Penneys, Theorem 3.36, p. 26 (`CHJP2021` line 1131); Corollary 3.37 (line 1164) for `QSys(QSys(C))`; Theorem A and Lemma B, p. 3 (lines 122, 131) for the realization.
- **CA4:** Jones–Penneys, *Operator algebras*, Theorems 3.8, p. 22; 3.20, p. 27; 3.24, p. 29; 4.18, p. 35; 4.28, p. 39; and 5.15, p. 51. Also Jones–Penneys, *Q-systems*, Theorem A, p. 1 (`JonesPenneys2017Qsystems` line 36).
- **CA5:** Jones–Penneys, *Realizations*, Theorem 5.35, p. 47, and Corollary 7.14, p. 62 (`JonesPenneys2017Realizations` lines 2317, 3091).
- **CA6:** Henriques–Penneys–Tener, *Anchored*, Theorem A, p. 3 (`HPT2023Anchored` line 94).
- **CA7:** Hartglass–Penneys I, Definitions 5.17–5.18 and Theorems 5.19–5.20 (pp. 35–36); Lemma 5.21, Theorem 5.23 and Corollary 5.24 (p. 39); Theorem 5.25 (p. 40) (`HartglassPenneys2014I` lines 1528–1754).
- **CA8:** Hartglass–Penneys II, Theorems A–C, pp. 2–3; Corollary 6.8; Definition 6.11 and Theorem 6.13, p. 27 (`HartglassPenneys2014II` lines 81–100, 1217–1232).
- **CA9:** Henriques–Nivedita–Penneys, Theorem 7.4, p. 38 (`HNP2024` line 1540); Henriques–Penneys 2020, Theorem 3.10, p. 14 (`HenriquesPenneys2020` line 651); Tomatsu, Proposition 2.7, p. 10, and Theorem D, p. 2 (Theorem 5.7, p. 47).
- **CA10:** Henriques–Penneys–Tener, *Classification*, §4, pp. 16–17 (`HPT2023Classification` lines 801–808), and Lemma 3.7, p. 10.

## R03 (P3) — The internal bicommutant theorem is cited to the wrong section

**Location.** `README.md` lines 1874–1876: "Jones–Penneys, *Operator algebras in rigid C*-tensor categories*, §§2–4, Theorems 3.8,3.20 and 4.28, for … representations, CP and bicommutants." The target is at lines 685–688: "Prove their weak-* closure equals the bicommutant".

**Claim.** The bicommutant result is in §§2–4, among Theorems 3.8, 3.20 and 4.28.

**Witness.** In `JonesPenneys2017Operator`:
- Theorem 3.8 (line 976) is algebra objects ↔ cyclic module categories.
- Theorem 3.20 (line 1216) is the *-version.
- Theorem 4.28 (line 1958) is Stinespring.
- The bicommutant is Theorem 5.15, "von Neumann bicommutant" (line 2638, p. 51), in §5.

**Repair.** Replace "§§2–4, Theorems 3.8,3.20 and 4.28" with "§§2–5, Theorems 3.8, 3.20, 3.24, 4.18, 4.28 and 5.15". Add "(Jones–Penneys, Theorem 5.15, p. 51)" at line 688.

## R04 (P3) — CA7 restricts the free-graph algebra to countable graphs; the source and the proofs need no countability

**Location.** `README.md` line 976: "For a countable undirected graph Λ with positive finite real vertex weights μ".

**Claim.** The construction and its theorems are for countable graphs.

**Witness.** Hartglass–Penneys I, Theorem B (`HartglassPenneys2014I` line 99), covers "an arbitrary undirected graph Λ". Theorem 5.25 (line 1753, p. 40) gives the K-equivalence "for any Λ", and Theorem 5.23 (p. 39) has no countability hypothesis.

**Repair.** Delete "countable" (take V in `Type u`), or state which target needs countability; none of them does:
- The README's K-isomorphism at line 1020 follows for any graph from its finite subgraphs, by K2.3's continuity over the directed system.
- The source states the `A(Λ,μ)` dichotomy (lines 1024–1027) for connected graphs with no countability hypothesis.
- For each positive y, the sum defining τ_μ (line 999) has only countably many nonzero terms, because `E(y)∈C₀(V)`.

**Test instance.** A star with uncountably many leaves, each of weight 1, and centre weight 2. This is a connected graph that is neither countable nor locally finite. `a_μ(centre)` is infinite and each leaf has `a_μ=2>1`, so A=∅. Today it is outside the statement; after the repair it is covered.

## R05 (P3) — Two CA8 definitions with a normalisation have no Check

**Location.** Lines 1183–1186 (the finite quasi-basis and Watatani index) and lines 1174–1176 (ordered `K₀` and scale pinned on A₀). CA8's three Checks (lines 1214–1220) test `N(δ²)`, TL box spaces and the A₃ graph only.

**Claim.** Each definition comes with discriminating Checks.

**Witness.** No Check computes a quasi-basis, an index value or an element of `K₀(A₀)^+` or `Σ(A₀)`. A wrong model is consistent with every stated Check: either "index = number of basis elements", or `K₀^+` taken as the coordinatewise cone of `ℤ^(VΓ)`.

**Repair.** Add these two Checks; their values are computed.
- **Quasi-basis.** Take `ℂ⊂ℂ²` with `E(a,b)=(a+2b)/3`. Then `u₁=e₁, v₁=3e₁, u₂=e₂, v₂=(3/2)e₂` is a quasi-basis: `e₁E(3x₁e₁)=x₁e₁` and `e₂E((3/2)x₂e₂)=x₂e₂`. Its index is `(3,3/2)`, central and not scalar. For `E(a,b)=(a+b)/2` the index is `2·1`. A count of basis elements gives 2 in both cases.
- **Ordered `K₀` of TL(√2).** Take `K₀(A₀)=ℤ³` on the vertices `(f₀,f₁,f₂)` with the root normalisation `τ_*(a,b,c)=a+√2b+c`. Then `[p_(f₁)]−[p_(f₀)]` has trace `√2−1∈(0,1)`, so it lies in `Σ(A₀)` although it is not coordinatewise positive. `[p_(f₀)]−[p_(f₂)]` has trace 0, so neither it nor its negative is positive. The strict inequality in the cone formula is what makes this so.

## R06 (P3) — Title and opening paragraph are not in the house form

**Location.** Line 1, "# Categorical operator algebras and planar constructions", and lines 3–8, an unlabelled opening paragraph.

**Claim.** The README follows the roadmap shape.

**Witness.** The shape asks for `# Roadmap: <lower-case title>` followed by a `**Summary.**` paragraph. On main, 99 of 150 roadmap READMEs use the `# Roadmap:` title, among them this roadmap's suppliers VonNeumannAlgebras and Subfactors.

**Repair.** Retitle the README "# Roadmap: categorical operator algebras and planar constructions" and begin line 3 with "**Summary.**". Keep the CA1–CA10 headings and ids: QuantumGroups line 42 on main and TemperleyLiebOperatorAlgebras cite CA1a and CA2a.

## Verified sound

**Gate and build.**
- `gate … --base origin/main` at `0f636ea` exits 0. Every check is 0, including `set_option`, `latex`, `prnum`, `sorry-data`, `sorry-examples`, `statement-hygiene`, `layer-ids`, `target-ids`, `readme-ids-missing`, `depcheck`, `stray-files` and `outside-folder`; the line ends `OK`. The worker's run also has `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.OA"`).
- `lake env lean TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` exits 0 in 8.7 s with no diagnostic. The file declares nothing (one docstring, an empty namespace), so there is no `#check` signature comparison, no one-tactic probe and no padding.
- Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`.

**Dependency check.** `gate --depcheck … --movable --content …` prints `depcheck: 236 roadmaps, 2419 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In the merge order: VonNeumannAlgebras is 5, CStarAlgebras 7, HilbertModules 8, OperatorKTheory 9, Subfactors 207, this roadmap 228, CStarClassification 229 (a scope pointer, not a supplier) and TemperleyLiebOperatorAlgebras 244 (a consumer). No gaps are declared, because the board package has no `design/plan.json`.

**Headline theorems and `Suggested.lean`.** The headlines:
- CA2a: Penneys, Theorem A.
- CA2b: Penneys, Theorem C, and Coles–Huston–Penneys–Srinivas, Theorem A.
- CA3: Theorem 3.36, Corollary 3.37 and Theorem A.
- CA4: Jones–Penneys, *Q-systems*, Theorem A.
- CA5: Theorem 5.35 and Corollary 7.14.
- CA6: Henriques–Penneys–Tener, *Anchored*, Theorem A.
- CA7: Katsura, Theorem 8.6, and Hartglass–Penneys I, Theorems 5.23 and 5.25.
- CA8: Hartglass–Penneys II, Theorems A–C and 6.13, and the GJS index δ².
- CA9: Henriques–Nivedita–Penneys, Theorem 7.4; Henriques–Penneys 2015, Theorem 3.5; Henriques–Penneys 2020, Theorem 3.10; Tomatsu, Theorem D, factor case.
- CA10: the classification bijection.

The docstring names all ten layers with the carrier each lacks. At the pins:
- Mathlib has `VonNeumannAlgebra` (`Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:67`), `CStarModule` (`Mathlib/Analysis/CStarAlgebra/Module/Defs.lean:72`), `HalfBraiding` (`Mathlib/CategoryTheory/Monoidal/Center.lean:53`), `EndMonoidal` (`Mathlib/CategoryTheory/Bicategory/End.lean:24`), `exactPairingCongrLeft` (`Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:596`) and `Mathlib/CategoryTheory/Monoidal/DayConvolution.lean`.
- Tau Ceti has `TauCeti.exactPairingCongrLeft_evaluation` (`TauCeti/CategoryTheory/Monoidal/Rigid/Basic.lean:44`), `Rigid/Functor.lean` and `Rigid/DoubleDual.lean`.
- Greps of both libraries for `class .*Dagger`, `DaggerCategory`, `CStarCategory`, `WStarCategory`, `PlanarAlgebra`, `CuntzPimsner`, `Hyperfinite`, `JonesIndex` and `QSystem` find nothing. `IsFactor` hits only `Mathlib/Dynamics/Flow.lean` and Tau Ceti's `IsFactorSet` (2-cocycles). Tau Ceti's `Analysis/CStarAlgebra` holds only two character files, with no K-theory.

So no headline is statable at the pins, and an empty file is correct.

**Cross-roadmap citations resolved.**
- **CStarAlgebras, now on main.** Layer 4 (line 984, with Stinespring C4.2 at line 1021) and C5.4–C5.5 (lines 1203, 1230).
- **HilbertModules #861 (`bbc2ad54`).** H1 (line 126), H2 (179), H3 (262).
- **OperatorKTheory #866, now at `1377338a`.** K2.3 (line 599: continuity, Morita invariance for σ-unital algebras, agreement with full-corner maps); K3.2 (line 761: the six-term sequence of every extension, no separability); K4–K6 (lines 932, 1127, 1301); K7.6 (line 1903, Toeplitz–Cuntz and Cuntz algebras).
- **VonNeumannAlgebras on main.** V4.Normality (line 1124), Layers 5, 6, 11, 12 and 13 (lines 1339, 1495, 2785, 3388, 3688), V13b.SpatialNorm (line 70).
- **Subfactors on main.** 1.1–1.2, 2.1–2.5, 3.2–3.3, 5.1, 6.1–6.4, 7.1–7.2, 8.1–8.2 and Layer 9 (lines 308–1505). Line 72 assigns Q-systems and module categories here.
- **On main as well:** FreeProbability F2–F4 (lines 184, 255, 353); OperatorAlgebraDynamics D6, which owns `O_n` (line 457); PivotalSpherical Layers 0–4 (lines 257–387), 9 (line 537) and 11 (line 626); Subfactors 9.1–9.2 (lines 1507, 1529).
- **Consumers.** TemperleyLiebOperatorAlgebras #867 (`7cf3feef`) cites CA1a and CA2a at lines 106, 323 and 1339, with Layer 3 at line 1272. QuantumGroups line 42 on main.

**Ownership by object.** `roadmaps grep -i --readme-only` was run over main and the open heads:
- "Cuntz.Pimsner", "anchored planar", "Katsura", "Ocneanu ultra", "Watatani" and "free graph algebra" occur only here.
- "Q-system" hits outside this folder are Subfactors line 72 (handing Q-systems here), HabiroNahmSeries (Nahm q-systems) and RefinedTraceMethods (a "Q-system envelope" of rigid categories): different objects.
- "tube algebra" in ArcTopologyAndDescent is rigid-analytic tubes, also a different object.
- "W*-categor" occurs in #867 only as a consumer.
- "unitary dual functor" outside this folder: QuantumGroups lines 253 and 425 on main, which consume CA2a; #1705, #1649 (R01); #867 as a consumer.
- "Longo.Roberts" on main: Subfactors line 495, the conjugate equations of bifinite bimodules (2.4). That is an instance this roadmap consumes, not the general C*-tensor theory of CA2a.
- "bicommutant categor" occurs only here.
- "GJS" on main: Subfactors 8.2 (lines 1428–1430), the shaded von Neumann models. CA8 consumes them and builds only the C*-towers and the unshaded version. The hit in EtaleHomotopyTypes (#1806) is an unrelated string.
- The C*-category and standard-conjugate objects have the double ownership of R01.

The overlaps listing names no pull request that changes this roadmap and no dropped id, and `roadmaps resolve` reports nothing unresolved.

**Source sample.** All 15 seeded targets were read in the cached arXiv texts, which are certified in `sources.toml`; every one supports the README as written, with the same hypotheses:
- **(2)** Linking algebras and the Karoubi universal property. No locator (R02). Henriques–Nivedita–Penneys's idempotent completion (`HNP2024` line 403) agrees.
- **(5)** W*-Cauchy completion: Definitions 3.7 and 3.10, pp. 11–12 (lines 445, 489), and (BC)^⊕=Hilb (line 500).
- **(7)** Balanced solutions: Penneys, Proposition 3.24, p. 16.
- **(18)** Jones–Penneys, Theorems 3.8, 3.20 and 3.24.
- **(19)** Theorem 4.28, p. 39.
- **(20)** Theorem 5.15, p. 51 (R03).
- **(24)** The representability criterion, a README-owned lemma, checked by hand: with semisimple V, representable means finite support.
- **(26)** Henriques–Penneys–Tener, *Classification*, §4.3, p. 17 (lines 865–867), and Remark 3.10, p. 14.
- **(27)** Katsura, Theorem 6.4, p. 14 (line 569).
- **(29)** Hartglass–Penneys I, Definition 5.17 (lines 1528–1535), Theorems 5.19–5.20 and 5.25 (R04).
- **(30)** Lemma 5.21 and Theorem 5.23, p. 39.
- **(35)** Henriques–Nivedita–Penneys, Theorem 7.4, p. 38, with generators standing (line 431).
- **(40)** Tomatsu §2.2, p. 5 (lines 215–228).
- **(41)** Masuda–Tomatsu 2007, Lemma 8.2, p. 64, with Definitions 8.1 and 3.12.
- **(46)** Tomatsu, Theorem D, p. 2, with countable Irr(C) at line 61.

### Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| CA1a C*-identity Check | `diag(2,1)`, op vs HS norm | `‖f†f‖=4=‖f‖²`; HS: `‖f‖₂²=5`, `‖f†f‖₂=√17` | discriminating | none |
| CA1a idempotent Check | `e=[[1,1],[0,0]]` | `e²=e`, `ee†=diag(2,0)`, `‖e‖=√2`, range projection `diag(1,0)`, `r≠i†` | as stated | none |
| CA1a W* sums (sample 5) | column `1/n`, `1/√n` | `Σ1/n²=π²/6`; `Σ1/n=∞`; HNP Def 3.10 = README | correct | none |
| CA1a `C([0,1])` not W* | projections | `{0,1}`, span `ℂ≠C([0,1])` | as stated | none |
| CA1a Karoubi (sample 2) | one object `End=ℂ` | finite completion `Hilb_fd`, W*-completion has `ℓ²` | correct, unlocated | R02 |
| CA1b unitor | `A=ℂ²` on `ℂ`; zero action | `A⊗_A X=ℂ`; zero action: all inner products 0, `A⊗_A X=0` | as stated | none |
| CA1b reversal | `ℂⁿ` | dims `n²` and 1; `ℂⁿ∘ℂⁿ` needs `M_n=ℂ`, fails n≥2 | as stated | none |
| CA1b `J` on `M₂` | `J(ξ)=ξ*` | `J(b*ξa*)=aξ*b` | as stated | none |
| CA2a balanced uniqueness (sample 7) | Penneys 3.24, π=1 | unique up to unique unitary, phase in U(1) | correct, unlocated | R02 |
| CA2a sign Checks | `J(a,b)=(−b̄,ā)`, `J′`, `J(a)=cā`, `J⊗J` | `J²=−1`, `J′²=1`, `|c|²=1`, `(J⊗J)²=(−1)(−1)=+1` | as stated | none |
| CA2a Thm A (headline) | `Hilb(ℤ/2)`; pair groupoid | `χ²=1⇒χ=1` in `ℝ>0`, `±1` in `ℂ^×`; `t>0` family; source line 122 `π=dim_L/dim_R` | README = source | R02 |
| CA2a spherical state | t=4 | `w_R=4w_L`; (1/5,4/5): `2/5=2/5`; equal weights: 1 vs 1/4 | discriminating | none |
| CA2b TL Gram | δ=√2, 1 | `det=δ²(δ²−1)`=2, 0 | positive iff δ>1 | none |
| CA3 normalisation | `M₂`, `⟨x,y⟩=½Tr` | `mm†=4`, `i†i=1`; `m′m′†=1`, `i′†i′=4`; `m/4` gives 1/4 | as stated | none |
| CA3 morphism rescaling | `f:ℂ→M_n` | `f′=nf`, `f′(i₁′(1))=n·1=i₂′(1)`; unscaled 1≠n | as stated | none |
| CA3 balanced projector | rows ⊗ columns over `M_n` | range dim 1 in dim `n²` | as stated | none |
| CA3 completion (headline) | CHJP 3.36, 3.37, Thm A | complete ⇔ all Q-systems split; Assumption 2.7 = README's local hypothesis | README = source | R02 |
| CA4 internal algebras (sample 18) | JP 3.8/3.20/3.24 | algebra ↔ cyclic module category; *-version; W* with normal maps | README = source | R02 |
| CA4 Stinespring (sample 19) | `½Tr` on `M₂` | minimal `K=M₂`, dim 4; `K=ℂ²` forces vector state, density rank 2 | discriminating | none |
| CA4 bicommutant (sample 20) | JP 5.15 | weak-* closure = bicommutant, §5 p. 51 | statement right, locator wrong | R03 |
| CA4 transpose | `Σe_ij⊗e_ij` | image = flip, eigenvalue −1 | not CP | none |
| CA4 compact objects (headline) | JP *Q-systems* Thm A | normalized irreducible Q-systems, involutive morphisms | README = source | R02 |
| CA5 (headline) | JP 5.35, 7.14; `N⋊ℤ/2`, `N⋊ℤ` | `d_Q=2=[M:N]`; ℤ: irreducible, index ∞ | README = source | R02 |
| CA6 Thm A (headline) | HPT Thm A line 94 | ribbon: spherical ↔ spherical state | README = source | R02 |
| CA6 representability (sample 24) | `Hilb(ℤ)`; `Hilb(ℤ/2)` | support ℤ infinite; support 2, `Tr_V(ℂ)=1⊕g` | correct | none |
| CA6 connectedness (sample 26) | HPT §4.3, Rem 3.10 | `Φ:Z(C)→M` fully faithful ⇔ `P[0]` connected; then `P[0]=1_V` | README = source | none |
| CA6 pairing Check | `P[0]=ℂ²`, ψ=mean | `‖(1,0)‖²=1/2` vs 1 | discriminating | none |
| CA6 boxes | `x=ℂ²`, n=3 | `2³=8` vs `2⁶=64` | discriminating | none |
| CA7 gauge uniqueness (sample 27) | Katsura 6.4 | iso ⇔ injective + gauge action | README = source | none |
| CA7 six-term (headline) | `ℂⁿ`, n=1,2,3; zero action | first map `1−n`; n=3: `ℤ/2`, 0; n=1: ℤ, ℤ; zero action `J_X=0`, `O_X=T_X` | correct | none |
| CA7 `ℓ²(I)` Check | I uncountable | `J_X=0`; `K₀=ℤ[1]`, `K₁=0` | correct | none |
| CA7 weighted moments (sample 29) | µ=(16,1) | `E(x†x)=a²p_w`, `E(xx†)=a⁻²p_v`; a=2: 4=4; a=1/2: 1/4, 64 | orientation = HP Def 5.17 | none |
| CA7 K-theory (sample 29) | HP Thm 5.25 | KK-equivalence "for any Λ"; README requires countable | narrower than source | R04 |
| CA7 `A(Λ,µ)` (sample 30) | one edge; one loop; FP weights | v∈A, w∉A; loop `a_µ=1`, A=∅, `C([−2,2])`; `a_µ(v)=δd_v>d_v` | README = HP 5.21/5.23 | R04 |
| CA8 `N(δ²)` | 2, 2.618, 3, 4 | 3, 3, 4, 5 | = HP Def 6.11 | none |
| CA8 TL(√2) | A₃ | `√2=√2·1`, `1+1=√2·√2`; 3 vertices, `K₀=ℤ³` | as stated | none |
| CA8 sharpness (headline) | HP 6.13 | "for every δ there exists" a planar algebra; TL depth ≥2 at δ²=2,3,≥4 | existential, as stated | R02 |
| CA8 quasi-basis | `ℂ⊂ℂ²`, λ=1/3, 1/2 | index `(3,3/2)`, `2·1`; count 2 both | no Check exists | R05 |
| CA8 ordered `K₀` | TL(√2), `τ_*=a+√2b+c` | `(−1,1,0)↦√2−1∈Σ`; `(1,0,−1)↦0` neither sign | no Check exists | R05 |
| CA9 biequivalence (sample 35) | HNP 7.4 | vN2≃W*Cat, generators standing; README right modules = HNP footnote convention | README = source | R02 |
| CA9 ultrapower (sample 40) | Tomatsu §2.2; `M_n` | `M_ω⊂M′∩M^ω`; `M_n^ω=M_n`, `(M_n)_ω=ℂ` | README = source | none |
| CA9 central ⇒ strong (sample 41) | MT 8.2, K=ℂ | Def 8.1(4) ↔ README via `a↦a*` | equivalent | none |
| CA9 Thm D factor (sample 46) | factor M | `Z(M)=ℂ`, state automatic; countable Irr | README = source | R02 (page) |
| CA9 absorption | `M_n`, `R_λ` | `M_n⊗̄R₁≅R₁≠M_n`; `R_λ⊗̄R₁≅R_λ` | as stated | none |
| CA9 uniqueness (headline) | HP2020 3.10 | both II or both III₁, separable preduals | README = source | R02 |
| CA9 End_rev Check | `u=diag(1,i)`, `v=σ_x` | `uv=[[0,1],[i,0]]`, `vu=[[0,i],[1,0]]`; ratio −i vs i | not proportional | none |
| CA9 II∞ n=2 | Cuntz pair | `(D(τ/2):Dτ)_t=2^(−it)`, `ρ̃(u_t)=u_t` | as stated | none |
| CA9 cocycle conjugacy | `β_X=Ad(w_X)γα_Xγ⁻¹` | `β_Xβ_Y=Ad(w_Xγα_Xγ⁻¹(w_Y)γ(c^α)w_(X⊗Y)*)β_(X⊗Y)` | = line 1590 | none |
| CA9 left inverse | `c r∈(id,α_X̄α_X)` | `φ_X(α_X(y))=r*c*cry=y` | as stated | none |
| CA9 corner model | `T=1⊗e_(1,pt)`; `M=ℂ` | `T*T=1`, `TT*=1⊗e₁₁`; Hom dim 2, corners 1 and 4 | as stated | none |
| CA9 transpose on pairs | `c=(ℂ²,ℂ)`, `d=(ℂ,ℂ³)` | 6 vs 1 | discriminating | none |
| CA9 Følner | `K=Irr(C)` | `Z≺X⊗(X̄⊗Z)`, `F·K=K` | as stated | none |
| CA9 standardizability | `B(ℓ²)` | separable right modules with unital left `B(ℓ²)` have multiplicity ℵ₀, ≅`L²`; uncountable ones not separable | consistent | none |
| CA10 tube algebras | `Hilb(ℤ/2)`, `Hilb(ℤ/3)`, `Hilb(S₃)` | 4, 9, 36; `1+1+4+9+9+4+4+4=36=6²` | as stated | none |
| CA10 conjugate real structures | `u=i·id` | `ūru⁻¹=(−i)r(−i)=−r` | as stated | none |
| CA10 classification (headline) | HPT §4 lines 805–808 | real objects up to conjugacy ↔ connected finite-depth UAPAs in `Z(C)^rev`, R of type II₁, II∞, III₁ | README = source | R02 |
| Scope single owner | main QG 42; #1705; #1649 | main cites CA1a,CA2a; §0.2 line 217, §0.3 line 236; 0 mentions | two owners | R01 |

## Not verifiable

- None. Every sampled locator was read in the cached arXiv texts, and no manifest was edited.

## Source issues

- **Misprint** in Henriques–Penneys–Tener, *Classification of finite depth objects in bicommutant categories* (`HPT2023Classification`), at §1, p. 2: the source lists the factor types as II₁, III∞ or III₁; it should be II₁, II∞ or III₁, as its abstract and §4 state; affects nothing.
- **Misprint** in Hartglass–Penneys, *C*-algebras from planar algebras II* (`HartglassPenneys2014II`), at Theorem C, p. 3: the source puts the positive cone of `K₀(A₀)` inside `K₀(A_k)`; it should be inside `K₀(A₀)`; affects nothing.
- **Misprint** in Masuda–Tomatsu 2009 (`MasudaTomatsu2008`), at Definition 2.4, p. 4: the source writes `Int(N)` as the intersection of `Aut(M)` with `Int₁(N)`; it should be `Aut(N)`; affects nothing.
