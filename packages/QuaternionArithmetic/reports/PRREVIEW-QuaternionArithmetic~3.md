# Review of QuaternionArithmetic (pull request #1722 at 75c9080)

**Verdict:** accepted

No P1 or P2 finding. The gate passes, the dependency check is clean, every headline elaborates, and the previous round's blocking findings are repaired. Five P3 notes follow; they are the author's to take or leave.

## R01 (P3) — The λ values in the §2.4 Checks swap the symbols −1 and 0

**Location:** `TauCetiRoadmap/QuaternionArithmetic/README.md:883`, “λ in the 1, −1, 0 cases is 3/2, 3/4, 1/2”, and line 884, “4/3, 8/9, 2/3”.

**Claim:** The Conventions row (line 135) and Voight Main Theorem 25.3.19 (`voight line 17773`, printed p. 445) and (26.6.6) (`voight line 18723`) give λ = 1 + 1/q, 1 − 1/q, 1 − 1/q² for symbols 1, −1, 0. The Checks list 1 − 1/q² for −1 and 1 − 1/q for 0.

**Witness:** Lipschitz order at 2 (symbol 0): Lemma 26.6.7 gives [H₂ˣ : L₂ˣ] = [H₂:L₂]·λ·(1 − 1/2)⁻¹ = 4λ, and a direct count gives index 12/4 = 3, so λ = 3/4 = 1 − 1/q², not 1/2. Ramified maximal order (symbol −1): N/12·λ = φ(p)/12 forces λ = 1 − 1/p.

**Repair:** Write “λ in the 1, −1, 0 cases is 3/2, 1/2, 3/4” and “4/3, 2/3, 8/9”. With these values the §5.4 and §5.2 formulas give mass(Cls L) = (4/12)(3/4) = 1/4 = 1/w_L and the Hurwitz mass 1/12.

## R02 (P3) — Supplier section and declaration names that do not resolve as written

**Location:** `README.md:87`, “ReductiveGroupsPartII RG2.2.2, “sl2-tree””; `README.md:238–239`, “R18.3.1 (`DefiniteClassSet` …); R18.5.17a (`DefiniteClassSetGraph` …)”; also line 1023.

**Claim:** On main, *sl2-tree* is in `### RG2.2.4 classical groups, the tree and examples` (ReductiveGroupsPartII README line 3647); RG2.2.2 is “facets, fixers and the reduced building”. The contracts and §1.12 already say RG2.2.4. The names `DefiniteClassSet` and `DefiniteClassSetGraph` occur nowhere in HilbertModularVarietiesAndShimuraCurves at its open head (README or Suggested.lean); R18.3.1 names its object `C_U` on the carrier `DoubleCoset.Quotient`, and R18.5.17a names a class-set graph with `HeckeFamily` Brandt matrices.

**Witness:** `grep -i DefiniteClassSet` over the supplier's README (4383 lines) and Suggested.lean (54 lines) returns nothing.

**Repair:** Change RG2.2.2 to RG2.2.4 in Scope. Cite R18.3.1 and R18.5.17a by section and by the supplier's own words (the central quotient `C_U` of QuaternionicModularForms §0.3's class set; the definite class-set graph and its `HeckeFamily`), without backticked names the supplier does not declare.

## R03 (P3) — Two Voight locators and two line numbers

**Location:** `README.md:1405`, “(`[V, 30.7.4]`)”; `README.md:1367`, “Prove `m(S,O;Γ) < ∞` (`[V, 30.5.5]`)”; `README.md:187`, “lines 104, 93, 114”; `README.md:210`, “(line 78)”.

**Claim:** The squarefree-level formula h(S)∏_{𝔭|𝔇}(1 − (K|𝔭))∏_{𝔭|𝔐}(1 + (K|𝔭)) is Example 30.7.5 (`voight line 23763`, printed p. 548); Proposition 30.7.4 (`voight line 23756`) is m(S,O;N_{Bˣ}(O)) = h(S) for a maximal order of class number one. Corollary 30.5.5 (`voight line 23410`, printed p. 541) is the local finiteness statement of §30.5 (R a DVR); the global finiteness in §6.2's setting is Theorem 30.4.7 with (30.7.2) and the finite-index comparison 30.3.14. At the pin `map_star_of_algEquiv` is at `Algebra/Quaternion/AlgEquiv.lean:106` and `invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff` at `Invariant.lean:79`.

**Witness:** The quoted lines above.

**Repair:** Cite [V, 30.7.5] in §6.4; cite [V, 30.4.7, (30.7.2), 30.3.14] for global finiteness and keep [V, 30.5.5] for the local statement; write 106 and 79.

## R04 (P3) — README shape and ordering hygiene

**Location:** `README.md` (no `## Downstream consumers` section); `README.md:1349`, “[Gross–Zagier formulas and arithmetic heights roadmap] §0a.3”; `README.md:160`, “(../GlobalNumberFields/README.md)”; `README.md:2234`, “Every number below is checked by computation (Sage: …)”; `README.md:528` and `:709` (Checks naming `leftOrderSubalgebra` and “the total Lean definition”); `README.md:1292` (φ(𝔇), ψ(𝔐) defined without Checks); Layer 1 jumps from 1.5 to 1.7.

