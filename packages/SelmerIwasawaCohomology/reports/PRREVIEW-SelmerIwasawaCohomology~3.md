# Review of SelmerIwasawaCohomology (pull request #869 at 3f518a0)

**Verdict:** accepted

Incremental re-review of the 90 changed lines since cbf830f (37 insertions, 53 deletions, both in `TauCetiRoadmap/SelmerIwasawaCohomology/README.md` and `TauCetiRoadmap/SelmerIwasawaCohomology/Suggested.lean`; nothing outside the folder). Every passage the diff touches was re-read with its suppliers and sources; the gate, the dependency check, the elaboration, the signature check and the padding probe were run again in full. One P3 note; no blocking finding.

## R01 (P3) — The continuity sentence of §3.0 drops the finite-quotient hypothesis of the pinned lemma

**Location:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1356`–`:1360` (“its continuity holds once `O` carries a topology with continuous addition, as the pinned `continuous_map` requires. The profinite `Γ = ℤ_p^d × Δ` and complete `O` of this section are the case used.”).

**Claim:** For every commutative ring `O` and topological abelian group `Γ`, the involution of `TauCeti.completedGroupAlgebra O Γ` is continuous as soon as `O` is a topological ring with continuous addition.

**Witness:** At the Tau Ceti pin, `TauCeti.completedGroupAlgebra.continuous_map` (`TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Map.lean:200`–`:205`) is stated under `[TopologicalSpace R] [ContinuousAdd R]` and `[∀ U : OpenNormalSubgroup Γ, Finite (Γ ⧸ U.toSubgroup)]`. For `Γ = ℤ` with the discrete topology, the open normal subgroup `{0}` has infinite quotient, so the pinned lemma does not apply, while the sentence, written at the generality “every … topological abelian group `Γ`”, asserts continuity there. The definition and involutivity (`map_comp`, `map_id`, `Map.lean:149`, `:157`) do hold at that generality, and the profinite case the roadmap uses satisfies the finiteness hypothesis.

**Repair:** Write “its continuity holds once `O` carries a topology with continuous addition and every open normal subgroup of `Γ` has finite index, as the pinned `continuous_map` requires; both hold for the profinite `Γ = ℤ_p^d × Δ` and complete `O` of this section.” Test: `Γ = ℤ_p` (every open subgroup `p^nℤ_p` has finite index) is covered; discrete `Γ = ℤ` is correctly excluded.

## Previous findings

- R01 — repaired: the record-comparison target, the “Gamma products” contract subsection, the API bullet, the two Checks and the LFunctions item of the `*Needs:*` line are gone from §4.14 (`README.md:2043`–`:2096`); `Suggested.lean:28`–`:35` no longer mentions the record; the deferral now sits in Scope and ownership (`:21`) and under Downstream consumers (`:2619`, “LFunctions Layer 0 may compare the Gamma factor of its completed L-function record … ZerosOfLFunctions Layer 1 may specialise its Gamma-factor divisor”); the dependency check prints no UPWARD line (below). The refuting instance still computes: two real shifts `0` and one complex shift `0` give `Γ_ℝ(s)²Γ_ℂ(s)`, count `3`, order `−3` at `0` (`:2090`–`:2092`), with no record present; both Gamma headlines keep their statements (elaborated types below).
- R02 — repaired: `README.md:242` and `:248` cite “the pinned `Set.unit_fg`, through the additive module adapter of ArithmeticGaloisDuality §R02.3.0c”; `:1004` and `:1070` say “the finite-place compact-support complex of ArithmeticGaloisDuality §D7.5 (*Continuous cochains with compact support*)”; `:1180`–`:1181` say “`⊕_{v∈S} Err_v` in the sense of §D7.7.3. Derived complementarity there means that every `Err_v` is acyclic”. All three resolve at the supplier's head (below). `Set.unit_fg` is declared at the Tau Ceti pin (`TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean:149`, hypotheses `[Finite S]` and finite generation of the `∅`-units).
- R03 — repaired: the three Checks of §4.14 (`:2085`, `:2086`, `:2088`) now read “the complex-place factor list of the zero carrier / of the type-`(2,2)` Tate line / of the weight-one structure” with the same values (`1`; `Γ_ℂ(s−2)`; two zero shifts, `Γ_ℂ(s)²`).
- R04 — repaired, with the new P3 above: the dangling “The definition” fragment is gone; `:1356`–`:1360` is one statement. Its continuity clause omits the finite-index hypothesis of the pinned lemma (R01 of this report).
- R05 — repaired: §2.18 (`:815`) adds Lemma 5.7, printed p. 13 (PDF p. 23), for the finiteness and finite-generation clauses, and names it at the claim (`:813`); §3.14 (`:1639`) cites PadicMeasuresIwasawaAlgebras §5.1 for the determinant functor, the fraction-field trivialization and the exponent `(−1)^i` of the inverse line, keeping Nekovář §8.9 for error terms and §8.10 for specialization; §0.11 (`:272`) cites Rubin Appendix B, Proposition 4.2, Remark 4.3, Corollary 4.4 and Proposition 4.5, printed p. 156, for Shapiro and induced modules, and attributes cup naturality to ProfiniteCohomology Layer 12 and the projection formula to its Layer 8, which the `*Needs:*` line (`:280`) now lists. Each locator was opened (below).
- R06 — repaired: §4.18 (`:2167`) states finiteness iff `LeopoldtConjecture F p` of IntegralIwasawaTheory §2.2 with corank `leopoldtDefect F p`, “no second Leopoldt proposition or rank defect is defined here”; the `*Needs:*` line (`:2181`) names the supplier; the Check (`:2177`) carries the two test values (defect `0` for `ℚ`; corank `r₁+r₂−1` for a zero localization). Both names exist at the supplier's head (lines 313–319).

## Verified sound

**Head and scope.** The worktree is at `3f518a0ea3897aaa59428b2505de46baaf329c00`, clean; `git diff --stat origin/main...HEAD` outside the roadmap folder is empty. The folder holds `README.md` (2659 lines), `Suggested.lean` (232 lines) and `metadata.toml`. The diff removes every `LFunctions`/`ZerosOfLFunctions` citation except the Scope sentence (`:21`) and the Downstream-consumers paragraph (`:2619`); a grep for `AnalyticLFunctionData`, `unit_moduleFinite`, `compactCochains`, `localDualError` and `derivedComplement_iff` in the README finds nothing. No `set_option`, sorried data, process word, pull-request number, LaTeX delimiter or machine path was introduced.

**Gate.** The worker's gate at this head passes every check (`gate.md`: all counters 0, build 0, OK). Fresh dependency-check output (verbatim):

```text
depcheck: 201 roadmaps, 1322 edges, 0 problem(s)
```

No UPWARD, CYCLE or `not movable` line. Merge-order positions read from `ORDER.txt`: SelmerIwasawaCohomology line 41, ArithmeticKTheory 254, ZerosOfLFunctions 270, LFunctions 271, so the two roadmaps named under Downstream consumers are indeed later and may consume §4.14.

**Elaboration.** `lake env lean` on `Suggested.lean` (all three `TauCeti.*` object files present) exits 0 in 14 s with exactly six `declaration uses sorry` warnings, at lines 73, 102, 122, 196, 202 and 223, and nothing else. The Lean diff is confined to the module docstring (lines 28–35); every declaration is byte-identical to the previous head.

**Signatures.** A scratch copy with `#check @name` for all 17 declarations elaborated. The elaborated types agree with the README statements and with the previous report: `padicKummer_equiv` keeps `[NeZero (p : K)]`; `weaklySemisimple_integral_lift` keeps `IsDomain`, `IsDiscreteValuationRing`, `IsFractionRing O K`, `Module.Free`, `Module.Finite`; `finiteCotype_primaryDecomposition` keeps the p-primary hypothesis and `Finite (torsionBy G p)`; `gammaPoleOrder_hodge_analytic` and `gammaPoleOrder_complexHodge_analytic` keep `FiniteDimensional ℂ W` and state `meromorphicOrderAt (hodgeGammaFactor …) m = −(gammaPoleOrder … m)` in `WithTop ℤ`; `congruentLocalKummerImage_ncard` keeps `Squarefree n`. No binder changed.

