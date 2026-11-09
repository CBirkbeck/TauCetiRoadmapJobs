# Review of CategoricalOperatorAlgebras (pull request #888 at 7a2845f)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` (2054 lines) and `Suggested.lean` (51 lines) at `7a2845f`. The folder has not changed since the previous review, which read the same head. Every passage was read again, and the source sample was drawn fresh: 15 of the 70 locator-bearing lines in CA1–CA10, seed = head + 9, none chosen by heading. Four findings. Two are new defects in this folder (R01, R03). One is new from the fresh sample (R04). The ownership finding carried from the previous rounds has got worse at a sibling head (R02).

## Previous findings

- **Previous R01 (P2), two open owners of the CA1a/CA2a objects: not repaired, and worse.** This folder is unchanged. Of the two QuantumGroups heads, #1705 (now `0d7cbcc`) still builds the objects in its §0.2. #1649 has moved from `cc02cfc6` to `ab56b1d` and has reversed its position. It no longer consumes CA1a/CA2a: its §0.1 now builds the same objects, and its scope (line 35) says nothing is imported from this roadmap. Carried below as **R02**, now against both heads.

## R01 (P2) — CA9: "fully faithful ⇒ centrally free" is missing its hypotheses, its locator and the input it rests on

**Location.** `README.md` lines 1691–1692, in the paragraph on Tomatsu's Theorem D, whose standing setting is "a properly infinite factor M with separable predual" (line 1684): "Prove fully faithful representations centrally free, and prove the induced-predual-map comparison for dualizable finite-depth endomorphisms". The CA9 *Needs:* line is at 1773–1774.

**Claim.** In that setting, every fully faithful representation is centrally free.

**Witness.** In the full factor `M=L(F₂)⊗̄B(ℓ²)`, `M_ω=ℂ`, so every a∈M satisfies `ax=α_X(x)a`. The outer free flip ⊗ id is then a fully faithful `Hilb(ℤ/2)`-representation that is not centrally free. `HenriquesPenneys2020` line 618 assumes C fusion and R hyperfinite II∞/III₁.

**Why the flip is outer.** If `Ad u` implemented the swap φ, then the coefficients of u would be constant on the twisted classes `{φ(h)gh⁻¹}`. These classes are infinite: `bⁿga⁻ⁿ` gives distinct elements for distinct n. So u=0, a contradiction.

**What the proof actually needs.** HP2020 derives Corollary 3.8 from Lemma 3.6 (line 608) and from Masuda–Tomatsu 2009, Theorem 4.12 with Lemma 4.10 (`MasudaTomatsu2008` lines 1534 and 1494, pp. 35 and 34). Theorem 4.12 says that the irreducible centrally trivial finite-index endomorphisms of a hyperfinite factor are the modular ones: inner for II∞, `Ad u∘σ_t^φ` for III_λ. No layer, *Needs:* line or supplier provides it. VonNeumannAlgebras treats centrally trivial *automorphisms* only (main, line 4030).

The type hypothesis is not decorative. HP2020's proof (lines 621–624) uses the fact that in III₁ a nontrivial `σ_t` has infinite order in Out. In III_λ, by contrast, `σ_t` has finite order in Out for suitable t, so a centrally trivial outer image can occur.

**Repair.**
- Replace the sentence with: "For a unitary fusion category C and R the hyperfinite II∞ or III₁ factor, prove that a representation C→End(R) is centrally free exactly when it is fully faithful (Henriques–Penneys 2020, Lemma 3.6 and Corollary 3.8, p. 13)."
- State as a target here Masuda–Tomatsu 2009, Theorem 4.12 (p. 35), with Lemma 4.10 (p. 34): centrally trivial irreducible finite-index endomorphisms of hyperfinite II∞ and III_λ factors are inner, respectively `Ad u∘σ_t^φ`.
- Cite HP2020 Lemma 3.9 (p. 13) for the induced-predual comparison that follows.
- Add the full factor `L(F₂)⊗̄B(ℓ²)` with the free flip as a negative-control Check, and add Theorem 4.12 to the CA9 *Needs:* line and the References.

**Tested.** The witness falls outside the repaired statement, since `L(F₂)⊗̄B(ℓ²)` is not hyperfinite. Conversely, take an outer `ℤ/2`-action on `R_II∞`. By Lemma 4.10(2) and Theorem 4.12, a centrally trivial irreducible image would be inner. So the image is properly centrally non-trivial, i.e. centrally free, as Corollary 3.8 asserts.

