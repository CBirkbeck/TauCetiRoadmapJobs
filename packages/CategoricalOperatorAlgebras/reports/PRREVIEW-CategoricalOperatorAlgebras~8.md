# Review of CategoricalOperatorAlgebras (pull request #888 at 7a2845f)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` (2054 lines) and `Suggested.lean` (51 lines) at `7a2845f`. The folder changed by 273 lines since `0f636ea`, the head the previous review read; every passage was read again, and the source sample was drawn afresh (15 locator-bearing lines, seed = head + 8). One finding remains, carried from the previous rounds; it concerns a sibling pull request, not this folder.

## Previous findings

- **R01 (P2), two open owners of the CA1a/CA2a objects: partly repaired, on the QuantumGroups side.** #1649 moved to `cc02cfc6` (2026-11-08) and now consumes this roadmap: its line 25 says CA1a and CA2a own C*-categories and their Karoubi completion, its supplier table (line 80) and its `From TauCetiRoadmap.CategoricalOperatorAlgebras` paragraph (line 127) cite CA1a and CA2a, and its §0.3 (line 279) is now "Fiber functors and conjugate solutions", with 21 citations of this roadmap in all. #1705 moved to `c5e5bfa` but still builds the objects itself: its §0.2 "C*-categories and standard conjugates" (README line 214) constructs the dagger with `‖f†f‖=‖f‖²`, the dagger Karoubi completion with its universal property, standard conjugate solutions with `d(X)≥1` and the signed self-duality `bar(r) r=ε φ_X`, and it has no mention of CategoricalOperatorAlgebras. The pull-request description's merge-order paragraph is unchanged (#1142, #866). Carried below as R01, narrowed to #1705.
- **R02 (P3), headline locators only in the References: repaired.** Every headline named in that finding now carries its locator at the claim, and each was read at the cited page (printed page numbers, read from the page footers of the cached texts): Penneys Theorem A, p. 3 (`Penneys2018` line 122), §3.3, p. 13 (line 616), Lemma 3.20, p. 14 (line 665), Proposition 3.24, p. 16 (line 730), Corollary 3.26, p. 18 (line 826); Chen–Hernández Palomares–Jones–Penneys Theorem 3.36, p. 26 (`CHJP2021` line 1131; footer "26" at line 1138), Corollary 3.37, p. 27 (line 1164), Theorem A and Lemma B, p. 3 (lines 122, 131); Jones–Penneys *Operator algebras* Theorems 3.8, 3.20, 3.24, 4.18, 4.28 and 5.15 at pp. 22, 27, 29, 35, 39 and 51 (`JonesPenneys2017Operator` lines 976, 1216, 1343, 1633, 1958, 2638); Jones–Penneys *Q-systems* Theorem A, p. 1 and Proposition 4.11, p. 14 (`JonesPenneys2017Qsystems` lines 36, 827); Jones–Penneys *Realizations* Theorem A, p. 4, Corollary E, p. 6, Theorem 5.35, p. 47, Theorems 7.2–7.3, pp. 58–59, Corollary 7.14, p. 62 (`JonesPenneys2017Realizations` lines 140, 235, 2317, 2948, 2965, 3091); Henriques–Penneys–Tener *Anchored* Theorem A, p. 3 (`HPT2023Anchored` line 94); Hartglass–Penneys I Definitions 5.17–5.18, p. 35, Theorems 5.19–5.20, pp. 35–38, Lemma 5.21, Theorem 5.23, Corollary 5.24, p. 39, Theorem 5.25, p. 40, §5.4, p. 41 (`HartglassPenneys2014I` lines 1528, 1537, 1540, 1587, 1708, 1732, 1745, 1753, 1794–1797); Hartglass–Penneys II Theorem A, p. 2, Theorems B–C, p. 3, Corollaries 4.16–4.17, p. 15, Remark 4.18, p. 16, Theorems 5.1, 5.5, 5.14 at pp. 17, 19, 24, Remark 5.17 and Corollary 5.18, p. 25, §6, p. 25, Lemma 6.6, Proposition 6.7, Corollary 6.8, Definition 6.11, Theorem 6.13, p. 27, its proof, p. 28, Example 6.15, p. 28 (`HartglassPenneys2014II` lines 81, 89, 98, 642, 646, 649, 689, 826, 1105, 1127, 1135, 1146, 1211, 1212, 1217, 1224, 1229, 1238, 1266); Henriques–Nivedita–Penneys Theorem A, p. 2, Definition 4.14, p. 26, Theorem 7.4, p. 38 (`HNP2024` lines 37, 1054, 1540); Henriques–Penneys 2015 Theorem A, p. 2, Theorems 5.10–5.13, pp. 24–25, the proof of Theorem A in §6, p. 30 (`HenriquesPenneys2015` lines 58, 1386, 1391, 1455, 1457, 1768); Henriques–Penneys 2020 Theorem A/5.18, pp. 2/28, Theorem B/6.8, pp. 3/37, Theorem 3.10, p. 14 (`HenriquesPenneys2020` lines 80, 1276, 112, 1866, 651); Tomatsu §2.4, p. 8, Proposition 2.7, p. 10, Remark 2.17(1), p. 16, Theorem D, p. 2, Theorem 5.7, p. 47 (`Tomatsu2018` lines 374, 457, 723, 76, 2172); Henriques–Penneys–Tener *Classification* Conjecture 1.1, p. 2, Lemma 3.7 and Theorem 3.8, p. 10, Corollary 3.9, p. 11, §4 and Lemma 4.1, pp. 16–17 (`HPT2023Classification` lines 63, 459, 486, 537, 801, 821).
- **R03 (P3), bicommutant cited to the wrong section: repaired.** README line 2020 now reads "§§2–5, Theorems 3.8 (p. 22), 3.20 (p. 27), 3.24 (p. 29), 4.18 (p. 35), 4.28 (p. 39) and 5.15 (p. 51)", and the target at lines 711–712 cites Theorem 5.15, p. 51. Theorem 5.15 is "von Neumann bicommutant" at `JonesPenneys2017Operator` line 2638, printed page 51.
- **R04 (P3), free-graph algebra restricted to countable graphs: repaired.** Line 1005 now reads "For an undirected graph Λ, with vertex and edge sets in `Type u` of arbitrary cardinality and neither local finiteness nor connectedness assumed". The K-isomorphism for an arbitrary graph is argued at lines 1058–1064 by the directed system of finite edge-subgraphs, and the test instance (the uncountable star) is a Check at lines 1102–1107. Both are verified in the table below; Hartglass–Penneys I, Theorem 5.25 (`HartglassPenneys2014I` line 1753) states the result "for any Λ".
- **R05 (P3), no Checks for the Watatani index and the ordered `K₀`: repaired.** Two Checks at lines 1282–1296 with the values asked for; both recomputed below.
- **R06 (P3), title and opening paragraph: repaired.** Line 1 is "# Roadmap: categorical operator algebras and planar constructions" and line 3 begins "**Summary.**", naming the end theorems of CA2–CA10. The CA1–CA10 heading ids are kept, as the consumers on main require.