**Padding probe.** Three scratch copies replaced each of the six admissions by `simp`, `rfl` and `infer_instance`. None closed: every probe reports an error at each of the six admission sites (lines 75, 110, 128, 198, 205, 228 of the copies; `rfl` additionally fails to unify at the six declaration heads). By object none restates a definition, mirrors a Check or computes a small value. No padding finding.

**Headline inventory.** Unchanged from the previous report: six headlines statable at the pins are stated (§0.8, §0.13, §2.12a, §4.14 real and complex halves, §4.29 local images), and the docstring names the missing carrier for each of the others (restricted-ramification groups and arithmetic Selmer complexes; Iwasawa cochain complexes, determinant lines and characteristic ideals; crystalline realizations and finite-condition carriers; arithmetic tower modules and p-adic L-function data; pairings on Selmer complexes; infinite elliptic Selmer and Sha carriers). The deleted docstring sentence concerned a target that no longer exists, so the inventory is consistent with the README.

**Source sample in the changed passages.** Of the fifteen seeded targets, four fall in the diff (0.11, 2.18, 3.0, 4.18); the other eleven (0.5, 2.16, 2.19, 2.21, 3.6, 3.12, 3.15, 3.19, 4.8, 4.21, 4.28) are untouched and stand as verified in the review at cbf830f. Rubin's 1999 Arizona Winter School draft was read from the cached text fetched from the AWS site (page markers; printed page = PDF page − 10, as the README states).

