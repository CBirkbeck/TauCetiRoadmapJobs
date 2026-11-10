# Review of IntegralHeckeAndGaloisDeterminants (pull request #1689 at b6df7e6)

**Verdict:** accepted

This is a full review: the folder changed by 467 lines since `4d32e6c`. The four findings of the previous review are repaired, and the whole roadmap was reviewed again. No finding remains. The gate passes, and the folder is ready for a human's final approval.

Locations are in `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md` unless another file is named.

## Verified sound

### Previous findings (r7), checked against this head

- **R01 (two owners of rational cohomology and induction) — repaired.**
  - README:80–88 now reads "**ReductiveGroups** (§1.1, *Rational cohomology and algebraic induction*) supplies rational cohomology over a flat commutative Hopf algebra … This roadmap consumes them and proves only the invariant product".
  - README:569–584 is the supplier contract. I compared it clause by clause with ReductiveGroups §1.1 on main (`TauCetiRoadmap/ReductiveGroups/README.md:1085–1190`): enough injectives, the complex `M ⊗ H^⊗n` with its cofaces, `H⁰ = Mᴴ`, cofree acyclicity, functoriality, connecting maps, the coefficient-last comparison, left exactness, transitivity, the points description `F(hg)=hF(g)` and the antipode involution are all stated there.
  - §0.7 keeps one target, *Invariant products on rational cohomology* (README:1315–1348). The targets *Rational cohomology of a flat affine group scheme* and *Algebraic induction* are gone, and no roadmap on main or in an open pull request cites either heading.
  - The *Needs:* lines of §6.4 and §6.7 (README:4193, 4259–4261, 4345, 5004) point at ReductiveGroups §1.1.
- **R02 (two derived headlines) — repaired.** `Suggested.lean` no longer declares `Determinant.exists_unique_trace_eq` or `Determinant.existsUnique_descent_kerLift`. Its docstring (`Suggested.lean:20–23`) says the IHG.5 descent "is the one-map case of the IHG.4 gluing theorem" and that "neither is stated again". README:1059–1062 and README:3460–3462 keep both targets as prose with no backticked deleted name.
- **R03 (roadmap sections cited for pinned declarations) — repaired.** README:508–525 lists `TauCeti.fittingIdeal_zero_le_annihilator`, `TauCeti.ContCohomology.Z1`, `B1`, `H1`, `explicitRes1`, `TauCeti.Ring.IsJapanese` and `TauCeti.Ring.IsNagata` under *From Tau Ceti*. PadicMeasuresIwasawaAlgebras §4.5 is no longer cited anywhere, and SchemeAndStackFoundations §0.20 is cited only for the two `of_complete_local` theorems.
- **R04 (Koszul cohomology annihilation) — repaired.** README:460–466 and README:4580–4587 cite `TauCeti.koszulComplex.span_le_annihilator_cohomology`; the §6.5 target now owns only the vanishing of `H^q` for `q < d` and the degree-zero identification.

### Gate, dependencies, outside files