## R01 (P2) — The C*-category and unitary-duality objects of CA1a and CA2a still have a second open owner, #1705

**Location.** `README.md` lines 38–43: "C*-categories, their finite additive and Karoubi completion … (CA1a), and C*-tensor categories with solutions of the conjugate equations, standard solutions and intrinsic dimension, unitary dual functors and signed self-dualities (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a". Also lines 1945–1947.

**Claim.** This roadmap is the single owner of these objects, and QuantumGroups consumes them.

**Witness.** True on main (`TauCetiRoadmap/QuantumGroups/README.md` line 42 cites "CategoricalOperatorAlgebras CA1a,CA2a") and now true at #1649 (`cc02cfc6`, lines 25, 80, 127: CA1a and CA2a own these objects; §0.3 keeps only fiber functors). Still false at #1705 (`c5e5bfa`): its §0.2 "C*-categories and standard conjugates" (README line 214) constructs the dagger, the dagger Karoubi completion and its universal property, standard conjugate solutions, `d(X)≥1`, and the signed self-duality `bar(r) r=ε φ_X` with sign invariance on simple self-dual objects, and the head has no citation of this roadmap. The same object, the sign of a simple self-dual object's `bar(r) r=ε φ_X`, is defined at #1705 line 214 ff. and at this README's lines 383–384.