| Target | Text read | Conclusion |
| --- | --- | --- |
| 0.11 | rubin-aws lines 6762–6822: PDF page 166 carries printed “156”, Proposition 4.2 (line 6764, `H^i(Γ, Ind_H T) ≅ ⊕_{H\G/Γ} H^i(gΓg⁻¹∩H, T)`), Remark 4.3 (6783, Shapiro when `Γ = G`), Corollary 4.4 (6784, the four-term exact sequence) and Proposition 4.5 (6792–6822, the restriction/norm/corestriction diagram for `F/K` finite) | All four statements are on printed p. 156 and say what §0.11 cites them for; cup naturality and the projection formula are now attributed to ProfiniteCohomology Layer 12 (`cup_res`, `cup_projection`, main lines 2132–2135) and Layer 8 (compatibility 4, main line 1306), both present on main. |
| 2.18 | rubin-aws lines 765–777: PDF page 23 carries printed “13”; Lemma 5.7 (770–773): `S^Σ(K,W_M)` finite, `S^Σ(K,T)` finitely generated, dual of `S^Σ(K,W)` finitely generated, for nonzero `M` and finite `Σ`; proof via Lemma 5.3 and Proposition B.2.7. Proposition 5.6 and Remark 5.5 at lines 752–754 (PDF 22, printed 12) | Locator and hypotheses match the three clauses of §2.18 exactly. |
| 3.0 | Tau Ceti pin `CompletedGroupAlgebra/Map.lean:171` (`domCongr` from `Γ ≃ₜ* Δ`), `:195` (`domCongr_of`), `:149` (`map_id`), `:157` (`map_comp`), `:200`–`:205` (`continuous_map`, hypotheses quoted in R01); Nekovář §8.4.1–8.4.2 unchanged | Definition and involutivity at the stated generality; continuity needs the finite-index hypothesis (R01, P3). |
| 4.18 | rubin-aws lines 896–901 (Corollary 6.4, PDF 26, printed 16: Leopoldt for `L` gives finiteness via the kernel of `(O_L^× ⊗ ℚ_p/ℤ_p)^χ → ⊕_{v∣p} H¹(K_v, W*)`) and 1273–1274 (Remark II.2.7, PDF 35, printed 25: finite iff Leopoldt for `T = O`); IntegralIwasawaTheory head lines 313–319 (`leopoldtDefect E p = rank_{ℤ_p} ker ι_E`, kernel torsion-free, `δ = r₁+r₂−1−rank(image ι_E)`, `LeopoldtConjecture E p := δ = 0`) | The supplier's defect is the corank of the kernel cut out by strictness at `p`; finiteness iff `δ = 0` is Remark II.2.7. |

**Supplier citations resolved on current heads.** ArithmeticGaloisDuality (open head, `roadmaps show`, 7442 lines): §R02.3.0c “S-unit rank and cardinality adapter” (lines 1700–1707) names the pinned `Set.unit_fg`, `Set.unit_fg_of_units` and the adapter `Module.Finite ℤ (Additive U)` for finite `S`; §D7.5 (line 5577) opens with the paragraph **Continuous cochains with compact support** (5579); §D7.7.3 (6387–6392) defines `Err_v` as the cone of the adjoint and says derived complementarity means `Err_v` acyclic, and 6436–6438 gives the error triangle with third vertex `⊕_v Err_v`. IntegralIwasawaTheory (open head, 1772 lines): §2.2 (309–319) as quoted above. PadicMeasuresIwasawaAlgebras §5.1 on main (`content/TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:3172` onward): the determinant of a perfect complex as `⊗_i det(P^i)^{⊗(−1)^i}`, `detLine_acyclic` (the fraction-field trivialization), and the paragraph “Rational trivialization and the characteristic divisor” (section lines 140–149) stating the image lattice `∏_i char(H^i)^{(−1)^{i+1}}` and that the exponent `(−1)^i` describes the inverse determinant line with its dual trivialization, which is exactly §3.14's `𝔇(C) = (det_Λ C)⁻¹` convention. ProfiniteCohomology on main (2611 lines): Layer 8 “cup products in low degrees” (line 1265) with the projection formula (1306), Layer 12 “the graded cup product in all degrees” (2091) with `cup_res`, `cup_infl`, `cup_coeffMap`, `cup_projection` (2132–2135). LFunctions at its open head: Layer 0 “completed L-function data” (line 346) defines `AnalyticLFunctionData` with real and complex shift multisets and its gamma factor; ZerosOfLFunctions at its open head: Layer 1 owns the gamma divisor (its §1.5, referenced at line 414). Both are later than this roadmap in the merge order, so the Downstream-consumers paragraph is a deferral, not a supply edge.

