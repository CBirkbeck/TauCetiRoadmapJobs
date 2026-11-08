# Review of CategoricalOperatorAlgebras (pull request #888 at 0f636ea)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` (1943 lines) and `Suggested.lean` at `0f636ea`. The 190 lines changed since `a926373` were read in context, and so was every other passage of the README.

## Previous findings

- **R01 (P2), two open owners of the CA1a/CA2a objects: not repaired.** The README's lines 25–30 and 1864–1867 are unchanged, which is right (this folder keeps the ownership). The repair asked for was on the QuantumGroups side, or failing that a stated order in the pull-request description. Neither happened: #1649 is still at `968db790` with its §0.3 (line 236); #1705 moved to `36f87533`, and its §0.2 (lines 217–265) still builds C*-categories, the dagger Karoubi completion, standard solutions, `d(X)≥1` and the signed self-duality `bar(r) r=ε φ_X`; "CategoricalOperatorAlgebras" occurs 0 times in either head; the description's merge-order paragraph names only #860, #861, #1142 and #866. Carried below as R01.
- **R02 (P3), the Masuda–Tomatsu Lemma 8.2 citation: repaired.** Line 1494 now reads "(Masuda–Tomatsu 2007, Lemma 8.2, p. 64, for a unital faithful normal homomorphism M→M⊗B(K) … applied with K=ℂ … Tomatsu, Remark 2.17(1))", and lines 1922–1925 add the Comm. Math. Phys. 274 (2007) entry. Verified: `MasudaTomatsu2007` line 3037 is Lemma 8.2, after the page-64 marker at line 3005; Definition 8.1(4) at lines 3035–3036 is the README's central-freeness condition for `K=ℂ` (up to `a↦a*`, which is a bijection of M), and Definition 3.12 at lines 1058–1063 is its strong freeness. The stated hypotheses match Definition 2.2 at lines 398–402 (a left inverse is a faithful normal unital CP map with `Φ∘α=id`).
- **R03 (P3), two statements narrower than their sources: repaired.** (a) Lines 1288–1305 now prove `R⊗̄R_II₁≅R` for every hyperfinite factor with separable predual not of type I and derive the fully faithful representation in `Bim(R)` for every such R, citing Henriques–Penneys 2015 Lemma 3.4 (p. 16) and Theorem 3.5 (p. 17) and Henriques–Penneys 2020 Theorem 3.15 and Corollary 3.16 (p. 16); lines 1675–1682 add the Powers-factor Check requested. (b) Lines 946–967 state the six-term sequence "for every C*-correspondence X over every C*-algebra B, with no separability or countable-generation hypothesis", with Katsura's route through Appendix B and C, and keep the KK upgrade under separability; lines 1042–1047 add the `ℓ²(I)` Check requested.
- **R04 (P3), three groups of targets without a source: repaired.** (a) Lines 938–945 and 950–963 cite Katsura Definition 3.2 (p. 5), Definition 3.4 (p. 6), Theorem 6.4 (p. 14), Propositions 8.1–8.2 (p. 17), Definition 8.3 (p. 17), Theorem 8.6 (p. 18), Lemma B.2 and Proposition B.3 (p. 23) and Proposition B.5 (p. 24); the References entry is at lines 1897–1901. (b) Line 492 cites Coles–Huston–Penneys–Srinivas, Theorem A, p. 3, body §2.3, p. 10, with the entry at lines 1889–1893. (c) Line 1467 cites Tomatsu §2.2, p. 5 and Masuda–Tomatsu 2009 §2.4, p. 5. Every one of these locators is verified below.
- **R05 (P3), CA10 restating that `Z(C)` is fusion: repaired.** Lines 98–106 extend the PivotalSpherical row to Layer 11; lines 1739–1747 consume Layer 11 for finite semisimplicity, Hom-finiteness, finitely many simples, simple unit and `dim Z(C)=(dim C)²`, and keep here only the unitary half-braiding, `Z†(C)≃Center C`, the dagger, unitary associators and spherical unitary dual functor; line 1851 and line 1861 add "PivotalSpherical Layer 11" to CA10's `*Needs:*` and Dependencies; line 1839 adds "`(dim C)²=6²`" to the `S₃` Check. Verified against main: `TauCetiRoadmap/PivotalSpherical/README.md` line 626 is "Layer 11: the centre of a fusion category is a fusion category", with the induction functor, `dim C≠0` in characteristic zero, semisimplicity of `Center C`, the three remaining fusion hypotheses and the dimension formula (line 687).