**Repair.** Nothing in this folder changes: it rightly keeps the ownership, and #1649 shows the intended shape.
- **Preferred:** in #1705, replace §0.2 and the matching clause of its Layer 0 scope (README lines 25–27) with citations of CA1a and CA2a, as #1649 lines 25, 80 and 127 and main's line 42 do.
- **Otherwise:** state in this pull request's description that #1705 is rebased to consume CA1a and CA2a before either merges.

**Test object.** A simple self-dual object's `bar(r) r=ε φ_X`. Today #1705 line 214 ff. and this README line 383 both define it; after the repair only CA2a does.

## Verified sound

**Gate and build.**
- `gate … --base origin/main` at `7a2845f` exits 0; every counter is 0 (`set_option`, `latex`, `prnum`, `sorry-data`, `sorry-examples`, `statement-hygiene`, `forbidden`, `dropped`, `readme-ids-missing`, `empty-sections`, `round-labels`, `layer-ids`, `target-ids`, `depcheck`, `metadata`, `stray-files`, `dirty`, `outside-folder`, `source-material`) and the line ends `OK`; the worker's run also has `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.OA"`).
- `lake env lean TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` exits 0 in 22 s with no diagnostic. The file imports `Mathlib` only and declares nothing (one module docstring, an empty namespace), so there is no `#check` comparison, no one-tactic probe and no padding.
- Pins (`lake-manifest.json`): Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`.
- A scan of the README for process words ("so far", "current", "removed", "checkpoint", "optional", "deferred", pull-request numbers), LaTeX delimiters and `lemma` finds none.

**Dependency check.** `gate --depcheck … --movable --content …` prints `depcheck: 237 roadmaps, 2341 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Merge order: VonNeumannAlgebras 5, CStarAlgebras 7, HilbertModules 8, OperatorKTheory 9, Subfactors 205, this roadmap 226, CStarClassification 227 (a scope pointer, not a supplier), TemperleyLiebOperatorAlgebras 242 (a consumer). FreeProbability, PivotalSpherical, OperatorAlgebraDynamics, QuantumGroups, CStarAlgebras, HilbertModules, VonNeumannAlgebras and Subfactors are on main. No gaps are declared (no readable `design/plan.json`).

**Headline theorems and `Suggested.lean`.** The headlines, from the Summary and the layers: CA2a Penneys Theorem A; CA2b Penneys Theorem C and Coles–Huston–Penneys–Srinivas Theorem A; CA3 Theorem 3.36, Corollary 3.37 and Theorem A of Chen–Hernández Palomares–Jones–Penneys; CA4 Jones–Penneys *Q-systems* Theorem A; CA5 Theorem 5.35 and Corollary 7.14; CA6 Henriques–Penneys–Tener *Anchored* Theorem A; CA7 Katsura Theorem 8.6 and Hartglass–Penneys I Theorems 5.23 and 5.25; CA8 Hartglass–Penneys II Theorems A–C and 6.13 and the GJS index `δ²`; CA9 Henriques–Nivedita–Penneys Theorem 7.4, Henriques–Penneys 2015 Theorem 3.5, Henriques–Penneys 2020 Theorem 3.10 and the factor case of Tomatsu's Theorem D; CA10 the classification bijection of Henriques–Penneys–Tener §4. The module docstring names all of them with the carrier each lacks. At the pins Mathlib has `VonNeumannAlgebra` (`Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:67`), `CStarModule` (`Mathlib/Analysis/CStarAlgebra/Module/Defs.lean:72`) and `HalfBraiding` (`Mathlib/CategoryTheory/Monoidal/Center.lean:53`); Tau Ceti has `TauCeti/CategoryTheory/Monoidal/Rigid/{Basic,Functor,DoubleDual}.lean`. Greps of both libraries for `class .*Dagger`, `CStarCategory`, `WStarCategory`, `PlanarAlgebra`, `CuntzPimsner`, `Hyperfinite`, `QSystem` and `JonesIndex` return no file. So no headline is statable at the pins and an empty file is correct.