## R02 (P2) — The CA1a/CA2a objects have three open owners: this pull request, #1649 and #1705

Re-raised from the previous review's R01, which no repair report marked as settled.

**Location.** `README.md` lines 39–44: "C*-categories, their finite additive and Karoubi completion and the finite-Hilbert and Hilbert-module examples (CA1a), and C*-tensor categories with … signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". The same claim appears in Downstream consumers, lines 1956–1958.

**Claim.** This roadmap is the single owner of these objects, and QuantumGroups consumes them.

**Witness.** Main's QuantumGroups (lines 42, 253) cites CA1a/CA2a. In `TauCetiRoadmap/QuantumGroups/README.md`, #1649 (`ab56b1d`, lines 143–197) and #1705 (`0d7cbcc`, lines 220–268) both build the C*-category, dagger Karoubi completion, standard solutions and `bar(r) r=ε φ_X`. #1649 line 35 says it imports nothing from here.

**Repair.** There must be one owner, and this README and the QuantumGroups heads must name the same one. QuantumGroups is on main, so it is earlier in the supply direction, and both of its heads now own these objects in Layer 0.
- **Option A (follows that supply direction).**
  - In CA1a and CA2a, cite "QuantumGroups Layer 0" for the overlap: the C*-category definition, finite orthogonal sums, the dagger Karoubi completion and its universal property, `Hilb_f` and the Hilbert-module category, standard solutions and `d(X)`, and signed self-duality with sign invariance. Cite the layer rather than a subsection, because the two heads number it §0.1 and §0.2.
  - Keep here what QuantumGroups does not build: W*-categories and W*-Cauchy completion, unitary dual functors and Penneys Theorem A, the grading groupoid, spherical states, and the braided sign law.
  - Rewrite lines 39–44 and 1956–1958 to match, keeping the CA1a/CA2a ids, which TemperleyLiebOperatorAlgebras #867 cites at lines 1335, 1339 and 1372.
  - Name the QuantumGroups revision in the description's merge-order paragraph.
- **Option B (keeps this roadmap as owner).** State in the description that #1649 and #1705 are rebased to replace their Layer 0 constructions with citations of CA1a and CA2a, as main's QuantumGroups lines 42 and 253 do, before any of the three merges.

**Test object.** The sign ε of a simple self-dual object. Today it is defined at #1649 line 167, at #1705 line 246 and at this README's line 381. After the repair only one of these defines it, and the other two cite it.

## R03 (P3) — `MonoidalFunctor` is not a declaration at the Mathlib pin

**Location.** `README.md` lines 60, 98 (Exact supplier contracts), 461, 550, 945 and 956: "`MonoidalFunctor`".

**Witness.** At Mathlib `6b7abb3c`, `MonoidalFunctor` names only a namespace, holding `MonoidalFunctor.mapPi` (`Mathlib/CategoryTheory/Monoidal/Types/Basic.lean:125`). The native notions are the class `Functor.Monoidal` (`Mathlib/CategoryTheory/Monoidal/Functor.lean:389`) and the bundled `LaxMonoidalFunctor` (same file, line 1302).

**Repair.** At all six places, cite `Functor.Monoidal` as the strong monoidal structure on a functor. Where a category of monoidal functors is meant, as in CA2a's "tensor-functor categories", cite `LaxMonoidalFunctor` with `NatTrans.IsMonoidal`. Both names resolve at the pin; the grep above found them.

## R04 (P3) — The nonabelian shaded Morita classes are Example 6.16, not 6.15

**Location.** `README.md` lines 1264–1266: "work out the outer finite-group crossed-product witnesses and the distinct shaded Morita classes for nonabelian groups (Example 6.15, p. 28)". The References repeat it at line 2009.

**Witness.** `HartglassPenneys2014II` line 1266 (Example 6.15) is the crossed-product witness `A_(1,+)≇A_(0,+)⋊G`. The non-Morita-equivalent `A_(k,+)`, `A_(k,−)` for `R⊂R⋊G` with G nonabelian are Example 6.16, at lines 1277–1280, also on p. 28.