**Pinned declarations opened this round** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`): Mathlib `RingTheory/DedekindDomain/SInteger.lean` (`Set.unit` at line 108; the file's header still lists finite generation of `S`-units as a TODO, so `Set.unit_fg` is Tau Ceti's); Tau Ceti `RingTheory/DedekindDomain/SInteger/Unit.lean:149` (`theorem unit_fg [Finite S] (hu : Group.FG ((∅ : Set _).unit K)) : Group.FG (S.unit K)`) and `:207` (`instance unit_fg_of_units [Finite S] [Monoid.FG Rˣ]`); Tau Ceti `CompletedGroupAlgebra/Map.lean:67` (variables `[CommRing R] [Group Γ] [TopologicalSpace Γ]`), `:149`, `:157`, `:171`, `:195`, `:200`–`:205`. The declarations the unchanged passages rely on were opened in the previous review and are not re-listed.

**Adversarial table.** One row per statement. Rows marked (r2) carry forward the review at cbf830f for statements the diff leaves untouched, with the values that review computed; rows marked (new) are computed this round for the changed statements.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| 0.9 finite terms from `Set.unit_fg` (new) | `ℚ`, `S={3,∞}`, `p=3`, `m=1,2` | `ℤ[1/3]^× = ±3^ℤ`, finitely generated of rank 1; `𝓞_{F,S}^×/3^m = ℤ/3^m` (`−1` a cube), finite; limit `ℤ₃`; `Pic = 0`, `T_p Pic = 0` | Pass; the finite-generation input is what makes each term finite. |
| 0.9 hypothesis of `Set.unit_fg` (new) | `S` infinite (all places) | `𝓞_{F,S}^× = F^×`, not finitely generated; `F^×/p` infinite | Excluded by `[Finite S]`, which §0.9 assumes. |
| 0.11 Shapiro and norm (new values) | `L = K`; base `a` with `[L:K]=2`; `x = κ_K(b)` | Shapiro and norm the identity; `κ_K(Na) = 2κ_K(a)`; `cor(res κ(b) ∪ res x) = 2(κ(b) ∪ x) = κ(b²) ∪ x`, target `H²(K, ℤ_p(2))` | Pass; projection formula `cor(res a ∪ b) = a ∪ cor b` is ProfiniteCohomology Layer 8/12, not Rubin B.4. |
| 2.18 Lemma 5.7 clauses (new) | `T = ℤ_p` trivial over `ℚ`, `Σ = {p,∞}`, `M = p^m` | `S^Σ(W_M) = Hom(G_Σ, ℤ/p^m)`, finite (`G_Σ^{ab}/p^m` finite); `S^Σ(T) = Hom(G_Σ, ℤ_p) = ℤ_p`, finitely generated; dual of `S^Σ(W) = Hom(G_Σ, ℚ_p/ℤ_p)` is `G_Σ^{ab}(p) = ℤ_p`, finitely generated | Pass; the strict exception of Remark 5.5 is retained. |
| 2A.1 finite-place complex versus modified fibre (new wording) | `K=ℚ`, `S={2,∞}`, `T=𝔽₂`, strict | modified fibre `H^i = 𝔽₂` for every `i<0` (complete Tate term of `C₂` on `𝔽₂`); finite-place compact-support complex and `burnsFlachFiniteComplex` bounded below, no negative cohomology | Pass; the §D7.5 complex cannot replace the modified fibre, as the Check says. |
| 2A.4 error cone (new wording) | `Err_v = 0` for all `v`; one `Err_v = k[0]` | cone of the duality map acyclic, `H²` dual to modified `H¹`; with a nonacyclic `Err_v` the cone is `k[0]` and the duality is off by `k` | Pass; matches §D7.7.3's definition (acyclicity, not `H¹`-annihilation). |
| 3.0 involution at the stated generality (new) | `Γ = ℤ_p`, `X = γ−1`; `Γ = ℤ` discrete; `Γ = S₃` | `ι(X) = (1+X)⁻¹ − 1 = −X + X² − …`, `ι² = id` by `map_comp`, `map_id`; every open subgroup `p^nℤ_p` of finite index, `continuous_map` applies; discrete `ℤ`: `{0}` open of infinite index, pinned lemma inapplicable (R01); `S₃`: inversion not a homomorphism, excluded by “abelian” | Pass for the used case; prose hypothesis incomplete (R01, P3). |
| 3.0 twist (r2) | `κ(γ)=u` | `Tw_κ(X) = u(1+X) − 1`; `ι Tw_κ ι(γ) = κ(γ)⁻¹γ` | Pass. |
| 3.14 inverse determinant convention (new, against PadicMeasuresIwasawaAlgebras §5.1) | `C = [Λ —a→ Λ]` in degrees 0,1; `H¹=Λ/(a)`, `H²=Λ/(b)` | supplier: `det C` trivializes to `∏ char(H^i)^{(−1)^{i+1}}`, so `det C ↦ (a)⁻¹`; inverse line `𝔇 = det⁻¹ ↦ ∏ char(H^i)^{(−1)^i}`; for `H¹, H²`: `(a)⁻¹(b) = (b)/(a)` | Pass; the README's `(b)/(a)` and the supplier's exponent agree. |
| 4.14 concatenation Check (new) | two real shifts `0`, one complex shift `0`, multiplicity one each, at `m=0` | `Γ_ℝ(s)²Γ_ℂ(s)`: `Γ_ℝ` has a simple pole at `0` (`Γ(s/2)`), `Γ_ℂ` a simple pole at `0` (`Γ(s)`), order `−3`; integer count: real `0+0` nonpositive even twice, complex `0+0 ≤ 0` once, total `3`; complex alone `1` | Pass; no record enters. |
| 4.14 real headline (r2) | empty list; real shift `0` at `m=0,−1,−2` | product 1, order 0; `Γ_ℝ(s)` orders `−1, 0, −1` | Pass. |
| 4.14 complex headline (r2) | complex shift `0` at `m=0,−1`; weight-one pair | orders `−1, −1`; real place `Γ_ℂ(s)`, complex place `Γ_ℂ(s)²` | Pass. |
| 4.14 Deligne recipe (r2) | diagonal `H^{a,a}`, `ε=0,1` | eigenvalue `(−1)^a` → shift `−a`; `−(−1)^a` → shift `1−a`; off-diagonal pair once with shift `−a` | Pass. |
| 4.18 Leopoldt via the supplier's defect (new) | `F=ℚ`; `F` with unit rank `r₁+r₂−1 ≥ 1` and `ι_F` replaced by `0`; `F` real quadratic with injective `ι_F` | `ℚ`: `E ⊗ ℤ_p = 0`, `leopoldtDefect = 0`, strict group ⊆ finite class-group term, finite; zero map: kernel rank `r₁+r₂−1`, `δ = r₁+r₂−1−0`, kernel of `E ⊗ ℚ_p/ℤ_p → ⊕_{v∣p}` has corank `r₁+r₂−1`; injective: `δ = 0`, kernel finite, group finite | Pass; corank of the strict group equals `rank_{ℤ_p} ker ι_F` because the kernel is torsion-free (supplier line 313). |
| Downstream consumers (new) | merge-order lines | SelmerIwasawaCohomology 41 < ZerosOfLFunctions 270 < LFunctions 271 | Pass; deferral, no supply edge (depcheck 0 problems). |
| Conventions: Tate dual action (r2) | `ℤ/7`, `g` = ×2 | contragredient ×4 = 2⁻¹; product 8 ≡ 1 | Pass. |
| Conventions: twist `Tw_k` (r2) | `κ(γ)=4` in `ℤ₃`, `k=1` | `φ₁(γx) = 4⁻¹γφ₁(x)`; with `t^k`: `γ(x⊗t) = γx ⊗ 4t` | Pass. |
| Conventions: `det⁻¹` (r2) | `Λ —X→ Λ` in degrees 1,2 | `H¹=0`, `H²=Λ/(X)`; signed length `+1`; lattice `(X)` | Pass. |
| 0.4 tensor/completion (r2) | `ℚ₃`, `p=3`; `ℚ₅`, `p=3` | completions `ℤ₃²`, `ℤ₃`; `a⊗1−1⊗a` nonzero, killed by multiplication | Pass. |
| 0.5 topology (r2) | `K=ℚ₅`, `p=3` | `K^×/(·)^{3^m}` has `3^m` elements, limit `ℤ₃`; `ℚ^×/(·)^2` infinite | Pass. |
| 0.6/0.8 Kummer headline (r2) | `K` sep. closed; `ℝ`, `p=2`; `𝔽₇`, `p=3` | `0/0`; `ℤ/2 / ℤ/2`; `ℤ/3 / ℤ/3` | Pass; `NeZero (p:K)` excludes char `p`. |
| 0.8 char-`p` control (r2) | `𝔽_p(t)` | étale `μ_p = 1`, `H¹=0`; `t` has nontrivial `p`-power class | Excluded correctly. |
| 0.10 Mittag-Leffler (r2) | `μ₉→μ₃` over `ℚ`, class of 2 | transition onto on `ℚ^×/(·)^9 → ℚ^×/(·)^3` | Pass. |
| 0.12 invariants→coinvariants (r2) | `σ=id`; `J₂(1)`; `J₂(2)` over `ℚ` | (dim ker, dim coker) = (1,1),(1,1),(0,0) | Pass. |
| 0.13 headline (r2) | DVR `O`, free `M`, `N=ker(σ−1)`; `ℤ₃`, `σ=1,2,4` | `N` a summand; `dim_k ker(σ̄−1) ≥ rank N`; invariants (1,1),(0,0),(0,1); bijective yes, yes, no | Pass. |
| 2.1–2.2 Selmer datum (r2) | `H=k²`, `res(x,y)=y`, `L=0`; `L=k`; no places | kernels `k×0`, `k²`, `k²` | Pass. |
| 2.2 product necessity (r2) | `u_m=∏_{j<m}ℓ_j^{p^j}` | singular valuation `p^j` at every `ℓ_j` | Pass. |
| 2.3/2.4/2.5 (r2) | `g:k²→k`, `L=k×0`; `L=k²` | `g(L)=0`, `g⁻¹(0)=k×0`; adjunction true/true; false/false | Pass. |
| 2.6 saturation (r2) | `O=ℤ`, `L_V=0`; `2ℤ⊂ℚ` | preimage `0` saturated; `2·1∈2ℤ`, `1∉` | Pass. |
| 2.7 unramified (r2) | `ℤ/p` trivial over `ℚ_ℓ`; `ℤ` discrete | `Hom(Ẑ,ℤ/p)=ℤ/p`; `Hom_cts(Ẑ,ℤ)=0≠ℤ` | Pass. |
| 2.8 Greenberg (r2) | `F⁺=0,T`; `T=ℤ₃(1)` at 3 | unramified part `0`, full `H¹=ℤ₃²` | Pass. |
| 2.8a filtrations (r2) | `ℚ_p(n)`, `n=−1,0,1`; `y²=x³−x` at 3 | `Fil¹` = 0,0,`V`; discriminant 64, supersingular | Pass. |
| 2.9 restricted Selmer (r2) | `ℚ`, `p=3`, `Σ={3,19,∞}`, `μ₃` | relaxed `(ℤ/3)²`; strict at 3: line `⟨19⟩`; strict at both: 0 | Pass. |
| 2.10 duals (r2) | `ℤ/7` ×2; `(ℚ₃/ℤ₃)(1)` scalar `u` | dual ×4; dual `u⁻¹` | Pass. |
| 2.11 coranks (r2) | `0`, `ℤ/p`, `ℚ_p/ℤ_p`, `(ℚ_p/ℤ_p)²` | compact duals `0, ℤ/p, ℤ_p, ℤ_p²`; coranks 0,0,1,2 | Pass. |
| 2.12 elliptic Selmer (r2) | MW `ℤ^r⊕finite`, finite `Ш[p^∞]` | corank `r` | Pass. |
| 2.12a headline (r2) | `0`, `ℤ/p²`, `ℚ_p/ℤ_p`, `(ℚ_p/ℤ_p)²⊕ℤ/p`, `⊕_ℕ ℤ/p` | `(r,F)=(0,0),(0,ℤ/p²),(1,0),(2,ℤ/p)`; last excluded | Pass. |
| 2.12a real/complex Kummer (r2) | `E(ℝ)` two components, `n=2`; odd `n`; `ℂ` | `ℤ/2`; `0`; `0` | Pass. |
| 2.13 trace dual (r2) | `O=ℤ_p[√p]`, `p` odd | `Tr(1/(2√p))=0`, `Tr(√p/(2√p))=1` | Pass. |
| 2.14 dimensions (r2) | `V=ℚ_p`, `ℚ_p(1)` over `ℚ_ℓ` | `(1,0),(0,1)`; `dim H²=0,1` | Pass. |
| 2.15 bad primes (r2) | `𝒲=ℤ/3`, `Fr=1`, `Fr=2` | `(ℤ/3,ℤ/3),(0,0)` | Pass. |
| 2.16 orthogonality (r2) | `V=ℚ_p`, `V*=ℚ_p(1)` over `ℚ_ℓ` | `dim H¹_f=1`, `dim H¹_f(V*)=0`, `dim H¹(V)=1` | Pass. |
| 2.17 finite levels (r2) | `ℤ/9`, subgroup `3ℤ/9` | annihilator `3ℤ/9`, `3·3=9` | Pass. |
| 2.19 Poitou–Tate (r2) | `ℚ`, `T=ℤ_p(1)`, `Σ={p,∞}`, `Σ₀=∅` | `S^Σ(W_M)=⟨p⟩≅ℤ/p^m`; `loc^s` onto; coker 0 | Pass. |
| 2.20 limit form (r2) | same, `M→∞` | `ℤ_p[p]→ℤ_p` onto; quotient 0 | Pass. |
| 2.21 fibre/archimedean (r2) | `ℚ`, `S={p,∞}`, `T=𝔽_p`, `p` odd, strict | `H⁰` coker `k`; modified onto; `Q_∞[−1]≃k[0]` | Pass. |
| 2.21 dyadic real (r2) | `C₂`, `𝔽₂` trivial | `Ĥ^i=𝔽₂` all `i`; `Cone(q_v)` has `H^j=𝔽₂` for `j≤−1` | Pass. |
| 2.22 `H⁰` correction (r2) | global 0, local `k[0]`, strict | `Sel=0`, fibre `H¹=k`, `J=k` | Pass. |
| 2.23–2.24 (r2) | identical conditions; `T′=p⁻¹T` | cone acyclic; `Q=T/pT≠0`, rationally 0 | Pass. |
| 2.25 descent (r2) | index 2, `p=3`; `C₃`, `ℤ/3` | `cor∘res=2` unit; `H¹(C₃,ℤ/3)=ℤ/3` restricts to 0 | Pass. |
| 2A.2 function field (r2) | `𝔽_q(t)`, `𝔽_p`, `p∤q(q−1)` | `Sel` dim 1; dual 0; difference 1 | Pass. |
| 2A.3 tangents (r2) | `n=1` trivial, `s` strict places | coker `k^{s−1}` | Pass. |
| 2A.4 trace (r2) | `n=1`; `n=0`; char 2, `u=[[1,1],[0,1]]` | `ad⁰=0`; invariants dim 2,2; norm images dim 2,1; `Ĥ⁰=0`, `k` | Pass. |
| 2A.5 Tor (r2) | `ℤ_p→𝔽_p` | `0→H¹/p→H¹(C′)→H²[p]→0` | Pass. |
| 3.0 coordinates (r2) | `d=0`; `d=1`; `ℤ₃`, `Δ=C₂`; `Δ=C₃` | `R[Δ]`; `O[[X]]` regular dim 2; idempotents `(1±δ)/2`; embedding dim 3, not regular | Pass. |
| 3.0 regular sequence (r2) | `𝔽_p`, `Γ′=pℤ_p`; `ℤ_p²`, `Γ′=⟨γ₁^{p²}⟩` | `X^p` non-zero-divisor, quotient `𝔽_p[C_p]`; quotient keeps `X₂`, `C_{p²}` | Pass. |
| 3.1 `H⁰_Iw` (r2) | cyclotomic tower, `ℤ_p` trivial | corestriction ×`p`, limit 0; restriction limit `ℚ_p/ℤ_p` | Pass. |
| 3.2 topologies (r2) | `ℤ₅`, `Γ=ℤ₅×C₂`; `ℤ_p×C_p` | `∩m₊^n=0×A`; `rad^p⊆J⊊rad` | Pass. |
| 3.3/3.10 control (r2) | `[Λ—X→Λ]` degrees 1,2 | `H¹_Iw=0`, `H²_Iw[X]=O`, finite-level `H¹=O` | Pass. |
| 3.4 Nakayama (r2) | `[Λ—1→Λ]`; `[Λ—X→Λ]` | acyclic; two copies of `k` | Pass. |
| 3.5 universal norms (r2) | `ℤ_p`, unramified tower | norm valuations `p^mℤ_p`, intersection 0 | Pass. |
| 3.6 semilocal (r2) | `q` split, `[F:K]=2`, coefficient `k` | two summands, dim 2 | Pass. |
| 3.7 twist (r2) | `k=0,1,−1`, `κ(γ)=4` | scalars 1, 1/4, 4 | Pass. |
| 3.9 local error (r2) | `0→O[0]` | error `O[0]` | Pass. |
| 3.11 classical control (r2) | `H=0`, `Q=k` | `I=0`, coker `k` | Pass. |
| 3.12 duality shift (r2) | `C=Λ[−1]` | `RHom(C,Λ)[−3]` in degree 2 | Pass. |
| 3.13 Euler ranks (r2) | `ℚ`, `ℤ_p`, `ℤ_p(1)`, `p` odd | real minus ranks 0,1; local rank 1 | Pass. |
| 3.15 covers, `G_m`, `K(π,1)`, `j_*`, tower limit (r2) | `ℤ[1/2,i]`, `ℤ[1/2,√3]`; `ℚ`, `S={p,∞}`, `r=4`; `p=3`, `p=2`; `Σ={2,7}`, `𝔽₃`; trivial tower, `ℤ₃(1)` | discriminants `−4`, `12`; `ℤ/2`; `ℤ/2` both sides; `(𝔽₃(−1))^{Fr₂=1}=0`; `ℤ₃⟨3⟩→ℤ₃⟨3,7⟩` proper | Pass. |
| 3.16 lattices (r2) | `ℤ₃`, `3ℤ₃` | both rationalise to `ℚ₃`; quotient `ℤ/3` | Pass. |
| 3.17 exclusions (r2) | `θ̄=1`, `ω` | `H⁰` or dual `H⁰` nonzero | Pass. |
| 3.18 pseudo-null (r2) | `O[[T₁,T₂]]/(T₁,T₂)` | pseudo-null, infinite; over `O[[T]]` finite | Pass. |
| 3.19/3.20 (r2) | `Λ/(λ,T)` | torsion with finite submodule | Pass. |
| 3.21 Fitting (r2) | `Λ/(f)`, `Λ/(λ,T)`, `0`; `k[[λ]]`, `k` infinite | `((f),(f))`, `((λ,T),Λ)`, `(Λ,Λ)`; finite residue field needed | Pass. |
| 4.7 realization (r2) | `p=5`, jump `−1`; `W(k)/5`; `μ₃` at `ℚ₃` | `ℤ₅(1)`; `ℤ/5` with zero `B_cris` tensor; `μ₃` not in `[0,0]` | Pass. |
| 4.8 (r2) | zero; `ℤ/p^m(1)`; finite `R` | zero group; crystalline in intervals containing `−1`; `R⊗B_cris=0` | Pass. |
| 4.9 Bloch–Kato (r2) | `ℚ_p`; `ℚ_p(1)` over `K` | `dim H¹_f = 1`; `[K:ℚ_p]·1+0` | Pass. |
| 4.10 preimage (r2) | `ℤ_p`, `[0,0]`; `ℤ_p(1)`, `[−1,0]`; `p=2` | unramified line; unit Kummer classes; `p>2` fails | Pass. |
| 4.11 inverse different (r2) | `δ=z=1/(2√p)` | `Tr(z)=0`, `Tr(δz)=1/(2p)∉ℤ_p` | Pass. |
| 4.12 (r2) | `ℚ_p`, `V⁺=0`; `ℚ_p(1)`, `V⁺=V` | `L_str=0`, `L_f=L_Gr` dim 1; `L_str=L_Gr=H¹` dim 2, `L_f` dim 1 | Pass. |
| 4.13 realization (r2) | weight 0, `F∞=±1`; `ℚ_p(n)` | `Γ_ℝ(s)`, `Γ_ℝ(s+1)`; `Γ_ℝ(s−n)` | Pass. |
| 4.14 totalized Gamma (r2) | `Γ_ℝ` at 0 | value 0, order `−1` | Pass. |
| 4.15 criticality (r2) | `n=−1,0,1,2`; `−6..6` | orders `(0,0),(0,−1),(−1,0),(0,0)`; critical `{−5,−3,−1,2,4,6}` | Pass. |
| 4.16 towers (r2) | constant `C₃`; `p=2` | norm limit `C₃`; `1/2∉ℤ₂` | Pass. |
| 4.17 reciprocity (r2) | `E=3ℤ₃⊂U=ℤ₃` | kernel `U/E=ℤ/3` | Pass. |
| 4.19 (r2) | norm-compatible units; `Fr` scalar `a` | norms ↦ corestriction; Euler factor `1−a⁻¹` | Pass. |
| 4.20 Tate twists (r2) | `n=−1,0,1,2` | `Fil¹=0,0,V,V`; dual `X⁺(−2)` | Pass. |
| 4.21 corank and ideal predicate (r2) | `Δ⁺=1`; `Λ/(T)`; `p=5`, `e₊Λ`; `f`, `pf`, `uf` | corank 1; 0; `(1,0)`; true, false, true | Pass. |
| 4.22 twist (r2) | `p=3`, `a=γ−1`; `p=5`, `Δ⁺=C₂`, `n=2` | `Tw_{−2}(a)` nonunit; `e₀` moves | Pass. |
| 4.23 (r2) | `[O[[u]]—u→O[[u]]]` at `u=0` | `H¹=H²=O`, generically acyclic | Pass. |
| 4.24–4.25 (r2) | `ℚ_p(1)` at `w∤p` | `H⁰(V*(1))=ℚ_p≠0`; preimage killed by `p^{ord_p(q_w−1)}` | Pass. |
| 4.26 elliptic (r2) | `Lie E` dim 1; rank `r`, `Ш` corank `d` | `dim H¹_f=[K:ℚ_p]`; `r+d` | Pass. |
| 4.27 (r2) | trivial `ρ` over `ℚ` | `Hom(Cl_ℚ[p^∞],A)=0` | Pass. |
| 4.28 Cassels–Tate parity, Euler characteristic, cubic twist (r2) | `(O/ϖ)²` symplectic; `𝒦/O`; `O/ϖ²`; strict ordinary data; `V=𝒦(α⁻¹)⊕𝒦(α)(1)` | `gr¹` dim 2; `dim N[ϖ]=1`; `χ=(r₁+2r₂−[E:ℚ])dim V/2=0`; `h¹(C_α)−h¹(C_{α⁻¹})=1` odd | Pass. |
| 4.29 coboundary, local images, signs, junk, alternation (r2) | `(2,4)`, `n=1`; 26 pairs `(p,n)`; `n mod 8`; `n=0`; `Ш[2^∞]_red=ℤ/2` | `16=8+8`; sizes as listed in the review at cbf830f (`I₂(1)={1,2,5,10}`); signs `+,+,−,−`; `Squarefree 0` false; non-square order excluded | Pass in all cases. |

**Duplication and ownership.** The diff adds no construction: it deletes one (the record comparison, now a consumer's) and re-points names to their owners (Tau Ceti `Set.unit_fg`, ArithmeticGaloisDuality §§D7.5, D7.7.3, IntegralIwasawaTheory §2.2, PadicMeasuresIwasawaAlgebras §5.1, ProfiniteCohomology Layers 8 and 12). The seven backticked names the worker's resolver could not find (`AbelianVariety.deRham`, `DualitySupport.torsionDual`, `DualitySupport.traceComparison`, `RestrictedRamification.maxUnramifiedOutside`, `arithmeticIwasawaCochains.shapiro`, `arithmeticSelmerComplex.changeCondition`, `arithmeticSelmerComplex.h1_exact`) are in unchanged passages and were resolved in the previous review to AbelianSchemesAndArithmeticModuli, PadicLocalLanglandsForGL2Qp §0.3, ArithmeticGaloisDuality and NoncommutativeAndEquivariantIwasawa §F.4 at their heads; nothing in the diff touches them. Ownership against open pull requests whose files the brief does not give was not checked.

## Not verifiable

- The eleven seeded targets outside the diff (0.5, 2.16, 2.19, 2.21, 3.6, 3.12, 3.15, 3.19, 4.8, 4.21, 4.28) were not re-read against their sources this round; they stand on the review at cbf830f, whose source table is incorporated by reference.
- Nekovář §8.9 and §8.10 (cited unchanged in §3.14 for error terms and specialization) were verified in the previous round and not re-opened; only the new PadicMeasuresIwasawaAlgebras §5.1 citation was checked this round.
- The adversarial table is a computation record on the displayed instances, not a proof of the prose theorems; the new rows check the changed wording against the suppliers' definitions, not the suppliers' own correctness.

## Source issues

- none
