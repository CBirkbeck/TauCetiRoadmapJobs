# Review of Subfactors (pull request #874 at f3533a4)

**Verdict:** needs changes

Full re-review of `TauCetiRoadmap/Subfactors/README.md` and `TauCetiRoadmap/Subfactors/Suggested.lean` at head `f3533a4`. The worker's gate passes every check, the dependency check reports no problem, the diff outside the roadmap folder is empty, and `Suggested.lean` (unchanged since `dde5aec`) elaborates with exactly two `sorry` warnings. Every finding of the previous review is repaired or, for the manifest, partly repaired. One new blocking finding comes from the merge order, which no longer places VonNeumannAlgebras after this roadmap: Layer 0 now plans material that an earlier roadmap plans.

## Status of the previous review's findings (head dde5aec)

| Previous | Status at f3533a4 | Passage |
| --- | --- | --- |
| R01 (P2) residual V11/V13 citations | Repaired. 9.2 cites "0.8's hypertrace characterisation of amenability" (line 1754) and "0.7's L² perturbation lemmas" (line 1767); 10.1 cites "0.6's extended positive part `Q̂_n⁺`" (line 1844). No `V<k>` code remains. | README lines 1754, 1767, 1844. See R01 below: the order has since moved. |
| R02 (P2) Connes's classification in 0.7 against the scope | Repaired. 0.7 states Theorem 11.2.2 "conditions (2)–(5)" only, with "nothing about amenability" and "Connes's theorem … is not a target" (lines 465–470); the corner statement uses "the corner lemma in place of amenability" (line 474); the scope paragraph names the theorem as VonNeumannAlgebras' (lines 50–55). 0.8 adds the hypertrace and Følner statements 9.2 uses, with the converse again excluded (lines 524–526). | README lines 448–474, 500–543. The hidden use of amenability in `ap` line 8320–8321 ("Since eMe is amenable, hence AFD") is now covered by the corner lemma at line 455. |
| R03 (P2) Markov formula in 3.3 | Repaired. "`τ_(n+1)(ι_n(x) p_n) = δ⁻¹ τ_n(x)`" with the normalised form `δ⁻²` (lines 1009–1011) and a Check recomputing n = 1, x = 1 and n = 2, x = U₁ (lines 1035–1037). Recomputed below. | README lines 1009–1011, 1035–1037. |
| R04 (P3) A₃ weight Checks | Repaired. "`√(√2/1) = 2^(1/4)`" (line 1473) and "this is `√2` from an end vertex to the middle" (line 1676). | README lines 1472–1475, 1676–1677. |
| R05 (P3) locators (Kosaki §3.3 for 2.4; 2.2; 0.4 convention) | Repaired. 2.4 cites Longo–Roberts §§2–3 and Kosaki §6 (lines 732–735); 2.2 cites Anantharaman–Popa Exercises 9.16–9.17, Pimsner–Popa 0.13–0.14 and Jones §2.2 (lines 666–675); 0.4 cites Kosaki pp. 6–7 and compares the two conventions by an explicit unitary W (lines 321–328) with a Check (lines 350–354). Two residual imprecisions are R04 below. | README lines 321–328, 666–675, 732–735. |
| R06 (P3) sources manifest; books unmarked | Partly repaired. Jones–Sunder and Evans–Kawahigashi now carry "Behind a paywall; cited by locator" (lines 1948, 2011, and Jones 1983 at 1945); Chen has its arXiv locator (lines 2005–2006). No `sources.toml` exists (folder: `README.md`, `Suggested.lean`, `metadata.toml`). R03 below. | Folder listing; README lines 1939–2011. |
| R07 (P3) HilbertModules downstream bullet | Repaired at the Downstream consumers list (the bullet is gone, lines 1929–1937). The sentence "HilbertModules and CategoricalOperatorAlgebras consume this roadmap" at line 74 remains: R02 below. | README line 74. |

## R01 (P2) — Layer 0 plans what VonNeumannAlgebras, now earlier in the merge order, plans

**Location:** `TauCetiRoadmap/Subfactors/README.md:44–47`: "every other roadmap that develops it comes later in the supply order. For the same reason it owns Layer 0's von Neumann algebra prerequisites"; line 53: "VonNeumannAlgebras, which is not a prerequisite of any layer"; Layer 0, lines 205–553 (0.1–0.8).

**Claim:** This roadmap is the earliest owner of normality and GNS, Tomita–Takesaki theory and the standard form, tracial L², group algebras and crossed products, coupling dimension and the index, weights and spatial derivatives, the hyperfinite factor with its L² perturbation lemmas, and amenability by hypertraces.