**Cross-roadmap citations resolved (this round).**
- QuantumGroups on main, line 42, cites CA1a and CA2a; #1649 at `cc02cfc6` cites them at lines 25, 80, 127, 282, 312, 371 (R01 above records #1705).
- TemperleyLiebOperatorAlgebras #867 (`7cf3feef`, unchanged since the previous review) cites CA1a and CA2a at lines 106–107, 323–326, 1335 and 1339.
- Subfactors on main cites this roadmap at lines 73, 77, 1329 and 1722 (completions and Q-systems handed here).
- OperatorKTheory #866 K2.3 (continuity over directed systems, Morita invariance, full-corner maps), K3 (six-term sequence), K4–K6: as resolved in the previous review, head unchanged.
- The overlaps listing names no pull request that changes this roadmap, no dropped id, and the citations check reports nothing unresolved.

**Ownership by object.** The previous round's `roadmaps grep` sweep (Cuntz–Pimsner, anchored planar, Katsura, Ocneanu ultrapower, Watatani, free graph algebra, Q-system, tube algebra, W*-category, unitary dual functor, Longo–Roberts, bicommutant category, GJS) stands; the only double ownership found is R01, now confined to #1705.

**Source sample (seed = head + 8, 15 locator lines, none chosen by heading).** All read in the cached arXiv texts; every one supports the README as written with the same hypotheses:
- **472** Penneys Theorem C, p. 4: `Penneys2018` line 165.
- **480** Penneys §4 dictionary, p. 23: line 1063 "connected (dim P₀ = 1) ↔ 1 simple", line 1065 "2-shaded connected ↔ 1₊, 1₋ simple".
- **527** Example 4.7, p. 25: line 1210; `1 = ⊕ E_(v,v)` at line 1222, so `1₊` is a sum of `n₊` simples and `End(1₊)=ℂ^(n₊)`.
- **704** Jones–Penneys Theorem 4.18, p. 35: line 1633, embedding of a C*-algebra object into `B(H)`.
- **969** Katsura Definition 3.4, p. 6: line 226, covariance `π(a)=ψ_t(φ(a))` for `a∈J_X`.
- **1055** Hartglass–Penneys I Theorem 5.25, p. 40: line 1753, "for any Λ".
- **1070** Theorem 5.23, p. 39: line 1732; the converse carries "locally finite".
- **1165** Hartglass–Penneys II §6, p. 25 (line 1146) and Corollary 6.8, p. 27 (line 1217, Watatani index = Jones index = `δ²`).
- **1216** Remark 4.18, p. 16: line 649, `A_(k,±)∼A_(k+1,∓)`, two `K₀` groups by parity.
- **1222** Theorem C, p. 3 (line 98) proved as Theorems 5.1 (p. 17, line 689, conditions (1)–(2)), 5.5 (p. 19, line 826, the complementary Assumption 5.2 case) and 5.14 (p. 24, line 1105, stable rank one). Lines 724–725 show the two cases exhaust every principal graph.
- **1233** Theorem C, p. 3 and Corollary 5.18, p. 25: lines 99–100 and 1135, `K₀(A₀)⁺` and `Σ(A₀)` by the trace.
- **1372** Henriques–Penneys 2015 Lemma 3.4, p. 16: line 886, `R⊗̄R_II₁≅R` for hyperfinite R not of type I.
- **1384** Theorem 3.5, p. 17 (line 910); Henriques–Penneys 2020 Theorem 3.15 and Corollary 3.16, p. 16 (lines 776, 789).
- **1605** Tomatsu Proposition 2.7, p. 10 (line 457) in the §2.4 setting (line 376: M an infinite factor with separable predual, finite-index endomorphisms with faithful normal left inverses).
- **1884** Henriques–Penneys–Tener *Classification* Corollary 3.9, p. 11: line 537, `Bim(R)≅C′⊠_(Z(C))C`.

