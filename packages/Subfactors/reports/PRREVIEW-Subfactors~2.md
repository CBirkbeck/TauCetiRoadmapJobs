# Review of Subfactors (pull request #874 at dde5aec)

**Verdict:** needs changes

Full re-review of `TauCetiRoadmap/Subfactors/README.md` and `TauCetiRoadmap/Subfactors/Suggested.lean` at head `dde5aec`. The worker's gate passes every check, the dependency check reports no problem, the diff outside the roadmap folder is empty, and `Suggested.lean` elaborates with exactly two `sorry` warnings. The blocking findings are three: two residual section-code citations of a later roadmap, a scope paragraph that excludes a theorem Layer 0 then states, and one false normalisation identity in 3.3.

## Status of the previous review's findings (head 6e29691)

| Previous | Status at dde5aec | Passage |
| --- | --- | --- |
| R01 (P1) supplier cycle through TemperleyLiebOperatorAlgebras | Repaired. The Temperley–Lieb positivity, Jones–Wenzl and path-model material is now owned in Layer 3; TemperleyLiebOperatorAlgebras is no longer a supplier. | README line 44: "It owns the Temperley–Lieb material of Layer 3 because …"; line 71: "TemperleyLieb, TemperleyLiebOperatorAlgebras, GeometricTopology and HilbertModules are not prerequisites of any layer." Dependency check: 0 problems. |
| R02 (P2) upward HilbertModules supplier | Repaired. HilbertModules is dropped as a supplier and listed as a consumer. | README line 70–71. |
| R03 (P2) blanket separable predual | Repaired. | README line 87: "No separable predual is assumed. Separability enters only where it is stated"; the uncountable tensor-product Check at lines 548–550 and in 2.2. |
| R04 (P2) prototype substitutes in the Lean file | Repaired. The file now states two headline theorems on native carriers and lists the non-statable headlines with their missing carriers. | `Suggested.lean` lines 8–40 (docstring), 56–83. |
| R05 (P3) padding declarations | Repaired. All seven deleted; the file declares one `def` and two theorems. | `Suggested.lean`. |
| R06 (P3) jellyfish algorithm deliverable | Repaired. 7.4 keeps spanning, closure and uniqueness statements only. | README line 1431 onward. |
| R07 (P3) README shape | Repaired. Summary, Scope, Conventions, supplier contracts, eleven layers with 42 `*Needs:*` lines, Checks on every definition, Examples and Dependencies on every layer. | README throughout. |
| R08 (P3) sources manifest and Burns locators | Partly repaired. Burns locators corrected (line 1240: Definition 2.2.9 printed p. 34; line 1315: Lemma 2.2.43; reciprocal correction to Theorem 2.2.40 kept at 6.3). No `sources.toml` exists; Jones–Sunder and Evans–Kawahigashi are not recorded as uncertified. See R06 below. | Folder listing: `README.md`, `Suggested.lean`, `metadata.toml`. |
| R09 (P3) Lean form and names | Repaired. `namespace TauCetiRoadmap.Subfactors`, one module docstring, docstrings on every declaration, a Layer 3 section comment; the README names all three declarations (lines 15, 823–826, 855, 968). | `Suggested.lean` lines 46–85. |

## R01 (P2) — Residual citations of VonNeumannAlgebras V11 and V13 are upward

**Location:** `TauCetiRoadmap/Subfactors/README.md:1632` "Prove Popa 4.1.2 (vi)⇒(i) from V13's hypertrace and the bicommutant condition"; line 1645 "using V13's L² matrix perturbation lemmas"; line 1721 "Use V11's extended positive cones for unbounded sums".

**Claim:** Layer 9 and Layer 10 are built from Layer 0 and the named suppliers only (Scope, line 50–52: VonNeumannAlgebras "is not a prerequisite of any layer").

**Witness:** V11 and V13 are sections of VonNeumannAlgebras (its open head: Layer 11 "Weights, Connes invariants, and continuous cores" at `TauCetiRoadmap/VonNeumannAlgebras/README.md:2149`, Layer 13 "Hyperfiniteness and injective classification" at line 2920, hypertraces at line 2998, perturbation lemmas at line 2953). The merge order lists Subfactors at position 174 and VonNeumannAlgebras at 178. The dependency check does not see bare section codes, which is why it reports 0 problems; the three sentences are supplier citations of a later roadmap.

**Repair:** In 10.1 cite 0.6's extended positive part `M̂₊` (it is already defined there) instead of V11. In 9.2 state what the proof uses as targets of this roadmap: the hypertrace characterisation of amenability for a II₁ factor and the L² matrix-unit perturbation lemmas (either in 0.7 with Anantharaman–Popa Chapter 10 and Theorem 11.1.3 as locators, or in 9.2 with Popa Appendix A), each with hypotheses and a `*Needs:*` entry. Tested on the instance: 10.1's three Checks (`Q̂_0⁺ = [0,∞]`, `P_1 = 0`, `Q_1` infinite-dimensional for the coarse bimodule) use only 0.6's definition of `M̂₊`, so the repointing changes no statement.

## R02 (P2) — Layer 0 states Connes's injective classification while the scope excludes it

**Location:** `TauCetiRoadmap/Subfactors/README.md:423–428`: "For a separable II₁ factor M the following are equivalent: M is amenable; M is approximately finite-dimensional; … `M ≅ R` (Anantharaman–Popa, Theorem 11.2.2)" and "every infinite-dimensional subfactor of R is isomorphic to R (… Remark 11.2.3 …)". Scope, line 50–52: "the type classification, Connes's invariants and the injective classification belong to VonNeumannAlgebras, which is not a prerequisite of any layer".

**Claim:** 0.7 "states only what the later layers use" (line 49–50) and the injective classification is not planned here.

**Witness:** `ap` line 8294–8304 proves (1)⇒(2) of Theorem 11.2.2 by Theorem 11.1.3, which is Connes's theorem (amenable implies AFD); `ap` line 8358–8360 derives Remark 11.2.3 from that theorem. So the bullet at line 423 and the subfactor clause at line 426 are the injective classification for II₁ factors, planned here without any route or input, in contradiction with the scope paragraph. No later layer uses either: 4.3 obtains hyperfiniteness of `N_δ ⊆ M_δ` from generation by finite-dimensional algebras, and 9.2 takes hyperfinite M as a hypothesis.