**Repair.** Write "(Examples 6.15 and 6.16, p. 28)" at line 1266 and in the References entry.

## Verified sound

**Gate, build and form.**
- `gate … --base origin/main` at `7a2845f` exits 0 and ends `OK`. Every counter is 0: `set_option`, `latex`, `prnum`, `sorry-data`, `sorry-examples`, `statement-hygiene`, `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `outside-folder`, `source-material`. The worker's run also has `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.OA"`).
- `lake env lean TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` exits 0 in 33 s with no diagnostic.
- The file is `import Mathlib`, one module docstring and an empty namespace. So there is no `#check` comparison and no one-tactic probe to run, and nothing is padding.
- Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`.
- A scan of the README for process words, LaTeX delimiters, pull-request numbers and `lemma` finds none.

**Dependency check.** `gate --depcheck … --movable --content …` prints `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Merge order: VonNeumannAlgebras 5, CStarAlgebras 7, HilbertModules 8, OperatorKTheory 9, Subfactors 205, this roadmap 226.
- TemperleyLiebOperatorAlgebras (242) is a consumer.
- FreeProbability, PivotalSpherical, OperatorAlgebraDynamics, QuantumGroups, CStarAlgebras, HilbertModules, VonNeumannAlgebras and Subfactors are on main.
- No gaps are declared (there is no readable `design/plan.json`).
- `overlaps.md` and `citations.md` list no dropped id and no unresolved citation.

**Headline theorems and `Suggested.lean`.** The headlines, from the Summary and the layers:
- CA2a: Penneys Theorem A.
- CA2b: Penneys Theorem C, and Coles–Huston–Penneys–Srinivas Theorem A.
- CA3: Chen–Hernández Palomares–Jones–Penneys Theorem 3.36, Corollary 3.37 and Theorem A.
- CA4: Jones–Penneys *Q-systems* Theorem A.
- CA5: *Realizations* Theorem 5.35 and Corollary 7.14.
- CA6: Henriques–Penneys–Tener *Anchored* Theorem A.
- CA7: Katsura Theorem 8.6, and Hartglass–Penneys I Theorem 5.25.
- CA8: Hartglass–Penneys II Theorems A–C and 6.13, and Corollary 6.8.
- CA9: Henriques–Nivedita–Penneys Theorem 7.4, Henriques–Penneys 2015 Theorem 3.5, Henriques–Penneys 2020 Theorem 3.10, and the factor case of Tomatsu's Theorem D.
- CA10: the Henriques–Penneys–Tener §4 bijection.

The docstring names each of them with the carrier it lacks. At the pins Mathlib has `CStarModule` (`Mathlib/Analysis/CStarAlgebra/Module/Defs.lean:72`), `WithCStarModule` (`…/Module/Synonym.lean:59`), `VonNeumannAlgebra` (`Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:67`) and `CompletelyPositiveMap` (`Mathlib/Analysis/CStarAlgebra/CompletelyPositiveMap.lean:50`), all as the docstring says. Fixed-string greps of both libraries for `Dagger`, `CStarCategory`, `WStarCategory`, `PlanarAlgebra`, `CuntzPimsner`, `hyperfinite`, `QSystem`, `Watatani`, `Fusion` and `Pivotal` return nothing. Operator K-theory is absent too: Tau Ceti's `K₀` hits are Grothendieck groups of categories. So no headline is statable at the pins, and a file that declares nothing is correct.

**Library declarations opened at the pins (16):**
- `HalfBraiding` (`Mathlib/CategoryTheory/Monoidal/Center.lean:53`) and `Center` (line 72).
- `MonObj` (`Mathlib/CategoryTheory/Monoidal/Mon.lean:72`) and `Mon` (line 251).
- `EndMonoidal` (`Mathlib/CategoryTheory/Bicategory/End.lean:24`).
- `Bicategory` (`Mathlib/CategoryTheory/Bicategory/Basic.lean:61`).
- `ExactPairing`, `HasRightDual` and `exactPairingCongrLeft` (`Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:77, 236, 596`).
- `MonoidalPreadditive` (`Mathlib/CategoryTheory/Monoidal/Preadditive.lean:35`) and `MonoidalLinear` (`Mathlib/CategoryTheory/Monoidal/Linear.lean:33`).
- `Karoubi` (`Mathlib/CategoryTheory/Idempotents/Karoubi.lean:43`).
- `Linear` (`Mathlib/CategoryTheory/Linear/Basic.lean:46`) and `Preadditive` (`Mathlib/CategoryTheory/Preadditive/Basic.lean:62`).
- `Mathlib/CategoryTheory/Monoidal/DayConvolution.lean`.
- `TauCeti.exactPairingCongrLeft_evaluation` (`TauCeti/CategoryTheory/Monoidal/Rigid/Basic.lean:44`), with the headers of `Rigid/Functor.lean` (strong-monoidal images of exact pairings) and `Rigid/DoubleDual.lean` (closed braided double duals).

