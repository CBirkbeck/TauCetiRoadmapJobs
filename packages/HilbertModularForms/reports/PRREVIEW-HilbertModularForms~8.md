# Review of HilbertModularForms (pull request #1724 at eda7e59)

**Verdict:** needs changes

Incremental re-review of 99 changed lines since 73285f0. The six previous findings are repaired and the gate passes; the rewritten §10.2 leaves the quaternionic weight half specified (R01).

## R01 (P2) — §10.2 fixes `n` but not `s`, the places or the determinant convention of the quaternionic weight

**Location:** `TauCetiRoadmap/HilbertModularForms/README.md:2291`–`2294`: "the space `M_{n,s}(𝒪̂_B^×; ℂ)` … (… R17.3.8c, with R17.3.8a's coefficient module at `n_w = k_w − 2` and its determinant normalization; in parallel weight `2`, where `n = s = 0`, …)"; `:2329` uses "the weight of 10.2" for `B_k(𝔭)`.

**Claim:** Outside parallel weight 2 the space is not determined, and for the reading `s = 0` the dictionary is false. R17.3.8c indexes `(n,s)` by pairs (finite place `v ∈ T`, embedding `F_v → K`), not by real places; `s` is never given; R17.3.8a has two determinant conventions (algebraic and normalized), which differ at `v ∈ T` by `ν_alg(ϖ_v)`.

**Witness:** `F=ℚ(√5)`, `k=(2,4)`, `n=(0,2)`, `u=(3+√5)/2 ∈ F^×∩U`. By R17.3.8a (Global units) `u` acts by `∏σ(u)^{n_σ+2s_σ}`: `s=0` gives `0.1459 ≠ 1`, so `M_{n,0}=0`; `s=(1,0)` gives `N(u)²=1`.

**Repair:** Replace the parenthesis at `:2292`–`2294` by: "(GL₂ automorphic representations and transfer R17.3.8c at `K = ℂ`: fix a rational prime `p` and an isomorphism `ℚ̄_p ≅ ℂ`, let `T` be the places above `p`, and attach to each real place `w` the pair `(v, σ)`, `σ : F_v → ℂ`, through which `σ_w` factors; the weight is `n_w = k_w − 2`, `s_w = m_w = (k₀ − k_w)/2`, with R17.3.8a's algebraic, not normalized, determinant convention; in parallel weight `2`, where `n = s = 0` and no `T` is needed, the functions on the class set `Cl(𝒪̂_B^×)` of R17.3.8b)", and add one Check to §10.2: "For `F = ℚ(√5)` and `k = (2,4)`: `n = (0,2)`, `s = (1,0)`, `n + 2s = (2,2)`, and the unit `(3+√5)/2` acts on the coefficients by `N(u)² = 1`; with `s = 0` it acts by `((3−√5)/2)² ≠ 1` and the space of forms is zero." Tested: for `m ≫ 0` prime to `p`, R17.3.8d's `S_𝔪` is `∏_σ σ(m)^{n_σ+2s_σ} = N(m)^{k₀−2}`, the value of `README.md:1343`; `T_v² ∼ q_v S_v` then gives `|T_v| ∼ q_v^{(k₀−1)/2}`, the size of `c(𝔭, f)`; at parallel weight 2 the text is unchanged; in the witness the unit acts by 1.

## Previous findings

- R01 — repaired: `README.md:159`–`167`, `:194`–`197`, `:2290`–`2296`, `:2325`–`2334`, `:2358`–`2359` cite GL2AutomorphicRepresentationsAndTransfer R17.3.8a–R17.3.8d and HilbertModularVarietiesAndShimuraCurves §§R18.5.16a, R18.5.16c; no citation of QuaternionicModularForms remains; gate `dropped=0`. The repair's new problem is R01 above.
- R02 — repaired: `Suggested.lean:386`–`393`, `coeff` is `∑ᶠ v ∈ {v | ∃ c μ, … ∧ v = fourierCoeff … * ∏ …}, v`; no `choose`, no `Classical`; gate `statement-hygiene=0`.
- R03 — repaired: `README.md:1193`–`1196`, "Dasgupta–Kakde take these from Shimura 1978, §3: the Eisenstein series from its Proposition 3.4, the congruence-restricted sums from its series (3.1), and their constant terms at s=0 from its equation (3.7)"; the reference entry names §3.
- R04 — repaired: the description reads "12 layers and 56 milestones"; the head has 56 numbered sections in 12 layers.
- R05 — repaired: the summary reads "The parallel-weight forms, their slash, expansions and Hecke operators come from NoncommutativeAndEquivariantIwasawa".
- R06 — repaired: the description reads "Fourier expansions of the component 𝔟 over 𝔟𝔡⁻¹ (the trace dual of its translation lattice 𝔟⁻¹)".

## Verified sound