**Repair:** Restrict 0.7 to what is used: R is a II₁ factor with separable predual; a separable II₁ factor generated by an increasing sequence of finite-dimensional unital *-subalgebras is isomorphic to R (the (3)⇔(5) part of Theorem 11.2.2, whose proof at `ap` line 8305 uses Lemma 11.2.1 and not Connes's theorem); corners `pRp ≅ R` proved directly from the generating sequence. Delete "M is amenable" and the subfactor-of-R clause, or, if 9.2's route to strong amenability needs amenable ⇒ AFD, state Connes's theorem as a Layer 0 target with its proof inputs and correct the scope sentence. Tested: the three Checks of 0.7 (trace 1/2 at every level, `pRp` for trace 1/3, `L(F₂)` not amenable) survive the restricted statement; the third Check then reads "not generated by finite-dimensional algebras".

## R03 (P2) — The Markov formula in 3.3 is false for the trace it names

**Location:** `TauCetiRoadmap/Subfactors/README.md:893–895`: "They satisfy the Markov formula `τ_(n+1)(ι_n(x) p_n) = δ⁻² τ_n(x)`, where `p_n = δ⁻¹ U_n`."

**Claim:** The identity holds for the trace `τ_n` of 3.3, which is defined at line 882–884 with `τ_n(1) = δⁿ` and `τ_n ∘ π_n = T_n`.

**Witness:** Take n = 1 and x = 1. Left side: `τ_2(p_1) = δ⁻¹ T_2(U_1) = δ⁻¹·δ = 1` (`markovTrace_strandIncl_mul_e_last` with x = 1 gives `T_2(U_1) = T_1(1) = δ`). Right side: `δ⁻² τ_1(1) = δ⁻²·δ = δ⁻¹`. They differ for every δ ≠ 1. The factor δ⁻² is the normalised-trace Markov factor (`tr_(n+1)(x e_n) = δ⁻² tr_n(x)`, as 7.2 states correctly at line 1380).

**Repair:** Write `τ_(n+1)(ι_n(x) p_n) = δ⁻¹ τ_n(x)`, or state the formula for the normalised trace `tr_n = δ⁻ⁿ τ_n`, where `tr_2(p_1) = δ⁻² = δ⁻² tr_1(1)`. Tested on n = 1, x = 1 and on n = 2, x = U_1: `τ_3(ι(U_1) p_2) = δ⁻¹ T_2(U_1) = 1 = δ⁻¹ τ_2(U_1)`.

## R04 (P3) — Two graph-weight Checks compute the wrong value

**Location:** `TauCetiRoadmap/Subfactors/README.md:1352`: "For `A_3` with `μ = (1, √2, 1)`, the weight from an end vertex to the middle is `√2`"; line 1554: "The unrescaled reciprocal map has squared norm `μ(w)/μ(v)`. For `A_3` this is 2 from the end vertex to the middle."

**Claim:** The values follow from the stated formulas `√(μ(w)/μ(v))` (line 1341) and `μ(w)/μ(v)` (line 1554).

**Witness:** With μ(end) = 1 and μ(middle) = √2, `√(μ(w)/μ(v)) = √(√2) = 2^(1/4) ≈ 1.19`, not √2, and `μ(w)/μ(v) = √2`, not 2. The Perron–Frobenius vector of `A_3` is (1, √2, 1), as 7.2's Check at line 1391 uses (`δ·μ(middle) = 2 = 1 + 1`); the weights (1, 2, 1) that would give the printed values are not an eigenvector. Jones–Penneys's convention is `k_e = √(λ(conv(e))/λ(conc(e)))` (`jp` line 1234–1238).

**Repair:** Replace √2 by `2^(1/4)` at line 1352 and 2 by √2 at line 1554. Tested: the loop value at the end vertex is then `Σ_w μ(w)/μ(v) = √2 = δ`, as `jp` line 1261 requires.

## R05 (P3) — Locators: Kosaki §3.3 for the bimodule category; missing locators in 2.2; the crossed-product convention in 0.4

**Location:** `TauCetiRoadmap/Subfactors/README.md:619` "Prove the following (Kosaki, §3.3): the conjugate equations …, the statistical dimension `d(X)` …"; lines 567–568 (relative-commutant bound and local-index formula, no locator); line 326 (crossed product properties cited to Anantharaman–Popa §5.2).

**Witness:** `kosaki` line 1461–1550 is §3.3 "Minimal Expectation": it constructs `E_0` from the corner indices and contains no conjugate equations, standard solutions or statistical dimension; statistical dimension first appears in §6 (`kosaki` line 3173, multiplicativity at Theorem 6.8, line 3429), for sectors of properly infinite factors. The local-index formula is Anantharaman–Popa Exercise 9.16 (`ap` line 7039–7044) and is uncited; `dim(N′ ∩ M) ≤ [M:N]` is uncited. Anantharaman–Popa's crossed product acts on `L²(B,τ) ⊗ ℓ²(G)` by `(b u_g)(ξ ⊗ δ_h) = b σ_g(ξ) ⊗ δ_gh` (`ap` line 3044) and §5.2 assumes a trace-preserving action, while 0.4 defines the crossed product for an arbitrary `B ⊆ B(H)` with `π_σ(b)(ξ ⊗ δ_h) = σ_(h⁻¹)(b)ξ ⊗ δ_h`.

**Repair:** For 2.4 cite the primary source of the conjugate equations and the dimension function in the bimodule setting (Longo–Roberts, *A theory of dimension*, K-Theory 11 (1997), arXiv funct-an/9604008, §§2–3) and Kosaki §6 for the sector version; for 2.2 add Anantharaman–Popa Exercise 9.16 and Jones, *Index for subfactors*, Invent. Math. 72 (1983), for the bound; for 0.4 either restrict the definition to the tracial case Anantharaman–Popa proves (the only case Layer 10 uses) or cite Takesaki for the general one, and say that the two conventions are unitarily equivalent. Tested: the 0.4 covariance Check computes identically in both conventions (`σ_(h⁻¹g)(b)ξ ⊗ δ_h` on both sides).

## R06 (P3) — No sources manifest; two books cited without the uncertified mark

**Location:** `TauCetiRoadmap/Subfactors/` (no `sources.toml`); README lines 1822–1824 (Jones–Sunder) and 1878–1879 (Evans–Kawahigashi).

**Witness:** The folder has three files. Popa is marked "Behind a paywall; cited by locator" (line 1857–1858); Jones–Sunder (Cambridge, doi 10.1017/CBO9780511566219) and Evans–Kawahigashi (OUP) are equally unreadable from legal sources and carry no such mark. Re-raised from the previous review's R08, which this head repairs only for the Burns locators.

**Repair:** Add `sources.toml` (schema `tauceti-roadmap-sources/v1`) with one entry per cited work: the arXiv versions read (Burns v1, Penneys v1, JSW v1, Jones–Penneys v1, GJS, CHPS, Bigelow–Penneys, Jones), the Numdam text of Pimsner–Popa, the author-page texts (Anantharaman–Popa, Penneys UQSL) and the institutional copy of Kosaki with their licence classes, and `uncertified` for Popa, Jones–Sunder, Evans–Kawahigashi and Chen (Doc. Math. is open access, so Chen can be fetched instead). Mark the two books uncertified in the References.

## R07 (P3) — A downstream claim that the consumer does not make

**Location:** `TauCetiRoadmap/Subfactors/README.md:1815`: "HilbertModules compares Layer 1's fusion with the interior C*-module tensor product."

**Witness:** HilbertModules at its open head (`TauCetiRoadmap/HilbertModules/README.md`) does not mention Subfactors or Connes fusion. The other three downstream claims resolve: CategoricalOperatorAlgebras cites Subfactors S1–S2, S5–S9 (its README lines 58, 95, 294, 400), FactorRigidity cites S1–S2 (lines 35, 86, 110, 122), TypeAHeckeAlgebras on main cites S2, S4 and S2a (its README lines 403, 439, 462).

**Repair:** Delete the HilbertModules bullet, or keep it only after HilbertModules states the comparison. The Scope sentence at line 63–64 ("The comparison … belongs to HilbertModules") is a deferral and can stay.

## Verified sound

**Gate, build and form.** The worker's gate at `dde5aec` passes every check (build, metadata, imports, sorry-data, set_option, stray-files, outside-folder, latex, prnum, round-labels, residue, depcheck). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/Subfactors'` is empty. Direct elaboration, `lake env lean` on `TauCetiRoadmap/Subfactors/Suggested.lean` from the worktree root, exits 0 with exactly two `declaration uses sorry` warnings (lines 67 and 82). The file has a single `import Mathlib` and `import TauCeti.Algebra.TemperleyLieb.MarkovTrace`, whose object file was present; no `set_option`, no `lemma`, no `#eval`, no sorry'd data, 92 lines.

**Signature check.** A scratch copy with `#check @jonesLoopParameters`, `#check @markovTrace_nonneg_iff` and `#check @markovTrace_nonneg_iff_lt_floor` elaborated. Every binder of the README statement survives: `0 < δ`, the unit `q` with `↑δ = -(↑q + ↑q⁻¹)`, `[(n : ℕ) → StarRing (TemperleyLieb ℂ ↑δ n)]`, `[∀ n, StarModule ℂ (TemperleyLieb ℂ ↑δ n)]`, the generator-fixing hypothesis, and in the second theorem `δ < 2`, `δ ∉ jonesLoopParameters` and the single-level instances. Nothing changed. The hypothesis `hδ₂ : δ < 2` is implied by `hδ : δ ∉ jonesLoopParameters` (the set contains `[2,∞)`); this is a note, not a finding.

**Padding probe.** On the same scratch copy, each sorried theorem was re-stated and tried with `simp [jonesLoopParameters]`: the first leaves the full goal unsolved, the second makes no progress. Neither restates a definition, mirrors a Check or computes a value. No padding.

**Dependency check.** The prescribed command returned exactly

```text
depcheck: 200 roadmaps, 1310 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. R01 records three prose section codes the check cannot see.

**Headline inventory.** The README's end theorems (lines 12–22): Jones's index restriction via `markovTrace_nonneg_iff`; realisation of every allowed index in R; the Pimsner–Popa entropy formula and equality criteria; planar-algebra reconstruction and Burns's rigid realisation; Popa's finite-depth classification and the ADE list; the extended-cone calculus, Burns rotations and the type III example. At the pins (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`) only Jones's positivity theorem is statable: `TauCeti.TemperleyLieb.markovTrace` (`TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean:452`, `markovTrace_one` at 462 with value `δ ^ n`, `markovTrace_mul_comm` at 468, `markovTrace_strandIncl` at 486, `markovTrace_strandIncl_mul_e_last` at 494), `TauCeti.TemperleyLieb.e` (`Basic.lean:155`), `lift` (196), `lift_e` (209), `hom_ext` (215), `strandIncl` (233), `strandIncl_e` (239), `e_ne_zero_two` (305, needs `[Nontrivial R]`), and `TemperleyLieb` as `RingQuot (TemperleyLieb.Rel R δ n)` (130). Mathlib's `VonNeumannAlgebra` carries no factor, trace, dimension or index; there is no Connes fusion, standard form, planar operad or standard invariant. The module docstring names each absent headline with its missing carrier. The headline stated is the one the README names (line 15) and 3.2 names both declarations; README and Lean agree in generality (real `δ > 0`, every level, conjugate-linear star fixing generators).