**Witness:** The merge order `ORDER.txt` lists VonNeumannAlgebras at line 4 and HilbertModules at line 10, Subfactors at line 192 (the previous review read 178 versus 174; the order was since rewritten to pull suppliers above their consumers on main, which cite VonNeumannAlgebras for exactly these objects, for example TypeAHeckeAlgebras line 403: "GNS, tracial L², spatial tensor products, … Takesaki expectations, group von Neumann models and hyperfinite weak closures"). The brief lists VonNeumannAlgebras among the roadmaps this one may consume. VonNeumannAlgebras at its open head (pull request #889) plans every object of Layer 0: V4 "Preduals, normality, and normal representations" (its README line 734); V6 "Tracial standard form and semifinite factors" (1145); V7 "Hilbert modules, coupling dimension, and index" with `[M:N] = dim_N L²(M)` (1451), `dim_N(H) = [M:N] dim_M(H)` (1470), multiplicativity (1476), `[N ⊗̄ M_n : N] = n²` (1478) and the commutant-corner formula with its normalised commutant trace (1416); V8 "Group algebras, actions, and discrete crossed products" (1518); V10 "Affiliated operators and Tomita–Takesaki theory" (1697); V11 weights, the extended positive cone, operator-valued weights and "Connes's spatial derivative" (2150, 2228–2236); V13 hyperfiniteness with "stability under corners", "quantitative L² perturbation lemmas on … approximate projections, partial isometries and matrix units", "nearby-unitary conjugacy and dyadic trace adjustments", uniqueness of R, hypertraces and "Connes's finite-rank Følner criterion" (2921, 2950–2958, 2998–3004). Its only mention of Subfactors is a deferral, "Subfactors continues to own its basic constructions, finite bases and later towers" (1497); it has no `*Needs:*` edge to Subfactors, so citing it creates no cycle. The second open head with the same folder (#1041) carries V0–V4 only.

**Repair:** Replace Layer 0 by a supplier contract `From TauCetiRoadmap.VonNeumannAlgebras` naming, per section, what is consumed: V4 (normal functionals, normal representations, GNS), V6 (tracial algebras, II₁ factors, `L²(M, τ)`, J, the trace-preserving expectation and `e_B`), V7 (normal modules at arbitrary cardinality, `dim`, `[M:N]`, restriction of scalars, multiplicativity, `n²`, the commutant-corner formula), V8 (`L(G)`, ICC, tensor products, discrete crossed products), V10 (Tomita's theorem, KMS, standard form), V11 (weights, `M̂₊`, operator-valued weights, Haagerup's and Takesaki's theorems, `dφ/dψ′`), V13 (AFD, the L² perturbation lemmas, corner stability, uniqueness of R, amenability, hypertraces, Følner projections). Rewrite lines 44–55 and the "How to read the build" bullet (lines 184–187) accordingly, repoint every `*Needs:* 0.k` line and every "0.k" citation in Layers 1–10 to the V-section, and keep as targets only statements VonNeumannAlgebras does not make (the 0.4 convention comparison by W can stay as a Check of the consumed object; the `E⁻¹` construction of 0.6 if V11 lacks it). Cite section names as that roadmap labels them (`Vk`, `Vk.Name`), never a pull-request number. Tested on the instance: the sentence at line 45 is refuted by `ORDER.txt` lines 4 and 192; after the repointing the dependency check runs downward, since VonNeumannAlgebras has no edge to Subfactors.

## R02 (P3) — HilbertModules is named as a consumer although it is earlier in the order and does not cite this roadmap

**Location:** `TauCetiRoadmap/Subfactors/README.md:74`: "HilbertModules and CategoricalOperatorAlgebras consume this roadmap"; lines 67–68: "The comparison of Connes fusion with the interior tensor product of Hilbert C*-modules belongs to HilbertModules."

**Witness:** `ORDER.txt` line 10 (HilbertModules) precedes line 192 (Subfactors), so HilbertModules cannot consume Layer 1. HilbertModules at its open head (`TauCetiRoadmap/HilbertModules/README.md`, pull request #861) mentions neither Subfactors nor Connes fusion; its line 262 defines the interior tensor product only. CategoricalOperatorAlgebras does consume (its README lines 58, 95, 294, 400, 470, 554).

**Repair:** Delete "HilbertModules and" at line 74. For lines 67–68 either state the comparison as a Layer 1 target with its hypotheses (a II₁ factor N, the right Hilbert N-module of bounded vectors, the interior tensor product of HilbertModules' section by name) or delete the sentence; a comparison with an object of this roadmap cannot be owned by an earlier roadmap.

## R03 (P3) — No sources manifest

**Location:** `TauCetiRoadmap/Subfactors/` (files: `README.md`, `Suggested.lean`, `metadata.toml`).

**Witness:** The folder has no `sources.toml`; the References list now cites 18 works, two of them new (Longo–Roberts, Jones 1983). Re-raised from the previous review's R06, which this head repairs only for the uncertified marks.

**Repair:** Add `sources.toml` (schema `tauceti-roadmap-sources/v1`) with one key per work: the author-page texts (Anantharaman–Popa, Penneys UQSL), the institutional copy of Kosaki, the arXiv texts (Burns v1, Penneys v1, JSW v1, Jones–Penneys v1, Longo–Roberts v1, Chen v2, GJS, CHPS, Bigelow–Penneys, Jones), the Numdam text of Pimsner–Popa, and `uncertified` entries for Popa 1994, Jones 1983, Jones–Sunder and Evans–Kawahigashi.

## R04 (P3) — Two locators claim slightly more than the text states

**Location:** `TauCetiRoadmap/Subfactors/README.md:334–337`: "π_σ is normal and injective, and the coefficient of `δ_e` is a faithful normal conditional expectation onto `π_σ(B)` (Kosaki, §2.1, printed pp. 6–7)"; line 732–734: Longo–Roberts "§3 for the dimension and its trace, stated there for any tensor C*-category with conjugates".

**Witness:** `kosaki` lines 172–185 state that π is a normal representation, the covariance relation and the L²-convergent expansion `x = Σ_g π(x_g) λ_g`; injectivity of π and the faithful normal expectation are not stated there. `longo-roberts` lines 367–370: §3 restricts to the case `(ι, ι) = ℂ`, "that ι is irreducible"; additivity and multiplicativity of d are Lemma 3.6 and Corollary 3.10 (lines 445, 653) in that setting.

**Repair:** For 0.4 add Anantharaman–Popa §5.2 (`ap` lines 3052–3062: `1̂ ⊗ δ_e` cyclic and separating, the trace `τ(x) = ⟨u_e, x u_e⟩`) for the tracial case and state the general expectation as a target of 0.4 with its proof (compression by `1 ⊗ p_e`), or cite a text that proves it. For 2.4 write "stated there for a tensor C*-category with conjugates and irreducible unit, which the bimodule category of two II₁ factors is". Tested: both repairs change no statement, only the locator sentence.

## R05 (P3) — The corner-lemma route in 0.7 skips the trace adjustment

**Location:** `TauCetiRoadmap/Subfactors/README.md:455–459`: "replaces p by a projection of Q close to it through the first two lemmas, conjugates that projection back to p by a unitary close to 1 through the third, and compresses Q".

**Witness:** The third lemma (line 447) conjugates "two projections of equal trace". A projection `q ∈ Q` with `‖p − q‖₂` small has `|τ(p) − τ(q)| ≤ ‖p − q‖₂` but not `τ(q) = τ(p)`: for `Q = M_2(ℂ) ⊗ 1` in R and `τ(p) = 1/3` (the roadmap's own Check, line 482), every projection of Q has trace in `{0, 1/2, 1}`. The statement is true (Murray–von Neumann; VonNeumannAlgebras V13 states "stability under corners" with "dyadic trace adjustments", its README lines 2952, 2957), only the sketched route has a gap.

**Repair:** Insert the adjustment: choose `q′ ≤ q` or `q′ ≥ q` in M with `τ(q′) = τ(p)` and `‖q − q′‖₂² = |τ(p) − τ(q)|`, conjugate `q′` to p, and approximate the compressed elements by `q Q q` compressed further by the conjugate of `q′` (an operator system; take the C*-algebra it generates inside the finite-dimensional `q M_k q`), or cite the V13 target after R01. Tested on the instance above: `q = E₁₁ ⊗ 1` has trace 1/2, `q′ ≤ q` of trace 1/3 exists in R, and `‖q − q′‖₂² = 1/6`.

## Verified sound

**Gate, build and form.** The worker's gate at `f3533a4` passes every check (set_option, blob, latex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, lean-lines, forbidden, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material, build). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/Subfactors'` is empty. `lake env lean TauCetiRoadmap/Subfactors/Suggested.lean` from the worktree root exits 0 in 2.8 s with exactly two `declaration uses sorry` warnings (lines 67 and 82); the object file of `TauCeti.Algebra.TemperleyLieb.MarkovTrace` was present. The file is unchanged since the previous review: 92 lines, `import Mathlib` plus one `TauCeti.*` module, one module docstring, `namespace TauCetiRoadmap.Subfactors`, a Layer 3 section comment, docstrings on all three declarations, `theorem` only, no `set_option`, `lemma`, `#eval`, `#print axioms`, `True` placeholder or sorry'd data. The Lean names `jonesLoopParameters`, `markovTrace_nonneg_iff`, `markovTrace_nonneg_iff_lt_floor` appear in the README (lines 15, 939–942, 971, 1088) and no other backticked name of the roadmap's own is a Lean claim.

**Signature check.** A scratch copy with `#check @jonesLoopParameters`, `#check @markovTrace_nonneg_iff` and `#check @markovTrace_nonneg_iff_lt_floor` elaborated. Every README binder survives: `0 < δ`, the unit `q` with `↑δ = -(↑q + ↑q⁻¹)`, `[(n : ℕ) → StarRing (TemperleyLieb ℂ ↑δ n)]`, `[∀ n, StarModule ℂ (TemperleyLieb ℂ ↑δ n)]`, the generator-fixing hypothesis, and in the second theorem `δ < 2`, `δ ∉ jonesLoopParameters`, the single-level instances and `n < ⌊π / arccos(δ/2)⌋₊`. Nothing changed. The README's generality (real `δ > 0`, every level, conjugate-linear star fixing generators) equals the Lean's.

**Padding probe.** On the same scratch copy both sorried statements were restated and tried with `simp [jonesLoopParameters]`: the first leaves the full iff open, the second makes no progress. Neither restates a definition, mirrors a Check or computes a value. No padding; no statable headline is missing (see the inventory).

**Dependency check.** The prescribed command returned exactly

```text
depcheck: 200 roadmaps, 1306 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. R01 concerns ownership, not an edge: the check sees no citation of VonNeumannAlgebras because the README plans the material instead of citing it.

**Headline inventory.** The README's end theorems (lines 12–22): Jones's index restriction through `markovTrace_nonneg_iff`; realisation of every allowed index in R; the Pimsner–Popa entropy formula and its equality criteria; planar-algebra reconstruction and Burns's rigid realisation; Popa's finite-depth classification and the ADE list; the extended-cone calculus, Burns rotations and the type III example. At the pins (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`) only Jones's positivity theorem is statable: `TauCeti.TemperleyLieb.markovTrace` (`TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean:452`, `markovTrace_one` 462, `markovTrace_mul_comm` 468, `markovTrace_strandIncl` 486, `markovTrace_strandIncl_mul_e_last` 494), `Rel` (`Basic.lean:107`), `lift` 196, `lift_e` 209, `hom_ext` 215, `strandIncl` 233, `strandIncl_e` 239, `twoStrandRep` 290, `e_ne_zero_two` 305 (needs `[Nontrivial R]`). Mathlib's `VonNeumannAlgebra` carries no factor, trace, dimension or index; `ContinuousLinearMapWOT` is at `Mathlib/Analysis/LocallyConvex/WeakOperatorTopology.lean:57` as the README says, `IsStarProjection` at `Mathlib/Algebra/Star/StarProjection.lean:26`, `StarSubalgebra.centralizer` at `Mathlib/Algebra/Star/Subalgebra.lean:312`, `Real.negMulLog` at `Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean:164`. The module docstring names each absent headline with its missing carrier.

**Sources.** Fetched through the sources service: `ap` (author page), `kosaki` (institutional), `penneys-uqsl` (author page), `burns` (arXiv 1111.1362v1), `pp` (Numdam), `penneys` (arXiv 1110.3504v1), `jsw` (arXiv 0807.4146v1, OCR), `jp` (arXiv 1007.3173v1), `longo-roberts` (arXiv funct-an/9604008v1), `chen` (arXiv 2009.09273v2). Jones 1983 resolved only to a paywalled publisher (uncertified); Jones–Sunder and Evans–Kawahigashi have no legal text (Not verifiable). Sampled targets:

| Target | Source and locator | Result |
| --- | --- | --- |
| 0.5 coupling dimension and index | `ap` 5696 (Lemma 8.2.1), 5724–5729 (Prop 8.2.3, `ℓ²(ℕ)`, left modules), 6157–6160 (Def 8.5.4), 6169–6181 ((8.6), direct sums), 6182–6197 (Props 8.5.5, 8.6.1), 6205–6207 (Prop 8.6.2, separable), 6889–6894 (Def 9.4.9, separable M), 6899–6901 (Remark 9.4.10), 7023–7038 (Ex 9.13–9.15) | All match, with the separability caveats the README records. |
| 0.7 R and L² perturbation | `ap` 1090 (§1.6), 7697–7700 (Def 11.1.2), 7998–8003 (Lemma 11.1.14, exact constants), 8021–8025 (Lemma 11.1.16: `e′ ≤ e`, `√ε′‖e‖₂`, `ε′^(1/4)`), 8261–8263 (Lemma 11.2.1, type `I_(2ⁿ)`), 8294–8302 (Thm 11.2.2 (1)–(5)), 8303–8357 (proof: (2)⇒(4) uses "eMe is amenable, hence AFD" at 8320–8321), 8358–8365 (Remark 11.2.3 via amenability), 11803–11814 (Examples 15.4.3: R has Γ, `L(F_n)` does not) | Match. The README's corner lemma replaces the amenability step honestly; its route has the gap of R05. The nearby-unitary lemma (line 447) is cited to Popa Appendix A, not readable. |
| 0.8 amenability | `ap` 7191–7193 (Def 10.2.1), 7198–7205 (Prop 10.2.2), 7161–7163 (Prop 10.1.3), 7233 (Thm 10.2.4), 7261–7264 (hypertrace, "automatic when M is a II₁ factor"), 7269–7270 (Prop 10.2.5), 7333–7344 (Thm 10.2.9 (2)), 7413–7418 (Thm 10.3.1) | All match. |
| 0.4 crossed products (changed) | `kosaki` 167–206 (Def 2.2 for ℝ, the discrete-group matrix picture `π(x) = Σ α_(g⁻¹)(x) ⊗ e_(g,g)`, covariance), `ap` 3033–3062 (§5.2 convention `(b u_g)(ξ ⊗ δ_h) = bσ_g(ξ) ⊗ δ_(gh)`, trace) | Convention matches; the expectation claim overreaches the Kosaki locator (R04). |
| 1.1 correspondences | `ap` 9382 onward (Chapter 13, tracial case); Burns §2.1.2 for the general standard form | Definitions, no theorem cited; the three Checks recomputed below. |
| 2.2 bases and Pimsner–Popa | `pp` 195–201 (0.13, 0.14 with "`[M:N] ≥ n²`" consequence at 208), 566–570 (Thm 2.2); `kosaki` 1640–1644 (Thm 3.8); `ap` 7039–7052 (Ex 9.16–9.17) | All match, including the new sum formula and `dim(N′∩M) ≤ [M:N]` route. |
| 2.4 bifinite bimodules | `longo-roberts` 123–140 (§2, conjugates), 365–370 (§3, irreducible unit), 408–414 (Def 3.4, normalised solutions), 445 (Lemma 3.6, direct sums), 621–635 (Thm 3.8, left and right traces agree), 653–657 (Cor 3.10, multiplicativity); `kosaki` 3170–3200 (§6, `d_ρ = √[M:ρ(M)]₀`, multiplicativity) | Match, with the unit-irreducibility caveat of R04. |
| 2.5 minimal index | `kosaki` 1461–1468 (§3.3), 1539–1550 (Thm 3.7; locally trivial example `[M:N] = 1/tr(p) + 1/(1−tr(p))`, minimal index 4) | Match. |
| 3.5 index restriction | Jones–Sunder Theorem 2.3.8 | Not readable; content is 3.2 + 3.4, recomputed below. |
| 4.3 realisation | internal (3.3, 4.1–4.2, 0.7) and Jones–Sunder §5 | Book not readable; the corner parameters recomputed below. |
| 5.2 depth and graphs | internal; graph norms recomputed below | No external locator; values pass. |
| 6.3 rigid ↔ spherical | `burns` 2602–2603 (Thm 2.2.36: `δ_sph = λδ`, `λ = φ(w^(1/2))`), 2693–2698 (Thm 2.2.40 statement `δ = λδ_sph`), 2703–2705 (proof: `λ⁻¹δ_sph` twice), 2709–2713 (Remarks 2.2.41), 2804–2812 (Lemma 2.2.43: `E = λE_N(w^(−1/2)·)`) | Match; the README's use of the proof's value is right (Source issues). |
| 9.3 ADE list | Evans–Kawahigashi Theorems 11.22–11.24 | Not readable; the index values recomputed below. |
| 10.1 extended cones | `penneys` 653–654 ("let A be a II₁-factor", no separability), 675–676 (Def 3.4), 967–968 (Thm 3.18), 1144–1149 (Thm 3.28) | Match. |
| 10.2 Burns rotations | `penneys` 1501–1503 (Thm 4.20), 1523–1524 (Remark 4.21, symmetric), 1569–1570 (Thm 4.28: `H^n`) | Match, including "`H^n`, not H" in the Check. |
| 10.3 type III example | `burns` 6225 (Lemma 3.4.1), 6237 (Lemma 3.4.2), 6287–6288 (Thm 3.4.4), 6290–6300 (repeated-word map, `w(F_∞)″ = S`), 6314, 6331, 6349–6353 (Lemmas 3.4.5–3.4.7), 6389–6405 (Lemma 3.4.8, `ι(ξ) = √2 a(ξ)`, covariance 1/2), 6407–6409 (Thm 3.4.9); printed 119 at `burns` 6295 | Match. |
| 3.2, 3.3 (headline inputs) | `penneys-uqsl` 23–26 (Ex 4.1.2–4.1.3), 230–236 (Lemma 4.3.8), 249 (Def 4.3.10), 289 (Prop 4.3.14), 368–379 (Thm 4.3.17: `d > 0`, `Tr_k(f^(k)) = [k+1] < 0`), 562–588 (TB1–TB2) | Match. |
| 8.2 Chen | `chen` 3883 (§6.2), 3927–3928 (Cor 6.2.2: every subfactor planar algebra embeds in the graph planar algebra of its principal graph) | Preprint locator matches; the Doc. Math. numbering (Thm 7.9) not checked. |

**Supplier and ownership audit.** Every cross-roadmap citation was resolved at the head the brief names (`roadmaps resolve` lists none missing):

| Citation | Resolution |
| --- | --- |
| CStarAlgebras C5 (lines 62, 166, 1020, 1040, 1103) | `TauCetiRoadmap/CStarAlgebras/README.md:546` at #860, "C5. C*-tensor products and operator-space tensor products", inductive limits at 605. Not in `ORDER.txt`; the dependency check accepts it as placed after its suppliers. CStarAlgebras does not cite Subfactors. |
| FreeProbability F3–F4 (lines 63, 169–170, 1682, 1712) | On main: F3 at line 255 (Fock space), F4 at 353 (amalgamated). FreeProbability does not cite Subfactors. |
| OperatorAlgebraDynamics D8 (lines 64–65, 172, 1904, 1918, 1927) | On main: D8 at line 554, antilinear CAR generators at 556, quasi-free states at 568. Does not cite Subfactors. |
| VonNeumannAlgebras | `ORDER.txt` line 4 (earlier). #889 Layers 4, 6, 7, 8, 10, 11, 13 plan Layer 0's objects (R01, with line numbers). Its line 1497 defers basic constructions, bases and towers to Subfactors; no `*Needs:*` edge to Subfactors. #1041 carries V0–V4. |
| HilbertModules | `ORDER.txt` line 10 (earlier). #861 does not mention Subfactors or Connes fusion (R02). |
| TemperleyLieb (#58, line 227), TemperleyLiebOperatorAlgebras (#867, line 228) | Later than Subfactors (line 192); the ownership of the ℂ-only Temperley–Lieb material in Layer 3 is recorded again. |
| Downstream consumers | CategoricalOperatorAlgebras #888 cites Subfactors S1–S2, S5–S9 (its README lines 58, 95, 294, 400, 470, 554); FactorRigidity #876 cites S1–S2 (lines 6, 35, 86, 110, 122, 143); TypeAHeckeAlgebras on main cites S2, S2a, S4 (lines 38, 403, 435–439, 462). The aliases S1–S10 and S2a (lines 180–181) keep these valid. |

No `Suggested.lean` of a readable roadmap declares `TauCetiRoadmap.Subfactors.*`. Ownership against the open pull requests the brief lists without files was not checked.

**Adversarial computations.** I is `R ⊂ R`, A is `R ⊗ 1 ⊂ R ⊗ M₂(ℂ)`, D(t) the diagonal-corner inclusion with parameter t, with `([M:N], δ) = (1,1), (4,2), (t⁻¹+(1−t)⁻¹, ·)`.

| Statement / location | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| `markovTrace_nonneg_iff`, Lean 67 | n = 0, 1; δ = 1 (m = 3); δ = 1/2; δ = 2; δ = 3 | `TL_0 = TL_1 = ℂ`, `T_0(1) = 1`, `T_1(1) = δ > 0`. δ = 1: Gram of `TL_2` on (1, e) is `[[1,1],[1,1]]`, PSD, 1 ∈ set (m = 3). δ = 1/2: Gram `[[δ², δ],[δ, δ²]]`, determinant `δ²(δ² − 1) = −3/16 < 0`, 1/2 ∉ set. δ = 2: `[j] = j`. δ = 3: `q = (−3−√5)/2` real, 3 ≥ 2. | Pass. |
| uniqueness of the star, Lean 56–62 | `TL_2`, word `i·e` | `star(i·e) = −i·e`; two conjugate-linear anti-automorphisms fixing generators agree on words and scalars. | Pass; non-vacuous for real δ. |
| `markovTrace_nonneg_iff_lt_floor`, Lean 82 | δ = 1/2 (k = 2); δ = √2 − 10⁻⁶ (k = 3); δ = 1.9 (k = 9) | 1/2: `θ = arccos(1/4) = 1.3181`, `π/θ = 2.383`, k = 2; n = 1 PSD, n = 2 fails (determinant above). √2⁻: `[4] = δ³ − 2δ = −4.0·10⁻⁶ < 0`, `⌊π/arccos(δ/2)⌋ = 3`. 1.9: `[1..7] = 1, 1.9, 2.61, 3.059, 3.202, 3.025, 2.545` all positive, `⌊π/arccos(0.95)⌋ = 9`, so `[2..9] > 0` and `[10] < 0` by Lemma 4.3.8. | Pass. |
| `hδ₂` redundancy | δ ∉ set ⇒ ¬(2 ≤ δ) | Implied hypothesis. | Note only. |
| `q` convention, lines 108–110 | `q = −e^(iθ)`; `q = −r` | `−(q + q⁻¹) = 2cos θ`; `r + r⁻¹ ≥ 2`. | Pass. |
| 0.1 Checks | Banach limit; vector state `x₁₁`; upper triangular | Vanishes on each `1_[0,n]`, value 1 on their supremum; null space dimension 2 versus 4; commutant `ℂ1`, bicommutant `M₂`. | Pass. |
| 0.2 modular Check | `h = diag(1/5, 4/5)` | `hE₁₂h⁻¹ = E₁₂/4`, `σ_t(E₁₂) = 4^(−it)E₁₂`; inverse convention 4 (`kosaki` 160). | Pass. |
| 0.3 Checks | `τ = Tr/2` | `‖Ê₁₁‖₂² = 1/2`, `JÊ₁₂ = Ê₂₁`; vector state sends `E₁₁` to 1 ≠ 1/2. | Pass. |
| 0.4 covariance Check | `g = (12)`, `h = (23)` | Stated convention: both sides `σ_(h⁻¹g)(b)ξ ⊗ δ_h`; wrong convention `σ_(g⁻¹h)` vs `σ_(hg)`, `(12)(23) ≠ (23)(12)`. | Pass. |
| 0.4 intertwiner W (new) | general `ξ ⊗ δ_h`, `b`, `g`; swap on `ℂ²`, `b = (1,0)`, `g = 1` | `W(bu_g)(ξ⊗δ_h) = σ_(h⁻¹g⁻¹)(b)σ_(h⁻¹)(ξ) ⊗ δ_(gh)`; `π_σ(b)(1⊗λ_g)W(ξ⊗δ_h) = σ_((gh)⁻¹)(b)σ_(h⁻¹)(ξ) ⊗ δ_(gh)`; equal. Instance: `(1,0)⊗δ_1` versus `(0,1)⊗δ_1` pointwise, `W((1,0)⊗δ_1) = (0,1)⊗δ_1`. | Pass. |
| 0.4 group Checks | `S₃`; swap on `ℓ^∞(ℤ/2)` | dimension 1+1+4 = 6; `ℓ^∞(ℤ/2) ⋊ ℤ/2 = M₂`; trivial action `ℂ² ⊗ ℂ²`, dimension 4. | Pass. |
| 0.5 Checks | `M_n`, `ℂⁿ`; `S₃ ⊃ ⟨(12)⟩` | `dim(ℂⁿ_(M_n)) = 1/n`; `[N⊗M₂ : N⊗1] = 4`; `[S₃:⟨(12)⟩] = 3`, trivial subgroup 6. | Pass. |
| 0.5 multiplicativity | `P ⊆ N ⊆ M`, `[M:N] < ∞` | `dim(L²(M)_P) = [N:P] dim(L²(M)_N) = [N:P][M:N]` by Ex 9.15 on the finite right N-module `L²(M)`; infinite `[N:P]` gives ∞ both sides. | Pass. |
| 0.6 Checks | `h = diag(1/5, 4/5)` | `dφ/dψ′ = h⁻¹ = diag(5, 5/4)`; `Tr(h⁻¹) = 25/4`, minimum 4 at `h = 1/2`. | Pass. |
| 0.7 Lemma 11.1.14 Check | `x = diag(1, 1−t)`, t = 1/2, 9/10 | `‖e − x‖₂ = t/√2`: `ε′ = 0.3536`, `√ε′ = 0.5946`, window `(0.405, 1.595) ∋ 1/2`, `e′ = 1`, `‖e′ − xe′‖ = 1/2 < 0.5946`; `ε′ = 0.6364`, `√ε′ = 0.7977`, window `(0.202, 1.798) ∌ 0.1`, `e′ = E₁₁`, `‖E₂₂‖₂ = 0.7071 < 0.7977`, `‖e′ − xe′‖ = 0`. | Pass (the lemma's `<` needs `ε′` slightly above `t/√2`; cosmetic). |
| 0.7 projection Check | `E₁₁`, projection onto `(cos θ, sin θ)` | `p − q = [[s², −cs],[−cs, −s²]]`, `τ((p−q)²) = s²`, distance `sin θ`; `‖u − 1‖₂² = (1/2)·2·|e^(iθ) − 1|² = 4sin²(θ/2)`; `2sin(θ/2) ≤ √2 sin θ ⇔ cos(θ/2) ≥ 1/√2 ⇔ θ ≤ π/2`; θ = π/3: 1.000 ≤ 1.2247. | Pass. |
| 0.7 corner lemma route, line 455 | `Q = M₂ ⊗ 1 ⊂ R`, `τ(p) = 1/3` | traces of projections of Q: `{0, 1/2, 1}` ∌ 1/3; nearest `q = E₁₁⊗1`, `τ(q) − τ(p) = 1/6`. | Gap in the route: R05. |
| 0.7 `L(F₂)` Check | property Γ | R has Γ (`ap` 11803), `L(F₂)` has not (11813); so not isomorphic, so not generated by finite-dimensional algebras by (3)⇔(5). | Pass. |
| 0.8 hypertrace Check | `T = |1̂⟩⟨û|`, `τ(u) = 0` | `ω(uT) = ⟨û,1̂⟩⟨1̂,û⟩ = |τ(u)|² = 0`; `ω(Tu) = ⟨û,û⟩ = 1`. | Pass. |
| 0.8 slice-map Check | `M_n ⊗ 1`, state φ of `B(K)` | `(id⊗φ)(x⊗1) = x`, unital completely positive. | Pass. |
| 0.8 non-normal Check | ρ trace class | `Tr(ρxT) = Tr(ρTx)` ∀T ⇒ `ρx = xρ` ⇒ `ρ ∈ M′ = JMJ`; a nonzero trace-class element of a II₁ factor has a nonzero finite-rank spectral projection in the factor, impossible. | Pass. |
| 1.1 Checks | `ξ = i`, `ξ′ = 1`; zero correspondence; `M₂` | `⟨i,1⟩ = −i` (first-variable linearity `+i`); `Hom(0, H) = 0`; `J(ξy) = y*Jξ`. | Pass. |
| 1.2 Check | `ρ = diag(1/5, 4/5)`, `ξ = ρ^(1/2)` | `R_ξ` isometric; rejected map: `Λ_ψ(E₂₁) = (1/√5)E₂₁ ↦ (2/√5)E₂₁`, ratio 2. | Pass. |
| 2.1 Checks | A; I; `R⊗1 ⊂ R⊗̄R` | `Tr(1) = 4`, `τ(e_N) = 1/4`; `e_N = 1`, `Tr(1) = 1`; `Tr(1) = ∞`. | Pass. |
| 2.2 basis and constant Checks | `b_ij = √2E_ij`; P onto `(e₁⊗e₁+e₂⊗e₂)/√2` | `Σbb* = 4·1`; `(id⊗tr)(P) = 1/4`, `1⊗E₁₁` gives 1/2. | Pass. |
| 2.2 local index and sum formula (new) | D(t), t = 0.3; A | `(1−t)t(t⁻¹+(1−t)⁻¹) = 1.000`; `(1−t)⁻¹ + t⁻¹ = [M:N]` by definition of D(t), n = 2 gives ≥ 4; A: `N′∩M = M₂`, masa dimension 2, `dim = 4 = n² = [M:N]`. | Pass. |
| 2.2 `dim(N′∩M) ≤ [M:N]` route (new) | `N′∩M = ⊕M_(k_i)`, masa of dimension n = Σk_i | `Σk_i² ≤ (Σk_i)² = n² ≤ [M:N]` by the sum formula. | Pass. |
| 2.3 Checks | A; `ℤ/2` outer | `M₁ ≅ N⊗M₄`, `τ(e₁) = 1/4`; `[M:M^G] = 2`, `M^G′∩M₁ = ℂ²`; index 1 gives `e_k = 1`. | Pass. |
| 2.4 Checks | D(t), `t ≠ 1/2`; `M^G ⊂ M` | left dimensions `1/t, 1/(1−t)`, right `t, 1−t`; each `d = 1`, `d(X) = 2`; ratios `t⁻², (1−t)⁻²` differ. `d = √|G|`, dimensions `|G|`, 1. | Pass. |
| 2.5 Checks | D(t); A with `h = diag(2/5, 8/5)` | `c = 2√(t(1−t))`, `E_N(h₀) = 1`, `Ind(E₀) = (t(1−t))⁻¹·4t(1−t) = 4`; `tr(h⁻¹) = 25/16`, `4·25/16 = 25/4`; wrong formula gives 4. | Pass. |
| 2.6 Checks | `ℂ⊂ℂ²`; A; D(1/3); I | `η(t)+η(1−t)`; `log 4`; `2η(1/3)+2η(2/3) = 1.2730 < log 4.5 = 1.5041`; `0`. | Pass. |
| 3.1 Checks | `i·e`; non-real δ | `(i·e)† = −i·e`; `(δ − conj δ)e = 0` contradicts `e_ne_zero_two`. | Pass. |
| 3.2 Jones–Wenzl Checks | δ = 1/2; √2⁻; √2; wrong coefficient | `f₂ = 1 − δ⁻¹U₁`, `f₂² = f₂`, `T₂(f₂) = −3/4`, k = 2; `[4] < 0` below √2, `= 0` at √2; `(1−δU)² = 1−δU` iff `δ² = 1`. | Pass. |
| 3.2 Markov uniqueness | normal form | `φ_(n+1)(ι(a)U_nι(b)) = φ_n(ba)`; base `φ_1(1) = δ = T_1(1)`. | Pass. |
| 3.3 path models | δ = 1; √2; 2 | `A₂`: `Q_n = ℂ`, `R_2 = ℂ(1−e)`; `A₃`: `dim Q₂ = 2`, `dim Q₃ = 4 < 5`; half-line: `τ₂(1) = [1]+[3] = 4 = δ²`, unit weights 2. | Pass. |
| 3.3 Markov formula (repaired) | n = 1, x = 1; n = 2, x = U₁ | `τ₂(p₁) = δ⁻¹T₂(U₁) = 1 = δ⁻¹τ₁(1)`; `tr₂(p₁) = δ⁻² = δ⁻²tr₁(1)`; `τ₃(ι(U₁)p₂) = δ⁻¹T₂(U₁) = 1 = δ⁻¹τ₂(U₁)`. | Pass. |
| 3.4 Checks | A; index 1 | `τ(2e₁) = 1/2 = δ⁻²T₂(e) = 2/4`; `ρ(U_i) = 1` kills `1 − e`. | Pass. |
| 3.5 admissible values | m = 3..6; 2.5 | `1, 2, 2.6180, 3`; `(2cos(π/5))² = 2.6180 = (3+√5)/2`; 2.5 strictly between 2 and 2.618. | Pass. |
| 4.1 tensor-leg square | `M₂⊗M₂⊗M₂` | `A₁∩B₀ = M₂⊗1⊗1 ≠ ℂ`, parameters 1/16 and 1/4. | Pass. |
| 4.3 corner parameters | d = 9/2; d = 4; m = 5 | `3 + 3/2 = 4.5` at t = 1/3; t = 1/2 gives `N ⊂ N⊗M₂`; `4cos²(π/5) = 2.6180`, graph `A₄`. | Pass. |
| 5.1–5.2 Checks | D(t); A; `ℤ/2`, `ℤ/3`; TL at `2cos(π/m)` | `tr_(N′)(p) = 1−t ≠ t`; equal traces for A; norms `√2`, `√3`, `2cos(π/m)`; infinite depth for D(t). | Pass. |
| 6.2 Check | `w = diag(4, 1/4)`, `h = diag(2/5, 8/5)` | `wh = diag(8/5, 2/5)`; `w^(−1/2)E₁₂w^(1/2) = E₁₂/4`; `L_wR_(w⁻¹)` eigenvalues 1, 16, 1/16, 1. | Pass. |
| 6.3 reciprocal Check | same w, `δ_sph = 2` | `tr(w^(1/2)) = tr(w^(−1/2)) = 1.25 = a`; `aδ_sph = 2.5`; printed `λδ_sph = 1.6`; `burns` 2704 computes `λ⁻¹δ_sph`. | Pass; misprint recorded. |
| 6.4, 8.3 index Check | same data | `a²δ_sph² = 6.25 = Ind(E_h)`; `h = a⁻¹w^(−1/2) = diag(2/5, 8/5)` agrees with 6.2; Lemma 2.2.43's `E = λE_N(w^(−1/2)·)` equals `E_N(h·)`. | Pass. |
| 7.1 weight Check (repaired) | `A₃`, μ = (1, √2, 1) | `√(√2) = 1.1892 = 2^(1/4)`; loop value `Σ_w μ(w)/μ(v) = √2 = δ`; (1, 2, 1) is not an eigenvector (`A·(1,2,1) = (2,2,2)`). | Pass. |
| 8.2 reverse-basis Check (repaired) | `A₃` | `c = μ(w)/μ(v) = √2` end to middle, `1/√2` back. | Pass. |
| 9.3 indices | `A_n`, `D_(2n)`, `E₆`, `E₈` | `A₃ → 2`; `D₄ → 3`; `4cos²(π/12) = 3.7321 = 2+√3`; `4cos²(π/30) = 3.9563`. | Pass. |
| 10.1 Checks | `L²(A)`; coarse; `Q₀` | `P_n = Q_n = ℂ`; `P₁ = 0`, `Q₁ = JAJ ⊗̄ A`; `Q̂₀⁺ = [0,∞]`. | Pass. |
| 10.3 Checks | `γ₀ = a₁`; `u = −1`; covariance 1/2 | `a_na₁a_n⁻¹` reduced, distinct, same image; `u − 1 = −2` not Hilbert–Schmidt; `ω(a(ξ)a(ξ)*) = ‖ξ‖²/2`, so `√2` is the isometry constant (`burns` 6393–6400). | Pass. |

Totals: 50 rows, 49 pass, 1 route gap (R05); no statement refuted.

## Not verifiable

- Jones–Sunder, *Introduction to Subfactors* (3.5 Theorem 2.3.8; 2.1, 2.3, 4.1–4.2): the sources service found only the Cambridge landing page; listed in the job's missing-references file.
- Evans–Kawahigashi, *Quantum Symmetries on Operator Algebras*, Theorems 11.22–11.24 (9.3): OUP returned 403; listed in the missing-references file.
- Popa, *Classification of amenable subfactors of type II* (0.7, 9.1–9.2) and Jones, *Index for subfactors* (2.2): paywalled publishers; uncertified, as the README records.
- Chen, Doc. Math. numbering (Theorem 7.9): only the arXiv v2 was read, where the statement is Corollary 6.2.2 as the README says.
- JSW diagrams: the text layer is glyph names; statements were checked on the OCR text in the previous review and the section is unchanged.

## Source issues

- **Misprint** in burns at Theorem 2.2.40, printed page 56: the statement gives the rigid modulus as λ times the spherical modulus; it should be λ⁻¹ times it, as the proof on the same page computes twice; affects a stated result (the roadmap uses the proof's value).