## R01 (P2) — The C*-category and unitary-duality objects of CA1a and CA2a still have two open owners

Carried from the two previous reports (their R01). Nothing has changed on either side since.

**Location.** `README.md` lines 25–30 ("C*-categories, their finite additive and Karoubi completion … (CA1a), and C*-tensor categories with solutions of the conjugate equations … (CA2a) have their single home here; QuantumGroups consumes CA1a and CA2a"). Also lines 1864–1867 (Downstream consumers).

**Claim.** This roadmap is the single owner, and QuantumGroups consumes CA1a and CA2a.

**Witness.** On main this is true: `TauCetiRoadmap/QuantumGroups/README.md` line 42 cites "CategoricalOperatorAlgebras CA1a,CA2a". At the open revisions it is false:
- #1705 (`36f87533`), lines 20–22: "Layer 0 owns … elementary C*-categories with standard conjugates". Its §0.2 "C*-categories and standard conjugates" (lines 217–265) builds the dagger with `‖f†f‖=‖f‖²`, finite linking algebras, the additive and dagger Karoubi completion with its universal property, standard conjugate solutions with `d(X)≥1`, and the signed self-duality `bar(r) r=ε φ_X` with sign invariance on simple objects. Its Checks (`diag(2,1)`, the idempotent `[[1,1],[0,0]]`, `J²=−I` on ℂ²) are this roadmap's CA1a and CA2a Checks.
- #1649 (`968db790`), lines 21–23 and §0.3 (line 236), do the same.
- `grep CategoricalOperatorAlgebras` finds 0 lines in either head; the description of #888 names only #860, #861, #1142 and #866 in its merge-order paragraph.

**Repair.** Unchanged from the previous report. A revision of a roadmap on main is never a dependency, so this folder keeps its text and remains the owner; nothing in the folder changes. The fix is on the QuantumGroups side: in #1705 and #1649 replace §0.2 (respectively §0.3) and the C*-category and standard-conjugate parts of their Layer 0 scope with citations of CA1a and CA2a, as main's line 42 does. Until that is done, state the order in this pull request's description: #1705 and #1649 are rebased to consume CA1a and CA2a before either merges. Tested on the shared object `bar(r) r=ε φ_X` on a simple self-dual object: both #1705 line 243 and this README line 346 define it and prove sign invariance; after the repair only CA2a does.

## Verified sound

**Gate and build.**
- The push gate (`gate … --base origin/main`) at `0f636ea` prints every check at 0: `set_option`, `latex`, `prnum`, `sorry-data`, `sorry-examples`, `statement-hygiene`, `round-labels`, `layer-ids`, `target-ids`, `readme-ids-missing`, `empty-sections`, `depcheck`, `stray-files`, `outside-folder`, `source-material`, `dirty`, and `OK`. The worker's run also has `build=0`.
- `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.OA"`) only.
- `lake env lean TauCetiRoadmap/CategoricalOperatorAlgebras/Suggested.lean` exits 0 in 12.8 s with no diagnostic. The file declares nothing (one module docstring, an empty namespace), so there is no `sorry`, no one-tactic probe, no `#check` signature comparison and no fully qualified name that could clash with a sibling file. Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`.

**Dependency check.** `gate --depcheck … --movable --content …` printed `depcheck: 244 roadmaps, 2464 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- Merge order (`ORDER.txt`): VonNeumannAlgebras 6, CStarAlgebras 8, HilbertModules 9, OperatorKTheory 10, Subfactors 207, this roadmap 230, CStarClassification 231 (a scope pointer only), TemperleyLiebOperatorAlgebras 246 (a consumer).
- On main: FreeProbability, OperatorAlgebraDynamics, PivotalSpherical, QuantumGroups, Subfactors and VonNeumannAlgebras.
- Declared gaps: none (the board package has no `design/plan.json`).