**Sources.** Fetched through the sources service: `ap` (author page, Popa's UCLA draft), `kosaki` (institutional copy of the Seoul lecture notes), `penneys-uqsl` (author page, Chapter 4), `burns` (arXiv 1111.1362v1), `pp` (Numdam), `penneys` (arXiv 1110.3504v1), `jsw` (arXiv 0807.4146v1, OCR text), `jp` (arXiv 1007.3173v1). Popa resolved only to a paywalled page (uncertified, as the README says); Jones–Sunder and Evans–Kawahigashi could not be read legally and are listed under Not verifiable. Sampled targets:

| Target | Source and locator | Result |
| --- | --- | --- |
| 0.3 tracial algebras, II₁ factors, uniqueness, L², expectation | `ap` line 312 (Def 1.3.3), 570 (Def 1.3.14), 2734 (Prop 4.1.3: a factor has at most one tracial state), 4228–4233 (Thm 6.3.5: normal tracial state iff 1 finite, unique and faithful), 4465–4467 (Thm 7.1.1), 6391–6394 and 6397–6401 (Thm 9.1.2 with `e_B x̂ = E_B(x)^`) | All six statements match at the stated generality. |
| 0.4 group algebras, tensor products, crossed products | `ap` line 385 (Thm 1.3.6), 447–453 (Prop 1.3.9 ICC), 2957 (Prop 5.1.2), 2988–2992 (Prop 5.1.4), 3033–3061 (§5.2 definition and trace), 3092–3097 (Prop 5.2.3, trace-preserving action) | Match, with the convention and generality gap recorded in R05. |
| 1.2 bounded vectors and fusion | `ap` line 101 and 9382 (Chapter 13, Bimodules, tracial case); `burns` line 388 (Def 2.1.11, Hilbert modules over a von Neumann algebra), 422 (Def 2.1.15, relative tensor product) | The general (weight) construction is Burns §2.1.2; AP covers the tracial case. Matches. |
| 2.2 Pimsner–Popa inequality | `pp` line 566–570 (Theorem 2.2: `[M:N]⁻¹ = max{λ : E_N(x) ≥ λx}`, for a subfactor of a II₁ factor); `kosaki` line 1640–1644 (Theorem 3.8, equality at `e_N`, reciprocal best constant outside type I) | Matches; infinite index gives constant 0. |
| 2.4 bimodule category | `kosaki` line 1461 (§3.3 is the minimal expectation) | Locator wrong: R05. The 2.5 use of §3.3 and Theorem 3.7 (`kosaki` line 1539–1549, including the locally trivial example with `[M:N] = 1/t + 1/(1−t)` and minimal index 4) matches. |
| 3.1 analytic adjoint | pin: `Basic.lean:130` (RingQuot presentation), 305 (`e_ne_zero_two` with `[Nontrivial R]`), 233 (`strandIncl`) | Matches; ℂ is nontrivial. |
| 3.3 path models and quotients | `penneys-uqsl` line 557–613 (Facts 4.4.14 (TB1)–(TB7), printed pp. 154–155: matrix units by loops on `A_(n+1)`, trace `[ς_n + 1]` on minimal idempotents, positivity for d > 0, non-degeneracy iff `[n+1] ≠ 0`), 733 (Def 4.5.1, printed p. 158), 758–778 (Facts 4.5.5, printed p. 159) | Matches, including the page offset (file page 1 is printed 141, `penneys-uqsl` line 29). |
| 3.2 (needed for 3.3) | `penneys-uqsl` line 23–25 (Ex 4.1.2–4.1.3, p. 141), 189–196 (Ex 4.2.6 with the Markov property, p. 146), 211–213 (Ex 4.3.3), 216–219 (Lemma 4.3.4, p. 147), 230–236 (Lemma 4.3.8: `π/k > ω > π/(k+1)`, `[2..k] > 0`, `[k+1] < 0`), 249–263 (Def 4.3.10, recursion with `[n]/[n+1]`), 289–292 (Prop 4.3.14), 357–362 (Ex 4.3.15–4.3.16), 368–379 (Thm 4.3.17, p. 150, necessity by `Tr_k(f^(k)) = [k+1] < 0`) | All match; the Lean docstrings cite the right numbers and pages. |
| 3.4 TL action in the tower | internal (2.3 Markov relation, 3.2 uniqueness); pin `lift_e`, `strandIncl_e` | Matches: `strandIncl_e` sends `e δ i` to `e δ i.castSucc`, so zero-based labels are preserved as the Conventions say. |
| 3.5 index restriction | Jones–Sunder Theorem 2.3.8 | Not readable; see Not verifiable. The theorem's content is what 3.2 + 3.4 prove. |
| 6.3 rigid ↔ spherical | `burns` line 2588–2590 (insert `w^(−Θ(s)/4π)` on each string), 2602–2603 (Thm 2.2.36: `δ_sph = λδ`, `λ = φ(w^(1/2))`), 2693–2698 (Thm 2.2.40 statement `δ = λδ_sph`), 2703–2705 (proof: `δ_rigid = λ⁻¹δ_sph`), 2709–2713 (Remarks 2.2.41, rescaling and inverse constructions) | Matches; the README's reciprocal correction is right (Source issues). |
| 7.1 graph planar algebras | `jp` line 1206–1253 (§3.4: states, extremum weights `√(λ(conv)/λ(conc))`), 1261 (closed strings give d), 1318 (Thm 3.33), 117–140 (§2.1 strongly Markov, Prop 2.2 bases) | Construction matches; the numeric Check does not (R04). |
| 8.1 orthogonal model | `jsw` line 39–42 (`Gr_k = ⊕ P_(n+k)`, inner product), 61–63 (`tr(a) = δ^(−k)⟨a,1⟩`, zero-graded piece), 68–72 (Def 3.1: product `Σ_(i=0)^(min(2m,2n))`), 87–95 (Thm 3.3, `2n+1` maps), 160–165 (Thm 4.9, δ > 1), 242–247 (Thms 4.20–4.21) | Matches. |
| 9.3 ADE list | Evans–Kawahigashi Theorems 11.22–11.24 | Not readable; see Not verifiable. |
| 10.1 extended cones | `penneys` line 653 ("let A be a II₁-factor", no separability), 675 (Def 3.4 symmetric), 967–990 (Thm 3.18), 1144–1151 (Thm 3.28, P acts as weights on `Q̂⁺`) | Matches. |
| 10.2 (adjacent) | `penneys` line 1501–1519 (Thm 4.20), 1523 (Remark 4.21 symmetry), 1569–1570 (Thm 4.28) | Matches. |
| 10.3 type III example | `burns` line 6287–6288 (Thm 3.4.4, Blattner), 6290–6300 (repeated-word map `ϕ = p ∘ φ`, generators `v_n`), 6314 (Lemma 3.4.5), 6331–6348 (Lemma 3.4.6, `e₁ = e₁ ⊗ 1`), 6349–6388 (Lemma 3.4.7 with the fibre argument and the divergent norm), 6389–6405 (Lemma 3.4.8, `ι(ξ) = √2 a(ξ)`, covariance 1/2), 6407 (Thm 3.4.9); printed page 116 at `burns` line 6200, 121 at 6363 | Matches. Burns excludes only the first and last letters of `γ₀` from the fibre; the README excludes every letter, which is stronger and still leaves infinitely many n. The star on `a(ξ)` matches OperatorAlgebraDynamics D8's antilinear generator. |

**Supplier and ownership audit.** Every cross-roadmap citation was resolved at the head the brief names:

| Citation | Resolution |
| --- | --- |
| CStarAlgebras C5 (lines 58, 166, 903, 920, 983) | `TauCetiRoadmap/CStarAlgebras/README.md:546` (pull request #860, same author) "C5. C*-tensor products and operator-space tensor products", inductive limits at line 605. CStarAlgebras is not in `ORDER.txt`; the dependency check accepted the edge (a roadmap not yet in the order is placed after its suppliers). Recorded, not a finding. |
| FreeProbability F3–F4 (lines 59, 169–170, 1560, 1590) | On main: F3 at line 255 with full Fock space at 328; F4 at 353 with tracial amalgamated products at 439. |
| OperatorAlgebraDynamics D8 (lines 61, 172, 1781, 1795, 1804) | On main: D8 at line 554: antilinear `a`, antisymmetric Fock space, quasi-free states, functoriality for isometries. |
| VonNeumannAlgebras (line 51 only, as a non-supplier) | Positions 174 (Subfactors) and 178 (VonNeumannAlgebras). The move of the von Neumann prerequisites down into Layer 0 is recorded here: VonNeumannAlgebras at its open head plans the same objects in Layers 6–8, 10–11 and 13 (`TauCetiRoadmap/VonNeumannAlgebras/README.md:1144, 1262, 1517, 1696, 2149, 2920`) and must consume Layer 0 when it is reviewed; FreeProbability and TypeAHeckeAlgebras on main currently cite VonNeumannAlgebras for tracial L², group algebras and Tomita theory. VonNeumannAlgebras line 1496 explicitly leaves basic constructions, bases and towers to Subfactors. |
| TemperleyLieb (#58, position 219), TemperleyLiebOperatorAlgebras (#867, 204) | Later than Subfactors; the move of the ℂ-only positivity, Jones–Wenzl and path-model material down into Layer 3 is recorded. HopfologicalAlgebra (#222, position 286) mentions only a categorified Jones–Wenzl projector; QuantumGroups on main defers Jones–Wenzl to TemperleyLieb; PivotalSpherical on main mentions subfactors only in a reference. No earlier owner of Connes fusion, Jones index, Pimsner–Popa bases, Ocneanu compactness or planar algebras exists on main or among the readable open heads (`roadmaps grep` over "Jones–Wenzl", "Connes fusion", "Pimsner–Popa", "Tomita", "coupling dimension", "Ocneanu compactness", "planar algebra", "Jones index"). Modular theory on main: OperatorAlgebraDynamics D7 and QuantumGroups consume VonNeumannAlgebras V10–V11 and own none of it. |
| Downstream consumers | CategoricalOperatorAlgebras, FactorRigidity and TypeAHeckeAlgebras resolve (R07 table); the section aliases S1–S10 and S2a (line 177–178, "Section 2.6 on relative entropy is cited as S2a") keep those citations valid. |

No `Suggested.lean` of a readable roadmap declares `TauCetiRoadmap.Subfactors.*`. Ownership against the open pull requests the brief lists without files was not checked.

**Adversarial computations.** I is `R ⊂ R`, A is `R ⊗ 1 ⊂ R ⊗ M₂(ℂ)`, D(t) is the diagonal-corner inclusion with parameter t, giving `([M:N], δ) = (1,1), (4,2), (t⁻¹+(1−t)⁻¹, ·)`.

| Statement / location | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| `markovTrace_nonneg_iff`, Lean 67 | n = 0, 1; δ = 1 (m = 3); δ = 1/2; δ = 2; δ = 3 | `TL_0 = TL_1 = ℂ` (`Fin (n−1)` empty), `T_0(1) = 1`, `T_1(1) = δ > 0`. δ = 1: Gram of `TL_2` on (1, e) is `[[1,1],[1,1]]`, PSD, and 1 ∈ set via m = 3. δ = 1/2: Gram `[[δ², δ],[δ, δ²]]` has determinant `δ²(δ²−1) = −3/16 < 0`, not PSD, and 1/2 ∉ set. δ = 2: `[j] = j`, half-line weights positive. δ = 3: `q = (−3−√5)/2` real negative unit, 3 ≥ 2. | Pass. |
| uniqueness of the star structure, Lean 56–62 | `TL_2`, word `i·e` | Conjugate-linear anti-automorphism fixing generators: `star(i·e) = −i·e`; any two such agree on words and scalars, hence on the algebra (`adjoin_range_e = ⊤`). | Pass; the instance quantification is not vacuous for real δ. |
| `markovTrace_nonneg_iff_lt_floor`, Lean 82 | δ ∈ (0,1): k = 2; δ just below √2: k = 3; δ ∈ (√2, φ): k = 4 | k = 2: n = 1 PSD (`δ > 0`), n = 2 fails (det above). k = 3: n = 2 PSD (`δ² − 1 > 0`), n = 3 fails via `T_3(f_3) = [4] = δ³ − 2δ < 0`. k = 4: `[4] > 0` for δ > √2 and `[5] = δ⁴ − 3δ² + 1 < 0` for δ < φ. `⌊π/arccos(δ/2)⌋` is never an integer boundary since π/θ ∈ ℕ means admissible or δ = 0. | Pass. |
| `hδ₂` redundancy | δ ∉ set ⇒ ¬(2 ≤ δ) | Implied hypothesis. | Note only. |
| `q` convention, Conventions line 103–105 | `q = −e^(iθ)`; `q = −r`, r > 0 | `−(q + q⁻¹) = e^(iθ) + e^(−iθ) = 2cosθ`; `r + r⁻¹ ≥ 2`. | Pass. |
| 0.1 normality Check | Banach limit on `ℓ^∞(ℕ)` | Vanishes on each `1_[0,n]`, value 1 on their supremum. | Pass. |
| 0.1 GNS Check | vector state `x₁₁` on `M₂` | Null space = zero first column, dimension 2; faithful state gives 4. | Pass. |
| 0.1 bicommutant Check | upper triangular `2×2` | Commutant with `E₁₁, E₂₂, E₁₂` is `ℂ1`; double commutant `M₂`. | Pass. |
| 0.2 modular Check | `h = diag(1/5, 4/5)` | `hE₁₂h⁻¹ = (1/5)(5/4)E₁₂ = E₁₂/4`; `σ_t(E₁₂) = 4^(−it)E₁₂`; inverse convention gives 4. `kosaki` line 160 has `Δx = hxh⁻¹`. | Pass. |
| 0.3 L² Check | `τ = Tr/2` | `‖Ê₁₁‖² = 1/2`, `JÊ₁₂ = Ê₂₁`; vector state sends `E₁₁` to 1 ≠ 1/2. | Pass. |
| 0.4 covariance Check | `g = (12)`, `h = (23)` in `S₃` | Stated convention: both sides `σ_(h⁻¹g)(b)ξ ⊗ δ_h`. Wrong convention: `σ_(g⁻¹h)` vs `σ_(hg)`, `(12)(23) ≠ (23)(12)`. | Pass. |
| 0.4 group and crossed-product Checks | `S₃`; swap on `ℓ^∞(ℤ/2)` | `L(S₃) = ℂ⊕ℂ⊕M₂`, dimension 1+1+4 = 6; `ℓ^∞(ℤ/2) ⋊ ℤ/2 = M₂`; trivial action gives `ℂ² ⊗ ℂ²`, dimension 4. | Pass. |
| 0.5 dimension Checks | `M_n`, `ℂⁿ`; `S₃ ⊃ ⟨(12)⟩` | `dim(ℂⁿ_(M_n)) = 1/n` (n copies make `L²`); `[N⊗M₂ : N⊗1] = 4`; `[S₃ : ⟨(12)⟩] = 3`, trivial subgroup 6. | Pass. |
| 0.5 multiplicativity | `P ⊆ N ⊆ M`, `[M:N] < ∞` | `dim(L²(M)_P) = [N:P]·dim(L²(M)_N) = [N:P][M:N]` by Exercise 9.15 applied to the finite right N-module `L²(M)`; infinite `[N:P]` gives ∞ on both sides. | Pass. |
| 0.6 spatial derivative Check | `M = ℂ`, `ψ′ = Tr(h·)` | `θ(ξ,ξ) = ⟨h⁻¹ξ, ξ⟩` so `dφ/dψ′ = h⁻¹ = diag(5, 5/4)` (`kosaki` line 1096–1097). | Pass. |
| 0.6 index of `Tr(h·)` | `h = diag(1/5, 4/5)` | `Tr(h⁻¹) = 5 + 5/4 = 25/4`; minimum `n² = 4` at `h = 1/2`. | Pass. |
| 0.7 Checks and R02 | `x ↦ diag(x,0)`; trace 1/3 corner; `L(F₂)` | `τ(E₁₁)` becomes 1/4; `3τ` normalises `pRp`; `L(F₂)` non-amenable. The amenable ⇔ AFD bullet needs Connes's theorem (`ap` line 8304). | R02. |
| 1.1 inner product Check | `ξ = i`, `ξ′ = 1` | `⟨i, 1⟩ = −i`; first-variable linearity gives `+i`. | Pass. |
| 1.2 bounded-vector Check | `ρ = diag(1/5, 4/5)`, `ξ = ρ^(1/2)` | `R_ξ(ρ^(1/2)y) = ρ^(1/2)y`, isometric. Rejected map: `Λ_ψ(E₂₁) = (1/√5)E₂₁ ↦ ρ^(1/2)E₂₁ = (2/√5)E₂₁`, norm ratio 2. | Pass. |
| 1.2 fusion degenerate cases | `N = ℂ`; `K = 0` | Hilbert tensor product, dimensions multiply; `H ⊗_N 0 = 0`. | Pass. |
| 2.1 Checks | A; I; `R⊗1 ⊂ R⊗̄R` | `Tr(1) = [M:N] = 4`, `τ(e_N) = 1/4`; identity gives `e_N = 1`, `Tr(1) = 1`; `Tr(1) = ∞`. | Pass. |
| 2.2 basis Check | A with `b_ij = √2E_ij` | `Σ b b* = 2·Σ_ij E_ii = 4·1`. | Pass. |
| 2.2 Pimsner–Popa constant Check | `P` onto `(e₁⊗e₁+e₂⊗e₂)/√2` | `(id⊗tr)(P) = (1/2)Σ_i E_ii·(1/2) = 1/4`; `1⊗E₁₁` gives 1/2. | Pass. |
| 2.2 local index Check | D(t) at p | `[pMp:Np] = 1`; `tr_(N′)(p) = (1/t)/(1/t + 1/(1−t)) = 1−t`; `(1−t)·t·(t⁻¹+(1−t)⁻¹) = 1`. | Pass. |
| 2.2 index below 4 ⇒ irreducible (used in 3.5) | p nontrivial in `N′∩M` | `tr(p)τ(p)[M:N] ≥ 1` and `(1−tr p)(1−τ p)[M:N] ≥ 1`; Cauchy–Schwarz gives `2/√[M:N] ≤ 1`, so `[M:N] ≥ 4`. | Pass. |
| 2.3 Checks | A; `ℤ/2` outer | `M₁ = N ⊗ M₂ ⊗ M₂ ≅ N ⊗ M₄`, `τ(e₁) = 1/4`; `[M:M^G] = 2`, `M^G′ ∩ (M⋊G) = ℂ[ℤ/2] = ℂ²`; index 1 gives `e_k = 1`. | Pass. |
| 2.4 dimensions and ratios | D(t), `t ≠ 1/2`; `M^G ⊂ M` | Left dimensions `1/t, 1/(1−t)` (`dim_(pMp)(pH) = dim_M(H)/τ(p)`), right `t, 1−t`; each summand `d = √(1) = 1`, `d(X) = 2`; ratios `t⁻², (1−t)⁻²` differ. `M^G`: `d = √|G|`, dimensions `|G|` and 1. | Pass. |
| 2.5 minimal expectation Check | D(t) | `r = (t, 1−t)`, `s = (1−t, t)`, `c = 2√(t(1−t))`; `E_N(h₀) = c⁻¹(√((1−t)/t)·t + √(t/(1−t))·(1−t)) = 1`; `Ind(E₀) = (t(1−t))⁻¹·4t(1−t) = 4`; `d(X) = 2`, consistent with 2.4; Kosaki's `E₀(p_i) = √μ_i/Σ n_j√μ_j` gives `E₀(z_i) = √(r_i s_i)/c`, the same. | Pass. |
| 2.5 `Ind(E_h)` Check | A, `h = diag(2/5, 8/5)` | `tr(h) = 1`; `tr(h⁻¹) = (5/2 + 5/8)/2 = 25/16`; `4·25/16 = 25/4`; agrees with 0.6's `Tr(diag(1/5,4/5)⁻¹) = 25/4` since `tr(hx) = Tr(diag(1/5,4/5)x)`. Wrong formula gives 4. | Pass. |
| 2.6 entropy Checks | `ℂ ⊂ ℂ²`; A; D(1/3); D(1/2); identity | `η(t)+η(1−t)`; `2·(1/2)·log 4 = log 4`; `2η(1/3)+2η(2/3) = 1.273 < log 4.5 = 1.504`; `log 4 = log 4`; `η(t) − η(t) = 0`. | Pass. |
| 2.6 Corollary 4.6 window | `pp` line 1158–1159 | `4 < [M:N] < 8`, `[M:N] ≠ (1+2cos(π/n))²`, n ≥ 3: identical. A at index 4 with `N′∩M = M₂` and `H = log 4` shows the window is needed. | Pass. |
| 3.1 Checks | `i·e`; non-real δ | `(i·e)† = −i·e`; `e² = conj(δ)e` and `e² = δe` give `(δ − conj δ)e = 0`, contradicting `e_ne_zero_two`. | Pass. |
| 3.2 Jones–Wenzl Checks | δ = 1/2; δ just below √2; δ = √2; wrong coefficient | `f₂ = 1 − δ⁻¹U₁`, `f₂² = 1 − 2δ⁻¹U₁ + δ⁻²δU₁ = f₂`; `T₂(f₂) = δ² − 1 = −3/4`; `θ = arccos(1/4) = 1.318`, `⌊π/θ⌋ = ⌊2.38⌋ = 2`. `[4] = δ³ − 2δ < 0` below √2, `= 0` at √2. `(1 − δU)² = 1 − δU` iff `δ³ = δ`. | Pass. |
| 3.2 Markov uniqueness | normal form | `φ_(n+1)(ι(a)U_nι(b)) = φ_(n+1)(ι(ba)U_n) = φ_n(ba)`; base `φ_1(1) = δφ_0(1) = δ = T_1(1)`. | Pass. |
| 3.2 Hermitian form | `x ↦ conj T_n(x†)` | Tracial, strand factor conj δ = δ, Markov via `(ι(x)U_n)† = U_n ι(x†)`; by uniqueness equals `T_n`. | Pass. |
| 3.3 path models | δ = 1; δ = √2; δ = 2; relation check | `A₂`: one path per length, `Q_n = ℂ`, radical of `TL_2` spanned by `1 − e` (Gram rank 1). `A₃`: 2-step endpoints {0,2}, `dim Q₂ = 2`; 3-step both end at 1, `dim Q₃ = 4 < 5`. Half-line: `τ₂(1) = [1] + [3] = 4 = δ²`, unit weights give 2, `τ₁(1) = [2] = 2`. `([s+1]⁻¹vvᵀ)² = [s+1]⁻²([s]+[s+2])vvᵀ = δ[s+1]⁻¹vvᵀ`. `Σ_t #paths(n,t)² = catalan n`. | Pass. |
| 3.3 Markov formula | n = 1, x = 1; n = 2, x = U₁ | `τ₂(p₁) = 1` vs `δ⁻²τ₁(1) = δ⁻¹`; `τ₃(ι(U₁)p₂) = 1` vs `δ⁻²τ₂(U₁) = δ⁻¹`. | Fail: R03. |
| 3.4 Checks | A; index 1 | `τ(2e₁) = 1/2 = δ⁻²T₂(e) = 2/4`; at δ = 1, `ρ(U_i) = 1` kills `f₂ = 1 − e`. | Pass. |
| 3.5 admissible values | m = 3..6; 2.5 | `1, 2, (3+√5)/2 = 2.618, 3`; 2.5 lies strictly between 2.618 and 2; `δ² ≥ 4 ⇔ δ ≥ 2`. | Pass. |
| 4.1 tensor-leg square | `M₂⊗M₂⊗M₂` | `A₁ ∩ B₀ = M₂⊗1⊗1`, `E_(A₁)E_(B₀) = E_(M₂⊗1⊗1) ≠ τ = E_(A₀)`; horizontal parameters `1/16` (`ℂ ⊂ M₄`) and `1/4` (index 4). | Pass. |
| 4.2 compactness form | Jones–Sunder 5.7.6 shape | `R₀′ ∩ R₁ = A₁′ ∩ B₀` with `A_j^0 = A_j`, `A_j^1 = B_j`; the grid form `(A₁^0)′ ∩ A₀^r` specialises to it at r = 1. | Pass (book not readable). |
| 4.3 corner parameters | d = 9/2; d = 4; m = 5 | `3 + 3/2 = 9/2` at t = 1/3; t = 1/2 gives `N ⊂ N⊗M₂`; `4cos²(π/5) = (3+√5)/2`, graph `A₄`. | Pass. |
| 5.1–5.2 Checks | D(t); A; `ℤ/2`, `ℤ/3`; TL at `2cos(π/m)` | `tr_(N′)(p) = 1−t ≠ t = τ(p)`; A has equal traces; graphs `A₃` (norm √2), `D₄` (norm √3), `A_(m−1)` (norm `2cos(π/m)`); finite depth ⇒ extremal ⇒ D(t) has infinite depth. `‖Γ‖ ≤ d(X)`: the dimension vector is a positive eigenvector. | Pass. |
| 6.1 TL planar algebra Check | n = 2, 3 | `dim P_(2,+) = 2`, `P_(3,+) = 5`; two-click rotation has order 2 on 2-boxes and 3 on 3-boxes. | Pass. |
| 6.2 weighted Check | A with `w = diag(4, 1/4)`, `h = diag(2/5, 8/5)` | `wh = diag(8/5, 2/5)`; `w^(−1/2)E₁₂w^(1/2) = (1/2)(1/2)E₁₂ = E₁₂/4`; `L_wR_(w⁻¹)` on `E₁₂`: `4·4 = 16`, on `E₂₁`: `1/16`. | Pass. |
| 6.3 reciprocal Check | `w = diag(4, 1/4)`, `δ_sph = 2` | `tr(w^(1/2)) = (2 + 1/2)/2 = 5/4 = tr(w^(−1/2))`; `aδ_sph = 5/2`; printed `λδ_sph = (4/5)·2 = 8/5`. `burns` line 2704 computes `λ⁻¹δ_sph`. | Pass; source misprint recorded. |
| 6.4 and 8.3 index Check | same data | `a²δ_sph² = (25/16)·4 = 25/4 = Ind(E_h)`; `w = 1` gives `a = 1`. `E_N(h^(1/2)xh^(1/2)) = E_N(hx)` by traciality and `h ∈ N′`. | Pass. |
| 7.1 weight Check | `A₃`, μ = (1, √2, 1) | `√(√2/1) = 2^(1/4) ≠ √2`; rescaling μ by 3 leaves ratios; `dim G_(0,+) = 2`. | Fail: R04. |
| 7.2 tower Checks | TL at √2; `M₀ = ℂ²` | `√2·√2 = 2 = 1 + 1`; `tr_k` undefined when `dim M₀ = 2`; module `e₁` ↔ tower `e₂`, both of trace `δ⁻²`. | Pass. |
| 7.3 Check | `ℂ ⊂ M₂` | basis `√2E_ij`, `Σ bb* = 4 = δ²`. | Pass. |
| 7.4 Checks | circles; TL at δ > 2; `D₄` | δ, δ²; `A_∞` truncations `A_(n+2)` are exactly the excluded tail; `D₄` branches at depth 1. | Pass. |
| 8.1 Checks | TL at δ > 1 | `W₀′ ∩ W₁ = P_(1,+) = ℂ`, `W₀′ ∩ W₂ = TL₂`, dimension 2; degree-1 trace 0. Product degrees: contracting i of `2r, 2s` strings leaves `2(r+s−i)` points. | Pass. |
| 8.2 reverse-basis normalisation | general edge; `A₃` | `f̄₀*f̄₀ = c·id` with `c·d(Y_v) = Tr(ff*) = d(Y_w)`, so `c = μ(w)/μ(v) = √2` for `A₃`, not 2. | Fail: R04. |
| 9.3 indices | `A_n`, `D_(2n)`, `E₆`, `E₈` | `4cos²(π/(n+1))`, `A₃ → 2`; Coxeter numbers `4n−2`, 12, 30; `4cos²(π/12) = 2+√3`; `D₄ → 3`. | Pass. |
| 10.1 Checks | `L²(A)`; coarse bimodule; `Q₀` | `P_n = ℂ`, `Q_n = A′∩A = ℂ`; central vectors of `L²(A)⊗L²(A)` are Hilbert–Schmidt elements of `A′`, hence 0, while `Q₁ = JAJ ⊗̄ A`; `Q̂₀⁺ = [0,∞]`. | Pass. |
| 10.3 Checks | `γ₀ = a₁`; `u = −1`; covariance 1/2 | `a_n a₁ a_n⁻¹` reduced of length 3, distinct, same image; `u − 1 = −2` not Hilbert–Schmidt; `ω(a(ξ)a(ξ)*) = ⟨ξ,(1−S)ξ⟩ = ‖ξ‖²/2`, so `√2` is the isometry constant. | Pass. |

Totals: 56 rows, 53 pass, 3 fail (R03, R04 twice).

## Not verifiable

- Jones–Sunder, *Introduction to Subfactors* (3.5 Theorem 2.3.8; 2.1, 2.3, 4.1–4.2): the sources service found only the Cambridge landing page; not readable legally. Listed in the job's missing-references file.
- Evans–Kawahigashi, *Quantum Symmetries on Operator Algebras*, Theorems 11.22–11.24 (9.3): OUP returned 403; not readable legally. Listed in the missing-references file.
- Popa, *Classification of amenable subfactors of type II* (9.1–9.2): resolves only to a paywalled Springer page; uncertified, as the README records.
- JSW diagrams: the text layer of arXiv 0807.4146 is glyph names; the OCR text verified the statements and the product's summation range, not the pictures.

## Source issues

- **Misprint** in burns at Theorem 2.2.40, printed page 56: the statement gives the rigid modulus as λ times the spherical modulus; it should be λ⁻¹ times it, as the proof on the same page computes; affects a stated result (the roadmap already uses the proof's value).