**Claim:** The house shape ends with `## Downstream consumers`, `## Worked examples`, `## References`. GrossZagierAndArithmeticHeights is later in the merge order (line 319 against this roadmap's 265), so its comparison belongs under Downstream consumers as that roadmap's consumption, not in §6.1 as a comparison stated here (there is no *Needs:* edge, so this is hygiene, not an upward dependency). GlobalNumberFields is `Completed/GlobalNumberFields` on main, so the relative link is dead. A Check never names a Lean counterpart; the Sage sentence is process narrative; a definition carries at least three Checks.

**Witness:** `ls content/TauCetiRoadmap | grep GlobalNumberFields` is empty; `content/Completed/GlobalNumberFields/README.md` has Layers 0–11.

**Repair:** Add `## Downstream consumers` (GrossZagierAndArithmeticHeights §0a.3 as the instance B = M₂(ℚ), O = R₀(N), S = O_c, Γ = Γ₀(N) with the selected CM type; FiniteGroupInvariants 7.1; AbelianVarietiesOverFiniteFields 8.4; CanonicalModelsAndGonality) and drop the comparison sentence from §6.1; fix the link to `../../Completed/GlobalNumberFields/README.md`; delete the Sage sentence (the Worked examples stand as evaluations of the stated formulas); rephrase the two Checks in prose (“the left multiplier set is an `R`-subalgebra”; “ψ(0) = 1 is the empty product”); give §5.3's φ(𝔇), ψ(𝔐) three Checks (F = ℚ reduces to 5.2; 𝔭 of norm 4 gives ψ(𝔭²) = 4·(5/4)·… = 20; a split 𝔭𝔭̄ of norm 9 gives φ = 4 against the single-prime value 8); renumber 1.7–1.13 as 1.6–1.12 or restore a 1.6.

## R05 (P3) — No `sources.toml`

**Location:** `TauCetiRoadmap/QuaternionArithmetic/` (README.md, Suggested.lean, metadata.toml only).

**Claim:** The folder records no manifest; the eleven LMFDB knowls and five paywalled or landing-page-only references (Vignéras, Eichler 1955, Pizer 1980, Shimizu, Alsina–Bayer) have no recorded `uncertified`/`waived` status, so every review re-attempts them.

**Witness:** This round's fetch attempts, all recorded in the job's `needs-references.toml`.

**Repair:** Add `sources.toml` (schema `tauceti-roadmap-sources/v1`) with one key per work: `voight` (author edition v0.9.28, `locator_scheme = "theorem"`), `rotger` (author page), `dembele_voight` (arXiv 1010.5727v2), `pizer1976` (institutional), and the paywalled works as `uncertified` with their DOIs; the LMFDB knowls as `uncertified` with their identifiers.

## Verified sound

**Previous findings, checked first against this head.** All nine are repaired except the manifest part of R09.

| Previous finding | Passage in this head | Assessment and witness |
| --- | --- | --- |
| R01 identity fixed points | §8.6: “Assume m ∥ DN and m > 1 throughout this subsection” | Repaired. m = 1 has its own Check (whole curve, degree 1, genus 0); m = 2, 3, 6 give 2, 2, 2 and quotient genus 0. The trace enumeration now rests on m ∣ t with t² < 4m, which forces t = 0 or m ∈ {2,3}, t = ±m. |
| R02 stabilizer image | §9.1: “stabilizer of an embedding class e being the image Wₑ of Autμₑ(O) in W” | Repaired. D = 21, δ = 21: Aut_μ = {1,[i′]} with i′ ∈ Oˣ, #Wₑ = 1, four classes, 4·1/4 = 1 orbit; D = 6, δ = 1: #Wₑ = 2, 2·2/4 = 1. |
| R03 enhanced Galois interpretation | Contracts: “Neither supplies the enhanced integral Galois representation. Sections 9.7–9.8 own its comparisons”; §9.7 “Integral torsion comparison”; §9.8 “Endomorphism-field comparison” | Repaired. Both comparisons are owned targets with explicit hypotheses (polarized abelian surface over k, ι : O ≃ End(A_k̄), Rosati b ↦ μ⁻¹ b̄ μ, left O/NO-marking α). I rederived the construction: T = α⁻¹σ⁻¹α is semilinear for conjugation by w_σ ∈ N(O), so T(y) = w⁻¹ y w·x₀ with x₀ = T(1) a unit; Rosati-equivariance gives w⁻¹μw = ±μ; the H-fixed module is α⁻¹(A[N](k)). ASAM A0.1, A3.2, A3.9 exist at the open head and state abelian schemes, finite étale N-torsion where N is invertible, and the Rosati involution. |
| R04 finite residue field | §2.4: “For the numerical formulas assume k = R/𝔭 is finite and put q = #k”; Conventions line 117 | Repaired. The M₂(ℝ[[t]]) Check records the infinite case. Only the λ values are wrong (R01 above). |
| R05 tree and native identities | §1.12 and contracts: “From ReductiveGroupsPartII RG2.2.4, “sl2-tree””; §0.1 consumes the native identities | Repaired (one section number slip in Scope, R02 above). |
| R06 absent headlines | Lean 278 `existsUnique_gorenstein_saturation`; Lean 520 `exists_principal_polarization` | Repaired. Both elaborate; the pair (𝔣, Gor) is unique as in Voight 24.2.15 (`voight line 16649`); μ = i + 3j with μ² = −6 witnesses the second for O₆. |
| R07 level-change fibres | §3.9: “its fibre is Γ_g\U/U′, with Γ_g = (g⁻¹Bˣg) ∩ U” | Repaired. For gu, gu′ in one class: b g u = g u′ v gives g⁻¹bg = u′vu⁻¹ ∈ Γ_g. Hurwitz level 7: 8 cosets, two orbits of 4, fibre 2 = class number. |
| R08 APIs and Checks | §§1.2, 1.3, 1.4, 1.9, 2.4, 3.7 each end with an API list and Checks; “landed” removed; “(checked in Sage)” removed | Repaired; the Worked-examples preamble still names Sage (R04). |
| R09 locators and manifest | §1.11 cites 10.3.2–3, 15.2.2, 15.2.15, 15.4.7 with pages; §4.6 cites 28.6.10, 28.9.17 with pages; §10.2 names the knowls | Partly repaired: locators present, no sources.toml (R05). |

**Gate, pins, build.** The worker's gate at this head reports every counter zero and `OK`, including `build=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`. The worktree is clean at 75c9080a and `git diff --stat origin/main...HEAD` outside the folder is empty. Pins: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, equal to the checked-out package revisions. `lake env lean TauCetiRoadmap/QuaternionArithmetic/Suggested.lean` exits 0 in 5 s with exactly 18 `declaration uses sorry` warnings and no other diagnostic. The file is a `module` with `import Mathlib` and five `TauCeti.*` modules that exist at the pin; no `set_option`, no `lemma`, no `#check`, no sorried data, no admitted `example`.

**Padding probe and signatures.** A scratch copy replacing every `:= sorry` by `first | (simp; done) | rfl | infer_instance | decide | (norm_num; done) | sorry` elaborates with all 18 theorems still reporting `sorry`: none closes in one tactic, none restates a definition or a Check. A second scratch copy with `#check @name` for all 66 declarations elaborates without error; I compared each type with the README. The eighteen theorems carry every hypothesis their README statement needs: `IsEichler.isBass`, `existsUnique_gorenstein_saturation` and `finite_classSet` carry `[CharZero F]`; the rational theorems carry `IsEichler`/`IsMax` and `¬IsDefinite` or `IsDefinite` as stated; `card_autPmMu` carries division, indefiniteness, polarization and normalization. The 25 “dropped binder” leads are all definitions (`QuatOrder`, `units`, `discrd`, …) whose types do not mention the dropped classes; this is the intended behaviour and no theorem is affected. `IsEichler.isBass` is true at the wider Lean generality as well: in characteristic 2 Mathlib's `ℍ[F,a,b]` is commutative with trd ≡ 0, orders have no maximal elements (adjoining nilpotents divided by powers of a uniformizer), so `IsEichler` is empty and the statement vacuous; in odd characteristic Voight's theory applies.

**Dependency check.** Run as instructed with `--movable`:

```text
depcheck: 204 roadmaps, 1615 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. QuaternionArithmetic sits at line 265 of the merge order, after TeichmullerGeometry (264) and after every *Needs:* supplier (AdelicAlgebraicGroups 30, AbelianSchemesAndArithmeticModuli 40, GeometryOfNumbersAndQuadraticArithmetic 65, GL2AutomorphicRepresentationsAndTransfer 85, EndoscopicTransferAndUnitaryTraceComparison 133, HilbertModularVarietiesAndShimuraCurves 144); QuaternionicModularForms is not in the order yet and is read at its open head. GrossZagierAndArithmeticHeights (319) is cited only in §6.1 prose with no edge (R04).

**Seeded source sample.** Voight read in the cited author edition v0.9.28 (`voight` = sources cache `ad6bd0f7…`, 37471 lines; printed page = PDF page − 26 in the ranges below).

| Target | Locator inspected | Outcome |
| --- | --- | --- |
| 1.8 maximality | 15.5.5, `voight line 10706`, printed p. 239 | R a global ring (includes 𝓞_F); O maximal iff discrd O = disc B. Matches the README and `isMax_iff_discrdNat_eq`. |
| 1.10 level, genus | 23.4.19, `line 16209`, p. 375; 28.5.16, `line 20350`, p. 493 | 𝔐 coprime to 𝔇, (𝔇,𝔐) determines the genus; Eichler orders are locally norm-maximal (Exercise 23.3 in the source, consumed here as a target). Matches. |
| 2.2 Gorenstein | 24.2.1, 24.2.3, 24.2.5, 24.2.10, `lines 16513–16580`, pp. 383–384 | Codifferent invertible; sated ideals invertible; nrd(codiff)·discrd ⊆ R with equality iff Gorenstein; primitivity. Matches. |
| 2.3 saturation | 24.2.15, `line 16649`, p. 385; 24.2.22, `line 16705`, p. 387; 24.1.4, `line 16489`, p. 382 | Unique pair (𝔣, Gor) with 𝔣 = discrd·nrd(O^♯); isomorphism iff same conductor and isomorphic saturations; f ≥ 1 over ℤ. Matches the README and the Lean `∃!`. |
| 2.4 symbol, counts | 24.3.1–24.3.2, `lines 16744–16760`, p. 388; 24.3.12, `line 16895`, p. 390; 24.3.13, `line 16912`, p. 391; 25.3.19, `line 17773`, p. 445 | Symbol cases and the four counts q(q−1)²(q+1), q²(q−1)², q²(q²−1), q³(q−1) match; λ values match the Conventions row and refute the §2.4 Checks (R01). |
| 4.7 cancellation | ClassicalArithmeticCompletion §7.98 (README line 16744 on main) | Stably free locally free lattices are free under Eichler's condition; rank-one case identified with 4.1. Matches. |
| 5.2 rational mass | 25.1.1, `line 17355`, p. 429; 25.3.18, `line 17730`, p. 445; 25.3.19 | φ(D)/12, φ(D)ψ(M)/12 with w_J = #O_L(J)ˣ/{±1}; general N/12·∏λ. Matches `eichler_mass_formula` (2/#Oˣ = 1/w). |
| 5.6 worked masses | 25.1.1 evaluated; 25.4.1, `line 17783` | φ(D)/12 = 1/12, 1/6, 1/3, 1/2, 5/6, 1, 3 for D = 2, 3, 5, 7, 11, 13, 37; level 3 in D = 2: 1/3. Matches. |
| 6.2 local numbers | 30.5.3, `line 23340`, p. 540; 30.5.5, `line 23410`, p. 541 | Split count 1; division: 1 at the normalizer, 1 − (K|𝔭) at Oˣ, empty for non-maximal S; 30.5.5 is local finiteness (R03). |
| 6.4 trace formula | 30.4.7, `line 23199`, p. 536; (30.7.2), `line 23742`; 30.7.3, `line 23747`, p. 547; 30.7.5, `line 23763`, p. 548; 30.4.18, `line 23264`, p. 538 | Σ_{Cls} m(S,O_L(I);O_L(I)ˣ) = h(S)·m(Ŝ,Ô;Ôˣ), finite local product, squarefree-level evaluation, existence corollary. Matches; the locator 30.7.4 should be 30.7.5 (R03). |
| 7.1 Brandt definition | (41.2.3), 41.2.4, 41.2.5–(41.2.6), 41.2.7, `lines 32045–32086`, pp. 751–752; 41.2.12, `line 32118`, p. 753 | T(𝔫)_{ij} counts J ⊆ I_j of norm 𝔫·nrd I_j in class [I_i]; element count with 1/w_i; adjacency matrix of the Brandt graph. The source's “matrix of T(𝔫) is the Brandt matrix” uses right action on row vectors (stated in the proof of 41.4.3, `line 32327`), which is the README's transpose on column functions. Matches. |
| 7.2 column sums | 41.3.1, `line 32152`, p. 754; 41.3.6, `line 32196`, p. 755 | Constant column sums Σ_{𝔡|𝔫}N𝔡 for 𝔫 coprime to 𝔑; coprime multiplicativity; T(𝔭ʳ)T(𝔭ˢ) recurrence with P(𝔭). Matches. |
| 7.3 Hecke algebra | 41.3.15, `line 32262`, p. 756; 41.4.3, `line 32321`, p. 758; 41.4.10, `line 32365`, p. 759 | Commutativity; T(𝔫)* = P(𝔫⁻¹)T(𝔫), normality, self-adjointness for 𝔫 narrowly principal; semisimplicity with real eigenvalues. Matches. |
| 7.4 Eichler trace formula | 41.5.2, `line 32386`, p. 759; 41.5.8 and (41.5.10), `lines 32435–32450`, p. 761; 41.1.13, `line 32006`, p. 751 | The triple sum with w_S = [Sˣ:Rˣ] and the mass term for 𝔫 = c²R; the rational conductor sum over all orders S ⊇ ℤ[γ]. Hurwitz n = 3 gives 4 and n = 9 gives 13 by the conductor sum; 41.1.13's shorthand gives 10 (Source issues). Matches the README. |
| 8.8 canonical models | HilbertModularVarietiesAndShimuraCurves R18.1.3 (open head, README line 1626) | Complex points G_B(ℚ)\(ℍ^± × G_B(𝔸_f)/U), proper for B division, split case nonproper. Matches the README's component description; nothing about fields of definition is claimed here. |

Further locators opened: 17.5.6 (`line 12095`, p. 277) for the (8/π²)·discrd bound; 28.6.10 (`line 20475`, p. 477) for the norm −1 unit; 28.9.17 (`line 20829`, p. 486); 30.1.5 (`line 22961`, p. 531); 30.9.2 (`line 23976`, p. 551); 43.6.4–43.6.7 (`lines 34051–34077`, pp. 801–802: polarization μ ∈ O with μ² < 0, principal μ² + D = 0, isomorphism by N_{Bˣ}(O), existence via 14.6.7 and 28.2.11, μ ∈ D·O^♯); 39.2.6, 39.2.14, (39.3.4) (`lines 30733–30821`, pp. 720–722: vol(Ô¹)⁻¹ = |d_F|^{3/2}ζ_F(2)φ(𝔇), v(SO(2)) = π) for §8.2's route; 26.6.4–26.6.7 (`lines 18700–18733`, pp. 433–434) for §5.4.

**Pinned libraries.** Every Tau Ceti name in the supplier contracts resolves at the pin: `normForm` (NormForm.lean:78), `normForm_apply`:84, `normForm_coe`:120, `normForm_mul`:130, `isUnit_iff_normForm_isUnit`:146, `anisotropic_normForm_iff`:158, `pureNormForm`:175; `nonempty_algEquiv_matrix_tfae` (SplittingCriterion.lean:156), `forall_isUnit_or_nonempty_algEquiv_matrix`:223; `oneEquivMatrix` (Split.lean:121), `aNegAEquivMatrix`:219; `rescaleJEquiv` (SymbolEquiv.lean:226), `normMulEquiv`:426; `steinbergEquivMatrix` (Steinberg.lean:126); `reducedTrace_eq_of_algEquiv` (AlgEquiv.lean:93), `map_star_of_algEquiv`:106, `normForm_eq_of_algEquiv`:114, `equivalent_weightedSumSquares_of_algEquiv`:178, each with `IsRegular (2 : R)`; `baseChangeTwoParams` (BaseChange.lean:142); `quaternionClass` (BrauerClass.lean:94); `hilbertSymbol_congr_sq` (HilbertSymbol/Basic.lean:146), `hilbertSymbol_eq_one_iff_nonempty_algEquiv_matrix`:201, `hilbertSymbol_comm`:228; `hilbertSymbol_real` (Archimedean.lean:59); `unitAtFinitePlace` (Localization.lean:41), `unitAtRealPlace`:65; `hilbertSymbol_unitAtFinitePlace_eq_one` (Global/HilbertSymbol.lean:94), `hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace`:120; `quaternionSubgroupSignEquiv` (Subgroup.lean:114); `quaternionSubgroup_eq_twoTorsion` (Invariant.lean:67), `invMap_brauerGroupEquivBr_quaternionClass_eq_half_iff`:79; `finiteInvAt` (LocalInvariant.lean:113), `infiniteInvAt`:75; `brauerGroupEquivBr` (Brauer/CentralSimple/Basic.lean:66); `NumberFieldOrder` (Orders/Basic.lean:59), `maximalNumberFieldOrder`:228; `instMulActionPSL2` (PSL/Action.lean:132); `IsCofinite` (Fuchsian/Covolume.lean:114); the `SkolemNoether`, `CoarseQuotient`, `Compactification/{Basic,Manifold}`, `Elliptic`, `Stabilizer` and `RiemannSurface/Degree` modules exist. Mathlib: `riemannZeta_two` (HurwitzZetaValues.lean:226), `Nat.primesBelow` (PrimeCounting.lean:129). No genus of a compact Riemann surface exists at the pin (only `PermutationTriple.genus`), so the Shimura genus formulas are rightly named as not statable; the area formula would additionally need the arithmetic subgroup of §8.1 built from a real splitting, which the docstring names.

**Cross-roadmap citations, resolved this round.** ClassicalArithmeticCompletion 7.4 (:14393), 7.20 (:14829), 7.21 (:14867), 7.44 (:15456, `J(B)′ = B×′·(J(B)′ ∩ U(Γ))`), 7.56 (:15757), 7.60 (:15856, finite surjectivity, maximal-order unit norms, ramified real positivity), 7.72 (:16146), 7.77 (:16263), 7.78 (:16313), 7.98 (:16744) on main. QuadraticFormInvariants Layer 2 and 6C with `hilbertSymbol_eq_cohomological`, `hilbertSymbol_productFormula`, `pureNormForm`, `equivalent_weightedSumSquares_of_algEquiv` (:688–1224). GlobalQuadraticForms 4.4, 5.5, 6.1, 6.3 (`####` headings :443, :665, :694, :723; `exists_hilbertSymbol_eq_neg_one_iff_pair` in its Suggested.lean:350). ClassFieldTheory Layers 5, 10, 14 with the five named declarations (:150, :566, :591). FuchsianOrbifolds Layers 0–5 (:193–311); Riemann–Hurwitz is Layer 5 item 3 and the orbifold Euler-characteristic formula Layer 4 item 5 and Layer 5 item 6, as cited. ThetaSeries Layer 7 Hecke–Schoeneberg (:854). Completed/NumberFieldArithmetic Layers 1 and 5; Completed/GlobalNumberFields Layers 1, 2, 4, 6, 11 (:259, :279, :418, :439, :571). ReductiveGroupsPartII *sl2-tree* with `BTTree`, `isTree`, `neighborEquiv` (:3647–3660, in RG2.2.4). AdelicAlgebraicGroups §2.4 (:1886), §3.4 *class-number-finite* `Reduction.finite_classes` (:3186), §4.2 *quaternion-norm-one-strong-approximation* with the displayed product (:4150), §4.4 “Nested-level map on double cosets” and “Finite-index bound for level changes” (:4659, :4683), §4.6 *quaternion-norm-images* (:4971), §5.3 class sets, stabilizers and the volume identity with the Hurwitz benchmark (:5364–5445). HilbertModularVarietiesAndShimuraCurves R18.1.3 (:1626), R18.1.7–8 (:1698, :1721, an auxiliary PEL bridge as the README says), R18.3.1 (:2703), R18.5.17a (:2373). AbelianSchemesAndArithmeticModuli A0.1 (:589), A3.2 (:1442), A3.9 (:1684). QuaternionicModularForms §0.3 with `classSet`, `finite_classSet`, `DefiniteQuaternion.finite_stab` (:268–300) and §3.1 (:793). GL2AutomorphicRepresentationsAndTransfer R17.1.5 with `RamifiedExactlyAt`, `existsQuaternionRamification_iff`, `quaternionAlgEquivOfLocalSplitting` (:1428–1442), R17.3.1, R17.3.3, R17.3.9 (:1579, :1610, :1660). EndoscopicTransferAndUnitaryTraceComparison §6.2 τ(S) = 1 for simply connected semisimple S (:2098). TeichmullerGeometry §9.1 at its open head (:690). GrossZagierAndArithmeticHeights §0a.3 `cmOptimalEmbedding` (:206). FiniteGroupInvariants 7.1 (:821), AbelianVarietiesOverFiniteFields 8.4 (:1406), GeometryOfNumbersAndQuadraticArithmetic §2.8 (:743), §3.3 (:1041), CanonicalModelsAndGonality: scope mentions only. The eleven scanner leads are the two supplier targets `finite_stab`, `finite_classes`, the declared `IsEichler.isBass`, `BTTree.isTree` at RG2.2.4, and seven knowl identifiers.

**Ownership against open work.** `roadmaps grep` over the 439 open heads and main for Brandt matrices, Eichler orders, polarized orders, Aut_{±μ}, Gorenstein saturation, the Hurwitz order, the Eichler mass formula and X₀(D;N): every other hit is a consumer or neighbour (HilbertModularForms #1724 uses Brandt matrices and Eichler orders as inputs; GrossZagier #1487, ComplexMultiplication #1254, HeegnerPointEulerSystems #1423 use Eichler orders of M₂(ℚ); AdelicAlgebraicGroups #792 and GeometryOfNumbers #851 cite the Hurwitz order as a benchmark; EulerSystems #1272 and AVFF #1720 use Gorenstein in commutative settings). No open pull request builds quaternion-order arithmetic, class sets, Brandt matrices or polarized orders, and no `Suggested.lean` elsewhere declares a `TauCetiRoadmap.QuaternionArithmetic.*` name. Open pull requests without files were not searched.

**Headline inventory.** README end theorems: maximality criterion (1.8), Gorenstein saturation (2.3), Eichler orders are Bass (2.5), finiteness of class sets (3.5), Eichler's class-number-one, conjugacy and norm −1 theorems (4.3–4.4), the normalizer index (4.5), the mass formula and class number one (5.2, 5.5), the embedding-number formulas and class number formula (6.5–6.6), Deuring's type number (6.8), principal polarization existence (9.1) and the polarized-automorphism classification (9.2): all eighteen are stated. Not statable at the pins and named in the docstring: the Clifford correspondence, the general mass formula, the trace formula, Brandt multiplicativity and the theta comparison, the Shimura area and genus formulas, the enhanced-curve genus and torsion comparisons. The parity statement of §0.5 (definite iff D has an odd number of prime factors) would be statable with the existing definitions; it is a one-line consequence of the consumed product formula rather than a headline, so its absence is not a finding.

**Adversarial computations.** One row per sampled target, headline and changed passage; values computed by hand or with a short script (class numbers by counting reduced forms; Kronecker symbols by the dyadic rule).

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| 0.1 Gram matrix | (3,−1), (−1,−1), (1,1) | diag(2,6,−2,6) det −144 = −16·9; diag(2,−2,−2,−2) det −16; (1,1) det −16 though split; nrd(i)nrd(j) = −3 = nrd(ij) | Retain. |
| 0.4–0.5 D and definiteness | (−1,−1), (3,−1), (1,7), (−1,−13) | D = 2, 6, 1, 2; real symbols −1, +1, +1, −1; (−1|13) = 1 so 13 ∤ D; `ramificationBound` 2, 6, 14, 26 contains every ramified prime | Retain; `discNat` runs over primes below bound+1. |
| 1.2 units | Hurwitz; O₆; scalar 2 | 24 units all of norm 1, Oˣ/O¹ = 1; nrd(1+i+j) = 1 − 3 + 1 = −1 with inverse −1+i+j, Oˣ/O¹ = 2; nrd 2 = 4, 1/2 ∉ O | Retain. |
| 1.3–1.5 discriminants | L, 2L, M₂(ℤ), L ⊂ H | trace dets −16, −4096, −1; reduced (4), (64), (1); cubic (4), (32), (1); scalar ideal (2) for 2L, (2)(32) = (64); [H:L] = 2, 4 = 2·2 | Retain. |
| 1.4 trace dual | L, 2L, M₂(ℤ) | L^♯ = (1/2)L (16 classes); (2L)^♯ = (1/4)L, dual again 2L; E₁₂ and E₂₁ dual, M₂(ℤ) self-dual | Retain. |
| 1.8 maximality | H, L, O₆, ℤ+2O₆ | discrd 2, 4, 6, 48 against D = 2, 2, 6, 6 | Both directions agree. |
| 1.9–1.10 Eichler, level | O₀(2ᵉ), e = 0, 1, 2; ramified 2 | discrd (1), (2), (4); ψ = 1, 3, 6; normalizer quotient 1, 2, 2; division maximal has level 1 | Retain; `psi 0 = 1` is the empty product. |
| 1.11 bases and index | H/L; ℤ+2O₆ | indices 2, 8; 4 = 2·2, 48 = 8·6 = 2³·6 | Retain. |
| 1.12 tree adapter | ℤ₂², ℤ₂⊕2ℤ₂, ℤ₂⊕4ℤ₂ | distances 0, 1, 2; levels 1, 2, 4; q+1 = 3 neighbours | Retain; the tree is RG2.2.4's. |
| 2.2 Gorenstein | M₂(ℤ), L, ℤ+2O₆ | nrd(codiff)·discrd = (1)(1), (1/4)(4) = (1), (2) | Retain. |
| 2.3 saturation (headline) | O₆, ℤ+2O₆, L | (Gor, 𝔣) = (O₆, (1)), (O₆, (2)), (L, (1)); discrd 6, 48, 4; 𝔣 = ⊥ impossible since R + ⊥·G = R is not a lattice | Retain the Lean `∃!`. |
| 2.4 symbol, counts, λ | q = 2, 3 | counts 6, 4, 12, 8 and 48, 36, 72, 54 agree with 24.3.12; λ must be 3/2, 1/2, 3/4 and 4/3, 2/3, 8/9 in the order 1, −1, 0 | R01: the Checks swap −1 and 0. |
| 2.5 Bass | L, O₀(4), ℤ+2O₆ | L ⊂ H only; O₀(4) Eichler hence Bass with level 4; conductor 2 fails | Retain. |
| 2.7 worked orders | O₆ at 2, 3, 5 | residue 𝔽₄, 𝔽₉, M₂(𝔽₅); counts 12, 72, 480 | Retain. |
| 3.1–3.2 class set | 2O₀(2); M₂(ℤ) over O₀(2); D = 11, 37 | index 16 = 4²; M₂(ℤ) has right order M₂(ℤ) ≠ O₀(2); (h,t) = (2,2), (3,2) | Retain. |
| 3.5 finiteness (headline) | Hurwitz | integral representative of norm 1 ≤ (8/π²)·2 ≈ 1.62 | Retain. |
| 3.6 Pic | M₂(ℤ[√−5]); O₀(4) | Pic = Cl R of order 2, Idl(O)/Idl(R) = 1; w = [[0,1],[4,0]], det −4, w² = 4I | Retain. |
| 3.7 Atkin–Lehner | O₆; O₀(4); Lipschitz | 4 elements, w₂w₃ = w₆; Hall divisors 1, 4; h = (1+i+j+k)/2 permutes i→j→k, normalizes L, h³ = −1, h ∉ ℚˣLˣ, so Lh has order 3 | Retain; the Eichler hypothesis is necessary. |
| 3.9 fibres | H ⊃ level-7 order; O′ = O | 8 cosets, Hˣ/±1 ≅ A₄ acting, orbits 4+4, fibre 2 = class number of mass 2/3; fibre 1 at O′ = O | Retain. |
| 3.10 norm counts | Hurwitz norms 3, 5, 15, 9, 2, 4 | 4, 6, 24, 13, 1, 1 | Retain. |
| 4.3–4.5 (headlines) | O₆; M₂(ℤ); D = 1 split | h = t = 1; diag(−1,1) has norm −1; AL order 4 = 2^{ω(6)}, 1 = 2⁰ for M₂(ℤ) | Retain; split case consistent. |
| 4.6 positive normalizer | O₆; M₂(ℤ) | quotient 4; quotient 1 with diag(−1,1) in the other coset | Retain. |
| 5.1–5.2 mass (headline) | D = 2, 3, 11, 37; (2,3), (2,7) | 1/12, 1/6, 5/6, 3; 1/3; 2/3; weights 2/#Oˣ = 1/w | Retain. |
| 5.4 level change | L₂ ⊂ H₂; O₀(p) ⊂ M₂ | 2·(3/4)·2 = 3 = 12/4; p(1+1/p) = p+1 | Retain with λ(symbol 0) = 1 − 1/q². |
| 5.5 class number one (headline) | D = 2, 3, 5, 7, 13 vs 11, 37, 17, 23 | h = 1, 1, 1, 1, 1; 2, 3, 2, 3 | Retain. |
| 6.1 optimal embeddings | O₆, ℤ[i]; ℤ[2i] | Oˣ count 2, O¹ count 4 ([nrd Oˣ : 1] = 2); ℤ[2i] not maximal at 2 gives 0 | Retain. |
| 6.3 local Eichler | p = 3 levels; ℤ₂[i] at 2, 4 | 0, 2; 1+0 = 1, 0+0 = 0 | Retain. |
| 6.5 Kronecker products (headlines) | (6,1), (2,3), (15,4), 2 ∥ M, 3 ∥ M | (2,2); (0,2); 0 at 4 | M; x²+1 mod 2 has one root and none mod 4 giving 1 = 1 + 0; x²+x+1 mod 3 has one root and none mod 9 giving 1 = 1 + 0 | Retain. |
| 6.6 class number formula (headline) | D = 2, 11, 37, 17, 23; (2,3) | 1/12+1/4+2/3 = 1; 5/6+1/2+2/3 = 2; 3; 4/3+0+2/3 = 2; 11/6+1/2+2/3 = 3; 1/3+0+2/3 = 1 | Retain. |
| 6.8 Deuring (headline) | p = 5, 7, 11, 13, 17, 23, 37 | 1/2+0+1 = 1 with h(−20) = 2; 1/2+1/4+1/4 = 1; 1+1/4+3/4 = 2; 1/2+0+1/2 = 1; 1+0+1 = 2; 3/2+3/4+3/4 = 3; 3/2+0+1/2 = 2 | Retain; the Lean binders fix L = ℚ(√−p) by discriminant. |
| 7.1–7.2 Brandt | D = 11 | T(2)T(3) = [[8,6],[4,6]] = T(6), column sums 12 = σ(6); row sums 4, 2 not constant | Retain column convention. |
| 7.4 trace formula | Hurwitz n = 3, 9 | 1/3+2+1+2/3 = 4; 5/4+4+1+8/3+2+2+1/12 = 13; shorthand 1/4+4+1+2/3+2+2+1/12 = 10 | Retain; source issue below. |
| 7.7 theta | Hurwitz; D = 11 | 24/24 = 1 = T(1); 96/24 = 4 = T(3); constant terms 1/4, 1/6 | Retain. |
| 8.2 area | D = 6, 6·5, 6·101 | (π/3)·2 = 2π/3; ×ψ(5) = 6 gives 4π; area/4π = 1, 1, 17; (2/π)(π²/6)φ(D) = (π/3)φ(D) | Retain. |
| 8.3–8.4 genus | D = 6, 10, 14, 15, 21, 22, 26, 33, 34, 35, 38, 39; (6,5), (6,7), (6,11), (6,13), (6,25), (15,4), (6,101) | (ν₂,ν₃,g) = (2,2,0), (0,4,0), (2,0,1), (0,2,1), (4,0,1), (2,4,0), (0,0,2), (4,2,1), (0,4,1), (0,0,3), (2,0,2), (0,0,3); (4,0,1), (0,4,1), (0,0,3), (4,4,1), (4,0,5), (0,0,5), (4,0,17) | All agree with the README's table and §§9.9, 10.3. |
| 8.6 fixed points | D = 6, m = 1, 2, 3, 6; m ∣ t | m = 1 excluded; 2, 2, 2; quotient genera 0; m ∣ t with t² < 4m forces t = 0 or m ∈ {2,3}, t = ±m | Retain (R01 of the previous round repaired). |
| 9.1 polarizations (headline) | μ = i+3j; 2μ; D = 21, δ = 21; D = 6, δ = 2, 6 | μ² = −6, trd pairs (0,6,−6,0), degree 1; 24/6 = 4 square; orbit count 4·1/4 = 1; nrd 3 and 1 give degrees 2, 6 | Retain; `exists_principal_polarization` holds for M₂(ℤ) with μ = [[0,1],[−1,0]]. |
| 9.1 degree-δ existence | D = 6, M = 13, δ = 13; D = 35, M = 2, δ = 2 | K = ℚ(√−6) inert at 13: S = ℤ[13√−6] has f = 2 > e = 1, count 2; ℤ[2√−35] at 2: #M(1) + #img = 1 + 1 = 2 | The integral choice μ² = −δDM is always possible. |
| 9.2 Aut_{±μ} (headlines) | i+4j; M₂(ℤ), μ² = −23; k against i+3j; D = 14 | μ² = −13, pairs (0,6,−8,−1), v₁₃(13) odd; split stabilizer 1 (excluded by division hypothesis); kμ = −μk, nrd k = −3; (−14,m) not of discriminant 14 for m ∈ {2,7,14} so untwisted | Retain both cardinality sets. |
| 9.3 twisting across the table | D = 6, 10, 15, 22, 26, 35, 38 vs 14, 21, 33, 34, 39 | Hilbert symbols: (−D, m) has discriminant D for some m ∥ D exactly in the first group | Consistent with the stored AutmuO_size column; the stored μ itself is uncertified. |
| 9.4 kernel and image | O₆, 2+i | nrd(2+i) = 4 − 3 = 1; (2−i)(i+3j)(2+i) = i + 21j − 12k of norm −3+441−432 = 6 | Retain. |
| 9.6 enhanced genus | (6,101) | g = 17; fixed counts 4, 0, 4, 0, 12, 0, 12 with h(−808) = 6, h(−2424) = 12; 32 = 8·0 + 32, quotient genus 1 | Retain. |
| 9.7 torsion | O₀(2)/2O₀(2); M₂(𝔽₂); N = 1 | units 1 + bE₁₂ + c·2E₂₁; annihilator span(E₁₂, 2E₂₁) of order 4; split annihilator 0; zero module | Retain; the comparison hypotheses make it A(k)[2]. |
| 9.8 content | D = 6 degree 1 | norm square classes {1, 6, −2, −3} from μ (6), χ (−2 or −3), χμ | Retain. |
| Worked class counts c | D = 6…39 | h(−24)=2, h(−40)=2, h(−56)=4, h(−60)=h(−15)=2, h(−84)=4, h(−88)=2, h(−104)=6, h(−132)=4, h(−136)=4, h(−140)=6, h(−35)=2, h(−152)=6, h(−156)=h(−39)=4; c = 1,1,2,2,2,1,3,2,2,4,3,4 as printed | Retain. |

## Not verifiable

- The eleven LMFDB knowls of §10.2 and the References (`shimcurve`, `shimcurve.polarized_order`, `…aut_pm_mu_o`, `…enhanced_group`, `…level`, `…index`, `…is_coarse`, `…nrdmu`, `…disco`, `…eichler`, `…label`): the sources service refuses the host (no licence class), as last round. The stored polarizations, bases and the live column schema are therefore uncertified; every number attributed to them above was recomputed from the README's own formulas.
- Vignéras (Springer, DOI 10.1007/BFb0091027) and Pizer 1980 (Elsevier, DOI 10.1016/0021-8693(80)90151-9): paywalled, recorded as uncertified by the service. Eichler 1955 (De Gruyter), Shimizu 1965 (JSTOR) and Alsina–Bayer (AMS): landing pages only. Ogg 1983 has no open copy and was not read. None of these carries a sampled locator; the fixed-point counts attributed to Ogg were checked against Voight 30.7.5 and 39.4.x computations instead.

## Source issues

- **Error** in voight at Theorem 41.1.13, printed p. 751: the source says the modified class number of a non-fundamental discriminant d·f² equals that of d; it should sum the orders of conductor g ∣ f with gcd(g, D) = 1, as (41.5.10) does; affects a stated result (Hurwitz order, n = 9: 10 against the correct 13 = σ(9)).
- **Gap** in voight at 41.2.5, printed p. 752: the source says the matrix of the function operator in the characteristic-function basis is the Brandt matrix; it should say so for matrices acting on row vectors, the convention stated only in the proof of 41.4.3 (p. 758); affects nothing.