**Headline theorems and `Suggested.lean`.** The README's headlines: CA2a Penneys Theorem A; CA2b Penneys Theorem C; CA3 Q-system completion (Chen–Hernández Palomares–Jones–Penneys Theorem 3.36 and Theorem A); CA4 Jones–Penneys Theorem A; CA5 Jones–Penneys relative equivalence (Theorem 5.35 and Corollary 7.14); CA6 Henriques–Penneys–Tener Theorem A; CA7 Katsura's six-term sequence for every C*-correspondence and `K_*(S(Λ,μ))`; CA8 towers of index δ², `K₀(A_k)`, Watatani index δ², `N(δ²)` bases; CA9 Henriques–Nivedita–Penneys Theorem 7.4, representation existence in every hyperfinite non-type-I factor and uniqueness in types II and III₁, the factor case of Tomatsu Theorem D; CA10 the classification bijection. The module docstring names all ten with the carrier each lacks, updated at CA7 and CA9 to match the repaired README. At the pins Mathlib has `CStarModule`, `CompletelyPositiveMap`, `VonNeumannAlgebra`, `HalfBraiding`, `Center`, `MonObj`, `EndMonoidal`, `ExactPairing`, `Karoubi` and Day convolution, and neither Mathlib nor Tau Ceti has a dagger, C*- or W*-category (a grep for "dagger" over `Mathlib/` hits only `Probability/Kernel/Posterior.lean`; "CStarCategory"/"WStarCategory" hit nothing in either library), a factor predicate, operator K-theory, a Cuntz–Pimsner algebra or a planar algebra. No headline is statable, and no padding is present.