**Cross-roadmap citations resolved this round (main at `dcf5cfe9`; open heads as listed):**
- **VonNeumannAlgebras (main).** "Layer k is cited as `Vk`" (lines 23–24); V4 with Sakai's theorem (line 987); V5 comparison and countable absorption (1339 ff.); V6, V11; V12 ultraproducts (3388); V13b (3740), including injective III₀ by the flow of weights and III₁ uniqueness (lines 4020–4022). Open revision #1041 keeps 13.1/13.2 (V13a/V13b).
- **Subfactors (main).** 1.1 (308), 1.2 with the opposite weight and unitors (342, 358), 2.1–2.5 (387–536, with `Ind(E_0)=d(X)²≤[M:N]` at 566), 3.2 (697), 3.3 (774), 5.1 (`d(X)²=[M:N]` at 1035), 6.1–6.4 (1089–1210), 7.1–7.2 (1248, 1272), 8.1–8.2 (1384, 1425), 9.1–9.2 (1507, 1529). Its hand-offs to this roadmap are at lines 72–73, 1328–1329 and 1722–1726.
- **HilbertModules (main).** H1 with `Aᵐᵒᵖ` (lines 23–25), H2 (179), H3 (262), linking algebra (306), Morita invariance of simplicity (319).
- **OperatorKTheory, #866 at `1377338`.** K2.3 (599): continuity including noninjective maps, and Morita invariance for σ-unital algebras with full-corner maps (619–622). K3.2 six-term sequence (761), K4 (932), K5 (1127), K6 (1301), K7 with Toeplitz–Cuntz `E_n` (1496 ff.).
- **FreeProbability (main).** F2 (184), F3 (255), F4 (353).
- **PivotalSpherical (main).** Layers 0–4 (257–387) and 9 (537). Layer 11 (626): semisimplicity of `Center C` in characteristic 0, `Fintype (SimpleClasses (Center C))`, `Simple (𝟙_ (Center C))`, and `dim (Center C)=(dim C)²` (lines 677–689).
- **CStarAlgebras (main).** Layers 1–5 (232–1110).
- **OperatorAlgebraDynamics (main).** D6 owns `O_n` (line 590).
- **TemperleyLiebOperatorAlgebras, #867 at `7cf3fee`.** Layer 3.2 (1307) and 3.3 (1337) cite CA1a and CA2a at lines 106, 323, 1335, 1339, 1372 and 1443.
- **Ownership sweep (`roadmaps grep`, 467 heads and main).** Cuntz–Pimsner, Q-system, anchored planar, W*-category, unitary dual functor, Watatani, tube algebra, Ocneanu ultrapower, bicommutant category, free graph algebra and C*-category. Hits outside this roadmap: the QuantumGroups heads (R02); #867 (a consumer); main's Subfactors and QuantumGroups (citations of this roadmap); and unrelated q-series and "tube" uses in HabiroNahmSeries, RefinedTraceMethods and ArcTopologyAndDescent.