| Statement | Instances tried | Values computed on each side; result | Change |
| --- | --- | --- | --- |
| §10.2 quaternionic weight `(n,s)` | `ℚ(√5)`, `k=(2,4)`, unit `(3+√5)/2`; `S_(m)`, `m ≫ 0`; parallel weight 2 | `s=0`: unit acts by `0.1459`, space zero. `s=m=(1,0)`: `N(u)²=1`; `S_(m)=N(m)^{n+2s}=N(m)²=N(m)^{k₀−2}`. Weight 2: `n=s=0`. | R01 |
| §10.3 `B(𝔭)` against the neighbour matrix `B(v)` of §R18.5.16c | Diagonal entries; `𝔭` principal; `ℚ(√10)`, `𝔭₂` (supplier's Check) | Neighbour matrix is `[Uη_v⁻¹U]=S_v⁻¹T_v` (supplier item 2), so `T_v` composed with `s_v`. Diagonal entry nonzero needs `nrd(γ)` generating `𝔭^{±1}`; `𝔭=(a)` gives `ϖ_v ∈ aU`, `s_v=1`. `𝔭₂`: both diagonals zero. Traces equal. | None |
| §10.3 trace subtraction with `T_v` of R17.3.8d | Norm 4 and norm 13 Checks | `0−(5−5)=0`; `36−(14+14)=8=4+4`; row sums `N𝔭+1` for `T_v` and `S_v⁻¹T_v`. | None |
| `coeff` (§2.4), finsum body | `ℚ(√5)`, `𝔪=𝒪_F` and `𝔪=(2)`; `ℚ(√3)`, `𝔪=𝒪_F`; no generator | `μ=(5+√5)/10`, norm `1/5`; `μ=(5+√5)/5`, norm `4/5=N𝔪/5`. `ℚ(√3)`: `N(1/(2√3))=−1/12`, trivial class fails, `(√3)𝔡⁻¹=(1/2)` works: one class. Value set a singleton by `N(ε)^{k₀−1}=1`; empty set gives 0. | None |
| §4.2 attribution to Shimura 1978, §3 | Three locators in dasgupta-kakde | Line 721–722: Eisenstein series from its reference [10], Prop. 3.4. Line 795: series of [10], (3.1). Line 798: constant term at `s=0` by [10], (3.7). Line 1280: [10] is Shimura 1978. | None |
| Description counts and suppliers | Head eda7e59 | Layers 12; numbered sections 56; Lean declarations 49, 11 sorried theorems; Layer 10 suppliers in the description equal those of `README.md:159`–`167`. | None |

The rows for every other statement stand as in the previous review, of `73285f0`.

- Gate at eda7e59, run again with the merge-order candidate: OK, every check 0 (`statement-hygiene=0`, `dropped=0`, `depcheck=0`, `outside-folder=0`, `stray-files=0`). `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD or CYCLE line. HilbertModularForms is line 186; GL2AutomorphicRepresentationsAndTransfer 103, HilbertModularVarietiesAndShimuraCurves 165, PadicFamilies 176.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with eleven `declaration uses sorry` warnings and nothing else. No theorem changed, so the one-tactic probe was not repeated.
- Cross-roadmap citations resolved at open heads: 9 (GL2AutomorphicRepresentationsAndTransfer R17.3.8a, R17.3.8b, R17.3.8c, R17.3.8d, R17.3.9; HilbertModularVarietiesAndShimuraCurves §§R18.5.16a, R18.5.16c; PadicFamilies Layer 5, §§5.8 and 5.10; OverconvergentAutomorphicForms, title and scope). The relinked `Completed/GlobalNumberFields` and `Completed/Chebotarev` READMEs exist at the head.
- Source locators checked against the text: 4 (dasgupta-kakde lines 721–722, 795, 798, 1280). No seeded target falls in a changed passage.
- Remark: `README.md:222` names OverconvergentAutomorphicForms, which is later in the merge order (line 257), as the owner of an excluded subject under *Not owned here*; nothing is consumed from it and the dependency check reports no edge.
- Overlap check: read BianchiModularForms, HilbertModularSurfaces, SiegelModularForms, MaassForms, HalfIntegralWeightModularForms, ModularForms, LFunctions, GlobalNumberFields, and QuaternionArithmetic for the changed objects; the groups `Γ₀(𝔫)_𝔟`, cusps and form spaces are owned here (HilbertModularSurfaces cites §§0.1, 0.3–0.4, Layer 1); the neighbour Brandt matrices are owned by HilbertModularVarietiesAndShimuraCurves §R18.5.16c and the quaternionic forms by GL2AutomorphicRepresentationsAndTransfer R17.3.8a–R17.3.8d, both cited, not restated.

Source independence: 3 passages compared with 1 source (changed passages only: `README.md:1193`–`1196`, the Shimura 1978 reference entry, the `coeff` docstring, against dasgupta-kakde lines 218, 721–722, 795–798), none shared; the arrangement was not compared again, no layer being added, removed or reordered.

## Not verifiable

- Shimura 1978, §3, Proposition 3.4, series (3.1) and equation (3.7): behind the publisher's paywall; the README cites them as Dasgupta–Kakde do, which dasgupta-kakde lines 721–722, 795 and 798 confirm.
- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" (description): a statement about other pull requests.
- The previous reports' list of texts that could not be read (Freitag, Miyake, Doi–Naganuma, van der Geer, Garrett, Diamond–Shurman, Atkin–Li, Shimura 1971, Iwaniec–Kowalski, four LMFDB knowls) is unchanged.

## Source issues

- none

## For the human reviewers

- **Scope.** The README no longer cites QuaternionicModularForms and the description's `depends-on` block no longer lists it; the generated `merge-order` block (#934) and the merge-order candidate (line 62) still place it before this roadmap.
