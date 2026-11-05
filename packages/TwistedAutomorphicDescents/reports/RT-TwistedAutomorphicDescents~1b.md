<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1535#issuecomment-6417505681 -->
Red team round 1 pass b (claude) of 8b40b31

Verdict: accepted

1. **F01** (P3) GanGrossPrasadUnitaryGroups §3.9 is cited as the nonsplit tempered theorem; it is the real one, and §3.7 is never cited

   **Location.** `packages/TwistedAutomorphicDescents/README.md:11` ("Its §3.9 supplies the nonsplit tempered theorem on distinguished members and §3.11 its specified split range"), line 85 ("The local theorem on distinguished members in §3.9 is nonsplit tempered"), line 1100 (§7.2 Needs: "GanGrossPrasadUnitaryGroups §§3.9–3.11 (proved unitary ranges)").

   **Claim.** GanGrossPrasadUnitaryGroups §3.9 proves the tempered local Gan–Gross–Prasad theorem on distinguished members at every nonsplit place, and §§3.9–3.11 are the proved unitary ranges.

   **Witness.** At the open head (#1404) `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md` has "### 3.7 The nonarchimedean tempered theorem" (line 730, standing hypothesis "F is nonarchimedean") and "### 3.9 The real tempered theorem" (line 786, standing hypothesis "E/F=ℂ/ℝ"). Its consumer note (line 1405) lists this roadmap as consuming "§§1.2, 2.6, 3.7 and 3.9". The nonarchimedean nonsplit range, the main proved case, is cited nowhere in this README.

   **Repair.** Line 11: "Its §§3.7 and 3.9 supply the nonarchimedean and real tempered theorems on distinguished members and §3.11 its specified split range; §3.10 is a proposition outside the proved range." Line 85: "The local theorem on distinguished members is nonsplit tempered: nonarchimedean in §3.7, real in §3.9; the split theorem is §3.11 in its exact stated range." Line 1100: "GanGrossPrasadUnitaryGroups §§3.7, 3.9 and 3.11 (proved unitary ranges)". Tested on the refuting instance: a nonarchimedean nonsplit place of a unitary datum now resolves to §3.7, whose hypothesis admits it; §3.9 alone rejected it.

2. **F02** (P3) §6.1 restricts the support partitions to a≥2 without a reason; the source has none, and the only excluded case is U₁⊃U₀

   **Location.** `packages/TwistedAutomorphicDescents/README.md:950` ("For a=N≥2 and a relevant parameter pair with smaller form dimension m, define `p_(phi,phi_prime)` …"); the restriction propagates to §§6.2 and 6.4 through their Needs lines (lines 982, 1029).

   **Claim.** The partitions p and p¹ and the weak-support proposition need a≥2.

   **Witness.** JZ2020 line 2907–2975 defines p_{φ,φ′} and p¹_{φ,φ′} for a=n∨=N with no lower bound. In the two orthogonal branches a≥2 is automatic (odd-SO H_W forces a=d even with d=m+2j+1≥2; even-SO H_W forces a=m+2j even, and a=0 is SO₁, excluded by a=N>j≥0 in Conventions). The only case removed is unitary a=1: G=U₁, W=0, j=0, k₀=0, p=[1,1]=p¹=p₀(2); the residue on U(1,1) is ξ∘det (§4.1, line 640), its [1,1] coefficient is restriction to U₁ and is nonzero, so Conjecture 6.8 holds there and §6.4 is the trivial statement L(1/2,φ_χ×0)=1≠0 ⇒ nonzero period. Nothing in the source or in the roadmap's own proofs uses a≥2.

   **Repair.** Line 950: replace "For a=N≥2" by "For a=N≥1"; in the Check at line 964 replace "in every other case with a≥2 the part counts differ" by "for a≥2 in every other case the part counts differ (2 or 3 against a+1 or a+2); a=1 occurs only for G=U₁, W=0, where p=p¹=[1,1]". Tested: with a=1, m=0 the unitary formulas give (1,1) and (1,1^1), both of total 2a+m=2, and p¹=p_{k₀}(2) with k₀=a−j−1=0.

3. **F03** (P3) The SO codimension-one uniqueness input of §1.4 is cited only through a secondary statement; the primary sources are absent from the manifest

   **Location.** `packages/TwistedAutomorphicDescents/README.md:349–351` (§1.4, "Orthogonal local Bessel uniqueness": "the SO theorem stated in GGP2012 Theorem 14.1(i)" and "Prove the determinant-one version through the SO codimension-one input"); `sources.toml` has no entry for either primary source; References line 1174.

   **Claim.** GGP2012 Theorem 14.1(i) is the locator for the SO(V)×SO(W) codimension-one multiplicity-one theorem used as the input of the determinant-one reduction.

   **Witness.** GGP2012 line 2287–2301 states the SO case and attributes it, in its proof, to Waldspurger (non-archimedean) and Sun–Zhu (archimedean); it proves nothing itself. The primary statements, read through the sources service: Waldspurger2012 line 44 (Théorème 1, nonarchimedean characteristic zero, irreducible admissible representations of the special orthogonal groups of W and of the complement of a nondegenerate line, Hom dimension ≤1) and SunZhu2012 line 66 (Theorem B, irreducible Casselman–Wallach representations, continuous bilinear functionals, for the groups listed at line 44, which include SO(p,q) and SO_n(C)).

   **Repair.** Add to `sources.toml` the keys `Waldspurger2012` (J.-L. Waldspurger, Une variante d'un résultat de Aizenbud, Gourevitch, Rallis et Schiffmann, Astérisque 346 (2012), 313–318, Numdam open repository, Théorème 1) and `SunZhu2012` (B. Sun, C.-B. Zhu, Multiplicity one theorems: the Archimedean case, Ann. of Math. 175 (2012), arXiv 0903.1413v2, Theorem B). In §1.4 replace "the SO theorem stated in GGP2012 Theorem 14.1(i)" by "the SO codimension-one theorem of Waldspurger2012 Théorème 1 at finite places and SunZhu2012 Theorem B at infinity, as collected in GGP2012 Theorem 14.1(i)", and add both to References. Tested: the proof route's input "SO codimension-one input" now names a theorem whose hypotheses (irreducible admissible, respectively Casselman–Wallach with continuous functionals) are the ones §1.4 states.

4. **F04** (P3) Three Needs lines omit earlier sections their statement or route uses (the accepting review's F01, unrepaired at this head)

   **Location.** `packages/TwistedAutomorphicDescents/README.md:917/928` (§5.9 text "by the output transport of §4.1"; Needs lists §4.2; §5.3; §1.1), lines 858/860 (§5.5 route "Expand every proper constant term using §1.3"; Needs lacks §1.3), lines 1098/1100 (§7.2 route "By the recovery transport of §4.1 … Multiplicity-free decomposition and outer stability"; Needs lacks §4.1, §1.4, §5.6).

   **Claim.** Every Needs line lists its statement and route inputs.

   **Witness.** The quoted sentences at lines 917, 858 and 1098 name §4.1, §1.3 and §4.1/§1.4/§5.6; the Needs lines at 928, 860 and 1100 at head 8b40b31 do not. All three are earlier sections, so no direction defect.

   **Repair.** Append "§4.1 (output transport)" to line 928, "§1.3 (tower calculation)" to line 860, and "§4.1 (recovery transport); §1.4 (multiplicity-free decomposition); §5.6 (outer stability)" to line 1100. Tested: every internal edge still points to an earlier section.

Four P3 findings, none blocking. Pass b read the whole of `packages/TwistedAutomorphicDescents/README.md` (1177 lines, 49 numbered targets and four named sub-targets) and `Suggested.lean` (72 lines, docstring only), the plan's `gaps` and `sourceIssues`, `sources.toml`, the three earlier reviews and two repair notes on the pull request, and every supplier section cited, at main or at the open heads named in the brief. No pass-a report exists on the pull request at the time of this pass: its comments are the pass-a job announcement, the claude review of 00c9576, the codex review of 4c618d9, two fix notes and the accepting claude review of 8b40b31. There is therefore nothing from pass a to confirm or refute; the one open non-blocking finding of the accepting review is re-checked as R04.

## Verified sound

Counts: 0 Lean declarations (the acceptance file has none; its 68-line docstring was read in full); 49 numbered targets and 4 named sub-targets read; 71 JZ2020 line locators and 13 secondary-source line locators opened; 31 printed/PDF page locators recomputed from the extractions' page markers; 46 Checks recomputed with values (table below); 15 supplier roadmaps and 61 cited sections resolved at main or at the named open heads; 8 pinned library declarations opened at the pins.

### Policy and form

- `git diff --stat origin/main...HEAD`: only `packages/TwistedAutomorphicDescents/` changes (README.md, Suggested.lean, design/plan.json, metadata.toml, sources.toml, three reports). Nothing outside the folder.
- README: no pull-request number, no process word (grep for `#NNN`, "PR", "pull request", "review", "repair", "round", "pass a/b", "lemma", "set_option": the only hits are the mathematical words "geometric lemma" at lines 91, 842, 887). Every target carries a locator. No computational algorithm. No machine path.
- `Suggested.lean`: one `import Mathlib`, one module docstring in the required form, the namespace `TauCetiRoadmap.TwistedAutomorphicDescents`, zero declarations, no `sorry`, no `set_option`, no `lemma`.
- `sources.toml`: eight keys, one per work; GRS2011 settled uncertified and cited by locator only; no local path.
- Merge order: TwistedAutomorphicDescents is line 315 (last) of `merge-order/ORDER.txt`; every cited supplier is earlier (ReductiveGroupsPartII 24, SmoothRepresentationsOfLocalGroups 26, AutomorphicFormsOnReductiveGroups 76, AutomorphicLFunctionsAndLocalFactors 93, AutomorphicSpectralTheory 95, EndoscopicTransferAndUnitaryTraceComparison 162, ModularityAndLanglandsExtensions 255, GanGrossPrasadUnitaryGroups 262, ClassicalGroupsPartII 272, LieHighestWeightPartII 293).

The required check, run from the fable-rt236 checkout, printed exactly:

~~~text
depcheck: 56 roadmaps, 647 edges, 0 problem(s)
~~~

No UPWARD, CYCLE or moved line. `roadmaps resolve` on the README (main 6fd1c2e, 366 open heads, index of 2026-10-26T12:52:47Z): no cross-roadmap citation and no Lean name found nowhere.

### Supplier citations resolved

| Citation in README | Resolved at | Content matches the use |
| --- | --- | --- |
| ReductiveGroups Layers 0, 3, 7, 7b | main, README lines 129, 234, 627, 732 | 7 structure theory (split parabolic double cosets), 7b parabolics and Levi intersections |
| OrthogonalSpinGroups Layers 0–2; Completed RestrictedProducts Layers 0–3; RepresentationTheory/ClassicalGroups Layer 6 | main, lines 306/383/585; 248/268/305/361; 310 | as described in Scope (ownership statements only) |
| ClassicalGroupsPartII CG.0–CG.3 | #1492, lines 237, 560, 970, 1211 | rational GSp representations and characters, as Scope says |
| ReductiveGroupsPartII RG2.4 | open head, line 5510 "decompositions and double cosets"; `δ_P(m)=|det(Ad(m)|Lie N)|_E` at its RG2.4.4 text | the local adjoint-modulus formula is there; Hermitian Witt theory is the declared gap |
| GeometryOfNumbersAndQuadraticArithmetic §2.9 | open head, line 1195 | carrier `SignedHermitianSpace` and adjoint "apply to any commutative field with involution and finite-dimensional V"; classification results have odd-residue hypotheses, not consumed |
| LieHighestWeightPartII N0/nilpotent-orbit, N2/classical-partitions | board design README lines 75, 349 | geometric orbits and classical partitions over algebraically closed fields; rational and dominance supplements are the declared gaps |
| GanGrossPrasadUnitaryGroups §§1.1–1.3, 2.1–2.6, 3.10, 3.11, 4.1–4.4, 7.1 | #1404, lines 209–343, 354–527, 806, 836, 866–969, 1300 | §1.1 has the linear-first/conjugate-first slot comparison and the split quadratic-étale comparison; §4.1's period is bilinear with `ν(h)⁻¹`, the same inverse-character convention as this README; §7.1 is the adjacent iff with endoscopy. §3.9 is real-only: R01 |
| SmoothRepresentationsOfLocalGroups SR.0.1–0.4, SR.2.1–2.3, geometric-lemma, SR.3.1–3.3, SR.4.1–4.4 | open head, lines 559–801, 1834–2123, 2093, 2488–2769, 3084–3352 | ordinary geometric lemma and Whittaker functionals present; no Casselman–Shalika or spherical Whittaker formula (grep), so `gap:spherical-whittaker-normalization` is minimal |
| AutomorphicFormsOnReductiveGroups §§2.3, 2.6, 2.7, 3.4, 3.5, 4.1–4.3 | open head, lines 363, 435, 460, 552, 569, 597, 615, 633 | §2.6 contains `archimedeanUnitaryDual` for all GL_m(ℝ), GL_m(ℂ) and `genericUnitaryClassification`; §2.7 contains `dixmierMalliavin`; §4.2 the fixed-central-character cuspidal Hilbert occurrences |
| AutomorphicLFunctionsAndLocalFactors AL.3 anchors whittaker-model, rs-global-poles, rs-global-functional-equation, rs-boundary-nonvanishing, isobaric-strong-multiplicity-one, "Poles, functional equations and the closed boundary"; AL.4 anchors l-group-local-factor, local-parameter-comparison, satake-factor-operations | open head, lines 1957, 2238, 2249, 2262, 2287, 2235; 2803, 2816 | present; the word "Asai" does not occur in that README, so both signed-Asai gaps ask for something absent |
| AutomorphicSpectralTheory §0.15, §§1.1–1.5, 2.4, 2.4a, 2.8, 2.9, 2.13, 2.14, 4.1–4.4 | open head, lines 359, 890–968, 1601, 1620, 1693, 1714, 1758, 1769, 2311–2364 | §2.8's displayed `β_v` and `N_v=β_v M_v` are quoted verbatim at README line 114 and its SO₃ Check (3/2, 2/3, 1) is reproduced; §2.8's hypotheses say "self-dual is conjugate-self-dual in the unitary case" and cover unitary groups; §2.13 states holomorphic nonzero `N` on Re s≥1/2 including nongeneric members of pure inner forms |
| EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 | open head, lines 4172, 4191, 4220 | §11.4 is for a CM extension and pure inner forms, generic parameters, as README line 120 says |
| ModularityAndLanglandsExtensions §§3.3–3.4 (self-dual-cuspidal-type), 3.8, 3.12, 3.15–3.18, 3.23–3.25, 5.4 | open head, lines 1884, 1914 (anchor 1913), 2008, 2118, 2187, 2206, 2225, 2246, 2375, 2394, 2413, 3454 | §3.18 and §3.23 are odd-orthogonal only; the README accordingly keeps the inner-form classification hypothesis explicit for other forms |

### Sources

Printed pages recomputed from page markers (JZ2020 extraction page N is printed 738+N): Prop. 2.2 p.756, Conj. 2.3 pp.756–757, (2.9) p.755, (2.12)–(2.14) pp.757–758, Lemma 2.4 and Props. 2.5–2.6 p.759, Prop. 4.1 p.768, (4.33) p.774, Prop. 4.2 p.775, Prop. 4.3 and Cor. 4.4 p.776, Thm 4.5 p.777, Cor. 4.6 p.779, (4.47) p.780, Thm 4.8 and (4.49) p.781, Prop. 5.2 p.784, Thm 5.3 p.786, (5.13) p.787, Thm 5.7 p.791, Prop. 6.2 p.793, Prop. 6.3 p.794, Prop. 6.4 p.795, Lemma 6.5 pp.797–799, Thm 6.6 p.800, (6.9) p.802, Conj. 6.7 pp.802–803, p and p¹ p.804, Conj. 6.8 p.804, Prop. 6.9 and Thm 6.10 p.805, Cor. 6.11 pp.806–807, Thm 7.1 p.807, §7.2 p.809, Prop. 7.3 and Cor. 7.4 p.810, Prop. A.1 p.811, (A.6) p.812, (A.12)–(A.14) pp.813–814. All agree with the README. GGP2012 Theorem 14.1 (line 2287) is on printed p.57, Theorem 15.1 (line 2351) on p.59, Corollary 15.3 (line 2476) on p.62; AGRS2010 Theorem 1′ (line 59) on PDF p.2; JSZ2010 Theorem A (line 24) on PDF p.1; JLXXZ2016 Theorem 1.2 (line 189) on PDF p.5 and Proposition 3.3 at line 1025; JLS2016 Theorem 11.2 (line 855) on PDF p.22; Zhang2022 Theorem 1.1 (line 87) on PDF pp.2–3 with ρ at lines 93–98 (Asai for even unitary, Asai⊗ω for odd unitary, ∧² even orthogonal, Sym² odd orthogonal).

Statements checked against the text, with the source's hypotheses: Prop. 4.1's cell set `0≤α≤β≤a, a≤ℓ+β−α≤a+r_m` (line 1224) and its exclusion of split even SO (lines 1216–1221) match §2.3's inequalities and its type-D caveat; Prop. 4.2 (line 1566) gives the target `Ind(ψ_{β−1,y_{−κ}}⊗σ^{w})` with the positive character and `J(xg)=σ^{w}(x)J(g)` (line 1583), as §2.5 says; (4.36)–(4.37) pair the coefficient with the inverse character (lines 1608, 1623), as §3.1 says; Cor. 4.4 is the (π,σ′) implication and Cor. 4.6 the (σ,π) one; Prop. 5.2's iff (lines 2003–2006) is §4.3's; Thm 5.3's hypotheses (nonzero residue, π of parameter φ_τ) are §4.6's after the dictionary; Thm 5.7's hypotheses (lines 2296–2304) impose no genericity or multiplicity one, as §4.7 says; Prop. 6.2's range `a−ℓ₀−1<κ≤a+r_m` is §5.4's "valid k>k₀"; Thm 6.6 (lines 2702–2726) is §5.8 with the nonvanishing hypothesis retained; Conj. 6.7 (a),(b) is §7.1's orbit count; §6.3's three branches of p and the two of p¹ (lines 2960–2975) are §6.1's; Conj. 6.8's existential form is §6.2's; Thm 6.10's hypotheses (L(1/2,φ×φ′)≠0 and Conj. 6.8 for (φ,(φ′)^w)) are §6.4's up to the recorded dual-label gap; Cor. 6.11's hypotheses (split SO_{2n+1}, anisotropic SO₂) are §6.5's, which adds the cuspidal-τ restriction that Prop. 6.9's citation of JLXXZ2016 needs; Thm 7.1 is "Conjectures 2.3 and 3.1 imply Conjecture 6.7" (line 3118), §7.2's two hypotheses; §7.3's case list (lines 3223–3239) is §7.4's, the README adding n≥3 for SO_{2n} because [2n−3,3]=[3,1] is regular at n=2; Prop. A.1 (line 3292) is §3.6's selected-section regularity. JSZ2010 lines 12–26: O(p,q) with p≥r, q≥r+1, n≥2r+1, class FH, continuous Hom on the completed projective tensor product, as §1.4 states. AGRS2010 line 59: unitary groups of a hermitian form over D, codimension one, so O in the orthogonal case, as §1.4 states. JLS2016 line 855: Theorem 11.2 is for Sp, metaplectic and O(W), global, as §7.4 says.

### Libraries at the pins

Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 (pinned checkout opened, not inferred): `TauCeti.RegularFormClass.wittDecomposition` (`TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean:262`, namespace `TauCeti`, `[Field K] [Invertible (2 : K)]`); `TauCeti.QuadraticMap.specialOrthogonalGroup` (`OrthogonalGroup/Basic.lean:373`, `orthogonalGroup Q ⊓ (LinearEquiv.det).ker`); `TauCeti.QuadraticMap.det_reflection` (same file, line 887, `[Module.Free R M] [Module.Finite R M]`, value `-1`); `QuadraticMap.IsometryEquiv.exists_extension` (`Witt/Extension.lean:50`, namespace `QuadraticMap`, `[FiniteDimensional K V]`, hypothesis `(Q.restrict W).Nondegenerate`, no ambient regularity, as README line 59 says); `TauCeti.equivalent_of_equivalent_prod` (`Witt/Cancellation.lean:196`, `[FiniteDimensional K V₀]`, `Q₀.Nondegenerate`); `Nat.Partition` (`Mathlib/Combinatorics/Enumerative/Partition/Basic.lean:52`); `Representation.IntertwiningMap` (`Mathlib/RepresentationTheory/Intertwining.lean:36`); `MeromorphicOn` (`Mathlib/Analysis/Meromorphic/Basic.lean:494`). The README's statements of their hypotheses (lines 53–59) are exact. No `#check` inventory was needed: the acceptance file declares nothing.

### Headlines, statability, padding

The 23 headlines of the docstring are the README's end theorems (§§1.3, 1.4×2, 3.4–3.6, 4.3, 4.5–4.7, 5.2, 5.4–5.8, 6.3–6.5, 7.2–7.5). Each needs cuspidal automorphic realizations on SO(V)(𝔸) or U(V)(𝔸), rational Bessel coefficient maps, smooth admissible or Casselman–Wallach local categories, Eisenstein families on classical groups, Arthur packets or GL tensor L-functions. At the pins Tau Ceti has none of these (its automorphic material is classical modular forms; "Eisenstein" occurs only for Eisenstein polynomials; no locally profinite smooth representation category), and Mathlib's `Representation`, `IntertwiningMap` and `MeromorphicOn` carry no admissibility, topology or Eisenstein structure. Quadratic-form facts of Layer 0 (§§0.4–0.5) and the coarse double-coset layer of §2.3 are statable but are lemma-level targets, not headlines; the docstring says so for §2.3. No statable headline is absent; no padding (nothing declared).

### Declared gaps

All sixteen slugs are in the plan's `gaps` and in the README with the same supplier and section. Minimality spot-checked against the suppliers: SR has no spherical Whittaker or Casselman–Shalika formula; AL has no Asai factor at all; GNQA §2.9 has field Hermitian carriers but no Witt extension with prescribed complements; AST §2.8 is stated for σ in a generic local packet, so the noncuspidal smaller datum is missing; GanGrossPrasadUnitaryGroups §4.1 proves convergence of periods of two cusp forms, not against a moderate-growth form. Observation for the intake, not a finding: GanGrossPrasadUnitaryGroups declares `gap:hermitian-unitary` to ReductiveGroupsPartII (its line 75) for complement decompositions of Hermitian forms over quadratic étale algebras, overlapping `gap:hermitian-witt-complements`; the two requests to the same supplier should be reconciled when announced.

### Ownership

`roadmaps grep` over main and 366 open heads for "Bessel", "twisted descent|automorphic descent", "Jiang.Zhang", "Generic Summand", "first occurrence": Bessel periods and models only in GanGrossPrasadUnitaryGroups (cited); "first occurrence" in MetaplecticAutomorphicForms §3.10 is theta-tower first occurrence, a different object; AutomorphicSpectralTheory's "Bessel" hits are the special functions J_ν, I_ν of its §0.25; "Jiang–Zhang" occurs only in the cited suppliers (AST §2.13, AF, ML §3.25). No other roadmap states the twisted descent, the residue-to-period comparison, the orthogonal relevant pair or the orthogonal local uniqueness target. Ownership against open pull requests outside the brief's index was not checked.

### Computed adversarial pass

t=s−1/2, T=q^{−s−1/2}. Every row has the values computed on both sides.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Conventions, Hermitian slots | h(1,1)=1 line; e,f hyperbolic | h(i,1)=i, h(1,i)=−i; conjugate-first reuse −i; h(e±f,e±f)=±2 | holds |
| Conventions, periods on U₁ | volume 1, χ²≠1 | Q(χ,χ)=1, P(χ,χ)=0, P(χ,χ∨)=1; second vector ×i: P×i, Q×(−i) | holds |
| Conventions, split base change | β(ϖ)=i; x/c(x)=(x₁/x₂,x₂/x₁) | (β,β⁻¹)=(i,−i); β⁻¹: (−i,i)=c(i,−i) | holds |
| Conventions, Levi determinant | diag(t,c(t)⁻¹) on U(1,1) | det=t/c(t); on U₁ det=u | holds |
| Conventions, modulus, L-value | GL₂, |a|=4; q=2, s=1, eigenvalues ±1 | δ_B^{1/2}=2; (1−T)(1+T)=3/4, L=4/3 | holds |
| Conventions, C₃ sum | ψ(1)=ζ, f=(1,i) | 1+iζ⁻¹ ↦ 1−iζ | holds |
| Conventions, critical arithmetic | d=5,m=2,j=1,a=4; a=1,j=2 | k₀=2, 8+2−4−1=5; truncated k₀=0 gives m+1≠m+5 | holds |
| §0.1 datum existence | (d,r)=(4,2),(5,2),(3,0) | valid ℓ: {0,1},{0,1,2},{0}; q(e₂+e₋₂,e₂+e₋₂)=2·1=2 | holds |
| §0.1 transfers, index | SO₅, U₅; nonsplit SO₄ | N=4, 5; r=1 | holds |
| §0.2 partition | (5,1),(3,0),(4,2) | [3,1,1] sum 5 length 3; [1³], dim SO₂=1, dim U₂=4; part 5>4 | holds |
| §0.3 twisted trace | x=δ, x=1 with c(δ)=−δ | Tr(1)/2=1; Tr(1/δ)/2=0; ψ_E(δ)=ψ_F(1)=1 | holds |
| §0.3 signatures | q=2xy, (1,±1/2) | values ±1; perpendiculars (1,∓1/2) have values ∓1 | holds |
| §0.4 normal form | κ=2; B(e+κf/2, e−κf/2) | q=2, −2; pairing −κ/2+κ/2=0 | holds |
| §0.4 sign | source (2.14) line 844 | e_r+(−1)^{n+1}(κ/2)e_{−r}, n=dim V=d | matches |
| §0.5 Witt index | ℝ, V_an=⟨1⟩, κ=±1 | ⟨−1⟩⊥⟨1⟩ index 1=r−ℓ (V_an represents q(y_κ)=1); ⟨1,1⟩ index 0 | holds; source Prop. 2.5 has y_{−κ} (Source issues) |
| §0.5 unitary centre | scalar −1 | fixes ψ (z↦z, y↦−y·(−1)); e↦−e | holds |
| §0.6 ambient datum | d=5,m=2,j=1,a=4; a=j+1 | ambient 10, k=2, stabilizer 5; k=0, ambient d+1 | holds |
| §1.2 index | support {0,2}; r=0,d>0; split d=4 | ℓ₀=2; 0; ℓ=2 invalid since 5>4 | holds |
| §1.3 torus | split SO₂ | no proper parabolic; ∫₁^∞dt/t=∞ | holds |
| §1.4 local trivial case | V=k, W=0 | SO₁×SO₀ trivial, Hom=ℂ, dim 1 | holds |
| §1.4 JSZ range | j=1, (p,q)=(1,2),(1,1) | n=3≥3, p≥1, q≥2 admitted; dim 2<3 excluded | holds |
| §1.4 sign exclusion | ψ_B(n)=−1, trivial action | b=−b ⇒ b=0 over ℂ | holds |
| §1.4 σ⊕σ | two projections | two independent maps vs dim ≤1 | holds |
| §2.3 cells | a=1,r_W=0,ℓ=0; ℓ=1 | {(0,1)}; {(0,0),(1,1)} | holds (source line 1224) |
| §2.4 surviving cell | same | β=max(a−ℓ,0)=1,0; (1,1) killed; C₂ integral (1−1)/2=0 | holds |
| §2.5 character | ψ(n)=i | ψψ⁻¹=1; ψ⁻² = −1 | holds (source line 1566) |
| §2.6 indices | (a,ℓ)=(3,2),(2,2) | β−1=0; ℓ−a=0 | holds |
| §3.3 ρ sign | m=1,2 | Asai⁻, Asai⁺; parity: τ_i⊠ν₂ in a U_{2a+m} parameter forces sign(τ_i)=(−1)^m | holds (Zhang2022 line 93–98) |
| §3.3 numerator twist | split U(1,1), q=2, s=1/2, η(ϖ)=i | (1−T)⁻²/(1−T²)⁻¹=4/(4/3)=3; twisted weights i(−i)=1, (−i)(i)=1 → 3; dual reading −1,−1 → (4/9)/(4/3)=1/3 | holds |
| §3.3 Asai invariance | η′=η∘(x/c(x)) | η′|_{𝔸_F^×}=1 ⇒ As(τη′)=As(τ) | holds |
| §3.3/§4.1 cross roots | GL₃ torus (χ₁,μ,χ₂⁻¹) | roots χ₁μ⁻¹, μχ₂ (=τ×(μ,μ⁻¹)∨), χ₁χ₂; (2,3,5) → 2/5, 15 vs 10, 3/5 | holds |
| §3.4 spherical | split U(1,1)⊃U₁, X=χ₁βT, Y=χ₂β⁻¹T | Σ_{n≥0}X^n+Σ_{n≥1}Y^n=(1−XY)/((1−X)(1−Y)); split tensor is componentwise (χ₁β,χ₂β⁻¹), split Asai is χ₁χ₂; q=3 trivial: (8/9)/(4/9)=2; dual twisted (9/16)/(9/8)=1/2 | holds |
| §3.5 exponents | α=1/3, β=1/4; 1/2 | 5/12, 11/12, 4/3; boundary 0 | holds |
| §3.6 matrices | p, u, J, w of line 622 | det p=det u=1; pᵀJp=uᵀJu=J; pu·w=w (exact rational arithmetic) | holds |
| §3.6 block identity | p as (A.12), n̄ as (A.13), w=(E₁,0,E₂) | p n̄ w=w gives ι(Ẑ)E₂=(I−g)E₁+Y h⁻¹X′E₁=(I−g)E₁+YY′E₂; instance −1/2=1/2−1; source's (A.14) lacks YY′E₂ | holds; source error |
| §4.1 U(1,1) example | τ=φ_ξ, ξ(ϖ_w)=i | residue ξ∘det (Ind quotient at δ_B^{1/2}=|t|_E^{1/2}); descent ξ; ∫ξπ′≠0 iff π′=ξ⁻¹; (i,−i)=τ_w for ξ, (−i,i) for ξ⁻¹ | holds |
| §4.1 self-pair order | τ=⊞τ_i distinct, φ_{π′} isobaric of dim a | poles of L(1,τ_i×π′_k) iff π′_k≅τ_i∨; order r iff τ∨⊆φ_{π′} iff τ≅φ_{π′}∨ | holds |
| §4.1 recovery transport | f∈C_π, g∈C_σ | conj Q_ψ(f,g)=P_{ψ⁻¹}(conj f,g) | holds |
| §4.2–4.5 Laurent | A/t²+B/t+C; 6t⁻²+3t⁻¹ over 2t⁻²; Z=1/t over 2/t | A; 3+(3/2)t, value 3; 1/2 | holds |
| §4.6 product | c=2, Z_S*(1/2)=3, lead 5 | 30; any zero factor kills it | holds |
| §4.7 duality | conjugate-self-dual χ, μ | L(1/2,χ∨μ∨)=L(1/2,c(χμ))=L(1/2,χμ); χμ∨=χ·c(μ)≠χμ unless μ²=1 | holds |
| §5.1 parameter | a=6, H_W=SO₃ | form 15; standard 12+2=14 | holds |
| §5.2 exponents | λ=−1/2, 0 | ∫₁^∞t^{2λ}dt/t=1; ∞ | holds |
| §5.3 critical index | (d,m,j,a)=(6,1,2,6) | k₀=3, [7,1⁶] total 13; 2k₀+1=a+m (odd-SO H_W), a+m−1 (even-SO H_W) | holds |
| §5.7 index and weights | d=a=6, W split dim 1; μ=(2,3); a=4, m=1 | k₀=a/2+r_W=3 (k₀=2 gives 8); 1−5T+6T²; output U₄ not U₅ | holds; source misprints (Source issues) |
| §6.1 partitions | (a,m)=(4,2),(6,1),(2,1),(1,0) | [5,5]/[5,1⁵]; [7,5,1]/[7,1⁶]; [3,1,1]=[3,1,1]; [1,1]=[1,1] | holds; a=1 is R02 |
| §6.3 ranks | n=1, anisotropic SO₂ | ambient (4,2), total 6; a=2, j=0, k₀=1, [3,1³]; isobaric n≥2 blocks: [2n+1,1^{2n+1}] total 4n+2 | holds |
| §6.4 label transport | (φ,φ′)↦(φ∨,φ′) | L(1/2,φ∨×φ′∨)=L(1/2,φ×φ′); π₀ of parameter φ∨, π=π₀∨ of parameter φ | holds |
| §7.3 partitions | U₄, SO₄, U₂, SO₅ | [4] ranks (3,2,1,0), [3,1] ranks (2,1,0,0); ambient 2·4+1=9; [3,1] regular for SO₄; U₂: ℓ=0; SO₅: N=4 | holds |
| §7.4 case list | SO₆, SO₃, U₅ | [3,3]→[3,1³] stabilizer 3; [1³], smaller 2; [4,1]≠[3,1,1] | holds (source lines 3223–3239) |
| §7.5 dominance | SO₈, U₅; general | (5,8)≥(4,8); (4,5)≥(3,5); any orthogonal partition of 2n+1 other than [2n+1] has ≥3 parts, so its first two prefix sums are ≤2n−1, ≤2n | holds |

### Previous reviews, checked at this head

Round-1 F01–F13 and round-2 F01–F05 were each located in the repaired text at 8b40b31 and found applied (the unitary dictionary with numerator τ×φ_π and cross factor τ×φ_σ∨, the acyclic 0.1→0.2→0.3 and 2.3→2.4→2.5→2.6 chains, the a=2 coincidence Check, the U₄ subregular wording, the Corollary 4.4 page, the sixteen owned gaps, the separate orthogonal local uniqueness target, the distinct-isobaric proposition, RG2.4 cited only for the modulus, ReductiveGroups Layer 7 for the split double cosets). The accepting review's single non-blocking F01 is not yet applied: R04.

## Not verifiable

- GRS2011 (Theorems 5.1, 5.4, 5.6, 7.3): settled uncertified in the manifest; read only through JZ2020 lines 713, 2399, 2412, 2439, 2560. Not requested.
- JZ2020 reference [43] (unramified computation in the stated generality) and [62, Th. B] (Mœglin's irreducibility): the source defers to them (lines 1865–1866, 2949); not in the manifest.
- The overline on the conjugated argument of JZ2020 (4.8) is lost in the text extraction; the dictionary of §4.1 was checked by computing both pairings directly, not from the printed bar.
- Ownership against open pull requests outside the brief's index (366 heads) was not checked.

## Source issues

- **Error** in JZ2020 at Proposition 2.5, printed p.759 (line 859): the source tests whether the anisotropic kernel represents y_{−κ}; it should test y_κ, since V_an⊥⟨y_{−κ}⟩ is isotropic iff V_an represents q(y_κ) (real ⟨1⟩, κ=1); affects a stated result.
- **Error** in JZ2020 at (2.13), printed p.758 (lines 815–828): the source calls the displayed flag-fixing subgroup the identity component of the character stabilizer; for unitary groups that component also contains the norm-one torus acting on the flag and on Ew₀; affects nothing (the displayed group is the one used).
- **Misprint** in JZ2020 at Lemma 6.5, printed p.798 (line 2619): the source evaluates the split odd-orthogonal branch at κ=a/2+r_m−1; the dimension equation 2a+m−2κ−1=a forces κ=a/2+r_m; affects the proof.
- **Misprint** in JZ2020 at Lemma 6.5, printed p.798 (lines 2630–2631): the source labels the odd-unitary output U_{a+1}; with a even it is U_a; affects the proof.
- **Misprint** in JZ2020 at (6.6), printed p.799 (line 2687): the source's character list stops at μ_{[a/2]−1}; it should run to μ_{[a/2]} to match the degree of τ_ν; affects the proof.
- **Misprint** in JZ2020 at Proposition 6.4 proof, printed p.796 (line 2521): the source says ε stabilizes w₀; ε negates both coordinates of w₀, so ε w₀=−w₀ while ψ_{κ,w₀} is preserved; affects the proof.
- **Error** in JZ2020 at (A.14), printed p.814 (line 3421): the source's first equation is ZE₂=(I−g)E₁; block multiplication of (A.12)–(A.13) against Ad(η)w₀ gives ι(Ẑ)E₂=(I−g)E₁+YY′E₂; affects the proof.
- **Gap** in JZ2020 at §5.5, printed p.791 (lines 2292–2293): the source passes from L(1/2,τ×σ∨)≠0 to L(1/2,τ×σ)≠0; for conjugate-self-dual unitary data these are different functions; affects a stated result.
- **Gap** in JZ2020 at Proposition 6.9, printed p.805 (lines 2982–2987): the source cites the anisotropic SO₂ result of [40] for isobaric τ while that theorem assumes τ cuspidal (JLXXZ2016 line 189); affects a stated result.
- **Error** in JZ2020 at §7.2, printed p.809 (lines 3197–3205): the source treats the regular case with no smaller datum for every quasi-split type; for U_{2n} the regular partition [2n] is not a Bessel partition and the maximal one [2n−1,1] has stabilizer U₁; affects a stated result.
- **Gap** in JZ2020 at Theorem 4.8, printed pp.780–781 (lines 1865–1866): the source defers the unramified computation in its generality to joint work described as forthcoming; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "8b40b31", "job": "RT-TwistedAutomorphicDescents~1b", "model": "fable", "worker": "fable-rt236"} -->