**Source sample (15 lines, seed = head + 9).** Each line was read in the cached arXiv text at its locator; 14 support the README as written:
- **696** Jones–Penneys *Operator algebras*, Theorem 3.20, p. 27 (`JonesPenneys2017Operator` line 1216; page marker 1215), and Theorem 3.24, p. 29 (line 1343; marker 1340), with Definition 3.22 at line 1330.
- **814** *Realizations* Corollary 7.14, p. 62 (`JonesPenneys2017Realizations` line 3091; marker 3085): unital ∗-transformations correspond to normal state-preserving N–N ∗-homomorphisms.
- **817** Theorem 7.2, p. 58 (line 2948) and Theorem 7.3, p. 59 (line 2965; marker 2954).
- **985** Katsura Definition 8.3, p. 17 (`Katsura2004` line 725): `[X]=X_*∘(φ_X|J_X)_*` through `D_X` (Remark B.4, line 1026). Theorem 8.6, p. 18 (line 764), with no separability (lines 697–699).
- **990** Lemma B.2 and Proposition B.3, p. 23 (lines 998, 1010): directed separable sub-pairs.
- **992** Proposition B.5, p. 24 (line 1032), and Proposition 8.1, p. 17 (line 715).
- **1066** Hartglass–Penneys I Lemma 5.21, p. 39 (`HartglassPenneys2014I` line 1708): `a_μ(α)=Σ_(β∼α)n(α,β)μ(β)`, `A={μ>a_μ}`.
- **1250** Hartglass–Penneys II Lemma 6.6, Proposition 6.7 and Corollary 6.8, p. 27 (`HartglassPenneys2014II` lines 1211–1217).
- **1265** Example 6.15, p. 28 (line 1266). Its second clause is Example 6.16: **R04**.
- **1332** Henriques–Nivedita–Penneys Definition 4.14, p. 26 (`HNP2024` line 1054): `⟨c,F†(d)⟩≅⟨F(c),d⟩`.
- **1340** Theorem A, p. 2 (line 37), proved as Theorem 7.4, p. 38 (line 1540) with `A↦A-Mod`.
- **1577** Masuda–Tomatsu 2007 Lemma 8.2, p. 64 (`MasudaTomatsu2007` line 3037), with Definition 8.1(4) (line 3035) and `Mor_0` as maps with a faithful normal ucp left inverse (Definition 2.2, lines 398–402).
- **1710** Henriques–Penneys 2015 Theorem A, p. 2 (`HenriquesPenneys2015` line 58); Theorems 5.10, 5.12 and 5.13 (lines 1386, 1455, 1457) with Lemma 5.11 (line 1391), pp. 24–25; the §6 proof, p. 30 (line 1768).
- **1884** Henriques–Penneys–Tener *Classification* Corollary 3.9, p. 11 (`HPT2023Classification` line 537).
- **1895** Conjecture 1.1, p. 2 (line 63; the case `B=C′` proved, lines 79–87); §4, pp. 16–17 (lines 801–808); Lemma 4.1, p. 16 (line 821).

Also read for the adversarial pass:
- Penneys Theorem A (`Penneys2018` lines 122–131) and Theorem D (line 204).
- Katsura Definitions 3.2 (line 206, p. 5) and 3.4 (line 226, p. 6), and Theorem 6.4 (line 569, p. 14).
- Hartglass–Penneys I Definitions 5.17–5.18 (lines 1528–1538), Theorem 5.23 (line 1732) and Theorem 5.25 (line 1753).
- Hartglass–Penneys II Theorem 6.13 and its proof (lines 1229–1262).
- *Q-systems* Theorem A (`JonesPenneys2017Qsystems` line 36).
- Tomatsu Theorem D / 5.7 (`Tomatsu2018` lines 76, 2172), Definition 2.16 (line 713), and the countable `Irr(C)` (lines 62, 338).
- Masuda–Tomatsu 2009 Corollary 3.16, p. 29 (`MasudaTomatsu2008` line 1320).
- Henriques–Penneys 2020 Lemma 3.6, Theorem 3.7, Corollary 3.8 and Lemma 3.9 (`HenriquesPenneys2020` lines 608–630).

### Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| CA1a C*-identity Check | `f=diag(2,1)`; HS norm | `‖f†f‖=4=‖f‖²`; HS: `‖f‖₂²=5`, `‖f†f‖₂=√17` | discriminating | none |
| CA1a idempotent Check | `e(x,y)=(x+y,0)` | `‖e‖=√2`, `e†≠e`, range projection `diag(1,0)` | as stated | none |
| CA1a automatic contractivity | dagger functor F on `Hom(X,Y)` | `‖F f‖²=‖F(f†f)‖≤‖f†f‖=‖f‖²`; faithful ⇒ injective ∗-hom on End ⇒ isometric | sound | none |
| CA1a W* sums | columns `1/n`, `1/√n` | `Σ1/n²=π²/6`; `Σ1/n=∞` | as stated | none |
| CA1a `C([0,1])` | projections `{0,1}` | span `ℂ≠C([0,1])` | fails W* criterion, as stated | none |
| CA1b unitor | `ℂ²` on `ℂ`; zero action | nondegenerate: unitary; zero action: `⟨a⊗x,a′⊗x′⟩=0`, `A⊗_A X=0` | as stated | none |
| CA1b conjugate `M₂` | `J(ξ)=ξ*` | `J((b*ξa*)‾)=aξ*b` | intertwines | none |
| CA2a Theorem A (headline) | `Hilb(ℤ/2)`; `End†(Hilb_fd⊕Hilb_fd)`, t=4 | `χ²=1⇒χ=1` in `ℝ>0` (±1 in `ℂ×`); `dim_L=2`, `dim_R=1/2`, ratio 4, product 1 | = `Penneys2018` lines 122–131 | none |
| CA2a spherical state | weights (½,½), (1/5,4/5) | `1` vs `1/4`; `2/5=2/5`; second object `(4/5)(1/2)=2/5=(1/5)·2` | one state per t (cf. Theorem D, line 204) | none |
| CA2a sign law | `J(a,b)=(−b̄,ā)`, `J⊗J` | `J²=−1`; `(J⊗J)²=+1=(−1)(−1)`; on ℂ `|c|²=1` | as stated | none |
| CA2b Theorem C (headline) | `u₁—w—u₂` | `P_(0,+)=ℂ²`, `P_(0,−)=ℂ` | nonsimple `1₊` admitted | none |
| CA2b TL Gram | δ=√2, δ=1 | `det=δ²(δ²−1)`: 2, 0 | positive iff δ>1 | none |
| CA3 Q-system normalization | `M_n`, `⟨x,y⟩=n⁻¹Tr(x*y)`, basis `√n e_ij` | `mm†(z)=Σ_(i,j,l) z_il·n·e_il=n²z`; n=2: `m′m′†=1`, `i′†i′=4`; `m/d_Q`: `n⁻²` | as stated | none |
| CA3 morphism rescaling | `f:ℂ→M_n`, `f′=nf` | `f′m₁=nf m₁`, `m₂′(f′⊗f′)=n⁻¹n²f m₁`; `f′(1)=n·1=i₂′(1)` | algebra map | none |
| CA3 completeness (headline) | `Q=1⊕g` in `Hilb(ℤ/2)` | `X=n₀1⊕n₁g`: `X⊗X̄=(n₀²+n₁²)1⊕2n₀n₁g`; `n₀²+n₁²=1=2n₀n₁` unsolvable | not split, so `Hilb(ℤ/2)` is not complete and QSys is needed | none |
| CA3 balanced projector | Q=1; rows/columns over `M_n` | identity; range dim 1 in `n²` | as stated | none |
| CA4 Theorem A (headline) | trivial `A(a)=Hom(a,1)` | `d_Q=1`; source: normalized irreducible Q-systems, involutive algebra morphisms (line 36) | as stated | none |
| CA4 CP Check | transpose on `M₂` | `Σe_ij⊗e_ij↦` flip, eigenvalue −1 | not CP | none |
| CA4 Stinespring | `½Tr` on `M₂` | minimal `K=M₂`, dim 4; density `½·1` rank 2 is not a vector state | discriminating | none |
| CA5 (headline) | `N⋊ℤ/2`; `N⋊ℤ` | `d_Q=2=[M:N]`; ℤ: summands `L²(N)_(αⁿ)`, dims 1=1, infinite index | compact vs not | none |
| CA6 representability | `Hilb(ℤ)`; `Hilb(ℤ/2)` | support ℤ infinite; `Tr_V(ℂ)=1⊕g` | as stated | none |
| CA6 pairing, boxes | `P[0]=ℂ²`, ψ mean; `x=ℂ²`, n=3 | `‖(1,0)‖²=1/2` vs 1; `2³=8` vs `2⁶=64` | discriminating | none |
| CA7 J_X and covariance | Katsura Definitions 3.2, 3.4 | zero action: `J_X=0`, `O_X=T_X`; without `(ker φ)^⊥`: `π=0`, `t*t=π(⟨ξ,ξ⟩)=0`, `O_X=0` | as stated | none |
| CA7 six-term (headline) | `ℂⁿ`, n=1,2,3; `ℓ²(I)`, I uncountable | first map `1−n`; n=3: `ℤ/2`, 0; n=1: `ℤ`, `ℤ`; `ℓ²(I)`: `J_X=0`, `K₀=ℤ`, `K₁=0` | = Theorem 8.6, line 764 | none |
| CA7 K-route | separable vs general `(B,X)` | separable `D_X` is σ-unital (K2.3 Morita, line 619); general case by directed sub-pairs (B.2–B.3) and K2.3 continuity (line 604) | owned inputs | none |
| CA7 weighted moments | `μ=(16,1)`, `x=p_vT_εp_w` | `x=aL(ε′)+a⁻¹L(ε″)†`; `E(x†x)=a²p_w`, `E(xx†)=a⁻²p_v`; a=2: 4, 4; a=½: ¼, 64 | = Definition 5.17, line 1535 | none |
| CA7 loop | one loop, μ=1 | `a_μ=1`, A=∅; `T=L(ε)+L(ε)†` semicircular, `C([−2,2])` | = Definition 5.17(1), line 1529 | none |
| CA7 Theorem 5.25 (headline) | uncountable star, centre 2, leaves 1 | `a_μ(c)=∞`, leaf `a_μ=2>1`, A=∅; directed finite edge-subgraphs give `S′=S(Λ′_fin)⊕C₀(V∖V_fin)` | `K₀=ℤ^(V)`, `K₁=0` | none |
| CA7 Theorem 5.23 | one edge (16,1); centre ½ | `v∈A`, `w∉A`; leaves `a_μ=½<1` | "locally finite" needed for the converse | none |
| CA8 N(δ²) | 2, (3+√5)/2, 3, 4 | 3, 3, 4, 5 | = Definition 6.11, line 1224 | none |
| CA8 TL(√2) | `A₃`, dims (1,√2,1) | `√2=√2·1`, `1+1=√2·√2`; `K₀=ℤ³` | as stated | none |
| CA8 ordered K₀ | `τ_*(a,b,c)=a+√2b+c` | `√2−1∈(0,1)`; `√2>1`; `0` | = Theorem C, line 98 | none |
| CA8 Watatani Check | `ℂ⊂ℂ²`, `E=(a+2b)/3` | `e₁E(3x₁e₁)=x₁e₁`, `e₂E((3/2)x₂e₂)=x₂e₂`; `Ind=(3,3/2)`; `E=(a+b)/2`: `2·1` | as stated | none |
| CA8 sharpness (headline) | TL at δ²=2, 3, ≥4 | depths: `A₃` 2, `A₅` 4, ∞; `[1₂]≠δ²[1₀]` | = Theorem 6.13 proof, lines 1254–1262 | none |
| CA8 Example 6.15 | sampled line 1265 | 6.15: `A₁,₊≇A₀,₊⋊G` (line 1266); 6.16: nonabelian Morita classes (line 1277) | second clause mislocated | R04 |
| CA9 HNP transpose | `F=−⊗ℂ^k`; pairs, `F(c₁,c₂)=(0,c₁)` | dims `mnk` all three; `(ℂ²,ℂ)`,`(ℂ,ℂ³)`: 6 vs 1 | discriminating | none |
| CA9 Theorem 7.4 (headline) | handedness | source `A↦A-Mod` (line 1540); README right modules, compared explicitly | consistent | none |
| CA9 corner model | `T=1⊗e_(1,pt)`; `M=ℂ`, `I=pt`, `J={1,2}` | `Tρ(a)=ρ(a)⊗e_(1,pt)=(ρ(a)⊗e₁₁)T`, `T*T=1`, `TT*=1⊗e₁₁`; Hom dim 2, corners 1, 4 | as stated | none |
| CA9 separable standardizability | `M` II∞, right module with II₁ commutant | a unital left action of properly infinite M forces a properly infinite support, hence `~1` | claim holds for bimodules | none |
| CA9 Tomatsu bridge | `c_(X,Y)=u_(Y,X)†` | `c:G_(X⊗^rev Y)=F_(Y⊗X)→F_X∘F_Y` with `α_Xα_Y=Ad(c)α_(X⊗Y)` | consistent | none |
| CA9 approximate innerness | `ρ=Σv_i·v_i*`, `φ_ρ=n⁻¹Σv_i*·v_i` | `n⁻¹ψ(xv_i)=ψφ_ρ(v_ix)` exactly; `τ∘φ_ρ=τ/n` | = MT2009 Corollary 3.16(3), line 1329 | none |
| CA9 canonical extension | same, n=2 | `(D(τ/2):Dτ)_t=2^(−it)`; `ρ̃(u_t)=2^(it)2^(−it)u_t=u_t`; module `θ₀` | as stated | none |
| CA9 Theorem D (headline) | factor M; countable `Irr(C)` | `Z(M)=ℂ`, invariant state automatic; Tomatsu assumes countable `Irr(C)` (line 62) | = lines 76–80, 2172 | none |
| CA9 "fully faithful ⇒ centrally free" | `L(F₂)⊗̄B(ℓ²)`, free flip; `R_II∞` outer ℤ/2 | `M_ω=ℂ`: every a satisfies `ax=α(x)a`, not centrally free; `R_II∞`: centrally free by MT 4.12 | false without fusion/hyperfinite II∞/III₁ | R01 |
| CA9 HP2015 absorption | `M_n`; `R_λ` | `M_n⊗̄R₁≅R₁≠M_n`; `R_λ⊗̄R₁≅R_λ`; III₀ flow of weights `θ⊗id` on `Z(core)⊗1` | as stated | none |
| CA9 Powers Check | `R_λ`, `Hilb(ℤ/2)` | `Hom(_ρL²,L²)=0`, `End=ℂ` | fully faithful in III_λ | none |
| CA9 ultrapower | `M_n`; `L(F₂)`; R | `M_n^ω=M_n`, `(M_n)_ω=ℂ`; `L(F₂)_ω=ℂ`; `R_ω≠ℂ` | as stated | none |
| CA9 Følner | `K=Irr(C)` | `Z≺X⊗Y` with `Y≺X̄⊗Z`, so `F·K=K`, Δ=∅ | as stated | none |
| CA10 tube algebras | `Hilb(ℤ/2)`, `Hilb(ℤ/3)`, `Hilb(S₃)` | 4, 9, 36; `D(S₃)` simples 1,1,2,3,3,2,2,2, `Σd²=36=6²` | as stated | none |
| CA10 real structures | unit, `u=i·id` | `ū r u⁻¹=(−i)(−i)r=−r` | conjugate | none |
| CA10 classification (headline) | §4, Lemma 4.1, Corollary 3.9 | R of type II₁, II∞ or III₁; M fusion from commuting fusion subcategories | = lines 801–825, 537 | none |
| Mathlib names | `MonoidalFunctor` at `6b7abb3c` | only a namespace (`mapPi`); `Functor.Monoidal` at `Functor.lean:389` | name absent | R03 |
| Scope single owner | main QG 42, 253; #1649 `ab56b1d`; #1705 `0d7cbcc` | main cites CA1a/CA2a; #1649 lines 143–197 and #1705 lines 220–268 build them, with 0 imports from here | three owners | R02 |