**Cross-roadmap citations resolved (all present where cited).**
- VonNeumannAlgebras on main: Layer 4 (line 970; Sakai's theorem 987), Layer 5 (1339; halving and countable splitting for σ-finite properly infinite algebras at 1348–1355), Layer 6 (1495), Layer 11 (2785; tensor commutation `(M⊗̄N)′=M′⊗̄N′` 2873; Connes cocycle 2999; continuous core, dual action and flow of weights 3264–3278), Layer 12 (3388), Layer 13 with V13a at 3690 and V13b at 3740 (tensor permanence of semidiscreteness 3821; injective II₁/II∞ uniqueness and the III_λ/III₁ cases 3969–4019; injective III₀ factors classified by the flow of weights 4020, 4060–4081). So every input of the new `R⊗̄R_II₁≅R` route (lines 1288–1297) is on main.
- Subfactors on main: 1.1 (308), 1.2 (340), 2.1–2.5 (387–536), 3.2 (697), 3.3 (774), 5.1 (1021), 6.1–6.4 (1089–1210), 7.1–7.2 (1248, 1272), 7.3 (1311; line 1329 hands the module-category equivalence here), 8.1–8.2 (1384, 1425), 9.1–9.2 (1507, 1529). Its scope (lines 72–73) assigns Q-systems, module categories, pivotal module C*-categories and planar-to-C* completions here, and its Downstream list (1722–1726) names this roadmap for Layers 1, 2, 5–8 and 9.
- PivotalSpherical on main: Layers 0–4, 9 and 11 (626–689).
- FreeProbability on main: F2 (184), F3 (255), F4 (353). OperatorAlgebraDynamics on main: D6 owns `O_n` (line 457).
- CStarAlgebras #860 (`33ddcef7`): C4.1–C4.4 (986–1071, Stinespring at 1021), C5.4 inductive limits (1203), C5.5 cones and mapping cones (1230).
- HilbertModules #861 (`bbc2ad54`): H1 (126), H2 (179), H3 (262: unit unitaries with the left one for nondegenerate actions, imprimitivity bimodules, conjugate modules and evaluation unitaries, the linking algebra `K_B(E⊕B)`, the Rieffel correspondence and Morita invariance of simplicity).
- OperatorKTheory #866, now at `b328ec07`: K1 (302), K2 with 2.3 "Continuity, Morita invariance and cone sequences" (587: continuity of `K₀`, `K₁` for C*-inductive systems; Morita invariance for σ-unital algebras with agreement with full-corner maps, 607–610), K3 with 3.2 the six-term sequence of every extension (749–753), K4 (920), K5 (1115), K6 (1289). The new CA7 route cites exactly these.
- Consumers: TemperleyLiebOperatorAlgebras #867 cites CA1a and CA2a; QuantumGroups on main, line 42.

**Ownership by object** (`roadmaps grep -i --readme-only` over main and the open heads, re-run this round for the changed passages): "Katsura", "Cuntz–Pimsner", "anchored planar", "bicommutant categor", "Watatani", "Ocneanu ultrapower", "Powers factor" with a fusion representation occur only here; "C*-categor" and "unitary dual functor": here, #867 and QuantumGroups main as consumers, #1705/#1649 as owners (R01). The overlaps listing names no pull request that changes this roadmap and no dropped id; `roadmaps resolve` reports no unresolved citation or Lean name.

**Policy.** No process word, pull-request number, LaTeX delimiter, local path or round label in the README or the docstring (a grep for "so far", "to be checked", "checkpoint", "handoff", "packet", "revision", "pull request", "optional", "deferred", "TODO" finds nothing). Cross-roadmap citations name roadmaps and sections only.

**Source sample (30 locators in 15 texts, all read from the cache; page = printed page of the arXiv version).**
- Katsura (`Katsura2004`): Definition 3.2 line 206, p. 5 (`J_X=φ⁻¹(K(X))∩(ker φ)^⊥`); Definition 3.4 line 226, p. 6; Theorem 6.4 line 569, p. 14 (the map `O_X→C*(π,t)` is an isomorphism iff `(π,t)` injective with a gauge action, as line 941 says); Proposition 8.1 line 715 and Proposition 8.2 line 721, p. 17; Definition 8.3 line 725, p. 17 (`[X]=X_*∘(φ_X|_(J_X))_*`, with `X_*` through the linking algebra, Remark B.4 line 1026); Theorem 8.6 line 764, p. 18, for a C*-correspondence over any C*-algebra, no separability; Lemma B.2 line 998 and Proposition B.3 line 1010, p. 23 (separable case by Brown, general case by the directed union of separable sub-pairs); Proposition B.5 line 1032, p. 24; Appendix C line 1058; KK-equivalences only for separable algebras, line 788–790.
- Henriques–Penneys 2015 (`HenriquesPenneys2015`): Lemma 3.4 line 886, p. 16 (`R⊗̄R_II₁≅R` for hyperfinite R not of type I, via the flow of weights and the Connes–Haagerup–Krieger classification); Theorem 3.5 line 910, p. 17.
- Henriques–Penneys 2020 (`HenriquesPenneys2020`): Theorem 3.10 line 651, p. 14 (both type II or both III₁, separable preduals); Theorem 3.15 line 776 and Corollary 3.16 line 789, p. 16.
- Masuda–Tomatsu 2007 (`MasudaTomatsu2007`): Definition 2.2 lines 398–402 (`Mor₀`: a left inverse is a faithful normal unital CP map); Definition 3.12 lines 1058–1063 (strong outerness); Definition 8.1 and Lemma 8.2 lines 3030–3038, p. 64, for a von Neumann algebra M and finite-dimensional K; the `Comm. Math. Phys. 274 (2007)` reference confirmed at `MasudaTomatsu2008` line 2717.
- Masuda–Tomatsu 2009 (`MasudaTomatsu2008`): §2.4 line 173, p. 5; Definition 2.4 line 137 (`[r]+1` partial isometries, `v_([r]+1)=0` for integral r, `‖r⁻¹v_iφ−(φ∘φ_ρ)v_i‖→0`); Corollary 3.16(3)–(4) lines 1329–1332, p. 29.
- Tomatsu (`Tomatsu2018`): Theorem D lines 76–80 (amenable rigid C*-tensor category, centrally free cocycle actions on a properly infinite M with separable predual, approximate unitary equivalence, an invariant faithful normal state on `Z(M)`); §2.2 line 215, p. 5; Proposition 2.7 line 457; Remark 2.17(1) line 723, p. 16 (cites [38, Lemma 8.2]).
- Jones–Penneys, Operator algebras (`JonesPenneys2017Operator`): Theorem 3.8 line 976, Theorem 3.20 line 1216, Theorem 4.28 (Stinespring in C) line 1958.
- Jones–Penneys, Realizations (`JonesPenneys2017Realizations`): Definition 5.16 lines 2001–2015 (ConAlg with categorical ucp morphisms; DisInc with N–N bilinear ucp maps preserving `τ∘E`, and `DisInc_H` the full subcategory supported on `H(C)`); Theorem 5.35 line 2317; Corollary 7.14 line 3091 (restriction to unital *-algebra natural transformations and state-preserving normal N–N bilinear *-homomorphisms). The README's CA5 statement (lines 783–790) is this.
- Chen–Hernández Palomares–Jones–Penneys (`CHJP2021`): Assumption 2.7 line 280; Definition 3.1 line 555; Definition 3.14 line 733; Definition 3.17 line 779; Definition 3.18 line 795; Remark 3.19 line 819 (the item in the README's range "3.17–3.20" that is a remark, on the coequalizer); Definition 3.20 line 835; Theorem 3.36 line 1131, p. 26.
- Henriques–Penneys–Tener, Anchored (`HPT2023Anchored`, read with `grep -a`): Theorem A line 94; Definition 3.1 line 885, Definition 3.3 line 915, Definition 3.4 line 943, Definition 3.6 line 968 (3.2 is a Construction and 3.5 a Remark); Definition 4.4 line 1348, Definition 4.5 line 1362 (4.3 is a Notation). The ranges in the References cover the right items.
- Henriques–Nivedita–Penneys (`HNP2024`): Definition 4.1 line 881, Definition 4.14 line 1054, Theorem 7.4 line 1540, p. 38.
- Hartglass–Penneys II (`HartglassPenneys2014II`): Theorems A–C lines 81–100; Definition 6.11 line 1224 (`N(a)=min{n∈ℕ: n>a}`, `N(a)=a+1` for integral a); Theorem 6.13 lines 1229–1232 (a basis of size `N(δ²)` at every level, sharpness for every δ including integral δ²).
- Henriques–Penneys–Tener, Classification (`HPT2023Classification`): Lemma 3.7 line 459; the §4 setup lines 801–808, p. 16 (R of type II₁, II∞ or III₁; finite-depth real objects up to conjugation ↔ connected finite-depth unitary anchored planar algebras in `Z(C)^rev`).
- Coles–Huston–Penneys–Srinivas (`CHPS2018`): Theorem A line 103, p. 3; §2.3 line 420, p. 10, with the indecomposable, simple-basepoint form at lines 424–427.
- Penneys (`Penneys2018`): Theorem A line 122, p. 3; Theorem C line 165, p. 4; Example 4.7 line 1210, p. 25.

Every sampled locator supports the README as written, with the same hypotheses.

### Adversarial table

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| CA7 six-term, general B and X (new) | Katsura 8.6; X=0 over B | 8.6 has no separability; X=0: `ker φ=B`, `(ker φ)^⊥=0`, `J_X=0`, `O_X=T_X=B`, sequence `0→K_i(B)→K_i(B)→0` | README = source | none |
| CA7 Katsura route on `X=ℂⁿ` (new) | n=2,3 | linking algebra `M_(n+1)(ℂ)`, corner `ℂ` full, K-iso `[1]↦[e]`; `[X][1]=[1_(M_n)]=n`; `ι_*−[X]=1−n`; Prop 8.1: `φ₀(1)`= vacuum projection, generator of `K₀(K(F(X)))=ℤ`; Prop 8.2: `K₀(E_n)=ℤ[1]`, `K₁=0`; cokernel `ℤ/(n−1)`, kernel 0 | matches `K_*(O_n)` | none |
| CA7 `ℓ²(I)` Check (new) | I uncountable; I countable | `φ(1)=1∉K(ℓ²(I))`, so `φ⁻¹(K)=0`, `J_X=0`, `O_X=T_X`; sequence gives `K₀=ℤ[1]`, `K₁=0`; countable I: isometries with orthogonal ranges, no finite-sum relation, so `T_X=O_∞` with the same groups | correct, and outside the old statement | none |
| CA7 Fock ideal Morita equivalent to `J_X` (new) | fullness | `⟨F(X)J_X,F(X)J_X⟩⊇J_X⟨B,B⟩J_X=J_X` | full, so Morita | none |
| CA7 `J_X` Check | `X=ℂⁿ` unital, n=1,2,3; zero action | `J_X=ℂ`, first map `1−n`; n=2: `K₀=0`; n=3: `ℤ/2`; `K₁=0`; n=1: `C(S¹)`, ℤ, ℤ; zero action: `J=0`; dropping `(ker φ)^⊥` forces `π=0`, `t(ξ)*t(ξ)=π(⟨ξ,ξ⟩)=0`, `O_X=0` | correct, discriminating | none |
| CA7 weighted moments | `μ=(16,1)`; `c=3` | `a⁴=16`, `a=2`: `a²μ(w)=4=a⁻²μ(v)`; `a=½`: `¼` vs 64; `τ_(3μ)(p_v)=48` | orientation pinned | none |
| CA7 loop and `A(Λ,μ)` | one loop, μ=1; δ>1 | `T=S+S*`, spectrum `[−2,2]`, `C*(1,T)=C([−2,2])`, `K₀=ℤ`, `K₁=0`; `a_μ=1`, not `<1`; `a_μ(v)=δd_v>d_v`, `A=∅` | as stated | none |
| CA9 `R⊗̄R_II₁≅R` route (new) | R=R_λ; R=R_II∞; R=M_n(ℂ) | `core(R⊗̄R₁)=(R⋊_σℝ)⊗̄R₁`, centre `Z(core R)⊗̄ℂ`, dual flow `θ⊗id`: `S(R_λ⊗̄R₁)=S(R_λ)=L^∞(ℝ/|log λ|ℤ)`, so III_λ; II∞: injective II∞, unique; `M_n⊗̄R₁≅R₁≠M_n` | source Lemma 3.4 = README; type I excluded | none |
| CA9 full faithfulness of `H↦L²(R)⊗H` (new) | R factor | left and right R on `L²(R)` generate `B(L²R)`, so intertwiners lie in `1⊗B(H)`, then in `1⊗Hom_(R₁)(H,K)` | `ℂ⊗Hom(H,K)` as stated | none |
| CA9 Powers-factor Check (new) | `R_λ`, `C=Hilb(ℤ/2)` | `tr(diag(1,−1))=0`, so the product action is outer; `id⊗α` inner would put its unitary in `(R_λ⊗1)′∩(R_λ⊗̄R₁)=1⊗R₁`; for outer ρ, `tρ(a)=at` gives `t*t,tt*∈ℂ` and ρ inner, so `t=0`; `End(_ρL²)=ρ(M)′∩M=ℂ` | fully faithful in III_λ | none |
| CA9 MT2007 Lemma 8.2 direction (new) | K=ℂ, β=α_X | Def 8.1(4): no `a≠0` with `α^ω(x)a=xa`; README: no `a≠0` with `ax=α^ω(x)a`; `a↦a*` and `x↦x*` exchange them on the *-closed `M_ω` | equivalent | none |
| CA9 Tomatsu Thm D (factor case) | factor M; `Irr(C)={1}` | `Z(M)=ℂ` has one state, hypothesis automatic; countable `Irr(C)` is the standing assumption; trivial C: central freeness vacuous (Remark 2.17(3)) and the conclusion is trivial | README = source | none |
| CA9 rank-r approximate innerness | r=2.5; r=2 | `⌊r⌋+1=3` maps, 2 isometries; r=2: `v₃=0`; Tomatsu uses `⌈r⌉` maps in `M^ω`, same condition | README = MT Def 2.4 | none |
| CA9 MT Cor 3.16(3)–(4) | II∞, III₁ | `Int_r={ρ: τ∘φ_ρ=r⁻¹τ}`; `End(M)₀=Int_r` for every r | README = source | none |
| CA9 II∞ amplification n=2 | Cuntz pair | `φ_ρρ=id`, `τφ_ρ=τ/2`, `(D(τ/2):Dτ)_t=2^(−it)`, `ρ̃(u_t)=2^(it)2^(−it)u_t=u_t`, `mod=θ₀` | as stated | none |
| CA9 dual-action sign | VNA 3264–3268 | `θ_s(h)=e^s h` gives `Tr∘θ_s=e^sTr`; MT's `θ_(log(r/d))` with the negative action equals `θ_(log(d/r))` | consistent | none |
| CA9 End_rev tensor | `u=diag(1,i)`, `v=σ_x` | `uv=[[0,1],[i,0]]`, `vu=[[0,i],[1,0]]` | not proportional | none |
| CA9 `U_(ρ,σ)` direction | `x⊗η↦σ(x)η` | `ρ(a)x⊗η↦σ(ρ(a))σ(x)η` | lands in `_(σ∘ρ)H₀` | none |
| CA9 standardizability | II∞ factor | a unital normal copy of properly infinite M cannot sit in a finite algebra, so bimodule supports are properly infinite and equivalent to 1 | as stated | none |
| CA9 ultrapower Checks | `M_n(ℂ)`; `L(F₂)`; R | `M^ω=M`, `M_ω=ℂ`; no property Γ gives `M_ω=ℂ`; `R_ω≠ℂ` | discriminating | none |
| CA9 corner model Checks | `M=ℂ`, `I=pt`, `J={1,2}` | Hom = 2×1 block of `M₃(ℂ)`, dim 2; corners dim 1 and 4; `T=1⊗e_(1,pt)`: `T*T=1`, `TT*=1⊗e₁₁` | as stated | none |
| CA9 transpose on pairs | `c=(ℂ²,ℂ)`, `d=(ℂ,ℂ³)` | `⟨F(c),d⟩=HS(c₁,d₂)`, dim 6; `F^t=F` gives `HS(c₂,d₁)`, dim 1 | discriminating | none |
| CA9 transpose on Hilb | `F=−⊗ℂ^k` | `HS(c⊗K,d)≅c̄⊗K̄⊗d≅HS(c,d⊗K̄)`, so `F^t=−⊗K̄`; all three candidates have dim `mnk` | correct as worded | none |
| CA9 Følner | `K=Irr(C)` | `Z≺X⊗(X̄⊗Z)`, so `F·K=Irr(C)`, symmetric difference ∅ | as stated | none |
| CA9 HP 3.10 uniqueness | type pairs | both II or both III₁, separable preduals | README = source | none |
| CA10 Layer 11 consumption (new) | `C=Hilb(S₃)` | Layer 11: `dim Z(C)=6²=36`; CA10 Check: `1+1+4+9+9+4+4+4=36`; eight simples = (class, centralizer irrep): (e;1,1,2), (transpositions;ℤ/2: 3,3), (3-cycles;ℤ/3: 2,2,2) | agree | none |
| CA10 tube algebras | `Hilb(ℤ/2)`, `Hilb(ℤ/3)`, `Hilb(S₃)` | `#{(i,k)}=4, 9, 36`; nonzero iff `j=k⁻¹ik` | as stated | none |
| CA10 `r=±id` | `u=i·id` | `ū=−i·id`, `ūru⁻¹=(−i)r(−i)=−r` | conjugate | none |
| CA10 HPT Lemma 3.7 and §4 | identity lift | hypothesis "`Ψ^Z` fully faithful" holds; R of type II₁, II∞, III₁ as README | README = source | none |
| CA10 `Z†(C)≃Center C` (new) | `C=Hilb_fd` | `Center(Hilb_fd)=Hilb_fd`, every half-braiding the flip, unitary | consistent with Check | none |
| CA2a Penneys Thm A | `Hilb(ℤ/2)`; pair groupoid | `χ(g)²=1` gives `χ=1` in `ℝ>0`, `±1` in `ℂ^×`; `t>0` family; Ex. 4.7 `dim_L(E_uv)=λ(u)/λ(v)` | README = source | none |
| CA2a spherical state | t=4; t=1 | `dim_L=2`, `dim_R=½`; weights (½,½): 1 vs ¼; (1/5,4/5): 2/5 = 2/5; equal weights spherical iff t=1 | discriminating | none |
| CA2a sign Checks | `J(a,b)=(−b̄,ā)`, `J′`, `J(a)=cā` | `J²=(−a,−b)`, `J′²=id`, `J²a=|c|²a=a`; `(J⊗J)²=+1` | as stated | none |
| CA2b Thm C, nonsimple `1_±` | `u₁—w—u₂` | `1₊` two simples, `P_(0,+)=ℂ²`, `P_(0,−)=ℂ`; connected iff `1_±` simple (p. 23) | as stated | none |
| CA2b TL Gram | basis {1,e}; δ=√2, 1 | entries `δ²,δ,δ²`; det `δ²(δ²−1)` = 2, 0 | positive iff δ>1 | none |
| CA2b CHPS Thm A (new locator) | statement | indecomposable pivotal right module C*-categories with simple basepoint `m=m◁1₀` ↔ connected right planar modules | README = source | none |
| CA3 normalisations | `Q=M₂`, `⟨x,y⟩=½Tr(x*y)` | ONB `√2e_ij`; `mm†=4`, `i†i=1`; `m′=m/2`, `i′=2i`: `m′m′†=1`, `i′†i′=4`; wrong `m/4` gives ¼ | as stated | none |
| CA3 morphism rescaling | `f:ℂ→M₂` | `f′=2f`, `f′i₁′(1)=2=i₂′(1)`; unscaled 1≠2 | as stated | none |
| CA3 completion (CHJP 3.36) | statement | complete iff every Q-system splits as `X⊠X∨` with unitarily separable dual; Assumption 2.7 | README = source | none |
| CA4 Stinespring Check | `θ=½Tr` on `M₂` | `K=M₂`, dim 4; `K=ℂ²` forces a vector state, density `½·1` has rank 2 | discriminating | none |
| CA4 transpose not CP | `c=ℂ²` | flip has eigenvalue −1 | as stated | none |
| CA5 Checks | `N⋊ℤ/2`, `N⋊ℤ` | `d_Q=2=[M:N]`; ℤ: `N′∩M=ℂ`, infinite index | discrete ≠ compact | none |
| CA5 JP 5.35/7.14 (sampled) | morphisms | ConAlg ucp ↔ N–N bilinear ucp with `τ∘E_P∘ψ=τ∘E_M`; 7.14 restricts to *-homomorphisms | README = source | none |
| CA6 Checks | `Hilb(ℤ)` vs `Hilb(ℤ/2)`; `P[0]=ℂ²`; `x=ℂ²`, n=3 | infinite vs finite support; `ψ(r⁻¹(1,0)(1,0))=½`; `2³=8` vs `2⁶=64` | as stated | none |
| CA8 `N(δ²)` | 2, (3+√5)/2, 3, 4 | 3, 3, 4, 5 | as stated | none |
| CA8 `A₃` at δ=√2 | `(1,√2,1)` | `√2=δ·1`, `1+1=δ·√2`; `K₀=ℤ³` | as stated | none |
| CA8 HP-II B, C | TL(√2) | cone and scale on `K₀(A₀)`; source misprints `K₀(A_k)` | README pins `A₀` | Source issue |
| CA1a C*-identity | `diag(2,1)`; `C([0,1])` | 4=4; HS 5 vs √17; projections {0,1} | as stated | none |
| CA1a completions | one object | Karoubi = `Hilb_fd`; W*-completion has `ℓ²`; `Σ1/n²=π²/6`, `Σ1/n` diverges | differ | none |
| CA1b Checks | zero action; `M₂`; `ℂⁿ` | `A⊗_A X=0≠ℂ`; `J(b*ξa*)=aξ*b`; dims n², 1 | as stated | none |
| Scope / Downstream single home | main QG 42; #1705; #1649 | main cites CA1a, CA2a; the revisions own §0.2/§0.3; 0 mentions | two owners | R01 |

## Not verifiable

- None. Every cited text was read from the arXiv copies in the sources cache. No manifest was edited.

## Source issues

- **Misprint** in Hartglass–Penneys Part II (arXiv:1401.2486) at Theorem C, p. 3: the source writes the positive cone of `K₀(A₀)` as a subset of `K₀(A_k)`; it should be `K₀(A₀)`; affects nothing.
- **Misprint** in Masuda–Tomatsu 2009 (arXiv:0802.0344) at Definition 2.4, p. 4: the closing sentence writes `Int(N)` as the intersection of `Aut(M)` with `Int₁(N)`; it should be `Aut(N)`; affects nothing.