### Adversarial table

Rows marked (r7) were computed in the previous round and recomputed here; the others are new to this round.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| CA1a C*-identity Check (r7) | `diag(2,1)`, operator vs Hilbert–Schmidt norm | `‖f†f‖=4=‖f‖²`; HS: `‖f‖₂²=5`, `‖f†f‖₂=√17` | discriminating | none |
| CA1a idempotent Check (r7) | `e=[[1,1],[0,0]]` | `e²=e`, `‖e‖=√2`, `e†≠e`, range projection `diag(1,0)` | as stated | none |
| CA1a W* sums (r7) | columns `1/n`, `1/√n` | `Σ1/n²=π²/6`; `Σ1/n=∞` | as stated | none |
| CA1a `C([0,1])` not W* (r7) | projections of `C([0,1])` | `{0,1}`, span `ℂ≠C([0,1])`; `B=ℂ` gives `End(ℂ²)=M₂` | as stated | none |
| CA1b unitor Check (r7) | `A=ℂ²` on ℂ; zero action | `A⊗_A X=ℂ`; zero action: all inner products 0, `A⊗_A X=0` | as stated | none |
| CA1b reversal (r7) | `ℂⁿ` over `M_n` | dims `n²` and 1; `ℂⁿ∘ℂⁿ` undefined for n≥2 | as stated | none |
| CA2a sign Checks (r7) | `J(a,b)=(−b̄,ā)`, `J′`, `J(a)=cā`, `J⊗J` | `J²=−1`, `J′²=1`, `|c|²=1`, `(J⊗J)²=+1` | as stated | none |
| CA2a Theorem A (headline) | `Hilb(ℤ/2)`; pair groupoid on 2 objects | `χ²=1⇒χ=1` in `ℝ>0`, `±1` in `ℂ^×`; `t>0` family; source Lemma 3.20 `π=dim_L/dim_R` | README = `Penneys2018` lines 122, 667 | none |
| CA2a balanced uniqueness | Prop. 3.24 Step 1, simple c | scale `ev` by `π(gr c)^(±1/2)`, unique up to a phase in U(1); Step 2 extends to sums | README's "objectwise" = source lines 733–741 | none |
| CA2a spherical state (r7) | t=4, `dim_L=2`, `dim_R=1/2` | equal weights: 1 vs 1/4; weights (1/5,4/5): 2/5 both sides; spherical iff `w_R=t·w_L` | discriminating | none |
| CA2b bipartite triple | `u₁—w—u₂` | `1₊=E_(u₁,u₁)⊕E_(u₂,u₂)`, `P_(0,+)=ℂ²`, `P_(0,−)=ℂ` | = Example 4.7, line 1222 | none |
| CA2b TL Gram (r7) | δ=√2, δ=1 | `det=δ²(δ²−1)`=2, 0 | positive iff δ>1 | none |
| CA3 normalisation Check | `M₂`, `⟨x,y⟩=½Tr(x*y)` | `i†i=1`; `mm†=n²=4`; `m′=m/2`: `m′m′†=1`, `i′†i′=4`, `i′†m′=i†m`; `m/4` gives `1/4` | as stated | none |
| CA3 morphism rescaling (r7) | `f:ℂ→M_n` | `f′=nf`, `f′(i₁′(1))=n·1=i₂′(1)`; unscaled `1≠n·1` | as stated | none |
| CA3 balanced projector (r7) | rows ⊗ columns over `M_n` | range dimension 1 in `n²` | as stated | none |
| CA3 completion (headline) | Theorem 3.36, Cor. 3.37, Theorem A | complete ⇔ every Q-system splits; `QSys(QSys(C))≃QSys(C)`; `C*Alg` complete | README = `CHJP2021` lines 1131, 1164, 122 | none |
| CA4 internal algebras | Theorems 3.8, 3.20, 3.24 | algebra ↔ cyclic module category; *-version; W* with normal morphisms | README = `JonesPenneys2017Operator` lines 976, 1216, 1343 | none |
| CA4 Stinespring Check (r7) | `½Tr` on `M₂` | minimal `K=M₂`, dim 4; `K=ℂ²` forces a vector state, density `½·1` has rank 2 | discriminating | none |
| CA4 transpose (r7) | `Σe_ij⊗e_ij` | image = flip, eigenvalue −1 | not CP | none |
| CA4 bicommutant | Theorem 5.15 | weak-* closure = bicommutant | locator now p. 51 (line 2638) | none |
| CA4 compact objects (headline) | *Q-systems* Theorem A, footnote 1 | simple unit, idempotent complete; normalized irreducible Q-systems | README = lines 36, 52 | none |
| CA5 (headline) (r7) | Theorem 5.35, Cor. 7.14; `N⋊ℤ/2`, `N⋊ℤ` | `d_Q=2=[M:N]`; ℤ: irreducible, infinite index, not compact | README = `JonesPenneys2017Realizations` lines 2317, 3091 | none |
| CA5 Corollary E, Theorems 7.2–7.3 | intermediate `N⊆P⊆M`; abstract `(C,A)` | intermediate inclusions ↔ `1⊆B⊆A`; 7.2 realizes, 7.3 recovers | README = lines 235, 2948, 2965 | none |
| CA6 Theorem A (headline) (r7) | ribbon V | spherical anchored ↔ spherical state | README = `HPT2023Anchored` lines 94–106 | none |
| CA6 representability (r7) | `Hilb(ℤ)`; `Hilb(ℤ/2)` | support ℤ infinite; support 2, `Tr_V(ℂ)=1⊕g` | as stated | none |
| CA6 pairing Check (r7) | `P[0]=ℂ²`, ψ = mean | `‖(1,0)‖²=1/2` vs 1 | discriminating | none |
| CA6 boxes (r7) | `x=ℂ²`, n=3 | `2³=8` vs `2⁶=64` | discriminating | none |
| CA7 covariance (r7) | Katsura Def. 3.2, 3.4 | `J_X=φ⁻¹(K(X))∩(ker φ)^⊥`; `π(a)=ψ_t(φ(a))` on `J_X` | README = `Katsura2004` lines 206, 226 | none |
| CA7 six-term (headline) (r7) | `ℂⁿ`, n=1,2,3; zero action | first map `1−n`; n=3: `ℤ/2`, 0; n=1: ℤ, ℤ; zero action `J_X=0`, `O_X=T_X` | correct | none |
| CA7 `ℓ²(I)` Check (r7) | I uncountable | `J_X=0`; `K₀=ℤ[1]`, `K₁=0` | correct | none |
| CA7 weighted moments (r7) | µ=(16,1), `x=p_vT_εp_w` | `x=aL(ε′)+a⁻¹L(ε″)†`; `E(x†x)=a²p_w`, `E(xx†)=a⁻²p_v`; a=2: 4=4; a=1/2: 1/4, 64 | orientation = Def. 5.17 (line 1535) | none |
| CA7 trace sum countable | `E(y)∈C₀(V)` | a `C₀` function on a discrete set has countable support | as stated | none |
| CA7 directed-union K argument | finite edge set E′, isolated vertex v | `L(ε′)p_v=0` (`ε′p_v=ε′p_(t ε′)p_v=0`), `p_vL(ε″)†=0` on length ≥1, so `T_εp_v=p_vT_ε=0`; `S(Λ′)=S(Λ′_fin)⊕C₀(V∖V_fin)`; union over E′ directed, dense in `S(Λ,μ)` | sound; = Theorem 5.25 proof (lines 1761–1764) | none |
| CA7 `A(Λ,µ)` (r7) | one edge; one loop; FP weights | `v∈A`, `w∉A`; loop `a_µ=1`, A=∅, `C([−2,2])`; FP: `a_µ(v)=δd_v>d_v` iff δ>1 | README = Lemma 5.21, §5.4 lines 1709, 1796 | none |
| CA7 uncountable star Check | centre weight 2, leaves weight 1 | `a_µ(c)=∞`, `2>∞` false; leaf `a_µ=2>1`; `A=∅`; connected ⇒ `S∩K=0` (Thm 5.23); `K₀=⊕_V ℤ`, `K₁=0` (Thm 5.25) | as stated | none |
| CA7 star, negative control | centre weight 1/2 | leaves `a_µ=1/2<1`, so every leaf in A; converse needs local finiteness, which the centre fails | README's "locally finite" hypothesis needed | none |
| CA7 Theorem 5.23 hypothesis | disconnected graph, A=∅ | `S(Λ,µ)` is the `c₀`-sum of component algebras; a compact in it has compact components, each 0 | README's "connected" is a harmless restriction; source proof via Lemma 5.21 presumes it | none |
| CA8 `N(δ²)` (r7) | 2, 2.618, 3, 4 | 3, 3, 4, 5 | = Def. 6.11 (line 1224) | none |
| CA8 TL(√2) (r7) | A₃, dims (1,√2,1) | `√2=√2·1`, `1+1=√2·√2`; `K₀=ℤ³` | as stated | none |
| CA8 ordered `K₀` Check | `τ_*(a,b,c)=a+√2b+c` | `(−1,1,0)↦√2−1∈(0,1)`: in Σ, not coordinatewise positive; `(0,1,0)↦√2>1`: in `K₀⁺`, not in Σ; `(1,0,−1)↦0`: neither sign positive | = Theorem C, Rem. 5.17, Cor. 5.18 (lines 99–100, 1127, 1135) | none |
| CA8 quasi-basis Check | `ℂ⊂ℂ²`, `E(a,b)=(a+2b)/3` | `e₁E(3x₁e₁)=x₁e₁`, `e₂E((3/2)x₂e₂)=x₂e₂`; `Ind(E)=3e₁+(3/2)e₂=(3,3/2)`; `E=(a+b)/2`: `Ind=2·1`; count 2 both | as stated | none |
| CA8 Watatani = Jones index | Cor. 6.8 | a Pimsner–Popa basis of `A_k` over `A_(k−1)` is one for `M_k` over `M_(k−1)`: index `δ²` | README = line 1217 | none |
| CA8 sharpness (headline) (r7) | Theorem 6.13, Example 6.15 | existential "for every δ there exists `P•`"; `[1₂]=|G|[1₀]` impossible at depth 2 | as stated | none |
| CA8 simplicity route | Theorems 5.1, 5.5, 5.14 | case (1)/(2) of 5.1, else Assumption 5.2 (lines 724–725), stable rank 1 in both | README = lines 689, 826, 1105 | none |
| CA9 biequivalence (headline) (r7) | Theorem 7.4 | `A↦A-Mod` (left modules), generators standing | README = `HNP2024` lines 1540–1547 | none |
| CA9 transpose Checks (r7) | Hilb, `F=−⊗ℂ^k`; pairs `(ℂ²,ℂ)`,`(ℂ,ℂ³)` | `F^t=−⊗(ℂ^k)‾`, all dimension counts `mnk`; pairs: 6 vs 1 | discriminating | none |
| CA9 absorption (r7) | `M_n`, `R_λ` | `M_n⊗̄R₁≅R₁≠M_n`; `R_λ⊗̄R₁≅R_λ` | as stated | none |
| CA9 uniqueness (headline) (r7) | Theorem 3.10 | both II or both III₁, separable preduals | README = `HenriquesPenneys2020` lines 651–655 | none |
| CA9 Powers factor Check (r7) | `R_λ`, `Hilb(ℤ/2)` | outer ρ: `Hom(_ρL²,L²)=0`, `End=ℂ`; fully faithful in III_λ | as stated | none |
| CA9 End_rev Check (r7) | `u=diag(1,i)`, `v=σ_x` | `uv=[[0,1],[i,0]]`, `vu=[[0,i],[1,0]]`; ratios −i vs i | not proportional | none |
| CA9 II∞ n=2 Check (r7) | Cuntz pair | `τ∘φ_ρ=τ/2`, `(D(τ/2):Dτ)_t=2^(−it)`, `ρ̌(u_t)=2^(−it)u_t`, `ρ̃(u_t)=u_t`, module `θ₀` | as stated | none |
| CA9 approximate innerness definition | Tomatsu Def. 2.2 vs README | summing `v_iψ=rρ(ψ)v_i` at `x=v_i*` gives `Σψ(v_i*v_i)=r`; integral r: the r-th partial isometry is an isometry, so Tomatsu's ⌈r⌉ family = README's ⌊r⌋+1 family with last term 0; non-integral: identical | equivalent | none |
| CA9 Prop. 2.7 hypotheses | §2.4 setting | infinite factor, separable predual, finite index | README = `Tomatsu2018` lines 374–378, 457 | none |
| CA9 ultrapower (r7) | `M_n`; `L(F₂)`; R | `M_n^ω=M_n`, `(M_n)_ω=ℂ`; `L(F₂)_ω=ℂ`; `R_ω≠ℂ` | as stated | none |
| CA9 central ⇒ strong (r7) | MT 8.2, K=ℂ | Def. 8.1(4) ↔ README via `a↦a*` | equivalent | none |
| CA9 Theorem D factor case (r7) | factor M | `Z(M)=ℂ`, invariant state automatic | README = lines 76–80, 2172 | none |
| CA9 Følner (r7) | `K=Irr(C)` | `F·K=K`, symmetric difference 0 | as stated | none |
| CA9 corner model Checks (r7) | `T=1⊗e_(1,pt)`; `M=ℂ` | `T*T=1`, `TT*=1⊗e₁₁`; Hom dim 2, corners 1 and 4 | as stated | none |
| CA9 Morita transport (headline) | Theorem 6.8 | both II or both III₁; equivalent bicommutant categories | README = lines 1866–1873 | none |
| CA10 tube algebras (r7) | `Hilb(ℤ/2)`, `Hilb(ℤ/3)`, `Hilb(S₃)` | 4, 9, 36; `1+1+4+9+9+4+4+4=36=6²` | as stated | none |
| CA10 conjugate real structures (r7) | `u=i·id` | `ūru⁻¹=(−i)r(−i)=−r` | as stated | none |
| CA10 classification (headline) | §4, Lemma 4.1 | real finite-depth objects of C′ up to conjugacy ↔ connected finite-depth UAPAs in `Z(C)^rev`; R of type II₁, II∞ or III₁; M fusion | README = `HPT2023Classification` lines 802–808, 821–825 | none |
| CA10 multiplication functor | Theorem 3.8, Cor. 3.9 | `Z_C(E)⊠_(Z(C))C→E` fully faithful; dominance by `⊕c⊗Y⊗c̄` | README = lines 486–494, 537–540 | none |
| Scope single owner | main QG 42; #1649 `cc02cfc6`; #1705 `c5e5bfa` | main and #1649 cite CA1a, CA2a; #1705 §0.2 (line 214) builds them, 0 citations | one second owner | R01 |

## Not verifiable

- None. Every sampled and every newly added locator was read in the cached arXiv texts, and no manifest was edited.

## Source issues

- **Misprint** in Henriques–Penneys–Tener, *Classification of finite depth objects in bicommutant categories* (`HPT2023Classification`), at §1, p. 2: the source lists the factor types as II₁, III∞ or III₁; it should be II₁, II∞ or III₁, as its abstract and §4 state; affects nothing.
- **Misprint** in Hartglass–Penneys, *C*-algebras from planar algebras II* (`HartglassPenneys2014II`), at Theorem C, p. 3: the source puts the positive cone of `K₀(A₀)` inside `K₀(A_k)`; it should be inside `K₀(A₀)`, as Theorems 5.1 and 5.5 state; affects nothing.
- **Misprint** in Masuda–Tomatsu 2009 (`MasudaTomatsu2008`), at Definition 2.4, p. 4: the source writes `Int(N)` as the intersection of `Aut(M)` with `Int₁(N)`; it should be `Aut(N)`; affects nothing.