## Not verifiable

- Tomatsu's strong-freeness quantifiers (`Tomatsu2018` lines 718–720, Definition 2.16). The cached extraction renders both `M^ω` and `M_ω` as "Mω". So the README's reading (line 1575: `a∈M^ω`, countably generated `Q⊆M^ω`, test in `Q′∩M_ω`) cannot be told apart from the all-`M_ω` version of Masuda–Tomatsu 2007 Definition 3.12 (`MasudaTomatsu2007` lines 1058–1063). This affects no finding: central freeness, which the README uses, is unambiguous at line 716.
- No manifest was edited. Every other sampled locator was read in the cached arXiv texts.

## Source issues

- **Gap** in `HartglassPenneys2014I` at Theorem 5.25, p. 40: the source proves the case of an infinite graph by writing it as an increasing union of finite subgraphs `Λ_n`, which exists only for countable graphs; it should use the directed system of finite edge-subgraphs; affects the proof.
- **Misprint** in `HPT2023Classification` at §1, p. 2: the source lists the factor types as II₁, III∞ or III₁; it should be II₁, II∞ or III₁, as §4 (p. 16) states; affects nothing.
- **Misprint** in `HartglassPenneys2014II` at Theorem C, p. 3: the source writes the positive cone of `K₀(A₀)` as a subset of `K₀(A_k)`; it should be a subset of `K₀(A₀)`; affects nothing.