- My gate run at this head printed every counter `0` and `OK` (`set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0`). The worker's run adds `build=0`.
- The dependency check printed `depcheck: 236 roadmaps, 2138 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The merge order lists SmoothRepresentationsOfLocalGroups immediately before this roadmap; ReductiveGroups, the new supplier, is on main.
- `git diff --stat origin/roadmap/smooth-representations-of-local-groups-v2...HEAD` outside the folder is empty.
- The overlap report lists no pull request that changes this roadmap, no dropped id and no id that only an open revision defines.
- The library pins of `lake-manifest.json` are Mathlib `1b1ccf4b088b…` and Tau Ceti `2fd255d997f4…`, as README:209–211 and the description state.

### Lean (elaborated with `lake env lean`)

- An unmodified copy of `Suggested.lean` gave exactly 20 `declaration uses 'sorry'` warnings and nothing else. The file has 20 theorems, as the description says.
- One-tactic probe: replacing every `sorry` by `first | rfl | (simp; done) | infer_instance | (intros; simp_all; done) | trivial | decide` fails on all 20 theorems. Nothing is padding.
- I compared the 57 elaborated types of the worker's signature list with the README statements. The six "looks dropped" leads are false positives: five are the binder `[HasDerivedCategory (ModuleCat A)]`, which is present in each elaborated type, and one is `[Algebra A R]` on `cycleTerm`, whose type does not mention it.
- No `set_option`, no sorry'd data, one `import Mathlib` and four `TauCeti.*` imports, `theorem` throughout.

### Library declarations opened at the pins

Tau Ceti, with file and line:

- `TauCeti.koszulComplex.smul_cohomology_eq_zero` (`RingTheory/KoszulComplex/Cohomology.lean:47`), `range_le_annihilator_cohomology` (:61) and `span_le_annihilator_cohomology` (:70). The cohomology is that of `(koszulComplex φ).linearYonedaObj R N`, as the README says.
- `TauCeti.Comodule.induced` (`Algebra/Coalgebra/Comodule/Induced.lean:102`, under `[Module.Flat R C]`), `inducedEquiv` (:215) and `inducedMap` (:263).
- `TauCeti.Comodule.tensor` (`TensorProduct.lean:455`; `tensorCombine` sends `(m⊗c)⊗(n⊗d)` to `(m⊗n)⊗cd`), `fixedSubcomodule` (`Fixed.lean:60`), `dual` (`Dual.lean:204`, finite projective over a Hopf algebra) and `exteriorPower` (`ExteriorAlgebra/Power.lean:73`, commutative bialgebra).
- `TauCeti.fittingIdeal_zero_le_annihilator` (`RingTheory/FittingIdeal/Determinant.lean:143`), with `[Module.Finite R M]` only.
- `TauCeti.ContCohomology.B1` (`LowDegree.lean:184`, the range of `d⁰(m)(g) = g•m − m`), `mem_B1_iff` (:200), `Z1` (:506), `mem_Z1_iff` (:522, continuity and `groupCohomology.IsCocycle₁`), `H1` (:829) and `explicitRes1` (`ExplicitFunctoriality.lean:608`).
- `TauCeti.Ring.IsJapanese` (`RingTheory/Japanese.lean:125`, every finite extension of the fraction field) and `TauCeti.Ring.IsNagata` (`RingTheory/Nagata.lean:65`, noetherian with Japanese prime quotients).
- `TauCeti.exists_unit_conj_of_algEquiv` (`Algebra/CentralSimple/SkolemNoether.lean:139`).

The pins have not moved since the previous review, so its object search (polynomial-law kernel, pseudocharacter, Cayley–Hamilton algebra, generalized matrix algebra, ghost, Vaccarino, Buchsbaum–Rim, good filtration) stands. I repeated the search for a polynomial-law kernel, pseudocharacters, Cayley–Hamilton algebras, ghosts and Vaccarino in both pinned libraries and found none.

One record that needs no change: the Layer 1 *Dependencies* paragraph (README:2884–2886) names `TauCeti.ContCohomology`, while no Layer 1 *Needs:* line uses it. The declarations exist at the pin, so the reference resolves and adds no order constraint.

### Cross-roadmap citations resolved

- ReductiveGroups §1.1 on main (:1085–1190), and its ownership sentence at :66–67. The open revision of ReductiveGroups has the same §1.1.
- SchemeAndStackFoundations §0.20 (:1448, :1477–1478, :1542) and §2.22 `IsAzumaya.exists_etale_matrix_splitting` (:4604, :4626, :4718).
- PadicMeasuresIwasawaAlgebras §5.1 (:3172, :3213–3214).
- DerivedModuleAlgebra §§0.DP.1–0.DP.2 and §0.K.1 (:16–17, :122, :126, :209).
- ProfiniteCohomology layer 2 (:1022), ClassFieldTheory layer 7 (:1204, :1224, :1229), ModularForms layer 9 (:1016, :1022), Completed/Chebotarev layer 10 (:410), SemisimpleAlgebras layers 0, 2, 3, 4, 5 (:169–274). The six link anchors match these headings.
- SmoothRepresentationsOfLocalGroups in this branch's base: *gln-generators* (:3357), *gsp4-spin-polynomial* (:3599), *gsp4-galois-comparison* (:3623), *One integral finite-wild cocycle scheme* (:5027), *Finite-wild excursion algebra* (:5139), and its downstream rows for IHG.3a (:5320–5321).
- AlgebraicVectorBundles L0C (:356) and FreeProbability (:119), which cite this roadmap.

### Ownership against open pull requests

`roadmaps grep` across main and the 438 open heads, by object:

- Vaccarino's theorem and Buchsbaum–Rim complexes occur only here.
- An invariant product or cup product on rational cohomology of a Hopf algebra occurs only here.
- Ribet modules and lattices are cited from here by ArithmeticGaloisRepresentations, GlobalGaloisDeformationsPartII, GL2ModularityLifting, CyclotomicClassGroupsAndStickelberger and IntegralIwasawaTheory.
- LanglandsParameterStacks cites §0.7 for *General invariant-word colimit*, *Untwisted excursion comparison*, *Connected reductive pseudocharacter* and *Universal reductive pseudocharacter ring*; all four headings exist at this head. It owns good filtrations over fields, not the integral `GL₂/ℤ` form here.

No second owner was found.

### Seeded sample: sources read at the locators

Printed pages are checked against the page markers of each text.

| Target | Source lines read this round | Result |
|---|---|---|
| 0.2 | Chenevier: §1.5 (line 350), Remark 1.4 (344), Example 1.8 and Lemma 1.9 (411, 435), §1.10 with (1.3) (452–490), Lemma 1.12 (493–496), Lemma 2.2 (973–978) | p.9, pp.10–11, p.12, p.24 as cited |
| 0.4 | Chenevier: Proposition 1.6 (371), Example 1.7 (385), Theorem 1.15 (619). Emerson–Morel Theorem 1.12 (176) | pp.9–10, p.15, p.5 |
| 0.5 | Chenevier: Example 1.11(ii) and (1.3) (478–490), Lemma 1.12(ii)–(iv) (494–496), Corollary 1.14 and proof (593–600), Proposition 1.27 and proof (804–823), Remark 1.28 (824–837), Proposition 1.29 (838–845), Lemma 1.19 (687), §2.30 to Lemma 2.33 (1543–1585) | p.12, pp.14–15, p.17, pp.20–21, pp.37–38. Proposition 1.27 proves injectivity with `d!` inverted through (1.3) and bijectivity over `ℚ`-algebras through Procesi, as the README says |
| 1.1 | Chenevier: §1.17 (649), Example 1.20 (723), Lemma 1.21 (731) | pp.16–18 |
| 1.2 | Chenevier: Lemma 2.2(iii) (975–978), Lemma 2.4(1)–(4) (1021–1030), Lemma 2.7 (1085–1108), Lemma 2.8 (1110–1118), Example 2.9 (1140–1147), Theorem 2.12 (1165–1168), Lemma 2.14 (1177–1191), Lemma 2.15 (1254–1260), the exponent `(f,q)` and `det_S` (1271–1281), Theorem 2.16 (1282–1302), Lemma 2.17 and proof (1304–1345), Definition–Proposition 2.18 (1346–1356), Definition 2.19 (1377) | pp.24–33 as cited. The exponent is the least `q` with `K^q ⊆ k′`, the dimension is `nqf`, and the finiteness cases are `k` perfect, `[k:k^p] < ∞` or `d < p` |
| 1.3 | Chenevier: Lemma 2.10(i) (1151–1158), Theorem 2.22 (1404), Lemma 2.6 (1075). Allen–Newton–Thorne Theorem 2.4 and Proposition 2.5 (198, 213). Bellaïche–Chenevier Definition 1.3.1 (776), §1.3.2 (819), Lemma 1.3.5 (859), Proposition 1.3.9 (923), Lemma 1.4.3 (1218), Theorem 1.4.4 (1276). Wang–Erickson Definition 2.22, (2.3), Proposition 2.23 (721, 732, 747) | p.28, p.34, p.26; p.5; pp.20–23, pp.30–31; pp.15–16 |
| 1.4 | Bellaïche–Chenevier: Proposition 1.5.1 (1339–1346), §1.5.3 (1448–1461), Theorem 1.5.5 (1462–1463), §1.5.4 and Theorem 1.5.6 (1498–1515), Proposition 1.7.1 and proof (1802–1816). Caraiani–Newton Proposition 3.2.3 and proof (2465–2475). Ribet Proposition 2.1 and proof (167–200) | pp.32–37, p.42; p.49; pp.154–155 (PDF page + 149). Proposition 1.7.1 bounds the number of generators above by the product of the two `Ext¹` dimensions, the direction the README states |
| 2.1 | Boxer–Pilloni Lemma 2.4.3 and proof (892–902). ACC Lemma 2.2.4 (1003) | p.18; p.920 (PDF page + 896) |
| 2.3 | Bökstedt–Neeman Corollary 1.7, Definition 2.1, Remark 2.2 (139, 149, 153), Proposition 3.2 (362). Boxer–Pilloni Lemma 2.4.6 (948). Calegari–Geraghty §7.1 (3211, 3323). Stacks 00M9 (algebra line 10498) | p.213, p.221 (PDF page + 208); p.19; pp.70–73 |
| 5.1 | Scholze: Definition 5.1.8, Remark 5.1.9, Corollary 5.1.10 (3514–3537), Corollary 5.1.11 (3545), Theorem 5.4.1 and the end of its proof (4313–4356) | p.1037, p.1038, pp.1058–1059 (PDF page + 944) |
| 5.2 | Scholze: proof of Theorem 5.4.1 (4349–4356: a square-zero kernel and two bounded ideals), footnote 29 (4392) | p.1059, p.1060 |
| 5.3 | Chenevier Theorem 2.12 (1165–1168) and Theorem 2.22 (1404). Scholze Corollaries 5.4.3 and 5.4.4 (4398, 4407) | p.28, p.34; p.1060 |
| 6.3 | DKSW: (35) (727), (38) (755), (39)–(42) (778–803), Lemma 3.1 (807), Lemma 3.2 (834), (47) (877), Proposition 3.3 (881), Corollary 4.17 (1120) | pp.17–21, p.27 |
| 6.4 | DKSW: Definition 4.1 and Example 4.2 with (48) (917–968), Definition 4.3 and Theorem 4.4 (971–983), Definition 4.6 and Theorem 4.7 (988–1003), Theorem 4.8, Corollary 4.9, Theorem 4.10 (1007–1015), Lemmas 4.11–4.12 and proofs (1016–1048), Corollary 4.13 and proof (1049–1061), Lemma 4.14 (1062–1072), Theorem 4.15 (1073–1096), Theorem 4.16 (1100–1114), Corollary 4.17 (1120) | pp.22–27 as cited. The action formulas on `A, B, C, D` equal README:4370–4373 |
| 6.5 | Buchsbaum: Lemma 1.1 (68), Proposition 2.1 and Corollary 2.2 (183, 188), Theorem 2.9 (314), Lemma 2.11 (396), Proposition 3.1 (440). DKSW: Definition 5.1, Theorem 5.2, Lemma 5.4 (1505–1517), Lemma 5.11 and proof (1776–1790), Corollary 5.12 with (70) (1791–1799), Proposition 5.13 (1823–1832), Proposition 5.14 and §5.9 (1895–1926), (60), (62) (1476, 1497). Stacks 068P (more-algebra line 3814), 0663 (3244) | pp.184–194 (PDF page + 182); pp.36–46; Lemmas 15.31.16 and 15.29.6 |

Also read: Stacks 07ZA (more-algebra line 840), 00IN (algebra line 5678) and 032W (algebra line 20974).

### Adversarial pass (computed this round)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Invariant product is a cochain map (§0.7) | `H = ℤ[t,t⁻¹]`, `M = ℤe` of weight one; `N` trivial, then `N = ℤf` of weight one | `d⁰(e) = e⊗(t−1)`; inserting `1` gives `(e⊗1)⊗(t−1) = d⁰(e⊗1)`; with `f`: `d⁰(e⊗f) = (e⊗f)⊗(t²−1)` against `(e⊗f)⊗(t−1)` | Holds exactly for invariant `n` | none |
| `δ(x·n) = δ(x)·n` (§0.7) | `C₃` over `ℤ`, `0 → ℤ → ℤ → ℤ/3 → 0`, `n = 2` | `H¹(C₃,ℤ) = 0`, `H²(C₃,ℤ) = ℤ/3`, so `δ` is an isomorphism; `δ(2x) = 2δ(x)`, and `−2δ(x) = δ(x) ≠ 2δ(x)` | Sign `+` | none |
| Degree-zero product (§0.7) | trivial group, `M = N = ℤ` | `(2,3) ↦ 2⊗3 = 6` | Agrees | none |
| Amitsur's formula (§0.5) | degree 2; `r = E₀₁`, `s = E₁₀`; `r = s = I₂` | `det(tE₀₁+uE₁₀) = −tu = tu(0·0 − 1)`; `(t+u)² = t²+u²+tu(4−2)`; the word `rs` enters with `(−1)^(2−1)` | Agrees | none |
| Integral Newton identities (§0.5) | `M = [[2,3],[4,5]]`, `k = 2` | `tr M² = 53`; `2Λ₂ = 7·7 − 53 = −4`; `det M = −2` | Agrees | none |
| `Determinant.eq_of_charpoly_eq` | trivial monoid, `d = 2` | both laws have `χ(1) = (X−1)²` and value `49` at `7` | Agrees | none |
| `Determinant.isPseudocharacter_trace` | `d = 0` | the `S₁` sum is `T(x₀)`, so `T = 0`, which is `trace` in degree zero; `T(1) = 0 = d` | Agrees | none |
| `Determinant.injective_trace` | `𝔽₂[T]`, squares of evaluation at `0` and `1` | `χ(T) = X²` and `X²+1`; both traces `0`; `2!` is not a unit | Hypothesis necessary | none |
| `Determinant.exists_unique_trace_eq_of_isUnit` | `d = 0`; `R = 0` with `d ≥ 1` | `0! = 1`, `T = 0`, unique law `1`; for `R = 0`, `T(1) = d = 0` in `A` and `d` divides the unit `(2d)!`, so `A = 0` | Agrees | none |
| `Determinant.exists_vaccarino` | `X = ∅`; `d = 2` with one letter | `Γ^d(ℤ) = ℤ`, `ψ(γ_d(n)) = n^d`, range `ℤ`; `ψ(e₁) = x₁₁+x₂₂`, `ψ(e₂) = x₁₁x₂₂−x₁₂x₂₁`, `x₁₂ ∉ ℤ[tr, det]` | Agrees with Chenevier line 619 | none |
| CH ideal (§1.1) | `ℤ[X] → ℤ`, `X ↦ 0`, degree one; identity of `ℤ` | `χ(r) = r − D(r)`, `CH = (X)`; `CH = 0` | Agrees | none |
| Corner determinant (§1.2) | `M₃`, `e = diag(1,1,0)`; the same over `𝔽₂` | `D(1−e+te) = t²`, `D_e` the `2×2` determinant; `Tr(e) = 2 = 0` | Rank is read from the law | none |
| Frobenius law and norm determinant (§1.2) | `k = 𝔽₂(u,v)`, `L = k(√u,√v)`; `C = M₂(L)`; `ℂ × ℝ` over `ℝ` | `(f,q) = (1,2)`, `F²(√u) = u`, `N_{L/k}(√u) = u²`; `nfq = 4` against `n[L:k] = 8`; `2 + 1 = 3` | Agrees with Chenevier lines 1271–1299 | none |
| `Determinant.exists_semisimple_realization` | `n ↦ [[1,n],[0,1]]` over `ℂ` | realization `diag(1,1)`; `g − 1` lies in both kernels | Agrees (Chenevier line 1168) | none |
| Inner conjugacy (§1.3) | `U = [[1,1],[0,1]]` | `U E₀₀ U⁻¹ = [[1,−1],[0,0]]` | Agrees | none |
| Adapted ring, GMA determinant (§1.3) | `M₂(A)`; scalar blocks | `A[b,c]/(bc−1)`; `ad − φ(b,c)` | Agrees | none |
| Reducibility ideal (§1.4) | `[[A,A],[π^rA,A]]`; upper triangular | `A₁₂A₂₁ = (π^r)`; `0` | Agrees | none |
| Extension-dimension bound (§1.4) | upper triangular algebra over a field | `I_red = 0` needs `0` generators; `0 ≤ 1·0` | Direction as Bellaïche–Chenevier line 1811 | none |
| Coboundary convention (§1.4), `classical_ribet_lattice` | `U_t diag(2,3) U_{−t}`, `t = 5` | `[[2,5],[0,3]]`: upper entry `t(ψ−χ)` | The negated clause is non-splitting | none |
| `coefficient_descent` | `A = B` | `P = 1`, `ρ_A = ρ` | Agrees | none |
| `HeckeImage.derived_hom_finite` | `ℤ[0]`, `ℤ[0]`; support `[1,0]` | `Hom = ℤ`; the object is `0` | Agrees | none |
| `HeckeImage.ghost_nilpotence` | `δ : 𝔽₂[−1] → 𝔽₂[0]` on `[0,1]`; `ℤ[X]` acting through `δ` | `δ ≠ 0`, `δ² = 0`, exponent `b−a+1 = 2`; `ker α = (2,X²)`, ghost kernel `(2,X)` | Exponent sharp | none |
| Telescope (§2.3) | `t = −1`; `t = 2` on `ℤ` | `[0,3] = [1,−3]`, so `[0,3]+[1,3] = 0`; colimit `ℤ[1/2]` | Agrees | none |
| `Determinant.eq_of_charpoly_frobenius` | conjugates; `C₂` over `𝔽₃` observed at the identity only | `χ(hgh⁻¹) = χ(g)`; trivial and sign both give `X−1` at `1` and differ at the generator | Density necessary | none |
| `Determinant.existsUnique_isCoefficientChange_of_compact` | `𝔽₂×𝔽₃` with both projections; empty family; `ι = Unit` with a kernel lift | `1+1 ↦ (0,2)`; joint injectivity into a point forces `A = 0`; the one-map case is the §5.1 descent | Agrees | none |
| `Determinant.existsUnique_interpolation` | `ℤ₂`, `J_r = (2^r)`, degree one, `P = X − 3` | `D_r = X − 3 mod 2^r`; compatibility of the `D_r` follows from Frobenius uniqueness over the discrete quotients; `⋂ J_r = 0` | Agrees | none |
| Descent Checks (§5.1) | `ℤ/4 → ℤ/2` | `X−3 ↦ X−1`; `(X−3)(X−1) = X²+3 ↦ X²+1 = (X−1)²` | Agrees | none |
| Nilpotence exponents (§5.2) | `ℤ/64` with `(8)`, `(2)`; `ℚ[x,y]/(x²,y³)`; `ℤ/8` with `id` and reduction to `ℤ/4` | `(2)⁶ = 0`, `(2)⁵ = (32) ≠ 0`; `(x+y)³ = 3xy²`, `(x+y)⁴ = 0`; exponent `1·max(3,2) = 3`, `(2)² = (4) ≠ 0` | All three bounds sharp | none |
| Change of lattice (§5.3) | `P = diag(2,3)`, `U = [[2,6],[0,3]]` | `PUP⁻¹ = [[2,4],[0,3]]`; `c = 2 ↦ 4/3 = (2/3)c` | Agrees | none |
| `GLₙ` and `GSp₄` polynomials (§3a) | `n = 2`, `q = 2`, `T = (1,3,5)`; `Q` and `P` at `q = T₀ = 2`, `T₁ = 3`, `T₂ = 5` | `X²−3X+10`; `Q = X⁴−3X³+30X²−48X+256`; `X⁴Q(8/X)/256 = X⁴−(3/2)X³+(15/2)X²−6X+16 = P` | Agrees | none |
| Local relation matrix (§6.3) | `Y_σ = [[1,2],[3,4]]`, `Y_τ = [[5,6],[7,8]]`, `x = 9, 10` | `A = −2`, `B = −38`, `C = −29`, `D = −7`; equal to `−(x_σ−Y_σ)·adj(x_τ−Y_τ) = −[[2,38],[29,7]]` | Agrees | none |
| Formal determinant comparison (§6.7) | `h = 1`, `x = 2`, `ν = 4`, `a = 2`, `Ĩ = (2)` | altered determinant `0`; `π(e) = −6`; `π(det 𝔈) − det E_arith = 6 − 4 = 2`; `4 ∈ (2)` | Agrees | none |
| Lower-Borel Hopf coordinates (§6.4) | `g = [[2,0],[3,5]]`, `h = [[7,0],[11,13]]` | `y(gh) = 3·7 + 5·11 = 76`, `y(hg) = 61`; `Δy = y⊗x + z⊗y` | Order pinned | none |
| Induction sign (§6.4) | `b = [[x,0],[y,z]]` | `b(gb) = z·b(g)`, `d(gb) = z·d(g)`, so `λ = (0,−1)` and the span is `(ℤ²)^∨`; `(b/det)(gb) = x⁻¹(b/det)(g)`, so `λ = (1,0)` | Agrees | none |
| Twisted Borel cohomology (§6.4) | `ℤ(1)`, `ℤ`, degrees 1 and 2 | `H¹(B,ℤ(1)) ≅ H⁰(G,ℤ) = ℤ`; `H¹(B,ℤ) = 0`; `H²(B,ℤ(1)) = 0` | As DKSW lines 1016–1029 | none |
| Exterior contraction (§6.5) | `ℤ²` | `ω(e₁*∧e₂*)(e₁∧e₂) = 1`; `ω(e₁*)ω(e₂*)(e₁∧e₂) = ω(e₁*)(−e₁) = −1` | Sign as Buchsbaum line 68 | none |
| `IntegralRibet.generic_combinations_regular` | `(2)` in `ℤ` and in `ℤ/4`; `(x)` with `ℓ = 2`; `ℓ = 0` | `2V` regular over `ℤ`; `[2]` is not weakly regular in `ℤ/4`; `V₁·V₂x ∈ (V₁x)` with `V₁ ∉ (V₁x)`; the empty list | Hypotheses necessary | none |
| `IntegralRibet.mixed_scalar_regular` | `n = k = 0`; one singleton block; one block `{1,2}` with `u = 0`, `ℓ = 2` | generic forms in `u` variables; minor ideal `0`; `(V₁₁b′₁+V₁₂b′₂)b₁ − b′₁L₁ = V₁₂(b′₂b₁ − b₂b′₁)` | Bound `u + k` sharp | none |
| Variable count (§6.5) | `N = 4`, `s = 1`, `t = 0`, `a₅ = 2` | `L = 3 = u₀ + s`; the `5×5` determinant is `−ν₃` | Agrees | none |
| Difference modules and cocycle (§6.1) | `n ↦ [[1,n],[0,1]]`; `ℤˣ` scalar; `g = diag(2,3)`, `h = [[1,1],[0,1]]` | `Δψ = ℤE₁₂`, `M₀ ≅ ℤ`; `2ℤ/4ℤ`; `κ(gh) = 2/3 = 0 + (2/3)·1` | Agrees | none |
| `IntegralRibet.local_ribet`, `IntegralRibet.global_ribet` | `S = ∅`; `I = T`; `(ℤ/2)²` with trivial `ρ` | `N = M₀`; `M = 0` with `Fitt₀ = T`; `N ≅ ℤ/2` with `Fitt₀ = (2)` | Agrees | none |
| Fitting annihilator bound | `(ℤ/2)²` | `Fitt₀ = (4) ⊆ (2) = Ann` | As the pinned theorem | none |

## Not verifiable

- **Jantzen**, *Representations of Algebraic Groups*, second edition (2003), cited for I.2.3, I.3.3, I.4.14–4.17, II.2.6 and II.4.16. It is not in the sources cache and has no legal open copy. The cochain description and the induction conventions it is cited for are those of ReductiveGroups §1.1, which I checked, and the sign of the induction convention is pinned by the computed example above.
- **Fargues–Scholze, Definition VIII.3.4** (*Untwisted excursion comparison*) is outside the sample and was not opened.
- The integral statements behind DKSW Lemmas 4.11–4.12 rest on references of that paper (good-filtration dimensions of symmetric powers) that I did not open. I checked the statements and pages in DKSW only.

## Source issues

- **Misprint** in Chenevier at proof of Lemma 2.17, printed p.32 (Chenevier line 1320): the source says that part (iv) of Lemma 2.7 makes a determinant factor through the quotient by a nilpotent ideal; it should be part (v) of Lemma 2.7; affects nothing.
- **Misprint** in Chenevier at proof of Lemma 2.17, printed p.32 (Chenevier line 1323): the source says a determinant on a matrix algebra is a power of the usual one by Lemma 2.5, which does not exist; it should be Lemma 2.15; affects nothing.
- **Gap** in DKSW at Definition 4.6 and Theorem 4.10, printed pp.23–24 (DKSW lines 990–994, 1014–1015): the source says a good filtration is finite on each homogeneous component, yet asserts one for the conjugation polynomial ring, whose single component has infinite rank; it should allow countable exhaustive filtrations; affects a stated result.
